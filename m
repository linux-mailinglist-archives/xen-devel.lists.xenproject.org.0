Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5C164F668
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 01:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465110.723704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6LGg-0008Tn-Eg; Sat, 17 Dec 2022 00:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465110.723704; Sat, 17 Dec 2022 00:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6LGg-0008RG-C4; Sat, 17 Dec 2022 00:41:34 +0000
Received: by outflank-mailman (input) for mailman id 465110;
 Sat, 17 Dec 2022 00:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/B0D=4P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p6LGe-0008R8-Tq
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 00:41:32 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c0c0670-7da3-11ed-8fd4-01056ac49cbb;
 Sat, 17 Dec 2022 01:41:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A2CECCE1E7D;
 Sat, 17 Dec 2022 00:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3860DC433EF;
 Sat, 17 Dec 2022 00:41:23 +0000 (UTC)
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
X-Inumbo-ID: 8c0c0670-7da3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671237683;
	bh=dtdUIF91M/GxuGLfJncc0xQmhLzN754tNhXLmmzDoXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pNFkrtDyjgslZ02/5pLtQO+V9K5iBZLydGAsVdUD+TtSQXzuZ12zRMSx6H4NMyXo9
	 hrZ/PRVHwq4fOJzW3sTvE6Fz5fiZaCiBgaIS3XXg4Rv9r9VepTa/Ma3iiPV03w9GYZ
	 7oePRLZOtTUiQAa5aakduCz1/6AwAfmjlYr2y5rqgy1Xxr2UthjWZ54RQHhicL0Nh0
	 AC55+e7N7pBveOmr96zFLxL7bJkGBEQLQaRsm7dyl1lJjXokQX6sR5RzL+ccNOp3kq
	 6Q+fb8m3NZyTwYMOPCeaMYo96u1UjG/Ign17sogRwnRB4jaoXd0xtHH21JD0W1ym4A
	 kZy6PJJFTdzGA==
Date: Fri, 16 Dec 2022 16:41:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] automation: Add support for using XTF for arm64
 testing
In-Reply-To: <20221216133012.19927-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2212161641140.315094@ubuntu-linux-20-04-desktop>
References: <20221216133012.19927-1-michal.orzel@amd.com> <20221216133012.19927-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Michal Orzel wrote:
> Introduce support for using XTF on Arm to perform low-level testing.
> For the purpose of the CI testing, let's use the fork [1] from upstream
> XTF with implemented support for arm64 (the upstream XTF only supports
> x86).
> 
> Add a new script under automation/scripts to be used by the CI XTF test
> jobs to perform the following tasks:
>  - Compiling XTF,
>  - Generating u-boot script using ImageBuilder,
>  - Running Xen with XTF as domU in pure dom0less configuration using Qemu,
>  - Checking test result.
> 
> The script takes the name of the XTF test to run as a first parameter.
> 
> [1] https://gitlab.com/xen-project/fusa/xtf.git (branch xtf-arm)
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - run XTF in pure dom0less configuration
> ---
>  automation/scripts/qemu-xtf-dom0less-arm64.sh | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh
> 
> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> new file mode 100755
> index 000000000000..3ec9cf74e129
> --- /dev/null
> +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> @@ -0,0 +1,68 @@
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
> +# ImageBuilder
> +echo 'MEMORY_START="0x40000000"
> +MEMORY_END="0xC0000000"
> +
> +XEN="xen"
> +DEVICE_TREE="virt-gicv2.dtb"
> +
> +XEN_CMD="console=dtuart"
> +
> +DOMU_KERNEL[0]="xtf-test"
> +DOMU_MEM[0]="128"
> +
> +NUM_DOMUS=1
> +
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
> +timeout -k 1 120 \
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
> +(grep -q "${passed}" smoke.serial) || exit 1
> +exit 0
> -- 
> 2.25.1
> 

