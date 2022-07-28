Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2215839EF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376668.609609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyQG-00064w-7S; Thu, 28 Jul 2022 07:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376668.609609; Thu, 28 Jul 2022 07:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyQG-00062L-2Z; Thu, 28 Jul 2022 07:59:08 +0000
Received: by outflank-mailman (input) for mailman id 376668;
 Thu, 28 Jul 2022 07:59:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGyQE-0005U6-Nf
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:59:06 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26e899c4-0e4b-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 09:59:05 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id ez10so1736800ejc.13
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 00:59:05 -0700 (PDT)
Received: from uni.router.wind (adsl-69.109.242.233.tellas.gr.
 [109.242.233.69]) by smtp.googlemail.com with ESMTPSA id
 l2-20020a1709060cc200b00722e4bab163sm105413ejh.200.2022.07.28.00.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 00:59:04 -0700 (PDT)
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
X-Inumbo-ID: 26e899c4-0e4b-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/yzGIK2WwUM9PEPFz0+ZahCjAacTI+5nDzYSTopw8Ts=;
        b=M0cNJH2zhlkpeo8XXDiOm7SfO4krIBzji+YhF7TmZS8anUKzk/y+WcdQ2/XtAKoz/D
         hlNENv+pge/lfDBSlCUQipjoNUVi7tm1V+iTYlk2hYcI/DDheCQoGd2XTmZ61xOPh79E
         DMGSgqGdK8mm/FRw1YKduSypcaZxwu6n2hLmtKLDbX/5kzncHRFPfytHUDomce3zuM/v
         ZuP7d8IQOBaULncfTHIBm1rq2pLVy2JNsOuegjGNkhE015Kwx/agSJJyc2164mC3eorq
         OjJHokKmC4gIpo8+dxyECAeC8TFjUvi8H+AyoDuouh7Ap7xfYCSG32I82/HoaPv745PQ
         yweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/yzGIK2WwUM9PEPFz0+ZahCjAacTI+5nDzYSTopw8Ts=;
        b=ROG9/03MpyNQdjKsdOVR4kgyC6sWcEBSS1GUXRRejoQOpeU9GgM8cLfx4DwX8ZFKz+
         94JH7N/mnUymzmf0RCMmRq6Ku6ycDqE8/VMZs4lDRBrBgqI4PL50BDbDV1qjdHdEJ1gf
         7Zzy5OlHb88Mi8j69syBDZ/C/1HJ1I4Z/BeSV9mDhjYxEbr5/PYOA5l2TJDq5BHROkjH
         V8yyjqiuUMq6znl84ASB6cn1UPB9l6llbFwdQTlvTWATOfQv9NT7XiX9M5nM/zaNzhEH
         vaxZdkCzXmLhv8Wj9kuSk6if4TC3HsL2K4m2Mr0ArFkdHWL285eNn5mPr96emg9fhja4
         2eRw==
X-Gm-Message-State: AJIora82PRmyjbwpthmCBX1/ciG+VVhOdfXzBap+LNb1hwZSoTntp3mG
	h1o7cQHjL73LJlKYfnnJGoCiw3x9cYc=
X-Google-Smtp-Source: AGRyM1uuYqJjK5utoLyYZGuSAR9RoXypk1dlKzOB00lmoVcAPKW2HClruhluLhrBviRmZHDzL7Wahw==
X-Received: by 2002:a17:907:738a:b0:72e:8510:6bfd with SMTP id er10-20020a170907738a00b0072e85106bfdmr19411003ejc.688.1658995145128;
        Thu, 28 Jul 2022 00:59:05 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 2/2] automation: arm64: Create a test job for testing static allocation on qemu
Date: Thu, 28 Jul 2022 10:58:56 +0300
Message-Id: <20220728075856.1175504-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728075856.1175504-1-burzalodowa@gmail.com>
References: <20220728075856.1175504-1-burzalodowa@gmail.com>
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
Reviewed-by: Penny Zheng <penny.zheng@arm.com>
---

Changes in v2:
- enable CONFIG_STATIC_MEMORY for all arm64 builds
- use the existing qemu-smoke-arm64.sh with an argument passed for
  distinguishing between tests, instead of creating a new script
- test does not rely on kernel logs but prints a message itself on success
- remove the part that enables custom configs for arm64 builds
- add comments
- adapt commit message

Changes in v3:
- refactor the changes to improve readability, no functionality change intended
- add Penny's R-b tag

 automation/gitlab-ci/test.yaml         | 18 ++++++++++++++++++
 automation/scripts/build               | 10 +++++++++-
 automation/scripts/qemu-smoke-arm64.sh | 25 ++++++++++++++++++++++++-
 3 files changed, 51 insertions(+), 2 deletions(-)

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
index 21b3bc57c8..2b9f2d2b54 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -15,7 +15,15 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
     hypervisor_only="y"
 else
-    make -j$(nproc) -C xen defconfig
+    if [[ "${XEN_TARGET_ARCH}" = "arm64" ]]; then
+        echo "
+CONFIG_EXPERT=y
+CONFIG_UNSUPPORTED=y
+CONFIG_STATIC_MEMORY=y" > xen/.config
+        make -j$(nproc) -C xen olddefconfig
+    else
+        make -j$(nproc) -C xen defconfig
+    fi
 fi
 
 # Save the config file before building because build failure causes the script
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 53086a5ac7..69d9eae7a9 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -2,6 +2,23 @@
 
 set -ex
 
+test_variant=$1
+
+passed="BusyBox"
+check=""
+
+if [[ "${test_variant}" == "static-mem" ]]; then
+    # Memory range that is statically allocated to DOM1
+    domu_base="50000000"
+    domu_size="10000000"
+    passed="${test_variant} test passed"
+    check="current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
+expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
+if [[ \"\${expected}\" == \"\${current}\" ]]; then
+	echo \"${passed}\"
+fi"
+fi
+
 # Install QEMU
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
@@ -43,6 +60,7 @@ echo "#!/bin/sh
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
 mount -t devtmpfs devtmpfs /dev
+${check}
 /bin/sh" > initrd/init
 chmod +x initrd/init
 cd initrd
@@ -68,6 +86,11 @@ DOMU_MEM[0]="256"
 LOAD_CMD="tftpb"
 UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > binaries/config
+
+if [[ "${test_variant}" == "static-mem" ]]; then
+    echo -e "\nDOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" >> binaries/config
+fi
+
 rm -rf imagebuilder
 git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
@@ -89,5 +112,5 @@ timeout -k 1 240 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
 
 set -e
-(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: BusyBox" smoke.serial) || exit 1
+(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
 exit 0
-- 
2.34.1


