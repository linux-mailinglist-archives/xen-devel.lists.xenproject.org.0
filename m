Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF01436E03
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 01:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214625.373268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdhD8-0008Bp-Ib; Thu, 21 Oct 2021 23:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214625.373268; Thu, 21 Oct 2021 23:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdhD8-00088E-EB; Thu, 21 Oct 2021 23:10:58 +0000
Received: by outflank-mailman (input) for mailman id 214625;
 Thu, 21 Oct 2021 23:10:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FXrv=PJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mdhD6-0007Xm-O5
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 23:10:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c94a67ca-c12f-450b-964a-6adb2a594ca5;
 Thu, 21 Oct 2021 23:10:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54A6561373;
 Thu, 21 Oct 2021 23:10:51 +0000 (UTC)
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
X-Inumbo-ID: c94a67ca-c12f-450b-964a-6adb2a594ca5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634857851;
	bh=YswbYpMZWjEYIwFrC7BrzOxPcxKPcBIQvyXpCeVmPQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q9hclV/CKlksJd4GBd67fnd34oGL+eafXlZ6ngGV3UNBZXAe6kI5Ngm0IbtL42d7o
	 ej2k/qoOnFC3tlWiweDe138r+PXxiiaFvC8hNN+GtvNFoIkjBBJ2Ypqyhhr5mpT4c7
	 FnKFMVav+hH72/iLbN2IlkSidEZNgQyPZEzxi1tPfAgshwHbhs8iRS9ZyRBK8oN5L4
	 TKyKn4s0gSK1gl3nyQr0v6PRpOOAgV0dDUB2pS2ZwEOMFi+FRUyZgbpIEbtyvpAxkX
	 GI/Nw8eMwgq0znpv2WPm/ZXlCud9OiuJs6u73g+ZW/kGrrYZjSzHz7DKroWZvKSmx5
	 xIQsUCKFIt0Dg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	iwj@xenproject.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 3/3] automation: add a QEMU based x86_64 Dom0/DomU test
Date: Thu, 21 Oct 2021 16:08:39 -0700
Message-Id: <20211021230839.10794-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Introduce a test based on QEMU to run Xen, Dom0 and start a DomU.
This is similar to the existing qemu-alpine-arm64.sh script and test.
The only differences are:
- use Debian's qemu-system-x86_64 (on ARM we build our own)
- use ipxe instead of u-boot and ImageBuilder

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/test.yaml           | 24 +++++++
 automation/scripts/qemu-alpine-x86_64.sh | 92 ++++++++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 automation/scripts/qemu-alpine-x86_64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 91a10febbf..c1d67ec4b5 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -47,6 +47,30 @@ qemu-alpine-arm64-gcc:
     - /^coverity-tested\/.*/
     - /^stable-.*/
 
+qemu-alpine-x86_64-gcc:
+  stage: test
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  variables:
+    CONTAINER: debian:unstable
+  script:
+    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee qemu-smoke-arm64.log
+  dependencies:
+    - alpine-3.12-gcc
+    - alpine-3.12-rootfs-export
+    - kernel-5.10.74-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - x86_64
+  except:
+    - master
+    - smoke
+    - /^coverity-tested\/.*/
+    - /^stable-.*/
+
 qemu-smoke-arm64-gcc:
   stage: test
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
new file mode 100644
index 0000000000..41b05210d6
--- /dev/null
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -0,0 +1,92 @@
+#!/bin/bash
+
+set -ex
+
+apt-get -qy update
+apt-get -qy install --no-install-recommends qemu-system-x86 \
+                                            cpio \
+                                            curl \
+                                            busybox-static
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
+cp ../bzImage ./root
+echo "name=\"test\"
+memory=512
+vcpus=1
+kernel=\"/root/bzImage\"
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
+cat >> binaries/pxelinux.0 <<- EOF
+#!ipxe
+
+kernel xen console=com1
+module bzImage console=hvc0
+module xen-rootfs.cpio.gz
+boot
+EOF
+
+# Run the test
+rm -f smoke.serial
+set +e
+timeout -k 1 720 \
+qemu-system-x86_64 \
+    -cpu qemu64,+svm \
+    -m 2G -smp 2 \
+    -monitor none -serial stdio \
+    -nographic \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& tee smoke.serial
+
+set -e
+(grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
+exit 0
-- 
2.17.1


