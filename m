Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F213223A0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 02:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88462.166352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEMQt-00054E-3u; Tue, 23 Feb 2021 01:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88462.166352; Tue, 23 Feb 2021 01:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEMQt-00053o-0Q; Tue, 23 Feb 2021 01:24:11 +0000
Received: by outflank-mailman (input) for mailman id 88462;
 Tue, 23 Feb 2021 01:24:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEMQr-00053i-3a
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 01:24:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed33250b-c8fa-4049-a486-2df52977b981;
 Tue, 23 Feb 2021 01:24:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78B0D64E5C;
 Tue, 23 Feb 2021 01:24:07 +0000 (UTC)
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
X-Inumbo-ID: ed33250b-c8fa-4049-a486-2df52977b981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614043447;
	bh=6PNWPCOEa99vUhFegDYqJfYobxHhLaUuhFb7duvrvRY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SG2deOa1OGRPUnkYc6zlfuUCfn0cL/QDppHjz3no6EbAjL/30okf7k0sCs0UQYhQE
	 twdpDXPF0/H/90ppQyPp2I5FBs79TTvzlvNlATTOBsNQ5fJoJSX+KKsfYnz5O7a2Iq
	 OilkRUaWENNOlVwzQYsW1zla/9S/xNoNz34iKxWgcye1NbblK+Lasat+pirpYUlsA0
	 I3nHCCz+fZeL/mMzA9vv7CUgF16pqXV8+KytNMfAi/Gi7oUD/R2DJKJcHiAESO4pxu
	 DVBFVVUU+KbkBxxN2qfyQp/jlcDUhu31sIVImnrohx7en3qn9xkrBLo0+WoUw94/PE
	 zUh5Ye1y1i/pQ==
Date: Mon, 22 Feb 2021 17:24:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "iwj@xenproject.org" <iwj@xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, dfaggioli@suse.com, 
    George.Dunlap@citrix.com
Subject: Re: [PATCH for-4.15] xen/vgic: Implement write to ISPENDR in vGICv{2,
 3}
In-Reply-To: <F86904EB-91E9-475C-B60B-E08C5C9E76C3@arm.com>
Message-ID: <alpine.DEB.2.21.2102221253390.3234@sstabellini-ThinkPad-T480s>
References: <20210220140412.31610-1-julien@xen.org> <F86904EB-91E9-475C-B60B-E08C5C9E76C3@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Feb 2021, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 20 Feb 2021, at 14:04, Julien Grall <julien@xen.org> wrote:
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > Currently, Xen will send a data abort to a guest trying to write to the
> > ISPENDR.
> > 
> > Unfortunately, recent version of Linux (at least 5.9+) will start
> > writing to the register if the interrupt needs to be re-triggered
> > (see the callback irq_retrigger). This can happen when a driver (such as
> > the xgbe network driver on AMD Seattle) re-enable an interrupt:
> > 
> > (XEN) d0v0: vGICD: unhandled word write 0x00000004000000 to ISPENDR44
> > [...]
> > [   25.635837] Unhandled fault at 0xffff80001000522c
> > [...]
> > [   25.818716]  gic_retrigger+0x2c/0x38
> > [   25.822361]  irq_startup+0x78/0x138
> > [   25.825920]  __enable_irq+0x70/0x80
> > [   25.829478]  enable_irq+0x50/0xa0
> > [   25.832864]  xgbe_one_poll+0xc8/0xd8
> > [   25.836509]  net_rx_action+0x110/0x3a8
> > [   25.840328]  __do_softirq+0x124/0x288
> > [   25.844061]  irq_exit+0xe0/0xf0
> > [   25.847272]  __handle_domain_irq+0x68/0xc0
> > [   25.851442]  gic_handle_irq+0xa8/0xe0
> > [   25.855171]  el1_irq+0xb0/0x180
> > [   25.858383]  arch_cpu_idle+0x18/0x28
> > [   25.862028]  default_idle_call+0x24/0x5c
> > [   25.866021]  do_idle+0x204/0x278
> > [   25.869319]  cpu_startup_entry+0x24/0x68
> > [   25.873313]  rest_init+0xd4/0xe4
> > [   25.876611]  arch_call_rest_init+0x10/0x1c
> > [   25.880777]  start_kernel+0x5b8/0x5ec
> > 
> > As a consequence, the OS may become unusable.
> > 
> > Implementing the write part of ISPENDR is somewhat easy. For
> > virtual interrupt, we only need to inject the interrupt again.
> > 
> > For physical interrupt, we need to be more careful as the de-activation
> > of the virtual interrupt will be propagated to the physical distributor.
> > For simplicity, the physical interrupt will be set pending so the
> > workflow will not differ from a "real" interrupt.
> > 
> > Longer term, we could possible directly activate the physical interrupt
> > and avoid taking an exception to inject the interrupt to the domain.
> > (This is the approach taken by the new vGIC based on KVM).
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>

