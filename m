Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A165AD8EF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 20:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399120.640181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGe0-00047V-DY; Mon, 05 Sep 2022 18:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399120.640181; Mon, 05 Sep 2022 18:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGe0-000438-AQ; Mon, 05 Sep 2022 18:16:24 +0000
Received: by outflank-mailman (input) for mailman id 399120;
 Mon, 05 Sep 2022 18:16:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVGdy-000432-F1
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 18:16:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVGdy-00083Y-55; Mon, 05 Sep 2022 18:16:22 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVGdx-0000tu-UJ; Mon, 05 Sep 2022 18:16:22 +0000
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
	bh=5+clwZw1Mth9Fr8Yi0FaL99UUSFFJfcKM1iBW4AIjEA=; b=K2ZcLb+6tUhhlV0ROmINFb/Mxh
	03WcRsqCwBu+ri2uDOexfamvhA24gX7uYERBV0veC5QaJWjmkeSi3NVQKq1oZ62CF1kZr6n7gFRlb
	sjDA/u6N7iUV8xCp09lHW5isvX5177sAg/cKhHJIU8YPpartdv3eb6AezyweqXF8KBTI=;
Message-ID: <57082fec-e9ce-eeda-d051-d75a4bc35909@xen.org>
Date: Mon, 5 Sep 2022 19:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 3/4] xen/arm: Handle reserved heap pages in boot and
 heap allocator
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220905072635.16294-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 05/09/2022 08:26, Henry Wang wrote:
> This commit firstly adds a bool field `reserved_heap` to bootinfo.
> This newly introduced field is set at the device tree parsing time
> if the reserved heap ranges are defined in the device tree chosen
> node.
> 
> For Arm32, In `setup_mm`, if the reserved heap is enabled, we use
> the reserved heap region for both domheap and xenheap allocation.
> Note that the xenheap on Arm32 should be always contiguous, so also
> add a helper fit_xenheap_in_reserved_heap() for Arm32 to find the
> required xenheap in the reserved heap regions.
> 
> For Arm64, In `setup_mm`, if the reserved heap is enabled and used,
> we make sure that only these reserved heap pages are added to the
> boot allocator. These reserved heap pages in the boot allocator are
> added to the heap allocator at `end_boot_allocator()`.
> 
> If the reserved heap is disabled, we stick to current page allocation
> strategy at boot time.
> 
> Also, take the chance to correct a "double not" print in Arm32
> `setup_mm()` and replace the open-coding address ~0 by INVALID_PADDR.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> Changes from v1 to v2:
> - Move the global bool `reserved_heap` to bootinfo.
> - Replace the open open-coding address ~0 by INVALID_PADDR.
> - Do not use reverted logic in heap_pages calculation.
> - Remove unused Arm32 reserved_heap_start variable.
> - Decouple the arm32 reserved heap too small size check with region
>    end check.
> - Reuse the arm32 original xenheap finding logic with the new helper
>    to make sure xenheap on arm32 is contiguous.
> Changes from RFC to v1:
> - Rebase on top of latest `setup_mm()` changes.
> - Added Arm32 logic in `setup_mm()`.
> ---
>   xen/arch/arm/bootfdt.c           |   2 +
>   xen/arch/arm/include/asm/setup.h |   1 +
>   xen/arch/arm/setup.c             | 116 +++++++++++++++++++++++++++----
>   3 files changed, 104 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 3796a4bd75..616bf5ce47 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -322,6 +322,8 @@ static int __init process_chosen_node(const void *fdt, int node,
>                                        &bootinfo.reserved_mem, MEMBANK_RSVD_HEAP);
>           if ( rc )
>               return rc;
> +
> +        bootinfo.reserved_heap = true;
>       }
>   
>       printk("Checking for initrd in /chosen\n");
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index d0cc556833..22fb950bc8 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -82,6 +82,7 @@ struct bootinfo {
>   #ifdef CONFIG_ACPI
>       struct meminfo acpi;
>   #endif
> +    bool reserved_heap;
>   };
>   
>   struct map_range_data
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 8d3f859982..0b4f7cb909 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -556,6 +556,43 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
>       }
>       return e;
>   }
> +
> +/*
> + * Find the contiguous xenheap region that fits in the reserved heap region with

There might be multiple. So "Find a contiguous...". I would also drop 
"xenheap".

> + * required size and alignment, and return the end address of xenheap.

I would write "and return the end address of the region if found 
otherwise 0".

> + */
> +static paddr_t __init fit_xenheap_in_reserved_heap(uint32_t size, paddr_t align)
> +{
> +    int i;

Please use unsigned int.

> +    paddr_t end = 0, aligned_start, aligned_end;
> +    paddr_t bank_start, bank_size, bank_end;
> +
> +    for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> +    {
> +        if ( bootinfo.reserved_mem.bank[i].type == MEMBANK_RSVD_HEAP )
NIT: You could avoid the extra indentation by reverting the condition.

> +        {
> +            bank_start = bootinfo.reserved_mem.bank[i].start;
> +            bank_size = bootinfo.reserved_mem.bank[i].size;
> +            bank_end = bank_start + bank_size;
> +
> +            if ( bank_size < size )
> +                continue;
> +
> +            aligned_end = bank_end & ~(align - 1);
> +            aligned_start = (aligned_end - size) & ~(align - 1);

I find the logic a bit confusing. AFAIU, aligned_start could be below 
the start of the RAM which is not what I would usually expect.

The code works. So no change requested.


> +
> +            if ( aligned_start > bank_start )
> +                /*
> +                 * Arm32 allocates xenheap from higher address to lower, so if

This code is also called on arm32. So what are you referring to? Is it 
consider_modules()?

> +                 * there are multiple memory banks that satisfy the requirement,
> +                 * use the highest bank.
> +                 */
> +                end = max(end, aligned_end);
> +        }
> +    }
> +
> +    return end;
> +}
>   #endif
>   
>   /*
> @@ -713,8 +750,9 @@ static void __init populate_boot_allocator(void)
>   #ifdef CONFIG_ARM_32
>   static void __init setup_mm(void)
>   {
> -    paddr_t ram_start, ram_end, ram_size, e;
> -    unsigned long ram_pages;
> +    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
> +    paddr_t reserved_heap_end = 0, reserved_heap_size = 0;
> +    unsigned long ram_pages, reserved_heap_pages = 0;
>       unsigned long heap_pages, xenheap_pages, domheap_pages;
>       unsigned int i;
>       const uint32_t ctr = READ_CP32(CTR);
> @@ -734,9 +772,9 @@ static void __init setup_mm(void)
>   
>       for ( i = 1; i < bootinfo.mem.nr_banks; i++ )
>       {
> -        paddr_t bank_start = bootinfo.mem.bank[i].start;
> -        paddr_t bank_size = bootinfo.mem.bank[i].size;
> -        paddr_t bank_end = bank_start + bank_size;
> +        bank_start = bootinfo.mem.bank[i].start;
> +        bank_size = bootinfo.mem.bank[i].size;
> +        bank_end = bank_start + bank_size;
>   
>           ram_size  = ram_size + bank_size;
>           ram_start = min(ram_start,bank_start);
> @@ -745,19 +783,42 @@ static void __init setup_mm(void)
>   
>       total_pages = ram_pages = ram_size >> PAGE_SHIFT;
>   
> +    if ( bootinfo.reserved_heap )
> +    {
> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> +        {
> +            if ( bootinfo.reserved_mem.bank[i].type == MEMBANK_RSVD_HEAP )
> +            {
> +                bank_start = bootinfo.reserved_mem.bank[i].start;
> +                bank_size = bootinfo.reserved_mem.bank[i].size;
> +                bank_end = bank_start + bank_size;
> +
> +                reserved_heap_size += bank_size;
> +                reserved_heap_end = max(reserved_heap_end, bank_end);
> +            }
> +        }
> +
> +        reserved_heap_pages = reserved_heap_size >> PAGE_SHIFT;
> +        if ( reserved_heap_pages < 32<<(20-PAGE_SHIFT) )
> +            panic("Too small reserved heap region, should be at least 32M\n");

This is a bit misleading. 32MB is not sufficient, it also has to be 
contiguous. So I would drop this panic() completely.

> +    }
> +
>       /*
>        * If the user has not requested otherwise via the command line
>        * then locate the xenheap using these constraints:
>        *
>        *  - must be 32 MiB aligned
>        *  - must not include Xen itself or the boot modules
> -     *  - must be at most 1GB or 1/32 the total RAM in the system if less
> +     *  - must be at most 1GB or 1/32 the total RAM in the system
> +     *    (there is no reserved heap) or 1/32 the total reserved

Did you forgot to add "if" before "there"?

> +     *    heap region (there is reserved heap) if less

The new wording suggests that the 1GB limit only applies when the admin 
doesn't specify the reserved heap. However, we don't support larger heap 
than 1GB. So the limit should also apply for the reserved heap. So how 
about:

- must be at most 1GB or 1/32 the total RAM in the system (or reserved 
heap if enabled)

>        *  - must be at least 32M
>        *
>        * We try to allocate the largest xenheap possible within these
>        * constraints.
>        */
> -    heap_pages = ram_pages;
> +    heap_pages = bootinfo.reserved_heap ? reserved_heap_pages : ram_pages;

