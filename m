Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB44EF976
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 20:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297545.506921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLbo-0002Ce-Sk; Fri, 01 Apr 2022 18:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297545.506921; Fri, 01 Apr 2022 18:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLbo-0002AE-PZ; Fri, 01 Apr 2022 18:02:52 +0000
Received: by outflank-mailman (input) for mailman id 297545;
 Fri, 01 Apr 2022 18:02:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naLbn-0002A8-AU
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 18:02:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLbm-0002s9-RY; Fri, 01 Apr 2022 18:02:50 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLbm-0001gU-KQ; Fri, 01 Apr 2022 18:02:50 +0000
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
	bh=A2qKnio56Kh0Cei+yc26F/VENUTia4qA/EmZ65l/MRA=; b=Ub18kQa8qEnnW2wUksnQGAAjqc
	jBJIRIB8m/QXV1X2pw84aaxNE7gdubqzNvrkxoSDykvrqM4vlANZ91Qr8ARe4IY/9Lj5x7MzhvNu1
	gdaI7o54ONlgYtvQWcEclF+p0ISLuIgmH9ijpPUR6G42NVu9OVu02Yw+CG8l00JTPLTk=;
Message-ID: <522e8c28-6be7-a073-ab8e-0259b68183f1@xen.org>
Date: Fri, 1 Apr 2022 19:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/5] xen/arm: field "flags" to cover all internal
 CDF_XXX
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220330093617.3870589-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 30/03/2022 10:36, Penny Zheng wrote:
> With more and more CDF_xxx internal flags in and to save the space, this
> commit introduces a new field "flags" to store CDF_* internal flags
> directly.
> 
> Another new CDF_xxx will be introduced in the next patch.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain.c             | 3 ++-
>   xen/arch/arm/include/asm/domain.h | 5 +++--
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 8110c1df86..35c157d499 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -709,7 +709,8 @@ int arch_domain_create(struct domain *d,
>       ioreq_domain_init(d);
>   #endif
>   
> -    d->arch.directmap = flags & CDF_directmap;
> +    /* Holding CDF_* internal flags. */
> +    d->arch.flags = flags;
>   
>       /* p2m_init relies on some value initialized by the IOMMU subsystem */
>       if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index ed63c2b6f9..95fef29111 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -29,7 +29,7 @@ enum domain_type {
>   #define is_64bit_domain(d) (0)
>   #endif
>   
> -#define is_domain_direct_mapped(d) (d)->arch.directmap
> +#define is_domain_direct_mapped(d) (((d)->arch.flags) & CDF_directmap)

The () around (d)->arch.flags are not necessary.

>   
>   /*
>    * Is the domain using the host memory layout?
> @@ -103,7 +103,8 @@ struct arch_domain
>       void *tee;
>   #endif
>   
> -    bool directmap;
> +    /* Holding CDF_* constant. Internal flags for domain creation. */
> +    uint32_t flags;

I think this wants to live in the struct domain. So other arch can take 
advantage of it in the future.

>   }  __cacheline_aligned;
>   
>   struct arch_vcpu

Cheers,

-- 
Julien Grall

