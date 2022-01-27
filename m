Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E154749E193
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 12:50:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261416.452609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3Gw-0000qp-L9; Thu, 27 Jan 2022 11:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261416.452609; Thu, 27 Jan 2022 11:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3Gw-0000oP-Hi; Thu, 27 Jan 2022 11:49:02 +0000
Received: by outflank-mailman (input) for mailman id 261416;
 Thu, 27 Jan 2022 11:49:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nD3Gv-0000oJ-4x
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 11:49:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD3Gu-0006oE-IQ; Thu, 27 Jan 2022 11:49:00 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.9.172]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD3Gu-0004Jn-AQ; Thu, 27 Jan 2022 11:49:00 +0000
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
	bh=eVgzKQn8WuqtrjyoIfPwpsEZJQWPOJSIVG1Hq0fetRM=; b=MPoLxCGCVdJzVD+Em6BZSXfjih
	MYQ9VUw5Eo7lDJOfXJHRSNY7d9L2eokD81paHdrNJJj3/9YZEdOFsmKggMWOJ0ssE0JHTbeVRRejL
	khBJdkuuapaKAAylTiqCC7dI5bVHgE5cQ3TBlBANDn6BcmU0qmLIW1HrBgChQDyUvy9k=;
Message-ID: <5ca5e8c4-93b8-de4c-3582-cda9bd6b809e@xen.org>
Date: Thu, 27 Jan 2022 11:48:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V2 09/10] iommu/ipmmu-vmsa: Use refcount for the
 micro-TLBs
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
 <1640034957-19764-10-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1640034957-19764-10-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 20/12/2021 21:15, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Reference-count the micro-TLBs as several bus masters can be
> connected to the same micro-TLB (and drop TODO comment).
> This wasn't an issue so far, since the platform devices
> (this driver deals with) get assigned/deassigned together during
> domain creation/destruction. But, in order to support PCI devices
> (which are hot-pluggable) in the near future we will need to
> take care of.

Looking at the code, it is not possible to share the micro-TLB between 
domains (or even Xen). So technically, we will still want to {, 
un}hotplug the devices using the same u-TLB together.

Therefore, I would clarify that this is necessary because even if we 
have to remove all the devices together, the IOMMU driver will be 
de-assigning them one-by-one.

I would add a similar comment in the code as well.

> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes V1 -> V2:
>     - add R-b
>     - add ASSERT() in ipmmu_utlb_disable()
> ---
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index 649b9f6..1224ea4 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -127,6 +127,7 @@ struct ipmmu_vmsa_device {
>       spinlock_t lock;    /* Protects ctx and domains[] */
>       DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
>       struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
> +    unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>       const struct ipmmu_features *features;
>   };
>   
> @@ -467,13 +468,12 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
>           }
>       }
>   
> -    /*
> -     * TODO: Reference-count the micro-TLB as several bus masters can be
> -     * connected to the same micro-TLB.
> -     */
> -    ipmmu_imuasid_write(mmu, utlb, 0);
> -    ipmmu_imuctr_write(mmu, utlb, imuctr |
> -                       IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
> +    if ( mmu->utlb_refcount[utlb]++ == 0 )
> +    {
> +        ipmmu_imuasid_write(mmu, utlb, 0);
> +        ipmmu_imuctr_write(mmu, utlb, imuctr |
> +                           IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
> +    }
>   
>       return 0;
>   }
> @@ -484,7 +484,10 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
>   {
>       struct ipmmu_vmsa_device *mmu = domain->mmu;
>   
> -    ipmmu_imuctr_write(mmu, utlb, 0);
> +    ASSERT(mmu->utlb_refcount[utlb] > 0);
> +
> +    if ( --mmu->utlb_refcount[utlb] == 0 )
> +        ipmmu_imuctr_write(mmu, utlb, 0);
>   }
>   
>   /* Domain/Context Management */

Cheers,

-- 
Julien Grall

