Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0974E50939F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 01:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309671.526082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhJnF-0007Gj-J8; Wed, 20 Apr 2022 23:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309671.526082; Wed, 20 Apr 2022 23:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhJnF-0007EW-FE; Wed, 20 Apr 2022 23:31:29 +0000
Received: by outflank-mailman (input) for mailman id 309671;
 Wed, 20 Apr 2022 23:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhJnD-0007EQ-It
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 23:31:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdf57b20-c101-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 01:31:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3D1061B14;
 Wed, 20 Apr 2022 23:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FD4C385A0;
 Wed, 20 Apr 2022 23:31:22 +0000 (UTC)
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
X-Inumbo-ID: fdf57b20-c101-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650497483;
	bh=4qwbtgRQoC2otELmI9XE6FDW8+VhxpRDQPma0JXMSEo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a/7+aj1Zwm92G2Xz1K2PTRVfDTRy+aU6JnfXkBaq0obi8vHZnVTfTmfDOUvnFaDOY
	 aHs+NzzjSyazeRW+CnJWQFMrkQ7iTTg44sx/QNm1Sm4P9qVUTgw8HkE/UuJrtnxLpP
	 a2kdPGwL7/205/S5CdnWtFmlGcdPVe/jkx597I1xpMlFiCQ2LdMLp/cDZgwdWZEKup
	 MWWeO7sdCUleUR4lpR5/yBAUctNCWET7WTJkp0cPe4hJzZxBgKXfBK0yC5+0OZ5Cc4
	 wHGmF3mVIVCD7EA7uj1DErctx4EYS2HOn5SjwFjoiprIjMWtxVWCmfhs1/tAUUXdiQ
	 eKjjsxbyW2Oqw==
Date: Wed, 20 Apr 2022 16:31:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
In-Reply-To: <6e01871e-9e47-2d92-617e-952dde2df3b2@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204201630330.915916@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204151715100.915916@ubuntu-linux-20-04-desktop> <20220416001701.1301324-2-sstabellini@kernel.org> <6e01871e-9e47-2d92-617e-952dde2df3b2@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Apr 2022, Michal Orzel wrote:
> On 16.04.2022 02:17, Stefano Stabellini wrote:
> > Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
> > the test-artifacts qemu container. The minimal test simply boots Xen
> > (built from previous build stages) and Dom0.
> > 
> > The test needs a working kernel and minimal initrd for dom0. Instead of
> > building our own kernel and initrd, which would mean maintaining one or
> > two more builting scripts under automation/, we borrow a kernel and
> > initrd from distros.
> > 
> > For the kernel we pick the Debian Bullseye kernel, which has everything
> > we need already built-in. However, we cannot use the Debian Bullseye
> > initrd because it is 22MB and the large size causes QEMU to core dump.
> > 
> > Instead, use the tiny busybox-based rootfs provided by Alpine Linux,
> > which is really minimal: just 2.5MB. Note that we cannot use the Alpine
> > Linux kernel because that doesn't boot on Xen.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> > Changes in v5:
> > - use "virt" machine in QEMU
> 
> > +# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
> > +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> > +curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> > +./qemu-system-arm \
> > +   -machine virt \
> You changed machine to virt here, but ...
> 
> > +rm -f smoke.serial
> > +set +e
> > +timeout -k 1 240 \
> > +./qemu-system-arm \
> > +   -machine virt-6.0 \
> forgot to change it here as well.

Oops, yes I did. Well spotted. Just sending this one update here.


---
gitlab-ci: add an ARM32 qemu-based smoke test

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
Changes:
- use virt machine instead of virt-6.0 at both call sites
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
index 0000000000..530f3892fd
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
+   -machine virt \
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


