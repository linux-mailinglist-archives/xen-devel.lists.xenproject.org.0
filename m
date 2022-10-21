Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FE607E0C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 20:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427940.677577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olwNw-0000CK-07; Fri, 21 Oct 2022 18:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427940.677577; Fri, 21 Oct 2022 18:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olwNv-000099-TX; Fri, 21 Oct 2022 18:04:43 +0000
Received: by outflank-mailman (input) for mailman id 427940;
 Fri, 21 Oct 2022 18:04:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olwNv-000093-1H
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 18:04:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olwNu-0000QP-EI; Fri, 21 Oct 2022 18:04:42 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.29.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olwNu-0005jD-7T; Fri, 21 Oct 2022 18:04:42 +0000
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
	bh=qX9ztqqvdAniN2MPIi/9AtVmrtAfGtZ3JRH6Aajp1Mg=; b=n8XJqM+oflvZ4ap5y4ERQoEQCr
	tD5nNLEeRbju1BKaHpNiNAZCuLRyHM1c99AT2HyhQ0CFSmvmZqS8T+iLDVFXyOwEdNSdrC++DrU5G
	YPLKV+scjLyqkVz7uWLee9DWyORuXE2cdkTcKYCrepJAnd3+Aadr0F/2ZFTxVGBGXfrg=;
Message-ID: <e69c4786-9938-8f95-0f7f-fa59783ec03c@xen.org>
Date: Fri, 21 Oct 2022 19:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: george.dunlap@citrix.com, jbeulich@suse.com, stefano.stabellini@amd.com,
 wl@xen.org, marco.solieri@unimore.it, andrea.bastoni@minervasys.tech,
 lucmiccio@gmail.com, Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220826125111.152261-3-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/08/2022 13:51, Carlo Nonato wrote:
>   #endif /* !__ASM_ARM_COLORING_H__ */
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 26a8348eed..291f7c375d 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -58,6 +58,10 @@ struct arch_domain
>   #ifdef CONFIG_ARM_64
>       enum domain_type type;
>   #endif
> +#ifdef CONFIG_CACHE_COLORING
> +    unsigned int *colors;
> +    unsigned int num_colors;
> +#endif
>   
>       /* Virtual MMU */
>       struct p2m_domain p2m;
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index c8b6058d3a..adf843a7a1 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>   #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>   
> +__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);
> +
>   struct xen_arch_domainconfig {
>       /* IN/OUT */
>       uint8_t gic_version;
> @@ -335,6 +337,12 @@ struct xen_arch_domainconfig {
>        *
>        */
>       uint32_t clock_frequency;
> +    /* IN */
> +    uint8_t from_guest;
> +    /* IN */
> +    uint16_t num_colors;
> +    /* IN */
> +    XEN_GUEST_HANDLE(color_t) colors;
>   };
>   #endif /* __XEN__ || __XEN_TOOLS__ */


I forgot to mention. I think the golang and OCaml bindings will also 
need to be re-generated. Andrew, Anthony, can you confirm?

Cheers,

-- 
Julien Grall

