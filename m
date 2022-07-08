Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3884B56B340
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363237.593681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iEs-0006Zn-2f; Fri, 08 Jul 2022 07:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363237.593681; Fri, 08 Jul 2022 07:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iEr-0006WK-Vm; Fri, 08 Jul 2022 07:17:21 +0000
Received: by outflank-mailman (input) for mailman id 363237;
 Fri, 08 Jul 2022 07:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WbS=XN=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o9iEr-0006WE-AH
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:17:21 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0106ec52-fe8e-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 09:17:20 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id ez10so6073011ejc.13
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jul 2022 00:17:19 -0700 (PDT)
Received: from [192.168.1.10] (adsl-142.37.6.26.tellas.gr. [37.6.26.142])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906329200b0072abb95eaa4sm7619472ejw.215.2022.07.08.00.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 00:17:18 -0700 (PDT)
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
X-Inumbo-ID: 0106ec52-fe8e-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AEU1mSHIXvqqwylw0IB3U4Ad98mWiw0OJkgCFIwOnAQ=;
        b=kc4ggJq1LKJVjKAWoHzmF17AHeWJadER1Y6af3Rlv0RyA/YavTqgpStE4/lsEXD1kr
         tscGi5MdK0Waagnu8YlGDt+UovFE1hO33Ev4tHFOtSVj4X9u/7wz5MKHls0VHy9LVOL+
         1SOElqAR2pruJMhlgxH77gu6Fxz08s7sc2P9QrkwXIT1z8AvsfzddqbecA4T8XHhVvz5
         evZGzRlGxkI1ccTbValaQZeXaaL2++nLuexGOEjy07PKCGtjYbr0K4SU1ou7DjU479NT
         PJAAgPdnveIYUKFR/4dNItXMnuxUTCtShOzG7o7UVq+XdALhMmygTsF9fCddaoNi55sp
         gtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AEU1mSHIXvqqwylw0IB3U4Ad98mWiw0OJkgCFIwOnAQ=;
        b=3ZeUxoBnz9bWMuYkumqGIRiUuB5TzWYBLc3LSXK9XOwPbrP0IuhDRbbes+7m0LmdWf
         iFCIf7zuCJTmxJLo/+o0L+rAOas70AXD/GZAJzbwNKQR5pCJDR7bHZ51/QHN4m6orYyG
         tC6lCec/66tZv8lEiE7/Ize1bvkw3YW6OaaTdNcmiZ9pIvM+wS7aLP3lreqkgdsGDd4b
         /dVuVOjLD432UkIz82bnLdaDeXOtlnVGtmw3v+EKk5KLK/obDmBTQ0eCqMJeQDXmKY1J
         7DUR300TPVHg/od5VE20h37o4+VIssUHTaM7Vwg629UwxEj5e4QjlOInCz5S+U3dwGWE
         dLEA==
X-Gm-Message-State: AJIora8TPRLMODo9PSuTuh5PUShJVhpZaU7eKVDKa2bF60FCi5FkVIog
	axD79V4hTQUeN6Doy/C1cL3hvTLmoxE=
X-Google-Smtp-Source: AGRyM1t4N0LY6yBx8oPChURkWOlD3O06cJbsjzXl9wmRNRL/1AR2izIa0DPKM+jm66TSipRopBRuPg==
X-Received: by 2002:a17:907:d15:b0:72b:1718:59be with SMTP id gn21-20020a1709070d1500b0072b171859bemr2092202ejc.349.1657264639373;
        Fri, 08 Jul 2022 00:17:19 -0700 (PDT)
Message-ID: <c46137a2-d65c-3292-6e1c-8578e771f3b9@gmail.com>
Date: Fri, 8 Jul 2022 10:17:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
 <20220707203803.798317-3-burzalodowa@gmail.com>
 <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

