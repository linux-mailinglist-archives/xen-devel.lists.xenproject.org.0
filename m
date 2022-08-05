Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1406658B10D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 23:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381518.616260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK4he-00085F-L4; Fri, 05 Aug 2022 21:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381518.616260; Fri, 05 Aug 2022 21:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK4he-000836-Hy; Fri, 05 Aug 2022 21:17:54 +0000
Received: by outflank-mailman (input) for mailman id 381518;
 Fri, 05 Aug 2022 21:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvBN=YJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oK4hd-0007XM-76
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 21:17:53 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10b00da1-1504-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 23:17:52 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id z17so4528125wrq.4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Aug 2022 14:17:52 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:cdd9:ab5d:6d5c:1538])
 by smtp.googlemail.com with ESMTPSA id
 z9-20020a5d4d09000000b0021dd08ad8d7sm4833347wrt.46.2022.08.05.14.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:17:51 -0700 (PDT)
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
X-Inumbo-ID: 10b00da1-1504-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=FtiZPovu9vfEtmY1jAZC9LcYQsm0U6GpSbrl2Z2hIbc=;
        b=iaVdZeRoahjmE2/0xsoK1A9C/Wz4QKmJeuoUGehyxz9Ze+r7bs9FRV414CyEWyXYWJ
         Ziv90U8mWv6Wz91aFPh08G39sT3IfSnYLmbyjgQ0QuzM03LlcM+Y2TslEyY6cIvWoElt
         8s6+u5LiRynHZ9I3sunbhhLLq6u0curk8sdU8I9NGlUBHUhHVMH84Ftc6u7rDNNm/o7h
         nrm+c0tsHQLu3/MDDleARoxL2wOdvKtBYO9UKYNR7H2Lmk817s09uoSQHHpUoG1ey5CJ
         7W+EaJTIpgrUlhIs2j7ZYGZ/MqRacJSZjzkYPiYRKGlnjntoZ/BZpY3bDSs2juACO+cM
         aLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=FtiZPovu9vfEtmY1jAZC9LcYQsm0U6GpSbrl2Z2hIbc=;
        b=c//1H1v1VksYme/MqmDOPYa8j4o0m0a99Gjl2gNQBcxlUdTjcVMLb0qxthlfRQ/gru
         +NMj5RuBW8hbT4CrWJv7ZfOywbKnCTlVIvOcuDxw2DD5ExqDPWB2ZO60TkB8ZitTDhKp
         j1F4SZd1v08oYMN5TsMWzmZWaWBcoGgMaJ9/UG5I6xIHgmekE31xH7vAatf/1LRerxv8
         ireelRTm27FDSwxi64JvkDhlqQsRCwi4oOyFjZ1GoMiBaMQxe8nU8nFim8B+Hpp2yk9g
         s51S2CofLA5bLNTCyDTCMLwPwMMRnwZIh6gx3+RNsfKWbBJm/jTBcs3082ti2UutieuZ
         ON0A==
X-Gm-Message-State: ACgBeo08jS1bPa450l9M2dDNQOWs1UW4lVPq63hMV4DGW6Em6qkEc5Ao
	FncsgPApwf3MkvpubXzgYstwGC80MRY=
X-Google-Smtp-Source: AA6agR4TEPDzWeoho1seRvUXiN8ohf2xxoKIF7etu4KP7Do/42XxlyZ5JsnHqCJ5IeKzgdHzuzarhA==
X-Received: by 2002:a5d:64e2:0:b0:220:7dc6:1353 with SMTP id g2-20020a5d64e2000000b002207dc61353mr5417626wri.411.1659734271743;
        Fri, 05 Aug 2022 14:17:51 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] automation: qemu-smoke-arm64: Run ping test over a pv network interface
Date: Sat,  6 Aug 2022 00:17:41 +0300
Message-Id: <20220805211741.1869068-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805211741.1869068-1-burzalodowa@gmail.com>
References: <20220805211741.1869068-1-burzalodowa@gmail.com>
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
 automation/gitlab-ci/test.yaml         |  6 ++--
 automation/scripts/qemu-smoke-arm64.sh | 43 +++++++++++++++++++++++---
 2 files changed, 43 insertions(+), 6 deletions(-)

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
index b48a20988f..0d19ad52cc 100755
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
@@ -76,7 +111,7 @@ MEMORY_END="0x80000000"
 DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
 DOM0_KERNEL="Image"
-DOM0_RAMDISK="initrd"
+DOM0_RAMDISK="dom0-rootfs.cpio.gz"
 XEN_CMD="console=dtuart dom0_mem=512M"
 
 NUM_DOMUS=1
@@ -113,5 +148,5 @@ timeout -k 1 240 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
 
 set -e
-(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
+(grep -q "^Welcome to Alpine Linux 3.12" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
 exit 0
-- 
2.34.1


