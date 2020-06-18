Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98901FF9FA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 19:15:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jly7L-0001n8-Sa; Thu, 18 Jun 2020 17:14:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jly7J-0001n3-Ry
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 17:14:21 +0000
X-Inumbo-ID: 25fd2b64-b187-11ea-baca-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25fd2b64-b187-11ea-baca-12813bfff9fa;
 Thu, 18 Jun 2020 17:14:21 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JASF7GRpPBs5Fl0DMNvb7Ros0btKZ8MgjHCh1B7bYGZ0Y0cCo3zQtboY7NEB0wun3teXdb9Tzg
 WX7KWP9hT/MUJpXFsP9fETYJsJcWdegI72h3Vi6YqJesuGbPsE95G4FHSBdIIAV2kQbXz8997W
 TN2O7dt0bco3irdsWmzY5IFn0dLi2/mE6s/xbhmX36k1mFBA2PGKQDaEFkQpa1BKTCUuuBrpZx
 V1pY5oJG0uE0OJ2Ui24LWqhDr8Ntysvyb+wV0bSfowVMvpSzWac1a1pq0FhelShzlQG1/3Ko4N
 xfU=
X-SBRS: 2.7
X-MesageID: 20396566
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20396566"
Date: Thu, 18 Jun 2020 19:14:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 6/8] x86/vpt: fix injection to remote vCPU
Message-ID: <20200618171413.GX735@Air-de-Roger>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-7-roger.pau@citrix.com>
 <57b6f9fd-4cbc-abc9-09e3-6493eba6c377@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57b6f9fd-4cbc-abc9-09e3-6493eba6c377@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 05:12:17PM +0200, Jan Beulich wrote:
