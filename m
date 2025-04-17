Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930AFA91007
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 02:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956816.1350087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Cu1-0004z0-01; Thu, 17 Apr 2025 00:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956816.1350087; Thu, 17 Apr 2025 00:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Cu0-0004wc-TV; Thu, 17 Apr 2025 00:14:48 +0000
Received: by outflank-mailman (input) for mailman id 956816;
 Thu, 17 Apr 2025 00:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/Gg=XD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5Ctz-0004wS-Vq
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 00:14:47 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f749cc82-1b20-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 02:14:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 18C9968429;
 Thu, 17 Apr 2025 00:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC01C4CEE2;
 Thu, 17 Apr 2025 00:14:43 +0000 (UTC)
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
X-Inumbo-ID: f749cc82-1b20-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744848884;
	bh=sjVW7f562wFl+xQhK2Yabg1xpb+TP9q5+IJbWWRVs5o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DpTsqninCIDOQIrDithYwF1hFyJ1Py1ZAvKK91bRzshy5AR4GJC7II+AJJ63vwX8F
	 SUgSJYncVzndmtLOHfL8NWY6Y/n0INpV2LuUD/FxnHyu5Srnml1dSdIMq/2Ow9cNZL
	 dzA3n9ypMTvKOO30NkkTOjJMTacQtMrpssiU7FWGJ4SDG7x5xs60OBo7zoKgQ+u94P
	 LWEcl53vV21wJdw3UW3bfJUTMr/mSAL9CRI6HMCIU2ReWdzsWuTX9L1nYmLCQLAW3q
	 fYStgUb2SOubIWlFvqjM/KTBQP7pjJgWr3uui6snprCSvzUcnYxWsWniVoIBB8utdz
	 eQgwaBk6+/tUQ==
Date: Wed, 16 Apr 2025 17:14:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 2/4] CI: switch x86 EFI smoke test runner to
 qemu-xtf.sh
In-Reply-To: <20250416053213.921444-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504161632500.8008@ubuntu-linux-20-04-desktop>
References: <20250416053213.921444-1-dmukhin@ford.com> <20250416053213.921444-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Use qemu-xtf.sh for qemu-smoke-x86-64-gcc-efi job.
> 
> Lead time is reduced a bit since not all XTF code base is built, just the
> required test.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  automation/gitlab-ci/test.yaml                |  2 +-
>  .../include/configs/xtf-x86-64-efi-config     |  0
>  automation/scripts/include/xtf-x86-64-efi     | 52 +++++++++++++++++++
>  automation/scripts/qemu-smoke-x86-64-efi.sh   | 43 ---------------
>  4 files changed, 53 insertions(+), 44 deletions(-)
>  create mode 100644 automation/scripts/include/configs/xtf-x86-64-efi-config
>  create mode 100644 automation/scripts/include/xtf-x86-64-efi
>  delete mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 3adc841335..ca1e4eb528 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -687,7 +687,7 @@ qemu-smoke-x86-64-clang-pvh:
>  qemu-smoke-x86-64-gcc-efi:
>    extends: .qemu-smoke-x86-64
>    script:
> -    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-xtf.sh x86-64-efi hvm64 example 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-12-x86_64-gcc-debug
>  
> diff --git a/automation/scripts/include/configs/xtf-x86-64-efi-config b/automation/scripts/include/configs/xtf-x86-64-efi-config
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/automation/scripts/include/xtf-x86-64-efi b/automation/scripts/include/xtf-x86-64-efi
> new file mode 100644
> index 0000000000..79622d5a6c
> --- /dev/null
> +++ b/automation/scripts/include/xtf-x86-64-efi
> @@ -0,0 +1,52 @@
> +#!/bin/bash
> +#
> +# XTF test utilities (x86_64, EFI).
> +#
> +
> +# Arch-specific environment overrides.
> +function xtf_arch_prepare()
> +{
> +    export FW_PREFIX="${FW_PREFIX:-/usr/share/OVMF/}"
> +    export QEMU_PREFIX="${QEMU_PREFIX:-}"
> +    export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen.efi}"

