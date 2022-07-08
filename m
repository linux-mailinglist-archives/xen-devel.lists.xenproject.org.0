Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E53956B3C8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363268.593747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9igs-0005YA-QS; Fri, 08 Jul 2022 07:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363268.593747; Fri, 08 Jul 2022 07:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9igs-0005VG-NG; Fri, 08 Jul 2022 07:46:18 +0000
Received: by outflank-mailman (input) for mailman id 363268;
 Fri, 08 Jul 2022 07:46:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9igr-0005V6-7S
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:46:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9igr-0005pF-2l; Fri, 08 Jul 2022 07:46:17 +0000
Received: from [54.239.6.190] (helo=[192.168.18.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9igq-0006KE-TB; Fri, 08 Jul 2022 07:46:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Enrk0CMF9QdvkKEmX+ZyvNMDaUhuGcFGRrFhEb9mArk=; b=DMB021HDOWZyiaE07h7pfu3c3b
	dJYi5JuwML2tcii8ln8DXyYArxmx7vqwf66ugPfJtxJmFEYNGhiukvI7xHF+XbJkrSN5yKcksyO+7
	asI0LNhoxMPgjEDTYmEvCPf/BBCwKPGGYr4NInSDTMx595lL6SqoNUqwepdImGwLIVDI=;
Message-ID: <418ffeb7-a088-28e8-c1b3-8f5ced317666@xen.org>
Date: Fri, 8 Jul 2022 08:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
 <20220707203803.798317-3-burzalodowa@gmail.com>
 <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
 <c46137a2-d65c-3292-6e1c-8578e771f3b9@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c46137a2-d65c-3292-6e1c-8578e771f3b9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/07/2022 08:17, Xenia Ragiadakou wrote:
> Hi Julien,

Hi Xenia,

> On 7/8/22 01:26, Julien Grall wrote:
>> Hi Xenia,
>>
>> On 07/07/2022 21:38, Xenia Ragiadakou wrote:
>>> Add an arm subdirectory under automation/configs for the arm specific 
>>> configs
>>> and add a config that enables static allocation.
>>>
>>> Modify the build script to search for configs also in this 
>>> subdirectory and to
>>> keep the generated xen binary, suffixed with the config file name, as 
>>> artifact.
>>>
>>> Create a test job that
>>> - boots xen on qemu with a single direct mapped dom0less guest 
>>> configured with
>>> statically allocated memory
>>> - verifies that the memory ranges reported in the guest's logs are 
>>> the same
>>> with the provided static memory regions
>>>
>>> For guest kernel, use the 5.9.9 kernel from the tests-artifacts 
>>> containers.
>>> Use busybox-static package, to create the guest ramdisk.
>>> To generate the u-boot script, use ImageBuilder.
>>> Use the qemu from the tests-artifacts containers.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> ---
>>>   automation/configs/arm/static_mem          |   3 +
>>>   automation/gitlab-ci/test.yaml             |  24 +++++
>>>   automation/scripts/build                   |   4 +
>>>   automation/scripts/qemu-staticmem-arm64.sh | 114 +++++++++++++++++++++
>>>   4 files changed, 145 insertions(+)
>>>   create mode 100644 automation/configs/arm/static_mem
>>>   create mode 100755 automation/scripts/qemu-staticmem-arm64.sh
>>>
>>> diff --git a/automation/configs/arm/static_mem 
>>> b/automation/configs/arm/static_mem
>>> new file mode 100644
>>> index 0000000000..84675ddf4e
>>> --- /dev/null
>>> +++ b/automation/configs/arm/static_mem
>>> @@ -0,0 +1,3 @@
>>> +CONFIG_EXPERT=y
>>> +CONFIG_UNSUPPORTED=y
>>> +CONFIG_STATIC_MEMORY=y
>>> \ No newline at end of file
>>
>> Any particular reason to build a new Xen rather enable 
>> CONFIG_STATIC_MEMORY in the existing build
> 
> IIUC, the xen binary (built with the arm64_defconfig) is used by the two 
> other arm64 test jobs qemu-smoke-arm64-gcc and qemu-alpine-arm64-gcc. I 
> did not want to change its configuration.
> 
> If there is no issue with changing its configuration, I can enable 
> static memory and use this one. 

I would expect a Xen built to CONFIG_STATIC_MEMORY to continue to work 
in normal case. So it should be fine to enable by default.

> But to be honest, I would like to be 
> able also to test with custom configs.

That's fine. But in this case...

> 
>>> diff --git a/automation/scripts/build b/automation/scripts/build
>>> index 21b3bc57c8..9c6196d9bd 100755
>>> --- a/automation/scripts/build
>>> +++ b/automation/scripts/build
>>> @@ -83,6 +83,7 @@ fi
>>>   # Build all the configs we care about
>>>   case ${XEN_TARGET_ARCH} in
>>>       x86_64) arch=x86 ;;
>>> +    arm64) arch=arm ;;
>>>       *) exit 0 ;;
>>>   esac
>>> @@ -93,4 +94,7 @@ for cfg in `ls ${cfg_dir}`; do
>>>       rm -f xen/.config
>>>       make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} 
>>> defconfig
>>>       make -j$(nproc) -C xen
>>> +    if [[ ${arch} == "arm" ]]; then
>>> +        cp xen/xen binaries/xen-${cfg}
>>> +    fi
>>
>> This feels a bit of a hack to be arm only. Can you explain why this is 
>> not enabled for x86 (other than this is not yet used)?
> 
> I did not want to change the existing behavior for x86.


... I don't think this should be restricted to arm. I would also 
consider to do this change separately to avoid mixing infrastructure 
change and new test.

[...]

>>> +# ImageBuilder
>>> +rm -rf imagebuilder
>>> +git clone https://gitlab.com/ViryaOS/imagebuilder
>>> +
>>> +echo "MEMORY_START=\"0x40000000\"
>>> +MEMORY_END=\"0x0200000000\"
>>> +
>>> +DEVICE_TREE=\"virt-gicv2.dtb\"
>>> +
>>> +XEN=\"xen-static_mem\"
>>> +XEN_CMD=\"console=dtuart earlyprintk xsm=dummy\"
>>
>> AFAIK, earlyprintk is not an option for Xen on Arm (at least). It is 
>> also not clear why you need to pass xsm=dummy.
> 
> It is not clear to me either :). I will remove them.

Where was this command line copied from? If it is an Arm documentation 
(or script), then they should be corrected.

>>> +
>>> +(grep -q "Xen dom0less mode detected" qemu-staticmem.serial) || exit 1
>>> +
>>> +for ((i=0; i<${#base[@]}; i++))
>>> +do
>>> +    start="$(printf "0x%016x" ${base[$i]})"
>>> +    end="$(printf "0x%016x" $((${base[$i]} + ${size[$i]} - 1)))"
>>> +    grep -q "node   0: \[mem ${start}-${end}\]" qemu-staticmem.serial
>>> +    if test $? -eq 1
>>> +    then
>>> +        exit 1
>>> +    fi
>>> +done
>>
>> Please add a comment on top to explain what this is meant to do. 
>> However, I think we should avoid relying on output that we have 
>> written ourself. IOW, relying on Xen/Linux to always write the same 
>> message is risky because they can change at any time.
> 
> The kernel is taken from a test-artifact container, so, IIUC, it won't 
> change.

This statement is correct today. However, we may decide to update the 
kernel or test multiple kernels (with different ouput).

In the first case, it would be a matter of updating the script. This is 
annoying but not too bad. In the second case, we would need to have "if 
version X ... else if version Y ... ".

Cheers,

-- 
Julien Grall

