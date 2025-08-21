Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247BDB2FFBE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088996.1446694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7ve-00076V-OA; Thu, 21 Aug 2025 16:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088996.1446694; Thu, 21 Aug 2025 16:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7ve-00074r-LJ; Thu, 21 Aug 2025 16:14:18 +0000
Received: by outflank-mailman (input) for mailman id 1088996;
 Thu, 21 Aug 2025 16:14:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1up7vd-00074l-N1
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:14:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up7vc-00Gony-35;
 Thu, 21 Aug 2025 16:14:17 +0000
Received: from [15.248.3.91] (helo=[10.24.67.183])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up7vc-00Blg0-35;
 Thu, 21 Aug 2025 16:14:17 +0000
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
	bh=xT3/xcql+qm6XsMDqL3D2XdE5ABxLpvhWrulHmg82qQ=; b=huN2FnVyGB/PdirL3Mp1QAbAfE
	N4FnfcftFFpNq8Abe3XV59Thtd9mtIpImprU5bO4DTVb4LXNx5N7sewtVwpTSI36GoUzN/0DEIacu
	3ND2QQ1b2MdVOj/74NoEaNBmkml9yPMByDcb1Mg8qy+/1E+ztTsjcqBD9E0PUFedTkj0=;
Message-ID: <915641a6-8cc6-45bf-a1ee-d69b286e7d30@xen.org>
Date: Thu, 21 Aug 2025 17:14:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1754514206.git.leonid_komarianskyi@epam.com>
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 07/08/2025 13:33, Leonid Komarianskyi wrote:
> Currently, many common functions perform the same operations to calculate
> GIC register addresses. This patch consolidates the similar code into
> a separate helper function to improve maintainability and reduce duplication.
> This refactoring also simplifies the implementation of eSPI support in future
> changes.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V2:
> - no changes

I am a bit surprised this is just saying no changes given the discussion 
in v1. I feel you should have pinged on the v1 to close off the 
discussion before sending v2.

While I understand your point and could accept we consolidate the code...


> ---
>   xen/arch/arm/gic-v3.c          | 99 ++++++++++++++++++++++------------
>   xen/arch/arm/include/asm/irq.h |  1 +
>   2 files changed, 67 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index cd3e1acf79..8fd78aba44 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -445,17 +445,62 @@ static void gicv3_dump_state(const struct vcpu *v)
>       }
>   }
>   
> +static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offset)
> +{
> +    switch ( irqd->irq )
> +    {
> +    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +        case GICD_ICENABLER:
> +        case GICD_ISPENDR:
> +        case GICD_ICPENDR:
> +        case GICD_ISACTIVER:
> +        case GICD_ICACTIVER:
> +            return (GICD_RDIST_SGI_BASE + offset);
> +        case GICD_ICFGR:
> +            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
> +        case GICD_IPRIORITYR:
> +            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
> +        default:
> +            break;
> +        }
> +    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +        case GICD_ICENABLER:
> +        case GICD_ISPENDR:
> +        case GICD_ICPENDR:
> +        case GICD_ISACTIVER:
> +        case GICD_ICACTIVER:
> +            return (GICD + offset + (irqd->irq / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTER + irqd->irq * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYR + irqd->irq);
> +        default:
> +            break;
> +        }
> +    default:
> +        break;
> +    }
> +
> +    /* Something went wrong, we shouldn't be able to reach here */
 > +    panic("Invalid offset 0x%x for IRQ#%d", offset, irqd->irq);

... I still quite concerned about using panic here. We need to try to 
handle the error more gracefully in production.

Cheers,

-- 
Julien Grall


