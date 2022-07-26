Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD4581A16
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 21:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375681.608164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGPty-0002NE-R7; Tue, 26 Jul 2022 19:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375681.608164; Tue, 26 Jul 2022 19:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGPty-0002KG-Nh; Tue, 26 Jul 2022 19:07:30 +0000
Received: by outflank-mailman (input) for mailman id 375681;
 Tue, 26 Jul 2022 19:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSNJ=X7=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGPtx-0001mA-94
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 19:07:29 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 313f4ee2-0d16-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 21:07:28 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id j22so27863737ejs.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jul 2022 12:07:28 -0700 (PDT)
Received: from uni.router.wind (adsl-45.176.58.224.tellas.gr. [176.58.224.45])
 by smtp.googlemail.com with ESMTPSA id
 eg47-20020a05640228af00b0043bbcd94ee4sm8952306edb.51.2022.07.26.12.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:07:27 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 313f4ee2-0d16-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ux4cJFi9/ACsXCBrKM47orXeCmFYl/0tvZHbq+8ADQ=;
        b=IedBqstLflJ+RQBTnGH7SS0+bEthSnRN8uPfkib0G8d0HJVrB9zMg1teW6YSd51fol
         S9AJBxJ8DytETO93EjR2zrtnNzPw47vwXRz1HK6/St/PRg1ilJ9lcLgU1gU5CLzbsg1I
         00qQUT6NsnhXO2rEtbzqQ77FIBdcBL3kR+o+bIIaAjsofGbZmy5FYkx+BdftUOx/t6dH
         MHjtds6cmu1UJPG1pVQA1A1x4OJoDO6l7moiLdbEx+4KNvwmw3jHj2xes2Mfsas5V+lI
         1xKdnNHHgbt5oKPqsVrxo+3exPy4vU/jROq4dxzNCqVf7Kf9unrMrVhYu8n+uUBfnZw/
         Aisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ux4cJFi9/ACsXCBrKM47orXeCmFYl/0tvZHbq+8ADQ=;
        b=cCm3SPxnRbo1wIWscF0Ysq7YdXgODBnB43WDNFab9ogoEbBkMXYtw0IVzrrXQ/13qY
         BTHK864/xEofttn2IPdzCZsr3EYmq9OmoRinASNMsD8mDQX2Re0X0lsHRppih8Q/iX5x
         CKhsK+rhdthLpg/uBh/f5E8vGEZYn1dcWg9ItXcSEjAmbiHvfl31WyfPVLIMOzx7WON2
         2FjDPeoONl5s+U/zNrVUjckOegfKlBuXcg/MtaGcUYALKaWL/HnNqnzVjbuT22y4m+mE
         CYr11jY0V3UwnKjllqD8SQAj6coATYvIypXuH4Bj5Uu2U61SLJJufgU9ibSnOfus9Q6+
         CVag==
X-Gm-Message-State: AJIora9MFjZW0ycGqYJHsLo6xPjM9DLVsrHFLZEERhE7lou45cazYGxi
	W0myrNyYplAnLsabFwtc2Fel4xeEkVA=
X-Google-Smtp-Source: AGRyM1t+ZAeZOtA8CtOkuowGI2el9zO/c1e4I/zzw2Zkg9z/Y/aBLp0VmCs06DxE1ilwnwGznEhSag==
X-Received: by 2002:a17:906:5a68:b0:72b:3e88:fec1 with SMTP id my40-20020a1709065a6800b0072b3e88fec1mr15092081ejc.741.1658862447975;
        Tue, 26 Jul 2022 12:07:27 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] automation: arm64: Create a test job for testing static allocation on qemu
Date: Tue, 26 Jul 2022 22:07:01 +0300
Message-Id: <20220726190701.1048824-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726190701.1048824-1-burzalodowa@gmail.com>
References: <20220726190701.1048824-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_STATIC_MEMORY in the existing arm64 build.

Create a new test job, called qemu-smoke-arm64-gcc-staticmem.

Adjust qemu-smoke-arm64.sh script to accomodate the static memory test as a
new test variant. The test variant is determined based on the first argument
passed to the script. For testing static memory, the argument is 'static-mem'.

