Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085676474B6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 17:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457377.715267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3K9f-0008No-2Y; Thu, 08 Dec 2022 16:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457377.715267; Thu, 08 Dec 2022 16:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3K9e-0008M2-Vq; Thu, 08 Dec 2022 16:53:50 +0000
Received: by outflank-mailman (input) for mailman id 457377;
 Thu, 08 Dec 2022 16:53:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3K9d-0008Lw-VU
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 16:53:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3K9d-0006UQ-SJ
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 16:53:49 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.4.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3K9d-0004H6-Lu; Thu, 08 Dec 2022 16:53:49 +0000
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
	bh=qtKXtNXapx+Sen/CIUkwxiPWlXUqIvGnc75bgUDTNPs=; b=J4tTmysdBxwhwwPmvG/HMAmcMt
	0M2dKPjVSNl84BNngfqJV1JvqSuhVWLcO4gHuWxwZ1KUKP8XePio4oQNcoRLrcI3d02e6Eh12fFs9
	A+kAhcGcW1I+YBPFb3cUiUA6DzxU0mrhxmywdKqNKCMzfMFIcQVEmqo/7uqC5L2w0Gi0=;
Message-ID: <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org>
Date: Thu, 8 Dec 2022 16:53:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
 <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/12/2022 15:24, Michal Orzel wrote:
> On 08/12/2022 14:51, Julien Grall wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> Hi,
>>
>> Title extra NIT: I have seen it multiple time and so far refrain to say
>> it. Please use 'arm' rather than 'Arm'. This is for consistency in the
>> way we name the subsystem in the title.
>>
>> On 08/12/2022 12:49, Ayan Kumar Halder wrote:
>>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>>> result, it contains the default value (ie 0). This causes,
>>> kernel_zimage_place() to treat the binary (contained within uImage) as
>>> position independent executable. Thus, it loads it at an incorrect address.
>>>
>>> The correct approach would be to read "uimage.ep" and set
>>> info->zimage.start. This will ensure that the binary is loaded at the
>>> correct address.
>>
>> In non-statically allocated setup, a user doesn't know where the memory
>> for dom0/domU will be allocated.
>>
>> So I think this was correct to ignore the address. In fact, I am worry
>> that...
>>
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>
>>> I uncovered this issue while loading Zephyr as a dom0less domU with Xen on
>>> R52 FVP. Zephyr builds with static device tree. Thus, the load address is
>>> always fixed.
>>>
>>>    xen/arch/arm/kernel.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>>> index 2556a45c38..e4e8c67669 100644
>>> --- a/xen/arch/arm/kernel.c
>>> +++ b/xen/arch/arm/kernel.c
>>> @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>        if ( len > size - sizeof(uimage) )
>>>            return -EINVAL;
>>>
>>> +    info->zimage.start = be32_to_cpu(uimage.ep);
>> ... this will now ended up to break anyone that may have set an address
>> but didn't care where it should be loaded.
>>
>> I also understand your use case but now, we have contradictory
>> approaches. I am not entirely sure how we can solve it. We may have to
>> break those users (Cc some folks that may use it). But we should figure
>> out what is the alternative for them.
>>
>> If we decide to break those users, then this should be documented in the
>> commit message and in docs/misc/arm/booting.txt (which interestingly
>> didn't mention uImage).
>>
> So the first issue with Zephyr is that it does not support zImage protocol for arm32.
> Volodymyr added support only for Image header for arm64 Zephyr.
> I guess this is why Ayan, willing to boot it on Xen (arm32), decided to add u-boot header.

If that's the only reason, then I would rather prefer if we go with 
zImage for a few reasons:
  - The zImage protocol has at least some documentation (not perfect) of 
the expected state of the memory/registers when jumping to the image.
  - AFAICT libxl is not (yet) supporting uImage. So this means zephyr 
cannot be loaded on older Xen releases (not great).

Note this doesn't mean we should not fix Xen for uImage.

> Now, there is also a question about supporting arm64 uImage kernels. In Xen kernel_zimage_place,
> we do:
> #ifdef CONFIG_ARM_64
>      if ( info->type == DOMAIN_64BIT )
>          return info->mem.bank[0].start + info->zimage.text_offset;
> #endif
> 
> So if we modify the uImage behavior for arm32, we will break consistency with arm64
> (we would take uImage entry point address into account for arm32 but not for arm64).
> At the moment at least they are in sync.

That's a good point. It would be best if the behavior is consistent.

Cheers,

-- 
Julien Grall