> On 12.06.2020 17:56, Roger Pau Monne wrote:
> > vpt timers are usually added to the per-vCPU list of the vCPU where
> > they get setup, but depending on the timer source type that vCPU might
> > be different than the one where the interrupt vector gets injected.
> > 
> > For example the PIT timer use a PIC or IO-APIC pin in order to select
> > the destination vCPU and vector, which might not match the vCPU they
> > are configured from.
> > 
> > If such a situation happens pt_intr_post won't be called, and thus the
> > vpt will be left in a limbo where the next interrupt won't be
> > scheduled. Fix this by generalizing the special handling done to
> > IO-APIC level interrupts to be applied always when the destination
> > vCPU of the injected vector is different from the vCPU where the vpt
> > belongs to (ie: usually the one it's been configured from).
> > 
> > A further improvement as noted in a comment added to the code might be
> > to move the vpt so it's handled by the same vCPU where the vector gets
> > injected.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/vpt.c | 80 +++++++++++++++++++++---------------------
> >  1 file changed, 40 insertions(+), 40 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
> > index 6a975fc668..52ad5b90a7 100644
> > --- a/xen/arch/x86/hvm/vpt.c
> > +++ b/xen/arch/x86/hvm/vpt.c
> > @@ -358,59 +358,59 @@ int pt_update_irq(struct vcpu *v)
> >           * interrupt delivery case. Otherwise return -1 to do nothing.
> >           */
> >          vlapic_set_irq(vcpu_vlapic(v), irq, 0);
> > -        pt_vector = irq;
> > -        break;
> > +        return irq;
> >  
> >      case PTSRC_isa:
> >          hvm_isa_irq_deassert(v->domain, irq);
> >          if ( platform_legacy_irq(irq) && vlapic_accept_pic_intr(v) &&
> >               v->domain->arch.hvm.vpic[irq >> 3].int_output )
> > -            hvm_isa_irq_assert(v->domain, irq, NULL);
> > +            pt_vector = hvm_isa_irq_assert(v->domain, irq, NULL);
> >          else
> > -        {
> >              pt_vector = hvm_isa_irq_assert(v->domain, irq, vioapic_get_vector);
> > -            /*
> > -             * hvm_isa_irq_assert may not set the corresponding bit in vIRR
> > -             * when mask field of IOAPIC RTE is set. Check it again.
> > -             */
> 
> For one, the transformation done here looks to call for folding
> both calls to hvm_isa_irq_assert() into one. I'm not, however,
> convinced recording the function's return value is useful in the
> case where it wasn't recorded before. The change is benign right
> now because hvm_isa_irq_assert() will return -1 when its last
> argument is NULL, but the question is whether the code here should
> start depending on such behavior.

I see, I shouldn't have adjusted this first call to store pt_vector,
and just leave pt_vector as initialized (-1) to not rely on
hvm_isa_irq_assert returning -1.

Coalescing both calls would make the code harder to read IMO, as then
the condition of the if clause would need to be moved inside the call
to hvm_isa_irq_assert in order to decide whether to pass NULL or
vioapic_get_vector.

> And then, according to this comment (which doesn't get retained in
> any form or shape) ...
> 
> > -            if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
> > -                pt_vector = -1;
> > -        }
> > +
> > +        if ( pt_vector < 0 )
> > +            return pt_vector;
> > +
> >          break;
> >  
> >      case PTSRC_ioapic:
> >          pt_vector = hvm_ioapic_assert(v->domain, irq, level);
> > -        if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
> > -        {
> > -            pt_vector = -1;
> > -            if ( level )
> > +        if ( pt_vector < 0 )
> > +            return pt_vector;
> > +
> > +        break;
> > +    }
> > +
> > +    ASSERT(pt_vector >= 0);
> > +    if ( !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
> > +    {
> > +        time_cb *cb = NULL;
> > +        void *cb_priv;
> > +
> > +        /*
> > +         * Vector has been injected to a different vCPU, call pt_irq_fired and
> > +         * execute the callback, since the destination vCPU(s) won't call
> > +         * pt_intr_post for it.
> 
> ... this isn't the only reason to come here. Beyond what the comment
> says there is the hvm_domain_use_pirq() check in assert_gsi() which
> would similarly result in the IRR bit not observed set here. At the
> very least these cases want mentioning; I have to admit that I'm not
> entirely clear yet whether your handling is correct for both, or
> whether the information needs to be propagated into here.

I always forget about that weird pirq stuff (and I'm refraining from
using other adjectives) that we have for HVM.

AFAICT vpt is already broken when trying to inject interrupts
generated from it over an event channel. hvm_ioapic_assert will return
whatever garbage is in the IO-APIC entry, which will likely not be
initialized because the GSI is routed over an event channel.

I really have no idea what hvm_ioapic_assert should return in that
case, the event channel callback vector maybe?

Maybe just returning -1 would be fine, a guest using this routing of
pirqs over event channels shouldn't be using any of the emulated
timers, and hence vpt is not required to be functional in that case?

> Also instead of ASSERT(pt_vector >= 0) would you pull the respective
> if() out of the switch(), to also cover the case of a fall through
> without hitting any of the explicitly handled cases, resulting in
> pt_vector left at its initial value of -1?

Sure.

> 
> > +         * TODO: move this vpt to one of the vCPUs where the vector gets
> > +         * injected.
> > +         */
> > +        spin_lock(&v->arch.hvm.tm_lock);
> > +        /* Make sure the timer is still on the list. */
> > +        list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
> > +            if ( pt == earliest_pt )
> >              {
> > -                /*
> > -                 * Level interrupts are always asserted because the pin assert
> > -                 * count is incremented regardless of whether the pin is masked
> > -                 * or the vector latched in IRR, so also execute the callback
> > -                 * associated with the timer.
> > -                 */
> > -                time_cb *cb = NULL;
> > -                void *cb_priv;
> > -
> > -                spin_lock(&v->arch.hvm.tm_lock);
> > -                /* Make sure the timer is still on the list. */
> > -                list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
> > -                    if ( pt == earliest_pt )
> > -                    {
> > -                        pt_irq_fired(v, pt);
> > -                        cb = pt->cb;
> > -                        cb_priv = pt->priv;
> > -                        break;
> > -                    }
> > -                spin_unlock(&v->arch.hvm.tm_lock);
> > -
> > -                if ( cb != NULL )
> > -                    cb(v, cb_priv);
> > +                pt_irq_fired(v, pt);
> > +                cb = pt->cb;
> > +                cb_priv = pt->priv;
> > +                break;
> >              }
> > -        }
> > -        break;
> > +        spin_unlock(&v->arch.hvm.tm_lock);
> > +
> > +        if ( cb != NULL )
> > +            cb(v, cb_priv);
> > +
> > +        pt_vector = -1;
> >      }
> >  
> >      return pt_vector;
> 
> To further reduce indentation (and seeing the significant code
> churn that happens here anyway), could you consider inverting the
> surrounding if() to
> 
>     if ( vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
>         return pt_vector;    
> 
> ?

Yup, that's indeed better.

Thanks, Roger.

