Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3610978F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 02:25:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZPX3-0006eI-DZ; Tue, 26 Nov 2019 01:20:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nsV+=ZS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iZPX2-0006eD-29
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 01:20:44 +0000
X-Inumbo-ID: f6e9b97a-0fea-11ea-a399-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6e9b97a-0fea-11ea-a399-12813bfff9fa;
 Tue, 26 Nov 2019 01:20:43 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 155E32068F;
 Tue, 26 Nov 2019 01:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574731242;
 bh=jZGKU9i2By9yUVC3O9UMBlkHQbFUcmrmOL3s3POkkVA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=eyaG8/R8p64KvFknbDXS1roM3/RiuiKNp7Xk63CqzFRLGjPJdj46GraAg2FuYib4q
 71iKLfE6o0mrr+/bzTtprVZ34tFXvP3oSckFZb9XN5BHSkIMcCSD5eVACLzAtiGEku
 Vo5B3v19Ea2LEoxwQx87QBVv9KkU+XmtGrfakwxA=
Date: Mon, 25 Nov 2019 17:20:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <faf54fd5-0a42-2683-5ddf-0137b2b65046@xen.org>
Message-ID: <alpine.DEB.2.21.1911251716500.8205@sstabellini-ThinkPad-T480s>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
 <b0bac87a-3a11-bbb1-6c13-a23087590d87@xen.org>
 <faf54fd5-0a42-2683-5ddf-0137b2b65046@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1461152034-1574731242=:8205"
Subject: Re: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery
 of PPIs to guests
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1461152034-1574731242=:8205
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 25 Nov 2019, Julien Grall wrote:
> (+ Andre)
> 
> On 23/11/2019 20:35, Julien Grall wrote:
> > Hi,
> > 
> > On 15/11/2019 20:10, Stewart Hildebrand wrote:
> > > Allow vgic_get_hw_irq_desc to be called with a vcpu argument.
> > > 
> > > Use vcpu argument in vgic_connect_hw_irq.
> > > 
> > > vgic_connect_hw_irq is called for PPIs and SPIs, not SGIs. Enforce with
> > > ASSERTs.
> > > 
> > > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> > > 
> > > ---
> > > v3: new patch
> > > 
> > > ---
> > > Note: I have only modified the old vgic to allow delivery of PPIs.
> > 
> > The new vGIC should also be modified to support delivery of PPIs.
> > 
> > > diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> > > index 82f524a35c..c3933c2687 100644
> > > --- a/xen/arch/arm/vgic.c
> > > +++ b/xen/arch/arm/vgic.c
> > > @@ -410,10 +410,10 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r,
> > > int n)
> > >               irq_set_affinity(p->desc, cpumask_of(v_target->processor));
> > >               spin_lock_irqsave(&p->desc->lock, flags);
> > >               /*
> > > -             * The irq cannot be a PPI, we only support delivery of SPIs
> > > -             * to guests.
> > > +             * The irq cannot be a SGI, we only support delivery of SPIs
> > > +             * and PPIs to guests.
> > >                */
> > > -            ASSERT(irq >= 32);
> > > +            ASSERT(irq >= NR_SGIS);
> > 
> > We usually put ASSERT() in place we know that code wouldn't be able to work
> > correctly if there ASSERT were hit. In this particular case:
> > 
> > >               if ( irq_type_set_by_domain(d) )
> > >                   gic_set_irq_type(p->desc, vgic_get_virq_type(v, n, i));
> > 
> > 1) We don't want to allow any domain (including Dom0) to modify the
> > interrupt type (i.e. level/edge) for PPIs as this is shared. You will also
> > most likely need to modify the counterpart in setup_guest_irq().
> > 
> > >               p->desc->handler->enable(p->desc);
> > 
> > 2) On GICv3, the re-distributor of vCPU A is accessible by vCPU B. So vCPU B
> > could enable the SGI for vCPU A. But this would be called on the wrong pCPU
> > leading to inconsistency between the hardware state of the internal vGIC
> > state.

Is it actually meant to work from a GIC specification perspective? It
sounds "wrong" somehow to me, but I went through the spec and it doesn't
say explicitly that cpuB couldn't enable a SGI/PPI of cpuA. I am still
a bit shocked by this revelation.

[I haven't had a chance to think carefully about what you wrote below
yet. I'll follow-up.]



> I thought a bit more of the issue over the week-end. The current vGIC is
> fairly messy. I can see two solutions on how to solve this:
>     1) Send an IPI to the pCPU where the vCPU A is running and disable/enable
> the interrupt. The other side would need to the vCPU was actually running to
> avoid disabling the PPI for the wrong pCPU
>     2) Keep the HW interrupt always enabled
> 
> We propagated the enable/disable because of some messy part in the vGIC:
>     - vgic_inject_irq() will not queue any pending interrupt if the vCPU is
> offline. While interrupt cannot be delivered, we still need to keep them
> pending as they will never occur again otherwise. This is because they are
> active on the host side and the guest has no way to deactivate them.
>     - Our implementation of PSCI CPU will remove all pending interrupts (see
> vgic_clear_pending_irqs()). I am not entirely sure the implication here
> because of the previous.
> 
> There are a probably more. Aside the issues with it, I don't really see good
> advantage to propagate the interrupt state as the interrupts (PPIs, SPIs) have
> active state. So they can only be received once until the guest actually
> handles it.
> 
> So my preference would still be 2) because this makes the code simpler, avoid
> IPI and other potential locking trouble.
> 
> On a side note, there are more issues with enable/disable on the current vGIC
> as a pending interrupt already in the LR will not get dropped...
> 
> All of this is quite nasty. The sooner the new vGIC is finished the sooner we
> can kill the current one.
--8323329-1461152034-1574731242=:8205
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1461152034-1574731242=:8205--

