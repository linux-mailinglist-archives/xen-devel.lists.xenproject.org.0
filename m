Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4182482B0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:14:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7yca-00044F-Ql; Tue, 18 Aug 2020 10:13:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SD0B=B4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7ycZ-000447-0F
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:13:35 +0000
X-Inumbo-ID: 9077fe8d-a95f-43ce-a411-d2d49ec0a2ba
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9077fe8d-a95f-43ce-a411-d2d49ec0a2ba;
 Tue, 18 Aug 2020 10:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597745613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TekmC2H7WYrAdCi69L8xPJdOf+bla6N7QVNfnXduFmo=;
 b=Y/Ns5OiKgJwPcdtLDUH7QVpXjgcvpf+vx2rXY+7ltsw5a9arA5B/0wbW
 KXxcAQKnZzh2Xrclw9avf8haRmoeznEZcEbVTtztO3zrbz7g2RwnVCXTV
 nlUtB136kmSn2K3S9fbEMqYNbh2LqfA2ERUEIRF49vYXn6yS78VhKP6Rr A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: oNF9japKYAWwyWMNzYoWd/VxfpYi8fIIKDhhMWJbOMxMVdm/Adl18MxFVrGCujYMIXKBDXy6C7
 W5sNt7KHtL3mZXVzzPzjIaR2tH5f4EpLZ9/FInfuOgS/xt/DvyeV/rnZfhG8+BItv5i2sYw2vi
 xIm6W0YcVnLHbtx63/uNKv+oQjywKfYLHnXVnxImmiOKZKVKUKa1Ev/w5YfftYegPeYnEFrtIU
 ch8e/h3dQHkJMWAkgeRRiO0qPj8QxMgUcEdrUiYmlU56S7DXrRQvhjSSE1xpvNZ61t0t48owQf
 cqc=
X-SBRS: 2.7
X-MesageID: 25068609
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25068609"
Date: Tue, 18 Aug 2020 12:13:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
Message-ID: <20200818101326.GJ828@Air-de-Roger>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
 <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
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

On Thu, Jul 23, 2020 at 02:59:57PM +0100, Andrew Cooper wrote:
> On 23/07/2020 14:22, Julien Grall wrote:
> > Hi Jan,
> >
> > On 23/07/2020 12:23, Jan Beulich wrote:
> >> On 22.07.2020 18:53, Julien Grall wrote:
> >>> --- a/xen/arch/x86/irq.c
> >>> +++ b/xen/arch/x86/irq.c
> >>> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
> >>>         for ( ; ; )
> >>>       {
> >>> -        int irq = pirq->arch.irq;
> >>> +        int irq = read_atomic(&pirq->arch.irq);
> >>
> >> There we go - I'd be fine this way, but I'm pretty sure Andrew
> >> would want this to be ACCESS_ONCE(). So I guess now is the time
> >> to settle which one to prefer in new code (or which criteria
> >> there are to prefer one over the other).
> >
> > I would prefer if we have a single way to force the compiler to do a
> > single access (read/write).
> 
> Unlikely to happen, I'd expect.
> 
> But I would really like to get rid of (or at least rename)
> read_atomic()/write_atomic() specifically because they've got nothing to
> do with atomic_t's and the set of functionality who's namespace they share.

I've been thinking about this a bit, and maybe the problem is the
other way around. Having an 'atomic' type doesn't make much sense IMO,
because atomicity is not (solely) based on the type but rather on how
the accesses are performed.

Maybe it would make more sense to rename atomic_t to counter_t: a
counter that guarantees atomic accesses. Then the atomic namespace
could be used to implement the low level helpers that actually
guarantee atomicity and support a wider set of types than what
atomic_t currently is (ie: an int).

Roger.

