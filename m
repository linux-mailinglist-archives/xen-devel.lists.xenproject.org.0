Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F412B2AC9
	for <lists+xen-devel@lfdr.de>; Sat, 14 Nov 2020 03:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27052.55753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdl2u-0006J2-I4; Sat, 14 Nov 2020 02:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27052.55753; Sat, 14 Nov 2020 02:12:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdl2u-0006II-AX; Sat, 14 Nov 2020 02:12:08 +0000
Received: by outflank-mailman (input) for mailman id 27052;
 Sat, 14 Nov 2020 02:12:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rVh=EU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kdl2t-0006HX-54
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2020 02:12:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35034942-9481-4946-a3c5-b9acff4eb3c7;
 Sat, 14 Nov 2020 02:12:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F8F422261;
 Sat, 14 Nov 2020 02:12:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8rVh=EU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kdl2t-0006HX-54
	for xen-devel@lists.xenproject.org; Sat, 14 Nov 2020 02:12:07 +0000
X-Inumbo-ID: 35034942-9481-4946-a3c5-b9acff4eb3c7
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 35034942-9481-4946-a3c5-b9acff4eb3c7;
	Sat, 14 Nov 2020 02:12:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9F8F422261;
	Sat, 14 Nov 2020 02:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605319925;
	bh=91tedtBqSR/PprDuGd1wddKAk0sf1gu/9Y2miqIdwYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DKs91J+WyJcDhkUMgag8WI4czY6yMYgw4ef5yTPe7+NOcRPTnj+EPEophNMkyP48b
	 /Bhb4z2nFC2WMQrQHIYvx4lvhlbk/vYGd5HRDgTwc7nxp5Mu3lNt9D1ryl53EyhOAp
	 cJLVAtktIUq8yyzSTeDiJsR2hLxfyvB+CuKC0y+w=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 2/2] automation: add dom0less to the QEMU aarch64 smoke test
Date: Fri, 13 Nov 2020 18:12:03 -0800
Message-Id: <20201114021203.24558-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011131751380.20906@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011131751380.20906@sstabellini-ThinkPad-T480s>

Add a trivial dom0less test:
- build Linux defconfig arm64 to be used as dom0/U kernel
- use busybox-static to create a trivial dom0/U ramdisk
- use ImageBuilder to generate the uboot boot script automatically
- install and use u-boot from the Debian package to start the test
- binaries are loaded from uboot via tftp

Disabling the pl061 device is required to get any version of Linux to
boot on Xen on qemu-system-aarch64.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/test.yaml         |  1 +
 automation/scripts/qemu-smoke-arm64.sh | 87 +++++++++++++++++++++++---
 2 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 35346e3f6e..76eff1004e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -27,6 +27,7 @@ qemu-smoke-arm64-gcc:
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
   variables:
     CONTAINER: debian:unstable-arm64v8
+    LINUX_VERSION: 5.9.8
   script:
     - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   dependencies:
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index a7efbf8b6f..e8dc5b19cb 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -6,27 +6,100 @@ set -ex
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
 apt-get -qy install --no-install-recommends qemu-system-aarch64 \
-                                            u-boot-qemu
+                                            u-boot-qemu \
+                                            u-boot-tools \
+                                            device-tree-compiler \
+                                            busybox-static \
+                                            curl \
+                                            cpio \
+                                            bc
 
 # XXX Silly workaround to get the following QEMU command to work
 cp /usr/share/qemu/pvh.bin /usr/share/qemu/efi-virtio.rom
 qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
-   -m 512 -display none \
+   -m 1024 -display none \
    -machine dumpdtb=binaries/virt-gicv3.dtb
+# XXX disable pl061 to avoid Linux crash
+dtc -I dtb -O dts binaries/virt-gicv3.dtb > binaries/virt-gicv3.dts
+sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv3.dts > binaries/virt-gicv3-edited.dts
+dtc -I dts -O dtb binaries/virt-gicv3-edited.dts > binaries/virt-gicv3.dtb
 
+
+# Busybox Dom0
+mkdir -p initrd
+mkdir -p initrd/bin
+mkdir -p initrd/sbin
+mkdir -p initrd/etc
+mkdir -p initrd/dev
+mkdir -p initrd/proc
+mkdir -p initrd/sys
+mkdir -p initrd/lib
+mkdir -p initrd/var
+mkdir -p initrd/mnt
+cp /bin/busybox initrd/bin/busybox
+initrd/bin/busybox --install initrd/bin
+echo "#!/bin/sh
+
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devtmpfs devtmpfs /dev
+/bin/sh" > initrd/init
+chmod +x initrd/init
+cd initrd
+find . | cpio --create --format='newc' | gzip > ../binaries/initrd
+cd ..
+
+
+# Linux Dom0
+curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz
+tar xvJf linux-"$LINUX_VERSION".tar.xz
+cd linux-"$LINUX_VERSION"
+make defconfig
+make -j$(nproc) Image.gz
+cp arch/arm64/boot/Image ../binaries
+cd ..
+
+
+# ImageBuilder
+echo 'MEMORY_START="0x40000000"
+MEMORY_END="0x80000000"
+
+DEVICE_TREE="virt-gicv3.dtb"
+XEN="xen"
+DOM0_KERNEL="Image"
+DOM0_RAMDISK="initrd"
+XEN_CMD="console=dtuart dom0_mem=512M"
+
+NUM_DOMUS=1
+DOMU_KERNEL[0]="Image"
+DOMU_RAMDISK[0]="initrd"
+DOMU_MEM[0]="256"
+
+LOAD_CMD="tftpb"
+UBOOT_SOURCE="boot.source"
+UBOOT_SCRIPT="boot.scr"' > binaries/config
+rm -rf imagebuilder
+git clone https://gitlab.com/ViryaOS/imagebuilder
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
+
+
+# Run the test
 rm -f smoke.serial
 set +e
-echo "  booti 0x49000000 - 0x44000000" | timeout -k 1 30 qemu-system-aarch64 \
+echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
+timeout -k 1 240 \
+qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
-    -m 512 -monitor none -serial stdio \
+    -m 1024 -monitor none -serial stdio \
+    -smp 2 \
     -no-reboot \
-    -device loader,file=binaries/virt-gicv3.dtb,force-raw=on,addr=0x44000000 \
-    -device loader,file=binaries/xen,force-raw=on,addr=0x49000000 \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=binaries \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
 
 set -e
-grep -q 'LOADING DOMAIN 0' smoke.serial || exit 1
+(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: BusyBox" smoke.serial) || exit 1
 exit 0
-- 
2.17.1


