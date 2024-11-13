Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949F19C790F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 17:42:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835903.1251766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBGQx-0001T5-F1; Wed, 13 Nov 2024 16:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835903.1251766; Wed, 13 Nov 2024 16:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBGQx-0001Qe-Bx; Wed, 13 Nov 2024 16:41:35 +0000
Received: by outflank-mailman (input) for mailman id 835903;
 Wed, 13 Nov 2024 16:41:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tBGQw-0001QY-2O
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 16:41:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBGQv-003KVi-1r;
 Wed, 13 Nov 2024 16:41:33 +0000
Received: from [2a02:8012:3a1:0:2c06:4644:c8a3:2b5e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBGQv-003DhA-1u;
 Wed, 13 Nov 2024 16:41:33 +0000
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
	bh=HVA+R/o9AVUPyxfpGCcndmOSCziqn/HkDXaPvd8693w=; b=4wThfSQyEd1R1E571iqxZP0JFx
	BNSCbiV4IPDZGRE4lKilMEnUjMnTFi6pJGDf/AeavtzZhJJgQIwt0ugKQVOTnGFeez0i4NqvUzW5k
	LGssyB4Q8JQFJQCgaJOLSewGtIQspbHCF2VSvVa/JDhcRq2t9lLkcYVDGCKIGh8yMQ5Y=;
Message-ID: <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
Date: Wed, 13 Nov 2024 16:41:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu
 <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
 <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
 <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/11/2024 15:40, Michal Orzel wrote:
> 
> 
> On 13/11/2024 15:40, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> On 13/11/2024 14:19, Michal Orzel wrote:
>>>
>>>
>>> On 13/11/2024 14:50, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 06/11/2024 15:07, Michal Orzel wrote:
>>>>>
>>>>>
>>>>> On 06/11/2024 14:41, Luca Fancellu wrote:
>>>>>>
>>>>>>
>>>>>> There are some cases where the device tree exposes a memory range
>>>>>> in both /memreserve/ and reserved-memory node, in this case the
>>>>>> current code will stop Xen to boot since it will find that the
>>>>>> latter range is clashing with the already recorded /memreserve/
>>>>>> ranges.
>>>>>>
>>>>>> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
>>>>>> in the /memreserve/ part and even in this case this will prevent
>>>>>> Xen to boot since it will see that the module memory range that
>>>>>> it is going to add in 'add_boot_module' clashes with a /memreserve/
>>>>>> range.
>>>>>>
>>>>>> When Xen populate the data structure that tracks the memory ranges,
>>>>>> it also adds a memory type described in 'enum membank_type', so
>>>>>> in order to fix this behavior, allow the 'check_reserved_regions_overlap'
>>>>>> function to check for exact memory range match given a specific memory
>>>>>> type; allowing reserved-memory node ranges and boot modules to have an
>>>>>> exact match with ranges from /memreserve/.
>>>>>>
>>>>>> While there, set a type for the memory recorded during ACPI boot.
>>>>>>
>>>>>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
>>>>>> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>> ---
>>>>>> I tested this patch adding the same range in a /memreserve/ entry and
>>>>>> /reserved-memory node, and by letting u-boot pass a ramdisk.
>>>>>> I've also tested that a configuration running static shared memory still works
>>>>>> fine.
>>>>>> ---
>>>>> So we have 2 separate issues. I don't particularly like the concept of introducing MEMBANK_NONE
>>>>> and the changes below look a bit too much for me, given that for boot modules we can only have
>>>>> /memreserve/ matching initrd.
>>>>
>>>> How so? Is this an observation or part of a specification?
>>> Not sure what specification you would want to see.
>>
>> Anything that you bake your observation. My concern with observation is ...
>>
>>    It's all part of U-Boot and Linux behavior that is not documented
>> (except for code comments).
>>> My statement is based on the U-Boot and Linux behavior. U-Boot part only present for initrd:
>>> https://github.com/u-boot/u-boot/blob/master/boot/fdt_support.c#L249
>>
>> ... a user is not forced to use U-boot. So this is not a good reason to
> I thought that this behavior is solely down to u-boot playing tricks with memreserve.

Sure we noticed that U-boot is doing some we didn't expect. But this 
really doesn't mean there are not other interesting behavior happening.

> 
>> rely on it. If Linux starts to rely on it, then it is probably a better
>> argument, but first I would need to see the code. Can you paste a link?
> Not sure how I would do that given that it is all scattered. 

There are no requirements to be all scattered.

 > But if it means sth, here is kexec code> to create fdt. It is clear 
they do the same trick as u-boot.
> https://github.com/torvalds/linux/blob/master/drivers/of/kexec.c#L355

Yet this doesn't provide any information why this only has to be an 
exact region... It only tells me the current behavior.

> 
>>
>>>
>>> For things that Xen can be interested in, only region for ramdisk for dom0 can match the /memreserve/ region.
>>> Providing a generic solution (like Luca did) would want providing an example of sth else that can match which I'm not aware of.
>>
>> I would argue this is the other way around. If we are not certain that
>> /memreserve/ will not be used for any other boot module, then we should
>> have a generic solution. Otherwise, we will end up with similar weird
>> issue in the future.
> We have 3 possible modules for bootloader->kernel workflow: kernel, dtb and ramdisk. The first 2 are not described in DT so I'm not sure
> what are your examples of bootmodules for which you want kernel know about memory reservation other than ramdisk.

The DTB is not described but the kernel is. We also have XSM modules. 
All of which could in theory be in memreserve if for some reasons the 
bootloader wanted to preserve the modules for future use (think 
Live-Update)...

Anyway, to be honest, I don't understand why you are pushing back at a 
more generic solution... Yes this may be what we just notice today, but 
I haven't seen any evidence that it never happen.

So I would rather go with the generic solution.

Cheers,

-- 
Julien Grall


