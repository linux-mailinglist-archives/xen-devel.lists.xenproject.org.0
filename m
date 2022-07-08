Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4156C110
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 21:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363669.594341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9tZm-0006qH-U1; Fri, 08 Jul 2022 19:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363669.594341; Fri, 08 Jul 2022 19:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9tZm-0006oR-Pi; Fri, 08 Jul 2022 19:23:42 +0000
Received: by outflank-mailman (input) for mailman id 363669;
 Fri, 08 Jul 2022 19:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WbS=XN=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o9tZk-0006oL-IH
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 19:23:40 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 779356e1-fef3-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 21:23:38 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id l23so7443604ejr.5
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jul 2022 12:23:37 -0700 (PDT)
Received: from [192.168.1.10] (adsl-142.37.6.26.tellas.gr. [37.6.26.142])
 by smtp.gmail.com with ESMTPSA id
 ck10-20020a170906c44a00b006fec27575f1sm20584375ejb.123.2022.07.08.12.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 12:23:37 -0700 (PDT)
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
X-Inumbo-ID: 779356e1-fef3-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=khMA9Z2o/pNJ70arxNMGf2ZW/aNmrg75x+nik7Psr0E=;
        b=VFLqZKJxBK7NUHN1Jg1pMpDEcs+8VU00Ui2wAnrOaLkyhSpWwSc4vxYHtc4aWVsaQt
         E8WKAjG8fSd7iOrHG9SLcmK14tXwFENaE2RxZiOvhTa25z0sl/7oDAt0gtN0A5jPiRIM
         0n7fYu1m5flm12YfjN2lBizqeDSktXyBoXW7vnOxJTzJFbh4wLRZLFe/k6WUteqfAo3x
         NkFnygICpCbQ4TZ8jx6DinupNEMH83WcrJE73tM5oqng5bNH4jAn7gi2UMqJQxhFsZt+
         b9Psm9i/UcAsrUii8eOSe/Cd9X9Bz+wqv4ltRmTN+xXiEACqJnh4tYkIlB4//4rfSnad
         TjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=khMA9Z2o/pNJ70arxNMGf2ZW/aNmrg75x+nik7Psr0E=;
        b=Pr+veRfodB2OpZqcob40bUgilUxtkjA/UWW++PNSE67sn8y0QNbuhZjl+wIBV4qyTf
         QAJvN5aP/0GTZO+1e7naPwLzLxq4XwS/cncqmo9e66ydcerLuQhTk/HXW5AoQHzOtk5f
         AI3to/riirwr0pn8Ww1OzCi8iDy7tbrHI7Cj/nVOYDwP9RwwyZL7SZ4dezczNwaokTzt
         Y57ZvcbHYAeK15vW2nVRUbabBdIxMZ9uJ7ihgaZsSa0rECEZVIAj4M69MFhtBAtVOxFv
         s8dGYLQiioJ5M7YAkKdpPqwWKHusfoAIbwtojztO6sJxrZWIwDHlU5DLIRvXw9im+NIW
         u1kA==
X-Gm-Message-State: AJIora+50rJN4RbfEZx5xNKcJ1eq7aTtii5AF9tdGduAGaXycrNWpnUV
	KpXQhmbmbWpTW0R4mwzonyE=
X-Google-Smtp-Source: AGRyM1vND14//KzhnTGNbZzJ3z2ROZdhtHTQwKMWX0j+EWu0kMdNXjUF4mlRBoQRhyBRvDlkIMsoyg==
X-Received: by 2002:a17:907:c0a:b0:726:22b1:9734 with SMTP id ga10-20020a1709070c0a00b0072622b19734mr5098832ejc.195.1657308217467;
        Fri, 08 Jul 2022 12:23:37 -0700 (PDT)
Message-ID: <870a02d8-e1ad-f848-f13b-b4573d8c99ac@gmail.com>
Date: Fri, 8 Jul 2022 22:23:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org,
 Doug Goldstein <cardoe@cardoe.com>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
 <20220707203803.798317-3-burzalodowa@gmail.com>
 <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
 <alpine.DEB.2.22.394.2207071548220.2354836@ubuntu-linux-20-04-desktop>
 <d3f2e9b2-219b-d00b-04fd-f8e6a38222e4@gmail.com>
 <alpine.DEB.2.22.394.2207080850510.2354836@ubuntu-linux-20-04-desktop>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2207080850510.2354836@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/22 18:56, Stefano Stabellini wrote:
