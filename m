Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D6808990
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 14:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649876.1014967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEp2-0003g4-PG; Thu, 07 Dec 2023 13:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649876.1014967; Thu, 07 Dec 2023 13:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEp2-0003dt-LS; Thu, 07 Dec 2023 13:53:48 +0000
Received: by outflank-mailman (input) for mailman id 649876;
 Thu, 07 Dec 2023 13:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCsk=HS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBEp0-0002bv-TQ
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 13:53:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 098ec8c9-9508-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 14:53:45 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6114A12FC;
 Thu,  7 Dec 2023 05:54:30 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA1723F6C4;
 Thu,  7 Dec 2023 05:53:41 -0800 (PST)
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
X-Inumbo-ID: 098ec8c9-9508-11ee-9b0f-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 4/5] automation: Add the script for the FVP smoke test
Date: Thu,  7 Dec 2023 21:53:17 +0800
Message-Id: <20231207135318.1912846-5-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207135318.1912846-1-Henry.Wang@arm.com>
References: <20231207135318.1912846-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the shell script for the FVP smoke test. Similarly
as the QEMU jobs, the shell script will firstly prepare the DomU
BusyBox image, use the ImageBuilder to arrange the binaries in memory
and generate the U-Boot script, then start the test. To provide the
TFTP service for the FVP, the shell script will also start the TFTP
service, and copy the binaries needed by test to the TFTP directory
used by the TFTP server.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 .../scripts/fvp-base-smoke-dom0-arm64.sh      | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100755 automation/scripts/fvp-base-smoke-dom0-arm64.sh

diff --git a/automation/scripts/fvp-base-smoke-dom0-arm64.sh b/automation/scripts/fvp-base-smoke-dom0-arm64.sh
new file mode 100755
index 0000000000..716a63b0a8
--- /dev/null
+++ b/automation/scripts/fvp-base-smoke-dom0-arm64.sh
@@ -0,0 +1,117 @@
+#!/bin/bash
+
+set -ex
+
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
+tar xvzf ../initrd.tar.gz
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+cp -ar ../dist/install/* .
+mv ../initrd.cpio.gz ./root
+cp ../Image ./root
+echo "name=\"test\"
+memory=512
+vcpus=1
+kernel=\"/root/Image\"
+ramdisk=\"/root/initrd.cpio.gz\"
+extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
+" > root/test.cfg
+echo "#!/bin/bash
+
+export LD_LIBRARY_PATH=/usr/local/lib
+bash /etc/init.d/xencommons start
+
+xl list
+
+xl create -c /root/test.cfg
+
+" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+echo "rc_verbose=yes" >> etc/rc.conf
+find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+cd ../..
+
+# Start a TFTP server to provide TFTP service to FVP
+service tftpd-hpa start
+
+# ImageBuilder
+echo 'MEMORY_START="0x80000000"
+MEMORY_END="0xFF000000"
+
+DEVICE_TREE="fvp-base-gicv3-psci-1t.dtb"
+XEN="xen"
+DOM0_KERNEL="Image"
+DOM0_RAMDISK="xen-rootfs.cpio.gz"
+XEN_CMD="console=dtuart dom0_mem=1024M console_timestamps=boot"
+
+NUM_DOMUS=0
+
+LOAD_CMD="tftpb"
+UBOOT_SOURCE="boot.source"
+UBOOT_SCRIPT="boot.scr"' > binaries/config
+rm -rf imagebuilder
+git clone https://gitlab.com/ViryaOS/imagebuilder
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
+
+# Copy files to the TFTP directory to use
+cp ./binaries/boot.scr /srv/tftp/
+cp ./binaries/Image /srv/tftp/
+cp ./binaries/xen-rootfs.cpio.gz /srv/tftp/
+cp ./binaries/xen /srv/tftp/
+cp ./binaries/fvp-base-gicv3-psci-1t.dtb /srv/tftp/
+
+# Start FVP
+TERM0_CFG="-C bp.terminal_0.mode=telnet -C bp.terminal_0.start_telnet=0"
+TERM1_CFG="-C bp.terminal_1.mode=telnet -C bp.terminal_1.start_telnet=0"
+TERM2_CFG="-C bp.terminal_2.mode=telnet -C bp.terminal_2.start_telnet=0"
+TERM3_CFG="-C bp.terminal_3.mode=telnet -C bp.terminal_3.start_telnet=0"
+
+VIRTIO_USER_NETWORK_CFG="-C bp.virtio_net.enabled=1 \
+-C bp.virtio_net.hostbridge.userNetworking=1 \
+-C bp.virtio_net.hostbridge.userNetPorts=8022=22 \
+-C bp.virtio_net.transport=legacy"
+
+./automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp \
+    "/FVP/FVP_Base_RevC-2xAEMvA/Base_RevC_AEMvA_pkg/models/Linux64_armv8l_GCC-9.3/FVP_Base_RevC-2xAEMvA \
+    -C bp.vis.disable_visualisation=1 \
+    -C bp.ve_sysregs.exit_on_shutdown=1 \
+    -C bp.secure_memory=0 \
+    -C cache_state_modelled=0 \
+    -C cluster0.has_arm_v8-4=1 \
+    -C cluster1.has_arm_v8-4=1 \
+    ${TERM0_CFG} ${TERM1_CFG} ${TERM2_CFG} ${TERM3_CFG} \
+    ${VIRTIO_USER_NETWORK_CFG} \
+    -C bp.secureflashloader.fname=$(pwd)/binaries/bl1.bin \
+    -C bp.flashloader0.fname=$(pwd)/binaries/fip.bin" |& \
+        tee smoke.serial
+
+exit 0
-- 
2.25.1


