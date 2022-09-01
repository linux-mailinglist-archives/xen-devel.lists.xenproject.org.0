Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861635A9BE1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 17:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396799.637126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmIc-0007bm-R9; Thu, 01 Sep 2022 15:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396799.637126; Thu, 01 Sep 2022 15:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmIc-0007YH-NE; Thu, 01 Sep 2022 15:40:10 +0000
Received: by outflank-mailman (input) for mailman id 396799;
 Thu, 01 Sep 2022 15:40:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTmIb-0007Xn-Cj
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 15:40:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTmIb-0006nR-2z; Thu, 01 Sep 2022 15:40:09 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTmIa-0000id-Sh; Thu, 01 Sep 2022 15:40:09 +0000
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
	bh=KPRpPBebM4gjx9WMpJsAaLLlk7R/JZF85jsc/EGU+0k=; b=z6arhtJ4qNfD5LWuXvnlrPPWx3
	XGNa7fw3AvFaH13zC8wqJnZaIa/K88/Z+qm07ueKqrgeKTyjxrDmLS3kueoh73AAn/70BIvAusf3U
	xhCTUvYjfBn52Z8l4IbPfU/jTTe5bHjYE5PXmoJBPT7qPXLKnMoF4qkECc0BR35P+hwk=;
Message-ID: <3b58faef-d87d-3381-f54d-8ccdc0ea105f@xen.org>
Date: Thu, 1 Sep 2022 16:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v6 1/9] xen/arm: introduce static shared memory
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-2-Penny.Zheng@arm.com>
 <ce6c2e20-2d5f-dccc-e4d0-0e8ce92caeb4@xen.org>
 <AM0PR08MB453055962750CBD525997CE7F7769@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB453055962750CBD525997CE7F7769@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 29/08/2022 07:57, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Friday, August 26, 2022 9:17 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Stefano Stabellini <sstabellini@kernel.org>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v6 1/9] xen/arm: introduce static shared memory
>>
>> Hi Penny,
>>
> 
> Hi Julien
>   
>> On 21/07/2022 14:21, Penny Zheng wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>
>>> This patch series introduces a new feature: setting up static shared
>>> memory on a dom0less system, through device tree configuration.
>>>
>>> This commit parses shared memory node at boot-time, and reserve it in
>>> bootinfo.reserved_mem to avoid other use.
>>>
>>> This commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
>>> static-shm-related codes, and this option depends on static memory(
>>> CONFIG_STATIC_MEMORY). That's because that later we want to reuse a
>>> few helpers, guarded with CONFIG_STATIC_MEMORY, like
>>> acquire_staticmem_pages, etc, on static shared memory.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>> v6 change:
>>> - when host physical address is ommited, output the error message
>>> since xen doesn't support it at the moment
>>> - add the following check: 1) The shm ID matches and the region
>>> exactly match
>>> 2) The shm ID doesn't match and the region doesn't overlap
>>> - change it to "unsigned int" to be aligned with nr_banks
>>> - check the len of the property to confirm is it big enough to contain
>>> "paddr", "size", and "gaddr"
>>> - shm_id defined before nr_shm_domain, so we could re-use the existing
>>> hole and avoid increasing the size of the structure.
>>> - change "nr_shm_domain" to "nr_shm_borrowers", to not increment if
>>> the role is owner in parsing code
>>> - make "xen,shm_id" property as arbitrary string, with a strict limit
>>> on the number of characters, MAX_SHM_ID_LENGTH
>>> ---
>>> v5 change:
>>> - no change
>>> ---
>>> v4 change:
>>> - nit fix on doc
>>> ---
>>> v3 change:
>>> - make nr_shm_domain unsigned int
>>> ---
>>> v2 change:
>>> - document refinement
>>> - remove bitmap and use the iteration to check
>>> - add a new field nr_shm_domain to keep the number of shared domain
>>> ---
>>>    docs/misc/arm/device-tree/booting.txt | 124 ++++++++++++++++++++
>>>    xen/arch/arm/Kconfig                  |   6 +
>>>    xen/arch/arm/bootfdt.c                | 157 ++++++++++++++++++++++++++
>>>    xen/arch/arm/include/asm/setup.h      |   9 ++
>>>    4 files changed, 296 insertions(+)
>>>
>>> diff --git a/docs/misc/arm/device-tree/booting.txt
>>> b/docs/misc/arm/device-tree/booting.txt
>>> index 98253414b8..8013fb98fe 100644
>>> --- a/docs/misc/arm/device-tree/booting.txt
>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>> @@ -378,3 +378,127 @@ device-tree:
>>>
>>>    This will reserve a 512MB region starting at the host physical address
>>>    0x30000000 to be exclusively used by DomU1.
>>> +
>>> +Static Shared Memory
>>> +====================
>>> +
>>> +The static shared memory device tree nodes allow users to statically
>>> +set up shared memory on dom0less system, enabling domains to do
>>> +shm-based communication.
>>> +
>>> +- compatible
>>> +
>>> +    "xen,domain-shared-memory-v1"
>>> +
>>> +- xen,shm-id
>>> +
>>> +    An arbitrary string that represents the unique identifier of the shared
>>> +    memory region, with a strict limit on the number of characters(\0
>> included),
>>> +    `MAX_SHM_ID_LENGTH(16)`. e.g. "xen,shm-id = "my-shared-mem-1"".
>>> +
>>> +- xen,shared-mem
>>> +
>>> +    An array takes a physical address, which is the base address of the
>>> +    shared memory region in host physical address space, a size, and a
>> guest
>>> +    physical address, as the target address of the mapping.
>>> +    e.g. xen,shared-mem = < [host physical address] [size] [guest
>>> + address] >
>>
>> Your implementation below is checking for overlap and also have some
>> restriction. Can they be documented in the binding?
>>
>>> +
>>> +    The number of cells for the host address (and size) is the same as the
>>> +    guest pseudo-physical address and they are inherited from the parent
>> node.
>>
>> In v5, we discussed to have the host address optional. However, the binding
>> has not been updated to reflect that. Note that I am not asking to implement,
>> but instead request that the binding can be used for such setup.
>>
> 
> How about:
> "
> Host physical address could be omitted by users, and let Xen decide where it locates.
> "

