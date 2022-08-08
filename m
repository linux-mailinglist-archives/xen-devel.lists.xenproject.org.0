Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638C358CDC7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 20:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382542.617510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL7fW-0005Wx-OB; Mon, 08 Aug 2022 18:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382542.617510; Mon, 08 Aug 2022 18:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL7fW-0005Se-Jd; Mon, 08 Aug 2022 18:40:02 +0000
Received: by outflank-mailman (input) for mailman id 382542;
 Mon, 08 Aug 2022 18:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWor=YM=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oL7fU-0004sh-Uc
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 18:40:01 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 820943d2-1749-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 20:40:00 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id t5so12397047edc.11
 for <xen-devel@lists.xenproject.org>; Mon, 08 Aug 2022 11:40:00 -0700 (PDT)
Received: from uni.. ([2a02:587:ac16:4a00:f2e5:15e2:30fb:8a7e])
 by smtp.googlemail.com with ESMTPSA id
 c16-20020aa7df10000000b0043cf2e0ce1csm4915221edy.48.2022.08.08.11.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 11:39:59 -0700 (PDT)
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
X-Inumbo-ID: 820943d2-1749-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vS8/1xdGBjOCQRHZYv0ZoPfKB9E5HWaT+XENlF5TNvc=;
        b=JHSbjPNvFEFFmFuRnDAqp8W61wx0kUHz+ZyyC49LeQLdVimzbCP78i/NIKRq25okSI
         Sf0He9+PrjioAvZ79UMhKz+A/HtD/JnW9VFmZ3KiK/WERvjiYPZ7+PuEwGd/0GNDUuw8
         D8U+glxBxACvnOHwHlsDdLQbIuNeyBDlzIIckmoiGu+e2rJPSSLAyM57L7OupY3i0BXw
         3nJzm4mOz60AgTL0qsRJ8ywv3XOmJjLT87e32+yypN8indiPvd3vHNP/S+K9+V86OOh/
         yeNVTib18IqE1UyAXfLZjL55/GJDTJ1iO+sIaV/IoZ7XkefD1dUXJ+o1S5lGsqFGDYoQ
         CY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vS8/1xdGBjOCQRHZYv0ZoPfKB9E5HWaT+XENlF5TNvc=;
        b=FT5RPcW7wQEb+gwD/wqRv9o0Rif0VnICQaUvT1tZZjH426b1O+WwB8PyUNgFCSnS+M
         LmLBFNMJOS3Ustft52UNJBgGM96qu0pAiVviqhMwyLEtnyBkN14O9FuvEBnpt6VOew06
         gVQyZxF4oCotiomMpYTPLz5VSx8PXRDKz/B3CXSHkQdqjydJ+N0iCp9kRu4bRz7J0apF
         4S+pu4DIbJc5mlNZw1pyzHAFGc5oI9TyvtROO7sivz5LIjZswUu4h5j+Lv+kBIhQZ6++
         dJSvHJp2Y5wWadKxgWN6U596Ult+U4J5zGexvLA3ET+LUyOTGlWRz0UB4gvmZC8WXegy
         ohYQ==
X-Gm-Message-State: ACgBeo0XcUoFv+0EHGZ9PctnrRQ/iKE228kr52hTXtRCTx5SM2ddXEqN
	j/HOtL2HRB6Prlb9MSSPPKJ+CjG65zI=
X-Google-Smtp-Source: AA6agR7AcCIHdKI9z+HaPQuPF1Pm/ozX+EhSXcVda8DLaN8FRkXsSiI7k3sFfUBl7h8sk9qaqFE2Ow==
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id w17-20020a056402269100b0043dba10854bmr18064425edd.158.1659983999430;
        Mon, 08 Aug 2022 11:39:59 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] automation: qemu-smoke-arm64: Run ping test over a pv network interface
