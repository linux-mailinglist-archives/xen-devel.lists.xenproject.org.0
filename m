Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B690F4EF983
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 20:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297549.506932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLfa-0002pi-CJ; Fri, 01 Apr 2022 18:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297549.506932; Fri, 01 Apr 2022 18:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLfa-0002nD-9B; Fri, 01 Apr 2022 18:06:46 +0000
Received: by outflank-mailman (input) for mailman id 297549;
 Fri, 01 Apr 2022 18:06:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naLfZ-0002n7-1i
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 18:06:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLfY-0002vD-Ju; Fri, 01 Apr 2022 18:06:44 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLfY-0001tl-Du; Fri, 01 Apr 2022 18:06:44 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=e8VIyunfzKnDjly8t32ZY1qEMPOpv4mVUPzhkHGNwFw=; b=wcWvZSlqkOzdQ2J0UhTZai/OoO
	FgWT1/3UmfuQ26j/22xJaArxGyBYw+8RLjTyJiEh5Oha21t5Osj7EcN4OaJpD1B4rZ/PsBs+cT/J3
	Yc4B8c/bTbtnW6eRcgyKL725JLhj32oRLBPnUC0MMyPGHMxdKurq1a+iPk7vnWQwql90=;
Message-ID: <d6198097-6d4a-2dae-01de-4de0186c97f3@xen.org>
Date: Fri, 1 Apr 2022 19:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 2/5] xen/arm: introduce CDF_staticmem
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220330093617.3870589-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 30/03/2022 10:36, Penny Zheng wrote:
> In order to have an easy and quick way to find out whether this domain is
> on static allocation, this commit introduces a new flag CDF_staticmem and a
> new helper is_domain_on_static_allocation.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c       | 5 ++++-
>   xen/arch/arm/include/asm/domain.h | 2 ++
>   xen/include/xen/domain.h          | 2 ++
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8be01678de..4e62fd0bf1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3191,9 +3191,12 @@ void __init create_domUs(void)
>           if ( !dt_device_is_compatible(node, "xen,domain") )
>               continue;
>   
> +        if ( dt_find_property(node, "xen,static-mem", NULL) )
> +            flags |= CDF_staticmem;
> +
>           if ( dt_property_read_bool(node, "direct-map") )
>           {
> -            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !dt_find_property(node, "xen,static-mem", NULL) )
> +            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !(flags & CDF_staticmem) )
>                   panic("direct-map is not valid for domain %s without static allocation.\n",
>                         dt_node_name(node));
>   
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 95fef29111..4379f20a12 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -31,6 +31,8 @@ enum domain_type {
>   
>   #define is_domain_direct_mapped(d) (((d)->arch.flags) & CDF_directmap)
>   
> +#define is_domain_on_static_allocation(d) (((d)->arch.flags) & CDF_staticmem)

"on" sounds strange to me and the name is bit long. How about 
"is_domain_using_staticmem()" or maybe "is_domain_static()"?

I will have a look at the rest of the series before giving my ack on 
this patch.

> +
>   /*
>    * Is the domain using the host memory layout?
>    *
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 1c3c88a14d..35dc7143a4 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -34,6 +34,8 @@ void arch_get_domain_info(const struct domain *d,
>   #ifdef CONFIG_ARM
>   /* Should domain memory be directly mapped? */
>   #define CDF_directmap            (1U << 1)
> +/* Is domain memory on static allocation? */
> +#define CDF_staticmem            (1U << 2)
>   #endif
>   
>   /*

Cheers,

-- 
Julien Grall

