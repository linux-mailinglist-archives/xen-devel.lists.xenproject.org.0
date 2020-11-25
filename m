Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45032C3814
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37138.69359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPH-0000uE-9R; Wed, 25 Nov 2020 04:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37138.69359; Wed, 25 Nov 2020 04:27:51 +0000
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
	id 1khmPG-0000t5-UD; Wed, 25 Nov 2020 04:27:50 +0000
Received: by outflank-mailman (input) for mailman id 37138;
 Wed, 25 Nov 2020 04:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPF-0000sM-2I
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 184141ad-5e70-411a-aa1a-4ce283c152d9;
 Wed, 25 Nov 2020 04:27:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 54E32208C3;
 Wed, 25 Nov 2020 04:27:47 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPF-0000sM-2I
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:49 +0000
X-Inumbo-ID: 184141ad-5e70-411a-aa1a-4ce283c152d9
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 184141ad-5e70-411a-aa1a-4ce283c152d9;
	Wed, 25 Nov 2020 04:27:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 54E32208C3;
	Wed, 25 Nov 2020 04:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278467;
	bh=5GTondIZ9x95JwAWG7VH9BFnfiLb+jzjLUoryd7uRUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBoTDnXszD/BJwwJaEMf+0i0ckDe7+5X3utXPvtY+j8l9e0XdtGtZ3/HEdwE1MT3O
	 Sqns+slnNOJkeYoC65GPA46xlgqS4svuaMF4/tYj+UoJb+7vK1v97hFGwZ+18yg17i
	 Ike0Ts/s5FLREal2Lhccl5VSMSgDFCzCQzMX8p7E=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 02/12] automation: add dom0less to the QEMU aarch64 smoke test
Date: Tue, 24 Nov 2020 20:27:35 -0800
Message-Id: <20201125042745.31986-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

Add a trivial dom0less test:
- fetch the Debian arm64 kernel and use it ad dom0/U kernel
- use busybox-static to create a trivial dom0/U ramdisk
- use ImageBuilder to generate the uboot boot script automatically
- install and use u-boot from the Debian package to start the test
- binaries are loaded from uboot via tftp

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v3:
- don't hardcode linux kernel version in testing script

Changes in v2:
- use the Debian kernel for testing
---
 automation/scripts/qemu-smoke-arm64.sh | 81 +++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 7 deletions(-)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index a7efbf8b6f..9bf4488115 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -6,27 +6,94 @@ set -ex
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
 apt-get -qy install --no-install-recommends qemu-system-aarch64 \
-                                            u-boot-qemu
+                                            u-boot-qemu \
+                                            u-boot-tools \
+                                            device-tree-compiler \
+                                            busybox-static \
+                                            cpio
+
+cd binaries
+apt-get download linux-image-*[0-9]-arm64
+dpkg -i --ignore-depends=initramfs-tools ./linux-image-*arm64.deb || true
+cp /boot/vmlinuz-*arm64 ./Image
+cd ..
 
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
+# ImageBuilder
+echo 'MEMORY_START="0x40000000"
+MEMORY_END="0x80000000"
 
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


