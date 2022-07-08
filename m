Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBE56B4FA
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 11:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363319.593812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9jqg-0004QK-0F; Fri, 08 Jul 2022 09:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363319.593812; Fri, 08 Jul 2022 09:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9jqf-0004Nt-TT; Fri, 08 Jul 2022 09:00:29 +0000
Received: by outflank-mailman (input) for mailman id 363319;
 Fri, 08 Jul 2022 09:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WbS=XN=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o9jqe-0004Nn-Oy
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 09:00:28 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68efabf7-fe9c-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 11:00:27 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id os14so6380060ejb.4
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jul 2022 02:00:27 -0700 (PDT)
Received: from [192.168.1.10] (adsl-142.37.6.26.tellas.gr. [37.6.26.142])
 by smtp.gmail.com with ESMTPSA id
 la21-20020a170907781500b0072aeda86ac3sm4740868ejc.149.2022.07.08.02.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 02:00:26 -0700 (PDT)
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
X-Inumbo-ID: 68efabf7-fe9c-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z5Kn/ekZSnQf1fpqDSkWLqugLoN29g75MMTjJpVoamI=;
        b=qLMwFgi4tjBc/Di8GBPZNC87JRfv10E2Q4/iixxxbGLt0iATTlq6O/TIBjzGVJCRA4
         C22nTVR8rZ2l8SQ9eSPRTKhRoNOszcJtphl1H8ortkYJ7/FCdUjM5owc9nd2ZMtxUw0M
         RUXiq+9PFqfrCvgRo0ICGoyrMhhR+IuoTT6khaNzQPO8mVwPVTKs3O8EhNS/L5dvxm4e
         ZRQtxxieHnGyYlH6onvCABKGPRdecHDEMRp73C/X3QlEK6jTZLD0S2loo+8BHfg1NseM
         Zrwo0K2RZqF7X/pKpFRw4/dqOQIkGGH64y3vUeryBid2UWbtMG0LITIjZF1mwQ96Lg4z
         t6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z5Kn/ekZSnQf1fpqDSkWLqugLoN29g75MMTjJpVoamI=;
        b=pRMCMaTFgdwkqTFoF+Pu9IMunQ9z4ViTHkCDb3U2PiaxD/vmGSmqToCnSXDca8wwuG
         gyKgzX0jI+aScgetQnLZyjX1YRWkPTYwiNogDhLhCiYm9p5w4ch3H6K7TU3hfsn0yqFa
         GsQlkvKFlJhmgq2XJ00+mUAqkcb6RswdGwSUvmgpXEDslIbUfo1AKjzE+jamMdinBfdK
         5Gwy3yY2sOUgsaA3qLRicWMX0fh+mLb8Q+RwOV+2iWXQC7X9rTMHUWYYdzenq1OaEKYn
         CSn0R5EnL58uLYo5WGZU2zGR8/DOn29g1dbx0V5HH4IKs7SGX1kIa+Q2d4xQpWbjhngb
         nRPQ==
X-Gm-Message-State: AJIora9ajPx2M4Jis5F41Pa7r4E0y/jBIfeT22zMSZbM0ZNKoADzsmzJ
	Fi1WA0OpbTdz/+/JRq5xkz9TxWstcmM=
X-Google-Smtp-Source: AGRyM1tmUlnXNXAJDUiSkmG5LkGRDT643uoq7c4ycC1BvroLEZQfsJDEU3ylZdan2SHni7u9Zc3stA==
X-Received: by 2002:a17:906:ce:b0:718:bff8:58c3 with SMTP id 14-20020a17090600ce00b00718bff858c3mr2378011eji.512.1657270826778;
        Fri, 08 Jul 2022 02:00:26 -0700 (PDT)
Message-ID: <a297d370-131a-6be2-ce1b-ab21d3352edf@gmail.com>
Date: Fri, 8 Jul 2022 12:00:23 +0300
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
 <c46137a2-d65c-3292-6e1c-8578e771f3b9@gmail.com>
 <418ffeb7-a088-28e8-c1b3-8f5ced317666@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <418ffeb7-a088-28e8-c1b3-8f5ced317666@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/8/22 10:46, Julien Grall wrote:
