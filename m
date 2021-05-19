Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8B3896F6
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 21:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130387.244290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljS90-0001hf-UK; Wed, 19 May 2021 19:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130387.244290; Wed, 19 May 2021 19:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljS90-0001et-RH; Wed, 19 May 2021 19:46:14 +0000
Received: by outflank-mailman (input) for mailman id 130387;
 Wed, 19 May 2021 19:46:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljS8z-0001en-Go
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 19:46:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljS8z-0000xn-Bn; Wed, 19 May 2021 19:46:13 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljS8z-0001xs-56; Wed, 19 May 2021 19:46:13 +0000
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
	bh=pz9DbyOAp/jb08WHvI64yligNviNfZwfWLrleamqCI8=; b=ejrVrO7ryiu0CRG5Qy0goa/Af4
	mmoAa7XHPRhq9Szi/Tx3D5OOOd7/Qw3LA2tLvR1gkb0mNDTQVi1A0qjhgjF30xlWF2VM0lnMn5jsO
	xB/epcezT5+hq+Bwg48m/5rlCZwP5axU3ZsNpbkmuISMRWGDi3KcvmSKHXjC4jJwjqg4=;
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
From: Julien Grall <julien@xen.org>
Message-ID: <2f4eb08e-261b-70c4-bcbc-e08db36a50a9@xen.org>
Date: Wed, 19 May 2021 20:46:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/05/2021 04:16, Penny Zheng wrote:
> Hi Julien

Hi Penny,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, May 18, 2021 5:46 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>
>> Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
>>
>>
>>
>> On 18/05/2021 06:21, Penny Zheng wrote:
>>> In order to differentiate pages of static memory, from those allocated
>>> from heap, this patch introduces a new page flag PGC_reserved to tell.
>>>
>>> New struct reserved in struct page_info is to describe reserved page
>>> info, that is, which specific domain this page is reserved to. >
>>> Helper page_get_reserved_owner and page_set_reserved_owner are
>>> designated to get/set reserved page's owner.
>>>
>>> Struct domain is enlarged to more than PAGE_SIZE, due to
>>> newly-imported struct reserved in struct page_info.
>>
>> struct domain may embed a pointer to a struct page_info but never directly
>> embed the structure. So can you clarify what you mean?
>>
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>    xen/include/asm-arm/mm.h | 16 +++++++++++++++-
>>>    1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
>> index
>>> 0b7de3102e..d8922fd5db 100644
>>> --- a/xen/include/asm-arm/mm.h
>>> +++ b/xen/include/asm-arm/mm.h
>>> @@ -88,7 +88,15 @@ struct page_info
>>>             */
>>>            u32 tlbflush_timestamp;
>>>        };
>>> -    u64 pad;
>>> +
>>> +    /* Page is reserved. */
>>> +    struct {
>>> +        /*
>>> +         * Reserved Owner of this page,
>>> +         * if this page is reserved to a specific domain.
>>> +         */
>>> +        struct domain *domain;
>>> +    } reserved;
>>
>> The space in page_info is quite tight, so I would like to avoid introducing new
>> fields unless we can't get away from it.
>>
>> In this case, it is not clear why we need to differentiate the "Owner"
>> vs the "Reserved Owner". It might be clearer if this change is folded in the
>> first user of the field.
>>
>> As an aside, for 32-bit Arm, you need to add a 4-byte padding.
>>
> 
> Yeah, I may delete this change. I imported this change as considering the functionality
> of rebooting domain on static allocation.
> 
> A little more discussion on rebooting domain on static allocation.
> Considering the major user cases for domain on static allocation
> are system has a total pre-defined, static behavior all the time. No domain allocation
> on runtime, while there still exists domain rebooting.

Hmmm... With this series it is still possible to allocate memory at 
runtime outside of the static allocation (see my comment on the design 
document [1]). So is it meant to be complete?

> 
> And when rebooting domain on static allocation, all these reserved pages could
> not go back to heap when freeing them.  So I am considering to use one global
> `struct page_info*[DOMID]` value to store.
>   
> As Jan suggested, when domain get rebooted, struct domain will not exist anymore.
> But I think DOMID info could last.
You would need to make sure the domid to be reserved. But I am not 
entirely convinced this is necessary here.

When recreating the domain, you need a way to know its configuration. 
Mostly likely this will come from the Device-Tree. At which point, you 
can also find the static region from there.

Cheers,

[1] <7ab73cb0-39d5-f8bf-660f-b3d77f3247bd@xen.org>

-- 
Julien Grall