I am fine with that.

> Do you think I shall further point out that right now, this part feature is not implemented
> in codes?

I have made a couple of suggestion for the code. But I think the binding 
would look a bit odd without the host physical address. We would now have:

< [size] [guest address]>

I think it would be more natural if we had

<[guest address] [size]>

And

<[guest address] [size] [host physical address]>

> 
>>> a/xen/arch/arm/include/asm/setup.h
>> b/xen/arch/arm/include/asm/setup.h
>>> index 2bb01ecfa8..39d4e93b8b 100644
>>> --- a/xen/arch/arm/include/asm/setup.h
>>> +++ b/xen/arch/arm/include/asm/setup.h
>>> @@ -23,10 +23,19 @@ typedef enum {
>>>    }  bootmodule_kind;
>>>
>>>
>>> +#ifdef CONFIG_STATIC_SHM
>>> +/* Indicates the maximum number of characters(\0 included) for shm_id
>>> +*/ #define MAX_SHM_ID_LENGTH 16 #endif
>>
>> Is the #ifdef really needed?
>>
>>> +
>>>    struct membank {
>>>        paddr_t start;
>>>        paddr_t size;
>>>        bool xen_domain; /* whether the memory bank is bound to a Xen
>>> domain. */
>>> +#ifdef CONFIG_STATIC_SHM
>>> +    char shm_id[MAX_SHM_ID_LENGTH];
>>> +    unsigned int nr_shm_borrowers;
>>> +#endif
>>>    };
>>
>> If I calculated right, the structure will grow from 24 to 40 bytes. At the
>> moment, this is protected with CONFIG_STATIC_SHM which is unsupported.
>> However, I think we will need to do something as we can't continue to grow
>> 'membank' like that.
>>
>> I don't have a quick suggestion for 4.17 (the feature freeze is in a week). Long
>> term, I think we will want to consider to move the shm ID in a separate array
>> that could be referenced here.
>>
>> The other solution would be to have the shared memory regions in a
>> separate array. They would have their own structure which would either
>> embedded "membank" or contain a pointer/index to the bank.
>>
> 
> Ok, so other than this fixing, others will be addressed in the next serie. And this
> part fixing will be introduced in a new follow-up patch serie after 4.17 release.
> 
> I'm in favor of introducing a new structure to contain shm-related data and let
> 'membank' contains a pointer to it, like
> ```
>   +struct shm_membank {
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +}
> +
>   struct membank {
>       paddr_t start;
>       paddr_t size;
>       bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
> +    struct shm_membank *shm;
>   };
> ```
> Then every time we introduce a new feature here, following this strategy, 'membank' will
> at most grow 8 bytes for the reference.

Be aware that we are very early in Xen and therefore dynamically 
allocating memory is not possible. Therefore 'shm_membank' would most 
likely need to be static.

At which point, this could be an index.

> 
> I'm open to the discussion and will let it decide what it finally will be. ;)

My original idea was to have 'shm_membank' pointing to the 'membank' 
rather than the other way around. But I don't have a strong argument 
either way.

So I would need to see the resulting code. Anyway, that's for post-4.17.

Cheers,

-- 
Julien Grall