On 7/8/22 01:26, Julien Grall wrote:
> Hi Xenia,
> 
> On 07/07/2022 21:38, Xenia Ragiadakou wrote:
>> Add an arm subdirectory under automation/configs for the arm specific 
>> configs
>> and add a config that enables static allocation.
>>
>> Modify the build script to search for configs also in this 
>> subdirectory and to
>> keep the generated xen binary, suffixed with the config file name, as 
>> artifact.
>>
>> Create a test job that
>> - boots xen on qemu with a single direct mapped dom0less guest 
>> configured with
>> statically allocated memory
>> - verifies that the memory ranges reported in the guest's logs are the 
>> same
>> with the provided static memory regions
>>
>> For guest kernel, use the 5.9.9 kernel from the tests-artifacts 
>> containers.
>> Use busybox-static package, to create the guest ramdisk.
>> To generate the u-boot script, use ImageBuilder.
>> Use the qemu from the tests-artifacts containers.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>   automation/configs/arm/static_mem          |   3 +
>>   automation/gitlab-ci/test.yaml             |  24 +++++
>>   automation/scripts/build                   |   4 +
>>   automation/scripts/qemu-staticmem-arm64.sh | 114 +++++++++++++++++++++
>>   4 files changed, 145 insertions(+)
>>   create mode 100644 automation/configs/arm/static_mem
>>   create mode 100755 automation/scripts/qemu-staticmem-arm64.sh
>>
>> diff --git a/automation/configs/arm/static_mem 
>> b/automation/configs/arm/static_mem
>> new file mode 100644
>> index 0000000000..84675ddf4e
>> --- /dev/null
>> +++ b/automation/configs/arm/static_mem
>> @@ -0,0 +1,3 @@
>> +CONFIG_EXPERT=y
>> +CONFIG_UNSUPPORTED=y
>> +CONFIG_STATIC_MEMORY=y
>> \ No newline at end of file
> 
> Any particular reason to build a new Xen rather enable 
> CONFIG_STATIC_MEMORY in the existing build

IIUC, the xen binary (built with the arm64_defconfig) is used by the two 
other arm64 test jobs qemu-smoke-arm64-gcc and qemu-alpine-arm64-gcc. I 
did not want to change its configuration.

If there is no issue with changing its configuration, I can enable 
static memory and use this one. But to be honest, I would like to be 
able also to test with custom configs.

>> diff --git a/automation/scripts/build b/automation/scripts/build
>> index 21b3bc57c8..9c6196d9bd 100755
>> --- a/automation/scripts/build
>> +++ b/automation/scripts/build
>> @@ -83,6 +83,7 @@ fi
>>   # Build all the configs we care about
>>   case ${XEN_TARGET_ARCH} in
>>       x86_64) arch=x86 ;;
>> +    arm64) arch=arm ;;
>>       *) exit 0 ;;
>>   esac
>> @@ -93,4 +94,7 @@ for cfg in `ls ${cfg_dir}`; do
>>       rm -f xen/.config
>>       make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} 
>> defconfig
>>       make -j$(nproc) -C xen
>> +    if [[ ${arch} == "arm" ]]; then
>> +        cp xen/xen binaries/xen-${cfg}
>> +    fi
> 
> This feels a bit of a hack to be arm only. Can you explain why this is 
> not enabled for x86 (other than this is not yet used)?

I did not want to change the existing behavior for x86.

>>   done
>> diff --git a/automation/scripts/qemu-staticmem-arm64.sh 
>> b/automation/scripts/qemu-staticmem-arm64.sh
>> new file mode 100755
>> index 0000000000..5b89a151aa
>> --- /dev/null
>> +++ b/automation/scripts/qemu-staticmem-arm64.sh
>> @@ -0,0 +1,114 @@
>> +#!/bin/bash
>> +
>> +base=(0x50000000 0x100000000)
>> +size=(0x10000000 0x10000000)
> 
>  From the name, it is not clear what the base and size refers too. 
> Looking a bit below, it seems to be referring to the domain memory. If 
> so, I would suggest to comment and rename to "domu_{base, size}".

They are the static memory regions allocated to the domu.