Thanks for the patch!


> This is something which will not be done by a guest very often so I think your
> implementation actually makes it simpler and reduce possibilities of race conditions
> so I am not even sure that the XXX comment is needed.
> But i am ok with it being in or not so:
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> I did some tests by manually generating interrupts and I can confirm that this
> works as expected.

And thank you for testing.

Yes it is definitely true that it shouldn't be done by the guest often
so it is not worth optimizing. For example, if somebody is trying to
measure latency using this, they are really barking at the wrong tree.
And I like the simplicity of this implementation; the patch looks good.


So I am not too worries about the cost of the roundtrip. But should we
be worried about the guest continuously creating events for itself in a
loop and potentially "kidnapping" a pcpu by looping around ISPENDR? I am
talking about cases where 1 pcpu is shared between 2 vcpus of different
guests. I thought we should have a brief conversation about it before
allowing it.

The consequence of this patch is that a guest can cause vcpu_unblock(v),
hence vcpu_wake(v), to be called for its own vcpu, which basically
always changes v to RUNSTATE_runnable. However, that alone shouldn't
allow v to always come up ahead of any other vcpus in the queue, right?
It should be safe. I just wanted a second opinion on this :-)

It was possible to trigger interrupts for your own vcpus even before, but
now the code path is going to be direct for virtual interrupts.



