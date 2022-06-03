Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A253D3C6
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 01:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341718.566956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxGPu-0001An-VC; Fri, 03 Jun 2022 23:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341718.566956; Fri, 03 Jun 2022 23:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxGPu-00017G-SC; Fri, 03 Jun 2022 23:09:18 +0000
Received: by outflank-mailman (input) for mailman id 341718;
 Fri, 03 Jun 2022 23:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nxGPt-000174-Sd
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 23:09:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 302c0bd0-e392-11ec-837f-e5687231ffcc;
 Sat, 04 Jun 2022 01:09:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07BC360AC6;
 Fri,  3 Jun 2022 23:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3DFC385A9;
 Fri,  3 Jun 2022 23:09:14 +0000 (UTC)
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
X-Inumbo-ID: 302c0bd0-e392-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654297754;
	bh=udT4QdZxtfUzKZoyHEtKMuodOQQjJlO/uIy92C2/miM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QB7JUog1OvX8kYs4YgOjXsWGNl/oXHS/emTDDbxQ6LyBLssltHnIxzUYte3nOxa2/
	 Pby956lg58GmltoQdIDWuWF89mG/dy5X7DutlRT5l9DJvzXoqp7BYCjREfHeE1TQY1
	 bMP+R8LMWP7zHP+RJEaAotgvMAXxFZX2d9tF8O86y4dcMUS4h5a1je0Uu7Dft30sGH
	 i798dy2UYeMi5swdrupAFWds6JLT1JUPr3mJH95dKUgNLDcVFQA8tw1ZezJXpMNc2h
	 kId2lXXTeKGtFsGPC20HQO8G0nbBU6e7zcHzbQU+ceRLVlaP0vMxOiY3j18fo2cAGF
	 YCpFVY2zvLQsQ==
Date: Fri, 3 Jun 2022 16:09:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 14/16] xen/arm64: mm: Add memory to the boot allocator
 first
In-Reply-To: <20220520120937.28925-15-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206031606070.2783803@ubuntu-linux-20-04-desktop>
References: <20220520120937.28925-1-julien@xen.org> <20220520120937.28925-15-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 May 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, memory is added to the boot allocator after the xenheap
> mappings are done. This will break if the first mapping is more than
> 512GB of RAM.
> 
> In addition to that, a follow-up patch will rework setup_xenheap_mappings()
> to use smaller mappings (e.g. 2MB, 4KB). So it will be necessary to have
> memory in the boot allocator earlier.
> 
> Only free memory (e.g. not reserved or modules) can be added to the boot
> allocator. It might be possible that some regions (including the first
> one) will have no free memory.
> 
> So we need to add all the free memory to the boot allocator first
> and then add do the mappings.
> 
> Populating the boot allocator is nearly the same between arm32 and
> arm64. The only difference is on the former we need to exclude the
> xenheap for the boot allocator. Gate the difference with CONFIG_ARM_32
> so the code be re-used on arm64.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v4:
>         - The implementation of populate_boot_allocator() has been
>           moved in a separate patch.
>         - Fix typo
> 
>     Changes in v3:
>         - Patch added
> ---
>  xen/arch/arm/setup.c | 55 +++++++++++++++++++-------------------------
>  1 file changed, 24 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 3d5a2283d4ef..db1768c03f03 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -636,13 +636,12 @@ static void __init init_staticmem_pages(void)
>  #endif
>  }
>  
> -#ifdef CONFIG_ARM_32
>  /*
>   * Populate the boot allocator. All the RAM but the following regions
>   * will be added:
>   *  - Modules (e.g., Xen, Kernel)
>   *  - Reserved regions
> - *  - Xenheap
> + *  - Xenheap (arm32 only)
>   */
>  static void __init populate_boot_allocator(void)
>  {
> @@ -672,6 +671,7 @@ static void __init populate_boot_allocator(void)
>              if ( e > bank_end )
>                  e = bank_end;
>  
> +#ifdef CONFIG_ARM_32
>              /* Avoid the xenheap */
>              if ( s < mfn_to_maddr(xenheap_mfn_end) &&
>                   mfn_to_maddr(xenheap_mfn_start) < e )
> @@ -679,6 +679,7 @@ static void __init populate_boot_allocator(void)
>                  e = mfn_to_maddr(xenheap_mfn_start);
>                  n = mfn_to_maddr(xenheap_mfn_end);
>              }
> +#endif
>  
>              fw_unreserved_regions(s, e, init_boot_pages, 0);
>              s = n;
> @@ -686,6 +687,7 @@ static void __init populate_boot_allocator(void)
>      }
>  }
>  
> +#ifdef CONFIG_ARM_32
>  static void __init setup_mm(void)
>  {
>      paddr_t ram_start, ram_end, ram_size, e;
> @@ -781,45 +783,36 @@ static void __init setup_mm(void)
>  #else /* CONFIG_ARM_64 */
>  static void __init setup_mm(void)
>  {
> +    const struct meminfo *banks = &bootinfo.mem;
>      paddr_t ram_start = ~0;
>      paddr_t ram_end = 0;
>      paddr_t ram_size = 0;
> -    int bank;
> +    unsigned int i;
>  
>      init_pdx();
>  
> -    total_pages = 0;
> -    for ( bank = 0 ; bank < bootinfo.mem.nr_banks; bank++ )
> -    {
> -        paddr_t bank_start = bootinfo.mem.bank[bank].start;
> -        paddr_t bank_size = bootinfo.mem.bank[bank].size;
> -        paddr_t bank_end = bank_start + bank_size;
> -        paddr_t s, e;
> -
> -        ram_size = ram_size + bank_size;
> -        ram_start = min(ram_start,bank_start);
> -        ram_end = max(ram_end,bank_end);
> -
> -        setup_xenheap_mappings(bank_start>>PAGE_SHIFT, bank_size>>PAGE_SHIFT);
> -
> -        s = bank_start;
> -        while ( s < bank_end )
> -        {
> -            paddr_t n = bank_end;
> +    /*
> +     * We need some memory to allocate the page-tables used for the xenheap
> +     * mappings. But some regions may contain memory already allocated
> +     * for other uses (e.g. modules, reserved-memory...).
> +     *
> +     * For simplicity, add all the free regions in the boot allocator.
> +     */
> +    populate_boot_allocator();
>  
> -            e = next_module(s, &n);
> +    total_pages = 0;
>  
> -            if ( e == ~(paddr_t)0 )
> -            {
> -                e = n = bank_end;
> -            }
> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_end = bank->start + bank->size;
>  
> -            if ( e > bank_end )
> -                e = bank_end;
> +        ram_size = ram_size + bank->size;
> +        ram_start = min(ram_start, bank->start);
> +        ram_end = max(ram_end, bank_end);
>  
> -            fw_unreserved_regions(s, e, init_boot_pages, 0);
> -            s = n;
> -        }
> +        setup_xenheap_mappings(PFN_DOWN(bank->start),
> +                               PFN_DOWN(bank->size));
>      }
>  
>      total_pages += ram_size >> PAGE_SHIFT;
> -- 
> 2.32.0
> 

