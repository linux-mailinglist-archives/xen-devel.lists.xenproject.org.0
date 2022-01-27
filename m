Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B249EBFD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 21:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261731.453415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDAz8-0004ea-2t; Thu, 27 Jan 2022 20:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261731.453415; Thu, 27 Jan 2022 20:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDAz7-0004bg-V8; Thu, 27 Jan 2022 20:03:09 +0000
Received: by outflank-mailman (input) for mailman id 261731;
 Thu, 27 Jan 2022 20:03:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nDAz7-0004ba-B1
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 20:03:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDAz6-00005Q-Jg; Thu, 27 Jan 2022 20:03:08 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.9.172]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDAz6-00074V-DN; Thu, 27 Jan 2022 20:03:08 +0000
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
	bh=T2Kyz6lgnejr3D4ZhCpmhrSm6pLCpXAeIHE8s+dkpm0=; b=R0cCkiJoVlPZcmfC/HkNTAIgKx
	cakGr2ij5zzSSpvoh/zSTvMOkFMjcD7DSmgghkI/DSgj42UUvycJ9CNY0yJFUKIhoExrY6IykNiYc
	Ie5/Mr7AqHi1TxgiSoYot37IFtfrFRexuMNbW4TdtA8MmG6l2v0nhC6Di4KAlca9ep9g=;
Message-ID: <1532ec77-17d3-665b-3c19-ab8fd4147a7d@xen.org>
Date: Thu, 27 Jan 2022 20:03:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V3 2/2] iommu/arm: Remove code duplication in all IOMMU
 drivers
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>
 <1643313352-29940-3-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1643313352-29940-3-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/01/2022 19:55, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> All IOMMU drivers on Arm perform almost the same generic actions in
> hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
> in order to get rid of code duplication.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

IMO, the reviewed-by tags should have been dropped with the changes you 
made. So I would like both reviewer to confirm they are happy with the 
change.

This also technically needs an ack from Bertrand/Rahul.

> ---
> Changes V1 -> V2:
>     - add R-b
> 
> Changes V2 -> V3:
>     - drop platform specific *_iommu_hwdom_init(), make .hwdom_init
>       to directly point to the common arch_iommu_hwdom_init()
> ---
>   xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 15 +--------------
>   xen/drivers/passthrough/arm/smmu-v3.c    | 17 +----------------
>   xen/drivers/passthrough/arm/smmu.c       | 17 +----------------
>   4 files changed, 10 insertions(+), 46 deletions(-)
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
> index c912120..d2572bc 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1329,19 +1329,6 @@ static int ipmmu_iommu_domain_init(struct domain *d)
>       return 0;
>   }
>   
> -static void __hwdom_init ipmmu_iommu_hwdom_init(struct domain *d)
> -{
> -    /* Set to false options not supported on ARM. */
> -    if ( iommu_hwdom_inclusive )
> -        printk(XENLOG_WARNING "ipmmu: map-inclusive dom0-iommu option is not supported on ARM\n");
> -    iommu_hwdom_inclusive = false;
> -    if ( iommu_hwdom_reserved == 1 )
> -        printk(XENLOG_WARNING "ipmmu: map-reserved dom0-iommu option is not supported on ARM\n");
> -    iommu_hwdom_reserved = 0;
> -
> -    arch_iommu_hwdom_init(d);
> -}
> -
>   static void ipmmu_iommu_domain_teardown(struct domain *d)
>   {
>       struct ipmmu_vmsa_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> @@ -1369,7 +1356,7 @@ static void ipmmu_iommu_domain_teardown(struct domain *d)
>   static const struct iommu_ops ipmmu_iommu_ops =
>   {
>       .init            = ipmmu_iommu_domain_init,
> -    .hwdom_init      = ipmmu_iommu_hwdom_init,
> +    .hwdom_init      = arch_iommu_hwdom_init,
>       .teardown        = ipmmu_iommu_domain_teardown,
>       .iotlb_flush     = ipmmu_iotlb_flush,
>       .iotlb_flush_all = ipmmu_iotlb_flush_all,
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index d115df7..71b022f 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3402,21 +3402,6 @@ static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>   
>   }
>   
> -static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
> -{
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
> -	arch_iommu_hwdom_init(d);
> -}
> -
>   static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>   {
>   	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> @@ -3427,7 +3412,7 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>   
>   static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.init		= arm_smmu_iommu_xen_domain_init,
> -	.hwdom_init		= arm_smmu_iommu_hwdom_init,
> +	.hwdom_init		= arch_iommu_hwdom_init,
>   	.teardown		= arm_smmu_iommu_xen_domain_teardown,
>   	.iotlb_flush		= arm_smmu_iotlb_flush,
>   	.iotlb_flush_all	= arm_smmu_iotlb_flush_all,
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index c9dfc4c..b186c28 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2849,21 +2849,6 @@ static int arm_smmu_iommu_domain_init(struct domain *d)
>   	return 0;
>   }
>   
> -static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
> -{
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
> -	arch_iommu_hwdom_init(d);
> -}
> -
>   static void arm_smmu_iommu_domain_teardown(struct domain *d)
>   {
>   	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> @@ -2874,7 +2859,7 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
>   
>   static const struct iommu_ops arm_smmu_iommu_ops = {
>       .init = arm_smmu_iommu_domain_init,
> -    .hwdom_init = arm_smmu_iommu_hwdom_init,
> +    .hwdom_init = arch_iommu_hwdom_init,
>       .add_device = arm_smmu_dt_add_device_generic,
>       .teardown = arm_smmu_iommu_domain_teardown,
>       .iotlb_flush = arm_smmu_iotlb_flush,

-- 
Julien Grall

