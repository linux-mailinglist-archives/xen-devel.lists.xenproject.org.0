Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6119D7300B9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548808.856975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Qv7-0003TF-6U; Wed, 14 Jun 2023 13:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548808.856975; Wed, 14 Jun 2023 13:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Qv7-0003Qr-1x; Wed, 14 Jun 2023 13:52:21 +0000
Received: by outflank-mailman (input) for mailman id 548808;
 Wed, 14 Jun 2023 13:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9Qv4-0002hX-Oz
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:52:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac91f9eb-0aba-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 15:52:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B94836426A;
 Wed, 14 Jun 2023 13:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C7AC433CB;
 Wed, 14 Jun 2023 13:52:09 +0000 (UTC)
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
X-Inumbo-ID: ac91f9eb-0aba-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750736;
	bh=VwaE4ixu2oYgT8bWCqZd/sCxt5Vr7LA6FKY2uA7+iKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pvu46WaEl54YKxvYrg17S6Us5Z+6jc6ZyxloGDXNG3sVbWCAn8khJSWsZ739VwfPP
	 KwSYnW5Cb22U/hoqAU+3FM5yWaAmL/GvAe5O+LdrEw3/pZtxxI5c7cLPpLdtEqXk8T
	 Fbh9NCB++t1sBODF7SprarK+tEpzTtUTE1tfwFFFrABefWFeIYBfx1eKkeOd7kHivF
	 njsBTw00M7iYLOdiQBjB3A+VyNpSzWxaS2T8NQnbhp/VhP28ksnHBcMgphMjijMkdr
	 wBr5rhU0/C9m5DU9+5BLMiU/dcdSlTsxTG9cV+YRjI8bVXWZYj/RDtOKkEZB/GxHIp
	 Of8H4nZJFOgvQ==
Date: Wed, 14 Jun 2023 16:51:38 +0300
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
Subject: Re: [PATCH v4 07/34] mm: Convert ptlock_alloc() to use ptdescs
Message-ID: <20230614135138.GF52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-8-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-8-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:03:56PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 6 +++---
>  mm/memory.c        | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 088b7664f897..e6f1be2a405e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2825,7 +2825,7 @@ static inline void pagetable_clear(void *x)
>  #if USE_SPLIT_PTE_PTLOCKS
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
> -extern bool ptlock_alloc(struct page *page);
> +bool ptlock_alloc(struct ptdesc *ptdesc);
>  extern void ptlock_free(struct page *page);
>  
>  static inline spinlock_t *ptlock_ptr(struct page *page)
> @@ -2837,7 +2837,7 @@ static inline void ptlock_cache_init(void)
>  {
>  }
>  
> -static inline bool ptlock_alloc(struct page *page)
> +static inline bool ptlock_alloc(struct ptdesc *ptdesc)
>  {
>  	return true;
>  }
> @@ -2867,7 +2867,7 @@ static inline bool ptlock_init(struct page *page)
>  	 * slab code uses page->slab_cache, which share storage with page->ptl.
>  	 */
>  	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
> -	if (!ptlock_alloc(page))
> +	if (!ptlock_alloc(page_ptdesc(page)))
>  		return false;
>  	spin_lock_init(ptlock_ptr(page));
>  	return true;
> diff --git a/mm/memory.c b/mm/memory.c
> index 80ce9dda2779..ba9579117686 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5934,14 +5934,14 @@ void __init ptlock_cache_init(void)
>  			SLAB_PANIC, NULL);
>  }
>  
> -bool ptlock_alloc(struct page *page)
> +bool ptlock_alloc(struct ptdesc *ptdesc)
>  {
>  	spinlock_t *ptl;
>  
>  	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
>  	if (!ptl)
>  		return false;
> -	page->ptl = ptl;
> +	ptdesc->ptl = ptl;
>  	return true;
>  }
>  
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

