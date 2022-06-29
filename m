Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8355FD5F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357788.586594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6V1z-0004gl-RT; Wed, 29 Jun 2022 10:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357788.586594; Wed, 29 Jun 2022 10:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6V1z-0004e3-Ol; Wed, 29 Jun 2022 10:34:47 +0000
Received: by outflank-mailman (input) for mailman id 357788;
 Wed, 29 Jun 2022 10:34:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6V1y-0004dx-Mt
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:34:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6V1y-00009U-3Z; Wed, 29 Jun 2022 10:34:46 +0000
Received: from [54.239.6.187] (helo=[192.168.9.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6V1x-00047W-TP; Wed, 29 Jun 2022 10:34:46 +0000
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
	bh=SFUA7YNICG+IslhnVSZ93t4ry5H9zkAIIe/R5MN3gks=; b=P1K6Ry2j3UVxhrbXi0CXrKXHlt
	bGWeaKKgLk03ArXtjFcab/2BLwXbnuoJKpA+tuAaYhbm1T3A0Pcs24xZrH8OXwDslZLRkgWsp/4ya
	4cw3VGkmUMue7lKj0WIPBf49VkxsoeIKdhkntN2zWSTS4WBQgPAxikmxj5lG1h0UMy48=;
Message-ID: <5a49381c-c69d-88dc-1bba-783241dbfe23@xen.org>
Date: Wed, 29 Jun 2022 11:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-3-Penny.Zheng@arm.com>
 <3b7b32cb-df48-e458-e8a9-f17e86f39c9a@xen.org>
 <DU2PR08MB7325A7C7C50807D7FF6AE280F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB7325A7C7C50807D7FF6AE280F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/06/2022 08:13, Penny Zheng wrote:
> Hi Julien

Hi Penny,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Saturday, June 25, 2022 2:22 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Jan Beulich <jbeulich@suse.com>; Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH v5 2/8] xen/arm: allocate static shared memory to the
>> default owner dom_io
>>
>> Hi Penny,
>>
>> On 20/06/2022 06:11, Penny Zheng wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>
>>> This commit introduces process_shm to cope with static shared memory
>>> in domain construction.
>>>
>>> DOMID_IO will be the default owner of memory pre-shared among
>> multiple
>>> domains at boot time, when no explicit owner is specified.
>>
>> The document in patch #1 suggest the page will be shared with dom_shared.
>> But here you say "DOMID_IO".
>>
>> Which one is correct?
>>
> 
> I’ll fix the documentation, DOM_IO is the last call.
> 
>>>
>>> This commit only considers allocating static shared memory to dom_io
>>> when owner domain is not explicitly defined in device tree, all the
>>> left, including the "borrower" code path, the "explicit owner" code
>>> path, shall be introduced later in the following patches.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>> v5 change:
>>> - refine in-code comment
>>> ---
>>> v4 change:
>>> - no changes
>>> ---
>>> v3 change:
>>> - refine in-code comment
>>> ---
>>> v2 change:
>>> - instead of introducing a new system domain, reuse the existing
>>> dom_io
>>> - make dom_io a non-auto-translated domain, then no need to create P2M
>>> for it
>>> - change dom_io definition and make it wider to support static shm
>>> here too
>>> - introduce is_shm_allocated_to_domio to check whether static shm is
>>> allocated yet, instead of using shm_mask bitmap
>>> - add in-code comment
>>> ---
>>>    xen/arch/arm/domain_build.c | 132
>> +++++++++++++++++++++++++++++++++++-
>>>    xen/common/domain.c         |   3 +
>>>    2 files changed, 134 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 7ddd16c26d..91a5ace851 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -527,6 +527,10 @@ static bool __init
>> append_static_memory_to_bank(struct domain *d,
>>>        return true;
>>>    }
>>>
>>> +/*
>>> + * If cell is NULL, pbase and psize should hold valid values.
>>> + * Otherwise, cell will be populated together with pbase and psize.
>>> + */
>>>    static mfn_t __init acquire_static_memory_bank(struct domain *d,
>>>                                                   const __be32 **cell,
>>>                                                   u32 addr_cells, u32
>>> size_cells, @@ -535,7 +539,8 @@ static mfn_t __init
>> acquire_static_memory_bank(struct domain *d,
>>>        mfn_t smfn;
>>>        int res;
>>>
>>> -    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
>>> +    if ( cell )
>>> +        device_tree_get_reg(cell, addr_cells, size_cells, pbase,
>>> + psize);
>>
>> I think this is a bit of a hack. To me it sounds like this should be moved out to
>> a separate helper. This will also make the interface of
>> acquire_shared_memory_bank() less questionable (see below).
>>
> 
> Ok,  I'll try to not reuse acquire_static_memory_bank in
> acquire_shared_memory_bank.

I am OK with that so long it doesn't involve too much duplication.

>>>        ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize,
>>> PAGE_SIZE));
>>
>> In the context of your series, who is checking that both psize and pbase are
>> suitably aligned?
>>
> 
> Actually, the whole parsing process is redundant for the static shared memory.
> I've already parsed it and checked it before in process_shm.

I looked at process_shm() and couldn't find any code that would check 
pbase and psize are suitable aligned (ASSERT() doesn't count).

> 
>>> +    return true;
>>> +}
>>> +
>>> +static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>>> +                                               u32 addr_cells, u32 size_cells,
>>> +                                               paddr_t *pbase,
>>> +paddr_t *psize)
>>
>> There is something that doesn't add-up in this interface. The use of pointer
>> implies that pbase and psize may be modified by the function. So...
>>
> 
> Just like you points out before, it's a bit hacky to use acquire_static_memory_bank,
> and the pointer used here is also due to it. Internal parsing process of acquire_static_memory_bank
> needs pointer to deliver the result.
> 
> I’ll rewrite acquire_shared_memory, and it will be like:
> "
> static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>                                                 paddr_t pbase, paddr_t psize)
> {
>      mfn_t smfn;
>      unsigned long nr_pfns;
>      int res;
> 
>      /*
>       * Pages of statically shared memory shall be included
>       * in domain_tot_pages().
>       */
>      nr_pfns = PFN_DOWN(psize);
>      if ( d->max_page + nr_pfns > UINT_MAX )

On Arm32, this check would always be true a 32-bit unsigned value is 
always below UINT_MAX. On arm64, you might get away because nr_pfns is 
unsigned long (so I think the type promotion works). But this is fragile.

I would suggest to use the following check:

(UINT_MAX - d->max_page) < nr_pfns

>      {
>          printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
>                 d, psize);
>          return INVALID_MFN;
>      }
>      d->max_pages += nr_pfns;
> 
>      smfn = maddr_to_mfn(pbase);
>      res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
>      if ( res )
>      {
>          printk(XENLOG_ERR
>                 "%pd: failed to acquire static memory: %d.\n", d, res);
>          return INVALID_MFN;
>      }
> 
>      return smfn
> }
> "
> 
>>> +{
>>> +    /*
>>> +     * Pages of statically shared memory shall be included
>>> +     * in domain_tot_pages().
>>> +     */
>>> +    d->max_pages += PFN_DOWN(*psize);
>>
>> ... it sounds a bit strange to use psize here. If psize, can't be modified than it
>> should probably not be a pointer.
>>
>> Also, where do you check that d->max_pages will not overflow?
>>
> 
> I'll check the overflow as follows:

See above about the check.

> "
>      nr_pfns = PFN_DOWN(psize);
>      if ( d->max_page + nr_pfns > UINT_MAX )
>      {
>          printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
>                 d, psize);
>          return INVALID_MFN;
>      }
>      d->max_pages += nr_pfns;
> "
> 
>>> +
>>> +    return acquire_static_memory_bank(d, NULL, addr_cells, size_cells,
>>> +                                      pbase, psize);
>>> +
>>> +}
>>> +
>>> +/*
>>> + * Func allocate_shared_memory is supposed to be only called
>>
>> I am a bit concerned with the word "supposed". Are you implying that it may
>> be called by someone that is not the owner? If not, then it should be
>> "should".
>>
>> Also NIT: Spell out completely "func". I.e "The function".
>>
>>> + * from the owner.
>>
>> I read from as "current should be the owner". But I guess this is not what you
>> mean here. Instead it looks like you mean "d" is the owner. So I would write
>> "d should be the owner of the shared area".
>>
>> It would be good to have a check/ASSERT confirm this (assuming this is easy
>> to write).
>>
> 
> The check is already in the calling path, I guess...

Can you please confirm it?

[...]

>>> +        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
>>> +        if ( !prop )
>>> +        {
>>> +            printk("Shared memory node does not provide \"xen,shared-
>> mem\" property.\n");
>>> +            return -ENOENT;
>>> +        }
>>> +        cells = (const __be32 *)prop->value;
>>> +        /* xen,shared-mem = <pbase, psize, gbase>; */
>>> +        device_tree_get_reg(&cells, addr_cells, size_cells, &pbase, &psize);
>>> +        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize,
>>> + PAGE_SIZE));
>>
>> See above about what ASSERT()s are for.
>>
> 
> Do you think address was suitably checked here, is it enough?

As I wrote before, ASSERT() should not be used to check user inputs. 
They need to happen in both debug and production build.

> If it is enough, I'll modify above ASSERT() to mfn_valid()

It is not clear what ASSERT() you are referring to.

Cheers,

-- 
Julien Grall

