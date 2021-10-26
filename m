Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE343A9CC
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 03:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216154.375660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBTc-0001s2-0D; Tue, 26 Oct 2021 01:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216154.375660; Tue, 26 Oct 2021 01:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBTb-0001q5-S1; Tue, 26 Oct 2021 01:42:07 +0000
Received: by outflank-mailman (input) for mailman id 216154;
 Tue, 26 Oct 2021 01:42:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zbS=PO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfBTa-0001bn-NF
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 01:42:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec74f456-35fd-11ec-8420-12813bfff9fa;
 Tue, 26 Oct 2021 01:42:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5DAB6023B;
 Tue, 26 Oct 2021 01:42:04 +0000 (UTC)
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
X-Inumbo-ID: ec74f456-35fd-11ec-8420-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635212524;
	bh=Kx4e9+ekLwMR2Kc2Ru1z1j3d1ZvwiDUM6uDgREU3a9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQO9I9XDiDnGpNsBda+yTd3vkdLZqNPvfNnSgwqna36qaZ+f+LKg4DQLLFanKyrcD
	 ssd0OHY8ffpNKINQxU9ygLzkLjF0xFIqsmzGoUwdT2jT32wFjegqkA0ebUthPRadXt
	 hISZSZQDCN40xfQicVvw5GxhN5JTalmX/igyqS8gqU6faU5Rp/r2Ie/6L3JlsEmwV9
	 vZozALXNktdKttsKTFwq8MRLF+y3/KN7tZwdpT/ANyAOFeXKte+1ZX+0fQOGCFChtx
	 G6tEvYMA5NuxeCb/p7VI/wznILWRaDzl85nKpa01h4FbEIY00aBRJWMeyWIrWnWIsz
	 zH/n/zaD1su0g==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	iwj@xenproject.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 3/3] automation: add a QEMU based x86_64 Dom0/DomU test
Date: Mon, 25 Oct 2021 18:42:00 -0700
Message-Id: <20211026014200.32102-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2110251836020.4586@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110251836020.4586@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Introduce a test based on QEMU to run Xen, Dom0 and start a DomU.
This is similar to the existing qemu-alpine-arm64.sh script and test.
The only differences are:
- use Debian's qemu-system-x86_64 (on ARM we build our own)
- use ipxe instead of u-boot and ImageBuilder

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
apt-get is not entirely removed yet as we need cpio and busybox-static.
I am in favor of keeping them as apt-get packages because they are not
needed in the build container. At the same time I see that being small
they wouldn't increase the build container by much.

Changes in v2:
- remove curl
- add comments
- add set -x
- use debian:stretch and remove qemu
---
 automation/gitlab-ci/test.yaml           | 24 ++++++
 automation/scripts/qemu-alpine-x86_64.sh | 95 ++++++++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100755 automation/scripts/qemu-alpine-x86_64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 91a10febbf..43d248a604 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -47,6 +47,30 @@ qemu-alpine-arm64-gcc:
     - /^coverity-tested\/.*/
     - /^stable-.*/
 
+qemu-alpine-x86_64-gcc:
+  stage: test
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  variables:
+    CONTAINER: debian:stretch
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
new file mode 100755
index 0000000000..2e9625109c
--- /dev/null
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -0,0 +1,95 @@
+#!/bin/bash
+
+set -ex
+
+apt-get -qy update
+apt-get -qy install --no-install-recommends cpio \
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
+# DomU rootfs
+cd initrd
+find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
+cd ..
+
+# initrd.tar.gz is Dom0 rootfs
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
+set -x
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
+# rebuild Dom0 rootfs
+find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+cd ../..
+
+cat >> binaries/pxelinux.0 << EOF
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


