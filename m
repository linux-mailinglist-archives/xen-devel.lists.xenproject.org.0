Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F953C190
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 03:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341359.566591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvlD-0007Rz-8u; Fri, 03 Jun 2022 01:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341359.566591; Fri, 03 Jun 2022 01:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvlD-0007PC-5e; Fri, 03 Jun 2022 01:05:55 +0000
Received: by outflank-mailman (input) for mailman id 341359;
 Fri, 03 Jun 2022 01:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwvlB-0007P6-Q0
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 01:05:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5033c4b7-e2d9-11ec-bd2c-47488cf2e6aa;
 Fri, 03 Jun 2022 03:05:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D613EB821A6;
 Fri,  3 Jun 2022 01:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDE5C385A5;
 Fri,  3 Jun 2022 01:05:49 +0000 (UTC)
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
X-Inumbo-ID: 5033c4b7-e2d9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654218350;
	bh=W6vsh6gkSltB0lQbkBL9hpDAbNIsH/xfNzMFiPILaos=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MCnCN9KHcd7ReoRlu9n1dx4knm6omVffJHrtojfR5MOhIlFw5tydUSWHGQS+Pi+3G
	 c04uZK76VWOslDrorY9MuWxhvfqGAZ2V8fCOS/3W2OyScTQcwS2dfpUbls0+Gf7XFQ
	 SYplbLjkE/H2bFg7Eb6w1bnVkZnpLC1yECTO/g+xM+qfKrDjj5es0Kv8xZ3n+ve11Q
	 loxthL8J30lg6hm5xLjllj6UCuUmNKV8nrYCYdZaASu6uLOz2I3fWjTPfIcZ21kKw5
	 VVYg+OgiFB7x4MJtMZg2c9tpEUtHWvKOPEmHDRyzR9L6PIjsvktTSrI3G+F80S+Ja1
	 HjZYKWMcr0MZg==
Date: Thu, 2 Jun 2022 18:05:48 -0700 (PDT)
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
Subject: Re: [PATCH v5 6/9] xen/arm: introduce CDF_staticmem
In-Reply-To: <20220531031241.90374-7-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206021805140.2783803@ubuntu-linux-20-04-desktop>
References: <20220531031241.90374-1-Penny.Zheng@arm.com> <20220531031241.90374-7-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 May 2022, Penny Zheng wrote:
> In order to have an easy and quick way to find out whether this domain memory
> is statically configured, this commit introduces a new flag CDF_staticmem and a
> new helper is_domain_using_staticmem() to tell.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

I realize Jan asked for improvements but I just wanted to say that on my
side it looks good.


> ---
> v5 changes:
> - guard "is_domain_using_staticmem" under CONFIG_STATIC_MEMORY
> - #define is_domain_using_staticmem zero if undefined
> ---
> v4 changes:
> - no changes
> ---
> v3 changes:
> - change name from "is_domain_static()" to "is_domain_using_staticmem"
> ---
> v2 changes:
> - change name from "is_domain_on_static_allocation" to "is_domain_static()"
> ---
>  xen/arch/arm/domain_build.c       | 5 ++++-
>  xen/arch/arm/include/asm/domain.h | 4 ++++
>  xen/include/xen/domain.h          | 6 ++++++
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7ddd16c26d..f6e2e44c1e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3287,9 +3287,12 @@ void __init create_domUs(void)
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
> index fe7a029ebf..6bb999aff0 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -31,6 +31,10 @@ enum domain_type {
>  
>  #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +#define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
> +#endif
> +
>  /*
>   * Is the domain using the host memory layout?
>   *
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 1c3c88a14d..c613afa57e 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -34,6 +34,12 @@ void arch_get_domain_info(const struct domain *d,
>  #ifdef CONFIG_ARM
>  /* Should domain memory be directly mapped? */
>  #define CDF_directmap            (1U << 1)
> +/* Is domain memory on static allocation? */
> +#define CDF_staticmem            (1U << 2)
> +#endif
> +
> +#ifndef is_domain_using_staticmem
> +#define is_domain_using_staticmem(d) ((void)(d), false)
>  #endif
>  
>  /*
> -- 
> 2.25.1
> 

