Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE58509416
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 02:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309677.526092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKNG-0003ao-Fq; Thu, 21 Apr 2022 00:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309677.526092; Thu, 21 Apr 2022 00:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKNG-0003Y2-Cc; Thu, 21 Apr 2022 00:08:42 +0000
Received: by outflank-mailman (input) for mailman id 309677;
 Thu, 21 Apr 2022 00:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhKNE-0003Xo-2i
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 00:08:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 312ffa3c-c107-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 02:08:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F81AB821D9;
 Thu, 21 Apr 2022 00:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BD4C385A0;
 Thu, 21 Apr 2022 00:08:35 +0000 (UTC)
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
X-Inumbo-ID: 312ffa3c-c107-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650499716;
	bh=TvnMk/5d2+4Kfw5dtsHq6wHU83fKbKyv30oC++gxv+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PgmIT6nIyCcMzOQ7pNcYCmhjCw2gDliaLf1WPXnxgD6xAUD89tzDO+1z3UUiz61mR
	 /D/39WisHdnfOPBEFgIUe5zZdM4B25aD1+suOGZotQiWJ9ZvbRB0hbdFNE72yQNb4t
	 ZE3FbMfL0Y63p5SbhkOs99xwOm5+vievwuPhmWcEQg00Zw8I2Dnq8goGE8WQNa3X/c
	 JrHBeQoiBfPLHluKIQqQWs/7l+pX/Bt10d/BA6mwJ2GEDx50jIoYFcarcw6uwVvnMX
	 OvUVOgcbaeMOKnedFwZqCrooMa47kTSV1Q5kUk3D2EwYo9oPPDFv95KZfX8RvDF1pf
	 H6YUGXBfd3bYQ==
Date: Wed, 20 Apr 2022 17:08:34 -0700 (PDT)
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
Subject: Re: [PATCH v2 4/6] xen/arm: introduce CDF_staticmem
In-Reply-To: <20220418122251.3583049-5-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204201708240.915916@ubuntu-linux-20-04-desktop>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com> <20220418122251.3583049-5-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Apr 2022, Penny Zheng wrote:
> In order to have an easy and quick way to find out whether this domain memory
> is statically configured, this commit introduces a new flag CDF_staticmem and a
> new helper is_domain_static to tell.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2 changes:
> - change name from "is_domain_on_static_allocation" to "is_domain_static()"
> ---
>  xen/arch/arm/domain_build.c       | 5 ++++-
>  xen/arch/arm/include/asm/domain.h | 2 ++
>  xen/include/xen/domain.h          | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8be01678de..4e62fd0bf1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3191,9 +3191,12 @@ void __init create_domUs(void)
>          if ( !dt_device_is_compatible(node, "xen,domain") )
>              continue;
>  
> +        if ( dt_find_property(node, "xen,static-mem", NULL) )
> +            flags |= CDF_staticmem;
> +
>          if ( dt_property_read_bool(node, "direct-map") )
>          {
> -            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !dt_find_property(node, "xen,static-mem", NULL) )
> +            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !(flags & CDF_staticmem) )
>                  panic("direct-map is not valid for domain %s without static allocation.\n",
>                        dt_node_name(node));
>  
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 36ec00e62d..b097433f9f 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -31,6 +31,8 @@ enum domain_type {
>  
>  #define is_domain_direct_mapped(d) ((d)->flags & CDF_directmap)
>  
> +#define is_domain_static(d) ((d)->flags & CDF_staticmem)
> +
>  /*
>   * Is the domain using the host memory layout?
>   *
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 1c3c88a14d..35dc7143a4 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -34,6 +34,8 @@ void arch_get_domain_info(const struct domain *d,
>  #ifdef CONFIG_ARM
>  /* Should domain memory be directly mapped? */
>  #define CDF_directmap            (1U << 1)
> +/* Is domain memory on static allocation? */
> +#define CDF_staticmem            (1U << 2)
>  #endif
>  
>  /*
> -- 
> 2.25.1
> 

