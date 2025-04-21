Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86915A95766
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 22:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961443.1352867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xvY-000670-2x; Mon, 21 Apr 2025 20:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961443.1352867; Mon, 21 Apr 2025 20:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xvX-00063e-Vw; Mon, 21 Apr 2025 20:39:39 +0000
Received: by outflank-mailman (input) for mailman id 961443;
 Mon, 21 Apr 2025 20:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u6xvW-000634-2m
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 20:39:38 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcc5e02c-1ef0-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 22:39:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F0759A4BE06;
 Mon, 21 Apr 2025 20:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D895EC4CEE4;
 Mon, 21 Apr 2025 20:39:33 +0000 (UTC)
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
X-Inumbo-ID: bcc5e02c-1ef0-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745267974;
	bh=yVt4eZaqa9Vm8qM8LjqhbIy57iO2fl9YQeXupfdcHNQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OjTfEG7MtuQRZj96N32TDTnuaX3QQ/eXCNoj+VgTOv3Jf0MC6qhUssc4P1PM3sXHU
	 +s7SkIkIzGDk8p/oy6+RFNfNmdnbvARkykDSGXaEHkxL5q0i6CfQVLbFM/S3dtDMrT
	 gEbM1bNm0GGRsExbk7+n87JD+Oyv0aIH7kb8XIGTEi5uFy6rFwlvu2MKJEMP0Qd/tI
	 VXFYbsT+ThETuwT1ZdcUCGfDL7h6hLbf44VGeJRRpjmFWplLUCGz9Etz972sjJ0jmP
	 TARiizmzD9BSVuoYSu6iPAP8do3jPfYptYegQ9kS+c7+/V2jNHshpCrnMXdjyPeSWE
	 RwIlQ/7CidQlg==
Date: Mon, 21 Apr 2025 13:39:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2 2/4] CI: switch x86 EFI smoke test runner to
 qemu-xtf.sh
In-Reply-To: <20250419010319.2572518-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504211338190.785180@ubuntu-linux-20-04-desktop>
References: <20250419010319.2572518-1-dmukhin@ford.com> <20250419010319.2572518-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 19 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Use qemu-xtf.sh for qemu-smoke-x86-64-gcc-efi job.
> 
> Lead time is reduced a bit since not all XTF code base is built, just the
> required test.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - removed TOP
> - dropped XEN_CONSOLE in favor of XEN_CMDLINE
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

Isn't it supposed to be pv64 as variant of the test to match what we had
before?


>    needs:
>      - debian-12-x86_64-gcc-debug
>  
> diff --git a/automation/scripts/include/configs/xtf-x86-64-efi-config b/automation/scripts/include/configs/xtf-x86-64-efi-config
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/automation/scripts/include/xtf-x86-64-efi b/automation/scripts/include/xtf-x86-64-efi
> new file mode 100644
> index 0000000000..e0d821b3f6
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
> +    export XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=com1}"
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

