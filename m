Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC67C5A9BAE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 17:30:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396770.637067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTm8K-0003EO-MK; Thu, 01 Sep 2022 15:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396770.637067; Thu, 01 Sep 2022 15:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTm8K-0003BJ-Iv; Thu, 01 Sep 2022 15:29:32 +0000
Received: by outflank-mailman (input) for mailman id 396770;
 Thu, 01 Sep 2022 15:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTm8I-0003BD-Uh
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 15:29:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTm8I-0006aN-Ng; Thu, 01 Sep 2022 15:29:30 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTm8I-0000Bx-EY; Thu, 01 Sep 2022 15:29:30 +0000
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
	bh=W8XT3/qqFZN9iXTn5bGBgMVn7ZIAi2fICMBG0pphfkE=; b=Nh2cLHBhN4569eSJ1NeRGsJty1
	O8hr3OOB6QDQW8v/lR4kiNp0qv13xwM7BeSuNX9LoLm6wyCE06ohjrqncZ3eKJ/a14WfSg6/E5QQ0
	B8rMrat0dR/NXwNwcC2CVdEedNMy46ADTkde56LU9f3d3ncvfQsPyfwgmVa1XN3I9XDI=;
Message-ID: <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
Date: Thu, 1 Sep 2022 16:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220824073127.16762-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 24/08/2022 08:31, Henry Wang wrote:
> This commit firstly adds a global variable `reserved_heap`.
> This newly introduced global variable is set at the device tree
> parsing time if the reserved heap ranges are defined in the device
> tree chosen node.
> 
> For Arm32, In `setup_mm`, if the reserved heap is enabled, we use
> the reserved heap region for both domheap and xenheap allocation.
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
> `setup_mm()`.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> With reserved heap enabled, for Arm64, naming of global variables such
> as `xenheap_mfn_start` and `xenheap_mfn_end` seems to be ambiguous,
> wondering if we should rename these variables.
> ---
> Changes from RFC to v1:
> - Rebase on top of latest `setup_mm()` changes.
> - Added Arm32 logic in `setup_mm()`.
> ---
>   xen/arch/arm/bootfdt.c           |  2 +
>   xen/arch/arm/include/asm/setup.h |  2 +
>   xen/arch/arm/setup.c             | 79 +++++++++++++++++++++++++-------
>   3 files changed, 67 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 33704ca487..ab73b6e212 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -325,6 +325,8 @@ static int __init process_chosen_node(const void *fdt, int node,
>                                        true);
>           if ( rc )
>               return rc;
> +
> +        reserved_heap = true;
>       }
>   
>       printk("Checking for initrd in /chosen\n");
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index e80f3d6201..00536a6d55 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -92,6 +92,8 @@ extern struct bootinfo bootinfo;
>   
>   extern domid_t max_init_domid;
>   
> +extern bool reserved_heap;
> +
>   void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>   
>   size_t estimate_efi_size(unsigned int mem_nr_banks);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 500307edc0..fe76cf6325 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -73,6 +73,8 @@ integer_param("xenheap_megabytes", opt_xenheap_megabytes);
>   
>   domid_t __read_mostly max_init_domid;
>   
> +bool __read_mostly reserved_heap;
> +
>   static __used void init_done(void)
>   {
>       /* Must be done past setting system_state. */
> @@ -699,8 +701,10 @@ static void __init populate_boot_allocator(void)
>   #ifdef CONFIG_ARM_32
>   static void __init setup_mm(void)
>   {
> -    paddr_t ram_start, ram_end, ram_size, e;
> -    unsigned long ram_pages;
> +    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
> +    paddr_t reserved_heap_start = ~0, reserved_heap_end = 0,
> +            reserved_heap_size = 0;
> +    unsigned long ram_pages, reserved_heap_pages = 0;
>       unsigned long heap_pages, xenheap_pages, domheap_pages;
>       unsigned int i;
>       const uint32_t ctr = READ_CP32(CTR);
> @@ -720,9 +724,9 @@ static void __init setup_mm(void)
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
> @@ -731,6 +735,25 @@ static void __init setup_mm(void)
>   
>       total_pages = ram_pages = ram_size >> PAGE_SHIFT;
>   
> +    if ( reserved_heap )
> +    {
> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> +        {
> +            if ( bootinfo.reserved_mem.bank[i].xen_heap )
> +            {
> +                bank_start = bootinfo.reserved_mem.bank[i].start;
> +                bank_size = bootinfo.reserved_mem.bank[i].size;
> +                bank_end = bank_start + bank_size;
> +
> +                reserved_heap_size += bank_size;
> +                reserved_heap_start = min(reserved_heap_start, bank_start);
> +                reserved_heap_end = max(reserved_heap_end, bank_end);
> +            }
> +        }
> +
> +        reserved_heap_pages = reserved_heap_size >> PAGE_SHIFT;
> +    }
> +
>       /*
>        * If the user has not requested otherwise via the command line
>        * then locate the xenheap using these constraints:
> @@ -743,7 +766,8 @@ static void __init setup_mm(void)
>        * We try to allocate the largest xenheap possible within these
>        * constraints.
>        */
> -    heap_pages = ram_pages;
> +    heap_pages = !reserved_heap ? ram_pages : reserved_heap_pages;
> +
>       if ( opt_xenheap_megabytes )
>           xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
>       else
> @@ -755,17 +779,21 @@ static void __init setup_mm(void)
>   
>       do
>       {
> -        e = consider_modules(ram_start, ram_end,
> +        e = !reserved_heap ?
> +            consider_modules(ram_start, ram_end,
>                                pfn_to_paddr(xenheap_pages),
> -                             32<<20, 0);
> +                             32<<20, 0) :
> +            reserved_heap_end;

Not entirely related to this series. Now the assumption is the admin 
will make sure that none of the reserved regions will overlap.

Do we have any tool to help the admin to verify it? If yes, can we have 
a pointer in the documentation? If not, should this be done in Xen?

Also, what happen with UEFI? Is it easy to guarantee the region will not 
be used?

> +
>           if ( e )
>               break;
>   
>           xenheap_pages >>= 1;
>       } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
>   
> -    if ( ! e )
> -        panic("Not not enough space for xenheap\n");
> +    if ( ! e ||
> +         ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )
> +        panic("Not enough space for xenheap\n");

So on arm32, the xenheap *must* be contiguous. AFAICT, 
reserved_heap_pages is the total number of pages in the heap. They may 
not be contiguous. So I think this wants to be reworked so we look for 
one of the region that match the definition written above the loop.

>   
>       domheap_pages = heap_pages - xenheap_pages;
>   
> @@ -810,9 +838,9 @@ static void __init setup_mm(void)
>   static void __init setup_mm(void)
>   {
>       const struct meminfo *banks = &bootinfo.mem;
> -    paddr_t ram_start = ~0;
> -    paddr_t ram_end = 0;
> -    paddr_t ram_size = 0;
> +    paddr_t ram_start = ~0, bank_start = ~0;
> +    paddr_t ram_end = 0, bank_end = 0;
> +    paddr_t ram_size = 0, bank_size = 0;
>       unsigned int i;
>   
>       init_pdx();
> @@ -821,17 +849,36 @@ static void __init setup_mm(void)
>        * We need some memory to allocate the page-tables used for the xenheap
>        * mappings. But some regions may contain memory already allocated
>        * for other uses (e.g. modules, reserved-memory...).
> -     *
> +     * If reserved heap regions are properly defined, (only) add these regions
> +     * in the boot allocator. > +     */
> +    if ( reserved_heap )
> +    {
> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> +        {
> +            if ( bootinfo.reserved_mem.bank[i].xen_heap )
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
>   
>       total_pages = 0;
>   
>       for ( i = 0; i < banks->nr_banks; i++ )
>       {

This code is now becoming quite confusing to understanding. This loop is 
meant to map the xenheap. If I follow your documentation, it would mean 
that only the reserved region should be mapped.

More confusingly, xenheap_* variables will cover the full RAM. 
Effectively, this is now more obvious that this is use for 
direct-mapping. So I think it would be better to rename the variable to 
directmap_* or similar.

Ideally this should be in a separate patch.

Cheers,

-- 
Julien Grall

