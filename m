Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07164166F2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 22:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194575.346642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTVje-0004Qn-Kt; Thu, 23 Sep 2021 20:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194575.346642; Thu, 23 Sep 2021 20:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTVje-0004NZ-Hk; Thu, 23 Sep 2021 20:54:26 +0000
Received: by outflank-mailman (input) for mailman id 194575;
 Thu, 23 Sep 2021 20:54:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTVjc-0004NT-5Y
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 20:54:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6da82258-1cb0-11ec-ba8c-12813bfff9fa;
 Thu, 23 Sep 2021 20:54:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B92A60F6F;
 Thu, 23 Sep 2021 20:54:21 +0000 (UTC)
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
X-Inumbo-ID: 6da82258-1cb0-11ec-ba8c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632430461;
	bh=MZ1Cpxe/yyRtHke5E1DT0bNyKEHTkkdv7JaRRzbiH90=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=todhNFywr1KDbI8odMjNjGGQnFmH5hoz7CziyDk91GC/rqC3ENZqFPS1oItmQQuZ4
	 GhefOFCoSEwebMfJi8JwyhLIhlOnLDpUpmgTGnBRRTnDQYN8U97r4seCWma7kmePKs
	 rPvqKyBOE+HNTAiIJi2tKZhec0bcYk8rMnZUonv9MMPyeJoZsEpKOUdmhAkVGlxGYH
	 Fplul9Bmbf941n9sqHPhmwFsh0L6hcAclk4vhV9cHoaUb5Z+MuD3AhTfAkQKVfwXgg
	 7eC/fCPbSQbBvQnF9nLLaSk/9q/sqMJpkPOyJvu9C2uE8Wqqxp06gQsdVUxuA9ZPPh
	 HAa4edvx1jR0A==
