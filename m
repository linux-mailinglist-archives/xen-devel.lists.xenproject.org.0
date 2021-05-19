Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A038978D
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 22:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130407.244329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljSW5-0005p7-FX; Wed, 19 May 2021 20:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130407.244329; Wed, 19 May 2021 20:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljSW5-0005kB-CT; Wed, 19 May 2021 20:10:05 +0000
Received: by outflank-mailman (input) for mailman id 130407;
 Wed, 19 May 2021 20:10:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljSW3-0005Wk-TX
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 20:10:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljSW3-0001Sr-Nh; Wed, 19 May 2021 20:10:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljSW3-0003bs-HQ; Wed, 19 May 2021 20:10:03 +0000
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
	bh=jeeplVUrpI5vSqsEwgVxlFss+v6TihWakEDQEIh+8so=; b=t+XVoox0cV8fBC6k8eXBh9F5m1
	MkpzQVV/0yO1sUNA5YZdibjwucInneCAa6SRWGRPZDV2m/yCcGreM+8q1jKjLq8bWiiISpzOjbACM
	vkAGL4QMHGYwFJmw9+TxJjTkDlOgl/zuJIDlbR3TINHqntezX4zxYWNLErmvg1ZvL/OI=;
Subject: Re: [PATCH 10/10] xen/arm: introduce allocate_static_memory
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-11-penny.zheng@arm.com>
 <7e9bacde-8a1c-c9f8-a06d-2f39f2192315@xen.org>
 <VE1PR08MB5215B4D187DFE8AE20DF2B95F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <72a374ca-4d75-70b4-3ee9-ad1dbdefa2d6@xen.org>