> > ---
> > 
> > Note that this doesn't touch the read part for I{S,C}PENDR nor the write
> > part of ICPENDR because they are more complex to implement.
> > 
> > For physical interrupt, I didn't implement the same solution as KVM because
> > I couldn't convince myself this could be done race free for physical
> > interrupt.
> > 
> > This was tested using the IRQ debugfs (CONFIG_GENERIC_IRQ_DEBUGFS=y)
> > which allows to retrigger an interrupt:
> > 
> > 42sh> echo trigger > /sys/kernel/debug/irq/irqs/<irq>
> > 
> > This patch is candidate for 4.15 and also backporting to older trees.
> > Without this patch, recent Linux version may not boot on Xen on some
> > platforms (such as AMD Seattle used in OssTest).
> > 
> > The patch is self-contained to implementing a single set of registers.
> > So this would not introduce any risk on platforms where OSes don't use
> > those registers.
> > 
> > For the other setup (e.g. AMD Seattle + Linux 5.9+), it cannot be worse
> > than today.
> > 
> > So therefore, I would consider the risk limited.
> > ---
> > xen/arch/arm/vgic-v2.c     | 10 ++++----
> > xen/arch/arm/vgic-v3.c     | 18 ++++++---------
> > xen/arch/arm/vgic.c        | 47 ++++++++++++++++++++++++++++++++++++++
> > xen/include/asm-arm/vgic.h |  2 ++
> > 4 files changed, 62 insertions(+), 15 deletions(-)
> > 
> > diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> > index 64b141fea586..b2da886adc18 100644
> > --- a/xen/arch/arm/vgic-v2.c
> > +++ b/xen/arch/arm/vgic-v2.c
> > @@ -472,10 +472,12 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
> > 
> >     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
> >         if ( dabt.size != DABT_WORD ) goto bad_width;
> > -        printk(XENLOG_G_ERR
> > -               "%pv: vGICD: unhandled word write %#"PRIregister" to ISPENDR%d\n",
> > -               v, r, gicd_reg - GICD_ISPENDR);
> > -        return 0;
> > +        rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ISPENDR, DABT_WORD);
> > +        if ( rank == NULL ) goto write_ignore;
> > +
> > +        vgic_set_irqs_pending(v, r, rank->index);
> > +
> > +        return 1;
> > 
> >     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> >         if ( dabt.size != DABT_WORD ) goto bad_width;
> > diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> > index fd8cfc156d0c..613f37abab5e 100644
> > --- a/xen/arch/arm/vgic-v3.c
> > +++ b/xen/arch/arm/vgic-v3.c
> > @@ -808,10 +808,12 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
> > 
> >     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
> >         if ( dabt.size != DABT_WORD ) goto bad_width;
> > -        printk(XENLOG_G_ERR
> > -               "%pv: %s: unhandled word write %#"PRIregister" to ISPENDR%d\n",
> > -               v, name, r, reg - GICD_ISPENDR);
> > -        return 0;
> > +        rank = vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
> > +        if ( rank == NULL ) goto write_ignore;
> > +
> > +        vgic_set_irqs_pending(v, r, rank->index);
> > +
> > +        return 1;
> > 
> >     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> >         if ( dabt.size != DABT_WORD ) goto bad_width;
> > @@ -975,6 +977,7 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
> >     case VREG32(GICR_ICACTIVER0):
> >     case VREG32(GICR_ICFGR1):
> >     case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
> > +    case VREG32(GICR_ISPENDR0):
> >          /*
> >           * Above registers offset are common with GICD.
> >           * So handle common with GICD handling
> > @@ -982,13 +985,6 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
> >         return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
> >                                                  info, gicr_reg, r);
> > 
> > -    case VREG32(GICR_ISPENDR0):
> > -        if ( dabt.size != DABT_WORD ) goto bad_width;
> > -        printk(XENLOG_G_ERR
> > -               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to ISPENDR0\n",
> > -               v, r);
> > -        return 0;
> > -
> >     case VREG32(GICR_ICPENDR0):
> >         if ( dabt.size != DABT_WORD ) goto bad_width;
> >         printk(XENLOG_G_ERR
> > diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> > index 82f524a35c9e..8f9400a51960 100644
> > --- a/xen/arch/arm/vgic.c
> > +++ b/xen/arch/arm/vgic.c
> > @@ -423,6 +423,53 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n)
> >     }
> > }
> > 
> > +void vgic_set_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
> > +{
> > +    const unsigned long mask = r;
> > +    unsigned int i;
> > +    /* The first rank is always per-vCPU */
> > +    bool private = rank == 0;
> > +
> > +    /* LPIs will never be set pending via this function */
> > +    ASSERT(!is_lpi(32 * rank + 31));
> > +
> > +    for_each_set_bit( i, &mask, 32 )
> > +    {
> > +        unsigned int irq = i + 32 * rank;
> > +
> > +        if ( !private )
> > +        {
> > +            struct pending_irq *p = spi_to_pending(v->domain, irq);
> > +
> > +            /*
> > +             * When the domain sets the pending state for a HW interrupt on
> > +             * the virtual distributor, we set the pending state on the
> > +             * physical distributor.
> > +             *
> > +             * XXX: Investigate whether we would be able to set the
> > +             * physical interrupt active and save an interruption. (This
> > +             * is what the new vGIC does).
> > +             */
> > +            if ( p->desc != NULL )
> > +            {
> > +                unsigned long flags;
> > +
> > +                spin_lock_irqsave(&p->desc->lock, flags);
> > +                gic_set_pending_state(p->desc, true);
> > +                spin_unlock_irqrestore(&p->desc->lock, flags);
> > +                continue;
> > +            }
> > +        }
> > +
> > +        /*
> > +         * If the interrupt is per-vCPU, then we want to inject the vIRQ
> > +         * to v, otherwise we should let the function figuring out the
> > +         * correct vCPU.
> > +         */
> > +        vgic_inject_irq(v->domain, private ? v : NULL, irq, true);
> > +    }
> > +}
> > +
> > bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
> >                  int virq, const struct sgi_target *target)
> > {
> > diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> > index ce1e3c4bbdac..62c2ae538db2 100644
> > --- a/xen/include/asm-arm/vgic.h
> > +++ b/xen/include/asm-arm/vgic.h
> > @@ -288,6 +288,8 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, int b, int n, int
> > extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq);
> > extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n);
> > extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n);
> > +extern void vgic_set_irqs_pending(struct vcpu *v, uint32_t r,
> > +                                  unsigned int rank);
> > extern void register_vgic_ops(struct domain *d, const struct vgic_ops *ops);
> > int vgic_v2_init(struct domain *d, int *mmio_count);
> > int vgic_v3_init(struct domain *d, int *mmio_count);
> > -- 
> > 2.17.1
> > 
> 

