Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21E9A5E863
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911007.1317576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVUg-00087u-UX; Wed, 12 Mar 2025 23:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911007.1317576; Wed, 12 Mar 2025 23:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVUg-00086Q-Rs; Wed, 12 Mar 2025 23:28:10 +0000
Received: by outflank-mailman (input) for mailman id 911007;
 Wed, 12 Mar 2025 23:28:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVUf-00085v-2O
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:28:09 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a76cfe31-ff99-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 00:28:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 33DDAA44D7A;
 Wed, 12 Mar 2025 23:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68796C4CEE3;
 Wed, 12 Mar 2025 23:28:05 +0000 (UTC)
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
X-Inumbo-ID: a76cfe31-ff99-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741822086;
	bh=eW9QZ9w8a/e71BfrB0cP51TsPuFrRkFwNXhMufwUO1E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HvvMoXs81EzPRaP26qdm1EUNbVaIscyJ/H0DIgsX/LdDMk0SqAII8tLMqTP4MypYD
	 EORtRTorz4v0OROeEgToJ8fBLXgyfeUqqkqLanC7MO7RjY+QjRFS3/yRQa/OXVT64H
	 P804kROGbdjcuUytYVmsVLj2wdYnQfZzNlyVDmoBDFaOrZXP6cEBOGRdYNXyl+uFnM
	 Y2NAEXKQuwdP/5j0nOF5Cg5jSV+Wf0mUdCkxd/MybZ0tq0nDkC4FM5gL/88pZL3egO
	 7f0VgDrfxfe1r4TAptUKsFeQMptRBzEwMvgDjKL1IuN+5xLLIWVGrxwKC+Cn/Z8jqx
	 JMQm3NGOeHVIw==
Date: Wed, 12 Mar 2025 16:28:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 14/19] xen: make avail_domheap_pages() static
In-Reply-To: <20250312040632.2853485-15-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121627560.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-15-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> Function avail_domheap_pages() is only invoked by get_outstanding_claims(),
> so it shall be static, no need to extern.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/page_alloc.c | 2 +-
>  xen/include/xen/mm.h    | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 7476d37238..5e710cc9a1 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2796,7 +2796,7 @@ unsigned long avail_domheap_pages_region(
>      return avail_heap_pages(zone_lo, zone_hi, node);
>  }
>  
> -unsigned long avail_domheap_pages(void)
> +static unsigned long avail_domheap_pages(void)
>  {
>      return avail_heap_pages(MEMZONE_XEN + 1,
>                              NR_ZONES - 1,
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 86bbb15890..cbb9f2dfdb 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -140,7 +140,6 @@ struct page_info *alloc_domheap_pages(
>  void free_domheap_pages(struct page_info *pg, unsigned int order);
>  unsigned long avail_domheap_pages_region(
>      unsigned int node, unsigned int min_width, unsigned int max_width);
> -unsigned long avail_domheap_pages(void);
>  unsigned long avail_node_heap_pages(unsigned int nodeid);
>  #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
>  #define free_domheap_page(p)  (free_domheap_pages(p,0))
> -- 
> 2.34.1
> 

