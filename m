Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4EA5B5A8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 02:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906960.1314282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1troDX-00038A-7L; Tue, 11 Mar 2025 01:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906960.1314282; Tue, 11 Mar 2025 01:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1troDX-00036i-3j; Tue, 11 Mar 2025 01:15:35 +0000
Received: by outflank-mailman (input) for mailman id 906960;
 Tue, 11 Mar 2025 01:15:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzKm=V6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1troDW-00035b-0h
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 01:15:34 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51f53a8b-fe16-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 02:15:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 59F32A465AD;
 Tue, 11 Mar 2025 01:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35294C4CEE5;
 Tue, 11 Mar 2025 01:15:27 +0000 (UTC)
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
X-Inumbo-ID: 51f53a8b-fe16-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741655728;
	bh=YiC5Gp5Fhy6SozVaKJyfwuJxI96bLeq6lfJmrJG0yqU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a+aM4L8RkTDHuYmDoIfr+R3fmhM50+JqfpkkqH9wkP6FkgqTOhLjR2SQPHYipzPm/
	 ZDIeLhy5qfhJz2e5JYHpDPfnDvbWTFU/7AAdlAyAr5Fu2YfT5qyhWaoFR6Q8Blp9W3
	 l8BOdk+n1PEH4Gwn6i3d5GmxvxPHiAB+VM8SoCSbgCWjTeSQ/YTT4hGSgDoRxEkdcM
	 YOaSvLDff+OFD8ob9GYgSkkrqSqgcGe/cVuRp/twJgLTTsumQZ+C5HGbhSgMaq9Ynn
	 FDGiqlZS2ojpvCqHByRUaBgazhgPGmtKKpyEpmxF9IQOhoebiTQ27kimTb3WTwjQFK
	 oGo61zK6CwsaA==
Date: Mon, 10 Mar 2025 18:15:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
In-Reply-To: <6c5d389e-72b7-4a64-af05-574655a6dcec@xen.org>
Message-ID: <alpine.DEB.2.22.394.2503101723410.3090675@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-5-jason.andryuk@amd.com> <4ee02463-c413-4afc-add6-d7bf3915dd5a@xen.org> <734d9fdf-a201-4a46-9739-26a474683b10@amd.com> <39540c8b-e43d-4315-bc34-a61ac6cb1d70@xen.org>
 <alpine.DEB.2.22.394.2503071651090.3032631@ubuntu-linux-20-04-desktop> <6c5d389e-72b7-4a64-af05-574655a6dcec@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1481278237-1741653283=:3090675"
Content-ID: <alpine.DEB.2.22.394.2503101734490.3090675@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1481278237-1741653283=:3090675
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2503101734491.3090675@ubuntu-linux-20-04-desktop>

On Sat, 8 Mar 2025, Julien Grall wrote:
> On 08/03/2025 00:53, Stefano Stabellini wrote:
> > On Fri, 7 Mar 2025, Julien Grall wrote:
> > > > init-dom0less only initializes non- introduced domains, so hwdom doesn't
> > > > get
> > > > its "domid" xenstore node populated.  That leads to other errors.
> > > > > So I think with Denis's patch, this isn't strictly needed.  It does
> > > > > help
> > > > existing toolstack code work today.
> > > 
> > > I don't think the toolstack is ready for a split between control/hardware
> > > domain. That said, shouldn't the toolstack run in the control domain? Same
> > > for
> > > xenstored (unless you have a xenstored domain)?
> > 
> > Yes, the toolstack (if present) would be in the control domain.
> > xenstored doesn't have to be in the control domain and in fact it might
> > not be advisable to place it there today.
> > 
> > The main difference between the toolstack and xenstored is that the
> > toolstack only talks to Xen, while xenstored talks to all other VMs,
> > which is dangerous in many configurations.
> 
> It is not really clear which toolstack you are referring to.

You make a good point, I'll be clearer and distinguish between the
implementation and the interfaces. This exercise helped me clarify my
own thoughts as well.


> Someone using vanilla Xen upstream will end up to use "xl"  which has to talk
> to xenstored and also indirectly to each domain (e.g. shutdown/suspend node in
> xenstored). So for this setup, "xenstored" is not optional and I would argue
> should be part of the control domain (or in a xenstore stubdomain which IIRC
> is not supported on Arm today).

The control domain is the guest with the highest level of privilege and
the only virtual machine that can use hypercalls to affect other VMs. A
simple example is that the control domain could issue a hypercall to
reboot other VMs.

The hardware domain does not have privilege (d->is_priv=false).

In the configuration for safety, we use dom0less for domain creation, so
there is no toolstack is the traditional sense of the word. But we could
have a Zephyr guest issuing a SHUTDOWN_poweroff hypercall for instance.
Certainly, we cannot run Linux and xl/libxl in the control domain.

Due to its high level of privilege and the fact that it can affect
others, if present, the control domain must be safety certified. The
current toolstack implementation is based on Linux. While the larger
Open Source community is working on Linux for safety, it is still a
challenge. xenstored itself would need to be safety certified as well to
run there, think of MISRA C, and also requirements, tests, etc. In
addition, xenstored communicates directly with other VMs over shared
memory, which means it would need to be developed with extreme care to
prevent interference through shared memory. Even if a safety certified
version of Linux were available in the future, the current toolstack
implementation might not be suitable for use in that environment. As of
today, safety deployments would not be able to run xl/libxl and/or
xenstored in the control domain. However, they could run a safety
certified RTOS, maybe Zephyr, issuing individual hypercalls, such as
SHUTDOWN_reboot.

If we had a safety certified free-from-interference implementation of
xenstored as a Zephyr application, with Zephyr safety-certified, then I
would run it in the control domain.

On the other hand, the hardware domain might not be safety certified. So
we could run xl/libxl and xenstored in the hardware domain. Of course
most operations will be refused, e.g. SHUTDOWN_poweroff returns error
because d->is_priv=false, but at least the user could run today's
implementation of xenstored successfully. (domain creation is done using
dom0less anyway so xl is optional.)

Conceptually, it could make sense to think of xenstored being part of
the control domain, not today's xenstored but a safe re-implementation
of xenstored based on Zephyr.

If you look at what we have today available and what people could deploy
with the current codebase this year or next year, it makes sense to
place xenstored in the hardware domain, or not at all.
--8323329-1481278237-1741653283=:3090675--

