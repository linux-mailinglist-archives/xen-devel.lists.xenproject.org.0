Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6198695569
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 01:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494912.765097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRjJk-000185-C0; Tue, 14 Feb 2023 00:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494912.765097; Tue, 14 Feb 2023 00:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRjJk-00015H-8s; Tue, 14 Feb 2023 00:37:08 +0000
Received: by outflank-mailman (input) for mailman id 494912;
 Tue, 14 Feb 2023 00:37:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pRjJj-00015B-Al
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 00:37:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3a7f48b-abff-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 01:37:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7023161321;
 Tue, 14 Feb 2023 00:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C52CC433D2;
 Tue, 14 Feb 2023 00:37:02 +0000 (UTC)
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
X-Inumbo-ID: b3a7f48b-abff-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676335022;
	bh=LWVgxA7660QhgQ8LMcPb/3gR9GHrpFJkhANiNSl2mZA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OyXMt5a5Z7P5DCLJrVfIAVtuu+TJI0bSWPsPOB97eS8enk+E/oawakZxz7HJwvL6l
	 kXZcKf9bbYGLLm2hxPCQHaOQ51y2V+mKHjI3xZ2xtL/pppd59ep7AgHAf0n61E0UGa
	 4eNGCJTJDatFGtXSfPENs4wh5Q24cPX9C6Vb2tMVs9uG5V6DFz+egeu+zpUewggkuU
	 qMqes7TxvQQdiOlsK+EP565QfN9sAbPTCfGyGNQNCVmYZZA286mikS40pYQ13Wt1T2
	 DxZu+jfplC8WIOzJaj+7LJ/tOlQlrhrdxH4t6OOUErv5k2kFyuzlSPQVx0YIPyhQgN
	 /0zAKkhmu90hQ==
Date: Mon, 13 Feb 2023 16:37:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] automation: Add arm32 dom0less testing
In-Reply-To: <20230213142210.11728-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302131545220.4661@ubuntu-linux-20-04-desktop>
References: <20230213142210.11728-1-michal.orzel@amd.com> <20230213142210.11728-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Feb 2023, Michal Orzel wrote:
> At the moment, we only perform a single arm32 test in our CI, checking
> whether dom0 boots successfully or not. This is mostly because we do not
> have any arm32 runners and we only execute a hypervisor only build.
> 
> In order not to leave the arm32 testing in such a poor state, add a
> script qemu-smoke-dom0less-arm32.sh to start testing true dom0less
> configuration, in which case we do not need a dom0 with a toolstack.
> 
> The script is mostly based on the one used for dom0 arm32 testing as well
> as the one used for dom0less arm64 testing. We obtain Debian Bullseye
> kernel and Alpine Linux busybox-based rootfs. Depending on the test
> variant, we prepare a test case contained within domU_check variable,
> that will be executed as part of /init script.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  automation/gitlab-ci/test.yaml                | 16 ++++
>  .../scripts/qemu-smoke-dom0less-arm32.sh      | 89 +++++++++++++++++++
>  2 files changed, 105 insertions(+)
>  create mode 100755 automation/scripts/qemu-smoke-dom0less-arm32.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index ce543ef5c0ef..84ab1fee50a4 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -210,6 +210,22 @@ qemu-smoke-dom0-arm32-gcc-debug:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug
>  
> +qemu-smoke-dom0less-arm32-gcc:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32
> +
> +qemu-smoke-dom0less-arm32-gcc-debug:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32-debug
> +
>  qemu-alpine-x86_64-gcc:
>    extends: .qemu-x86-64
>    script:
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> new file mode 100755
> index 000000000000..c81529cbbfd0
> --- /dev/null
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -0,0 +1,89 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +test_variant=$1
> +
> +cd binaries
> +# Use the kernel from Debian
> +curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
> +# Use a tiny initrd based on busybox from Alpine Linux
> +curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
> +
> +if [ -z "${test_variant}" ]; then
> +    passed="generic test passed"
> +    domU_check="
> +echo \"${passed}\"
> +"
> +fi
> +
> +# domU rootfs
> +mkdir rootfs
> +cd rootfs
> +tar xvzf ../initrd.tar.gz
> +echo "#!/bin/sh
> +
> +mount -t proc proc /proc
> +mount -t sysfs sysfs /sys
> +mount -t devtmpfs devtmpfs /dev
> +${domU_check}
> +/bin/sh" > init
> +chmod +x init
> +find . | cpio -H newc -o | gzip > ../initrd.gz
> +cd ..
> +
> +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> +curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> +./qemu-system-arm \
> +    -machine virt \
> +    -machine virtualization=true \
> +    -smp 4 \
> +    -m 1024 \
> +    -serial stdio \
> +    -monitor none \
> +    -display none \
> +    -machine dumpdtb=virt.dtb
> +
> +# ImageBuilder
> +echo 'MEMORY_START="0x40000000"
> +MEMORY_END="0x80000000"
> +
> +DEVICE_TREE="virt.dtb"
> +XEN="xen"
> +XEN_CMD="console=dtuart bootscrub=0"
> +
> +DOMU_KERNEL[0]="vmlinuz"
> +DOMU_RAMDISK[0]="initrd.gz"
> +DOMU_MEM[0]="512"
> +NUM_DOMUS=1

Since we are at it I would prefer to create both dom0 and a domU to make
the test more interesting. The following works on gitlab-ci on top of
this patch. Would you be up for adding it to this patch?


diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index b420ee444f..6e85bca21c 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -60,7 +60,7 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
     -machine virt \
     -machine virtualization=true \
     -smp 4 \
-    -m 1024 \
+    -m 2048 \
     -serial stdio \
     -monitor none \
     -display none \
@@ -68,11 +68,14 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 
 # ImageBuilder
 echo 'MEMORY_START="0x40000000"
-MEMORY_END="0x80000000"
+MEMORY_END="0xC0000000"
 
 DEVICE_TREE="virt.dtb"
 XEN="xen"
-XEN_CMD="console=dtuart bootscrub=0"
+DOM0_KERNEL="vmlinuz"
+DOM0_RAMDISK="initrd.gz"
+DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
+XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
 
 DOMU_KERNEL[0]="vmlinuz"
 DOMU_RAMDISK[0]="initrd.gz"
@@ -105,7 +108,7 @@ timeout -k 1 240 \
     -machine virt \
     -machine virtualization=true \
     -smp 4 \
-    -m 1024 \
+    -m 2048 \
     -serial stdio \
     -monitor none \
     -display none \

