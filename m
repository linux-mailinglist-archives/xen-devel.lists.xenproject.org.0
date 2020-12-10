Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C362D50DC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 03:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48922.86565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBiZ-0003jo-Cq; Thu, 10 Dec 2020 02:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48922.86565; Thu, 10 Dec 2020 02:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBiZ-0003hL-8K; Thu, 10 Dec 2020 02:30:07 +0000
Received: by outflank-mailman (input) for mailman id 48922;
 Thu, 10 Dec 2020 02:30:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUBE=FO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knBiY-0003dc-1Q
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 02:30:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaf3bc85-c222-4439-9148-6c7d3081ec26;
 Thu, 10 Dec 2020 02:30:05 +0000 (UTC)
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
X-Inumbo-ID: aaf3bc85-c222-4439-9148-6c7d3081ec26
Date: Wed, 9 Dec 2020 18:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607567404;
	bh=Yv5v27nCDnCoS0ad6Hjwta6gTf838NB2wyUr57grFwc=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=MNpIdRgN9ngy1hGK0AL6CoHv3GKV5tUgerT6Y+zFfq0iGrHj9ey5XbIdrEvchFqAQ
	 tvCR6ncoVw9kB35KFZe01IyGgSbKt2xFam7rdJL6AHYwvnOKUSWrHpfW10d9v76//y
	 dcitEKAi+CGO9qEM1S3Z62UPq5JGgW00VnltZT769kHngpClfpX1X7/OJEU1mBzphh
	 jPybJrmtWLxR4cIqFYHDZjK7siIrlPsqzbx98Rm2+REH/AW59kZeknMig08p3R6VXW
	 nE2otkClR1O0yyjixHUFxZxo3rSnZr9WKEtMep1b6HLK0CeGtB+5mEAhzL3TDcB/RR
	 Eq7buPSrck0TA==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3 15/23] xen/arm: Stick around in leave_hypervisor_to_guest
 until I/O has completed
In-Reply-To: <52799b99-6405-03f4-2a46-3a0a4aac597f@xen.org>
Message-ID: <alpine.DEB.2.21.2012091745550.20986@sstabellini-ThinkPad-T480s>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-16-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2012091432450.20986@sstabellini-ThinkPad-T480s> <alpine.DEB.2.21.2012091521480.20986@sstabellini-ThinkPad-T480s>
 <52799b99-6405-03f4-2a46-3a0a4aac597f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Julien Grall wrote:
> On 09/12/2020 23:35, Stefano Stabellini wrote:
> > On Wed, 9 Dec 2020, Stefano Stabellini wrote:
> > > On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
> > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > 
> > > > This patch adds proper handling of return value of
> > > > vcpu_ioreq_handle_completion() which involves using a loop
> > > > in leave_hypervisor_to_guest().
> > > > 
> > > > The reason to use an unbounded loop here is the fact that vCPU
> > > > shouldn't continue until an I/O has completed. In Xen case, if an I/O
> > > > never completes then it most likely means that something went horribly
> > > > wrong with the Device Emulator. And it is most likely not safe to
> > > > continue. So letting the vCPU to spin forever if I/O never completes
> > > > is a safer action than letting it continue and leaving the guest in
> > > > unclear state and is the best what we can do for now.
> > > > 
> > > > This wouldn't be an issue for Xen as do_softirq() would be called at
> > > > every loop. In case of failure, the guest will crash and the vCPU
> > > > will be unscheduled.
> > > 
> > > Imagine that we have two guests: one that requires an ioreq server and
> > > one that doesn't. If I am not mistaken this loop could potentially spin
> > > forever on a pcpu, thus preventing any other guest being scheduled, even
> > > if the other guest doesn't need any ioreq servers.
> > > 
> > > 
> > > My other concern is that we are busy-looping. Could we call something
> > > like wfi() or do_idle() instead? The ioreq server event notification of
> > > completion should wake us up?
> > > 
> > > Following this line of thinking, I am wondering if instead of the
> > > busy-loop we should call vcpu_block_unless_event_pending(current) in
> > > try_handle_mmio if IO_RETRY. Then when the emulation is done, QEMU (or
> > > equivalent) calls xenevtchn_notify which ends up waking up the domU
> > > vcpu. Would that work?
> > 
> > I read now Julien's reply: we are already doing something similar to
> > what I suggested with the following call chain:
> > 
> > check_for_vcpu_work -> vcpu_ioreq_handle_completion -> wait_for_io ->
> > wait_on_xen_event_channel
> > 
> > So the busy-loop here is only a safety-belt in cause of a spurious
> > wake-up, in which case we are going to call again check_for_vcpu_work,
> > potentially causing a guest reschedule.
> > 
> > Then, this is fine and addresses both my concerns. Maybe let's add a note
> > in the commit message about it.
> 
> Damm, I hit the "sent" button just a second before seen your reply. :/ Oh
> well. I suggested the same because I have seen the same question multiple
> time.

:-)

 
> > I am also wondering if there is any benefit in calling wait_for_io()
> > earlier, maybe from try_handle_mmio if IO_RETRY?
> 
> wait_for_io() may end up to deschedule the vCPU. I would like to avoid this to
> happen in the middle of the I/O emulation because we need to happen it without
> lock held at all.
> 
> I don't think there are locks involved today, but the deeper in the call stack
> the scheduling happens, the more chance we may screw up in the future.
> 
> However...
> 
> > leave_hypervisor_to_guest is very late for that.
> 
> ... I am not sure what's the problem with that. The IOREQ will be notified of
> the pending I/O as soon as try_handle_mmio() put the I/O in the shared page.
> 
> If the IOREQ server is running on a different pCPU, then it might be possible
> that the I/O has completed before reached leave_hypervisor_to_guest(). In this
> case, we would not have to wait for the I/O.

Yeah, I was thinking about that too. Actually it could be faster
this way we end up being lucky.

The reason for moving it earlier would be that by the time
leave_hypervisor_to_guest is called "Xen" has already decided to
continue running this particular vcpu. If we called wait_for_io()
earlier, we would give important information to the scheduler before any
decision is made. This is more "philosophical" than practical though.
Let's leave it as is.

