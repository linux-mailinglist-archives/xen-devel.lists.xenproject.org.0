Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEB8415B13
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193562.344776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTL9h-0003vR-BT; Thu, 23 Sep 2021 09:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193562.344776; Thu, 23 Sep 2021 09:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTL9h-0003tX-7L; Thu, 23 Sep 2021 09:36:37 +0000
Received: by outflank-mailman (input) for mailman id 193562;
 Thu, 23 Sep 2021 09:36:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTL9g-0003tR-33
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:36:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTL9f-0004ON-Tt; Thu, 23 Sep 2021 09:36:35 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTL9f-0003Cx-Iq; Thu, 23 Sep 2021 09:36:35 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=j+fUunU+E7Qz1EZZojv+haB+IVBX0/IWAy4Wv+P1qOM=; b=MjvuqNJE3rMtwHRW8x3BZvvb9S
	8L5QT4cWpPN1+wrs7gutf1VKsNiJRBNTQLNRxfi8dEC5wvU4Etn1Vj9VhMkljIWGCKRaZKcIpnOIX
	kjy7OiR1f+3z9yHZkP+uWkdh4+1LYrYVW10eP/VIfNCyFlghUVtiqThTobm7IpJ8cgSA=;
Subject: Re: [PATCH] xen/arm: vgic to ignore GICD ICPENRn registers access
To: Hongda Deng <Hongda.Deng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923061429.16361-1-Hongda.Deng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0b0ede18-b944-8693-dede-616c3386e965@xen.org>
Date: Thu, 23 Sep 2021 14:36:32 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923061429.16361-1-Hongda.Deng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 23/09/2021 11:14, Hongda Deng wrote:
> Currently, Xen will return IO unhandled when guests access GICD ICPENRn
> registers. This will raise a data abort inside guest. For Linux Guest,
> these virtual registers will not be accessed. But for Zephyr, in its
> GIC initilization code, these virtual registers will be accessed. And
> zephyr guest will get an IO dataabort in initilization stage and enter

s/dataabort/data abort/
s/initilization/initialization/

> fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
> we currently ignore these virtual registers access and print a message
> about whether they are already pending instead of returning unhandled.
> More details can be found at [1].
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/
> msg00744.html
> 
> Signed-off-by: Hongda Deng <hongda.deng@arm.com>
> ---
>   xen/arch/arm/vgic-v2.c     | 10 +++++++---
>   xen/arch/arm/vgic-v3.c     | 29 +++++++++++++++++------------
>   xen/arch/arm/vgic.c        | 37 +++++++++++++++++++++++++++++++++++++
>   xen/include/asm-arm/vgic.h |  2 ++
>   4 files changed, 63 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index b2da886adc..644c62757c 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -481,10 +481,14 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>   
>       case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> +        rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ICPENDR, DABT_WORD);
> +        if ( rank == NULL ) goto write_ignore;



> +
>           printk(XENLOG_G_ERR
> -               "%pv: vGICD: unhandled word write %#"PRIregister" to ICPENDR%d\n",
> -               v, r, gicd_reg - GICD_ICPENDR);
> -        return 0;
> +               "%pv: vGICD: unhandled word write %#"PRIregister" to ICPENDR%d, and current pending state is: %s\n",
> +               v, r, gicd_reg - GICD_ICPENDR,
> +               vgic_get_irqs_pending(v, r, rank->index) ? "on" : "off");

Each register contain the information for multiple pending interrupts. 
So it is a bit confusing to say whether the state is on/off. Instead, it 
would be better to state which interrupt is pending.

Also, I would rather avoid printing a message if there are no interrupts 
pending because there are no issues if this is happening.

> +        goto write_ignore_32;
>   
>       case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index cb5a70c42e..c94e33ff4f 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -817,10 +817,14 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>   
>       case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> +        rank = vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
> +        if ( rank == NULL ) goto write_ignore;
> +
>           printk(XENLOG_G_ERR
> -               "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d\n",
> -               v, name, r, reg - GICD_ICPENDR);
> -        return 0;
> +               "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d, and current pending state is: %s\n",
> +               v, name, r, reg - GICD_ICPENDR,
> +               vgic_get_irqs_pending(v, r, rank->index) ? "on" : "off");
> +        goto write_ignore_32;
>   
>       case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> @@ -978,19 +982,20 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
>       case VREG32(GICR_ICFGR1):
>       case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
>       case VREG32(GICR_ISPENDR0):
> -         /*
> -          * Above registers offset are common with GICD.
> -          * So handle common with GICD handling
> -          */
> +        /*
> +         * Above registers offset are common with GICD.
> +         * So handle common with GICD handling
> +         */
>           return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
>                                                    info, gicr_reg, r);
>   
>       case VREG32(GICR_ICPENDR0):
> -        if ( dabt.size != DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to ICPENDR0\n",
> -               v, r);
> -        return 0;
> +        /*
> +         * Above registers offset are common with GICD.
> +         * So handle common with GICD handling
> +         */
> +        return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
> +                                                 info, gicr_reg, r);
>   
>       case VREG32(GICR_IGRPMODR0):
>           /* We do not implement security extensions for guests, write ignore */
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 8f9400a519..29a1aa5056 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -470,6 +470,43 @@ void vgic_set_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
>       }
>   }
>   
> +bool vgic_get_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
> +{
> +    const unsigned long mask = r;
> +    unsigned int i;
> +    /* The first rank is always per-vCPU */
> +    bool private = rank == 0;
> +    bool is_pending = false;
> +
> +    /* LPIs status will never be retrieved via this function */
> +    ASSERT(!is_lpi(32 * rank + 31));
> +
> +    for_each_set_bit( i, &mask, 32 )
> +    {
> +        unsigned int irq = i + 32 * rank;
> +
> +        if ( !private )

It is not clear to me why you not handling PPIs/SGIs and ...

> +        {
> +            struct pending_irq *p = spi_to_pending(v->domain, irq);
> +
> +            if ( p->desc != NULL )

... emulated SPIs (e.g. PL011).

> +            {
> +                unsigned long flags;
> +
> +                spin_lock_irqsave(&p->desc->lock, flags);
> +                is_pending = gic_read_pending_state(p->desc);
> +                spin_unlock_irqrestore(&p->desc->lock, flags);

What you are reading here is the pending state from the HW. This is not 
the same as the pending state from the VM PoV. In fact, in the most 
common case, the interrupt will be pending from the VM PoV, but simply 
active from the HW PoV (it is deactivated once the interrupt has been 
handled by the guest).

I think what you want to check is whether the flag GIC_IRQ_GUEST_QUEUED 
is set in p->status (Stefano ?).

This is technically still a bit racy as Xen may still think the 
interrupt is pending while the it may be actually active in the guest. 
AFAIK, the other way around (i.e. not pending in Xen but pending in the 
guest) cannot happen.

Anyway, this is just a message, so it is still better than crashing :).

Cheers,

-- 
Julien Grall

