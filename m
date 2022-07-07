Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A2756AE62
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 00:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363146.593529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Zx1-0005OI-10; Thu, 07 Jul 2022 22:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363146.593529; Thu, 07 Jul 2022 22:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Zx0-0005LK-UV; Thu, 07 Jul 2022 22:26:22 +0000
Received: by outflank-mailman (input) for mailman id 363146;
 Thu, 07 Jul 2022 22:26:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9Zwz-0005LE-Dd
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 22:26:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9Zwz-0000h7-4c; Thu, 07 Jul 2022 22:26:21 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9Zwy-00012z-Ud; Thu, 07 Jul 2022 22:26:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=Q78BAse3nBz3bhG5pfcWO+iS90oUbCnM8Dl9Q7LWg60=; b=dWnqO4QtEjgb2g+EAFZrDcVixg
	kpA803kGNsTjT1ihQw34fRuj6lsZotZ5qzqA+/jKOke/FXEqcT0uda9qWK4FoQpNlr9gR2swn4kzK
	Wfd05n0zLUyGebpS9caWZMl9Ay22x2AO6oc7a7cFpKN/SEma+Pp1h5+oi90Srh0LNlBw=;
Message-ID: <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
Date: Thu, 7 Jul 2022 23:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
 <20220707203803.798317-3-burzalodowa@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
In-Reply-To: <20220707203803.798317-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 07/07/2022 21:38, Xenia Ragiadakou wrote:
> Add an arm subdirectory under automation/configs for the arm specific configs
> and add a config that enables static allocation.
> 
> Modify the build script to search for configs also in this subdirectory and to
> keep the generated xen binary, suffixed with the config file name, as artifact.
> 
> Create a test job that
> - boots xen on qemu with a single direct mapped dom0less guest configured with
> statically allocated memory
> - verifies that the memory ranges reported in the guest's logs are the same
> with the provided static memory regions
> 
> For guest kernel, use the 5.9.9 kernel from the tests-artifacts containers.
> Use busybox-static package, to create the guest ramdisk.
> To generate the u-boot script, use ImageBuilder.
> Use the qemu from the tests-artifacts containers.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>   automation/configs/arm/static_mem          |   3 +
>   automation/gitlab-ci/test.yaml             |  24 +++++
>   automation/scripts/build                   |   4 +
>   automation/scripts/qemu-staticmem-arm64.sh | 114 +++++++++++++++++++++
>   4 files changed, 145 insertions(+)
>   create mode 100644 automation/configs/arm/static_mem
>   create mode 100755 automation/scripts/qemu-staticmem-arm64.sh
> 
> diff --git a/automation/configs/arm/static_mem b/automation/configs/arm/static_mem
> new file mode 100644
> index 0000000000..84675ddf4e
> --- /dev/null
> +++ b/automation/configs/arm/static_mem
> @@ -0,0 +1,3 @@
> +CONFIG_EXPERT=y
> +CONFIG_UNSUPPORTED=y
> +CONFIG_STATIC_MEMORY=y
> \ No newline at end of file

Any particular reason to build a new Xen rather enable 
CONFIG_STATIC_MEMORY in the existing build?

> diff --git a/automation/scripts/build b/automation/scripts/build
> index 21b3bc57c8..9c6196d9bd 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -83,6 +83,7 @@ fi
>   # Build all the configs we care about
>   case ${XEN_TARGET_ARCH} in
>       x86_64) arch=x86 ;;
> +    arm64) arch=arm ;;
>       *) exit 0 ;;
>   esac
>   
> @@ -93,4 +94,7 @@ for cfg in `ls ${cfg_dir}`; do
>       rm -f xen/.config
>       make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} defconfig
>       make -j$(nproc) -C xen
> +    if [[ ${arch} == "arm" ]]; then
> +        cp xen/xen binaries/xen-${cfg}
> +    fi

This feels a bit of a hack to be arm only. Can you explain why this is 
not enabled for x86 (other than this is not yet used)?

>   done
> diff --git a/automation/scripts/qemu-staticmem-arm64.sh b/automation/scripts/qemu-staticmem-arm64.sh
> new file mode 100755
> index 0000000000..5b89a151aa
> --- /dev/null
> +++ b/automation/scripts/qemu-staticmem-arm64.sh
> @@ -0,0 +1,114 @@
> +#!/bin/bash
> +
> +base=(0x50000000 0x100000000)
> +size=(0x10000000 0x10000000)

 From the name, it is not clear what the base and size refers too. 
Looking a bit below, it seems to be referring to the domain memory. If 
so, I would suggest to comment and rename to "domu_{base, size}".

