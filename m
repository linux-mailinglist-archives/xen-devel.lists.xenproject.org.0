Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4EB51E2EA
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 03:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323480.545164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8wQ-0005HK-I5; Sat, 07 May 2022 01:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323480.545164; Sat, 07 May 2022 01:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8wQ-0005En-E1; Sat, 07 May 2022 01:09:02 +0000
Received: by outflank-mailman (input) for mailman id 323480;
 Sat, 07 May 2022 01:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtL8=VP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn8wO-00045S-TN
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 01:09:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 465f87b0-cda2-11ec-a406-831a346695d4;
 Sat, 07 May 2022 03:08:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B76216186A;
 Sat,  7 May 2022 01:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDFCC385A6;
 Sat,  7 May 2022 01:08:57 +0000 (UTC)
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
X-Inumbo-ID: 465f87b0-cda2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651885738;
	bh=Hk8DpJt15cB50wh8M5ef9fhZkSCraUVqftXhgNALNKA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hCAe9w9w7dSfjA9UFjYrDXG165r2bWiHPB44lj69uUc938p/PI1K8/gvaZLeshEXk
	 Z8acQ/Bm/zRY1ebjDCXckIyax5WvXabpCliCuLrASq+qIPx4NYvTiSkY4KwyiBJ0DX
	 nGZQPxHrP7VB5dzpS+o05HW/Ix4snjv2/eX/6N6UQRNVfFKG9Z3Z7MAeG30hDio9C5
	 iQAjIIG/SnPwFininXMx/kR/QYwzD+KLn7ugalPfdgazFOD5PeYnQkNvS1bNSKSpRY
	 UWwhvSzLZnxKvScMFU2EwskRNGg5hwFk4M3K94SQ5L1qksIS7m4V6SKGsSYMUgp5hk
	 XA7IoKBBoANJQ==
Date: Fri, 6 May 2022 18:08:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 4/9] xen/arm: introduce put_page_nr and get_page_nr
In-Reply-To: <20220506072502.2177828-5-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205061713070.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-5-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Penny Zheng wrote:
> Later, we need to add the right amount of references, which should be
> the number of borrower domains, to the owner domain. Since we only have
> get_page() to increment the page reference by 1, a loop is needed per
> page, which is inefficient and time-consuming.
> 
> To save the loop time, this commit introduces a set of new helpers
> put_page_nr() and get_page_nr() to increment/drop the page reference by nr.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v2 change:
> - new commit
> ---
>  xen/arch/arm/include/asm/mm.h |  4 ++++
>  xen/arch/arm/mm.c             | 36 +++++++++++++++++++++++++----------
>  2 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 424aaf2823..c737d51e4d 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -347,6 +347,10 @@ void free_init_memory(void);
>  int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
>                                            unsigned int order);
>  
> +extern bool get_page_nr(struct page_info *page, const struct domain *domain,
> +                        unsigned long nr);
> +extern void put_page_nr(struct page_info *page, unsigned long nr);
> +
>  extern void put_page_type(struct page_info *page);
>  static inline void put_page_and_type(struct page_info *page)
>  {
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 7b1f2f4906..e565979f3c 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1537,7 +1537,8 @@ long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return 0;
>  }
>  
> -struct domain *page_get_owner_and_reference(struct page_info *page)
> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
> +                                                      unsigned long nr)
>  {
>      unsigned long x, y = page->count_info;
>      struct domain *owner;
> @@ -1545,13 +1546,14 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
>      do {
>          x = y;
>          /*
> +         * Consider the minimum case(nr = 1):
>           * Count ==  0: Page is not allocated, so we cannot take a reference.
>           * Count == -1: Reference count would wrap, which is invalid.
>           */
>          if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
>              return NULL;
>      }
> -    while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>  
>      owner = page_get_owner(page);
>      ASSERT(owner);
> @@ -1559,36 +1561,50 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
>      return owner;
>  }
>  
> -void put_page(struct page_info *page)
> +struct domain *page_get_owner_and_reference(struct page_info *page)
> +{
> +    return page_get_owner_and_nr_reference(page, 1);
> +}
> +
> +void put_page_nr(struct page_info *page, unsigned long nr)
>  {
>      unsigned long nx, x, y = page->count_info;
>  
>      do {
> -        ASSERT((y & PGC_count_mask) != 0);
> +        ASSERT(((y - nr) & PGC_count_mask) >= 0);

Why this change? The original ASSERT is to check that we enter the loop
only when count_info is greater than 0. It should still apply even for
put_page_nr without modifications?



>          x  = y;
> -        nx = x - 1;
> +        nx = x - nr;
>      }
>      while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
>  
>      if ( unlikely((nx & PGC_count_mask) == 0) )
> -    {
>          free_domheap_page(page);
> -    }
>  }
>  
> -bool get_page(struct page_info *page, const struct domain *domain)
> +void put_page(struct page_info *page)
>  {
> -    const struct domain *owner = page_get_owner_and_reference(page);
> +    put_page_nr(page, 1);
> +}
> +
> +bool get_page_nr(struct page_info *page, const struct domain *domain,
> +                 unsigned long nr)
> +{
> +    const struct domain *owner = page_get_owner_and_nr_reference(page, nr);
>  
>      if ( likely(owner == domain) )
>          return true;
>  
>      if ( owner != NULL )
> -        put_page(page);
> +        put_page_nr(page, nr);
>  
>      return false;
>  }
>  
> +bool get_page(struct page_info *page, const struct domain *domain)
> +{
> +    return get_page_nr(page, domain, 1);
> +}
> +
>  /* Common code requires get_page_type and put_page_type.
>   * We don't care about typecounts so we just do the minimum to make it
>   * happy. */
> -- 
> 2.25.1
> 

