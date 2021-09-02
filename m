Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB73FF6DC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 00:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177697.323309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLusH-0004Oh-8i; Thu, 02 Sep 2021 22:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177697.323309; Thu, 02 Sep 2021 22:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLusH-0004MG-4I; Thu, 02 Sep 2021 22:07:57 +0000
Received: by outflank-mailman (input) for mailman id 177697;
 Thu, 02 Sep 2021 22:07:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLusF-0004MA-QJ
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 22:07:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLusF-0006Sq-Kl; Thu, 02 Sep 2021 22:07:55 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLusF-0001cA-Ek; Thu, 02 Sep 2021 22:07:55 +0000
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
	bh=1T4g9ly1aVs9sxccoIF94nJdhxMvrAlrBSd/tuJ7YMc=; b=5Qo9VREyLbEKHxfKO/FkFT8fjG
	f8YnoVNVvw7ynszXmCX5KwKaPPG/28YVXOZJ5itcab0UFXaAco+j5k3OeK5sWWR1cM6n94izo/HJw
	qsVqJfP1+LeuWYjPT+PWYovt/m3Djo1YzMdIA5MDvvGU+sA/gt2imSGIBXQjoDdwoELQ=;
Subject: Re: [PATCH v5 7/7] xen/arm: introduce allocate_static_memory
To: Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@arm.com>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Wei.Chen@arm.com, nd@arm.com
References: <20210824095045.2281500-1-penny.zheng@arm.com>
 <20210824095045.2281500-8-penny.zheng@arm.com>
 <alpine.DEB.2.21.2109021352020.26072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <ac3a9fbd-7598-e400-6c6c-1214df7acee7@xen.org>
Date: Thu, 2 Sep 2021 23:07:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109021352020.26072@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 02/09/2021 22:32, Stefano Stabellini wrote:
> On Tue, 24 Aug 2021, Penny Zheng wrote:
>> This commit introduces allocate_static_memory to allocate static memory as
>> guest RAM for Domain on Static Allocation.
>>
>> It uses acquire_domstatic_pages to acquire pre-configured static memory
>> for this domain, and uses guest_physmap_add_pages to set up P2M table.
>> These pre-defined static memory banks shall be mapped to the fixed guest RAM
>> banks. And only when they exhausts the current guest RAM bank, it will seek
>> to the next one.
>>
>> In order to deal with the trouble of count-to-order conversion when page number
>> is not in a power-of-two, this commit exports p2m_insert_mapping and introduce
>> a new function guest_physmap_add_pages to cope with adding guest RAM p2m
>> mapping with nr_pages.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> ---
>> v5 changes:
>> - don't split comment over multi-line (even they are more than 80 characters)
>> - simply use dt_find_property(node, "xen,static-mem", NULL) to tell
>> whether using allocate_static_memory, and add error comment when
>> "xen,static-mem" is used but CONFIG_STATIC_MEMORY is not enabled.
>> - exporting p2m_insert_mapping() and introduce guest_physmap_add_pages
>> to cope with adding guest RAM p2m mapping with nr_pages.
>> - check both pbase and psize are page aligned
>> - simplify the code in the loops by moving append_static_memory_to_bank()
>> outside of the if/else.
>> ---
>>   xen/arch/arm/domain_build.c | 156 +++++++++++++++++++++++++++++++++++-
>>   xen/arch/arm/p2m.c          |   7 +-
>>   xen/include/asm-arm/p2m.h   |  11 +++
>>   3 files changed, 168 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 6c86d52781..843b8514c7 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -480,6 +480,148 @@ fail:
>>             (unsigned long)kinfo->unassigned_mem >> 10);
>>   }
>>   
>> +#ifdef CONFIG_STATIC_MEMORY
>> +static bool __init append_static_memory_to_bank(struct domain *d,
>> +                                                struct membank *bank,
>> +                                                mfn_t smfn,
>> +                                                paddr_t size)
>> +{
>> +    int res;
>> +    unsigned int nr_pages = size >> PAGE_SHIFT;
>                                 ^ PFN_DOWN
> 
> 
>> +    /* Infer next GFN. */
>> +    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
>> +
>> +    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
>> +    if ( res )
>> +    {
>> +        dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
>> +        return false;
>> +    }
>> +
>> +    bank->size = bank->size + size;
>> +
>> +    return true;
>> +}
>> +
>> +/* Allocate memory from static memory as RAM for one specific domain d. */
>> +static void __init allocate_static_memory(struct domain *d,
>> +                                          struct kernel_info *kinfo,
>> +                                          const struct dt_device_node *node)
>> +{
>> +    const struct dt_property *prop;
>> +    u32 addr_cells, size_cells, reg_cells;
>> +    unsigned int nr_banks, gbank = 0, bank = 0;
>> +    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
>> +    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
>> +    const __be32 *cell;
>> +    u64 tot_size = 0;
>> +    paddr_t pbase, psize, gsize;
>> +    mfn_t smfn;
>> +    int res;
>> +
>> +    prop = dt_find_property(node, "xen,static-mem", NULL);
>> +    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
>> +                               &addr_cells) )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
>> +        goto fail;
>> +    }
>> +
>> +    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
>> +                               &size_cells) )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
>> +        goto fail;
>> +    }
>> +    reg_cells = addr_cells + size_cells;
>> +
>> +    /* Start with GUEST_RAM0. */
>> +    gsize = ramsize[gbank];
>> +    kinfo->mem.bank[gbank].start = rambase[gbank];
>> +
>> +    cell = (const __be32 *)prop->value;
>> +    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
>> +
>> +    for ( ; bank < nr_banks; bank++ )
>> +    {
>> +        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
>> +        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
>> +
>> +        smfn = maddr_to_mfn(pbase);
>> +        res = acquire_domstatic_pages(d, smfn, psize >> PAGE_SHIFT, 0);
>                                                    ^ PFN_DOWN(psize)
> 
> 
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "%pd: failed to acquire static memory: %d.\n", d, res);
>> +            goto fail;
>> +        }
>> +
>> +        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
>> +               d, bank, pbase, pbase + psize);
>> +
>> +        /*
>> +         * It shall be mapped to the fixed guest RAM banks(GUEST_RAM_BANK_BASES),
>> +         * And only when it exhausts the current guest RAM bank, it will seek
>> +         * to the next.
>> +         */
>> +        while ( 1 )
>> +        {
>> +            /* Map as much as possible the static range to the guest bank */
>> +            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
>> +                                               min(psize, gsize)) )
>> +                goto fail;
>> +
>> +            /*
>> +             * The current physical bank is fully mapped.
>> +             * Handle the next physical bank.
>> +             */
>> +            if ( gsize >= psize )
>> +            {
>> +                gsize = gsize - psize;
>> +                break;
>> +            }
>> +            /*
>> +             * When current guest bank size is not enough to map.
>> +             * Before seeking to the next, check if we still have available
>> +             * guest bank.
>> +             */
>> +            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
>> +            {
>> +                printk(XENLOG_ERR "Exhausted all fixed guest banks.\n");
>> +                goto fail;
>> +            }
>> +            else
>> +            {
>> +                psize = psize - gsize;
>> +                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
>                                          ^ PFN_DOWN
> 
> 
>> +                /* Update to the next guest bank. */
>> +                gbank++;
>> +                gsize = ramsize[gbank];
>> +                kinfo->mem.bank[gbank].start = rambase[gbank];
>> +            }
>> +        }
>> +
>> +        tot_size += psize;
>> +    }
>> +
>> +    kinfo->mem.nr_banks = ++gbank;
>> +    kinfo->unassigned_mem -= tot_size;
>> +    if ( kinfo->unassigned_mem )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\".\n");
>> +        goto fail;
> 
> Do we need to make this a fatal failure?
> 
> I am asking because unassigned_mem comes from the "memory" property of
> the domain in device tree which is kind of redundant with the
> introduction of xen,static-mem. In fact, I think it would be better to
> clarify the role of "memory" when "xen,static-mem" is also present.
> In that case, we could even make "memory" optional.

