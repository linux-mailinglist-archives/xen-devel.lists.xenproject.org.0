Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FB51E2EC
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 03:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323488.545186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8wf-0006FO-3h; Sat, 07 May 2022 01:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323488.545186; Sat, 07 May 2022 01:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8we-0006C6-Um; Sat, 07 May 2022 01:09:16 +0000
Received: by outflank-mailman (input) for mailman id 323488;
 Sat, 07 May 2022 01:09:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtL8=VP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn8wd-00045S-Dp
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 01:09:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f9db029-cda2-11ec-a406-831a346695d4;
 Sat, 07 May 2022 03:09:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48060B838E8;
 Sat,  7 May 2022 01:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96936C385A9;
 Sat,  7 May 2022 01:09:12 +0000 (UTC)
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
X-Inumbo-ID: 4f9db029-cda2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651885752;
	bh=dlOiVTvBiFvLzuo8f1RuvGBEH2ogOHIZC6uMOZSoHfw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NKRxZDD2TQU1ctJa3cG3MYFAuIDZHB6XzDzuCEDSDQ4bcQw6v/jGJOd3A4hARBA1r
	 YvKwBYHss5V5MU9SWQiJBzbErUjNo+wgag8tFSO+hvDpeq0w99+zBLPShxNFEIgTfy
	 V3h/uN5Q2DlXQa3vGjVC8PxLMDVRHbyWBgvB5B2snf6Bwq93TriEo+6jsG3dhEAKu2
	 N26H03cppDxsZcxup6TDVdrLdzFplMYIIG7gun7XCmWO1yysRJ4J4iDvpZOG+9KBRp
	 mKb4COwdpI0qBgkdlOuGEivVgY/N1yiJP3gvuKH0pKBmenS1FKIPhJkNyEdD39V+PY
	 ShvewZU2oZ2hg==
Date: Fri, 6 May 2022 18:09:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 6/9] xen/arm: add P2M type parameter in
 guest_physmap_add_pages
In-Reply-To: <20220506072502.2177828-7-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205061805170.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-7-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Penny Zheng wrote:
> In order to cover the scenario where users intend to set up guest
> p2m foreign mapping with nr_pages, this commit adds a new P2M type
> parameter in guest_physmap_add_pages.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2 change:
> - no change
> ---
>  xen/arch/arm/domain_build.c    | 5 +++--
>  xen/arch/arm/include/asm/p2m.h | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b3ba0c501d..089b9e99fc 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -507,7 +507,7 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>      else
>          sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
>  
> -    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
> +    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages, p2m_ram_rw);
>      if ( res )
>      {
>          dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
> @@ -850,7 +850,8 @@ static int __init allocate_shared_memory(struct domain *d,
>      nr_pages = PFN_DOWN(psize);
>      if ( d != dom_io )
>      {
> -        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
> +        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, nr_pages,
> +                                      p2m_ram_rw);
>          if ( ret )
>          {
>              printk(XENLOG_ERR
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 8cce459b67..58590145b0 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -317,9 +317,10 @@ guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
>  static inline int guest_physmap_add_pages(struct domain *d,
>                                            gfn_t gfn,
>                                            mfn_t mfn,
> -                                          unsigned int nr_pages)
> +                                          unsigned int nr_pages,
> +                                          p2m_type_t t)
>  {
> -    return p2m_insert_mapping(d, gfn, nr_pages, mfn, p2m_ram_rw);
> +    return p2m_insert_mapping(d, gfn, nr_pages, mfn, t);
>  }
>  
>  mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);
> -- 
> 2.25.1
> 