Date: Mon,  8 Aug 2022 21:39:52 +0300
Message-Id: <20220808183952.1888459-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808183952.1888459-1-burzalodowa@gmail.com>
References: <20220808183952.1888459-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch modified the test in the following way
- Dom0 is booted with an alpine linux rootfs with the xen tools.
- Once Dom0 is booted, it starts xenstored, calls init-dom0less to setup
the xenstore interface for the dom0less Dom1, setups the bridged network
and attaches a pv network interface to Dom1.
- In the meantime, Dom1 in its init script tries to assign an ip to eth0
and ping Dom0,
- If Dom1 manages to ping Dom0, it prints 'passed'.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- rebase against the latest changes on staging
- search for 'Welcome to Alpine Linux' instead of 'Welcome to Alpine Linux 3.12'
so that the test is not bound to a specific Alpine Linux version
- do not disable dom0less enhanced in the ImageBuilder script

 automation/gitlab-ci/test.yaml         |  6 ++--
 automation/scripts/qemu-smoke-arm64.sh | 44 +++++++++++++++++++++++---
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index aa633fb655..2eb6c3866e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -69,7 +69,8 @@ qemu-smoke-arm64-gcc:
   script:
     - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   needs:
-    - debian-unstable-gcc-arm64
+    - alpine-3.12-gcc-arm64
+    - alpine-3.12-arm64-rootfs-export
     - kernel-5.19-arm64-export
     - qemu-system-aarch64-6.0.0-arm64-export
   artifacts:
@@ -87,7 +88,8 @@ qemu-smoke-arm64-gcc-staticmem:
   script:
     - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
   needs:
-    - debian-unstable-gcc-arm64
+    - alpine-3.12-gcc-arm64
+    - alpine-3.12-arm64-rootfs-export
     - kernel-5.19-arm64-export
     - qemu-system-aarch64-6.0.0-arm64-export
   artifacts:
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 497dbee15f..c80d9b2aee 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -4,8 +4,13 @@ set -ex
 
 test_variant=$1
 
-passed="BusyBox"
-check=""
+passed="passed"
+check="
+until ifconfig eth0 192.168.0.2 && ping -c 10 192.168.0.1; do
+    sleep 30
+done
+echo \"${passed}\"
+"
 
 if [[ "${test_variant}" == "static-mem" ]]; then
     # Memory range that is statically allocated to DOM1
@@ -68,6 +73,36 @@ cd initrd
 find . | cpio --create --format='newc' | gzip > ../binaries/initrd
 cd ..
 
+# DOM0 rootfs
+mkdir -p rootfs
+cd rootfs
+tar xzf ../binaries/initrd.tar.gz
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+cp -ar ../binaries/dist/install/* .
+
+echo "#!/bin/bash
+
+export LD_LIBRARY_PATH=/usr/local/lib
+bash /etc/init.d/xencommons start
+
+/usr/local/lib/xen/bin/init-dom0less
+
+brctl addbr xenbr0
+brctl addif xenbr0 eth0
+ifconfig eth0 up
+ifconfig xenbr0 up
+ifconfig xenbr0 192.168.0.1
+
+xl network-attach 1 type=vif
+" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+echo "rc_verbose=yes" >> etc/rc.conf
+find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+cd ..
 
 # ImageBuilder
 echo 'MEMORY_START="0x40000000"
@@ -76,14 +111,13 @@ MEMORY_END="0x80000000"
 DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
 DOM0_KERNEL="Image"
-DOM0_RAMDISK="initrd"
+DOM0_RAMDISK="dom0-rootfs.cpio.gz"
 XEN_CMD="console=dtuart dom0_mem=512M"
 
 NUM_DOMUS=1
 DOMU_KERNEL[0]="Image"
 DOMU_RAMDISK[0]="initrd"
 DOMU_MEM[0]="256"
-DOMU_ENHANCED[0]=0
 
 LOAD_CMD="tftpb"
 UBOOT_SOURCE="boot.source"
@@ -114,5 +148,5 @@ timeout -k 1 240 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
 
 set -e
-(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
+(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
 exit 0
-- 
2.34.1


