Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD77251E5C8
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 11:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323642.545401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnGIw-0004DI-2X; Sat, 07 May 2022 09:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323642.545401; Sat, 07 May 2022 09:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnGIv-00049s-V1; Sat, 07 May 2022 09:00:45 +0000
Received: by outflank-mailman (input) for mailman id 323642;
 Sat, 07 May 2022 09:00:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nnGIt-00049m-Ve
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 09:00:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nnGIt-0002r6-LV; Sat, 07 May 2022 09:00:43 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nnGIt-0001GM-FQ; Sat, 07 May 2022 09:00:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=vH7ONMyoV7A8LBQjawjCukMjk6aiZB7UH/oyEHMDvbg=; b=J3QtpLfFrfMPoKkNT6Sy5zQ3D+
	EVyCbGEdmUcLbQzDYx/TIQucJjDhUz/fCwOi4MPVGg6z7afhyb/5AcWMhaD2Jj6tM1P6rEBF8Lqvg
	UDOTgsHVJUwciw0+/S9ZIG+ddABSmlYiZ3pl17OGdSA9Ib/IagqyyRLA1sUwqauSLT0o=;
Message-ID: <442a17fb-b859-8067-417e-a1286dfcec80@xen.org>
Date: Sat, 7 May 2022 10:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
 <20220506072502.2177828-7-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 6/9] xen/arm: add P2M type parameter in
 guest_physmap_add_pages
In-Reply-To: <20220506072502.2177828-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/05/2022 08:24, Penny Zheng wrote:
> In order to cover the scenario where users intend to set up guest
> p2m foreign mapping with nr_pages, this commit adds a new P2M type
> parameter in guest_physmap_add_pages.

With this patch, guest_physmap_add_pages() and guest_physmap_add_page() 
will behave differently. The former will be able to deal with any type 
whilst the latter can only handle RAM type.

I think we need to stay consistent with the name. Looking at the 
existing helper, we already have one that should suit you (see 
map_regions_p2mt()). So this patch looks unnecessary.

Cheers,

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v2 change:
> - no change
> ---
>   xen/arch/arm/domain_build.c    | 5 +++--
>   xen/arch/arm/include/asm/p2m.h | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b3ba0c501d..089b9e99fc 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -507,7 +507,7 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>       else
>           sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
>   
> -    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
> +    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages, p2m_ram_rw);
>       if ( res )
>       {
>           dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
> @@ -850,7 +850,8 @@ static int __init allocate_shared_memory(struct domain *d,
>       nr_pages = PFN_DOWN(psize);
>       if ( d != dom_io )
>       {
> -        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
> +        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, nr_pages,
> +                                      p2m_ram_rw);
>           if ( ret )
>           {
>               printk(XENLOG_ERR
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 8cce459b67..58590145b0 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -317,9 +317,10 @@ guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
>   static inline int guest_physmap_add_pages(struct domain *d,
>                                             gfn_t gfn,
>                                             mfn_t mfn,
> -                                          unsigned int nr_pages)
> +                                          unsigned int nr_pages,
> +                                          p2m_type_t t)
>   {
> -    return p2m_insert_mapping(d, gfn, nr_pages, mfn, p2m_ram_rw);
> +    return p2m_insert_mapping(d, gfn, nr_pages, mfn, t);
>   }
>   
>   mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);

-- 
Julien Grall

