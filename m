Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67BCA91005
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 02:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956804.1350078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5CsI-0004PK-M4; Thu, 17 Apr 2025 00:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956804.1350078; Thu, 17 Apr 2025 00:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5CsI-0004MX-Iq; Thu, 17 Apr 2025 00:13:02 +0000
Received: by outflank-mailman (input) for mailman id 956804;
 Thu, 17 Apr 2025 00:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/Gg=XD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5CsG-0003ou-Vq
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 00:13:00 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7b33565-1b20-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 02:12:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BE47CA4A89F;
 Thu, 17 Apr 2025 00:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5643C4CEE2;
 Thu, 17 Apr 2025 00:12:56 +0000 (UTC)
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
X-Inumbo-ID: b7b33565-1b20-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744848777;
	bh=fJNiutQwGsP+RNhQ825h+2UvIOHcYDGIAVKHUGqHkYE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tHCfNp1+WadDHCK1jrRTmWmf9oMaWOLwfVeHNpCGsvfPe991/rDbXu+1VGTa1JzjE
	 vbtSX65YBhr4q8Zb5CuRYx0k5/NT4fwK1OWQOWxdO9z2yE7WG7wu+lgOOclMfaEQNd
	 kPxPqVzstzX0pE/6x1jnlvtvPrmQLMWijC5nfvI+0G1ttYZJ9ktFyz5iQrbtheiP8d
	 /ZbLarsynkdFj6MtHtxVMezrItgWBRPSdKZ8tbTmsjhTkWCealJ40hrnKnYDuV7gCD
	 uEmjSZRZ44lBdM1zY4uT5LYUpS8+lE4hIVbW7khicnsz3gTXxD+N/zGKHQP1qhHo2o
	 X/CQ5GXF2yRbA==
