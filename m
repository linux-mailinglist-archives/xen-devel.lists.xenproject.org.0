Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B612C3819
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37172.69456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPk-0001i9-TR; Wed, 25 Nov 2020 04:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37172.69456; Wed, 25 Nov 2020 04:28:20 +0000
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
	id 1khmPk-0001hG-MY; Wed, 25 Nov 2020 04:28:20 +0000
Received: by outflank-mailman (input) for mailman id 37172;
 Wed, 25 Nov 2020 04:28:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPj-0000sM-0r
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abf9b2c7-8f2c-4c38-9230-9998c7f079ec;
 Wed, 25 Nov 2020 04:27:52 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92E7E21D46;
 Wed, 25 Nov 2020 04:27:51 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPj-0000sM-0r
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:19 +0000
X-Inumbo-ID: abf9b2c7-8f2c-4c38-9230-9998c7f079ec
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id abf9b2c7-8f2c-4c38-9230-9998c7f079ec;
	Wed, 25 Nov 2020 04:27:52 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 92E7E21D46;
	Wed, 25 Nov 2020 04:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278471;
	bh=78C8JPAxWzx+2hjJoT6vrfTzB1NiGDxd/5tqEyKfQ3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vvqEJlv+cqSCpmW9YC0oKgxLCKH13eKDoly9WpMFUxZZXSpNlUyu3Iu2yqd50IcWn
	 XvFbhFpLFwS50nggbNEi8L9uraCwmfqWC5jEG3EJOFin2U7gqRGnhL25lXaosH9u3M
	 VBrbhGnzLSXh79THhEYXPu/VSerG985scjsruWEY=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 10/12] automation: create an alpine linux arm64 test job
Date: Tue, 24 Nov 2020 20:27:43 -0800
Message-Id: <20201125042745.31986-10-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

Create a test job that starts Xen and Dom0 on QEMU based on the alpine
linux rootfs. Use the Linux kernel and rootfs from the tests-artifacts
containers. Add the Xen tools binaries from the Alpine Linux build job.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/test.yaml          | 24 +++++++
 automation/scripts/build                |  1 +
 automation/scripts/qemu-alpine-arm64.sh | 84 +++++++++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100755 automation/scripts/qemu-alpine-arm64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 35346e3f6e..a291538d68 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -22,6 +22,30 @@ build-each-commit-gcc:
     - /^coverity-tested\/.*/
     - /^stable-.*/
 
+qemu-alpine-arm64-gcc:
+  stage: test
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+  dependencies:
+    - alpine-3.12-gcc-arm64
+    - alpine-3.12-arm64-rootfs-export
+    - kernel-5.9.9-arm64-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+  except:
+    - master
+    - smoke
+    - /^coverity-tested\/.*/
+    - /^stable-.*/
+
 qemu-smoke-arm64-gcc:
   stage: test
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
diff --git a/automation/scripts/build b/automation/scripts/build
index 3fb2fe134c..0e1ebd60f2 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -52,6 +52,7 @@ cp xen/.config xen-config
 mkdir binaries
 if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
     cp xen/xen binaries/xen
+    cp -r dist binaries/
 fi
 
 # Build all the configs we care about
diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-alpine-arm64.sh
new file mode 100755
index 0000000000..7d1eb7d1b6
--- /dev/null
+++ b/automation/scripts/qemu-alpine-arm64.sh
@@ -0,0 +1,84 @@
+#!/bin/bash
+
+set -ex
+
+apt-get -qy update
+apt-get -qy install --no-install-recommends qemu-system-aarch64 \
+                                            u-boot-qemu \
+                                            u-boot-tools \
+                                            device-tree-compiler \
+                                            cpio \
+                                            curl
+
+mkdir -p binaries/rootfs
+cd binaries/rootfs
+tar xvzf ../initrd.tar.gz
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+cp -ar ../dist/install/* .
+echo "#!/bin/bash
+
+export LD_LIBRARY_PATH=/usr/local/lib
+bash /etc/init.d/xencommons start
+
+xl list
+
+" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+echo "rc_verbose=yes" >> etc/rc.conf
+find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+cd ../..
+
+# XXX Silly workaround to get the following QEMU command to work
+cp /usr/share/qemu/pvh.bin /usr/share/qemu/efi-virtio.rom
+qemu-system-aarch64 \
+   -machine virtualization=true \
+   -cpu cortex-a57 -machine type=virt \
+   -m 1024 -display none \
+   -machine dumpdtb=binaries/virt-gicv3.dtb
+# XXX disable pl061 to avoid Linux crash
+dtc -I dtb -O dts binaries/virt-gicv3.dtb > binaries/virt-gicv3.dts
+sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv3.dts > binaries/virt-gicv3-edited.dts
+dtc -I dts -O dtb binaries/virt-gicv3-edited.dts > binaries/virt-gicv3.dtb
+
+# ImageBuilder
+echo 'MEMORY_START="0x40000000"
+MEMORY_END="0x80000000"
+
+DEVICE_TREE="virt-gicv3.dtb"
+XEN="xen"
+DOM0_KERNEL="Image"
+DOM0_RAMDISK="xen-rootfs.cpio.gz"
+XEN_CMD="console=dtuart dom0_mem=1024M"
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
+
+# Run the test
+rm -f smoke.serial
+set +e
+echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
+timeout -k 1 480 \
+qemu-system-aarch64 \
+    -machine virtualization=true \
+    -cpu cortex-a57 -machine type=virt \
+    -m 2048 -monitor none -serial stdio \
+    -smp 2 \
+    -no-reboot \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=binaries \
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
+
+set -e
+grep -q "Domain-0" smoke.serial || exit 1
+exit 0
-- 
2.17.1


