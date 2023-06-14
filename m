Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3325F73010E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 16:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548841.857025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9R30-0007Zc-S5; Wed, 14 Jun 2023 14:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548841.857025; Wed, 14 Jun 2023 14:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9R30-0007X7-OI; Wed, 14 Jun 2023 14:00:30 +0000
Received: by outflank-mailman (input) for mailman id 548841;
 Wed, 14 Jun 2023 14:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9R2y-00069X-SW
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 14:00:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d02c5894-0abb-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 16:00:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E28C463F79;
 Wed, 14 Jun 2023 14:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67061C433C8;
 Wed, 14 Jun 2023 14:00:18 +0000 (UTC)
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
X-Inumbo-ID: d02c5894-0abb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686751225;
	bh=uKraQGeV6CHflKMTQULlWthGg679fqUnVunPDgo/6HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDvLwogGgBD7itA4KpDmMOz5f6z6VH2iaHunkUOmJGb2CV9/5MwRPKrP111EYXtEb
	 UEqH+CWzIgF1Rc6XrQFIv/yMpYEmEBGoEuDURlPd52I/fGmF+q5wVqQlIl9KpU5+Uk
	 bgdwaGWMrQOsCsKhPDLR53apMHeHe+9FdmAd1a7miKQKkWiXMpItAY3NijXk99Jluh
	 Pxd9FqKP+sLyI/lOsBPezf8JoB5Fqp5Gg8oE7VA+UHq8nk2Bo7G2Cvf5IS4Aq32CvE
	 s4FZBegGotMSVk+KfyEvDwvHHiHE5HW4dc9hJuLo8yp+W1/X4mVZFqgnWQ8kmzqF33
	 SBYFIqusV7nCA==
Date: Wed, 14 Jun 2023 16:59:47 +0300
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
Subject: Re: [PATCH v4 12/34] mm: Convert ptlock_free() to use ptdescs
Message-ID: <20230614135947.GK52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-13-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-13-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:01PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 10 +++++-----
>  mm/memory.c        |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 3b54bb4c9753..a1af7983e1bd 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2826,7 +2826,7 @@ static inline void pagetable_clear(void *x)
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
>  bool ptlock_alloc(struct ptdesc *ptdesc);
> -extern void ptlock_free(struct page *page);
> +void ptlock_free(struct ptdesc *ptdesc);
>  
>  static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
>  {
> @@ -2842,7 +2842,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
>  	return true;
>  }
>  
> -static inline void ptlock_free(struct page *page)
> +static inline void ptlock_free(struct ptdesc *ptdesc)
>  {
>  }
>  
> @@ -2883,7 +2883,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  }
>  static inline void ptlock_cache_init(void) {}
>  static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
> -static inline void ptlock_free(struct page *page) {}
> +static inline void ptlock_free(struct ptdesc *ptdesc) {}
>  #endif /* USE_SPLIT_PTE_PTLOCKS */
>  
>  static inline bool pgtable_pte_page_ctor(struct page *page)
> @@ -2897,7 +2897,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
>  
>  static inline void pgtable_pte_page_dtor(struct page *page)
>  {
> -	ptlock_free(page);
> +	ptlock_free(page_ptdesc(page));
>  	__ClearPageTable(page);
>  	dec_lruvec_page_state(page, NR_PAGETABLE);
>  }
> @@ -2955,7 +2955,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
>  #endif
> -	ptlock_free(ptdesc_page(ptdesc));
> +	ptlock_free(ptdesc);
>  }
>  
>  #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
> diff --git a/mm/memory.c b/mm/memory.c
> index ba9579117686..d4d2ea5cf0fd 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5945,8 +5945,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
>  	return true;
>  }
>  
> -void ptlock_free(struct page *page)
> +void ptlock_free(struct ptdesc *ptdesc)
>  {
> -	kmem_cache_free(page_ptl_cachep, page->ptl);
> +	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
>  }
>  #endif
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

