Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE782467E6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 16:02:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7fho-0004ld-IC; Mon, 17 Aug 2020 14:01:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7fhn-0004lY-97
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 14:01:43 +0000
X-Inumbo-ID: 157f2ed5-82d7-4b4b-a635-f5c82e7b99ad
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 157f2ed5-82d7-4b4b-a635-f5c82e7b99ad;
 Mon, 17 Aug 2020 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597672902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XDg2oOjZDppw8FyQOsBCKkuT3DQlRNeNCp2GXkmpjj4=;
 b=h9dSWXDQk81zUpZOOLhDnt8axJPBsJHHhAtdqyBPM7DXhGwNFQ84An/V
 alvq1UuczpJI+rNCpYE6t2JzBk1NitJTGuHBFOAgRcJmiJeyo8oBcGbX6
 cDjXQE3cEuhWDBzishgVFp9CExFuBwNxvO9gaDYNNeUYXeHNvy4WCVr8X M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YoRFoY2kBoxOgOVzzP8PqVTxoDfVzovJkpPlTmuWO5Y/gOEmFaGaOwaXljiG8odkvIgrwIDVX1
 w/GPagxTXhFV+NOiSpz1S7dVb1CZJU6ITQU852MKiNUND8z1t4w56onesPwxO0gS81SrNbLTEF
 xcXBOL84xiuPnwRApUJINuVWonzsxiEQG/zGOpoxVkugQHyecIYpXSH/iAWTyZhvYaQfYUEXM+
 FsHKDjJufNkgoCfrINmqAPgdXrSFnCpIAytxTVvU9ErDEiP4pv4PDYo9nGJzvk1Ah/P5Hwpj5S
 JAY=
X-SBRS: 2.7
X-MesageID: 24660044
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="24660044"
Date: Mon, 17 Aug 2020 16:01:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
Message-ID: <20200817140125.GD828@Air-de-Roger>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
 <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
 <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
 <20200817124600.GC828@Air-de-Roger>
 <9375f5f2-7cbd-1344-ae03-51909dfd41e9@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9375f5f2-7cbd-1344-ae03-51909dfd41e9@xen.org>
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

On Mon, Aug 17, 2020 at 02:14:01PM +0100, Julien Grall wrote:
> Hi,
> 
> On 17/08/2020 13:46, Roger Pau Monné wrote:
> > On Fri, Aug 14, 2020 at 08:25:28PM +0100, Julien Grall wrote:
> > > Hi Andrew,
> > > 
> > > Sorry for the late answer.
> > > 
> > > On 23/07/2020 14:59, Andrew Cooper wrote:
> > > > On 23/07/2020 14:22, Julien Grall wrote:
> > > > > Hi Jan,
> > > > > 
> > > > > On 23/07/2020 12:23, Jan Beulich wrote:
> > > > > > On 22.07.2020 18:53, Julien Grall wrote:
> > > > > > > --- a/xen/arch/x86/irq.c
> > > > > > > +++ b/xen/arch/x86/irq.c
> > > > > > > @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
> > > > > > >           for ( ; ; )
> > > > > > >         {
> > > > > > > -        int irq = pirq->arch.irq;
> > > > > > > +        int irq = read_atomic(&pirq->arch.irq);
> > > > > > 
> > > > > > There we go - I'd be fine this way, but I'm pretty sure Andrew
> > > > > > would want this to be ACCESS_ONCE(). So I guess now is the time
> > > > > > to settle which one to prefer in new code (or which criteria
> > > > > > there are to prefer one over the other).
> > > > > 
> > > > > I would prefer if we have a single way to force the compiler to do a
> > > > > single access (read/write).
> > > > 
> > > > Unlikely to happen, I'd expect.
> > > > 
> > > > But I would really like to get rid of (or at least rename)
> > > > read_atomic()/write_atomic() specifically because they've got nothing to
> > > > do with atomic_t's and the set of functionality who's namespace they share.
> > > 
> > > Would you be happy if I rename both to READ_ONCE() and WRITE_ONCE()? I would
> > > also suggest to move them implementation in a new header asm/lib.h.
> > 
> > Maybe {READ/WRITE}_SINGLE (to note those should be implemented using a
> > single instruction)?
> 
> The asm volatile statement contains only one instruction, but this doesn't
> mean the helper will generate a single instruction.

Well, the access should be done using a single instruction, which is
what we care about when using this helpers.

> You may have other instructions to get the registers ready for the access.
> 
> > 
> > ACCESS_ONCE (which also has the _ONCE suffix) IIRC could be
> > implemented using several instructions, and hence doesn't seem right
> > that they all have the _ONCE suffix.
> 
> The goal here is the same, we want to access the variable *only* once.

Right, but this is not guaranteed by the current implementation of
ACCESS_ONCE AFAICT, as the compiler *might* split the access into two
(or more) instructions, and hence won't be an atomic access anymore?

> May I ask why we would want to expose the difference to the user?

I'm not saying we should, but naming them using the _ONCE suffix seems
misleading IMO, as they have different guarantees than what
ACCESS_ONCE currently provides.

Thanks, Roger.

