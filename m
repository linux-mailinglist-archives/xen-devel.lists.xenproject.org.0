Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3953D3C7
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 01:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341719.566968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxGPx-0001Pc-73; Fri, 03 Jun 2022 23:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341719.566968; Fri, 03 Jun 2022 23:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxGPx-0001Ni-3b; Fri, 03 Jun 2022 23:09:21 +0000
Received: by outflank-mailman (input) for mailman id 341719;
 Fri, 03 Jun 2022 23:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nxGPv-000174-Mi
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 23:09:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 321e049d-e392-11ec-837f-e5687231ffcc;
 Sat, 04 Jun 2022 01:09:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8364CB82473;
 Fri,  3 Jun 2022 23:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE5FC385A9;
 Fri,  3 Jun 2022 23:09:16 +0000 (UTC)
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
X-Inumbo-ID: 321e049d-e392-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654297757;
	bh=0djJC9KLui+Kdr5MsphZ6+DQIIwNtfeYRS1QGzcW9e8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AeXZpqvHDF2QzAYSnYNnSOzuB5MweypuQ/a/HMLX0HBmx357NGTXwhtDg64FSST78
	 HwxphRFillNQuBJ5vh+nqT0bWFtmTvnEcOUj7B2OlWyOMSDaVBsJYhf4lZg2yHK8pJ
	 X36JDZUAmQF/18BWbGmVWNYDhdD5vWk5RSMO2lrg8g2NzqFKvOfPBAlkf5JPC2y+69
	 apuI73x4YElGj5slwRe/TNNTZaixBZKO5A4WZ+tMY42XgSiOHsYJ1PcVS+lpjA0KoX
	 ST1QcNZAoW5Cb4oo5/+XLI05W4TV+be5TZrj/Hv3cmMGY0WhijWSgfCDtc6oGeZNwT
	 p7KB0l1c7HEkQ==
Date: Fri, 3 Jun 2022 16:09:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH 16/16] xen/arm: mm: Re-implement setup_frame_table_mappings()
 with map_pages_to_xen()
In-Reply-To: <20220520120937.28925-17-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206031607510.2783803@ubuntu-linux-20-04-desktop>
References: <20220520120937.28925-1-julien@xen.org> <20220520120937.28925-17-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 May 2022, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() call by map_pages_to_xen() call.
> 
> This has the advantage to remove the differences between 32-bit and
> 64-bit code.
> 
> Lastly remove create_mappings() as there is no more callers.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v4:
>         - Add missing _PAGE_BLOCK
> 
>     Changes in v3:
>         - Fix typo in the commit message
>         - Remove the TODO regarding contiguous bit
> 
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 64 +++++------------------------------------------
>  1 file changed, 6 insertions(+), 58 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 65af44f42232..be37176a4725 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -369,40 +369,6 @@ void clear_fixmap(unsigned map)
>      BUG_ON(res != 0);
>  }
>  
> -/* Create Xen's mappings of memory.
> - * Mapping_size must be either 2MB or 32MB.
> - * Base and virt must be mapping_size aligned.
> - * Size must be a multiple of mapping_size.
> - * second must be a contiguous set of second level page tables
> - * covering the region starting at virt_offset. */
> -static void __init create_mappings(lpae_t *second,
> -                                   unsigned long virt_offset,
> -                                   unsigned long base_mfn,
> -                                   unsigned long nr_mfns,
> -                                   unsigned int mapping_size)
> -{
> -    unsigned long i, count;
> -    const unsigned long granularity = mapping_size >> PAGE_SHIFT;
> -    lpae_t pte, *p;
> -
> -    ASSERT((mapping_size == MB(2)) || (mapping_size == MB(32)));
> -    ASSERT(!((virt_offset >> PAGE_SHIFT) % granularity));
> -    ASSERT(!(base_mfn % granularity));
> -    ASSERT(!(nr_mfns % granularity));
> -
> -    count = nr_mfns / XEN_PT_LPAE_ENTRIES;
> -    p = second + second_linear_offset(virt_offset);
> -    pte = mfn_to_xen_entry(_mfn(base_mfn), MT_NORMAL);
> -    if ( granularity == 16 * XEN_PT_LPAE_ENTRIES )
> -        pte.pt.contig = 1;  /* These maps are in 16-entry contiguous chunks. */
> -    for ( i = 0; i < count; i++ )
> -    {
> -        write_pte(p + i, pte);
> -        pte.pt.base += 1 << XEN_PT_LPAE_SHIFT;
> -    }
> -    flush_xen_tlb_local();
> -}
> -
>  #ifdef CONFIG_DOMAIN_PAGE
>  void *map_domain_page_global(mfn_t mfn)
>  {
> @@ -862,36 +828,18 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>      unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
>      mfn_t base_mfn;
>      const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
> -#ifdef CONFIG_ARM_64
> -    lpae_t *second, pte;
> -    unsigned long nr_second;
> -    mfn_t second_base;
> -    int i;
> -#endif
> +    int rc;
>  
>      frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
>      /* Round up to 2M or 32M boundary, as appropriate. */
>      frametable_size = ROUNDUP(frametable_size, mapping_size);
>      base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
>  
> -#ifdef CONFIG_ARM_64
> -    /* Compute the number of second level pages. */
> -    nr_second = ROUNDUP(frametable_size, FIRST_SIZE) >> FIRST_SHIFT;
> -    second_base = alloc_boot_pages(nr_second, 1);
> -    second = mfn_to_virt(second_base);
> -    for ( i = 0; i < nr_second; i++ )
> -    {
> -        clear_page(mfn_to_virt(mfn_add(second_base, i)));
> -        pte = mfn_to_xen_entry(mfn_add(second_base, i), MT_NORMAL);
> -        pte.pt.table = 1;
> -        write_pte(&xen_first[first_table_offset(FRAMETABLE_VIRT_START)+i], pte);
> -    }
> -    create_mappings(second, 0, mfn_x(base_mfn), frametable_size >> PAGE_SHIFT,
> -                    mapping_size);
> -#else
> -    create_mappings(xen_second, FRAMETABLE_VIRT_START, mfn_x(base_mfn),
> -                    frametable_size >> PAGE_SHIFT, mapping_size);
> -#endif
> +    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> +                          frametable_size >> PAGE_SHIFT,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the frametable mappings.\n");
>  
>      memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
>      memset(&frame_table[nr_pdxs], -1,
> -- 
> 2.32.0
> 

