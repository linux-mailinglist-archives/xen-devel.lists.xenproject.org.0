Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C7237EDD8
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 00:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126457.238064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgxav-0003SL-Qo; Wed, 12 May 2021 22:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126457.238064; Wed, 12 May 2021 22:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgxav-0003QF-MB; Wed, 12 May 2021 22:44:45 +0000
Received: by outflank-mailman (input) for mailman id 126457;
 Wed, 12 May 2021 22:44:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgxau-0003Q9-2J
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 22:44:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ed9dbc1-406f-4611-88b3-7717b297a739;
 Wed, 12 May 2021 22:44:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1160C611CC;
 Wed, 12 May 2021 22:44:42 +0000 (UTC)
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
X-Inumbo-ID: 7ed9dbc1-406f-4611-88b3-7717b297a739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620859482;
	bh=N/UdgbK9ys6InuUioovZfBQiICN8cTV6Zh6vhok72SE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kPF2fc1wU5K6NsTLLVO2yXTG1qFoYY78Hb58m8h+shfe24NhusuWEk0YduR1tO7N+
	 Ufc5R8P6/qG3Qa1hLXn4AtuRa0KfN2rPqFC3PcV8gvatkPKIxavIQZ8p1Q2yebOyaZ
	 cNlN6Mr5huVwLFtcqN/IWDgJ3FNOJ/UwQjkjdmPfF3fqEPEqlKALMcUGwivURakWGf
	 iaLozOvZdi+EYcxLVRVnVqTSnDICOiSYkN4BRjxxIgtvFcjBjzvMTpwtFNLaQFfzNX
	 bET+DtyZlTCydaDL68VpEXGqrR10KBcdZKSvGZZbU9/FFyXxGTKNAu8pTIl+kNi4Oo
	 bPrtluepGdlmg==
Date: Wed, 12 May 2021 15:44:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 10/15] xen/arm: mm: Allocate xen page tables in
 domheap rather than xenheap
In-Reply-To: <20210425201318.15447-11-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105121529180.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-11-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> xen_{un,}map_table() already uses the helper to map/unmap pages
> on-demand (note this is currently a NOP on arm64). So switching to
> domheap don't have any disavantage.
> 
> But this as the benefit:
>     - to keep the page tables unmapped if an arch decided to do so
>     - reduce xenheap use on arm32 which can be pretty small
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Thanks for the patch. It looks OK but let me ask a couple of questions
to clarify my doubts.

This change should have no impact to arm64, right?

For arm32, I wonder why we were using map_domain_page before in
xen_map_table: it wasn't necessary, was it? In fact, one could even say
that it was wrong?


> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 36 +++++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 19ecf73542ce..ae5a07ea956b 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -969,21 +969,6 @@ void *ioremap(paddr_t pa, size_t len)
>      return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>  }
>  
> -static int create_xen_table(lpae_t *entry)
> -{
> -    void *p;
> -    lpae_t pte;
> -
> -    p = alloc_xenheap_page();
> -    if ( p == NULL )
> -        return -ENOMEM;
> -    clear_page(p);
> -    pte = mfn_to_xen_entry(virt_to_mfn(p), MT_NORMAL);
> -    pte.pt.table = 1;
> -    write_pte(entry, pte);
> -    return 0;
> -}
> -
>  static lpae_t *xen_map_table(mfn_t mfn)
>  {
>      /*
> @@ -1024,6 +1009,27 @@ static void xen_unmap_table(const lpae_t *table)
>      unmap_domain_page(table);
>  }
>  
> +static int create_xen_table(lpae_t *entry)
> +{
> +    struct page_info *pg;
> +    void *p;
> +    lpae_t pte;
> +
> +    pg = alloc_domheap_page(NULL, 0);
> +    if ( pg == NULL )
> +        return -ENOMEM;
> +
> +    p = xen_map_table(page_to_mfn(pg));
> +    clear_page(p);
> +    xen_unmap_table(p);
> +
> +    pte = mfn_to_xen_entry(page_to_mfn(pg), MT_NORMAL);
> +    pte.pt.table = 1;
> +    write_pte(entry, pte);
> +
> +    return 0;
> +}
> +
>  #define XEN_TABLE_MAP_FAILED 0
>  #define XEN_TABLE_SUPER_PAGE 1
>  #define XEN_TABLE_NORMAL_PAGE 2
> -- 
> 2.17.1
> 