Date: Thu, 23 Sep 2021 13:54:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Hongda Deng <Hongda.Deng@arm.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org, Bertrand.Marquis@arm.com, Wei.Chen@arm.com
Subject: Re: [PATCH] xen/arm: vgic to ignore GICD ICPENRn registers access
In-Reply-To: <0b0ede18-b944-8693-dede-616c3386e965@xen.org>
Message-ID: <alpine.DEB.2.21.2109231348200.17979@sstabellini-ThinkPad-T480s>
References: <20210923061429.16361-1-Hongda.Deng@arm.com> <0b0ede18-b944-8693-dede-616c3386e965@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Julien Grall wrote:
> Hi,
> 
> On 23/09/2021 11:14, Hongda Deng wrote:
> > Currently, Xen will return IO unhandled when guests access GICD ICPENRn
> > registers. This will raise a data abort inside guest. For Linux Guest,
> > these virtual registers will not be accessed. But for Zephyr, in its
> > GIC initilization code, these virtual registers will be accessed. And
> > zephyr guest will get an IO dataabort in initilization stage and enter
> 
> s/dataabort/data abort/
> s/initilization/initialization/
> 
> > fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
> > we currently ignore these virtual registers access and print a message
> > about whether they are already pending instead of returning unhandled.
> > More details can be found at [1].
> > 
> > [1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/
> > msg00744.html
> > 
> > Signed-off-by: Hongda Deng <hongda.deng@arm.com>
> > ---
> >   xen/arch/arm/vgic-v2.c     | 10 +++++++---
> >   xen/arch/arm/vgic-v3.c     | 29 +++++++++++++++++------------
> >   xen/arch/arm/vgic.c        | 37 +++++++++++++++++++++++++++++++++++++
> >   xen/include/asm-arm/vgic.h |  2 ++
> >   4 files changed, 63 insertions(+), 15 deletions(-)
> > 
> > diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> > index b2da886adc..644c62757c 100644
> > --- a/xen/arch/arm/vgic-v2.c
> > +++ b/xen/arch/arm/vgic-v2.c
> > @@ -481,10 +481,14 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v,
> > mmio_info_t *info,
> >         case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> >           if ( dabt.size != DABT_WORD ) goto bad_width;
> > +        rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ICPENDR, DABT_WORD);
> > +        if ( rank == NULL ) goto write_ignore;
> 
> 
> 
> > +
> >           printk(XENLOG_G_ERR
> > -               "%pv: vGICD: unhandled word write %#"PRIregister" to
> > ICPENDR%d\n",
> > -               v, r, gicd_reg - GICD_ICPENDR);
> > -        return 0;
> > +               "%pv: vGICD: unhandled word write %#"PRIregister" to
> > ICPENDR%d, and current pending state is: %s\n",
> > +               v, r, gicd_reg - GICD_ICPENDR,
> > +               vgic_get_irqs_pending(v, r, rank->index) ? "on" : "off");
> 
> Each register contain the information for multiple pending interrupts. So it
> is a bit confusing to say whether the state is on/off. Instead, it would be
> better to state which interrupt is pending.
> 
> Also, I would rather avoid printing a message if there are no interrupts
> pending because there are no issues if this is happening.
> 
> > +        goto write_ignore_32;
> >         case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
> >           if ( dabt.size != DABT_WORD ) goto bad_width;
> > diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> > index cb5a70c42e..c94e33ff4f 100644
> > --- a/xen/arch/arm/vgic-v3.c
> > +++ b/xen/arch/arm/vgic-v3.c
> > @@ -817,10 +817,14 @@ static int __vgic_v3_distr_common_mmio_write(const
> > char *name, struct vcpu *v,
> >         case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> >           if ( dabt.size != DABT_WORD ) goto bad_width;
> > +        rank = vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
> > +        if ( rank == NULL ) goto write_ignore;
> > +
> >           printk(XENLOG_G_ERR
> > -               "%pv: %s: unhandled word write %#"PRIregister" to
> > ICPENDR%d\n",
> > -               v, name, r, reg - GICD_ICPENDR);
> > -        return 0;
> > +               "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d,
> > and current pending state is: %s\n",
> > +               v, name, r, reg - GICD_ICPENDR,
> > +               vgic_get_irqs_pending(v, r, rank->index) ? "on" : "off");
> > +        goto write_ignore_32;
> >         case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
> >           if ( dabt.size != DABT_WORD ) goto bad_width;
> > @@ -978,19 +982,20 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu
> > *v, mmio_info_t *info,
> >       case VREG32(GICR_ICFGR1):
> >       case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
> >       case VREG32(GICR_ISPENDR0):
> > -         /*
> > -          * Above registers offset are common with GICD.
> > -          * So handle common with GICD handling
> > -          */
> > +        /*
> > +         * Above registers offset are common with GICD.
> > +         * So handle common with GICD handling
> > +         */
> >           return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
> >                                                    info, gicr_reg, r);
> >         case VREG32(GICR_ICPENDR0):
> > -        if ( dabt.size != DABT_WORD ) goto bad_width;
> > -        printk(XENLOG_G_ERR
> > -               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to
> > ICPENDR0\n",
> > -               v, r);
> > -        return 0;
> > +        /*
> > +         * Above registers offset are common with GICD.
> > +         * So handle common with GICD handling
> > +         */
> > +        return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
> > +                                                 info, gicr_reg, r);
> >         case VREG32(GICR_IGRPMODR0):
> >           /* We do not implement security extensions for guests, write
> > ignore */
> > diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> > index 8f9400a519..29a1aa5056 100644
> > --- a/xen/arch/arm/vgic.c
> > +++ b/xen/arch/arm/vgic.c
> > @@ -470,6 +470,43 @@ void vgic_set_irqs_pending(struct vcpu *v, uint32_t r,
> > unsigned int rank)
> >       }
> >   }
> >   +bool vgic_get_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
> > +{
> > +    const unsigned long mask = r;
> > +    unsigned int i;
> > +    /* The first rank is always per-vCPU */
> > +    bool private = rank == 0;
> > +    bool is_pending = false;
> > +
> > +    /* LPIs status will never be retrieved via this function */
> > +    ASSERT(!is_lpi(32 * rank + 31));
> > +
> > +    for_each_set_bit( i, &mask, 32 )
> > +    {
> > +        unsigned int irq = i + 32 * rank;
> > +
> > +        if ( !private )
> 
> It is not clear to me why you not handling PPIs/SGIs and ...
> 
> > +        {
> > +            struct pending_irq *p = spi_to_pending(v->domain, irq);
> > +
> > +            if ( p->desc != NULL )
> 
> ... emulated SPIs (e.g. PL011).
> 
> > +            {
> > +                unsigned long flags;
> > +
> > +                spin_lock_irqsave(&p->desc->lock, flags);
> > +                is_pending = gic_read_pending_state(p->desc);
> > +                spin_unlock_irqrestore(&p->desc->lock, flags);
> 
> What you are reading here is the pending state from the HW. This is not the
> same as the pending state from the VM PoV. In fact, in the most common case,
> the interrupt will be pending from the VM PoV, but simply active from the HW
> PoV (it is deactivated once the interrupt has been handled by the guest).
> 
> I think what you want to check is whether the flag GIC_IRQ_GUEST_QUEUED is set
> in p->status (Stefano ?).
 
Yeah, that's right. In fact, there is no need for checking the hardware
registers. You can just go through the inflight_irqs list and print all
of them (the list is sync on hyp entry on the cpu you are running on,
not the others of course).


> This is technically still a bit racy as Xen may still think the interrupt is
> pending while the it may be actually active in the guest. AFAIK, the other way
> around (i.e. not pending in Xen but pending in the guest) cannot happen.
> 
> Anyway, this is just a message, so it is still better than crashing :).

+1

