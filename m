Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3652C0496
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 12:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34035.64877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khA5a-0003Iz-AD; Mon, 23 Nov 2020 11:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34035.64877; Mon, 23 Nov 2020 11:32:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khA5a-0003IW-6t; Mon, 23 Nov 2020 11:32:58 +0000
Received: by outflank-mailman (input) for mailman id 34035;
 Mon, 23 Nov 2020 11:32:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzqB=E5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1khA5Y-0003IR-TS
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:32:56 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c83555a2-1431-4a71-9a52-25b4ed801777;
 Mon, 23 Nov 2020 11:32:53 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ANBWkIf006181
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 12:32:47 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id BA9822E9CAC; Mon, 23 Nov 2020 12:32:41 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MzqB=E5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1khA5Y-0003IR-TS
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:32:56 +0000
X-Inumbo-ID: c83555a2-1431-4a71-9a52-25b4ed801777
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c83555a2-1431-4a71-9a52-25b4ed801777;
	Mon, 23 Nov 2020 11:32:53 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ANBWkIf006181
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2020 12:32:47 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id BA9822E9CAC; Mon, 23 Nov 2020 12:32:41 +0100 (MET)
Date: Mon, 23 Nov 2020 12:32:41 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201123113241.GE2520@antioche.eu.org>
References: <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 23 Nov 2020 12:32:48 +0100 (MET)

On Mon, Nov 23, 2020 at 10:57:13AM +0100, Roger Pau Monné wrote:
> > [...]
> > OK.
> > I finally found where the EOI occurs (it's within a macro so s simple grep
> > didn't show it).
> > 
> > When interrupts are not masked (e.g. via cli), the ioapic halder is called.
> > From here, 2 paths can happen:
> > a) the software interrupt priority level (called spl in BSD world) allows the
> >   driver's handler to run. In this case it's called, then the interrupt
> >   is unmasked at ioapic level, and EOI'd at lapic.
> > b) the software interrupt priority level doesn't allow this driver's handler to
> >   run. In this case, the interrupt is marked as pending in software,
> >   explicitely masked at the iopic level and EOI'd at lapic.
> >   Later, when the spl is lowered, the driver's interrupt handler is run,
> >   then the interrupt is unmasked at ioapic level, and EOI'd at lapic
> >   (this is the same path as a)). here we may EOI the lapic twice, and the
> >   second time when there's no hardware interrupt pending any more.
> > 
> > I suspect it's case b) which causes the problem with Xen.
> 
> Case b) should be handled fine AFAICT. If there's no interrupt pending
> in the lapic ISR the EOI is just a noop. Iff there's somehow another
> vector pending in ISR you might actually be EOIing the wrong vector,
> and thus this would be a bug in NetBSD. I certainly don't know much of
> NetBSD interrupt model in order to know whether this second EOI is just
> not necessary or whether it could cause issues.
> 
> Can you actually assert that disabling this second unneeded EOI does
> solve the problem?

I tried this, and it didn't change anything ...

I'm out of idea to try.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