I requested to make it mandatory. Imagine you have a domU that has 1GB 
and now you want to switch to static memory. If we make the property 
optional, then there is a risk for the admin to not correctly pass the 
amount of memory. This may become unnoticed until late.

So I think making it mandatory is cheap for us and an easy way to 
confirm you properly sized the region. It also has the benefits to 
easily find out how much memory you gave to the guest (but that's just 
because I am lazy :)).

> In any case, even if we don't make "memory" optional, it might still be
> good to turn this error into a warning and ignore the remaining
> kinfo->unassigned_mem.

The behavior is matching the existing function and I think this is a 
good idea. If you ask 10MB of memory and we only give you 9MB, then at 
some point your guest is not going to be happy.

It is much better to know it in advance with a failure over discovering 
hours later when you see an OOM from your domain.

> 
> 
>> +    }
>> +
>> +    return;
>> +
>> +fail:
>> +    panic("Failed to allocate requested static memory for domain %pd.", d);
>> +}
>> +#endif
>> +
>>   static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>>                                      const struct dt_device_node *node)
>>   {
>> @@ -2452,7 +2594,19 @@ static int __init construct_domU(struct domain *d,
>>       /* type must be set before allocate memory */
>>       d->arch.type = kinfo.type;
>>   #endif
>> -    allocate_memory(d, &kinfo);
>> +    if ( !dt_find_property(node, "xen,static-mem", NULL) )
>> +        allocate_memory(d, &kinfo);
>> +#ifdef CONFIG_STATIC_MEMORY
>> +    else
>> +        allocate_static_memory(d, &kinfo, node);
>> +#else
>> +    else
>> +    {
>> +        printk(XENLOG_ERR
>> +               "CONFIG_STATIC_MEMORY must be enabled to use \"xen,static-mem\".\n");
>> +        return -EINVAL;
>> +    }
>> +#endif
> 
> To avoid the double else in the code, this part could be written like
> this which is a bit simpler I think:
> 
>      if ( !dt_find_property(node, "xen,static-mem", NULL) )
>          allocate_memory(d, &kinfo);
>      else
>      {
> #ifdef CONFIG_STATIC_MEMORY
>          allocate_static_memory(d, &kinfo, node);
> #else
>          printk(XENLOG_ERR
>                 "CONFIG_STATIC_MEMORY must be enabled to use \"xen,static-mem\".\n");
>          return -EINVAL;
> #endif
>      }
> 
> This is just a suggestion to improve readability, I am also OK with what
> you wrote.
> 
> (Another alternative would be to provide a stub allocate_static_memory
> implementation for !CONFIG_STATIC_MEMORY.)

My preference is 1) Stub function 2) your #ifdef proposal 3) Penny's 
approach.

Cheers,

-- 
Julien Grall

