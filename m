Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092CBB14E70
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062701.1428439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkS0-0006gr-Vt; Tue, 29 Jul 2025 13:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062701.1428439; Tue, 29 Jul 2025 13:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkS0-0006dk-Ss; Tue, 29 Jul 2025 13:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1062701;
 Tue, 29 Jul 2025 13:33:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ugkS0-0006de-2j
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:33:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkRz-007U8N-1h;
 Tue, 29 Jul 2025 13:33:03 +0000
Received: from [15.248.3.91] (helo=[10.24.66.55])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkRz-00FphO-14;
 Tue, 29 Jul 2025 13:33:03 +0000
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
	bh=rO3w1nSK6i0CcNoYyyYcWWJtsxOcZ6HqzwF+hcLRPEU=; b=eItoabzPHzV9AqDgeYCwQ1+IIu
	LkuxVSKWJzxaXmn5EVhdOlYKVzF8RdfVCxb8vbwljLdPjFhL1tFTtTk9mh53jXr1tUJFHRG6Z6pGn
	ECWAL0qyGjD+7TH4itIXaj012oFO0UOgQiOGoxxGlYlFd+06HTPyY8HzkZUdwjckuIpw=;
Message-ID: <e128c0f2-3730-458d-8c36-37f408ce812f@xen.org>
Date: Tue, 29 Jul 2025 14:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
 <7b53e684d540372f625327f72176a9ff1988e748.1753367178.git.leonid_komarianskyi@epam.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <7b53e684d540372f625327f72176a9ff1988e748.1753367178.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 24/07/2025 15:57, Leonid Komarianskyi wrote:
> Currently, many common functions perform the same operations to calculate
> GIC register addresses. This patch consolidates the similar code into
> a separate helper function to improve maintainability and reduce duplication.
> This refactoring also simplifies the implementation of eSPI support in future
> changes.
 > > Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
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

This panic is worrying me because we have multiple switch above and it 
is difficult to figure out whether everything was covered. Looking at 
the code, it seems the main advantage would be for ISENABLER/ICENABLER & 
co because they are using the same logic.

Therefore if you want to consolidate some code, then I would prefer if 
we introduce an helper just to deal with that logic. The rest (i.e. 
ICFGR, IROUTER, IPRIORITY) should stay inlined.

Cheers,

-- 
Julien Grall