Date: Wed, 16 Apr 2025 17:12:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 3/4] CI: switch arm64 XTF test runner to qemu-xtf.sh
In-Reply-To: <20250416053213.921444-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504161641250.8008@ubuntu-linux-20-04-desktop>
References: <20250416053213.921444-1-dmukhin@ford.com> <20250416053213.921444-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Hook arm64 QEMU configuration to qemu-xtf.sh and use new script in arm64 CI
> jobs.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml                |  4 +-
>  automation/scripts/.gitignore                 |  3 +
>  .../scripts/include/configs/xtf-arm64-config  |  2 +
>  automation/scripts/include/xtf-arm64          | 81 +++++++++++++++++++
>  automation/scripts/qemu-xtf-dom0less-arm64.sh | 68 ----------------
>  5 files changed, 88 insertions(+), 70 deletions(-)
>  create mode 100644 automation/scripts/include/configs/xtf-arm64-config
>  create mode 100644 automation/scripts/include/xtf-arm64
>  delete mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index ca1e4eb528..d6e4a0a622 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -571,7 +571,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
>  qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
>    needs:
>      - alpine-3.18-gcc-arm64
>      - qemu-system-aarch64-6.0.0-arm64-export
> @@ -579,7 +579,7 @@ qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
>  qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
>    needs:
>      - alpine-3.18-gcc-debug-arm64
>      - qemu-system-aarch64-6.0.0-arm64-export
> diff --git a/automation/scripts/.gitignore b/automation/scripts/.gitignore
> index 2f2d6e1ebd..f853da4d89 100644
> --- a/automation/scripts/.gitignore
> +++ b/automation/scripts/.gitignore
> @@ -1,6 +1,9 @@
>  !include
>  
>  binaries
> +imagebuilder
>  smoke.serial
>  xen
>  xtf*/
> +
> +*.rom
> diff --git a/automation/scripts/include/configs/xtf-arm64-config b/automation/scripts/include/configs/xtf-arm64-config
> new file mode 100644
> index 0000000000..9942740927
> --- /dev/null
> +++ b/automation/scripts/include/configs/xtf-arm64-config
> @@ -0,0 +1,2 @@
> +CONFIG_GICV2=y
> +CONFIG_SBSA_UART=y
> diff --git a/automation/scripts/include/xtf-arm64 b/automation/scripts/include/xtf-arm64
> new file mode 100644
> index 0000000000..68487fe617
> --- /dev/null
> +++ b/automation/scripts/include/xtf-arm64
> @@ -0,0 +1,81 @@
> +#!/bin/bash
> +#
> +# XTF test utilities (arm64).
> +#
> +
> +# Arch-specific environment overrides.
> +function xtf_arch_prepare()
> +{
> +    export FW_PREFIX="${FW_PREFIX:-/usr/lib/u-boot/qemu_arm64/}"
> +    export QEMU_PREFIX="${QEMU_PREFIX:-${WORKDIR}/}"
> +    export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen}"
> +    export XEN_CONSOLE="${XEN_CONSOLE:-dtuart}"
> +    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-xtf-arm}"
> +    export XTF_SRC_URI="${XTF_SRC_URI:-https://gitlab.com/xen-project/fusa/xtf.git}"
> +    export XTF_SRC_VARIANTS="mmu64le"
> +}
> +
> +# Perform arch-specific XTF environment setup.
> +function xtf_arch_setup()
> +{
> +    # QEMU looks for "efi-virtio.rom" even if it is unneeded
> +    curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> +
> +    # Crude check for local testing
> +    if [ ! -d imagebuilder/.git ]; then
> +        git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
> +    fi
> +
> +    cat > ${WORKDIR}/config <<EOF
> +MEMORY_START="0x40000000"
> +MEMORY_END="0xC0000000"
> +
> +XEN="xen"
> +DEVICE_TREE="virt-gicv2.dtb"
> +
> +XEN_CMD="${XEN_CMDLINE}"
> +
> +DOMU_KERNEL[0]="xtf-test"
> +DOMU_MEM[0]="128"
> +
> +NUM_DOMUS=1
> +
> +LOAD_CMD="tftpb"
> +UBOOT_SOURCE="boot.source"
> +UBOOT_SCRIPT="boot.scr"
> +EOF
> +    cp ${XTF_BINARY} ${WORKDIR}/xtf-test
> +
> +    # Generate virt-gicv2.dtb
> +    ${WORKDIR}/qemu-system-aarch64 \
> +        -machine virtualization=true \
> +        -cpu cortex-a57 \
> +        -machine type=virt \
> +        -m 2048 \
> +        -smp 2 \
> +        -display none \
> +        -machine dumpdtb=${WORKDIR}/virt-gicv2.dtb
> +
> +    # Generate U-Boot environment
> +    bash -x imagebuilder/scripts/uboot-script-gen \
> +        -t tftp \
> +        -d ${WORKDIR}/ \
> +        -c ${WORKDIR}/config
> +
> +    export TEST_CMD="${QEMU_PREFIX}qemu-system-aarch64 \
> +        -machine virtualization=true \
> +        -cpu cortex-a57 \
> +        -machine type=virt \
> +        -no-reboot \
> +        -nographic \
> +        -monitor none \
> +        -serial stdio \
> +        -m 2048 \
> +        -smp 2 \
> +        -device virtio-net-pci,netdev=n0 \
> +        -netdev user,id=n0,tftp=${WORKDIR} \
> +        -bios ${FW_PREFIX}u-boot.bin \
> +    "
> +
> +    export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
> +}
> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> deleted file mode 100755
> index 436f460c3c..0000000000
> --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -#!/bin/bash
> -
> -set -ex -o pipefail
> -
> -# Name of the XTF test
> -xtf_test=$1
> -
> -# Message returned by XTF in case of success
> -passed="Test result: SUCCESS"
> -
> -# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> -curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> -./binaries/qemu-system-aarch64 \
> -   -machine virtualization=true \
> -   -cpu cortex-a57 -machine type=virt \
> -   -m 2048 -smp 2 -display none \
> -   -machine dumpdtb=binaries/virt-gicv2.dtb
> -
> -# XTF
> -# Build a single XTF test passed as a first parameter to the script.
> -# Build XTF with GICv2 support to match Qemu configuration and with SBSA UART
> -# support, so that the test will use an emulated UART for printing messages.
> -# This will allow us to run the test on both debug and non-debug Xen builds.
> -rm -rf xtf
> -git clone https://gitlab.com/xen-project/fusa/xtf.git -b xtf-arm
> -make -C xtf TESTS=tests/${xtf_test} CONFIG_SBSA_UART=y CONFIG_GICV2=y -j$(nproc)
> -cp xtf/tests/${xtf_test}/test-mmu64le-${xtf_test} binaries/xtf-test
> -
> -# ImageBuilder
> -echo 'MEMORY_START="0x40000000"
> -MEMORY_END="0xC0000000"
> -
> -XEN="xen"
> -DEVICE_TREE="virt-gicv2.dtb"
> -
> -XEN_CMD="console=dtuart console_timestamps=boot"
> -
> -DOMU_KERNEL[0]="xtf-test"
> -DOMU_MEM[0]="128"
> -
> -NUM_DOMUS=1
> -
> -LOAD_CMD="tftpb"
> -UBOOT_SOURCE="boot.source"
> -UBOOT_SCRIPT="boot.scr"' > binaries/config
> -
> -rm -rf imagebuilder
> -git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
> -bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
> -
> -# Run the test
> -rm -f smoke.serial
> -export TEST_CMD="./binaries/qemu-system-aarch64 \
> -    -machine virtualization=true \
> -    -cpu cortex-a57 -machine type=virt \
> -    -m 2048 -monitor none -serial stdio \
> -    -smp 2 \
> -    -no-reboot \
> -    -device virtio-net-pci,netdev=n0 \
> -    -netdev user,id=n0,tftp=binaries \
> -    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
> -
> -export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
> -export BOOT_MSG="Latest ChangeSet: "
> -export TEST_LOG="smoke.serial"
> -export PASSED="${passed}"
> -
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> -- 
> 2.34.1
> 
> 

