Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F9730101
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 16:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548837.857014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9R2P-0006Bs-Jh; Wed, 14 Jun 2023 13:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548837.857014; Wed, 14 Jun 2023 13:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9R2P-00069d-Gz; Wed, 14 Jun 2023 13:59:53 +0000
Received: by outflank-mailman (input) for mailman id 548837;
 Wed, 14 Jun 2023 13:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9R2O-00069X-4v
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:59:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba1ab064-0abb-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 15:59:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D676263914;
 Wed, 14 Jun 2023 13:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DD0C433C8;
 Wed, 14 Jun 2023 13:59:42 +0000 (UTC)
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
X-Inumbo-ID: ba1ab064-0abb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686751188;
	bh=bczNeLQKsA4Jn/cyv5Zpe2oQqQ9DoTlx1RmcfxuzAiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rB5cuxD7f+pVV/2kNGOgyZm/CMnI+FrUzScbpb3WvoAusSUJT4mgiOW93EX9McJH2
	 FhTySbUNTBv9MPhFHuVa5nuJ1XZTkWt5yRSSUAhZSNmRhZbJ31odisGjIKfu1++lsZ
	 CH2YOx06YFt56y6ifO55IZUoGHHh/jigUaNtJtYKTg86qZrpU96rQcXjsvJGzQn/kn
	 YLwGgJim4snk8fpaILSaD4wUTac4kDSaDw7wbBi0N7ZYhBsLDqm0a86c4hplOXMBZK
	 gjGoFTFEI0ysZIaZZuOB0qrBTQ+cGwB5XLuAStdydY6oCdalsx3dIZVfFXIzN0yL0V
	 8u2LU4VeWNaSQ==
Date: Wed, 14 Jun 2023 16:59:11 +0300
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
Subject: Re: [PATCH v4 11/34] mm: Convert pmd_ptlock_free() to use ptdescs
Message-ID: <20230614135911.GJ52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-12-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-12-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:00PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f48e626d9c98..3b54bb4c9753 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2950,12 +2950,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
>  	return ptlock_init(ptdesc);
>  }
>  
> -static inline void pmd_ptlock_free(struct page *page)
> +static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
> +	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
>  #endif
> -	ptlock_free(page);
> +	ptlock_free(ptdesc_page(ptdesc));
>  }
>  
>  #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
> @@ -2968,7 +2968,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  }
>  
>  static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
> -static inline void pmd_ptlock_free(struct page *page) {}
> +static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
>  
>  #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
>  
> @@ -2992,7 +2992,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
>  
>  static inline void pgtable_pmd_page_dtor(struct page *page)
>  {
> -	pmd_ptlock_free(page);
> +	pmd_ptlock_free(page_ptdesc(page));
>  	__ClearPageTable(page);
>  	dec_lruvec_page_state(page, NR_PAGETABLE);
>  }
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

