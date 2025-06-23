Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71CAE579A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 00:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022847.1398707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTq1A-00032Y-Ju; Mon, 23 Jun 2025 22:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022847.1398707; Mon, 23 Jun 2025 22:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTq1A-00030f-G6; Mon, 23 Jun 2025 22:52:00 +0000
Received: by outflank-mailman (input) for mailman id 1022847;
 Mon, 23 Jun 2025 22:51:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTq18-00030Y-Qn
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 22:51:58 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a90a20cf-5084-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 00:51:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 24BE761F1C;
 Mon, 23 Jun 2025 22:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0984C4CEEA;
 Mon, 23 Jun 2025 22:51:51 +0000 (UTC)
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
X-Inumbo-ID: a90a20cf-5084-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750719113;
	bh=bTKWkkJclPge7Z+oSdCWTmWZgtgDgQBko/k7ot9OALo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cVg4q0jWmZMfnwt/RrI4bKF6cVVGat1RVctp/Uzjz5lFtrIPrK3RIRXQtUS97q1v4
	 udlx/Xyhr9MbXVAUjmYQS6+au0r4q0qjH8FuDAIUEvIyHtuBmZWwLLKo1pUefVtD9J
	 1XEFoOC4upheGsXiKJlmTJYcFIf9uPqD9KoIfabqWNFdwx0DCKlyMCAJ+2Hjmqw9m2
	 q7KQ9+8NO+Ofbwj1gD1XSXhUYYQsrAhHTRbV+p3eW1G7n/91UgWhw3FwxFSJWVKZ8F
	 8Hf81pZNVyWDqCKkzMdfPYHwdTsKXWkwwwBLJ10HkcqwupVLQnXSTVHA/ExnrqtfR8
	 WIMXgJRukJTGw==
Date: Mon, 23 Jun 2025 15:51:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com
cc: Stefano Stabellini <sstabellini@kernel.org>, jason.andryuk@amd.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, ayankuma@amd.com, 
    xen-devel@lists.xenproject.org, demiobenour@gmail.com
Subject: Re: hardware domain and control domain separation
In-Reply-To: <bc36d2c0-3b25-4735-92c7-6a37c47978aa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2506231448430.862517@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2506181757282.1780597@ubuntu-linux-20-04-desktop> <942a6178-0fe7-468e-8e45-ea255fd20680@suse.com> <bc36d2c0-3b25-4735-92c7-6a37c47978aa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I am replying out of order hopefully to make things easier to follow.

On Mon, 23 Jun 2025, Demi Marie Obenour wrote:
> On 6/23/25 11:44, Jan Beulich wrote:
> > On 21.06.2025 02:41, Stefano Stabellini wrote:
> >> Regarding hardware domain and control domain separation, Ayan sent to
> >> xen-devel an architecture specification (a design document) that I wrote
> >> previously about the topic. This is written as safety document so it is
> >> using a language and structure specific for that. However, it contains
> >> much of the explanation needed on the topic:
> >>
> >> https://lore.kernel.org/xen-devel/20250304183115.2509666-1-ayan.kumar.halder@amd.com/
> > 
> > Yet even there the line between Hardware and Control is already blurred
> > imo. Take "Reboot and shutdown the platform", for example. It seems
> > pretty likely that Hardware has ways to achieve that without involving
> > a hypercall.

That is not correct. We have all encountered similar issues with servers
and other boards we have worked on, and I have had comparable
experiences as well. However, such issues cannot happen on silicon
designed for safety-critical environments.


> I expect that in safety certified or fully disaggregated setups, even the
> hardware domain only gets an allowlist of devices, MMIO, and I/O ports.
> If an I/O resource could be abused, it is either assigned to a Safe domain
> or is simply not used at all.  This is going to be very platform-specific.

That's right.


> > Furthermore there it is (again) assumed that Control has full privileges.
> > I did mention before that I'm not convinced any domain, in a
> > disaggregated setup, would need to have (nor should have) full privilege.

Thinking more about this and also thanks to Jan's comments, I realized
that "the Control Domain has full privileges" is an oversimplification.
The main role of the Control Domain is to monitor other domains and
trigger a platform-wide reboot when necessary. As such, it is probably
not a good idea to describe it as "full privilege" because in reality it
doesn't create/destroy VMs, and doesn't do other operations that would
be part of the "full privilege" concept of Xen.

The Control Domain needs to be able to trigger a platform-wide reboot,
platform-wide shutdown, and platform-wide suspend. That is pretty much
it. I think I need to update the document I linked to explain this.


> > You can also see that (kind of) connection in the
> > hypervisor itself: The special handling of a domain shutting down is
> > in hwdom_shutdown(), with the call to it keyed to is_hardware_domain()
> > (as is to be expected from the function's name).

This is an important detail. As wrote above, maybe we don't actually
need the Control Domain to do anything else or need any extra
privileges, but the Control Domain needs to be able to trigger a
platform-wide reboot. We might have to change this check.


> > Also a more fundamental question I was wondering about: If Control had
> > full privilege, nothing else in the system ought to be able to interfere
> > with it. Yet then how does that domain communicate with the outside
> > world? It can't have PV or Virtio drivers after all. And even if its
> > sole communication channel was a UART, Hardware would likely be able to
> > interfere.

There are well-established methods for implementing domain-to-domain
communication that are free from interference, such as using carefully
defined rings on static shared memory. I believe one of these techniques
involves placing the indexes on separate pages and mapping them
read-only from one of the two domains.