> 
> 
> On 08/07/2022 08:17, Xenia Ragiadakou wrote:
>> Hi Julien,
> 
> Hi Xenia,
> 
>> On 7/8/22 01:26, Julien Grall wrote:
>>> Hi Xenia,
>>>
>>> On 07/07/2022 21:38, Xenia Ragiadakou wrote:
>>>> Add an arm subdirectory under automation/configs for the arm 
>>>> specific configs
>>>> and add a config that enables static allocation.
>>>>
>>>> Modify the build script to search for configs also in this 
>>>> subdirectory and to
>>>> keep the generated xen binary, suffixed with the config file name, 
>>>> as artifact.
>>>>
>>>> Create a test job that
>>>> - boots xen on qemu with a single direct mapped dom0less guest 
>>>> configured with
>>>> statically allocated memory
>>>> - verifies that the memory ranges reported in the guest's logs are 
>>>> the same
>>>> with the provided static memory regions
>>>>
>>>> For guest kernel, use the 5.9.9 kernel from the tests-artifacts 
>>>> containers.
>>>> Use busybox-static package, to create the guest ramdisk.
>>>> To generate the u-boot script, use ImageBuilder.
>>>> Use the qemu from the tests-artifacts containers.
>>>>
>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>> ---
>>>>   automation/configs/arm/static_mem          |   3 +
>>>>   automation/gitlab-ci/test.yaml             |  24 +++++
>>>>   automation/scripts/build                   |   4 +
>>>>   automation/scripts/qemu-staticmem-arm64.sh | 114 
>>>> +++++++++++++++++++++
>>>>   4 files changed, 145 insertions(+)
>>>>   create mode 100644 automation/configs/arm/static_mem
>>>>   create mode 100755 automation/scripts/qemu-staticmem-arm64.sh
>>>>
>>>> diff --git a/automation/configs/arm/static_mem 
>>>> b/automation/configs/arm/static_mem
>>>> new file mode 100644
>>>> index 0000000000..84675ddf4e
>>>> --- /dev/null
>>>> +++ b/automation/configs/arm/static_mem
>>>> @@ -0,0 +1,3 @@
>>>> +CONFIG_EXPERT=y
>>>> +CONFIG_UNSUPPORTED=y
>>>> +CONFIG_STATIC_MEMORY=y
>>>> \ No newline at end of file
>>>
>>> Any particular reason to build a new Xen rather enable 
>>> CONFIG_STATIC_MEMORY in the existing build
>>
>> IIUC, the xen binary (built with the arm64_defconfig) is used by the 
>> two other arm64 test jobs qemu-smoke-arm64-gcc and 
>> qemu-alpine-arm64-gcc. I did not want to change its configuration.
>>
>> If there is no issue with changing its configuration, I can enable 
>> static memory and use this one. 
> 
> I would expect a Xen built to CONFIG_STATIC_MEMORY to continue to work 
> in normal case. So it should be fine to enable by default.
> 
>> But to be honest, I would like to be able also to test with custom 
>> configs.
> 
> That's fine. But in this case...
> 
>>
>>>> diff --git a/automation/scripts/build b/automation/scripts/build
>>>> index 21b3bc57c8..9c6196d9bd 100755
>>>> --- a/automation/scripts/build
>>>> +++ b/automation/scripts/build
>>>> @@ -83,6 +83,7 @@ fi
>>>>   # Build all the configs we care about
>>>>   case ${XEN_TARGET_ARCH} in
>>>>       x86_64) arch=x86 ;;
>>>> +    arm64) arch=arm ;;
>>>>       *) exit 0 ;;
>>>>   esac
>>>> @@ -93,4 +94,7 @@ for cfg in `ls ${cfg_dir}`; do
>>>>       rm -f xen/.config
>>>>       make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} 
>>>> defconfig
>>>>       make -j$(nproc) -C xen
>>>> +    if [[ ${arch} == "arm" ]]; then
>>>> +        cp xen/xen binaries/xen-${cfg}
>>>> +    fi
>>>
>>> This feels a bit of a hack to be arm only. Can you explain why this 
>>> is not enabled for x86 (other than this is not yet used)?
>>
>> I did not want to change the existing behavior for x86.
> 
> 
> ... I don't think this should be restricted to arm. I would also 
> consider to do this change separately to avoid mixing infrastructure 
> change and new test.

Sure.

> 
> [...]
> 
>>>> +# ImageBuilder
>>>> +rm -rf imagebuilder
>>>> +git clone https://gitlab.com/ViryaOS/imagebuilder
>>>> +
>>>> +echo "MEMORY_START=\"0x40000000\"
>>>> +MEMORY_END=\"0x0200000000\"
>>>> +
>>>> +DEVICE_TREE=\"virt-gicv2.dtb\"
>>>> +
>>>> +XEN=\"xen-static_mem\"
>>>> +XEN_CMD=\"console=dtuart earlyprintk xsm=dummy\"
>>>
>>> AFAIK, earlyprintk is not an option for Xen on Arm (at least). It is 
>>> also not clear why you need to pass xsm=dummy.
>>
>> It is not clear to me either :). I will remove them.
> 
> Where was this command line copied from? If it is an Arm documentation 
> (or script), then they should be corrected.

Don't worry :) I was using them when debugging a script for parsing the 
xen cmdline and I dragged them around. Sorry about that.
>>>> +
>>>> +(grep -q "Xen dom0less mode detected" qemu-staticmem.serial) || exit 1
>>>> +
>>>> +for ((i=0; i<${#base[@]}; i++))
>>>> +do
>>>> +    start="$(printf "0x%016x" ${base[$i]})"
>>>> +    end="$(printf "0x%016x" $((${base[$i]} + ${size[$i]} - 1)))"
>>>> +    grep -q "node   0: \[mem ${start}-${end}\]" qemu-staticmem.serial
>>>> +    if test $? -eq 1
>>>> +    then
>>>> +        exit 1
>>>> +    fi
>>>> +done
>>>
>>> Please add a comment on top to explain what this is meant to do. 
>>> However, I think we should avoid relying on output that we have 
>>> written ourself. IOW, relying on Xen/Linux to always write the same 
>>> message is risky because they can change at any time.
>>
>> The kernel is taken from a test-artifact container, so, IIUC, it won't 
>> change.
> 
> This statement is correct today. However, we may decide to update the 
> kernel or test multiple kernels (with different ouput).
> 
> In the first case, it would be a matter of updating the script. This is 
> annoying but not too bad. In the second case, we would need to have "if 
> version X ... else if version Y ... ".

The particular test was relying and had a dependency on this kernel.
If the test is merged into the qemu-smoke-arm64.sh, the check above will 
leave and it will be tested whether the guest makes it to the busybox, 
based on the busybox logs, which also may change at any time.

-- 
Xenia

