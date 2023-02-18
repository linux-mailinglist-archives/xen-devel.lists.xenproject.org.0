Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AC69B696
	for <lists+xen-devel@lfdr.de>; Sat, 18 Feb 2023 01:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497385.768382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTAli-00051R-Rg; Sat, 18 Feb 2023 00:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497385.768382; Sat, 18 Feb 2023 00:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTAli-0004y7-Oe; Sat, 18 Feb 2023 00:07:58 +0000
Received: by outflank-mailman (input) for mailman id 497385;
 Sat, 18 Feb 2023 00:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEmr=6O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pTAlg-0004hK-IB
 for xen-devel@lists.xenproject.org; Sat, 18 Feb 2023 00:07:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a684696-af20-11ed-933d-83870f6b2ba8;
 Sat, 18 Feb 2023 01:07:54 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D48AB81F9C;
 Sat, 18 Feb 2023 00:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A1FC4339B;
 Sat, 18 Feb 2023 00:07:51 +0000 (UTC)
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
X-Inumbo-ID: 4a684696-af20-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676678872;
	bh=rUrGZbmK5uUfTRLHvZznH/0nYIsKj1VaIsQqXSJ4KcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fdXfXs0hIdsyOK/tzub8r8b40+y1tj/20arJhlZdrXRSh4aSGvc/hzZIcWuwvcNjS
	 EOUAT8mB9eQ9G+erZQA1ahtN0+SDK88M0+B5DPNqlYtvz6PyTa7ah36onBZbi0lQ7R
	 tBeLKAfNpcK6IHtGeOiioj0Q3Ec4pTiKSghSEoRJZYWWXpKNgJKaOC+CpoLNjNk5l2
	 OGhr6zd2hIu8g3JubpRzVblukLM2drJlIaYLNOjdkTy3rLWJvEkJe/0r3c+ySUIZd/
	 kzhwZ7Wh8SzCRjwwWNwIk5KGl3nFrFMuc+hCrVNB9kmSwifmiMYKz+N6Ex3lDrAhMt
	 wqC7AmYezZ4iQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3 3/3] automation: expand arm32 dom0 test adding xl domain creation
Date: Fri, 17 Feb 2023 16:07:47 -0800
Message-Id: <20230218000747.2965719-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302171606480.2127160@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302171606480.2127160@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

As part of the arm32 dom0 test, also create a simple domU using xl. To
do that, we need the toolstack installed in the dom0 rootfs. We switch
to using the kernel and rootfs built by the Yocto arm32 job.

Remove the PCI node from the host device tree: it is unused but causes a
Linux hang at boot.

Use xen-watchdog to trigger the domU creation for convience
(/etc/local.d is not handled by rootfs.)

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- remove unsued debian-unstable-gcc-arm32 dependency for
qemu-smoke-dom0-arm32-gcc
- remove job qemu-smoke-dom0-arm32-gcc-debug as it doesn't make sense
anymore
- grep for both dom0 and domU prompts in qemu-smoke-dom0-arm32.sh
---
 automation/gitlab-ci/test.yaml              | 11 +----
 automation/scripts/qemu-smoke-dom0-arm32.sh | 52 +++++++++++++++------
 2 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 00273b21c8..6d09c97702 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -171,15 +171,7 @@ qemu-smoke-dom0-arm32-gcc:
     - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-unstable-gcc-arm32
-
-qemu-smoke-dom0-arm32-gcc-debug:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-unstable-gcc-arm32-debug
+    - yocto-qemuarm
 
 qemu-smoke-dom0less-arm32-gcc:
   extends: .qemu-arm32
@@ -244,6 +236,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
   needs:
     - *arm32-test-needs
     - debian-unstable-gcc-arm32-debug
+    - yocto-qemuarm
 
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 98e4d481f6..2c80df089f 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -3,14 +3,37 @@
 set -ex
 
 cd binaries
-# Use the kernel from Debian
-curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
-# Use a tiny initrd based on busybox from Alpine Linux
-curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
 
+mkdir rootfs
+cd rootfs
+tar xvf ../xen-image-minimal-qemuarm.tar.bz2
+mkdir -p ./root
+echo "name=\"test\"
+memory=400
+vcpus=1
+kernel=\"/root/zImage\"
+ramdisk=\"/root/initrd.cpio.gz\"
+extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
+" > root/test.cfg
+echo "#!/bin/bash
+
+xl list
+
+xl create -c /root/test.cfg
+
+" > ./root/xen.start
+echo "bash /root/xen.start" >> ./etc/init.d/xen-watchdog
+
+curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
 mkdir rootfs
 cd rootfs
 tar xvzf ../initrd.tar.gz
+find . | cpio -H newc -o | gzip > ../root/initrd.cpio.gz
+cd ..
+rm -rf rootfs
+rm initrd.tar.gz
+
+cp ../zImage ./root
 find . | cpio -H newc -o | gzip > ../initrd.gz
 cd ..
 
@@ -20,22 +43,25 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
    -machine virt \
    -machine virtualization=true \
    -smp 4 \
-   -m 1024 \
+   -m 2048 \
    -serial stdio \
    -monitor none \
    -display none \
    -machine dumpdtb=virt.dtb
 
+# XXX disable pci to avoid Linux hang
+fdtput virt.dtb -p -t s /pcie@10000000 status disabled
+
 # ImageBuilder
 echo 'MEMORY_START="0x40000000"
-MEMORY_END="0x80000000"
+MEMORY_END="0xC0000000"
 
 DEVICE_TREE="virt.dtb"
-XEN="xen"
-DOM0_KERNEL="vmlinuz"
+XEN="xen-qemuarm"
+DOM0_KERNEL="zImage"
 DOM0_RAMDISK="initrd.gz"
-DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
-XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
+DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/sbin/init"
+XEN_CMD="console=dtuart dom0_mem=1024M bootscrub=0"
 
 NUM_DOMUS=0
 
@@ -51,12 +77,12 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 rm -f smoke.serial
 set +e
 echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 240 \
+timeout -k 1 720 \
 ./qemu-system-arm \
    -machine virt \
    -machine virtualization=true \
    -smp 4 \
-   -m 1024 \
+   -m 2048 \
    -serial stdio \
    -monitor none \
    -display none \
@@ -66,5 +92,5 @@ timeout -k 1 240 \
    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
 
 set -e
-(grep -q "^/ #" smoke.serial) || exit 1
+(grep -q "Domain-0" smoke.serial && grep -q "^/ #" smoke.serial) || exit 1
 exit 0
-- 
2.25.1


