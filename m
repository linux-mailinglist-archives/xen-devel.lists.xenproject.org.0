Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A384F227F54
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 13:54:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxqq2-00059T-OK; Tue, 21 Jul 2020 11:53:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gK6X=BA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxqq1-00059O-7U
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 11:53:37 +0000
X-Inumbo-ID: ce1484d4-cb48-11ea-a0a1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce1484d4-cb48-11ea-a0a1-12813bfff9fa;
 Tue, 21 Jul 2020 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595332414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OOa+A3QfUb/+6qL6XytZeqbMeTi37eM1OfzxLLRcWaA=;
 b=Vwe9SNSZElLF8f0RAqIn3sQtcXZRjO1czz8wYB18YLWS3JApY3Ok9fMk
 oeJ/6maBPViXQDcAGxhD68Ka74zQFPVuSERl5zT71FjjK1VL48YHXCjc0
 jpZByi9RRhhTKwcbms78r0K/VdLjf8/XPsbORUkjC3/UkvIoFSBzbgQqb k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KO5WVOrqDpuBC6xmtpaQupVrPLCkbWZrnuQJazzZZl5TqX8oxNBo54pyKkIF2e2SrBB65Ib7/n
 2KIka1TIAnCGy5bDSVub2k/r1vhBp31cH/A61Ulzi3EcVFvEERgu6XuIxntv8dAAOn/LG6cbip
 Ry0c+Q7ffu3DB5h4OPpjJ9Uc2i4GfiPQjpuCWhx6rCuK4zKRDGFsUDYDMZxroP3bTU0rzsOgGN
 j9A8Tg7GqXxBkLX7i4j0TlK/dRPNeZGyE676+RlzlNVBuU1iXyw7oIVGShd/QnroPQqJnyqSj0
 0j0=
X-SBRS: 2.7
X-MesageID: 23160386
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23160386"
Date: Tue, 21 Jul 2020 13:53:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
Subject: Re: vPT rework (and timer mode)
Message-ID: <20200721115327.GO7191@Air-de-Roger>
References: <20200701090210.GN735@Air-de-Roger>
 <f89a158a-416e-1939-597a-075ff97f2b02@suse.com>
 <af13fa01-db36-784d-dfaf-b9905defc7fd@citrix.com>
 <007a01d65363$9ab7c1d0$d0274570$@xen.org>
 <20200706083131.GA735@Air-de-Roger>
 <007c01d65373$ad3c4140$07b4c3c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <007c01d65373$ad3c4140$07b4c3c0$@xen.org>
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 06, 2020 at 09:58:53AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monné <roger.pau@citrix.com>
> > Sent: 06 July 2020 09:32
> > To: paul@xen.org
> > Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Jan Beulich' <jbeulich@suse.com>; xen-
> > devel@lists.xenproject.org; 'Wei Liu' <wl@xen.org>
> > Subject: Re: vPT rework (and timer mode)
> > 
> > On Mon, Jul 06, 2020 at 08:03:50AM +0100, Paul Durrant wrote:
> > > > -----Original Message-----
> > > > From: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > Sent: 03 July 2020 16:03
> > > > To: Jan Beulich <jbeulich@suse.com>; Roger Pau Monné <roger.pau@citrix.com>
> > > > Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> > > > Subject: Re: vPT rework (and timer mode)
> > > >
> > > > On 03/07/2020 15:50, Jan Beulich wrote:
> > > > > On 01.07.2020 11:02, Roger Pau Monné wrote:
> > > > >> It's my understanding that the purpose of pt_update_irq and
> > > > >> pt_intr_post is to attempt to implement the "delay for missed ticks"
> > > > >> mode, where Xen will accumulate timer interrupts if they cannot be
> > > > >> injected. As shown by the patch above, this is all broken when the
> > > > >> timer is added to a vCPU (pt->vcpu) different than the actual target
> > > > >> vCPU where the interrupt gets delivered (note this can also be a list
> > > > >> of vCPUs if routed from the IO-APIC using Fixed mode).
> > > > >>
> > > > >> I'm at lost at how to fix this so that virtual timers work properly
> > > > >> and we also keep the "delay for missed ticks" mode without doing a
> > > > >> massive rework and somehow keeping track of where injected interrupts
> > > > >> originated, which seems an overly complicated solution.
> > > > >>
> > > > >> My proposal hence would be to completely remove the timer_mode, and
> > > > >> just treat virtual timer interrupts as other interrupts, ie: they will
> > > > >> be injected from the callback (pt_timer_fn) and the vCPU(s) would be
> > > > >> kicked. Whether interrupts would get lost (ie: injected when a
> > > > >> previous one is still pending) depends on the contention on the
> > > > >> system. I'm not aware of any current OS that uses timer interrupts as
> > > > >> a way to track time. I think current OSes know the differences between
> > > > >> a timer counter and an event timer, and will use them appropriately.
> > > > > Fundamentally - why not, the more that this promises to be a
> > > > > simplification. The question we need to answer up front is whether
> > > > > we're happy to possibly break old OSes (presumably ones no-one
> > > > > ought to be using anymore these days, due to their support life
> > > > > cycles long having ended).
> > > >
> > > > The various timer modes were all compatibility, and IIRC, mostly for
> > > > Windows XP and older which told time by counting the number of timer
> > > > interrupts.
> > > >
> > > > Paul - you might remember better than me?
> > >
> > > I think it is only quite recently that Windows has started favouring enlightened time sources rather
> > than counting ticks but an admin may still turn all the viridian enlightenments off so just dropping
> > ticks will probably still cause time to drift backwards.
> > 
> > Even when not using the viridian enlightenments, Windows should rely
> > on emulated time counters (or the TSC) rather than counting ticks?
> 
> Microsoft implementations... sensible... two different things.
> 
> > 
> > I guess I could give it a try with one of the emulated Windows versions
> > that we test on osstest.
> > 
> 
> Pick an old-ish version. I think osstest has copy of Windows 7.

Tried on Windows 7 (with viridian disabled) setting
timer_mode="one_missed_tick_pending" and limiting the capacity of the
domain to 1 (1% CPU utilization) in order to start missing ticks, and
the clock does indeed start lagging behind.

When not using one_missed_tick_pending mode and limiting the capacity
to 1 the clock also lags a bit (I guess with 1% CPU utilization
delayed ticks accumulate too much), but the clock doesn't seem to be
skewed that much.

Both modes will catch up at some point, I assume Windows does sync time
periodically with the wallclock, but I don't think we want to resort
to that.

I will draft a plan about how to proceed in order to fix the emulated
timers event delivery while keeping the accumulated ticks mode and
send it to the list, as I would like to fix this.

Roger.

