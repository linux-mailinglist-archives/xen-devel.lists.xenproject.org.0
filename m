Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C624433FD0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 22:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213465.371679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcvjT-0003bM-ML; Tue, 19 Oct 2021 20:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213465.371679; Tue, 19 Oct 2021 20:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcvjT-0003Yv-JC; Tue, 19 Oct 2021 20:29:11 +0000
Received: by outflank-mailman (input) for mailman id 213465;
 Tue, 19 Oct 2021 20:29:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sDB=PH=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1mcvjR-0003Yo-MA
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 20:29:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3618b936-311b-11ec-8325-12813bfff9fa;
 Tue, 19 Oct 2021 20:29:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB05A611CB;
 Tue, 19 Oct 2021 20:29:07 +0000 (UTC)
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
X-Inumbo-ID: 3618b936-311b-11ec-8325-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634675348;
	bh=R4jeDkw65lpfHKRy+jf4Qa1MZGoEnFadGzSBbx9BLyI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HW4rovQUPgerwAQsykahmmUftEQ7zv6sAe49wiQ+jS+XbBWwH2GUhzzcg+dafHNvC
	 rnkAVBONJubsdGMFY9XCoCpT+ge74YzPlRs1pnOHvyHckD1hPbq6GgQpUVBGG5omhz
	 05lSgmYcUUlO7EoAnDaHDoX1A+knXEMeiO3JwcukO5aGinkX8+MlmytCRUm1hMY64C
	 g0P7iN7ZMFBhhr435qf/iQDl6gQWM1z3DWeM89DksP7hiUPESYF69K5EHFYMM3QrT0
	 F3KRyzelJsKmAMHEiGRPsllsVJso4ksDjUqCnpNd5bhIaFT32N2MeWNZZBg8ffrsq3
	 dnIx8/mT7rIbg==
Date: Tue, 19 Oct 2021 15:29:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Josef Johansson <josef@oderland.se>
Cc: linux-pci@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] PCI/MSI: Re-add checks for skip masking MSI-X on Xen PV
Message-ID: <20211019202906.GA2397931@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <906d370d-5023-e856-4ead-f0b499aded53@oderland.se>

On Tue, Oct 19, 2021 at 10:15:05PM +0200, Josef Johansson wrote:
> On 10/19/21 21:57, Bjorn Helgaas wrote:
> > On Mon, Oct 18, 2021 at 08:22:32AM +0200, Josef Johansson wrote:

> I'll make an effort to do a better commit log. Thanks for reviewing the
> entry!
> 
> What is the time frame for v5.15?

Soon.  v5.15-rc7 should happen Oct 24, final release likely Oct 31.
Ideally a fix would be in before the 24th.

> >> This patch solves a major issue with booting 5.15-rc1 under Xen
> >> with amdgpu drivers. Specifically Lenovo P14s Gen 1, AMD 4750U.
> >>
> >> The softlock below takes about ~2-3 minutes to release, and will
> >> lock again if I switch between X and console, when staying in
> >> X I can do things without it softlock.
> >
> > I don't actually see a softlock mentioned below; am I missing
> > something?  It's nice to include a couple lines of dmesg log to help
> > people connect the issue with the fix, but most of the below is not
> > relevant and can be easily found from the Link: tag.  Also, some of
> > the lines seem to be wrapped.  They're more useful when not wrapped
> > because grep can find them.
> 
> Sorry for my lack of words here. I used deadlock when I first
> described it, but since it was released after a while, I thought
> softlock would be more fitting.

I looked up the WARN_ON at amdgpu_dm.c:8630 but I didn't see anything
related to deadlock or soft lockup or any kind of delay:

  WARN_ON(acrtc_attach->pflip_status != AMDGPU_FLIP_NONE);

DRM folks might have an idea.

> I'll dig a bit to try to get a better dmesg around the stacktrace. Sorry
> about the wrapping,
> 
> I'm trying hard to keep those 80 chars ;-)

I appreciate that.  Commit logs should be 75 chars because git log
indents by 4.  Quotes of dmesg and the like should be unwrapped.

> >> I should also note that my original problem with *flip done timeout*
> >> inside drm during suspend/resume is not solved, but with this patch
> >> at least the kernel boots properly.
> >>
> >> The kernel is much more stable not running inside Xen, and much 
> >> more stable running pci=nomsi (under Xen). Are we missing something
> >> more regarding masking?
> > It does sound like something else is broken as well, but I have no
> > idea what that would be.
> 
> Should I take a stab at describing the issue better at hand or
> should we focus on getting this specific patch out of the way?

Unless the other issues seem related, we should dispose of this one
by itself ASAP.

> I have 'solved' my current problems a bit by kernel flags right now,
> but I would be happy to share my story so far.

Description of your workaround would be quite useful.  Probably not to
*me*, but to people who know the area (I'd start with the DRM folks).

> >> The error that occurs is:
> >>
> >> kernel: ------------[ cut here ]------------
> >> kernel: WARNING: CPU: 6 PID: 3754 at
> >> drivers/gpu/drm/amd/amdgpu/../display/amdgp
> >> u_dm/amdgpu_dm.c:8630 amdgpu_dm_commit_planes+0x9b4/0x9c0 [amdgpu]

