Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B70215409
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 10:32:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsMXS-0002Ul-Pk; Mon, 06 Jul 2020 08:31:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jsMXQ-0002Ug-KX
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 08:31:44 +0000
X-Inumbo-ID: 1e4bdc3c-bf63-11ea-8c4b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e4bdc3c-bf63-11ea-8c4b-12813bfff9fa;
 Mon, 06 Jul 2020 08:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594024302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RyOGXfsJgDCHslM1KfVrkFxJMaQ9jioyueXpLCZk3NI=;
 b=CXXGeMPXbhLrCGkEEiYRAIye2HOoLYkH18IIdemCPdnfUy5NMLOYG0Gt
 yzTakVPJ7exWcjF5vPx2FpdNEooO0fUOvOC5eYjuCZXzDDJ2l4Ueik8ai
 jt+bmtTRWw5nEPY4ncwFprKNxixbfitZ1c9r5jKX+lvu1LLqa1a7eqjjh I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OGUUwOFAqzNS2aNQ4MGbr2wJBRm2ppRppaRvlBp7GnskfuqM5gPs44V8sXyReeq1dbSIWdzvhK
 XsF/IxJBH21XiuIQpTh348Z187pCKUlZOvRTNI0KrcL9RujbvtmvoYtNT9ISOGtiU2nqQNIPrh
 UTKnvXmNVThvwoZCGOjFgbZ2SpSmQ2hFLjImlYbqmPC53CWVDKGPNflvrSUHLpZdeEh8mMXs2/
 frOoB65hAFWqB5o6E7mZzXpQhQIwZQrb4ORNoKoulzTGSkjSR2o9ePGWAe1N8Lz3kLEdg/uDz0
 OXM=
X-SBRS: 2.7
X-MesageID: 21975158
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,318,1589256000"; d="scan'208";a="21975158"
Date: Mon, 6 Jul 2020 10:31:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
Subject: Re: vPT rework (and timer mode)
Message-ID: <20200706083131.GA735@Air-de-Roger>
References: <20200701090210.GN735@Air-de-Roger>
 <f89a158a-416e-1939-597a-075ff97f2b02@suse.com>
 <af13fa01-db36-784d-dfaf-b9905defc7fd@citrix.com>
 <007a01d65363$9ab7c1d0$d0274570$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <007a01d65363$9ab7c1d0$d0274570$@xen.org>
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 06, 2020 at 08:03:50AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Andrew Cooper <andrew.cooper3@citrix.com>
> > Sent: 03 July 2020 16:03
> > To: Jan Beulich <jbeulich@suse.com>; Roger Pau Monné <roger.pau@citrix.com>
> > Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> > Subject: Re: vPT rework (and timer mode)
> > 
> > On 03/07/2020 15:50, Jan Beulich wrote:
> > > On 01.07.2020 11:02, Roger Pau Monné wrote:
> > >> It's my understanding that the purpose of pt_update_irq and
> > >> pt_intr_post is to attempt to implement the "delay for missed ticks"
> > >> mode, where Xen will accumulate timer interrupts if they cannot be
> > >> injected. As shown by the patch above, this is all broken when the
> > >> timer is added to a vCPU (pt->vcpu) different than the actual target
> > >> vCPU where the interrupt gets delivered (note this can also be a list
> > >> of vCPUs if routed from the IO-APIC using Fixed mode).
> > >>
> > >> I'm at lost at how to fix this so that virtual timers work properly
> > >> and we also keep the "delay for missed ticks" mode without doing a
> > >> massive rework and somehow keeping track of where injected interrupts
> > >> originated, which seems an overly complicated solution.
> > >>
> > >> My proposal hence would be to completely remove the timer_mode, and
> > >> just treat virtual timer interrupts as other interrupts, ie: they will
> > >> be injected from the callback (pt_timer_fn) and the vCPU(s) would be
> > >> kicked. Whether interrupts would get lost (ie: injected when a
> > >> previous one is still pending) depends on the contention on the
> > >> system. I'm not aware of any current OS that uses timer interrupts as
> > >> a way to track time. I think current OSes know the differences between
> > >> a timer counter and an event timer, and will use them appropriately.
> > > Fundamentally - why not, the more that this promises to be a
> > > simplification. The question we need to answer up front is whether
> > > we're happy to possibly break old OSes (presumably ones no-one
> > > ought to be using anymore these days, due to their support life
> > > cycles long having ended).
> > 
> > The various timer modes were all compatibility, and IIRC, mostly for
> > Windows XP and older which told time by counting the number of timer
> > interrupts.
> > 
> > Paul - you might remember better than me?
> 
> I think it is only quite recently that Windows has started favouring enlightened time sources rather than counting ticks but an admin may still turn all the viridian enlightenments off so just dropping ticks will probably still cause time to drift backwards.

Even when not using the viridian enlightenments, Windows should rely
on emulated time counters (or the TSC) rather than counting ticks?

I guess I could give it a try with one of the emulated Windows versions
that we test on osstest.

Thanks, Roger.

