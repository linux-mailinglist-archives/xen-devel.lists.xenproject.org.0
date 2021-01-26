Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DCA3045B5
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 18:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75386.135728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4SUv-00062J-JG; Tue, 26 Jan 2021 17:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75386.135728; Tue, 26 Jan 2021 17:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4SUv-00061f-G9; Tue, 26 Jan 2021 17:51:25 +0000
Received: by outflank-mailman (input) for mailman id 75386;
 Tue, 26 Jan 2021 17:51:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7V+q=G5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l4SUu-00061H-Fq
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 17:51:24 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a991c8a-4a7f-41ef-b070-8113926b1cfc;
 Tue, 26 Jan 2021 17:51:22 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10QHpBw4017590
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 26 Jan 2021 12:51:17 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10QHpBrV017589;
 Tue, 26 Jan 2021 09:51:11 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 0a991c8a-4a7f-41ef-b070-8113926b1cfc
Date: Tue, 26 Jan 2021 09:51:11 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        Roger Pau Monn?? <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Message-ID: <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
 <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Tue, Jan 26, 2021 at 12:08:15PM +0100, Jan Beulich wrote:
> On 25.01.2021 18:46, Elliott Mitchell wrote:
> > On Mon, Jan 25, 2021 at 10:56:25AM +0100, Jan Beulich wrote:
> >> On 24.01.2021 05:47, Elliott Mitchell wrote:
> >>>
> >>> ---
> >>> Changes in v2:
> >>> - Include the obvious removal of the goto target.  Always realize you're
> >>>   at the wrong place when you press "send".
> >>
> >> Please could you also label the submission then accordingly? I
> >> got puzzled by two identically titled messages side by side,
> >> until I noticed the difference.
> > 
> > Sorry about that.  Would you have preferred a third message mentioning
> > this mistake?
> 
> No. But I'd have expected v2 to have its subject start with
> "[PATCH v2] ...", making it relatively clear that one might
> save looking at the one labeled just "[PATCH] ...".

Yes, in fact I spotted this just after.  I was in a situation of, "does
this deserve sending an additional message out?"  (ugh, yet more damage
from that issue...)


> >>> I'm not including a separate cover message since this is a single hunk.
> >>> This really needs some checking in `xl`.  If one has a domain which
> >>> sometimes gets started on different hosts and is sometimes modified with
> >>> slightly differing settings, one can run into trouble.
> >>>
> >>> In this case most of the time the particular domain is most often used
> >>> PV/PVH, but every so often is used as a template for HVM.  Starting it
> >>> HVM will trigger PoD mode.  If it is started on a machine with less
> >>> memory than others, PoD may well exhaust all memory and then trigger a
> >>> panic.
> >>>
> >>> `xl` should likely fail HVM domain creation when the maximum memory
> >>> exceeds available memory (never mind total memory).
> >>
> >> I don't think so, no - it's the purpose of PoD to allow starting
> >> a guest despite there not being enough memory available to
> >> satisfy its "max", as such guests are expected to balloon down
> >> immediately, rather than triggering an oom condition.
> > 
> > Even Qemu/OVMF is expected to handle ballooning for a *HVM* domain?
> 
> No idea how qemu comes into play here. Any preboot environment
> aware of possibly running under Xen of course is expected to
> tolerate running with maxmem > memory (or clearly document its
> inability, in which case it may not be suitable for certain
> use cases). For example, I don't see why a preboot environment
> would need to touch all of the memory in a VM, except maybe
> for the purpose of zeroing it (which PoD can deal with fine).

I'm reading that as your answer to the above question is "yes".


> >>> For example try a domain with the following settings:
> >>>
> >>> memory = 8192
> >>> maxmem = 2147483648
> >>>
> >>> If type is PV or PVH, it will likely boot successfully.  Change type to
> >>> HVM and unless your hardware budget is impressive, Xen will soon panic.
> >>
> >> Xen will panic? That would need fixing if so. Also I'd consider
> >> an excessively high maxmem (compared to memory) a configuration
> >> error. According to my experiments long, long ago I seem to
> >> recall that a factor beyond 32 is almost never going to lead to
> >> anything good, irrespective of guest type. (But as said, badness
> >> here should be restricted to the guest; Xen itself should limp
> >> on fine.)
> > 
> > I'll confess I haven't confirmed the panic is in Xen itself.  Problem is
> > when this gets triggered, by the time the situation is clear and I can
> > get to the console the computer is already restarting, thus no error
> > message has been observed.
> 
> If the panic isn't in Xen itself, why would the computer be
> restarting?

I was thinking there was a possibility it is actually Domain 0 which is
panicing.


> > This is most certainly a configuration error.  Problem is this is a very
> > small delta between a perfectly valid configuration and the one which
> > reliably triggers a panic.
> > 
> > The memory:maxmem ratio isn't the problem.  My example had a maxmem of
> > 2147483648 since that is enough to exceed the memory of sub-$100K
> > computers.  The crucial features are maxmem >= machine memory,
> > memory < free memory (thus potentially bootable PV/PVH) and type = "hvm".
> > 
> > When was the last time you tried running a Xen machine with near zero
> > free memory?  Perhaps in the past Xen kept the promise of never panicing
> > on memory exhaustion, but this feels like this hasn't held for some time.
> 
> Such bugs needs fixing. Which first of all requires properly
> pointing them out. A PoD guest misbehaving when there's not
> enough memory to fill its pages (i.e. before it manages to
> balloon down) is expected behavior. If you can't guarantee the
> guest ballooning down quickly enough, don't configure it to
> use PoD. A PoD guest causing a Xen crash, otoh, is very likely
> even a security issue. Which needs to be treated as such: It
> needs fixing, not avoiding by "curing" one of perhaps many
> possible sources.

Okay, this has been reliably reproducing for a while.  I had originally
thought it was a problem of HVM plus memory != maxmem, but the
non-immediate restart disagrees with that assessment.

> As an aside - if the PoD code had proper 1Gb page support,
> would you then propose to only allocate in 1Gb chunks? And if
> there was a 512Gb page feature in hardware, in 512Gb chunks
> (leaving aside the fact that scanning 512Gb of memory to be
> all zero would simply take too long with today's computers)?

That answer would vary over time.  Today or tommorrow, certainly not.
In a decade's time (or several) when a typical pocket computer^W^W
cellphone has 4TB of memory and a $30K server has a minimum of 128TB then
doing allocations in 1GB chunks would be worthy of consideration.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



