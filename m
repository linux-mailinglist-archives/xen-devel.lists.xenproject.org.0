Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89D6971BC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 00:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495605.765962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4bs-00041A-Pk; Tue, 14 Feb 2023 23:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495605.765962; Tue, 14 Feb 2023 23:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4bs-0003yT-Lq; Tue, 14 Feb 2023 23:21:16 +0000
Received: by outflank-mailman (input) for mailman id 495605;
 Tue, 14 Feb 2023 23:21:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS4br-0003yL-Rx
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 23:21:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44ab93bb-acbe-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 00:21:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB10561927;
 Tue, 14 Feb 2023 23:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F596C433EF;
 Tue, 14 Feb 2023 23:21:09 +0000 (UTC)
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
X-Inumbo-ID: 44ab93bb-acbe-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676416870;
	bh=0qqE7oiJV/VyZ7TSj9Pra0jyKRbtVA+Pd9pms+lpVMM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fRrQG7Xqqa3XU9mspn0ZN+h+2RR6hhaZwyROIfQjBd9zelEIRlxuglRflP7129R6m
	 IbuFfz0bp4C/bmG4H70pzP2/+oF6uMMjF/8AG20VdnaHTeM7Pt4Gg/JZchdEugGf3p
	 GXtWA1vKllnooh5J1biZCXOO97kW+Y5+Njh0iRIzlVtWMCFNC/RZB8amskBogLwpkz
	 Buyr1t3rXmqNAUGc44vhaDwk27heG8MO2eHBXq4+PkhNJiErWn8Jr/xRmUtX99iQfr
	 N/XvNrYYwk9qkGOVHxN2XWr7wmpxJnclBUtngJLG/sNhpQT/RJmUQoDE3eVJXyO+hM
	 k+mOCA3MfGwQA==
Date: Tue, 14 Feb 2023 15:21:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/5] automation: Add arm32 dom0less testing
In-Reply-To: <20230214153842.15637-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302141520480.2025117@ubuntu-linux-20-04-desktop>
References: <20230214153842.15637-1-michal.orzel@amd.com> <20230214153842.15637-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Feb 2023, Michal Orzel wrote:
> At the moment, we only perform a single arm32 test in our CI, checking
> whether dom0 boots successfully or not. This is mostly because we do not
> have any arm32 runners and we only execute a hypervisor only build.
> 
> In order not to leave the arm32 testing in such a poor state, add a
> script qemu-smoke-dom0less-arm32.sh to start testing dom0less
> configuration, while keeping dom0 to make the test more interesting.
> 
> The script is mostly based on the one used for dom0 arm32 testing as well
> as the one used for dom0less arm64 testing. We obtain Debian Bullseye
> kernel and Alpine Linux busybox-based rootfs. Depending on the test
> variant, we prepare a test case contained within domU_check variable,
> that will be executed as part of /init script from domU rootfs.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - keep dom0 around by default to make tests more interesting
> ---
>  automation/gitlab-ci/test.yaml                | 16 +++
>  .../scripts/qemu-smoke-dom0less-arm32.sh      | 99 +++++++++++++++++++
>  2 files changed, 115 insertions(+)
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
> index 000000000000..e3f2b28f3f89
> --- /dev/null
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -0,0 +1,99 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +test_variant=$1
> +
> +# Prompt to grep for to check if dom0 booted successfully
> +dom0_prompt="^/ #"
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
> +# dom0/domU rootfs
> +# We are using the same rootfs for dom0 and domU. The only difference is
> +# that for the former, we set explictly rdinit to /bin/sh, whereas for the
> +# latter we rely on using custom /init script with test case inside.
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
> +    -m 2048 \
> +    -serial stdio \
> +    -monitor none \
> +    -display none \
> +    -machine dumpdtb=virt.dtb
> +
> +# ImageBuilder
> +echo 'MEMORY_START="0x40000000"
> +MEMORY_END="0xC0000000"
> +
> +DEVICE_TREE="virt.dtb"
> +XEN="xen"
> +XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
> +
> +DOM0_KERNEL="vmlinuz"
> +DOM0_RAMDISK="initrd.gz"
> +DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
> +
> +DOMU_KERNEL[0]="vmlinuz"
> +DOMU_RAMDISK[0]="initrd.gz"
> +DOMU_MEM[0]="512"
> +NUM_DOMUS=1
> +
> +LOAD_CMD="tftpb"
> +BOOT_CMD="bootm"
> +UBOOT_SOURCE="boot.source"
> +UBOOT_SCRIPT="boot.scr"' > config
> +
> +rm -rf imagebuilder
> +git clone https://gitlab.com/ViryaOS/imagebuilder
> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> +
> +# Run the test
> +rm -f smoke.serial
> +set +e
> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
> +timeout -k 1 240 \
> +./qemu-system-arm \
> +    -machine virt \
> +    -machine virtualization=true \
> +    -smp 4 \
> +    -m 2048 \
> +    -serial stdio \
> +    -monitor none \
> +    -display none \
> +    -no-reboot \
> +    -device virtio-net-pci,netdev=n0 \
> +    -netdev user,id=n0,tftp=./ \
> +    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
> +
> +set -e
> +(grep -q "${dom0_prompt}" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
> +exit 0
> -- 
> 2.25.1
> 

