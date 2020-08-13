Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A04243E6F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 19:42:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6HER-0007As-0O; Thu, 13 Aug 2020 17:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k6HEP-0007An-Ht
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 17:41:37 +0000
X-Inumbo-ID: 45b44d5f-1794-4d8b-8efd-1817a0c6219b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45b44d5f-1794-4d8b-8efd-1817a0c6219b;
 Thu, 13 Aug 2020 17:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597340496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RSOsLqh1pvAPYsxTCOzqCLkapNjF820DHCnXnxDjPvI=;
 b=UAEv9M5AJ5EYl4jAlW5JYKTfJFqOg3lr3utRaMcgbEQcFIbuYmgsYSYI
 SzoJESdK8M6+alSAhuzgH/f0CDOGFrh9XEtw6lEdZduaNFRYBoyIrrLyZ
 ZApEhTARf9BeF53oZ+2jGq+n5XyAeydFpW1eimCuuhkBfwr5ntOMz27Um g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qT4wgI80rgE0zIx9oCVjN5CAKF8Q8sUH+SCNzi541ynSFZ3hop7dSDOm/qH7HxyvTbxTNa9Cd2
 Ps2kDatZuHPRgg01sXCa1a1g1d0yRhWb4ioO3F6H7HZxS1yuK6drQ2FayTkr7yrZ/DSLOnXv4p
 P3ccxVhF2/f0tbK6CRTUywZLRrZHlHYuyw+fZ083+JLCQKJNGtk42CzsjhjqwajGP8U7EeHtVp
 +h24AmkhvjsYSTs1H33f5/IQgiAf9zyq8ittTOHfuwtKLK3DmqFYsKkqZVtvizTujrLBZjNySt
 EnY=
X-SBRS: 2.7
X-MesageID: 25404541
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,309,1592884800"; d="scan'208";a="25404541"
Date: Thu, 13 Aug 2020 19:41:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH 2/5] x86/vlapic: introduce an EOI callback mechanism
Message-ID: <20200813174126.GI975@Air-de-Roger>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-3-roger.pau@citrix.com>
 <67d9c57d-1173-cab4-e51e-762ac325f3d9@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67d9c57d-1173-cab4-e51e-762ac325f3d9@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 13, 2020 at 03:33:37PM +0100, Andrew Cooper wrote:
> On 12/08/2020 13:47, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index 7b5c633033..7369be468b 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -159,8 +160,26 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
> >      else
> >          vlapic_clear_vector(vec, &vlapic->regs->data[APIC_TMR]);
> >  
> > +    if ( callback )
> > +    {
> > +        unsigned long flags;
> > +
> > +        spin_lock_irqsave(&vlapic->callback_lock, flags);
> > +        vlapic->callbacks[vec].callback = callback;
> > +        vlapic->callbacks[vec].data = data;
> > +        spin_unlock_irqrestore(&vlapic->callback_lock, flags);
> > +    }
> > +    else
> > +        /*
> > +         * Removing the callback can be done with a single atomic operation
> > +         * without requiring the lock, as the callback data doesn't need to be
> > +         * cleared.
> > +         */
> > +        write_atomic(&vlapic->callbacks[vec].callback, NULL);
> > +
> >      if ( hvm_funcs.update_eoi_exit_bitmap )
> > -        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec, trig);
> > +        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
> > +                          trig || callback);
> 
> I can't reason about this being correct.

Note the 'trig' part should have been dropped in patch 5, as then
the vIO-APIC will properly register the EOI callback for level
triggered interrupts.

Note that if we ever implement EOI suppression the vIO-APIC callback
would then have to check whether the bit is currently set in order to
decide whether to perform the EOI on the vIO-APIC or not.

This just requests a vmexit whenever the caller of vlapic_set_irq
requires an EOI callback, so that it can be executed when using the
virtual interrupt delivery feature that would normally avoid such
vmexit.

> When you say EOI, what property do you want, exactly, because there are
> a couple of options.

Here (in the update_eoi_exit_bitmap context) I want a vmexit whenever
an EIO callback for the injected vector needs to be executed, that's
requested by the caller of vlapic_set_irq. We have to keep the 'trig'
part because vIO-APIC is not switched to use the new callback
infrastructure in this patch.

> All interrupts, edge or level, require acking at the local APIC, to mark
> the interrupt as no longer in service.  For edge interrupts and hardware
> APIC acceleration, this will be completed without a VMExit.

It would be completed without a vmexit as long as the corresponding
vector bit in the EOI exit bitmap is not set when using virtual
interrupt delivery.

I think this is currently wrong, as we require a vmexit to happen for
non-maskable edge MSI interrupts, and the corresponding EOI exit
bitmap bit doesn't seem to be set?

Maybe there's something I'm missing.

> Level interrupts from the IO-APIC further require EOI'ing there. 
> Whether this requires an explicit action or not depends on the LAPIC
> "EOI Broadcast" setting.  I'm not sure if we virtualise and/or support
> this setting.

No, our current vlapic implementation doesn't support EOI broadcast
suppression AFAICT, as bit 24 in VLAPIC_VERSION is 0. So the EOI of a
level interrupts is always broadcasted to the IO-APIC(s).

> 
> What exactly are we going to want to do from these callbacks
> (eventually, not just in this series alone)?

So this series just moves the current hooks in vlapic_handle_EOI to
become dynamically set by the users that inject the vectors.

We also need EOI callbacks for edge triggered interrupts, as
non-maskable edge MSIs from passed-through devices currently require
an EOI on the physical lapic when the guest also performs such EOI,
see hvm_dpci_msi_eoi.

> If it can't be made to work for level interrupts only, I'm afraid I
> don't think this plan is viable.

I think it can be made to work, the code here will keep the callback
for level triggered interrupts, so that the EOI is forwarded to the
vIO-APIC, but I don't see why this would be limited to level
interrupts only, we could need the same for edge interrupts, as it
seems like the SynIC viridian extensions could also make use of this
if we ever implement them fully.

> (Some trivial comments to follow, but this is the meaty question.)
> 
> >  
> >      if ( hvm_funcs.deliver_posted_intr )
> >          alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
> > @@ -168,6 +187,11 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
> >          vcpu_kick(target);
> >  }
> >  
> > +void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
> > +{
> > +    vlapic_set_irq_callback(vlapic, vec, trig, NULL, NULL);
> 
> Static inline in the header file?

Sure.

> > @@ -1636,9 +1671,23 @@ int vlapic_init(struct vcpu *v)
> >      }
> >      clear_page(vlapic->regs);
> >  
> > +    if ( !vlapic->callbacks )
> > +    {
> > +        vlapic->callbacks = xmalloc_array(typeof(*(vlapic->callbacks)),
> > +                                          X86_NR_VECTORS);
> 
> This is a large data structure.  At a minimum, you can subtract 16 from
> it, because vectors 0 thru 0xf can't legally be targetted by interrupts.
> 
> Sadly, I don't think it can be reduced beyond that, because a guest
> could arrange for every other vector to become pending in level mode,
> even if the overwhelming common option for VMs these days would be to
> have no level interrupts at all.

I'm still not sure I understand why you mention level triggered
interrupts specifically here, the lapic EOI is performed for both
level and edge trigger interrupts in order to clear the bit in ISR,
and hence we could have an EOI callback regardless of the triggering
mode?

It's just a matter of the caller requesting an EOI callback, and then
it will be executed when the guest performs the EOI, regardless of
whether the interrupt is level or edge triggered.

Thanks, Roger.

