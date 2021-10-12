Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9E342AF68
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 23:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207691.363589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPmY-0001KH-Kw; Tue, 12 Oct 2021 21:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207691.363589; Tue, 12 Oct 2021 21:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPmY-0001Hl-Ht; Tue, 12 Oct 2021 21:57:58 +0000
Received: by outflank-mailman (input) for mailman id 207691;
 Tue, 12 Oct 2021 21:57:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maPmX-0001Hf-7d
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 21:57:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maPmX-0002kr-2o; Tue, 12 Oct 2021 21:57:57 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.23.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maPmW-0005xW-SR; Tue, 12 Oct 2021 21:57:57 +0000
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
	bh=0gOdKZSlq9Ajq7NcXh44sS3qwIYrAyVreVd98Uns7nY=; b=l36CLYwwA7N9fTIDFi6RqjMQQU
	LNXIBrnI5+Gip2Y6TNE4uP2rZIeqXPTs9JP5xVCS7wgx5ekg5PxRbjioJYAXHUX8E6h5OFFgEjnh5
	sV3+inc76ZNrOykPY5niB6Vog36/ZEz4J214TVNmllewSoZBYJGKW7IX7xEexBo0ahbQ=;
Message-ID: <2006f09d-25c3-af7a-cbea-dbc811fc8748@xen.org>
Date: Tue, 12 Oct 2021 22:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2] xen/arm: vgic to ignore GICD ICPENRn registers access
To: Hongda Deng <Hongda.Deng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211012062449.30966-1-Hongda.Deng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211012062449.30966-1-Hongda.Deng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/10/2021 07:24, Hongda Deng wrote:
> Currently, Xen will return IO unhandled when guests access GICD ICPENRn
> registers. This will raise a data abort inside guest. For Linux Guest,
> these virtual registers will not be accessed. But for Zephyr, in its
> GIC initialization code, these virtual registers will be accessed. And
> zephyr guest will get an IO data abort in initilization stage and enter
> fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
> we currently ignore these virtual registers access and print a message
> about whether they are already pending instead of returning unhandled.
> More details can be found at [1].

The link you provide only states that I am happy with the warning. This 
doesn't seem relevant for a future reader. Did you intend to point to 
something different?

> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/
> msg00744.html
> 
> Signed-off-by: Hongda Deng <hongda.deng@arm.com>
> ---
>   xen/arch/arm/vgic-v2.c | 26 +++++++++++++++++++++++++-
>   xen/arch/arm/vgic-v3.c | 40 +++++++++++++++++++++++++++++++---------
>   2 files changed, 56 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index b2da886adc..d7ffaeeb65 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -480,11 +480,35 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>           return 1;
>   
>       case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> +    {
> +        struct pending_irq *iter;
> +        unsigned int irq_start;
> +        unsigned int irq_end;
> +        uint32_t irq_pending = 0;
> +
>           if ( dabt.size != DABT_WORD ) goto bad_width;
>           printk(XENLOG_G_ERR
>                  "%pv: vGICD: unhandled word write %#"PRIregister" to ICPENDR%d\n",
>                  v, r, gicd_reg - GICD_ICPENDR);

As I wrote in v1, we should avoid to print a message when we know there 
is no pending interrupts.

> -        return 0;
> +
> +        irq_start = (gicd_reg - GICD_ICPENDR) * 32;
> +        irq_end = irq_start + 31;
> +        /* go through inflight_irqs and print specified pending irqs */
> +        list_for_each_entry(iter, &v->arch.vgic.inflight_irqs, inflight)
You need to hold v->arch.vgic.lock (with interrupt disabled) to go 
through the list of inflight irqs. Otherwise, the list may be modified 
while you are walking it.

However, I am a little bit concerned with this approached (I noticed 
Stefano suggested). The list may in theory contains a few hundreds 
interrupts (a malicious OS May decide to never read IAR). So we are 
potentially doing more work than necessary (we need to think about the 
worse case scenario).

Instead, I think it would be better to go through the 32 interrupts and 
for each of them:
   1) find the pending_irq() using irq_to_pending()
   2) check if the IRQ in the inflight list with list_empty(&p->inflight)

In addition to that, you want to check that the rank exists so we don't 
do any extra work if the guest is trying to clear an interrupts above 
the number of interrupts we support.

> +        {
> +            if ( iter->irq < irq_start || irq_end < iter->irq )
> +                continue;
> +
> +            if ( test_bit(GIC_IRQ_GUEST_QUEUED, &iter->status) )
> +                irq_pending = irq_pending | (1 << (iter->irq - irq_start));
> +        }
> +
> +        if ( irq_pending != 0 )
> +            printk(XENLOG_G_ERR
> +                   "%pv: vGICD: ICPENDR%d=0x%08x\n",
> +                   v, gicd_reg - GICD_ICPENDR, irq_pending);

This message is a bit confusing. I think it would be worth to print a 
message for every interrupt not cleared. Maybe something like:

"%pv trying to clear pending interrupt %u."

> +        goto write_ignore_32;
> +    }
>   
>       case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index cb5a70c42e..243b24e496 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -816,11 +816,35 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>           return 1;
>   
>       case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> +    {
> +        struct pending_irq *iter;
> +        unsigned int irq_start;
> +        unsigned int irq_end;
> +        uint32_t irq_pending = 0;
> +
>           if ( dabt.size != DABT_WORD ) goto bad_width;
>           printk(XENLOG_G_ERR
>                  "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d\n",
>                  v, name, r, reg - GICD_ICPENDR);
> -        return 0;
> +
> +        irq_start = (reg - GICD_ICPENDR) * 32;
> +        irq_end = irq_start + 31;
> +        /* go through inflight_irqs and print specified pending irqs */
> +        list_for_each_entry(iter, &v->arch.vgic.inflight_irqs, inflight)
> +        {
> +            if ( iter->irq < irq_start || irq_end < iter->irq )
> +                continue;
> +
> +            if ( test_bit(GIC_IRQ_GUEST_QUEUED, &iter->status) )
> +                irq_pending = irq_pending | (1 << (iter->irq - irq_start));
> +        }
> +
> +        if ( irq_pending != 0 )
> +            printk(XENLOG_G_ERR
> +                   "%pv: %s: ICPENDR%d=0x%08x\n",
> +                   v, name, reg - GICD_ICPENDR, irq_pending);

My remarks apply for GICv3 as well. Note that in the case of GICv3 v may 
not be current.

That said, the code is quite similar and not trivial. Can we provide an 
helper that can be used for the two GICs?

> +        goto write_ignore_32;
> +    }
>   
>       case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> @@ -978,19 +1002,17 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
>       case VREG32(GICR_ICFGR1):
>       case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
>       case VREG32(GICR_ISPENDR0):
> -         /*
> -          * Above registers offset are common with GICD.
> -          * So handle common with GICD handling
> -          */
> +        /*
> +        * Above registers offset are common with GICD.
> +        * So handle common with GICD handling
> +        */

This looks like a spurious change.

>           return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
>                                                    info, gicr_reg, r);
>   
>       case VREG32(GICR_ICPENDR0):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to ICPENDR0\n",
> -               v, r);
> -        return 0;
> +        return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
> +                                                 info, gicr_reg, r);
>   
>       case VREG32(GICR_IGRPMODR0):
>           /* We do not implement security extensions for guests, write ignore */
> 

Cheers,

-- 
Julien Grall

