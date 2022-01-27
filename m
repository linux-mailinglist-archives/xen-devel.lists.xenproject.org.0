Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C230649E1A4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 12:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261419.452620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3MB-0002Dy-9B; Thu, 27 Jan 2022 11:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261419.452620; Thu, 27 Jan 2022 11:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3MB-0002Bn-5a; Thu, 27 Jan 2022 11:54:27 +0000
Received: by outflank-mailman (input) for mailman id 261419;
 Thu, 27 Jan 2022 11:54:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nD3M9-0002Bh-7r
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 11:54:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD3M8-0006u5-LR; Thu, 27 Jan 2022 11:54:24 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.9.172]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD3M8-0004Yo-F0; Thu, 27 Jan 2022 11:54:24 +0000
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
	bh=DkjgMq13UlcESViqDZrJGA1EG+ZEpaKX2A/4U7xThqs=; b=g+I5phPSTnjy7yrxnbuVVJiuqh
	WcHsyM84NM/hQ7K0GosTT0LCUmQ5vOFhUFqFR0+oP/HDlr1rOfeVhU6ODkVMBiLMKGTOyToUs2NVW
	4meb9wnuEHV8xTukDOK01V7VSNxeukWBcEUS4SOH2iE3Y9MCQxuaaaR1tRXAvxg/iavU=;
Message-ID: <8384b39e-4cd1-95e0-73e0-60b0f2876fe4@xen.org>
Date: Thu, 27 Jan 2022 11:54:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V2 10/10] iommu/arm: Remove code duplication in all IOMMU
 drivers
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
 <1640034957-19764-11-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1640034957-19764-11-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/12/2021 21:15, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> All IOMMU drivers on Arm perform almost the same generic actions in
> hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
> in order to get rid of code duplication.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes V1 -> V2:
>     - add R-b
> ---
>   xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c |  8 --------
>   xen/drivers/passthrough/arm/smmu-v3.c    | 10 ----------
>   xen/drivers/passthrough/arm/smmu.c       | 10 ----------
>   4 files changed, 7 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
> index ee653a9..fc45318 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -134,6 +134,13 @@ void arch_iommu_domain_destroy(struct domain *d)
>   
>   void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>   {
> +    /* Set to false options not supported on ARM. */
> +    if ( iommu_hwdom_inclusive )
> +        printk(XENLOG_WARNING "map-inclusive dom0-iommu option is not supported on ARM\n");
> +    iommu_hwdom_inclusive = false;
> +    if ( iommu_hwdom_reserved == 1 )
> +        printk(XENLOG_WARNING "map-reserved dom0-iommu option is not supported on ARM\n");
> +    iommu_hwdom_reserved = 0;
>   }
>   
>   /*
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index 1224ea4..64d8ddc 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1325,14 +1325,6 @@ static int ipmmu_iommu_domain_init(struct domain *d)
>   
>   static void __hwdom_init ipmmu_iommu_hwdom_init(struct domain *d)
>   {
> -    /* Set to false options not supported on ARM. */
> -    if ( iommu_hwdom_inclusive )
> -        printk(XENLOG_WARNING "ipmmu: map-inclusive dom0-iommu option is not supported on ARM\n");
> -    iommu_hwdom_inclusive = false;
> -    if ( iommu_hwdom_reserved == 1 )
> -        printk(XENLOG_WARNING "ipmmu: map-reserved dom0-iommu option is not supported on ARM\n");
> -    iommu_hwdom_reserved = 0;
> -
>       arch_iommu_hwdom_init(d);
>   }

With this change, ipmmu_iommu_domain_init() is just a call to 
arch_iommu_hwdom_init(). The two functions have the same prototype, so 
could we simply drop the former and update the .hwdom_init to directly 
point to the latter?

>   
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index d115df7..ca8b5c7 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3404,16 +3404,6 @@ static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>   
>   static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>   {
> -	/* Set to false options not supported on ARM. */
> -	if (iommu_hwdom_inclusive)
> -		printk(XENLOG_WARNING
> -		"map-inclusive dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_inclusive = false;
> -	if (iommu_hwdom_reserved == 1)
> -		printk(XENLOG_WARNING
> -		"map-reserved dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_reserved = 0;
> -
>   	arch_iommu_hwdom_init(d);
>   }
>   

Same here.

> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index c9dfc4c..ec18df7 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2851,16 +2851,6 @@ static int arm_smmu_iommu_domain_init(struct domain *d)
>   
>   static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>   {
> -	/* Set to false options not supported on ARM. */
> -	if ( iommu_hwdom_inclusive )
> -		printk(XENLOG_WARNING
> -		"map-inclusive dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_inclusive = false;
> -	if ( iommu_hwdom_reserved == 1 )
> -		printk(XENLOG_WARNING
> -		"map-reserved dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_reserved = 0;
> -
>   	arch_iommu_hwdom_init(d);
>   }
>   

Same here.

Cheers,

-- 
Julien Grall