Any chance we can avoid using WORKDIR? Or alternatively, we can remove
TOP? Or remove both? :-)

Maybe it is best to keep WORKDIR and remove TOP, I am not sure. I am
just trying to reduce the amount of variables used and that we depend
upon.

I assume you tested the pipeline and it worked, right?


> +    export XEN_CONSOLE="${XEN_CONSOLE:-com1}"
> +    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-master}"
> +    export XTF_SRC_URI="${XTF_SRC_URI:-https://xenbits.xen.org/git-http/xtf.git}"
> +    export XTF_SRC_VARIANTS="hvm64 pv64"
> +}
> +
> +# Perform arch-specific XTF environment setup.
> +function xtf_arch_setup()
> +{
> +    local esp_dir="${WORKDIR}/boot-esp"
> +    local efi_dir="${esp_dir}/EFI/BOOT"
> +
> +    # Generate EFI boot environment
> +    mkdir -p ${efi_dir}
> +    cp ${XEN_BINARY} ${efi_dir}/BOOTX64.EFI
> +    cp ${XTF_BINARY} ${efi_dir}/kernel
> +
> +    cat > ${efi_dir}/BOOTX64.cfg <<EOF
> +[global]
> +default=test
> +
> +[test]
> +options=${XEN_CMDLINE}
> +kernel=kernel
> +EOF
> +
> +    # NB: OVMF_CODE.fd is read-only, no need to copy
> +    cp ${FW_PREFIX}OVMF_VARS.fd ${WORKDIR}
> +
> +    export TEST_CMD="${QEMU_PREFIX}qemu-system-x86_64 \
> +        -no-reboot \
> +        -nographic \
> +        -monitor none \
> +        -serial stdio \
> +        -m 512 \
> +        -M q35,kernel-irqchip=split \
> +        -drive if=pflash,format=raw,readonly=on,file=${FW_PREFIX}OVMF_CODE.fd \
> +        -drive if=pflash,format=raw,file=${WORKDIR}/OVMF_VARS.fd \
> +        -drive file=fat:rw:${esp_dir},media=disk,index=0,format=raw \
> +    "
> +}
> diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/scripts/qemu-smoke-x86-64-efi.sh
> deleted file mode 100755
> index 7572722be6..0000000000
> --- a/automation/scripts/qemu-smoke-x86-64-efi.sh
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -#!/bin/bash
> -
> -set -ex -o pipefail
> -
> -# variant should be either pv or pvh
> -variant=$1
> -
> -# Clone and build XTF
> -git clone https://xenbits.xen.org/git-http/xtf.git
> -cd xtf && make -j$(nproc) && cd -
> -
> -case $variant in
> -    pvh) k=test-hvm64-example    extra="dom0-iommu=none dom0=pvh" ;;
> -    *)   k=test-pv64-example     extra= ;;
> -esac
> -
> -mkdir -p boot-esp/EFI/BOOT
> -cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
> -cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
> -
> -cat > boot-esp/EFI/BOOT/BOOTX64.cfg <<EOF
> -[global]
> -default=test
> -
> -[test]
> -options=loglvl=all console=com1 noreboot console_timestamps=boot $extra
> -kernel=kernel
> -EOF
> -
> -cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
> -cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
> -
> -rm -f smoke.serial
> -export TEST_CMD="qemu-system-x86_64 -nographic -M q35,kernel-irqchip=split \
> -        -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd \
> -        -drive if=pflash,format=raw,file=OVMF_VARS.fd \
> -        -drive file=fat:rw:boot-esp,media=disk,index=0,format=raw \
> -        -m 512 -monitor none -serial stdio"
> -
> -export TEST_LOG="smoke.serial"
> -export PASSED="Test result: SUCCESS"
> -
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> -- 
> 2.34.1
> 
> 

