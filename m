Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478B8A936D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 08:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707961.1106427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLWP-0004ym-Ab; Thu, 18 Apr 2024 06:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707961.1106427; Thu, 18 Apr 2024 06:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLWP-0004wx-84; Thu, 18 Apr 2024 06:45:25 +0000
Received: by outflank-mailman (input) for mailman id 707961;
 Thu, 18 Apr 2024 06:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RbQw=LX=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rxLWO-0004wq-0c
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 06:45:24 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38ad239f-fd4f-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 08:45:20 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.17.1) with ESMTPS id 43I6j7Yl098355
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 18 Apr 2024 02:45:13 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 43I6j7XK098354;
 Wed, 17 Apr 2024 23:45:07 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 38ad239f-fd4f-11ee-94a3-07e782e9044d
Date: Wed, 17 Apr 2024 23:45:07 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
References: <ZcqoVBnsgUJw8G0l@mattapan.m5p.com>
 <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
 <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
 <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
 <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
 <ZgHwEGCsCLHiYU5J@mattapan.m5p.com>
 <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Wed, Apr 17, 2024 at 02:40:09PM +0200, Jan Beulich wrote:
> On 11.04.2024 04:41, Elliott Mitchell wrote:
> > On Thu, Mar 28, 2024 at 07:25:02AM +0100, Jan Beulich wrote:
> >> On 27.03.2024 18:27, Elliott Mitchell wrote:
> >>> On Mon, Mar 25, 2024 at 02:43:44PM -0700, Elliott Mitchell wrote:
> >>>> On Mon, Mar 25, 2024 at 08:55:56AM +0100, Jan Beulich wrote:
> >>>>>
> >>>>> In fact when running into trouble, the usual course of action would be to
> >>>>> increase verbosity in both hypervisor and kernel, just to make sure no
> >>>>> potentially relevant message is missed.
> >>>>
> >>>> More/better information might have been obtained if I'd been engaged
> >>>> earlier.
> >>>
> >>> This is still true, things are in full mitigation mode and I'll be
> >>> quite unhappy to go back with experiments at this point.
> >>
> >> Well, it very likely won't work without further experimenting by someone
> >> able to observe the bad behavior. Recall we're on xen-devel here; it is
> >> kind of expected that without clear (and practical) repro instructions
> >> experimenting as well as info collection will remain with the reporter.
> > 
> > After looking at the situation and considering the issues, I /may/ be
> > able to setup for doing more testing.  I guess I should confirm, which of
> > those criteria do you think currently provided information fails at?
> > 
> > AMD-IOMMU + Linux MD RAID1 + dual Samsung SATA (or various NVMe) +
> > dbench; seems a pretty specific setup.
> 
> Indeed. If that's the only way to observe the issue, it suggests to me
> that it'll need to be mainly you to do further testing, and perhaps even
> debugging. Which isn't to say we're not available to help, but from all
> I have gathered so far we're pretty much in the dark even as to which
> component(s) may be to blame. As can still be seen at the top in reply
> context, some suggestions were given as to obtaining possible further
> information (or confirming the absence thereof).

There may be other ways which haven't yet been found.

I've been left with the suspicion AMD was to some degree sponsoring
work to ensure Xen works on their hardware.  Given the severity of this
problem I would kind of expect them not want to gain a reputation for
having data loss issues.  Assuming a suitable pair of devices weren't
already on-hand, I would kind of expect this to be well within their
budget.

> I'd also like to come back to the vague theory you did voice, in that
> you're suspecting flushes to take too long. I continue to have trouble
> with this, and I would therefore like to ask that you put this down in
> more technical terms, making connections to actual actions taken by
> software / hardware.

I'm trying to figure out a pattern.

Nominally all the devices are roughly on par (only a very cheap flash
device will be unable to overwhelm SATA's bandwidth).  Yet why did the
Crucial SATA device /seem/ not to have the issue?  Why did a Crucial NVMe
device demonstrate the issue.

My guess is the flash controllers Samsung uses may be able to start
executing commands faster than the ones Crucial uses.  Meanwhile NVMe
is lower overhead and latency than SATA (SATA's overhead isn't an issue
for actual disks).  Perhaps the IOMMU is still flushing its TLB, or
hasn't loaded the new tables.

I suspect when the MD-RAID1 issues block requests to a pair of devices,
it likely sends the block to one device and then reuses most/all of the
structures for the second device.  As a result the second request would
likely get a command to the device rather faster than the first request.

Perhaps look into what structures the MD-RAID1 subsystem reuses are.
Then see whether doing early setup of those structures triggers the
issue?

(okay I'm deep into speculation here, but this seems the simplest
explanation for what could be occuring)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



