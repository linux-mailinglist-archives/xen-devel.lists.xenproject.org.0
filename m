Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF565511475
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314758.532958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeMB-0005pM-Da; Wed, 27 Apr 2022 09:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314758.532958; Wed, 27 Apr 2022 09:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeMB-0005nW-Ab; Wed, 27 Apr 2022 09:53:11 +0000
Received: by outflank-mailman (input) for mailman id 314758;
 Wed, 27 Apr 2022 09:53:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njeMA-0005nM-Ha
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:53:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njeM9-0002WG-Vx; Wed, 27 Apr 2022 09:53:09 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njeM9-0001CS-PR; Wed, 27 Apr 2022 09:53:09 +0000
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
	bh=4AFEn0CHrznKpx8Ja/X3cAyPwuX2ZoOxVjBpcS7EBFE=; b=Z3ZIOv+q07dwvxhd2PhGFjpKUf
	rfs0hSqfrf1oyPZA6fnF8p5AXsHioZDTagW+LyKgsHE0bsHDosm8YKdJgZJXZljlN0NVK6TEQD9uv
	U+4eYS17PLTrUmk/tgQSX2TmeQNRwREcOv487q5qEjDScwDDPmJgLv4B9eT20dPdeSe4=;
Message-ID: <a4746106-771d-aec7-20c0-82650ee62f61@xen.org>
Date: Wed, 27 Apr 2022 10:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v3 4/6] xen/arm: introduce CDF_staticmem
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-5-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220427092743.925563-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 27/04/2022 10:27, Penny Zheng wrote:
> In order to have an easy and quick way to find out whether this domain memory
> is statically configured, this commit introduces a new flag CDF_staticmem and a
> new helper is_domain_using_staticmem() to tell.
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

The reviewed-by tags should be after signed-off-by tags.

Cheers,

> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v3 changes:
> - change name from "is_domain_static()" to "is_domain_using_staticmem"
> ---
> v2 changes:
> - change name from "is_domain_on_static_allocation" to "is_domain_static()"
> ---
>   xen/arch/arm/domain_build.c       | 5 ++++-
>   xen/arch/arm/include/asm/domain.h | 2 ++
>   xen/include/xen/domain.h          | 2 ++
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1472ca4972..6830a282a0 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3190,9 +3190,12 @@ void __init create_domUs(void)
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
> index fe7a029ebf..110c672589 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -31,6 +31,8 @@ enum domain_type {
>   
>   #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>   
> +#define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
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

-- 
Julien Grall

