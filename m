Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77852BA793
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 11:39:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31932.62738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg3oL-00047j-Nu; Fri, 20 Nov 2020 10:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31932.62738; Fri, 20 Nov 2020 10:38:37 +0000
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
	id 1kg3oL-00047K-Ki; Fri, 20 Nov 2020 10:38:37 +0000
Received: by outflank-mailman (input) for mailman id 31932;
 Fri, 20 Nov 2020 10:38:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GrQD=E2=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kg3oJ-00047F-Km
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:38:35 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50fb38a9-ed13-4321-8704-81cc7e4ca877;
 Fri, 20 Nov 2020 10:38:34 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AKAcTDi005801
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 11:38:30 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 264D72E9CA8; Fri, 20 Nov 2020 11:38:24 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GrQD=E2=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kg3oJ-00047F-Km
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:38:35 +0000
X-Inumbo-ID: 50fb38a9-ed13-4321-8704-81cc7e4ca877
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 50fb38a9-ed13-4321-8704-81cc7e4ca877;
	Fri, 20 Nov 2020 10:38:34 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AKAcTDi005801
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2020 11:38:30 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 264D72E9CA8; Fri, 20 Nov 2020 11:38:24 +0100 (MET)
Date: Fri, 20 Nov 2020 11:38:24 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201120103824.GJ1508@antioche.eu.org>
References: <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 20 Nov 2020 11:38:30 +0100 (MET)

On Fri, Nov 20, 2020 at 11:00:05AM +0100, Jan Beulich wrote:
> On 20.11.2020 10:27, Manuel Bouyer wrote:
> > On Fri, Nov 20, 2020 at 09:59:57AM +0100, Jan Beulich wrote:
> >> Well, anything coming through the LAPIC needs ack-ing (except for
> >> the spurious interrupt of course), or else ISR won't get updated
> >> and further interrupts at this or lower priority can't be serviced
> >> (delivered) anymore. This includes interrupts originally coming
> >> through the IO-APIC. But the same constraint / requirement exists
> >> on baremetal.
> > 
> > OK, so even if I didn't see where this happens, it's happening.
> > Is it what's Xen is using as ACK from the dom0 for a IOAPIC
> > interrupt, or is it something else (at the IOAPIC level) ?
> 
> It's the traditional LAPIC based EOI mechanism that Xen intercepts
> (as necessary) on the guest side and then translates (via
> surprisingly many layers of calls) into the necessary EOI /
> unmask / whatever at the hardware level. Our vIO-APIC
> implementation so far doesn't support IO-APIC based EOI at all
> (which is reflected in the IO-APIC version ID being 0x11).

OK.
I finally found where the EOI occurs (it's within a macro so s simple grep
didn't show it).

When interrupts are not masked (e.g. via cli), the ioapic halder is called.
From here, 2 paths can happen:
a) the software interrupt priority level (called spl in BSD world) allows the
  driver's handler to run. In this case it's called, then the interrupt
  is unmasked at ioapic level, and EOI'd at lapic.
b) the software interrupt priority level doesn't allow this driver's handler to
  run. In this case, the interrupt is marked as pending in software,
  explicitely masked at the iopic level and EOI'd at lapic.
  Later, when the spl is lowered, the driver's interrupt handler is run,
  then the interrupt is unmasked at ioapic level, and EOI'd at lapic
  (this is the same path as a)). here we may EOI the lapic twice, and the
  second time when there's no hardware interrupt pending any more.

I suspect it's case b) which causes the problem with Xen.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

