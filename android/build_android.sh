#!/bin/bash
export ANDROID_SDK_ROOT=~/Android/Sdk
export ANDROID_NDK_HOME=~/Android/Sdk/ndk/19.2.5345600
build_type=$1
echo "build_type: $build_type"
if [ $build_type = "release" ];then
    echo "release build"
    ./gradlew assembleRelease
elif [ $build_type = "debug" ];then
    echo "debug build"
    ./gradlew assembleDebug
elif [ $build_type = "clean" ];then
    echo "clean build"
    rm -fr libpag/.externalNativeBuild
   ./gradlew clean
elif [ $build_type = "publish" ];then
   rm -fr libpag/.externalNativeBuild
   ./gradlew clean
   ./gradlew uploadArchives
else
   echo "only[release,debug,clean,publish] supported"
fi
