Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AABA246EA1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 19:34:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7j0t-00004r-6B; Mon, 17 Aug 2020 17:33:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7j0s-0008WS-6O
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 17:33:38 +0000
X-Inumbo-ID: 3e93b05b-c0e8-4b76-96d2-547db28b9726
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e93b05b-c0e8-4b76-96d2-547db28b9726;
 Mon, 17 Aug 2020 17:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597685617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MroUSwr4GxnXCMtRUtJUOxctCdKCm4YVn68rQbmcpYw=;
 b=RdKoRzwZ4wIlTE6uIxbbpETxd138qvcAGYe5Ze3CFXUghEXoL5QUlmEu
 62ROND5LvgD+6FdjFNVkgvW8yO8oBCTFV5mlACZezKXnhNDxvbUoptqlS
 yHLpFG74J0xEZMRX1JRZxHbSEV7KNlmumsyNLvrmAgvcdHr/4lG6yDADl E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3xe+aNtRKJbipkUBQYsj+FliA4K7c9C8YPV0G9GIAZx7FqusEI2S1Q2YAE97L1tBHbjerxFXRf
 TvR2b9v+6MWRl/mZ82wzTHXqRLuhIE5BrMnPocD8+mjio4w1+otjOspue3EUrHeS9fOq4bCE25
 kVajvZLfx1t5RjjOcPlE+DzrUFWYQlLLXgJzK3McZHx1b8CY6F4VsNLaU5VMySIQHz8bmbGWQn
 7a93FURwPA+zCsYkImjJreoeVD7y2mDxjoiyIC8x53bPqZHxdvSyoFCdYv53BOVfeoSMIbT2Km
 1uU=
X-SBRS: 2.7
X-MesageID: 24718685
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24718685"
Date: Mon, 17 Aug 2020 19:33:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
Message-ID: <20200817173328.GG828@Air-de-Roger>
References: <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
 <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
 <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
 <20200817124600.GC828@Air-de-Roger>
 <9375f5f2-7cbd-1344-ae03-51909dfd41e9@xen.org>
 <20200817140125.GD828@Air-de-Roger>
 <53eeaa9f-3a4f-525e-a07f-d36ef245925a@xen.org>
 <20200817150307.GF828@Air-de-Roger>
 <5e20ad2f-3d16-6cae-0aa3-ca028c176d99@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e20ad2f-3d16-6cae-0aa3-ca028c176d99@xen.org>
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