The test configures DOM1 with a static memory region and adds a check in the
init script.
The check consists in comparing the contents of the /proc/device-tree
memory entry with the static memory range with which DOM1 was configured.
If the memory layout is correct, a message gets printed by DOM1.

At the end of the qemu run, the script searches for the specific message
in the logs and fails if not found.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- enable CONFIG_STATIC_MEMORY for all arm64 builds
- use the existing qemu-smoke-arm64.sh with an argument passed for
  distinguishing between tests, instead of creating a new script
- test does not rely on kernel logs but prints a message itself on success
- remove the part that enables custom configs for arm64 builds
- add comments
- adapt commit message

 automation/gitlab-ci/test.yaml         | 18 +++++++++++
 automation/scripts/build               |  8 +++++
 automation/scripts/qemu-smoke-arm64.sh | 42 ++++++++++++++++++++++++--
 3 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 26bdbcc3ea..6f9f64a8da 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -80,6 +80,24 @@ qemu-smoke-arm64-gcc:
   tags:
     - arm64
 
+qemu-smoke-arm64-gcc-staticmem:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
+  needs:
+    - debian-unstable-gcc-arm64
+    - kernel-5.9.9-arm64-export
+    - qemu-system-aarch64-6.0.0-arm64-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+
 qemu-smoke-arm32-gcc:
   extends: .test-jobs-common
   variables:
diff --git a/automation/scripts/build b/automation/scripts/build
index 21b3bc57c8..1941763315 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -18,6 +18,14 @@ else
     make -j$(nproc) -C xen defconfig
 fi
 
+if [[ "${XEN_TARGET_ARCH}" = "arm64" ]]; then
+    echo "
+CONFIG_EXPERT=y
+CONFIG_UNSUPPORTED=y
+CONFIG_STATIC_MEMORY=y" > xen/.config
+    make -j$(nproc) -C xen olddefconfig
+fi
+
 # Save the config file before building because build failure causes the script
 # to exit early -- bash is invoked with -e.
 cp xen/.config xen-config
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 53086a5ac7..48513a7832 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -2,6 +2,15 @@
 
 set -ex
 
+test_variant=$1
+
+if [[ "${test_variant}" == "static-mem" ]]; then
+    # Memory range that is statically allocated to DOM1
+    domu_base="50000000"
+    domu_size="10000000"
+    passed="static-mem test passed"
+fi
+
 # Install QEMU
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
@@ -42,8 +51,22 @@ echo "#!/bin/sh
 
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
-mount -t devtmpfs devtmpfs /dev
-/bin/sh" > initrd/init
+mount -t devtmpfs devtmpfs /dev" > initrd/init
+
+if [[ "${test_variant}" == "static-mem" ]]; then
+    # Verify that DOM1 booted with the expected memory layout by checking the
+    # contents of the memory entry in /proc/device-tree.
+    echo "
+current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
+expected=\"$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})\"
+if [[ ${expected} == \"\${current}\" ]]; then
+	echo \"${passed}\"
+fi" >> initrd/init
+fi
+
+echo "
+/bin/sh" >> initrd/init
+
 chmod +x initrd/init
 cd initrd
 find . | cpio --create --format='newc' | gzip > ../binaries/initrd
@@ -68,6 +91,12 @@ DOMU_MEM[0]="256"
 LOAD_CMD="tftpb"
 UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > binaries/config
+
+if [[ "${test_variant}" == "static-mem" ]]; then
+    echo "
+DOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" >> binaries/config
+fi
+
 rm -rf imagebuilder
 git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
@@ -89,5 +118,12 @@ timeout -k 1 240 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
 
 set -e
-(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: BusyBox" smoke.serial) || exit 1
+grep -q "^BusyBox" smoke.serial || exit 1
+
+if [[ "${test_variant}" == "static-mem" ]]; then
+    grep -q "DOM1: ${passed}" smoke.serial || exit 1
+else
+    grep -q "DOM1: BusyBox" smoke.serial || exit 1
+fi
+
 exit 0
-- 
2.34.1


