Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391522D4ED2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 00:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48866.86457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8zF-0001yL-1E; Wed, 09 Dec 2020 23:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48866.86457; Wed, 09 Dec 2020 23:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8zE-0001xw-UN; Wed, 09 Dec 2020 23:35:08 +0000
Received: by outflank-mailman (input) for mailman id 48866;
 Wed, 09 Dec 2020 23:35:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kn8zD-0001xr-Mw
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 23:35:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6ff657a-6697-45ce-9138-c05a936da4ef;
 Wed, 09 Dec 2020 23:35:07 +0000 (UTC)
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
X-Inumbo-ID: b6ff657a-6697-45ce-9138-c05a936da4ef
Date: Wed, 9 Dec 2020 15:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607556906;
	bh=YoVLcOmgtgdXh5DDh0RvYgaGpz4Ay9q2qHzeVVTt8vg=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=afrq+N/w2XDVFCf4axW1W9X5d/bV4XE2CgoKQbVvj7wjO3JxR3DpMcTtFEZzvfASE
	 OfORAofcNOZQeLCQX2E5VHdjvrHmF3mbjeg7BxenYzWbuZiECFlvAOAChJfM9Y9RKB
	 bzWyWRTTEYc1Qui6waJga0IPUD1F3BoYgwQPap4bPPU51bRcvoTfmohiMA6fNpZVOo
	 upm701jDTarenQfmqUtXrQfHk9kbKKauR5DNTp3SfcpYT5+81sWzbuPwMMtnFEHfS6
	 tgdMTkOCsvDALI/ohl6JrJlw9fj1ZctGtcUtrHHiKsGD1ev4BVS+imha1OciqwubhU
	 v1N3INidYbJ1g==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3 15/23] xen/arm: Stick around in leave_hypervisor_to_guest
 until I/O has completed
In-Reply-To: <alpine.DEB.2.21.2012091432450.20986@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2012091521480.20986@sstabellini-ThinkPad-T480s>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-16-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2012091432450.20986@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Stefano Stabellini wrote:
> On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > 
> > This patch adds proper handling of return value of
> > vcpu_ioreq_handle_completion() which involves using a loop
> > in leave_hypervisor_to_guest().
> > 
> > The reason to use an unbounded loop here is the fact that vCPU
> > shouldn't continue until an I/O has completed. In Xen case, if an I/O
> > never completes then it most likely means that something went horribly
> > wrong with the Device Emulator. And it is most likely not safe to
> > continue. So letting the vCPU to spin forever if I/O never completes
> > is a safer action than letting it continue and leaving the guest in
> > unclear state and is the best what we can do for now.
> > 
> > This wouldn't be an issue for Xen as do_softirq() would be called at
> > every loop. In case of failure, the guest will crash and the vCPU
> > will be unscheduled.
> 
> Imagine that we have two guests: one that requires an ioreq server and
> one that doesn't. If I am not mistaken this loop could potentially spin
> forever on a pcpu, thus preventing any other guest being scheduled, even
> if the other guest doesn't need any ioreq servers.
> 
> 
> My other concern is that we are busy-looping. Could we call something
> like wfi() or do_idle() instead? The ioreq server event notification of
> completion should wake us up?
> 
> Following this line of thinking, I am wondering if instead of the
> busy-loop we should call vcpu_block_unless_event_pending(current) in
> try_handle_mmio if IO_RETRY. Then when the emulation is done, QEMU (or
> equivalent) calls xenevtchn_notify which ends up waking up the domU
> vcpu. Would that work?

I read now Julien's reply: we are already doing something similar to
what I suggested with the following call chain:

check_for_vcpu_work -> vcpu_ioreq_handle_completion -> wait_for_io -> wait_on_xen_event_channel

So the busy-loop here is only a safety-belt in cause of a spurious
wake-up, in which case we are going to call again check_for_vcpu_work,
potentially causing a guest reschedule.

Then, this is fine and addresses both my concerns. Maybe let's add a note
in the commit message about it.


I am also wondering if there is any benefit in calling wait_for_io()
earlier, maybe from try_handle_mmio if IO_RETRY?
leave_hypervisor_to_guest is very late for that. In any case, it is not
an important optimization (if it is even an optimization at all) so it
is fine to leave it as is.

