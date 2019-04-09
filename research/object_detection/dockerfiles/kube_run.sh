
#!/usr/bin/env bash

# sync files
# rsync -avz slim jonghoon.seo@nas0.prem.forg.skelterlabs.com:/nas0/home/jonghoon.seo/object_detection
# rsync -avz pycocotools jonghoon.seo@nas0.prem.forg.skelterlabs.com:/nas0/home/jonghoon.seo/object_detection
rsync -avz object_detection jonghoon.seo@nas0.prem.forg.skelterlabs.com:/nas0/home/jonghoon.seo/object_detection \
--exclude='object_detection/protos' \
--exclude='object_detection/utils/__pycache__' \
--exclude='object_detection/predictors/heads/__pycache__/' \
--exclude='object_detection/models/__pycache__/'

# execute kubernetes job
BASEDIR=$(dirname "$0")
echo "$BASEDIR"
kubectl create -f $BASEDIR/kube-setting.yaml