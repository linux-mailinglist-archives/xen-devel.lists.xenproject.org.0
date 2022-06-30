Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3CE560E94
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 03:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358109.587129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ie9-0003gS-IV; Thu, 30 Jun 2022 01:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358109.587129; Thu, 30 Jun 2022 01:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ie9-0003dy-Ev; Thu, 30 Jun 2022 01:07:05 +0000
Received: by outflank-mailman (input) for mailman id 358109;
 Thu, 30 Jun 2022 01:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXfy=XF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6ie7-0003d1-Pr
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 01:07:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f23e8e8a-f810-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 03:07:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34F31B827C1;
 Thu, 30 Jun 2022 01:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9650AC34114;
 Thu, 30 Jun 2022 01:06:58 +0000 (UTC)
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
X-Inumbo-ID: f23e8e8a-f810-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656551219;
	bh=ADS86hmhn+G273gfWNc4aN140CYL60KTh6QbXWJGJvo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DavTASOoI9td7fwL7mHKPagtz5xyIlnQedTtDOaOvZ6ndzgqlwpx11PlN4c9HIIHS
	 xNIV80kui868Wif0OVHp/10ajvogB/Jdeed2JymhxXSHb7EXGK1kqCLWLt65t6IYHV
	 0XdUWVCaZSaAvoauiiMPJWJUotNp4Ne8Y2m2Mh2upGDQ5qHqcSsgT+jf/ZNyugLeOZ
	 5+ovvrqmfV6JZI1xaHAUOZ4YGo7blBs3TUfNG3hg7yDr1fMiBX7SJFikGkNZpq6Do+
	 c4sOsSMVcL5IZOKt1wYNIrlTA6N50dzEE6yipuBa91sxbm0riZJNH38Dv+J4n9Faxr
	 z3hAb6Xw4oG9g==
Date: Wed, 29 Jun 2022 18:06:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V1 2/2] xen/grant-table: Use unpopulated contiguous pages
 instead of real RAM ones
In-Reply-To: <1655740136-3974-3-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206291756110.4389@ubuntu-linux-20-04-desktop>
References: <1655740136-3974-1-git-send-email-olekstysh@gmail.com> <1655740136-3974-3-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Jun 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Depends on CONFIG_XEN_UNPOPULATED_ALLOC. If enabled then unpopulated
> contiguous pages will be allocated for grant mapping into instead of
> ballooning out real RAM pages.
> 
> Also fallback to allocate DMAable pages (balloon out real RAM pages)
> if we failed to allocate unpopulated contiguous pages. Use recently
> introduced is_xen_unpopulated_page() in gnttab_dma_free_pages() to know
> what API to use for freeing pages.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Please note, I haven't re-checked yet the use-case where the xen-swiotlb
> is involved (proposed by Stefano):
> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2206031348230.2783803@ubuntu-linux-20-04-desktop/
> I will re-check that for next version and add corresponding comment
> in the code.

Great. The patch looks good so far.


> Changes RFC -> V1:
>    - update commit subject/description
>    - rework to avoid introducing alternative implementation
>      of gnttab_dma_alloc(free)_pages(), use IS_ENABLED()
>    - implement a fallback to real RAM pages if we failed to allocate
>      unpopulated contiguous pages (resolve initial TODO)
>    - update according to the API renaming (s/dma/contiguous)
> ---
>  drivers/xen/grant-table.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
> index 738029d..15e426b 100644
> --- a/drivers/xen/grant-table.c
> +++ b/drivers/xen/grant-table.c
> @@ -1047,6 +1047,23 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
>  	size_t size;
>  	int i, ret;
>  
> +	if (IS_ENABLED(CONFIG_XEN_UNPOPULATED_ALLOC)) {
> +		ret = xen_alloc_unpopulated_contiguous_pages(args->dev, args->nr_pages,
> +				args->pages);
> +		if (ret < 0)
> +			goto fallback;
> +
> +		ret = gnttab_pages_set_private(args->nr_pages, args->pages);
> +		if (ret < 0)
> +			goto fail;
> +
> +		args->vaddr = page_to_virt(args->pages[0]);
> +		args->dev_bus_addr = page_to_phys(args->pages[0]);
> +
> +		return ret;
> +	}
> +
> +fallback:
>  	size = args->nr_pages << PAGE_SHIFT;
>  	if (args->coherent)
>  		args->vaddr = dma_alloc_coherent(args->dev, size,
> @@ -1103,6 +1120,13 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
>  
>  	gnttab_pages_clear_private(args->nr_pages, args->pages);
>  
> +	if (IS_ENABLED(CONFIG_XEN_UNPOPULATED_ALLOC) &&
> +			is_xen_unpopulated_page(args->pages[0])) {
> +		xen_free_unpopulated_contiguous_pages(args->dev, args->nr_pages,
> +				args->pages);
> +		return 0;
> +	}
> +
>  	for (i = 0; i < args->nr_pages; i++)
>  		args->frames[i] = page_to_xen_pfn(args->pages[i]);
>  
> -- 
> 2.7.4
> 

