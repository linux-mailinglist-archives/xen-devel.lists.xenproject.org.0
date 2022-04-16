Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D02503204
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 02:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306000.521192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfW7h-0005uE-Gb; Sat, 16 Apr 2022 00:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306000.521192; Sat, 16 Apr 2022 00:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfW7h-0005ra-DL; Sat, 16 Apr 2022 00:17:09 +0000
Received: by outflank-mailman (input) for mailman id 306000;
 Sat, 16 Apr 2022 00:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijIa=U2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfW7f-0005ZY-Cb
 for xen-devel@lists.xenproject.org; Sat, 16 Apr 2022 00:17:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b9d9499-bd1a-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 02:17:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB975622B5;
 Sat, 16 Apr 2022 00:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EF4C385AA;
 Sat, 16 Apr 2022 00:17:03 +0000 (UTC)
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
X-Inumbo-ID: 8b9d9499-bd1a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650068224;
	bh=5Np3QJHz98DXqqQOyVt/bJUStMP1ux42too3httshOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GGk7FQPBX78Jy0zC06YkRYQgkHl9X/VVXm+j0zZ2rZe+BV+MmKI/biyTEhjWXfpOS
	 Xndf4vO3MYl2m/j7zpMziN+kqMMAkiBTrTNef7CekW46i27Pl1sNIKyftQstAkHk81
	 e0aMUkbydtno06j0vP0kn9L6ETZDkn4JyHP5chGPegLutjvVXPskHYmmoM/XSjuBbG
	 s7Kj1zo62eeNFxA4EwXEs722OxlHSkzSZ5E5yGhTyYxdmps3KlNKSE7H7HnaLyNP3l
	 QaIYXH9DjB+J2f6tSMEo+mxgBeR9rfh0jIBbxwgj+wzMeqQymOP0z4EcQCBpKWeTfc
	 4EceshJB3s+2w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	bertrand.marquis@arm.com,
	michal.orzel@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
Date: Fri, 15 Apr 2022 17:17:01 -0700
Message-Id: <20220416001701.1301324-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2204151715100.915916@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204151715100.915916@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
the test-artifacts qemu container. The minimal test simply boots Xen
(built from previous build stages) and Dom0.

The test needs a working kernel and minimal initrd for dom0. Instead of
building our own kernel and initrd, which would mean maintaining one or
two more builting scripts under automation/, we borrow a kernel and
initrd from distros.

For the kernel we pick the Debian Bullseye kernel, which has everything
we need already built-in. However, we cannot use the Debian Bullseye
initrd because it is 22MB and the large size causes QEMU to core dump.

Instead, use the tiny busybox-based rootfs provided by Alpine Linux,
which is really minimal: just 2.5MB. Note that we cannot use the Alpine
Linux kernel because that doesn't boot on Xen.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v5:
- use "virt" machine in QEMU
- remove init= option

Changes in v4:
- improve commit message
- use Debian Bullseye kernel
- use Alpine Linux initrd

---
 automation/gitlab-ci/test.yaml         | 23 ++++++++
 automation/scripts/qemu-smoke-arm32.sh | 81 ++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-arm32.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ec2a2e1607..42cd725a12 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -95,6 +95,29 @@ qemu-smoke-arm64-gcc:
     - /^coverity-tested\/.*/
     - /^stable-.*/
 
+qemu-smoke-arm32-gcc:
+  stage: test
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+  dependencies:
+    - debian-unstable-gcc-arm32
+    - qemu-system-aarch64-6.0.0-arm32-export
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
 qemu-smoke-x86-64-gcc:
   stage: test
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
new file mode 100755
index 0000000000..15e6f46ce9
--- /dev/null
+++ b/automation/scripts/qemu-smoke-arm32.sh
@@ -0,0 +1,81 @@
+#!/bin/bash
+
+set -ex
+
+export DEBIAN_FRONTENT=noninteractive
+apt-get -qy update
+apt-get -qy install --no-install-recommends device-tree-compiler \
+                                            curl \
+                                            cpio
+
+cd binaries
+# Use the kernel from Debian
+curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+# Use a tiny initrd based on busybox from Alpine Linux
+curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
+
+mkdir rootfs
+cd rootfs
+tar xvzf ../initrd.tar.gz
+find . | cpio -H newc -o | gzip > ../initrd.gz
+cd ..
+
+kernel=`stat -L --printf="%s" vmlinuz`
+initrd=`stat -L --printf="%s" initrd.gz`
+
+# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./qemu-system-arm \
+   -machine virt \
+   -machine virtualization=true \
+   -smp 4 \
+   -m 1024 \
+   -serial stdio \
+   -monitor none \
+   -display none \
+   -machine dumpdtb=virt.dtb
+
+dtc -I dtb -O dts virt.dtb > virt.dts
+
+cat >> virt.dts << EOF
+/ {
+	chosen {
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		stdout-path = "/pl011@9000000";
+        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=512M bootscrub=0";
+		xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh";
+		dom0 {
+			compatible = "xen,linux-zimage", "xen,multiboot-module";
+			reg = <0x0 0x1000000 0x0 $kernel>;
+		};
+        dom0-ramdisk {
+			compatible = "xen,linux-initrd", "xen,multiboot-module";
+			reg = <0x0 0x3200000 0x0 $initrd>;
+		};
+	};
+};
+EOF
+dtc -I dts -O dtb virt.dts > virt.dtb
+
+rm -f smoke.serial
+set +e
+timeout -k 1 240 \
+./qemu-system-arm \
+   -machine virt-6.0 \
+   -machine virtualization=true \
+   -smp 4 \
+   -m 1024 \
+   -serial stdio \
+   -monitor none \
+   -display none \
+   -dtb virt.dtb \
+   -no-reboot \
+   -kernel ./xen \
+   -device loader,file=./vmlinuz,addr=0x1000000 \
+   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
+
+set -e
+(grep -q "^/ #" smoke.serial) || exit 1
+exit 0
-- 
2.25.1


