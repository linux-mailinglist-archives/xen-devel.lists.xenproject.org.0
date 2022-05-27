Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A37535734
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 02:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337760.562451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuO8y-0006kh-KZ; Fri, 27 May 2022 00:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337760.562451; Fri, 27 May 2022 00:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuO8y-0006i2-HX; Fri, 27 May 2022 00:47:56 +0000
Received: by outflank-mailman (input) for mailman id 337760;
 Fri, 27 May 2022 00:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRvR=WD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nuO8x-0006ht-0w
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 00:47:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3a8b7fd-dd56-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 02:47:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1421661C77;
 Fri, 27 May 2022 00:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABF0C385B8;
 Fri, 27 May 2022 00:47:50 +0000 (UTC)
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
X-Inumbo-ID: a3a8b7fd-dd56-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653612471;
	bh=37t8qg7G7P6R9CN2WQp/8N9NaGse1K4pIwg2eUJdGX8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XpHhihGvPsjrHKSbShVW9FHC4LSVqf/Gu7wZdKrw9NvcCdj8po2iWneZdOX4pIZl8
	 hBfmwro59SMfhL73nc8VdgLtJ02NW6lAedal07kHCYGSmcXD708oHTre/xRDwwDAWU
	 nfwMmbTpeXdaOPPZEKfZvk7bZ7C6I1Ps73mO9k+1EhXyJQBDKUNuURxd+thP0vbAqZ
	 oOwnV4yP6WjCdYoWjAzH481Mn1VFWbKw7qvy6JB9q36PhB97s0KoiwU//fEEpREvJt
	 HpSz5W8LuwpqOZRIku+W+tedBFkVjoPGKMxqGrQt42/L7kvq5KCqJ4BzBhRDqsblaE
	 tyi0rishHAzXw==
Date: Thu, 26 May 2022 17:47:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/8] xen/arm: introduce put_page_nr and get_page_nr
In-Reply-To: <20220517090529.3140417-5-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205261747400.1905099@ubuntu-linux-20-04-desktop>
References: <20220517090529.3140417-1-Penny.Zheng@arm.com> <20220517090529.3140417-5-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 May 2022, Penny Zheng wrote:
> Later, we need to add the right amount of references, which should be
> the number of borrower domains, to the owner domain. Since we only have
> get_page() to increment the page reference by 1, a loop is needed per
> page, which is inefficient and time-consuming.
> 
> To save the loop time, this commit introduces a set of new helpers
> put_page_nr() and get_page_nr() to increment/drop the page reference by nr.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v4 changes:
> - make sure that the right equation return is at least equal to n
> - simplify the underflow
> ---
> v3 changes:
> - check overflow with "n"
> - remove spurious change
> - bring back the check that we enter the loop only when count_info is
> greater than 0
> ---
> v2 change:
> - new commit
> ---
>  xen/arch/arm/include/asm/mm.h |  4 ++++
>  xen/arch/arm/mm.c             | 42 +++++++++++++++++++++++++++--------
>  2 files changed, 37 insertions(+), 9 deletions(-)
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
> index 7b1f2f4906..8c8a8f6378 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1537,21 +1537,29 @@ long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return 0;
>  }
>  
> -struct domain *page_get_owner_and_reference(struct page_info *page)
> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
> +                                                      unsigned long nr)
>  {
>      unsigned long x, y = page->count_info;
>      struct domain *owner;
>  
> +    /* Restrict nr to avoid "double" overflow */
> +    if ( nr >= PGC_count_mask )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return NULL;
> +    }
> +
>      do {
>          x = y;
>          /*
>           * Count ==  0: Page is not allocated, so we cannot take a reference.
>           * Count == -1: Reference count would wrap, which is invalid.
>           */
> -        if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>              return NULL;
>      }
> -    while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>  
>      owner = page_get_owner(page);
>      ASSERT(owner);
> @@ -1559,14 +1567,19 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
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
> +        ASSERT((y & PGC_count_mask) >= nr);
>          x  = y;
> -        nx = x - 1;
> +        nx = x - nr;
>      }
>      while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
>  
> @@ -1576,19 +1589,30 @@ void put_page(struct page_info *page)
>      }
>  }
>  
> -bool get_page(struct page_info *page, const struct domain *domain)
> +void put_page(struct page_info *page)
> +{
> +    put_page_nr(page, 1);
> +}
> +
> +bool get_page_nr(struct page_info *page, const struct domain *domain,
> +                 unsigned long nr)
>  {
> -    const struct domain *owner = page_get_owner_and_reference(page);
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