Date: Wed, 19 May 2021 21:10:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215B4D187DFE8AE20DF2B95F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 19/05/2021 08:27, Penny Zheng wrote:
> Hi Julien
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, May 18, 2021 8:06 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>
>> Subject: Re: [PATCH 10/10] xen/arm: introduce allocate_static_memory
>>
>> Hi Penny,
>>
>> On 18/05/2021 06:21, Penny Zheng wrote:
>>> This commit introduces allocate_static_memory to allocate static
>>> memory as guest RAM for domain on Static Allocation.
>>>
>>> It uses alloc_domstatic_pages to allocate pre-defined static memory
>>> banks for this domain, and uses guest_physmap_add_page to set up P2M
>>> table, guest starting at fixed GUEST_RAM0_BASE, GUEST_RAM1_BASE.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>    xen/arch/arm/domain_build.c | 157
>> +++++++++++++++++++++++++++++++++++-
>>>    1 file changed, 155 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 30b55588b7..9f662313ad 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -437,6 +437,50 @@ static bool __init allocate_bank_memory(struct
>> domain *d,
>>>        return true;
>>>    }
>>>
>>> +/*
>>> + * #ram_index and #ram_index refer to the index and starting address
>>> +of guest
>>> + * memory kank stored in kinfo->mem.
>>> + * Static memory at #smfn of #tot_size shall be mapped #sgfn, and
>>> + * #sgfn will be next guest address to map when returning.
>>> + */
>>> +static bool __init allocate_static_bank_memory(struct domain *d,
>>> +                                               struct kernel_info *kinfo,
>>> +                                               int ram_index,
>>
>> Please use unsigned.
>>
>>> +                                               paddr_t ram_addr,
>>> +                                               gfn_t* sgfn,
>>
>> I am confused, what is the difference between ram_addr and sgfn?
>>
> 
> We need to constructing kinfo->mem(guest RAM banks) here, and
> we are indexing in static_mem(physical ram banks). Multiple physical ram
> banks consist of one guest ram bank(like, GUEST_RAM0).
> 
> ram_addr  here will either be GUEST_RAM0_BASE, or GUEST_RAM1_BASE,
> for now. I kinds struggled in how to name it. And maybe it shall not be a
> parameter here.
> 
> Maybe I should switch.. case.. on the ram_index, if its 0, its GUEST_RAM0_BASE,
> And if its 1, its GUEST_RAM1_BASE.

You only need to set kinfo->mem.bank[ram_index].start once. This is when 
you know the bank is first used.

AFAICT, this function will map the memory for a range start at ``sgfn``. 
It doesn't feel this belongs to the function.

The same remark is valid for kinfo->mem.nr_banks.

>>> +                                               mfn_t smfn,
>>> +                                               paddr_t tot_size) {
>>> +    int res;
>>> +    struct membank *bank;
>>> +    paddr_t _size = tot_size;
>>> +
>>> +    bank = &kinfo->mem.bank[ram_index];
>>> +    bank->start = ram_addr;
>>> +    bank->size = bank->size + tot_size;
>>> +
>>> +    while ( tot_size > 0 )
>>> +    {
>>> +        unsigned int order = get_allocation_size(tot_size);
>>> +
>>> +        res = guest_physmap_add_page(d, *sgfn, smfn, order);
>>> +        if ( res )
>>> +        {
>>> +            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
>>> +            return false;
>>> +        }
>>> +
>>> +        *sgfn = gfn_add(*sgfn, 1UL << order);
>>> +        smfn = mfn_add(smfn, 1UL << order);
>>> +        tot_size -= (1ULL << (PAGE_SHIFT + order));
>>> +    }
>>> +
>>> +    kinfo->mem.nr_banks = ram_index + 1;
>>> +    kinfo->unassigned_mem -= _size;
>>> +
>>> +    return true;
>>> +}
>>> +
>>>    static void __init allocate_memory(struct domain *d, struct kernel_info
>> *kinfo)
>>>    {
>>>        unsigned int i;
>>> @@ -480,6 +524,116 @@ fail:
>>>              (unsigned long)kinfo->unassigned_mem >> 10);
>>>    }
>>>
>>> +/* Allocate memory from static memory as RAM for one specific domain
>>> +d. */ static void __init allocate_static_memory(struct domain *d,
>>> +                                            struct kernel_info
>>> +*kinfo) {
>>> +    int nr_banks, _banks = 0;
>>
>> AFAICT, _banks is the index in the array. I think it would be clearer if it is
>> caller 'bank' or 'idx'.
>>
> 
> Sure, I’ll use the 'bank' here.
> 
>>> +    size_t ram0_size = GUEST_RAM0_SIZE, ram1_size = GUEST_RAM1_SIZE;
>>> +    paddr_t bank_start, bank_size;
>>> +    gfn_t sgfn;
>>> +    mfn_t smfn;
>>> +
>>> +    kinfo->mem.nr_banks = 0;
>>> +    sgfn = gaddr_to_gfn(GUEST_RAM0_BASE);
>>> +    nr_banks = d->arch.static_mem.nr_banks;
>>> +    ASSERT(nr_banks >= 0);
>>> +
>>> +    if ( kinfo->unassigned_mem <= 0 )
>>> +        goto fail;
>>> +
>>> +    while ( _banks < nr_banks )
>>> +    {
>>> +        bank_start = d->arch.static_mem.bank[_banks].start;
>>> +        smfn = maddr_to_mfn(bank_start);
>>> +        bank_size = d->arch.static_mem.bank[_banks].size;
>>
>> The variable name are slightly confusing because it doesn't tell whether this
>> is physical are guest RAM. You might want to consider to prefix them with p
>> (resp. g) for physical (resp. guest) RAM.
> 
> Sure, I'll rename to make it more clearly.
> 
>>
>>> +
>>> +        if ( !alloc_domstatic_pages(d, bank_size >> PAGE_SHIFT, bank_start,
>> 0) )
>>> +        {
>>> +            printk(XENLOG_ERR
>>> +                    "%pd: cannot allocate static memory"
>>> +                    "(0x%"PRIx64" - 0x%"PRIx64")",
>>
>> bank_start and bank_size are both paddr_t. So this should be PRIpaddr.
> 
> Sure, I'll change
> 
>>
>>> +                    d, bank_start, bank_start + bank_size);
>>> +            goto fail;
>>> +        }
>>> +
>>> +        /*
>>> +         * By default, it shall be mapped to the fixed guest RAM address
>>> +         * `GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.
>>> +         * Starting from RAM0(GUEST_RAM0_BASE).
>>> +         */
>>
>> Ok. So you are first trying to exhaust the guest bank 0 and then moved to
>> bank 1. This wasn't entirely clear from the design document.
>>
>> I am fine with that, but in this case, the developper should not need to know
>> that (in fact this is not part of the ABI).
>>
>> Regarding this code, I am a bit concerned about the scalability if we introduce
>> a second bank.
>>
>> Can we have an array of the possible guest banks and increment the index
>> when exhausting the current bank?
>>
> 
> Correct me if I understand wrongly,
> 
> What you suggest here is that we make an array of guest banks, right now, including
> GUEST_RAM0 and GUEST_RAM1. And if later, adding more guest banks, it will not
> bring scalability problem here, right?

Yes. This should also reduce the current complexity of the code.

Cheers,

-- 
Julien Grall