You can avoid the ternary operation here by setting heap_pages in the 
'if' above and add a else for the 'ram_pages' part.

In fact, 'ram_pages' could be completely dropped in favor of 'total_pages'.

> +
>       if ( opt_xenheap_megabytes )
>           xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
>       else
> @@ -767,9 +828,15 @@ static void __init setup_mm(void)
>           xenheap_pages = min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
>       }
>   
> +    /*
> +     * On Arm32, xenheap must be contiguous, look for one of the region
> +     * that matches the above-mentioned xenheap constraints.
> +     */

IMHO this is already implied by the large comment above. But if you want 
to be more obvious, then I think this should belong to the comment above.

>       do
>       {
> -        e = consider_modules(ram_start, ram_end,
> +        e = bootinfo.reserved_heap ?
> +            fit_xenheap_in_reserved_heap(pfn_to_paddr(xenheap_pages), 32<<20) :

Please use MB(32) in new code.

> +            consider_modules(ram_start, ram_end,
>                                pfn_to_paddr(xenheap_pages),
>                                32<<20, 0);
>           if ( e )
> @@ -779,7 +846,7 @@ static void __init setup_mm(void)
>       } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
>   
>       if ( ! e )
> -        panic("Not not enough space for xenheap\n");
> +        panic("Not enough space for xenheap\n");
>   
>       domheap_pages = heap_pages - xenheap_pages;
>   
> @@ -824,9 +891,9 @@ static void __init setup_mm(void)
>   static void __init setup_mm(void)
>   {
>       const struct meminfo *banks = &bootinfo.mem;
> -    paddr_t ram_start = ~0;
> -    paddr_t ram_end = 0;
> -    paddr_t ram_size = 0;
> +    paddr_t ram_start = INVALID_PADDR, bank_start = INVALID_PADDR;
> +    paddr_t ram_end = 0, bank_end = 0;
> +    paddr_t ram_size = 0, bank_size = 0;
>       unsigned int i;
>   
>       init_pdx();
> @@ -835,17 +902,36 @@ static void __init setup_mm(void)
>        * We need some memory to allocate the page-tables used for the xenheap
>        * mappings. But some regions may contain memory already allocated
>        * for other uses (e.g. modules, reserved-memory...).
> -     *
> +     * If there are non-empty reserved heap regions, (only) add these regions

I am not sure what you mean by "non-empty" here. How about something like:

"If a reserved heap was provided by the admin, populate the boot 
allocator with the corresponding regions only".

> +     * in the boot allocator.
> +     */
> +    if ( bootinfo.reserved_heap )
> +    {
> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> +        {
> +            if ( bootinfo.reserved_mem.bank[i].type == MEMBANK_RSVD_HEAP )
> +            {
> +                bank_start = bootinfo.reserved_mem.bank[i].start;
> +                bank_size = bootinfo.reserved_mem.bank[i].size;
> +                bank_end = bank_start + bank_size;
> +
> +                init_boot_pages(bank_start, bank_end);
> +            }
> +        }
> +    }
> +    /*
> +     * No reserved heap regions:
>        * For simplicity, add all the free regions in the boot allocator.
>        */
> -    populate_boot_allocator();
> +    else
> +        populate_boot_allocator();

For arm32, shouldn't we also only add the reserved heap (minus the 
xenheap) to the boot allocator? At which point, I would move the change 
in populate_boot_allocator().

Cheers,

-- 
Julien Grall

