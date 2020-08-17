Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29B24669F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 14:47:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7eWv-0005tD-64; Mon, 17 Aug 2020 12:46:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7eWt-0005t5-Qm
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 12:46:23 +0000
X-Inumbo-ID: 5f7ec033-aaff-4d88-9e59-01bb7ec096f1
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f7ec033-aaff-4d88-9e59-01bb7ec096f1;
 Mon, 17 Aug 2020 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597668382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AzTFhHFv2EuiwuRMnW/m5J9y5qkW4NSbEIruG8BFOCU=;
 b=dLQoRATbADWkKyBhDOoOhycsgKVohE1rin6aWpPvWLnm9VFHqzfnXCMc
 1YGf41+Sl6grz/vRqRc9U2a8MD+wHJ3zriklAJ30n/321UNOaRjZepNm8
 XebG0m+GiptNqvfriNKk+FscbFl0VH8buulF201ZTTp++gz44KBNO63f8 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 11PNgTf6vtF8ST9lPh26DUhOeHx4xQkeZbLHsTzBNLabJZ8WFkdLqVxbKUqxGRcPPlwbkGL9I2
 9N+sopyhcyE4uSjB7qsTLTM6PwJ+0aeTf12lXvn8TkIBfodTdE7NJe0LxCfQapLB9BlfOaKuz+
 Yv4PYBwUekCrARgBlpaLXO/0vOOnH57ks9fLFhIEPx2mgnrEKuqcBsS/HDCQ/J63g5Cswlh9wd
 MD9z073898Wdyi8x1xE+Khlgo11824HfQifFiKccGYiXRSfbWYYsj1LFistPt1bQVl8lR4bUZa
 tnc=
X-SBRS: 2.7
X-MesageID: 24829390
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="24829390"
Date: Mon, 17 Aug 2020 14:46:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
Message-ID: <20200817124600.GC828@Air-de-Roger>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
 <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
 <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 14, 2020 at 08:25:28PM +0100, Julien Grall wrote:
> Hi Andrew,
> 
> Sorry for the late answer.
> 
> On 23/07/2020 14:59, Andrew Cooper wrote:
> > On 23/07/2020 14:22, Julien Grall wrote:
> > > Hi Jan,
> > > 
> > > On 23/07/2020 12:23, Jan Beulich wrote:
> > > > On 22.07.2020 18:53, Julien Grall wrote:
> > > > > --- a/xen/arch/x86/irq.c
> > > > > +++ b/xen/arch/x86/irq.c
> > > > > @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
> > > > >          for ( ; ; )
> > > > >        {
> > > > > -        int irq = pirq->arch.irq;
> > > > > +        int irq = read_atomic(&pirq->arch.irq);
> > > > 
> > > > There we go - I'd be fine this way, but I'm pretty sure Andrew
> > > > would want this to be ACCESS_ONCE(). So I guess now is the time
> > > > to settle which one to prefer in new code (or which criteria
> > > > there are to prefer one over the other).
> > > 
> > > I would prefer if we have a single way to force the compiler to do a
> > > single access (read/write).
> > 
> > Unlikely to happen, I'd expect.
> > 
> > But I would really like to get rid of (or at least rename)
> > read_atomic()/write_atomic() specifically because they've got nothing to
> > do with atomic_t's and the set of functionality who's namespace they share.
> 
> Would you be happy if I rename both to READ_ONCE() and WRITE_ONCE()? I would
> also suggest to move them implementation in a new header asm/lib.h.

Maybe {READ/WRITE}_SINGLE (to note those should be implemented using a
single instruction)?

ACCESS_ONCE (which also has the _ONCE suffix) IIRC could be
implemented using several instructions, and hence doesn't seem right
that they all have the _ONCE suffix.

Roger.

