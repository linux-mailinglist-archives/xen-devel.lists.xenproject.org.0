Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4FC381471
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 02:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127637.239915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhlo-0003jP-Al; Sat, 15 May 2021 00:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127637.239915; Sat, 15 May 2021 00:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhlo-0003h3-5g; Sat, 15 May 2021 00:03:04 +0000
Received: by outflank-mailman (input) for mailman id 127637;
 Sat, 15 May 2021 00:03:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxVO=KK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lhhll-0003gx-U5
 for xen-devel@lists.xenproject.org; Sat, 15 May 2021 00:03:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adbcb51a-96ae-4112-ae63-ee7b95c1bd0d;
 Sat, 15 May 2021 00:03:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 300FD613D7;
 Sat, 15 May 2021 00:03:00 +0000 (UTC)
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
X-Inumbo-ID: adbcb51a-96ae-4112-ae63-ee7b95c1bd0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621036980;
	bh=APtDweXxNrrvLAK2GWnqDFZ5Ufhv3Fs1izb7+UJ2ORs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BSLTPnCbafWY19L+AkquzRk2a18L0tQ0dLF/8YZX0gGO4Som4rQCRqO+wYsh26sUd
	 mtFkFyGyUWbEpY/cReP8NVpJSGakhuBSbhedOvQra+JXNbeFWu6U+i9k4rl9DMy1Rc
	 b1kzPR+SGkQ/QqH5SZvXaUt0vznH3jPg38dLQs4AkjWyzVNLoPuSb4jAt37HicLJmx
	 0s2mzt2t7VYYkoEwogFRuqF4NqTnulPy/A4un1Z8r/6tf7pZt360hbProjlgZu3L2c
	 uJHKAgWO3jByL1m2IDMtB3SBcNP/PjlbLOR4wndDx/FXwKNQPRvon03Ss1ex3HDKwi
	 PW7grxC4QGj8g==
Date: Fri, 14 May 2021 17:02:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH RFCv2 15/15] xen/arm: mm: Re-implement setup_frame_table_mappings()
 with map_pages_to_xen()
In-Reply-To: <20210425201318.15447-16-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105141658510.14426@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-16-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() call by map_pages_to_xen() call.
> 
> This has the advantage to remove the different between 32-bit and 64-bit
> code.
> 
> Lastly remove create_mappings() as there is no more callers.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - New patch
> 
>     TODO:
>         - Add support for setting the contiguous bit
> ---
>  xen/arch/arm/mm.c | 64 +++++------------------------------------------
>  1 file changed, 6 insertions(+), 58 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index c49403b687f5..5f8ae029dd6d 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -359,40 +359,6 @@ void clear_fixmap(unsigned map)
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
> -    count = nr_mfns / LPAE_ENTRIES;
> -    p = second + second_linear_offset(virt_offset);
> -    pte = mfn_to_xen_entry(_mfn(base_mfn), MT_NORMAL);
> -    if ( granularity == 16 * LPAE_ENTRIES )
> -        pte.pt.contig = 1;  /* These maps are in 16-entry contiguous chunks. */
> -    for ( i = 0; i < count; i++ )
> -    {
> -        write_pte(p + i, pte);
> -        pte.pt.base += 1 << LPAE_SHIFT;
> -    }
> -    flush_xen_tlb_local();
> -}
> -
>  #ifdef CONFIG_DOMAIN_PAGE
>  void *map_domain_page_global(mfn_t mfn)
>  {
> @@ -850,36 +816,18 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
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
> +    /* XXX: Handle contiguous bit */
> +    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> +                          frametable_size >> PAGE_SHIFT, PAGE_HYPERVISOR_RW);
> +    if ( rc )
> +        panic("Unable to setup the frametable mappings.\n");

This is a lot better.

I take that "XXX: Handle contiguous bit" refers to the lack of
_PAGE_BLOCK. Why can't we just | _PAGE_BLOCK like in other places?


>      memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
>      memset(&frame_table[nr_pdxs], -1,


