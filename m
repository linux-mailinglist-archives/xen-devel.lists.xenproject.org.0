Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61945D14E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 00:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230595.398653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq1ob-00012j-A5; Wed, 24 Nov 2021 23:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230595.398653; Wed, 24 Nov 2021 23:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq1ob-0000zy-64; Wed, 24 Nov 2021 23:36:37 +0000
Received: by outflank-mailman (input) for mailman id 230595;
 Wed, 24 Nov 2021 23:36:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JPi9=QL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mq1oa-0000ou-0w
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 23:36:36 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bd250d6-4d7f-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 00:36:34 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D9F26108F;
 Wed, 24 Nov 2021 23:36:33 +0000 (UTC)
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
X-Inumbo-ID: 5bd250d6-4d7f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637796993;
	bh=CzDNbSFExR/OH7jKVlVsAtdlJOBl3QPTlsD27TWT+pA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QaEyEMghFdE0vlspvMHAPD4NxBRW8ljDsQ4hZX6FqNQla4SD5G5cC5Or+18iNn4T4
	 5NPmAiA4pAuVlaeRyJwOgvIaiJEYNFeoZ3R1HWT6iL19itCxsAp2TPqF6QbMOBwrZ9
	 b/isS1rmlFO5uJxrLB6Y3g3715c83xeTaNSkpdjULnCnGTr+8XaUcyi22kcgOHvlRG
	 7IVymbC1xz+OlRXqpujYKuGfQia/X/IL+y8QX0KQ5XhRVCsgVZDSEJewW2BlD7/2+q
	 Wo9JeTOkzl91GjZQzaDC44NBa1hUrbelktaVs+tUPSRa7LTXnKDkcE2Y7M4sjUD8fl
	 wP4wpxMcrxtNg==
Date: Wed, 24 Nov 2021 15:36:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V3 3/6] xen/balloon: Bring alloc(free)_xenballooned_pages
 helpers back
In-Reply-To: <1637787223-21129-4-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2111241536070.1412361@ubuntu-linux-20-04-desktop>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com> <1637787223-21129-4-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Nov 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch rolls back some of the changes introduced by commit
> 121f2faca2c0a "xen/balloon: rename alloc/free_xenballooned_pages"
> in order to make possible to still allocate xenballooned pages
> if CONFIG_XEN_UNPOPULATED_ALLOC is enabled.
> 
> On Arm the unpopulated pages will be allocated on top of extended
> regions provided by Xen via device-tree (the subsequent patches
> will add required bits to support unpopulated-alloc feature on Arm).
> The problem is that extended regions feature has been introduced
> into Xen quite recently (during 4.16 release cycle). So this
> effectively means that Linux must only use unpopulated-alloc on Arm
> if it is running on "new Xen" which advertises these regions.
> But, it will only be known after parsing the "hypervisor" node
> at boot time, so before doing that we cannot assume anything.
> 
> In order to keep working if CONFIG_XEN_UNPOPULATED_ALLOC is enabled
> and the extended regions are not advertised (Linux is running on
> "old Xen", etc) we need the fallback to alloc_xenballooned_pages().
> 
> This way we wouldn't reduce the amount of memory usable (wasting
> RAM pages) for any of the external mappings anymore (and eliminate
> XSA-300) with "new Xen", but would be still functional ballooning
> out RAM pages with "old Xen".
> 
> Also rename alloc(free)_xenballooned_pages to xen_alloc(free)_ballooned_pages
> and make xen_alloc(free)_unpopulated_pages static inline in xen.h
> if CONFIG_XEN_UNPOPULATED_ALLOC is disabled.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> @Stefano, I decided to retain your R-b after making a minor
> change (make xen_alloc(free)_unpopulated_pages static inline
> in xen.h if CONFIG_XEN_UNPOPULATED_ALLOC is disabled).
> Please let me know if you think otherwise.

That's fine


