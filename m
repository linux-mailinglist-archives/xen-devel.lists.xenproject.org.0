Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BBA5A58C6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 03:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394771.634308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpg1-0007KK-IQ; Tue, 30 Aug 2022 01:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394771.634308; Tue, 30 Aug 2022 01:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpg1-0007IX-F9; Tue, 30 Aug 2022 01:04:25 +0000
Received: by outflank-mailman (input) for mailman id 394771;
 Tue, 30 Aug 2022 01:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Pn=ZC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oSpg0-0007IR-67
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 01:04:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeff4733-27ff-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 03:04:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5539B81091;
 Tue, 30 Aug 2022 01:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6231C433C1;
 Tue, 30 Aug 2022 01:04:19 +0000 (UTC)
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
X-Inumbo-ID: aeff4733-27ff-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661821460;
	bh=u3mcCa/CME0fiFhetcqoFJXYXY/2ZqKz44+qViaPenc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jkQb2L02yeEpyAoTBDiiuCD4dkqmmhkymsoZ9aJzrTe4YzaYmKrWHC9dPUQRYMW2G
	 wtFL+a6qLECIkx2L9jGcggM6+akFaXBkPRONqD2toqtbgCh3ym+UN7XtY8ACp28cYM
	 WX7v+dHZgV7BBp0ies0LXNOwjfJT8FRWu85CQVSsWV6YXj7mTZF2LtGBAIpQcMktP2
	 tVfOgtAtOjF078RgVe0rSf04uB9a7wE4kPdbEUNL5NCCGU3a1LH0c5JJzyljVHVLuM
	 VIRrSPQQXWyseHfp+wHWlUutoX6fpSCZRTZBMITLTQHptRRScbf3+PWXrNMSEF1Qk4
	 3fd1hKxB6rhqg==
Date: Mon, 29 Aug 2022 18:04:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
In-Reply-To: <20220824073127.16762-3-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop>
References: <20220824073127.16762-1-Henry.Wang@arm.com> <20220824073127.16762-3-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Aug 2022, Henry Wang wrote:
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
>  xen/arch/arm/bootfdt.c           |  2 +
>  xen/arch/arm/include/asm/setup.h |  2 +
>  xen/arch/arm/setup.c             | 79 +++++++++++++++++++++++++-------
>  3 files changed, 67 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 33704ca487..ab73b6e212 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -325,6 +325,8 @@ static int __init process_chosen_node(const void *fdt, int node,
>                                       true);
>          if ( rc )
>              return rc;
> +
> +        reserved_heap = true;
>      }
>  
>      printk("Checking for initrd in /chosen\n");
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index e80f3d6201..00536a6d55 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -92,6 +92,8 @@ extern struct bootinfo bootinfo;
>  
>  extern domid_t max_init_domid;
>  
> +extern bool reserved_heap;
> +
>  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>  
>  size_t estimate_efi_size(unsigned int mem_nr_banks);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 500307edc0..fe76cf6325 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -73,6 +73,8 @@ integer_param("xenheap_megabytes", opt_xenheap_megabytes);
>  
>  domid_t __read_mostly max_init_domid;
>  
> +bool __read_mostly reserved_heap;
> +
>  static __used void init_done(void)
>  {
>      /* Must be done past setting system_state. */
> @@ -699,8 +701,10 @@ static void __init populate_boot_allocator(void)
>  #ifdef CONFIG_ARM_32
>  static void __init setup_mm(void)
>  {
> -    paddr_t ram_start, ram_end, ram_size, e;
> -    unsigned long ram_pages;
> +    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
> +    paddr_t reserved_heap_start = ~0, reserved_heap_end = 0,

INVALID_PADDR or ~0ULL


> +            reserved_heap_size = 0;
> +    unsigned long ram_pages, reserved_heap_pages = 0;
>      unsigned long heap_pages, xenheap_pages, domheap_pages;
>      unsigned int i;
>      const uint32_t ctr = READ_CP32(CTR);
> @@ -720,9 +724,9 @@ static void __init setup_mm(void)
>  
>      for ( i = 1; i < bootinfo.mem.nr_banks; i++ )
>      {
> -        paddr_t bank_start = bootinfo.mem.bank[i].start;
> -        paddr_t bank_size = bootinfo.mem.bank[i].size;
> -        paddr_t bank_end = bank_start + bank_size;
> +        bank_start = bootinfo.mem.bank[i].start;
> +        bank_size = bootinfo.mem.bank[i].size;
> +        bank_end = bank_start + bank_size;
>  
>          ram_size  = ram_size + bank_size;
>          ram_start = min(ram_start,bank_start);
> @@ -731,6 +735,25 @@ static void __init setup_mm(void)
>  
>      total_pages = ram_pages = ram_size >> PAGE_SHIFT;
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
>      /*
>       * If the user has not requested otherwise via the command line
>       * then locate the xenheap using these constraints:
> @@ -743,7 +766,8 @@ static void __init setup_mm(void)
>       * We try to allocate the largest xenheap possible within these
>       * constraints.
>       */
> -    heap_pages = ram_pages;
> +    heap_pages = !reserved_heap ? ram_pages : reserved_heap_pages;
> +
>      if ( opt_xenheap_megabytes )
>          xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
>      else
> @@ -755,17 +779,21 @@ static void __init setup_mm(void)
>  
>      do
>      {
> -        e = consider_modules(ram_start, ram_end,
> +        e = !reserved_heap ?
> +            consider_modules(ram_start, ram_end,
>                               pfn_to_paddr(xenheap_pages),
> -                             32<<20, 0);
> +                             32<<20, 0) :
> +            reserved_heap_end;
> +
>          if ( e )
>              break;
>  
>          xenheap_pages >>= 1;
>      } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
>  
> -    if ( ! e )
> -        panic("Not not enough space for xenheap\n");
> +    if ( ! e ||
> +         ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )
> +        panic("Not enough space for xenheap\n");


I would skip the do/while loop completely if reserved_heap. We don't
need it anyway and we can automatically calculate xenheap_pages in a
single line.



>      domheap_pages = heap_pages - xenheap_pages;
>  
> @@ -810,9 +838,9 @@ static void __init setup_mm(void)
>  static void __init setup_mm(void)
>  {
>      const struct meminfo *banks = &bootinfo.mem;
> -    paddr_t ram_start = ~0;
> -    paddr_t ram_end = 0;
> -    paddr_t ram_size = 0;
> +    paddr_t ram_start = ~0, bank_start = ~0;
> +    paddr_t ram_end = 0, bank_end = 0;
> +    paddr_t ram_size = 0, bank_size = 0;
>      unsigned int i;

Please use INVALID_PADDR or ~0ULL


>  
>      init_pdx();
> @@ -821,17 +849,36 @@ static void __init setup_mm(void)
>       * We need some memory to allocate the page-tables used for the xenheap
>       * mappings. But some regions may contain memory already allocated
>       * for other uses (e.g. modules, reserved-memory...).
> -     *
> +     * If reserved heap regions are properly defined, (only) add these regions
> +     * in the boot allocator.
> +     */
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
>       * For simplicity, add all the free regions in the boot allocator.
>       */
> -    populate_boot_allocator();
> +    else
> +        populate_boot_allocator();
>  
>      total_pages = 0;
>  
>      for ( i = 0; i < banks->nr_banks; i++ )
>      {
>          const struct membank *bank = &banks->bank[i];
> -        paddr_t bank_end = bank->start + bank->size;
> +        bank_end = bank->start + bank->size;
>  
>          ram_size = ram_size + bank->size;
>          ram_start = min(ram_start, bank->start);
> -- 
> 2.17.1
> 