On Mon, Aug 17, 2020 at 04:53:51PM +0100, Julien Grall wrote:
> 
> 
> On 17/08/2020 16:03, Roger Pau Monné wrote:
> > On Mon, Aug 17, 2020 at 03:39:52PM +0100, Julien Grall wrote:
> > > 
> > > 
> > > On 17/08/2020 15:01, Roger Pau Monné wrote:
> > > > On Mon, Aug 17, 2020 at 02:14:01PM +0100, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 17/08/2020 13:46, Roger Pau Monné wrote:
> > > > > > On Fri, Aug 14, 2020 at 08:25:28PM +0100, Julien Grall wrote:
> > > > > > > Hi Andrew,
> > > > > > > 
> > > > > > > Sorry for the late answer.
> > > > > > > 
> > > > > > > On 23/07/2020 14:59, Andrew Cooper wrote:
> > > > > > > > On 23/07/2020 14:22, Julien Grall wrote:
> > > > > > > > > Hi Jan,
> > > > > > > > > 
> > > > > > > > > On 23/07/2020 12:23, Jan Beulich wrote:
> > > > > > > > > > On 22.07.2020 18:53, Julien Grall wrote:
> > > > > > > > > > > --- a/xen/arch/x86/irq.c
> > > > > > > > > > > +++ b/xen/arch/x86/irq.c
> > > > > > > > > > > @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
> > > > > > > > > > >             for ( ; ; )
> > > > > > > > > > >           {
> > > > > > > > > > > -        int irq = pirq->arch.irq;
> > > > > > > > > > > +        int irq = read_atomic(&pirq->arch.irq);
> > > > > > > > > > 
> > > > > > > > > > There we go - I'd be fine this way, but I'm pretty sure Andrew
> > > > > > > > > > would want this to be ACCESS_ONCE(). So I guess now is the time
> > > > > > > > > > to settle which one to prefer in new code (or which criteria
> > > > > > > > > > there are to prefer one over the other).
> > > > > > > > > 
> > > > > > > > > I would prefer if we have a single way to force the compiler to do a
> > > > > > > > > single access (read/write).
> > > > > > > > 
> > > > > > > > Unlikely to happen, I'd expect.
> > > > > > > > 
> > > > > > > > But I would really like to get rid of (or at least rename)
> > > > > > > > read_atomic()/write_atomic() specifically because they've got nothing to
> > > > > > > > do with atomic_t's and the set of functionality who's namespace they share.
> > > > > > > 
> > > > > > > Would you be happy if I rename both to READ_ONCE() and WRITE_ONCE()? I would
> > > > > > > also suggest to move them implementation in a new header asm/lib.h.
> > > > > > 
> > > > > > Maybe {READ/WRITE}_SINGLE (to note those should be implemented using a
> > > > > > single instruction)?
> > > > > 
> > > > > The asm volatile statement contains only one instruction, but this doesn't
> > > > > mean the helper will generate a single instruction.
> > > > 
> > > > Well, the access should be done using a single instruction, which is
> > > > what we care about when using this helpers.
> > > > 
> > > > > You may have other instructions to get the registers ready for the access.
> > > > > 
> > > > > > 
> > > > > > ACCESS_ONCE (which also has the _ONCE suffix) IIRC could be
> > > > > > implemented using several instructions, and hence doesn't seem right
> > > > > > that they all have the _ONCE suffix.
> > > > > 
> > > > > The goal here is the same, we want to access the variable *only* once.
> > > > 
> > > > Right, but this is not guaranteed by the current implementation of
> > > > ACCESS_ONCE AFAICT, as the compiler *might* split the access into two
> > > > (or more) instructions, and hence won't be an atomic access anymore?
> > >  From my understanding, at least on GCC/Clang, ACCESS_ONCE() should be atomic
> > > if you are using aligned address and the size smaller than a register size.
> > 
> > Yes, any sane compiler shouldn't split such access, but this is not
> > guaranteed by the current code in ACCESS_ONCE.
> To be sure, your concern here is not about GCC/Clang but other compilers. Am
> I correct?

Or about the existing ones switching behavior, which is again quite
unlikely I would like to assume.

> We already have a collection of compiler specific macros in compiler.h. So
> how about we classify this macro as a compiler specific one? (See more
> below).
> 
> > 
> > > > 
> > > > > May I ask why we would want to expose the difference to the user?
> > > > 
> > > > I'm not saying we should, but naming them using the _ONCE suffix seems
> > > > misleading IMO, as they have different guarantees than what
> > > > ACCESS_ONCE currently provides.
> > > 
> > > Lets leave aside how ACCESS_ONCE() is implemented for a moment.
> > > 
> > > If ACCESS_ONCE() doesn't guarantee atomicy, then it means you may read a mix
> > > of the old and new value. This would most likely break quite a few of the
> > > users because the result wouldn't be coherent.
> > > 
> > > Do you have place in mind where the non-atomicity would be useful?
> > 
> > Not that I'm aware, I think they could all be safely switched to use
> > the atomic variants
> There is concern that read_atomic(), write_atomic() prevent the compiler to
> do certain optimization. Andrew gave the example of:
> 
> ACCESS_ONCE(...) |= ...

I'm not sure how will that behave when used with a compile known
value that's smaller than the size of the destination. Could the
compiler optimize this as a partial read/write if only the lower byte
is modified for example?

> 
> > 
> > In fact I wouldn't be surprised if users of ACCESS_ONCE break if the
> > access was split into multiple instructions.
> > 
> > My comment was to notice that just renaming the atomic read/write
> > helpers to use the _ONCE prefix is IMO weird as they offer different
> > properties than ACCESS_ONCE, and hence might confuse users.Just
> > looking at READ_ONCE users could assume all _ONCE helpers would
> > guarantee atomicity, which is not the case.
> 
> Our implementation of ACCESS_ONCE() is very similar to what Linux used to
> have. There READ_ONCE()/WRITE_ONCE() are also using the same principles.
> 
> From my understanding, you can safely assume the access will be atomic if
> the following conditions are met:
> 	- The address is correctly size
> 	- The size is smaller than the word machine size

I guess we could go that route, and properly document what each helper
is supposed to do, and that {READ/WRITE}_ONCE guarantee atomicity
while ACCESS_ONCE requires special condition for us to guarantee the
operation will be atomic.

> I would agree this may not be correct on all the existing compilers. But
> this macro could easily be re-implemented if we add support for a compiler
> with different guarantee.
> 
> Therefore, I fail to see why we can't use the same guarantee in Xen.

I'm fine if what's expected from each helper is documented, it just
seems IMO more confusing that using more differentiated naming for the
helpers, because the fact that ACCESS_ONCE is atomic is a compiler
defined behavior, but not something that could be guaranteed from the
code itself.

Thanks, Roger.

