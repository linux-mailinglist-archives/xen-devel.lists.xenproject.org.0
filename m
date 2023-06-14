Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D87300EF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548832.857005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9R1A-0005d9-9p; Wed, 14 Jun 2023 13:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548832.857005; Wed, 14 Jun 2023 13:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9R1A-0005bU-6i; Wed, 14 Jun 2023 13:58:36 +0000
Received: by outflank-mailman (input) for mailman id 548832;
 Wed, 14 Jun 2023 13:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9R18-0005bO-JZ
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:58:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b0d417d-0abb-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 15:58:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C25E463EA8;
 Wed, 14 Jun 2023 13:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0141C433C8;
 Wed, 14 Jun 2023 13:58:22 +0000 (UTC)
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
X-Inumbo-ID: 8b0d417d-0abb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686751109;
	bh=zODqmBJZryq+bXrqw2+dO7/Egr05l6EFGh7EoAR+f5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSDu5H7KOZKMWJOQe/RZf66XvE8x+eCZ2Ytzhs66p+GHx+ddxnclpSnPyGBBVOC05
	 kntWJ9TrG8h428EjebftgV+rAv2YXAhTb0cmqdcy2uTjvuT0Ga5hGuS9drSzCT7vEe
	 lZBUTVYDwjRpPWR0zfBUHmtTwZ2dHpcIOTvlm3uWIc27APHLBBUO1V3IJqvs3/W4hf
	 V4LiUm2GDpkcLNAf56LDxlLuEAL6oO/16Aw5vUDA8I/ZMKz2QG0XPQLr9Bk8rgf5Zl
	 R9Y5FHwwoN9JyP4cz6UUoLxJJznNWVeOmwWxNxC0W9lJyus9Kc2Q39K0WgkNq1Cbbd
	 +hjJK6ETZawtw==
Date: Wed, 14 Jun 2023 16:57:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v4 10/34] mm: Convert ptlock_init() to use ptdescs
Message-ID: <20230614135751.GI52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-11-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-11-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:03:59PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index daecf1db6cf1..f48e626d9c98 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2857,7 +2857,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
>  }
>  
> -static inline bool ptlock_init(struct page *page)
> +static inline bool ptlock_init(struct ptdesc *ptdesc)
>  {
>  	/*
>  	 * prep_new_page() initialize page->private (and therefore page->ptl)
> @@ -2866,10 +2866,10 @@ static inline bool ptlock_init(struct page *page)
>  	 * It can happen if arch try to use slab for page table allocation:
>  	 * slab code uses page->slab_cache, which share storage with page->ptl.
>  	 */
> -	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
> -	if (!ptlock_alloc(page_ptdesc(page)))
> +	VM_BUG_ON_PAGE(*(unsigned long *)&ptdesc->ptl, ptdesc_page(ptdesc));
> +	if (!ptlock_alloc(ptdesc))
>  		return false;
> -	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
> +	spin_lock_init(ptlock_ptr(ptdesc));
>  	return true;
>  }
>  
> @@ -2882,13 +2882,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return &mm->page_table_lock;
>  }
>  static inline void ptlock_cache_init(void) {}
> -static inline bool ptlock_init(struct page *page) { return true; }
> +static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
>  static inline void ptlock_free(struct page *page) {}
>  #endif /* USE_SPLIT_PTE_PTLOCKS */
>  
>  static inline bool pgtable_pte_page_ctor(struct page *page)
>  {
> -	if (!ptlock_init(page))
> +	if (!ptlock_init(page_ptdesc(page)))
>  		return false;
>  	__SetPageTable(page);
>  	inc_lruvec_page_state(page, NR_PAGETABLE);
> @@ -2947,7 +2947,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	ptdesc->pmd_huge_pte = NULL;
>  #endif
> -	return ptlock_init(ptdesc_page(ptdesc));
> +	return ptlock_init(ptdesc);
>  }
>  
>  static inline void pmd_ptlock_free(struct page *page)
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

