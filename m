Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441AC1D58A2
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 20:07:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZeiq-0000K7-Cb; Fri, 15 May 2020 18:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7E4v=65=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jZeio-0000K2-Kb
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 18:06:10 +0000
X-Inumbo-ID: c167024e-96d6-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c167024e-96d6-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UUrgM6G2SGsjkSvajE0euP5vq0t5CmvDR7n90AeN8SI=; b=GEUmW8BJHwHmIb2W7T3B2pZXDa
 nC41VKatLM6EF8+re7UlLHDf0ypf+Es7VXSPmc6xefbsfIU3sq8aH6tpr/Hx9A0RzkxlknrcP0gVU
 Y0MU1Ir5lRFmrjbe7noFDFDNmOddPkVM4s0oLoAchN7XE5pBsU3gLj9CYG8ViLsoWr10=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jZeik-0006MO-AZ; Fri, 15 May 2020 18:06:06 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jZeik-00015Q-2x; Fri, 15 May 2020 18:06:06 +0000
Subject: Re: [PATCH] domain_page: handle NULL within unmap_domain_page() itself
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
References: <a3ddf0c755227a3c742f6b93783c576135a86874.1589384602.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0d630ac6-00fc-df47-2de5-bbeba1d1e432@xen.org>
Date: Fri, 15 May 2020 19:06:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a3ddf0c755227a3c742f6b93783c576135a86874.1589384602.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 13/05/2020 16:43, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> The macro version UNMAP_DOMAIN_PAGE() does both NULL checking and
> variable clearing. Move NULL checking into the function itself so that
> the semantics is consistent with other similar constructs like XFREE().
> This also eases the use unmap_domain_page() in error handling paths,
> where we only care about NULL checking but not about variable clearing.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/arch/arm/mm.c             | 3 +++
>   xen/arch/x86/domain_page.c    | 2 +-
>   xen/include/xen/domain_page.h | 7 ++-----
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 727107eefa..1b14f49345 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -498,6 +498,9 @@ void unmap_domain_page(const void *va)
>       lpae_t *map = this_cpu(xen_dommap);
>       int slot = ((unsigned long) va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
>   
> +    if ( !va )
> +        return;
> +
>       local_irq_save(flags);
>   
>       ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> index dd32712d2f..b03728e18e 100644
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -181,7 +181,7 @@ void unmap_domain_page(const void *ptr)
>       unsigned long va = (unsigned long)ptr, mfn, flags;
>       struct vcpu_maphash_entry *hashent;
>   
> -    if ( va >= DIRECTMAP_VIRT_START )
> +    if ( !va || va >= DIRECTMAP_VIRT_START )
>           return;
>   
>       ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
> diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
> index ab2be7b719..a182d33b67 100644
> --- a/xen/include/xen/domain_page.h
> +++ b/xen/include/xen/domain_page.h
> @@ -73,11 +73,8 @@ static inline void unmap_domain_page_global(const void *va) {};
>   #endif /* !CONFIG_DOMAIN_PAGE */
>   
>   #define UNMAP_DOMAIN_PAGE(p) do {   \
> -    if ( p )                        \
> -    {                               \
> -        unmap_domain_page(p);       \
> -        (p) = NULL;                 \
> -    }                               \
> +    unmap_domain_page(p);           \
> +    (p) = NULL;                     \
>   } while ( false )
>   
>   #endif /* __XEN_DOMAIN_PAGE_H__ */
> 

-- 
Julien Grall

