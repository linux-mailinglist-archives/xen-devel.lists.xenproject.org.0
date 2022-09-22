Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632AF5E6F76
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 00:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410485.653509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obURW-0001Xc-Mu; Thu, 22 Sep 2022 22:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410485.653509; Thu, 22 Sep 2022 22:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obURW-0001Uf-JT; Thu, 22 Sep 2022 22:13:14 +0000
Received: by outflank-mailman (input) for mailman id 410485;
 Thu, 22 Sep 2022 22:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OXb=ZZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obURU-0001UZ-NP
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 22:13:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bef4dd9a-3ac3-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 00:13:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EAC9EB80E0B;
 Thu, 22 Sep 2022 22:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24084C433D6;
 Thu, 22 Sep 2022 22:13:09 +0000 (UTC)
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
X-Inumbo-ID: bef4dd9a-3ac3-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663884789;
	bh=a59HD7ooUmHzgVMLvCpbzyPtmhyKk90E1bJPycu/YDc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ss6WLUdkALm7h5nPHhj9fnAKia3bHuxeFXqxbzBx72DtliNclKQpbYBoI6RtAvaya
	 frHUWJ1BUrhvT0MoXvkRSCa4wtsF8gtgGttsZFt3epBah5UNUHnheZ0Vj5YX0Cs2Lv
	 jhyg4SEi9BaXgqEvZeLf207oy4tshbUvAs7qtB1gL4FF0EcmPOvwVG8sLYf34qEJHl
	 oD80RHa2sBaKFNrwxY5pzS/IaHmNCkaPP4+rnzIUA7z+y1s4Qh8wpSiQegJTp7xr7I
	 gXGqM5otdhhfgWfwLVrm0PFzn6zdI+kj2gFZc2pY91uUryaLPymn9pE+nWwRubOEBl
	 O5FcOABp7ccaA==
Date: Thu, 22 Sep 2022 15:13:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 5/9] automation: qemu-smoke-arm32.sh: Modify script to
 use ImageBuilder
In-Reply-To: <20220922134058.1410-6-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209221507480.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-6-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Sep 2022, Michal Orzel wrote:
> Take an example from arm64 qemu test scripts and use ImageBuilder
> to generate u-boot script automatically. Calculating the addresses
> manually is quite error prone and also we will be able to benefit
> from using ImageBuilder when adding domUs to this test in the future.
> 
> Install and use u-boot from the debian package.
> Modify the script so that binaries are loaded from u-boot via tftp.

Great patch! It makes the test a lot better!


> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  automation/scripts/qemu-smoke-arm32.sh | 57 ++++++++++++--------------
>  1 file changed, 27 insertions(+), 30 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
> index 530f3892fdd3..765facbe4d66 100755
> --- a/automation/scripts/qemu-smoke-arm32.sh
> +++ b/automation/scripts/qemu-smoke-arm32.sh
> @@ -4,7 +4,9 @@ set -ex
>  
>  export DEBIAN_FRONTENT=noninteractive
>  apt-get -qy update
> -apt-get -qy install --no-install-recommends device-tree-compiler \
> +apt-get -qy install --no-install-recommends u-boot-qemu \
> +                                            u-boot-tools \
> +                                            device-tree-compiler \
>                                              curl \
>                                              cpio
>  
> @@ -20,10 +22,6 @@ tar xvzf ../initrd.tar.gz
>  find . | cpio -H newc -o | gzip > ../initrd.gz
>  cd ..
>  
> -kernel=`stat -L --printf="%s" vmlinuz`
> -initrd=`stat -L --printf="%s" initrd.gz`
> -
> -# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
>  # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>  curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>  ./qemu-system-arm \
> @@ -36,31 +34,31 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>     -display none \
>     -machine dumpdtb=virt.dtb
>  
> -dtc -I dtb -O dts virt.dtb > virt.dts
> +# ImageBuilder
> +echo 'MEMORY_START="0x40000000"
> +MEMORY_END="0x80000000"
> +
> +DEVICE_TREE="virt.dtb"
> +XEN="xen"
> +DOM0_KERNEL="vmlinuz"
> +DOM0_RAMDISK="initrd.gz"
> +DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
> +XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"

This is missing dtuart=/pl011@9000000 compared to the original


> +NUM_DOMUS=0
> +
> +LOAD_CMD="tftpb"
> +BOOT_CMD="bootm"

"bootm" because "booti" is not available on arm32, right?


> +UBOOT_SOURCE="boot.source"
> +UBOOT_SCRIPT="boot.scr"' > config
>  
> -cat >> virt.dts << EOF
> -/ {
> -	chosen {
> -		#address-cells = <0x2>;
> -		#size-cells = <0x2>;
> -		stdout-path = "/pl011@9000000";
> -        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=512M bootscrub=0";
> -		xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh";
> -		dom0 {
> -			compatible = "xen,linux-zimage", "xen,multiboot-module";
> -			reg = <0x0 0x1000000 0x0 $kernel>;
> -		};
> -        dom0-ramdisk {
> -			compatible = "xen,linux-initrd", "xen,multiboot-module";
> -			reg = <0x0 0x3200000 0x0 $initrd>;
> -		};
> -	};
> -};
> -EOF
> -dtc -I dts -O dtb virt.dts > virt.dtb
> +rm -rf imagebuilder
> +git clone https://gitlab.com/ViryaOS/imagebuilder
> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
>  
>  rm -f smoke.serial
>  set +e
> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
>  timeout -k 1 240 \
>  ./qemu-system-arm \
>     -machine virt \
> @@ -70,11 +68,10 @@ timeout -k 1 240 \
>     -serial stdio \
>     -monitor none \
>     -display none \
> -   -dtb virt.dtb \
>     -no-reboot \
> -   -kernel ./xen \
> -   -device loader,file=./vmlinuz,addr=0x1000000 \
> -   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
> +   -device virtio-net-pci,netdev=n0 \
> +   -netdev user,id=n0,tftp=./ \
> +   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
>  
>  set -e
>  (grep -q "^/ #" smoke.serial) || exit 1
> -- 
> 2.25.1
> 

