Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F571FF618
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:03:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlw4e-0004iL-M1; Thu, 18 Jun 2020 15:03:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlw4c-0004iF-Rc
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:03:26 +0000
X-Inumbo-ID: dc3a009a-b174-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc3a009a-b174-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 15:03:26 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jS/4hb9kl5ri8lQqwPOY7uZJ+Usuv0maMMeS9Nuu7NbMxC3rSnlyRLRwUdYdwocD/VQfgDZVx/
 VtkvXLKH1CbD8DoEBJDGLcaHy8Vj22WAn76u8vYJ2Xxy4RGCNuHv80o4Dj3p2HUHydRfn/ESlm
 bOHotUYkUIn0lqzFqU6ES8+d410omnaUJOZc8sN5XcGAMfZsz93JJfYwOZnSKB2GO/UZXMl0Ek
 Z03fe4avhfDMW8j7+7oKWJqD50U8ZGytEAZsMUyk3FDinLs601Lq13VC8DTl5c3kIQGONmmgyd
 UAo=
X-SBRS: 2.7
X-MesageID: 20682596
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20682596"
Date: Thu, 18 Jun 2020 17:03:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 5/8] x86/hvm: only translate ISA interrupts to
 GSIs in virtual timers
Message-ID: <20200618150318.GV735@Air-de-Roger>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-6-roger.pau@citrix.com>
 <2b7eb220-afb8-26e6-6406-70759cac9333@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b7eb220-afb8-26e6-6406-70759cac9333@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On Thu, Jun 18, 2020 at 04:47:57PM +0200, Jan Beulich wrote:
> On 12.06.2020 17:56, Roger Pau Monne wrote:
> > Only call hvm_isa_irq_to_gsi for ISA interrupts, interrupts
> > originating from an IO APIC pin already use a GSI and don't need to be
> > translated.
> > 
> > I haven't observed any issues from this, but I think it's better to
> > use it correctly.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> However, ...
> 
> > --- a/xen/arch/x86/hvm/vpt.c
> > +++ b/xen/arch/x86/hvm/vpt.c
> > @@ -86,7 +86,7 @@ static int pt_irq_vector(struct periodic_time *pt, enum hvm_intsrc src)
> >          return pt->irq;
> >  
> >      isa_irq = pt->irq;
> > -    gsi = hvm_isa_irq_to_gsi(isa_irq);
> > +    gsi = pt->source == PTSRC_isa ? hvm_isa_irq_to_gsi(isa_irq) : pt->irq;
> 
> ... would you mind taking the opportunity and moving this ...
> 
> >      if ( src == hvm_intsrc_pic )
> >          return (v->domain->arch.hvm.vpic[isa_irq >> 3].irq_base
> 
> ... below here, perhaps even past the ASSERT() that follows?
> 
> (I have to admit that I find the two kinds of "source" indicators
> - the "src" function parameter and "pt->source" confusing. Aren't
> they supposed to match up?)

They are supposed to match when the injected interrupt is the timer
one, if there's a highest priority interrupt that gets injected
instead of the timer one they don't match.

AFAICT the function it's trying to get the vector that would match the
timer using the 'src' interrupt source. TBH I think this is way more
complex than needed, but I don't plan to deal with it right now.

Thanks, Roger.