> +
> +set -ex
> +
> +apt-get -qy update
> +apt-get -qy install --no-install-recommends u-boot-qemu \
> +                                            u-boot-tools \
> +                                            device-tree-compiler \
> +                                            cpio \
> +                                            curl \
> +                                            busybox-static
> +
> +# DomU Busybox
> +cd binaries
> +mkdir -p initrd
> +mkdir -p initrd/bin
> +mkdir -p initrd/sbin
> +mkdir -p initrd/etc
> +mkdir -p initrd/dev
> +mkdir -p initrd/proc
> +mkdir -p initrd/sys
> +mkdir -p initrd/lib
> +mkdir -p initrd/var
> +mkdir -p initrd/mnt
> +cp /bin/busybox initrd/bin/busybox
> +initrd/bin/busybox --install initrd/bin
> +echo "#!/bin/sh
> +
> +mount -t proc proc /proc
> +mount -t sysfs sysfs /sys
> +mount -t devtmpfs devtmpfs /dev
> +/bin/sh" > initrd/init
> +chmod +x initrd/init
> +cd initrd
> +find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
> +cd ../..
> +
> +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> +curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> +
> +./binaries/qemu-system-aarch64 -nographic \
> +    -M virtualization=true \
> +    -M virt \
> +    -M virt,gic-version=2 \
> +    -cpu cortex-a57 \
> +    -smp 2 \
> +    -m 8G \
> +    -M dumpdtb=binaries/virt-gicv2.dtb
> +
> +#dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
> +
> +# ImageBuilder
> +rm -rf imagebuilder
> +git clone https://gitlab.com/ViryaOS/imagebuilder
> +
> +echo "MEMORY_START=\"0x40000000\"
> +MEMORY_END=\"0x0200000000\"
> +
> +DEVICE_TREE=\"virt-gicv2.dtb\"
> +
> +XEN=\"xen-static_mem\"
> +XEN_CMD=\"console=dtuart earlyprintk xsm=dummy\"

AFAIK, earlyprintk is not an option for Xen on Arm (at least). It is 
also not clear why you need to pass xsm=dummy.

> +
> +NUM_DOMUS=1
> +DOMU_MEM[0]=512
> +DOMU_VCPUS[0]=1
> +DOMU_KERNEL[0]=\"Image\"
> +DOMU_RAMDISK[0]=\"initrd.cpio.gz\"
> +DOMU_CMD[0]=\"earlyprintk console=ttyAMA0\"
> +DOMU_STATIC_MEM[0]=\"${base[0]} ${size[0]} ${base[1]} ${size[1]}\"
> +
> +UBOOT_SOURCE=\"boot.source\"
> +UBOOT_SCRIPT=\"boot.scr\"" > binaries/imagebuilder_config
> +
> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/imagebuilder_config
> +
> +# Run the test
> +rm -f qemu-staticmem.serial
> +set +e
> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
> +timeout -k 1 60 ./binaries/qemu-system-aarch64 -nographic \
> +    -M virtualization=true \
> +    -M virt \
> +    -M virt,gic-version=2 \
> +    -cpu cortex-a57 \
> +    -smp 2 \
> +    -m 8G \
> +    -no-reboot \
> +    -device virtio-net-pci,netdev=vnet0 -netdev user,id=vnet0,tftp=binaries \
> +    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin \
> +    -dtb ./binaries/virt-gicv2.dtb \
> +    |& tee qemu-staticmem.serial
> +
> +set -e

A lot of the code above is duplicated from qemu-smoke-arm64.sh. I think 
it would be better to consolidate in a single script. Looking briefly 
throught the existing scripts, it looks like it is possible to pass 
arguments (see qemu-smoke-x86-64.sh).

> +
> +(grep -q "Xen dom0less mode detected" qemu-staticmem.serial) || exit 1
> +
> +for ((i=0; i<${#base[@]}; i++))
> +do
> +    start="$(printf "0x%016x" ${base[$i]})"
> +    end="$(printf "0x%016x" $((${base[$i]} + ${size[$i]} - 1)))"
> +    grep -q "node   0: \[mem ${start}-${end}\]" qemu-staticmem.serial
> +    if test $? -eq 1
> +    then
> +        exit 1
> +    fi
> +done

Please add a comment on top to explain what this is meant to do. 
However, I think we should avoid relying on output that we have written 
ourself. IOW, relying on Xen/Linux to always write the same message is 
risky because they can change at any time.

> +
> +(grep -q "BusyBox" qemu-staticmem.serial) || exit 1

Cheers,

-- 
Julien Grall

