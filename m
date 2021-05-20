Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1438A07E
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 10:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130768.244773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljeWd-00016z-Aw; Thu, 20 May 2021 08:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130768.244773; Thu, 20 May 2021 08:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljeWd-000140-7S; Thu, 20 May 2021 08:59:27 +0000
Received: by outflank-mailman (input) for mailman id 130768;
 Thu, 20 May 2021 08:59:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljeWc-00013j-2B
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 08:59:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljeWb-0004Zp-PN; Thu, 20 May 2021 08:59:25 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljeWb-0000bL-JA; Thu, 20 May 2021 08:59:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=JnnSLTgV1WSHQxgrbFV08c+JBRaneFJrp2d1GJbRiE4=; b=SOyae/0uRZYtOWDdDTXLEk/H3U
	qafu+GbdAh+Gyh112NhMghauLV1UDqPXkIcCiLEBGLl0v0Hg9iXlPzgONFUnlzaebEM2QN5kn1VJf
	e6wQcdbQH6R9rBxJeg/J7XVrQV0850FMtQOyy/rK4TdkU/X1o3OqGDnTUFMONBEH5PHA=;
Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
 <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
 <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <2f4eb08e-261b-70c4-bcbc-e08db36a50a9@xen.org>
 <VE1PR08MB52155DD56E548E98AE937CE8F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <VE1PR08MB5215E19BFE3E7F329229D8E7F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <44b46f35-cc51-9274-77f2-cfd18c998a38@xen.org>
Date: Thu, 20 May 2021 09:59:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215E19BFE3E7F329229D8E7F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 20/05/2021 09:40, Penny Zheng wrote:
> Hi julien

Hi Penny,

> 
>> -----Original Message-----
>> From: Penny Zheng
>> Sent: Thursday, May 20, 2021 2:20 PM
>> To: Julien Grall <julien@xen.org>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>
>> Subject: RE: [PATCH 03/10] xen/arm: introduce PGC_reserved
>>
>> Hi Julien
>>
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Sent: Thursday, May 20, 2021 3:46 AM
>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>>> sstabellini@kernel.org
>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>>> <Wei.Chen@arm.com>; nd <nd@arm.com>
>>> Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
>>>
>>>
>>>
>>> On 19/05/2021 04:16, Penny Zheng wrote:
>>>> Hi Julien
>>>
>>> Hi Penny,
>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Julien Grall <julien@xen.org>
>>>>> Sent: Tuesday, May 18, 2021 5:46 PM
>>>>> To: Penny Zheng <Penny.Zheng@arm.com>;
>>>>> xen-devel@lists.xenproject.org; sstabellini@kernel.org
>>>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>>>>> <Wei.Chen@arm.com>; nd <nd@arm.com>
>>>>> Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
>>>>>
>>>>>
>>>>>
>>>>> On 18/05/2021 06:21, Penny Zheng wrote:
>>>>>> In order to differentiate pages of static memory, from those
>>>>>> allocated from heap, this patch introduces a new page flag
>>>>>> PGC_reserved
>>> to tell.
>>>>>>
>>>>>> New struct reserved in struct page_info is to describe reserved
>>>>>> page info, that is, which specific domain this page is reserved
>>>>>> to. > Helper page_get_reserved_owner and page_set_reserved_owner
>>>>>> are designated to get/set reserved page's owner.
>>>>>>
>>>>>> Struct domain is enlarged to more than PAGE_SIZE, due to
>>>>>> newly-imported struct reserved in struct page_info.
>>>>>
>>>>> struct domain may embed a pointer to a struct page_info but never
>>>>> directly embed the structure. So can you clarify what you mean?
>>>>>
>>>>>>
>>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>>> ---
>>>>>>     xen/include/asm-arm/mm.h | 16 +++++++++++++++-
>>>>>>     1 file changed, 15 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
>>>>> index
>>>>>> 0b7de3102e..d8922fd5db 100644
>>>>>> --- a/xen/include/asm-arm/mm.h
>>>>>> +++ b/xen/include/asm-arm/mm.h
>>>>>> @@ -88,7 +88,15 @@ struct page_info
>>>>>>              */
>>>>>>             u32 tlbflush_timestamp;
>>>>>>         };
>>>>>> -    u64 pad;
>>>>>> +
>>>>>> +    /* Page is reserved. */
>>>>>> +    struct {
>>>>>> +        /*
>>>>>> +         * Reserved Owner of this page,
>>>>>> +         * if this page is reserved to a specific domain.
>>>>>> +         */
>>>>>> +        struct domain *domain;
>>>>>> +    } reserved;
>>>>>
>>>>> The space in page_info is quite tight, so I would like to avoid
>>>>> introducing new fields unless we can't get away from it.
>>>>>
>>>>> In this case, it is not clear why we need to differentiate the "Owner"
>>>>> vs the "Reserved Owner". It might be clearer if this change is
>>>>> folded in the first user of the field.
>>>>>
>>>>> As an aside, for 32-bit Arm, you need to add a 4-byte padding.
>>>>>
>>>>
>>>> Yeah, I may delete this change. I imported this change as
>>>> considering the functionality of rebooting domain on static allocation.
>>>>
>>>> A little more discussion on rebooting domain on static allocation.
>>>> Considering the major user cases for domain on static allocation are
>>>> system has a total pre-defined, static behavior all the time. No
>>>> domain allocation on runtime, while there still exists domain rebooting.
>>>
>>> Hmmm... With this series it is still possible to allocate memory at
>>> runtime outside of the static allocation (see my comment on the design
>> document [1]).
>>> So is it meant to be complete?
>>>
>>
>> I'm guessing that the "allocate memory at runtime outside of the static
>> allocation" is referring to XEN heap on static allocation, that is, users pre-
>> defining heap in device tree configuration to let the whole system more static
>> and predictable.
>>
>> And I've replied you in the design there, sorry for the late reply. Save your time,
>> and I’ll paste here:
>>
>> "Right now, on AArch64, all RAM, except reserved memory, will be finally
>> given to buddy allocator as heap,  like you said, guest RAM for normal domain
>> will be allocated from there, xmalloc eventually is get memory from there, etc.
>> So we want to refine the heap here, not iterating through `bootinfo.mem` to
>> set up XEN heap, but like iterating `bootinfo. reserved_heap` to set up XEN
>> heap.
>>
>> On ARM32, xen heap and domain heap are separately mapped, which is more
>> complicated here. That's why I only talking about implementing these features
>> on AArch64 as first step."
>>
>>   Above implementation will be delivered through another patch Serie. This
>> patch Serie Is only focusing on Domain on Static Allocation.
>>
> 
> Oh, Second thought on this.
> And I think you are referring to balloon in/out here, hmm, also, like

Yes I am referring to balloon in/out.

> I replied there:
> "For issues on ballooning out or in, it is not supported here.

So long you are not using the solution in prod then you are fine (see 
below)... But then we should make clear this feature is a tech preview.

> Domain on Static Allocation and 1:1 direct-map are all based on
> dom0-less right now, so no PV, grant table, event channel, etc, considered.
> 
> Right now, it only supports device got passthrough into the guest."

So we are not creating the hypervisor node in the DT for dom0less domU. 
However, the hypercalls are still accessible by a domU if it really
wants to use them.

Therefore, a guest can easily mess up with your static configuration and 
predictability.

IMHO, this is a must to solve before "static memory" can be used in 
production.

Cheers,

-- 
Julien Grall

