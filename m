Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF2FB39C1B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098532.1452555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbIi-0004Vh-Tw; Thu, 28 Aug 2025 12:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098532.1452555; Thu, 28 Aug 2025 12:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbIi-0004TM-Pv; Thu, 28 Aug 2025 12:00:20 +0000
Received: by outflank-mailman (input) for mailman id 1098532;
 Thu, 28 Aug 2025 12:00:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1urbIh-0004Se-1K
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:00:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urbIf-00AuCj-3B;
 Thu, 28 Aug 2025 12:00:18 +0000
Received: from [15.248.2.24] (helo=[10.24.67.148])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urbIf-005kd4-37;
 Thu, 28 Aug 2025 12:00:18 +0000
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
	bh=nvp+Xi3IhPq4YNQKaeTUffwnqur+Ykho8yU2oIlmhvY=; b=DWPRRkJ864QislcHvQWwcnRwWX
	LYLjka5ajP1rwgINQwU9OoMb24B6zK/WTc431hWDoYBkwDY2n0mQIDERyPI0yc7NX7cgk5BemS4Pu
	HMcLp6Ttk09+TfgdlAjyWqTD5odT2ixZPYkvmH2rIWod4aJ0zfpqyfoDGdKWZrchCO8s=;
Message-ID: <69bdbdac-4876-47de-b8db-ce6f3e1b7a24@xen.org>
Date: Thu, 28 Aug 2025 13:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <5f511d386c7f20b09106aa0202e0989477eff498.1756317702.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5f511d386c7f20b09106aa0202e0989477eff498.1756317702.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 27/08/2025 19:24, Leonid Komarianskyi wrote:
> Currently, many common functions perform the same operations to calculate
> GIC register addresses. This patch consolidates the similar code into
> a separate helper function to improve maintainability and reduce duplication.
> This refactoring also simplifies the implementation of eSPI support in future
> changes.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> Changes in V4:
> - no changes
> 
> Changes in V3:
> - changed panic() in get_addr_by_offset() to printing warning and
>    ASSERT_UNREACHABLE()
> - added verification of return pointer from get_addr_by_offset() in the
>    callers
> - moved invocation of get_addr_by_offset() from spinlock guards, since
>    it is not necessarry
> - added RB from Volodymyr Babchuk

Procces remark, here you said the Reviewed-by from Volodymyr was added 
in v3. However, given the changes you made this should have been 
invalidated (reviewed-by means the person read the code and confirmed it 
is correct).

I see Volodymyr confirmed his reviewed-by on v3. So no issue, but this 
should have been clarified in the changelog.

> 
> Changes in V2:
> - no changes
> ---
>   xen/arch/arm/gic-v3.c          | 114 +++++++++++++++++++++++----------
>   xen/arch/arm/include/asm/irq.h |   1 +
>   2 files changed, 81 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index cd3e1acf79..a959fefebe 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -445,17 +445,67 @@ static void gicv3_dump_state(const struct vcpu *v)
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
> +    printk(XENLOG_WARNING "GICv3: WARNING: Invalid offset 0x%x for IRQ#%d",

NIT: I am not expecting the interrupt to be < 0. So it would be 
preferable to use %u.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


