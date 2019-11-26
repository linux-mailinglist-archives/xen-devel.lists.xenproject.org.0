Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B5310A6AD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 23:39:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZjRb-000575-9d; Tue, 26 Nov 2019 22:36:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nsV+=ZS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iZjRa-000570-2j
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 22:36:26 +0000
X-Inumbo-ID: 2d7f5230-109d-11ea-83b8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d7f5230-109d-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 22:36:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29F8B206CC;
 Tue, 26 Nov 2019 22:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574807784;
 bh=CHtU3lwP3Qdyxmb/MdDxSY/Z2WRWibqFFrVhk2Ca2r4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=peIRJ5zlNc3lAfWHpGskBUdjuUAlp8CyM5325Wl7uv0MY4Ox2mNjw/x8StefqLMUM
 A5IeI6GuPkTRcrFwjjSmBTVlz2XjSe9ZncYXxIhJKTnBVJ460JkRUaixnyEY6cUamq
 UQP3ifwMZAlHSOYHL8H2VXe4Vnt0X2agAVSSNfug=
Date: Tue, 26 Nov 2019 14:36:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <faf54fd5-0a42-2683-5ddf-0137b2b65046@xen.org>
Message-ID: <alpine.DEB.2.21.1911261424540.8205@sstabellini-ThinkPad-T480s>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
 <b0bac87a-3a11-bbb1-6c13-a23087590d87@xen.org>
 <faf54fd5-0a42-2683-5ddf-0137b2b65046@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-542924599-1574807784=:8205"
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

--8323329-542924599-1574807784=:8205
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 25 Nov 2019, Julien Grall wrote:
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
> 
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

Yes, I think that is a good suggestion. I take that you mean that in
vgic_disable_irqs for PPIs we would only clear GIC_IRQ_GUEST_ENABLED
then return basically, right?
--8323329-542924599-1574807784=:8205
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-542924599-1574807784=:8205--

