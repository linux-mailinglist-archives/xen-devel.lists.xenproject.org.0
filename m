Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257054F482A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 01:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299370.510014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbt3H-0002IC-O9; Tue, 05 Apr 2022 23:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299370.510014; Tue, 05 Apr 2022 23:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbt3H-0002Ej-LD; Tue, 05 Apr 2022 23:57:35 +0000
Received: by outflank-mailman (input) for mailman id 299370;
 Tue, 05 Apr 2022 23:57:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbt3F-0002Ed-Ug
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 23:57:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28044850-b53c-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 01:57:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3579A6148A;
 Tue,  5 Apr 2022 23:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D100C385A0;
 Tue,  5 Apr 2022 23:57:30 +0000 (UTC)
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
X-Inumbo-ID: 28044850-b53c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649203050;
	bh=QNUBxYyvwNaDkLTjXx1stmeVd3v4PkZnb2Xl/dQO6zg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mpY87VhDPcxGNEsp5KpyY+jdK2Bvb0M+bMbCgQQRJVDLx2oJtrRlET+Wm3s3nDs5X
	 PQPiqn+nzo3QP7XtoLARm/gBcQ6U/injA44tSVLskeGKsTzt9ymuFu/4+R9+LpShZh
	 mgyc6uFrv2Cvf7J3D8HRjWtTUpfNVrpu6iOOpxwwTNlk/SB0ZXQX8+e19+qXf1xi3B
	 qaoHRnWhzEcBvIvRHLH2Bkp0h+J2hBYq4YFDo7cp9WaalSywzDSpOYqhLC/bEBQ1d9
	 oifTmTNcKWprE9iv8hHcTntd2yFDB1WoMHVI3vjI7lbQs3WBAMH+QPOawq+cZPltOe
	 3lA65iDqviW5g==
Date: Tue, 5 Apr 2022 16:57:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 18/19] xen/arm: mm: Rework setup_xenheap_mappings()
In-Reply-To: <20220221102218.33785-19-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051657180.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-19-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> The current implementation of setup_xenheap_mappings() is using 1GB
> mappings. This can lead to unexpected result because the mapping
> may alias a non-cachable region (such as device or reserved regions).
> For more details see B2.8 in ARM DDI 0487H.a.
> 
> map_pages_to_xen() was recently reworked to allow superpage mappings,
> support contiguous mapping and deal with the use of pagge-tables before

pagetables


> they are mapped.
> 
> Most of the code in setup_xenheap_mappings() is now replaced with a
> single call to map_pages_to_xen().
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v3:
>         - Don't use 1GB mapping
>         - Re-order code in setup_mm() in a separate patch
> 
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 87 ++++++++++-------------------------------------
>  1 file changed, 18 insertions(+), 69 deletions(-)

Very good!



> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 11b6b60a2bc1..4af59375d998 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -138,17 +138,6 @@ static DEFINE_PAGE_TABLE(cpu0_pgtable);
>  static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
>  #endif
>  
> -#ifdef CONFIG_ARM_64
> -/* The first page of the first level mapping of the xenheap. The
> - * subsequent xenheap first level pages are dynamically allocated, but
> - * we need this one to bootstrap ourselves. */
> -static DEFINE_PAGE_TABLE(xenheap_first_first);
> -/* The zeroeth level slot which uses xenheap_first_first. Used because
> - * setup_xenheap_mappings otherwise relies on mfn_to_virt which isn't
> - * valid for a non-xenheap mapping. */
> -static __initdata int xenheap_first_first_slot = -1;
> -#endif
> -
>  /* Common pagetable leaves */
>  /* Second level page tables.
>   *
> @@ -815,77 +804,37 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,
>  void __init setup_xenheap_mappings(unsigned long base_mfn,
>                                     unsigned long nr_mfns)
>  {
> -    lpae_t *first, pte;
> -    unsigned long mfn, end_mfn;
> -    vaddr_t vaddr;
> -
> -    /* Align to previous 1GB boundary */
> -    mfn = base_mfn & ~((FIRST_SIZE>>PAGE_SHIFT)-1);
> +    int rc;
>  
>      /* First call sets the xenheap physical and virtual offset. */
>      if ( mfn_eq(xenheap_mfn_start, INVALID_MFN) )
>      {
> +        unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
> +
>          xenheap_mfn_start = _mfn(base_mfn);
>          xenheap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
> +        /*
> +         * The base address may not be aligned to the first level
> +         * size (e.g. 1GB when using 4KB pages). This would prevent
> +         * superpage mappings for all the regions because the virtual
> +         * address and machine address should both be suitably aligned.
> +         *
> +         * Prevent that by offsetting the start of the xenheap virtual
> +         * address.
> +         */
>          xenheap_virt_start = DIRECTMAP_VIRT_START +
> -            (base_mfn - mfn) * PAGE_SIZE;
> +            (base_mfn - mfn_gb) * PAGE_SIZE;
>      }

[...]

> +    rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
> +                          _mfn(base_mfn), nr_mfns,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the xenheap mappings.\n");


I understand the intent of the code and I like it. maddr_to_virt is
implemented as:

    return (void *)(XENHEAP_VIRT_START -
                    (xenheap_base_pdx << PAGE_SHIFT) +
                    ((ma & ma_va_bottom_mask) |
                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));

The PDX stuff is always difficult to follow and I cannot claim that I
traced through exactly what the resulting virtual address in the mapping
would be for a given base_mfn, but the patch looks correct compared to
the previous code.


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

