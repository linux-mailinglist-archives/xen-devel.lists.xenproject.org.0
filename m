Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4853814E7
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 03:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127648.239926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhiwc-0007dZ-RD; Sat, 15 May 2021 01:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127648.239926; Sat, 15 May 2021 01:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhiwc-0007aq-OB; Sat, 15 May 2021 01:18:18 +0000
Received: by outflank-mailman (input) for mailman id 127648;
 Sat, 15 May 2021 01:18:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/QD=KK=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lhiwb-0007ak-Bu
 for xen-devel@lists.xenproject.org; Sat, 15 May 2021 01:18:17 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a59e7c4-5712-4516-b7cf-7e7ef6253405;
 Sat, 15 May 2021 01:18:16 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 14F1I4w8079097
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 14 May 2021 21:18:10 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 14F1I4dM079096;
 Fri, 14 May 2021 18:18:04 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 4a59e7c4-5712-4516-b7cf-7e7ef6253405
Date: Fri, 14 May 2021 18:18:04 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monn?? <royger@freebsd.org>,
        Mitchell Horne <mhorne@freebsd.org>
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
Message-ID: <YJ8hTE/JbJygtVAL@mattapan.m5p.com>
References: <YIptpndhk6MOJFod@Air-de-Roger>
 <YItwHirnih6iUtRS@mattapan.m5p.com>
 <YIu80FNQHKS3+jVN@Air-de-Roger>
 <YJDcDjjgCsQUdsZ7@mattapan.m5p.com>
 <YJURGaqAVBSYnMRf@Air-de-Roger>
 <YJYem5CW/97k/e5A@mattapan.m5p.com>
 <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
 <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
 <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, May 14, 2021 at 09:32:10AM +0100, Julien Grall wrote:
> On 14/05/2021 03:42, Elliott Mitchell wrote:
> > 
> > Issue is what is the intended use of the memory range allocated to
> > /hypervisor in the device-tree on ARM?  What do the Xen developers plan
> > for?  What is expected?
> 
>  From docs/misc/arm/device-tree/guest.txt:
> 
> "
> - reg: specifies the base physical address and size of a region in
>    memory where the grant table should be mapped to, using an
>    HYPERVISOR_memory_op hypercall. The memory region is large enough to map
>    the whole grant table (it is larger or equal to 
> gnttab_max_grant_frames()).
>    This property is unnecessary when booting Dom0 using ACPI.
> "
> 
> Effectively, this is a known space in memory that is unallocated. Not 
> all the guests will use it if they have a better way to find unallocated 
> space.

The use of "should" is generally considered strong encouragement to do
so.  A warning $something is lurking here and you may regret it if you
recklessly disobey this without knowning what is going on behind the
scenes.

Whereas your language here suggests "can" is a better word since it is
simply a random unused address range.


> > Was the /hypervisor range intended *strictly* for mapping grant-tables?
> 
> It was introduced to tell the OS a place where the grant-table could be 
> conveniently mapped.

Yet this is strange.  If any $random unused address range is acceptable,
why bother suggesting a particular one?  If this is really purely the
OS's choice, why is Xen bothering to suggest a range at all?


> > Was it intended for /hypervisor to grow over the
> > years as hardware got cheaper?
> I don't understand this question.

Going to the trouble of suggesting a range points to something going on.
I'm looking for an explanation since strange choices might hint at
something unpleasant lurking below and I should watch where I step.


> > Might it be better to deprecate the /hypervisor range and have domains
> > allocate any available address space for foreign mappings?
> 
> It may be easy for FreeBSD to find available address space but so far 
> this has not been the case in Linux (I haven't checked the latest 
> version though).
> 
> To be clear, an OS is free to not use the range provided in /hypervisor 
> (maybe this is not clear enough in the spec?). This was mostly 
> introduced to overcome some issues we saw in Linux when Xen on Arm was 
> introduced.

Mind if I paraphrase this?

"this is a bring-up hack for Linux which hangs around since we haven't
felt any pressure to fix the underlying Linux issue"

Is that reasonable?


> > Should the FreeBSD implementation be treating grant tables as distinct
> > from other foreign mappings?
> 
> Both require unallocated addres space to work. IIRC FreeBSD is able to 
> find unallocated space easily, so I would recommend to use it.

That is supposed to be, but it appears there is presently a bug which has
broken the functionality on ARM.  As such, as a proper lazy developer if
I can abuse the /hypervisor address range for all foreign mappings, I
will.

My feeling is one of two things should happen with the /hypervisor
address range:

1>  OSes could be encouraged to use it for all foreign mappings.  The
range should be dynamic in some fashion.  There could be a handy way to
allow configuring the amount of address space thus reserved.

2>  The range should be declared deprecated.  Everyone should be put on
the same page that this was a quick hack for bringing up Xen/ARM/Linux,
and really it shouldn't have escaped.


> > (is treating them the same likely to
> > induce buggy behavior on x86?)
> 
> I will leave this answer to Roger.

This was directed towards *you*.  There is this thing here which looks
kind of odd in a vaguely unpleasant way.  I'm trying to figure out
whether I should embrace it, versus running away.



On Fri, May 14, 2021 at 12:07:53PM +0200, Roger Pau Monn?? wrote:
> On Fri, May 14, 2021 at 09:32:10AM +0100, Julien Grall wrote:
> > On 14/05/2021 03:42, Elliott Mitchell wrote:
> > > Was it intended for the /hypervisor range to dynamically scale with the
> > > size of the domain?
> > As per above, this doesn't depend on the size of the domain. Instead, this
> > depends on what sort of the backend will be present in the domain.
> 
> It should instead scale based on the total memory on the system, ie:
> if your hardware has 4GB of RAM the unpopulated range should at least
> be: 4GB - memory of the current domain, so that it could map any
> possible page assigned to a different domain (and even then I'm not
> sure we shouldn't account for duplicated mappings).

This would be approach #1 from above.  Going fully in this direction
seems reasonable if the entire Xen/ARM team is up for this approach.
Otherwise approach #2 also seems reasonable.  Problem is the current
situation seems an unreasonable hybrid.

> > > Should the FreeBSD implementation be treating grant tables as distinct
> > > from other foreign mappings?
> > 
> > Both require unallocated addres space to work. IIRC FreeBSD is able to find
> > unallocated space easily, so I would recommend to use it.
> 
> I agree. I think the main issue here is that there seems to be some
> bug (or behavior not understood properly) with the resource manager
> on Arm that returns an error when requesting a region anywhere in the
> memory address space, ie: [0, ~0].

I'm pretty sure there IS a bug, somewhere.  Question is whether it is in
the ARM nexus code, versus the xenpv code.  Thing is, as a lazy developer
I would love to avoid the task of fully diagnosing the bug by using an
alternative approach.

Alas, the alternative approach may not be viable longer term at which
point I want to force everyone to endure the hardship of getting this
fully fixed.   :-)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



