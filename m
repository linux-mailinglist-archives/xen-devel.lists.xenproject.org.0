Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7E3FE184
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 19:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176600.321358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLURa-0000Xf-42; Wed, 01 Sep 2021 17:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176600.321358; Wed, 01 Sep 2021 17:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLURa-0000VC-0p; Wed, 01 Sep 2021 17:54:38 +0000
Received: by outflank-mailman (input) for mailman id 176600;
 Wed, 01 Sep 2021 17:54:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mLURY-0000V6-Mt
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 17:54:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab1c3152-0b4d-11ec-ae10-12813bfff9fa;
 Wed, 01 Sep 2021 17:54:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F05D61075;
 Wed,  1 Sep 2021 17:54:34 +0000 (UTC)
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
X-Inumbo-ID: ab1c3152-0b4d-11ec-ae10-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630518875;
	bh=DUYclV0TShbbiOecFDX12GrrUJ+2Px1HUu7Ti14aY7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E/2Vg2VmQYMX33ke1fDrCFkwKZAxJiN07iIg7F/Lw3A5A97UTDBL8QL0IWyGAAaad
	 Qj0R5EgohIYcg8WgHWVmxum+RofseXOscq8E/5hbyH54C+R2AaoOwumNen4Ub0kAJ8
	 5YjZnIzHoSlg/8HWICwcCGkJwLWYXK7zA6oJyCk1+pFwLbFvEwglkX2FgiWDZWuALM
	 YPQGNCgjokyYQMI8MRw8uhV37qch7VwfBEqPavXymiSO28qEc9O/YPx04aF4JW0tLv
	 9+YTAvxhdRcSQTgEOXkAHSFv0o3pIf/z0/9pF/OF/aTgss9pq4iuYZ9G/wOa4nOzr6
	 bYD2V6CfSvYRQ==
Date: Wed, 1 Sep 2021 10:54:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <Michal.Orzel@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Introduce pmu_access parameter
In-Reply-To: <46e36ba5-8b3d-2d43-6297-b92d2654ab72@xen.org>
Message-ID: <alpine.DEB.2.21.2109011045440.17925@sstabellini-ThinkPad-T480s>
References: <20210901124308.31573-1-michal.orzel@arm.com> <599515f0-4b8a-3a71-caea-b17ec27c9123@xen.org> <44B48162-EB44-4295-9629-2D95A40D7232@arm.com> <46e36ba5-8b3d-2d43-6297-b92d2654ab72@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-93430960-1630518639=:17925"
Content-ID: <alpine.DEB.2.21.2109011050420.17925@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-93430960-1630518639=:17925
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109011050421.17925@sstabellini-ThinkPad-T480s>

On Wed, 1 Sep 2021, Julien Grall wrote:
> On 01/09/2021 14:10, Bertrand Marquis wrote:
> > > On 1 Sep 2021, at 13:55, Julien Grall <julien@xen.org> wrote:
> > > 
> > > Hi,
> > > 
> > > On 01/09/2021 13:43, Michal Orzel wrote:
> > > > Introduce new Xen command line parameter called "pmu_access".
> > > > The default value is "trap": Xen traps PMU accesses.
> > > > In case of setting pmu_access to "native", Xen does not trap
> > > > PMU accesses allowing all the guests to access PMU registers.
> > > > However, guests cannot make use of PMU overflow interrupts as
> > > > PMU uses PPI which Xen cannot route to guests.
> > > > This option is only intended for development and testing purposes.
> > > > Do not use this in production system.
> > > I am afraid your option is not safe even in development system as a vCPU
> > > may move between pCPUs.
> > > 
> > > However, even if we restricted the use to pinned vCPU *and* dedicated
> > > pCPU, I am not convinced that exposing an half backed PMU (the overflow
> > > interrupt would not work) to the guest is the right solution. This likely
> > > means the guest OS would need to be modified and therefore the usage of
> > > this option is fairly limited.
> > > 
> > > So I think the first steps are:
> > >   1) Make the PPI work. There was some attempt in the past for it on
> > > xen-devel. You could have a look.
> > >   2) Provide PMU bindings
> > > 
> > > With that in place, we can discuss how to expose the PMU even if it is
> > > unsafe in some conditions.
> > 
> > With those limitations, using the PMU to monitor the system performances or
> > on some specific use cases is still really useful.
> > We are using that to do some benchmarks of Xen or of some applications to
> > compare the behaviour to a native system or
> > analyse the performances of Xen itself (hypercalls,context switch …etc)

I also already had to write a patch almost exactly like this one to
provide to customers a few months back.


> I understand this is useful for some setup and I am not trying to say we
> should not have a way to expose the PMU (even unsafely) in upstream. However,
> I think the option as it stands is too wide (this should be a per domain knob)
> and we should properly expose the PMU (interrupts, bindings...).

I have never used PMU directly myself, only provided a patch similar to
this one.  But as far as I could tell the users were fully satisfied
with it and it had no interrupts support either. Could it be that
interrupts are not actually needed to read the perf counters, which is
probably what users care about?

In regards to "this should be a per domain knob", in reality if you are
doing PMU experiments you don't care if only one or all domains have
access: you are working in a controlled environment trying to figure out
if your setup meets the timing requirements. There are no security or
safety concerns (those are different experiments) and there is no
interference problems in the sense of multiple domains trying to access
PMU at the same time -- you control the domains you decide which one is
accessing them.

So I am in favor of a patch like this one because it actually satisfy
our requirements. Even if we had per-domain support and interrupts
support, I don't think they would end up being used.
--8323329-93430960-1630518639=:17925--