> Changes V2 -> V3:
>    - new patch
> ---
>  drivers/xen/balloon.c | 20 +++++++++-----------
>  include/xen/balloon.h |  3 +++
>  include/xen/xen.h     | 14 ++++++++++++++
>  3 files changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index ba2ea11..a2c4fc49 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -581,7 +581,6 @@ void balloon_set_new_target(unsigned long target)
>  }
>  EXPORT_SYMBOL_GPL(balloon_set_new_target);
>  
> -#ifndef CONFIG_XEN_UNPOPULATED_ALLOC
>  static int add_ballooned_pages(unsigned int nr_pages)
>  {
>  	enum bp_state st;
> @@ -610,12 +609,12 @@ static int add_ballooned_pages(unsigned int nr_pages)
>  }
>  
>  /**
> - * xen_alloc_unpopulated_pages - get pages that have been ballooned out
> + * xen_alloc_ballooned_pages - get pages that have been ballooned out
>   * @nr_pages: Number of pages to get
>   * @pages: pages returned
>   * @return 0 on success, error otherwise
>   */
> -int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
> +int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pages)
>  {
>  	unsigned int pgno = 0;
>  	struct page *page;
> @@ -652,23 +651,23 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
>  	return 0;
>   out_undo:
>  	mutex_unlock(&balloon_mutex);
> -	xen_free_unpopulated_pages(pgno, pages);
> +	xen_free_ballooned_pages(pgno, pages);
>  	/*
> -	 * NB: free_xenballooned_pages will only subtract pgno pages, but since
> +	 * NB: xen_free_ballooned_pages will only subtract pgno pages, but since
>  	 * target_unpopulated is incremented with nr_pages at the start we need
>  	 * to remove the remaining ones also, or accounting will be screwed.
>  	 */
>  	balloon_stats.target_unpopulated -= nr_pages - pgno;
>  	return ret;
>  }
> -EXPORT_SYMBOL(xen_alloc_unpopulated_pages);
> +EXPORT_SYMBOL(xen_alloc_ballooned_pages);
>  
>  /**
> - * xen_free_unpopulated_pages - return pages retrieved with get_ballooned_pages
> + * xen_free_ballooned_pages - return pages retrieved with get_ballooned_pages
>   * @nr_pages: Number of pages
>   * @pages: pages to return
>   */
> -void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
> +void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages)
>  {
>  	unsigned int i;
>  
> @@ -687,9 +686,9 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
>  
>  	mutex_unlock(&balloon_mutex);
>  }
> -EXPORT_SYMBOL(xen_free_unpopulated_pages);
> +EXPORT_SYMBOL(xen_free_ballooned_pages);
>  
> -#if defined(CONFIG_XEN_PV)
> +#if defined(CONFIG_XEN_PV) && !defined(CONFIG_XEN_UNPOPULATED_ALLOC)
>  static void __init balloon_add_region(unsigned long start_pfn,
>  				      unsigned long pages)
>  {
> @@ -712,7 +711,6 @@ static void __init balloon_add_region(unsigned long start_pfn,
>  	balloon_stats.total_pages += extra_pfn_end - start_pfn;
>  }
>  #endif
> -#endif
>  
>  static int __init balloon_init(void)
>  {
> diff --git a/include/xen/balloon.h b/include/xen/balloon.h
> index e93d4f0..f78a6cc 100644
> --- a/include/xen/balloon.h
> +++ b/include/xen/balloon.h
> @@ -26,6 +26,9 @@ extern struct balloon_stats balloon_stats;
>  
>  void balloon_set_new_target(unsigned long target);
>  
> +int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pages);
> +void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages);
> +
>  #ifdef CONFIG_XEN_BALLOON
>  void xen_balloon_init(void);
>  #else
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index 9f031b5..86c5b37 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -52,7 +52,21 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
>  extern u64 xen_saved_max_mem_size;
>  #endif
>  
> +#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>  int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
>  void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
> +#else
> +#include <xen/balloon.h>
> +static inline int xen_alloc_unpopulated_pages(unsigned int nr_pages,
> +		struct page **pages)
> +{
> +	return xen_alloc_ballooned_pages(nr_pages, pages);
> +}
> +static inline void xen_free_unpopulated_pages(unsigned int nr_pages,
> +		struct page **pages)
> +{
> +	xen_free_ballooned_pages(nr_pages, pages);
> +}
> +#endif
>  
>  #endif	/* _XEN_XEN_H */
> -- 
> 2.7.4
> 

