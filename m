Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3CE53C195
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 03:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341367.566603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvrB-0000fQ-12; Fri, 03 Jun 2022 01:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341367.566603; Fri, 03 Jun 2022 01:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvrA-0000cf-Sw; Fri, 03 Jun 2022 01:12:04 +0000
Received: by outflank-mailman (input) for mailman id 341367;
 Fri, 03 Jun 2022 01:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwvr9-0000cZ-1N
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 01:12:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c3e58dd-e2da-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 03:12:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21129B821B7;
 Fri,  3 Jun 2022 01:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652C6C385A5;
 Fri,  3 Jun 2022 01:11:59 +0000 (UTC)
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
X-Inumbo-ID: 2c3e58dd-e2da-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654218719;
	bh=R4U6+hWyPYxvxGO+R4tI7iADPGDeeWkKT7LC37G7bPY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AWoxhE0o/WhOqyWgG9lVXA40J3l68eO1cqNB5xfpQ2gkYSxnWOdV406OVDInqQS3P
	 9qhlAOzqsIj9JlSyfni8zibyF5XP0Jw5h3oFqLeHl9/H7Zqiv9dCjyUSY/+37xNWXC
	 CwmavIGfKI8HkQabmGlQl/mk+SYcMUdVJFrWRGuxYQoMePcVyV98XYyKlXSK10RSjT
	 WPiwqHcW7C8/9Ha6VfiFx7286QqnbQTPLCbWfgkrUb3hzhPzbNV4Yv+Mo+MPeJYBN8
	 q9TE91rrmWSL/IS05EijKNdERy0wwadv6nTSBLB7hCtj88c1OrkkutCg6ZwFMBz/Ve
	 9HNrQ9kKBssUQ==
Date: Thu, 2 Jun 2022 18:11:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 7/9] xen/arm: unpopulate memory when domain is
 static
In-Reply-To: <20220531031241.90374-8-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206021808090.2783803@ubuntu-linux-20-04-desktop>
References: <20220531031241.90374-1-Penny.Zheng@arm.com> <20220531031241.90374-8-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 May 2022, Penny Zheng wrote:
> Today when a domain unpopulates the memory on runtime, they will always
> hand the memory back to the heap allocator. And it will be a problem if domain
> is static.
> 
> Pages as guest RAM for static domain shall be reserved to only this domain
> and not be used for any other purposes, so they shall never go back to heap
> allocator.
> 
> This commit puts reserved pages on the new list resv_page_list only after
> having taken them off the "normal" list, when the last ref dropped.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

ARM bits:
Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v5 changes:
> - adapt this patch for PGC_staticmem
> ---
> v4 changes:
> - no changes
> ---
> v3 changes:
> - have page_list_del() just once out of the if()
> - remove resv_pages counter
> - make arch_free_heap_page be an expression, not a compound statement.
> ---
> v2 changes:
> - put reserved pages on resv_page_list after having taken them off
> the "normal" list
> ---
>  xen/arch/arm/include/asm/mm.h | 12 ++++++++++++
>  xen/common/domain.c           |  4 ++++
>  xen/include/xen/sched.h       |  3 +++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 56d0939318..ca384a3939 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -360,6 +360,18 @@ void clear_and_clean_page(struct page_info *page);
>  
>  unsigned int arch_get_dma_bitsize(void);
>  
> +/*
> + * Put free pages on the resv page list after having taken them
> + * off the "normal" page list, when pages from static memory
> + */
> +#ifdef CONFIG_STATIC_MEMORY
> +#define arch_free_heap_page(d, pg) ({                   \
> +    page_list_del(pg, page_to_list(d, pg));             \
> +    if ( (pg)->count_info & PGC_staticmem )              \
> +        page_list_add_tail(pg, &(d)->resv_page_list);   \
> +})
> +#endif
> +
>  #endif /*  __ARCH_ARM_MM__ */
>  /*
>   * Local variables:
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index a3ef991bd1..a49574fa24 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -604,6 +604,10 @@ struct domain *domain_create(domid_t domid,
>      INIT_PAGE_LIST_HEAD(&d->page_list);
>      INIT_PAGE_LIST_HEAD(&d->extra_page_list);
>      INIT_PAGE_LIST_HEAD(&d->xenpage_list);
> +#ifdef CONFIG_STATIC_MEMORY
> +    INIT_PAGE_LIST_HEAD(&d->resv_page_list);
> +#endif
> +
>  
>      spin_lock_init(&d->node_affinity_lock);
>      d->node_affinity = NODE_MASK_ALL;
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 5191853c18..3e22c77333 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -381,6 +381,9 @@ struct domain
>      struct page_list_head page_list;  /* linked list */
>      struct page_list_head extra_page_list; /* linked list (size extra_pages) */
>      struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
> +#ifdef CONFIG_STATIC_MEMORY
> +    struct page_list_head resv_page_list; /* linked list (size resv_pages) */
> +#endif
>  
>      /*
>       * This field should only be directly accessed by domain_adjust_tot_pages()
> -- 
> 2.25.1
> 

