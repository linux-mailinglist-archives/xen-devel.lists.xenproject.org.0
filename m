Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EA42C381B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:28:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37184.69479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPu-0001uh-JX; Wed, 25 Nov 2020 04:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37184.69479; Wed, 25 Nov 2020 04:28:30 +0000
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
	id 1khmPu-0001to-ET; Wed, 25 Nov 2020 04:28:30 +0000
Received: by outflank-mailman (input) for mailman id 37184;
 Wed, 25 Nov 2020 04:28:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPt-0000sM-1D
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2735ef72-28c5-4302-9bb0-19c8cb949484;
 Wed, 25 Nov 2020 04:27:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E25621D7A;
 Wed, 25 Nov 2020 04:27:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPt-0000sM-1D
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:29 +0000
X-Inumbo-ID: 2735ef72-28c5-4302-9bb0-19c8cb949484
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2735ef72-28c5-4302-9bb0-19c8cb949484;
	Wed, 25 Nov 2020 04:27:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9E25621D7A;
	Wed, 25 Nov 2020 04:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278472;
	bh=BsN+MdGSKW1XgXXksWV5TK4XWZsbUTOQRZGpT/TJoLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QvEmcM+cAnFDgFRTLrutIBjyVHt8PnS3FU8WH2usO8zBQ+Zf7Rmd5I8kN7TMma/cr
	 /bWgWrb5p0MZHsOYegmtDqu3zvAVSksQyD9URIMzMummurZfyQbi+kD1N9X1SCQ0gd
	 x0Zdx8UMiFsxo0ELEUVptNiLB15v0DoVLRawjamw=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 12/12] automation: add domU creation to dom0 alpine linux test
Date: Tue, 24 Nov 2020 20:27:45 -0800
Message-Id: <20201125042745.31986-12-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

Add a trivial Busybox based domU.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/scripts/qemu-alpine-arm64.sh | 47 ++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-alpine-arm64.sh
index 7d1eb7d1b6..bd8965e6f1 100755
--- a/automation/scripts/qemu-alpine-arm64.sh
+++ b/automation/scripts/qemu-alpine-arm64.sh
@@ -8,10 +8,36 @@ apt-get -qy install --no-install-recommends qemu-system-aarch64 \
                                             u-boot-tools \
                                             device-tree-compiler \
                                             cpio \
-                                            curl
+                                            curl \
+                                            busybox-static
 
-mkdir -p binaries/rootfs
-cd binaries/rootfs
+# DomU Busybox
+cd binaries
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
+find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
+cd ..
+
+mkdir -p rootfs
+cd rootfs
 tar xvzf ../initrd.tar.gz
 mkdir proc
 mkdir run
@@ -19,6 +45,15 @@ mkdir srv
 mkdir sys
 rm var/run
 cp -ar ../dist/install/* .
+mv ../initrd.cpio.gz ./root
+cp ../Image ./root
+echo "name=\"test\"
+memory=512
+vcpus=1
+kernel=\"/root/Image\"
+ramdisk=\"/root/initrd.cpio.gz\"
+extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
+" > root/test.cfg
 echo "#!/bin/bash
 
 export LD_LIBRARY_PATH=/usr/local/lib
@@ -26,6 +61,8 @@ bash /etc/init.d/xencommons start
 
 xl list
 
+xl create -c /root/test.cfg
+
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
@@ -68,7 +105,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 rm -f smoke.serial
 set +e
 echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 480 \
+timeout -k 1 720 \
 qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
@@ -80,5 +117,5 @@ qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
 
 set -e
-grep -q "Domain-0" smoke.serial || exit 1
+(grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
 exit 0
-- 
2.17.1


