Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505203EB61C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 15:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166807.304484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEXMh-00068G-9B; Fri, 13 Aug 2021 13:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166807.304484; Fri, 13 Aug 2021 13:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEXMh-000652-5z; Fri, 13 Aug 2021 13:36:51 +0000
Received: by outflank-mailman (input) for mailman id 166807;
 Fri, 13 Aug 2021 13:36:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mEXMf-00064w-TP
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 13:36:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEXMf-0006lJ-LY; Fri, 13 Aug 2021 13:36:49 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEXMf-0006TV-Fw; Fri, 13 Aug 2021 13:36:49 +0000
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
	bh=pbrdx0r08rStSVL6c/ZftZSuT3s7Ff/PHtC80qyqJuw=; b=6TRiS8nmRoisb76UFT+2aLPaMn
	I1iOVn+ylh+P3suh9uo9Ws+POQ6PfhiLe94hGcE5aJ5jE4Ekj7tNa4BKH1eqIELD03SpiqH6FTiXA
	ccDt4ZPnhSWdkTCt1nQbn2EmnbppaWA9C/Xwtmve1djGoGXlDrU+ZJQyMrfdr3gK9w78=;
Subject: Re: [PATCH V4 10/10] xen/arm: introduce allocate_static_memory
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-11-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <11d38943-444d-80d1-5fd5-98cbc24e6b7e@xen.org>
Date: Fri, 13 Aug 2021 14:36:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-11-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> This commit introduces allocate_static_memory to allocate static memory as
> guest RAM for Domain on Static Allocation.
> 
> It uses acquire_domstatic_pages to acquire pre-configured static memory
> for this domain, and uses guest_physmap_add_page to set up P2M table.
> These pre-defined static memory banks shall be firstly mapped to the
> fixed guest RAM address `GUEST_RAM0_BASE`. And until it exhausts the
> `GUEST_RAM0_SIZE`, it will seek to `GUEST_RAM1_BASE`, and so on.
> `GUEST_RAM0` may take up several pre-defined physical RAM regions.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 137 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 135 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index cdb16f2086..ed290ee31b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -480,6 +480,139 @@ fail:
>             (unsigned long)kinfo->unassigned_mem >> 10);
>   }
>   
> +static bool __init append_static_memory_to_bank(struct domain *d,
> +                                                struct membank *bank,
> +                                                mfn_t smfn,
> +                                                paddr_t size)
> +{
> +    int res;
> +    paddr_t tot_size = size;
> +    /* Infer next GFN. */
> +    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
> +
> +    while ( tot_size > 0 )
> +    {
> +        unsigned int order = get_allocation_size(tot_size);
> +
> +        res = guest_physmap_add_page(d, sgfn, smfn, order);
> +        if ( res )
> +        {
> +            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
> +            return false;
> +        }
> +
> +        smfn = mfn_add(smfn, 1UL << order);
> +        tot_size -= (1UL << (PAGE_SHIFT + order));
> +    }

AFAICT, the loop is only here to suit guest_physmap_add_page(). Further 
down the line, the order will be converted back to a number of pages 
before calling p2m_insert_mapping().

So how about exporting p2m_insert_mapping() and use it?

> + > +    bank->size = bank->size + size;

We usually add a newline before the last return of the function.

> +    return true;
> +}
> +
> +/* Allocate memory from static memory as RAM for one specific domain d. */
> +static void __init allocate_static_memory(struct domain *d,
> +                                          struct kernel_info *kinfo,
> +                                          const struct dt_property *prop,
> +                                          u32 addr_cells, u32 size_cells)
> +{
> +    unsigned int nr_banks, gbank, bank = 0;
> +    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
> +    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
> +    const __be32 *cell;
> +    u32 reg_cells = addr_cells + size_cells;
> +    u64 tot_size = 0;
> +    paddr_t pbase, psize, gsize;
> +    mfn_t smfn;
> +
> +    /* Start with GUEST_RAM0. */
> +    kinfo->mem.nr_banks = 0;
> +    gbank = 0;
> +    gsize = ramsize[gbank];
> +    kinfo->mem.bank[gbank].start = rambase[gbank];
> +
> +    cell = (const __be32 *)prop->value;
> +    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
> +    BUG_ON(nr_banks > NR_MEM_BANKS);
> +
> +    while ( bank < nr_banks )
> +    {
> +        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
> +        tot_size += psize;
> +        smfn = maddr_to_mfn(pbase);
> +
> +        if ( !acquire_domstatic_pages(d, psize >> PAGE_SHIFT, smfn, 0) )

I think we want to check that both pbase and psize are page aligned 
first. This can be done here or earlier when reserving the pages (this 
would be a previous patch).

Also, given that you can easily figure out the page from the mfn. I 
think it would be better for acquire_domstatic_pages() to return an 
error. This could be helpful to figure out an error.

> +        {
> +            printk(XENLOG_ERR
> +                    "%pd: cannot acquire static memory "
> +                    "(0x%"PRIpaddr" - 0x%"PRIpaddr").\n",
> +                    d, pbase, pbase + psize);
> +            goto fail;
> +        }
> +
> +        printk(XENLOG_INFO "%pd: STATIC BANK[%d] %#"PRIpaddr"-%#"PRIpaddr"\n",

bank is unsigned so s/%d/%u/

> +               d, bank, pbase, pbase + psize);
> +
> +        /*
> +         * It shall be mapped to the fixed guest RAM address rambase[i],
> +         * And until it exhausts the ramsize[i], it will seek to the next
> +         * rambase[i+1].
> +         */
> +        while ( 1 )
> +        {
> +            /*
> +             * The current physical bank is fully mapped.
> +             * Handle the next physical bank.
> +             */
> +            if ( gsize >= psize )
> +            {
> +                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
> +                                                   smfn, psize) )
> +                    goto fail;
> +
> +                gsize = gsize - psize;
> +                bank++;
> +                break;
> +            }
> +            /*
> +             * Current guest bank memory is not enough to map.
> +             * Check if we have another guest bank available.
> +             * gbank refers guest memory bank index.
> +             */
> +            else if ( (gbank + 2) > GUEST_RAM_BANKS ) {

I don't understand the +2. Can you clarify it?

Also, the coding style for Xen requires the { to be on a separate line.

> +                printk("Exhausted the number of guest bank\n");
> +                goto fail;
> +            }
> +            else
> +            {
> +                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
> +                                                   smfn, gsize) )
> +                    goto fail;

As I may have mentionned earlier, I find the double loop quite difficult 
to read. I don't think we can drop the double loop, but we can at least 
try to simplify the code in the loops.

The one I can think right now is moving allocate_static_memory_to_bank() 
outside of the if/else. Something like:

/* Map as much as possible the static range to the guest bank */
if ( !allocate_static_bank(.., min(psize, gize)) )

> +
> +                psize = psize - gsize;
> +                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
> +                /* Update to the next guest bank. */
> +                gbank++;
> +                gsize = ramsize[gbank];
> +                kinfo->mem.bank[gbank].start = rambase[gbank];
> +            }
> +        }
> +    }
> +
> +    kinfo->mem.nr_banks = ++gbank;
> +    kinfo->unassigned_mem -= tot_size;
> +    if ( kinfo->unassigned_mem )
> +        printk(XENLOG_ERR
> +               "Size of \"memory\" property doesn't match up with the ones "
> +               "defined in \"xen,static-mem\".\n");

We don't split the single line message accross multi-line even if the 
result code is more than 80 characters long.

> +
> +    return;
> +
> +fail:
> +    panic("Failed to allocate requested static memory for domain %pd."
> +          "Fix the VMs configurations.\n",

Same here.

> +          d);
> +}
> +
>   static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>                                      const struct dt_device_node *node)
>   {
> @@ -2486,8 +2619,8 @@ static int __init construct_domU(struct domain *d,
>       if ( !static_mem )
>           allocate_memory(d, &kinfo);
>       else
> -        /* TODO: allocate_static_memory(...). */
> -        BUG();
> +        allocate_static_memory(d, &kinfo, static_mem_prop,
> +                               static_mem_addr_cells, static_mem_size_cells);
>   
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
> 

Cheers,

-- 
Julien Grall

