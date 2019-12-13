#!/bin/bash

file = "/tmp/flatfile.properties"

PROP_VALUE_PLATFORM=$(cat file | grep $PROP_VALUE_PLATFORM | cut -d'=' -f2)
PROP_VALUE_SUBSCRIPTION=$(cat file | grep $PROP_VALUE_SUBSCRIPTION | cut -d'=' -f2)
PROP_VALUE_RG=$(cat file | grep $PROP_VALUE_RG | cut -d'=' -f2)
PROP_VALUE_CLOUD_EXT_ST_ACC=$(cat file | grep $PROP_VALUE_CLOUD_EXT_ST_ACC | cut -d'=' -f2)

echo PROP_VALUE_PLATFORM: $PROP_VALUE_PLATFORM
echo PROP_VALUE_CLOUD_EXT_ST_ACC: $PROP_VALUE_CLOUD_EXT_ST_ACC

if [ "$PROP_VALUE_PLATFORM" = "Windows" ]; then
    echo "Generate JSON for Windows Environment"
    subscValue_Current=cat test.txt |grep -i subscription |awk -F: '{print $2 }'
    echo subscValue_Current: $subscValue_Current
    echo subscValue_Future: $PROP_VALUE_SUBSCRIPTION 
    sed -i -e “s/$subscValue_Current/ “$PROP_VALUE_SUBSCRIPTION”/” test.txt
elif [ "$PROP_VALUE_PLATFORM" = "Linux" ]; then
    echo "Generate JSON for Linux Environment"   
fi;