> On Fri, 8 Jul 2022, Xenia Ragiadakou wrote:
>> On 7/8/22 02:05, Stefano Stabellini wrote:
>>> On Thu, 7 Jul 2022, Julien Grall wrote:
>>>> Hi Xenia,
>>>>
>>>> On 07/07/2022 21:38, Xenia Ragiadakou wrote:
>>>>> Add an arm subdirectory under automation/configs for the arm specific
>>>>> configs
>>>>> and add a config that enables static allocation.
>>>>>
>>>>> Modify the build script to search for configs also in this subdirectory
>>>>> and
>>>>> to
>>>>> keep the generated xen binary, suffixed with the config file name, as
>>>>> artifact.
>>>>>
>>>>> Create a test job that
>>>>> - boots xen on qemu with a single direct mapped dom0less guest
>>>>> configured
>>>>> with
>>>>> statically allocated memory
>>>>> - verifies that the memory ranges reported in the guest's logs are the
>>>>> same
>>>>> with the provided static memory regions
>>>>>
>>>>> For guest kernel, use the 5.9.9 kernel from the tests-artifacts
>>>>> containers.
>>>>> Use busybox-static package, to create the guest ramdisk.
>>>>> To generate the u-boot script, use ImageBuilder.
>>>>> Use the qemu from the tests-artifacts containers.
>>>>>
>>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>>> ---
>>>>>     automation/configs/arm/static_mem          |   3 +
>>>>>     automation/gitlab-ci/test.yaml             |  24 +++++
>>>>>     automation/scripts/build                   |   4 +
>>>>>     automation/scripts/qemu-staticmem-arm64.sh | 114
>>>>> +++++++++++++++++++++
>>>>>     4 files changed, 145 insertions(+)
>>>>>     create mode 100644 automation/configs/arm/static_mem
>>>>>     create mode 100755 automation/scripts/qemu-staticmem-arm64.sh
>>>>>
>>>>> diff --git a/automation/configs/arm/static_mem
>>>>> b/automation/configs/arm/static_mem
>>>>> new file mode 100644
>>>>> index 0000000000..84675ddf4e
>>>>> --- /dev/null
>>>>> +++ b/automation/configs/arm/static_mem
>>>>> @@ -0,0 +1,3 @@
>>>>> +CONFIG_EXPERT=y
>>>>> +CONFIG_UNSUPPORTED=y
>>>>> +CONFIG_STATIC_MEMORY=y
>>>>> \ No newline at end of file
>>>>
>>>> Any particular reason to build a new Xen rather enable
>>>> CONFIG_STATIC_MEMORY in
>>>> the existing build?
>>>>
>>>>> diff --git a/automation/scripts/build b/automation/scripts/build
>>>>> index 21b3bc57c8..9c6196d9bd 100755
>>>>> --- a/automation/scripts/build
>>>>> +++ b/automation/scripts/build
>>>>> @@ -83,6 +83,7 @@ fi
>>>>>     # Build all the configs we care about
>>>>>     case ${XEN_TARGET_ARCH} in
>>>>>         x86_64) arch=x86 ;;
>>>>> +    arm64) arch=arm ;;
>>>>>         *) exit 0 ;;
>>>>>     esac
>>>>>     @@ -93,4 +94,7 @@ for cfg in `ls ${cfg_dir}`; do
>>>>>         rm -f xen/.config
>>>>>         make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg}
>>>>> defconfig
>>>>>         make -j$(nproc) -C xen
>>>>> +    if [[ ${arch} == "arm" ]]; then
>>>>> +        cp xen/xen binaries/xen-${cfg}
>>>>> +    fi
>>>>
>>>> This feels a bit of a hack to be arm only. Can you explain why this is not
>>>> enabled for x86 (other than this is not yet used)?
>>>>
>>>>>     done
>>>>> diff --git a/automation/scripts/qemu-staticmem-arm64.sh
>>>>> b/automation/scripts/qemu-staticmem-arm64.sh
>>>>> new file mode 100755
>>>>> index 0000000000..5b89a151aa
>>>>> --- /dev/null
>>>>> +++ b/automation/scripts/qemu-staticmem-arm64.sh
>>>>> @@ -0,0 +1,114 @@
>>>>> +#!/bin/bash
>>>>> +
>>>>> +base=(0x50000000 0x100000000)
>>>>> +size=(0x10000000 0x10000000)
>>>>
>>>>   From the name, it is not clear what the base and size refers too. Looking
>>>> a
>>>> bit below, it seems to be referring to the domain memory. If so, I would
>>>> suggest to comment and rename to "domu_{base, size}".
>>>>
>>>>> +
>>>>> +set -ex
>>>>> +
>>>>> +apt-get -qy update
>>>>> +apt-get -qy install --no-install-recommends u-boot-qemu \
>>>>> +                                            u-boot-tools \
>>>>> +                                            device-tree-compiler \
>>>>> +                                            cpio \
>>>>> +                                            curl \
>>>>> +                                            busybox-static
>>>>> +
>>>>> +# DomU Busybox
>>>>> +cd binaries
>>>>> +mkdir -p initrd
>>>>> +mkdir -p initrd/bin
>>>>> +mkdir -p initrd/sbin
>>>>> +mkdir -p initrd/etc
>>>>> +mkdir -p initrd/dev
>>>>> +mkdir -p initrd/proc
>>>>> +mkdir -p initrd/sys
>>>>> +mkdir -p initrd/lib
>>>>> +mkdir -p initrd/var
>>>>> +mkdir -p initrd/mnt
>>>>> +cp /bin/busybox initrd/bin/busybox
>>>>> +initrd/bin/busybox --install initrd/bin
>>>>> +echo "#!/bin/sh
>>>>> +
>>>>> +mount -t proc proc /proc
>>>>> +mount -t sysfs sysfs /sys
>>>>> +mount -t devtmpfs devtmpfs /dev
>>>>> +/bin/sh" > initrd/init
>>>>> +chmod +x initrd/init
>>>>> +cd initrd
>>>>> +find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
>>>>> +cd ../..
>>>>> +
>>>>> +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>>>>> +curl -fsSLO
>>>>> https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>>>>> +
>>>>> +./binaries/qemu-system-aarch64 -nographic \
>>>>> +    -M virtualization=true \
>>>>> +    -M virt \
>>>>> +    -M virt,gic-version=2 \
>>>>> +    -cpu cortex-a57 \
>>>>> +    -smp 2 \
>>>>> +    -m 8G \
>>>>> +    -M dumpdtb=binaries/virt-gicv2.dtb
>>>>> +
>>>>> +#dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
>>>>> +
>>>>> +# ImageBuilder
>>>>> +rm -rf imagebuilder
>>>>> +git clone https://gitlab.com/ViryaOS/imagebuilder
>>>>> +
>>>>> +echo "MEMORY_START=\"0x40000000\"
>>>>> +MEMORY_END=\"0x0200000000\"
>>>>> +
>>>>> +DEVICE_TREE=\"virt-gicv2.dtb\"
>>>>> +
>>>>> +XEN=\"xen-static_mem\"
>>>>> +XEN_CMD=\"console=dtuart earlyprintk xsm=dummy\"
>>>>
>>>> AFAIK, earlyprintk is not an option for Xen on Arm (at least). It is also
>>>> not
>>>> clear why you need to pass xsm=dummy.
>>>>
>>>>> +
>>>>> +NUM_DOMUS=1
>>>>> +DOMU_MEM[0]=512
>>>>> +DOMU_VCPUS[0]=1
>>>>> +DOMU_KERNEL[0]=\"Image\"
>>>>> +DOMU_RAMDISK[0]=\"initrd.cpio.gz\"
>>>>> +DOMU_CMD[0]=\"earlyprintk console=ttyAMA0\"
>>>>> +DOMU_STATIC_MEM[0]=\"${base[0]} ${size[0]} ${base[1]} ${size[1]}\"
>>>>> +
>>>>> +UBOOT_SOURCE=\"boot.source\"
>>>>> +UBOOT_SCRIPT=\"boot.scr\"" > binaries/imagebuilder_config
>>>>> +
>>>>> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c
>>>>> binaries/imagebuilder_config
>>>>> +
>>>>> +# Run the test
>>>>> +rm -f qemu-staticmem.serial
>>>>> +set +e
>>>>> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source
>>>>> 0x40000000"| \
>>>>> +timeout -k 1 60 ./binaries/qemu-system-aarch64 -nographic \
>>>>> +    -M virtualization=true \
>>>>> +    -M virt \
>>>>> +    -M virt,gic-version=2 \
>>>>> +    -cpu cortex-a57 \
>>>>> +    -smp 2 \
>>>>> +    -m 8G \
>>>>> +    -no-reboot \
>>>>> +    -device virtio-net-pci,netdev=vnet0 -netdev
>>>>> user,id=vnet0,tftp=binaries
>>>>> \
>>>>> +    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin \
>>>>> +    -dtb ./binaries/virt-gicv2.dtb \
>>>>> +    |& tee qemu-staticmem.serial
>>>>> +
>>>>> +set -e
>>>>
>>>> A lot of the code above is duplicated from qemu-smoke-arm64.sh. I think it
>>>> would be better to consolidate in a single script. Looking briefly
>>>> throught
>>>> the existing scripts, it looks like it is possible to pass arguments (see
>>>> qemu-smoke-x86-64.sh).
>>>    One idea would be to make the script common and "source" a second
>>> script or config file with just the ImageBuilder configuration because
>>> it looks like it is the only thing different.
>>>
>>>
>>>>> +
>>>>> +(grep -q "Xen dom0less mode detected" qemu-staticmem.serial) || exit 1
>>>>> +
>>>>> +for ((i=0; i<${#base[@]}; i++))
>>>>> +do
>>>>> +    start="$(printf "0x%016x" ${base[$i]})"
>>>>> +    end="$(printf "0x%016x" $((${base[$i]} + ${size[$i]} - 1)))"
>>>>> +    grep -q "node   0: \[mem ${start}-${end}\]" qemu-staticmem.serial
>>>>> +    if test $? -eq 1
>>>>> +    then
>>>>> +        exit 1
>>>>> +    fi
>>>>> +done
>>>>
>>>> Please add a comment on top to explain what this is meant to do. However,
>>>> I
>>>> think we should avoid relying on output that we have written ourself. IOW,
>>>> relying on Xen/Linux to always write the same message is risky because
>>>> they
>>>> can change at any time.
>>>
>>> Especially if we make the script common, then we could just rely on the
>>> existing check to see if the guest started correctly (no special check
>>> for static memory).
>>
>> In this case, how the test will verify that the static memory configuration
>> has been taken into account and has not just been ignored?
> 
> There is no simple way that I can think of.
> 
> We can trust that it worked, without checking that the ranges were
> actually static as requested.
> 
> We can parse the Xen output like you did, although if it changes then
> the test will break.
> 
> Or we could add a script to detect and print specific output but I
> don't know if there is something under /proc or /sys that we could
> simply "cat" from bash to check it.
> 
> If there is a simple way to do this by cat'ing /proc or /sys then I
> think that would be great. Otherwise I think we could do as you did in
> this patch, which is not perfect but it works and if something changes
> in the Xen output we'll detect it right away given that gitlab-ci is run
> pre-commit.

Ok, I 'll send another patch that will enable static memory for all arm 
xen builds and will use a single script.
For the static memory case, I will try to verify the values of the 
guest's dt memory node via /proc/device-tree.

Also, I will do some minor cleanups in qemu-smoke-arm64.sh because there 
are some inconsistencies for instance the dtb is named virt-gicv3 while 
runs with gicv2, a comment states that qemu gets installed while it is 
taken from test-artifacts container.

Thanks to both of you for the review.

-- 
Xenia

