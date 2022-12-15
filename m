Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B844B64E2C3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 22:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463866.722141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5vQE-0005K5-5v; Thu, 15 Dec 2022 21:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463866.722141; Thu, 15 Dec 2022 21:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5vQE-0005Gx-2V; Thu, 15 Dec 2022 21:05:42 +0000
Received: by outflank-mailman (input) for mailman id 463866;
 Thu, 15 Dec 2022 21:05:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fpb=4N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p5vQC-0005Gr-Vv
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 21:05:40 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 397464c7-7cbc-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 22:05:39 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BFC63CE1D06;
 Thu, 15 Dec 2022 21:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6906EC433EF;
 Thu, 15 Dec 2022 21:05:31 +0000 (UTC)
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
X-Inumbo-ID: 397464c7-7cbc-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671138332;
	bh=K1eTSOpSWhtWY/Ssybt1T4cbBFtqhejOC+GUowQHZIw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j9hUXUMinQZvlWe6kFaZSOVGpN9h5h4pTrT8wrGrtfPqfJIzBX8CtK3WndMSPj2Sq
	 asEjrXzggKLCkOWQp2RaWeeSAmjFma8FSSGn0lmeMi7eJy4V/pphBqgCDsjn0BNSfC
	 C3vryxYxCqqPpPEO3fNIBr6ulScjZUgWHkBICKehjoKi/OFN0QKgPKgJrTZvg9dYsh
	 pwzUaQ2a2B86qvLmLJ7aSVlk57fBySc1qNj00DP2/vQHb33kk8dRk9RR8YfFQA80cP
	 H3tdSIUKmnC6kMh3ZX/ymZI+Fe6vYaRT8Gb6RMduAlfe1TcfT5XnoriMVx7FC6ye/K
	 dRef4ay5JG8Cw==
Date: Thu, 15 Dec 2022 13:05:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] automation: Add support for using XTF for arm64
 testing
In-Reply-To: <20221215152538.10266-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2212151303150.315094@ubuntu-linux-20-04-desktop>
References: <20221215152538.10266-1-michal.orzel@amd.com> <20221215152538.10266-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Dec 2022, Michal Orzel wrote:
> Introduce support for using XTF on Arm to perform low-level testing.
> For the purpose of the CI testing, let's use the fork [1] from upstream
> XTF with implemented support for arm64 (the upstream XTF only supports
> x86).
> 
> Add a new script under automation/scripts to be used by the CI XTF test
> jobs to perform the following tasks:
>  - Compiling XTF,
>  - Creating dom0 rootfs,
>  - Generating u-boot script using ImageBuilder,
>  - Running Xen with Linux as dom0 and XTF as a dom0less domU using Qemu,
>  - Checking test result.
> 
> The script takes the name of the XTF test to run as a first parameter.
> 
> [1] https://gitlab.com/xen-project/fusa/xtf.git (branch xtf-arm)
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  automation/scripts/qemu-xtf-dom0less-arm64.sh | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh
> 
> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> new file mode 100755
> index 000000000000..321d1abc543b
> --- /dev/null
> +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> @@ -0,0 +1,97 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +# Name of the XTF test
> +xtf_test=$1
> +
> +# Message returned by XTF in case of success
> +passed="Test result: SUCCESS"
> +
> +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> +curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> +./binaries/qemu-system-aarch64 \
> +   -machine virtualization=true \
> +   -cpu cortex-a57 -machine type=virt \
> +   -m 2048 -smp 2 -display none \
> +   -machine dumpdtb=binaries/virt-gicv2.dtb
> +
> +# XXX disable pl061 to avoid Linux crash
> +fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
> +
> +# XTF
> +# Build a single XTF test passed as a first parameter to the script.
> +# Build XTF with GICv2 support to match Qemu configuration and with SBSA UART
> +# support, so that the test will use an emulated UART for printing messages.
> +# This will allow us to run the test on both debug and non-debug Xen builds.
> +rm -rf xtf
> +git clone https://gitlab.com/xen-project/fusa/xtf.git -b xtf-arm
> +make -C xtf TESTS=tests/${xtf_test} CONFIG_SBSA_UART=y CONFIG_GICV2=y -j$(nproc)
> +cp xtf/tests/${xtf_test}/test-mmu64le-${xtf_test} binaries/xtf-test
> +
> +# DOM0 rootfs

Given that we don't actually need dom0 for anything, maybe we could only
run xtf as the only domU guest without dom0 (pure dom0less
configuration)?


> +mkdir -p rootfs
> +cd rootfs
> +tar xzf ../binaries/initrd.tar.gz
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +cp -ar ../binaries/dist/install/* .
> +
> +echo "#!/bin/bash
> +
> +export LD_LIBRARY_PATH=/usr/local/lib
> +bash /etc/init.d/xencommons start
> +
> +/usr/local/lib/xen/bin/init-dom0less
> +" > etc/local.d/xen.start
> +
> +chmod +x etc/local.d/xen.start
> +echo "rc_verbose=yes" >> etc/rc.conf
> +find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
> +cd ..
> +
> +# ImageBuilder
> +echo 'MEMORY_START="0x40000000"
> +MEMORY_END="0xC0000000"
> +
> +XEN="xen"
> +DEVICE_TREE="virt-gicv2.dtb"
> +
> +DOM0_KERNEL="Image"
> +DOM0_RAMDISK="dom0-rootfs.cpio.gz"

So here we would skip DOM0_KERNEL and DOM0_RAMDISK


> +XEN_CMD="console=dtuart dom0_mem=512M"

we probably don't need dom0_mem=512M


> +DOMU_KERNEL[0]="xtf-test"
> +DOMU_MEM[0]="128"
> +
> +NUM_DOMUS=1

but we would keep this


> +LOAD_CMD="tftpb"
> +UBOOT_SOURCE="boot.source"
> +UBOOT_SCRIPT="boot.scr"' > binaries/config
> +
> +rm -rf imagebuilder
> +git clone https://gitlab.com/ViryaOS/imagebuilder
> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
> +
> +# Run the test
> +rm -f smoke.serial
> +set +e
> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
> +timeout -k 1 240 \
> +./binaries/qemu-system-aarch64 \
> +    -machine virtualization=true \
> +    -cpu cortex-a57 -machine type=virt \
> +    -m 2048 -monitor none -serial stdio \
> +    -smp 2 \
> +    -no-reboot \
> +    -device virtio-net-pci,netdev=n0 \
> +    -netdev user,id=n0,tftp=binaries \
> +    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
> +
> +set -e
> +(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
> +exit 0


