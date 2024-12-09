Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A944C9E9F44
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 20:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851819.1265825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKjGA-0001sH-SM; Mon, 09 Dec 2024 19:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851819.1265825; Mon, 09 Dec 2024 19:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKjGA-0001pC-Ph; Mon, 09 Dec 2024 19:17:34 +0000
Received: by outflank-mailman (input) for mailman id 851819;
 Mon, 09 Dec 2024 19:17:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tKjG9-0001p6-0e
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 19:17:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tKjG8-00CClY-0W;
 Mon, 09 Dec 2024 19:17:32 +0000
Received: from [2a02:8012:3a1:0:b1c7:cb3b:4877:d8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tKjG8-00AEeA-0a;
 Mon, 09 Dec 2024 19:17:32 +0000
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
	bh=NuyzHtvw7j+22P/MzEihM1BbP+943BZEy5p3voqdxjY=; b=YfnXK5g4DBWcZoDQ4TKyXqhf8b
	hC6UwQPOkrgrZrv60Um3uUv6yqyc2UBW8ij3uEivxK8Cx6RExuw8n6npRe82CF/Nfp0WvLdy8EH0N
	eWpb/3IPmrJFu1KFMJvOdcasDTa4k72L/1HbTVQzPsseks9RWkf+p7rihPI2bMMp8YME=;
Message-ID: <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org>
Date: Mon, 9 Dec 2024 19:17:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0
 construction
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>, xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech>
 <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org>
 <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 07/12/2024 15:04, Michal Orzel wrote:
> 
> 
> On 06/12/2024 19:37, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> Sorry for the late answer.
>>
>> On 05/12/2024 09:40, Michal Orzel wrote:
>>>
>>>
>>> On 02/12/2024 17:59, Carlo Nonato wrote:
>>>>
>>>>
>>>> Cache coloring requires Dom0 not to be direct-mapped because of its non
>>>> contiguous mapping nature, so allocate_memory() is needed in this case.
>>>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
>>>> moved allocate_memory() in dom0less_build.c. In order to use it
>>>> in Dom0 construction bring it back to domain_build.c and declare it in
>>>> domain_build.h.
>>>>
>>>> Take the opportunity to adapt the implementation of allocate_memory() so
>>>> that it uses the host layout when called on the hwdom, via
>>>> find_unallocated_memory().
>>>>
>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>>> ---
>>>> v11:
>>>> - GUEST_RAM_BANKS instead of hardcoding the number of banks in allocate_memory()
>>>> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
>>>> - added a comment in allocate_memory() when skipping small banks
>>>> v10:
>>>> - fixed a compilation bug that happened when dom0less support was disabled
>>>> v9:
>>>> - no changes
>>>> v8:
>>>> - patch adapted to new changes to allocate_memory()
>>>> v7:
>>>> - allocate_memory() now uses the host layout when called on the hwdom
>>>> v6:
>>>> - new patch
>>>> ---
>>>>    xen/arch/arm/dom0less-build.c           | 44 -----------
>>>>    xen/arch/arm/domain_build.c             | 97 ++++++++++++++++++++++++-
>>>>    xen/arch/arm/include/asm/domain_build.h |  1 +
>>>>    3 files changed, 94 insertions(+), 48 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>>> index d93a85434e..67b1503647 100644
>>>> --- a/xen/arch/arm/dom0less-build.c
>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
>>>>        return ( !dom0found && domUfound );
>>>>    }
>>>>
>>>> -static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>> -{
>>>> -    struct membanks *mem = kernel_info_get_mem(kinfo);
>>>> -    unsigned int i;
>>>> -    paddr_t bank_size;
>>>> -
>>>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>>> -           /* Don't want format this as PRIpaddr (16 digit hex) */
>>>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>>> -
>>>> -    mem->nr_banks = 0;
>>>> -    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
>>>> -                               bank_size) )
>>>> -        goto fail;
>>>> -
>>>> -    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
>>>> -                               bank_size) )
>>>> -        goto fail;
>>>> -
>>>> -    if ( kinfo->unassigned_mem )
>>>> -        goto fail;
>>>> -
>>>> -    for( i = 0; i < mem->nr_banks; i++ )
>>>> -    {
>>>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
>>>> -               d,
>>>> -               i,
>>>> -               mem->bank[i].start,
>>>> -               mem->bank[i].start + mem->bank[i].size,
>>>> -               /* Don't want format this as PRIpaddr (16 digit hex) */
>>>> -               (unsigned long)(mem->bank[i].size >> 20));
>>>> -    }
>>>> -
>>>> -    return;
>>>> -
>>>> -fail:
>>>> -    panic("Failed to allocate requested domain memory."
>>>> -          /* Don't want format this as PRIpaddr (16 digit hex) */
>>>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
>>>> -          (unsigned long)kinfo->unassigned_mem >> 10);
>>>> -}
>>>> -
>>>>    #ifdef CONFIG_VGICV2
>>>>    static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>>>>    {
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 2c30792de8..2b8cba9b2f 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
>>>>        }
>>>>    }
>>>>
>>>> -#ifdef CONFIG_DOM0LESS_BOOT
>>>>    bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>>>>                                        alloc_domheap_mem_cb cb, void *extra)
>>>>    {
>>>> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>>>>
>>>>        return true;
>>>>    }
>>>> -#endif
>>>>
>>>>    /*
>>>>     * When PCI passthrough is available we want to keep the
>>>> @@ -1003,6 +1001,94 @@ out:
>>>>        return res;
>>>>    }
>>>>
>>>> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>> +{
>>>> +    struct membanks *mem = kernel_info_get_mem(kinfo);
>>>> +    unsigned int i, nr_banks = GUEST_RAM_BANKS;
>>>> +    paddr_t bank_start, bank_size;
>>> Limit the scope
>>>
>>>> +    struct membanks *hwdom_free_mem = NULL;
>>>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>>>> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>>> Limit the scope
>>>
>>>> +
>>>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>>> +           /* Don't want format this as PRIpaddr (16 digit hex) */
>>>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>>> +
>>>> +    mem->nr_banks = 0;
>>>> +    /*
>>>> +     * Use host memory layout for hwdom. Only case for this is when LLC coloring
>>>> +     * is enabled.
>>>> +     */
>>>> +    if ( is_hardware_domain(d) )
>>>> +    {
>>>> +        ASSERT(llc_coloring_enabled);
>>> This patch does not build because of declaration not being visible. You must include <xen/llc-coloring.h>.
>>
>> Piggying back on this comment. AFAICT, the code below would work also in
>> the non cache coloring case. So what's the assert is for?
>>
>>>
>>>> +
>>>> +        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
>>>> +                                             NR_MEM_BANKS);
>>>> +        if ( !hwdom_free_mem )
>>>> +            goto fail;
>>>> +
>>>> +        hwdom_free_mem->max_banks = NR_MEM_BANKS;
>>>> +
>>>> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
>>> My remarks for the use of find_unallocated_memory() 1:1 have not been addressed. You did not even
>>> change the comments inside the function. The problem is that the function is specifically designed
>>> for finding extended regions and assumes being called at certain point i.e. dom0 RAM allocated, gnttab
>>> region allocated, etc.
>>
>> So I agree that the function should be updated if we plan to use it for
>> other purpose.
>>
>> My opinion is that we should attempt to make the function generic so
>> that in your
>>> case you can choose which regions to exclude, define even your own function to grab free regions (at the moment
>>> add_ext_regions grabs banks >= 64M but you still discards banks >= 128M, so it's a bit wasteful.
>>>
>>> My very short attempt to make the function as generic as possible in the first iteration:
>>> https://paste.debian.net/1338334/
>>
>> This looks better, but I wonder why we need still need to exclude the
>> static regions? Wouldn't it be sufficient to exclude just reserved regions?
> Static shared memory banks are not part of reserved memory (i.e. bootinfo.reserved_mem) if that's what you're asking.
> They are stored in bootinfo.shmem, hence we need to take them into account when searching for unused address space.

Oh I missed the fact you now pass "mem_banks" as a parameter. I thought 
they would still get excluded for cache coloring case.

> 
> If you and Carlo are ok with my proposed solution for making the function generic, I can send a patch as a prerequisite
> patch for Carlo series.

I am fine with the approach.

Cheers,

-- 
Julien Grall