>> +
>> +set -ex
>> +
>> +apt-get -qy update
>> +apt-get -qy install --no-install-recommends u-boot-qemu \
>> +                                            u-boot-tools \
>> +                                            device-tree-compiler \
>> +                                            cpio \
>> +                                            curl \
>> +                                            busybox-static
>> +
>> +# DomU Busybox
>> +cd binaries
>> +mkdir -p initrd
>> +mkdir -p initrd/bin
>> +mkdir -p initrd/sbin
>> +mkdir -p initrd/etc
>> +mkdir -p initrd/dev
>> +mkdir -p initrd/proc
>> +mkdir -p initrd/sys
>> +mkdir -p initrd/lib
>> +mkdir -p initrd/var
>> +mkdir -p initrd/mnt
>> +cp /bin/busybox initrd/bin/busybox
>> +initrd/bin/busybox --install initrd/bin
>> +echo "#!/bin/sh
>> +
>> +mount -t proc proc /proc
>> +mount -t sysfs sysfs /sys
>> +mount -t devtmpfs devtmpfs /dev
>> +/bin/sh" > initrd/init
>> +chmod +x initrd/init
>> +cd initrd
>> +find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
>> +cd ../..
>> +
>> +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>> +curl -fsSLO 
>> https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>> +
>> +./binaries/qemu-system-aarch64 -nographic \
>> +    -M virtualization=true \
>> +    -M virt \
>> +    -M virt,gic-version=2 \
>> +    -cpu cortex-a57 \
>> +    -smp 2 \
>> +    -m 8G \
>> +    -M dumpdtb=binaries/virt-gicv2.dtb
>> +
>> +#dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
>> +
>> +# ImageBuilder
>> +rm -rf imagebuilder
>> +git clone https://gitlab.com/ViryaOS/imagebuilder
>> +
>> +echo "MEMORY_START=\"0x40000000\"
>> +MEMORY_END=\"0x0200000000\"
>> +
>> +DEVICE_TREE=\"virt-gicv2.dtb\"
>> +
>> +XEN=\"xen-static_mem\"
>> +XEN_CMD=\"console=dtuart earlyprintk xsm=dummy\"
> 
> AFAIK, earlyprintk is not an option for Xen on Arm (at least). It is 
> also not clear why you need to pass xsm=dummy.

It is not clear to me either :). I will remove them.

>> +
>> +NUM_DOMUS=1
>> +DOMU_MEM[0]=512
>> +DOMU_VCPUS[0]=1
>> +DOMU_KERNEL[0]=\"Image\"
>> +DOMU_RAMDISK[0]=\"initrd.cpio.gz\"
>> +DOMU_CMD[0]=\"earlyprintk console=ttyAMA0\"
>> +DOMU_STATIC_MEM[0]=\"${base[0]} ${size[0]} ${base[1]} ${size[1]}\"
>> +
>> +UBOOT_SOURCE=\"boot.source\"
>> +UBOOT_SCRIPT=\"boot.scr\"" > binaries/imagebuilder_config
>> +
>> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c 
>> binaries/imagebuilder_config
>> +
>> +# Run the test
>> +rm -f qemu-staticmem.serial
>> +set +e
>> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 
>> 0x40000000"| \
>> +timeout -k 1 60 ./binaries/qemu-system-aarch64 -nographic \
>> +    -M virtualization=true \
>> +    -M virt \
>> +    -M virt,gic-version=2 \
>> +    -cpu cortex-a57 \
>> +    -smp 2 \
>> +    -m 8G \
>> +    -no-reboot \
>> +    -device virtio-net-pci,netdev=vnet0 -netdev 
>> user,id=vnet0,tftp=binaries \
>> +    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin \
>> +    -dtb ./binaries/virt-gicv2.dtb \
>> +    |& tee qemu-staticmem.serial
>> +
>> +set -e
> 
> A lot of the code above is duplicated from qemu-smoke-arm64.sh. I think 
> it would be better to consolidate in a single script. Looking briefly 
> throught the existing scripts, it looks like it is possible to pass 
> arguments (see qemu-smoke-x86-64.sh).

Yes, if there is no issue with changing qemu-smoke-arm64.sh, this is a 
very good idea.

>> +
>> +(grep -q "Xen dom0less mode detected" qemu-staticmem.serial) || exit 1
>> +
>> +for ((i=0; i<${#base[@]}; i++))
>> +do
>> +    start="$(printf "0x%016x" ${base[$i]})"
>> +    end="$(printf "0x%016x" $((${base[$i]} + ${size[$i]} - 1)))"
>> +    grep -q "node   0: \[mem ${start}-${end}\]" qemu-staticmem.serial
>> +    if test $? -eq 1
>> +    then
>> +        exit 1
>> +    fi
>> +done
> 
> Please add a comment on top to explain what this is meant to do. 
> However, I think we should avoid relying on output that we have written 
> ourself. IOW, relying on Xen/Linux to always write the same message is 
> risky because they can change at any time.

The kernel is taken from a test-artifact container, so, IIUC, it won't 
change.

>> +
>> +(grep -q "BusyBox" qemu-staticmem.serial) || exit 1
> 
> Cheers,
> 

-- 
Xenia

