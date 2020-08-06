Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38AE23D4BF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 02:38:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3TuQ-0008TC-OF; Thu, 06 Aug 2020 00:37:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3TuP-0008T7-Bx
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 00:37:25 +0000
X-Inumbo-ID: dd9a61fe-4e98-43f0-b7a4-06b57264fcd9
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd9a61fe-4e98-43f0-b7a4-06b57264fcd9;
 Thu, 06 Aug 2020 00:37:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED96C20842;
 Thu,  6 Aug 2020 00:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596674242;
 bh=IvvjNayDWHWpV02+RT2Wm7bTN+tg82sFIQ4J452VtMY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=aaiyM/WRGotg9LJl8yqafFSo0YLqLJ0ThXd47pNSk8X3LbX2Tj3qVtjLEBQFzCErX
 U2KezIWoaOYIlbBLOI/af9/lYp5H+2hGkT8OKiFkF2TaH0uFHvUzb565ptS0j0n7N0
 i+c1GHoOp/3RKJ6TuxWI0Iu6J+4DfMKOYTSL9PNs=
Date: Wed, 5 Aug 2020 17:37:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
Message-ID: <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jun Nakajima' <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 5 Aug 2020, Jan Beulich wrote:
> On 04.08.2020 21:11, Stefano Stabellini wrote:
> >> The point of the check isn't to determine whether to wait, but
> >> what to do after having waited. Reads need a retry round through
> >> the emulator (to store the result in the designated place),
> >> while writes don't have such a requirement (and hence guest
> >> execution can continue immediately in the general case).
> > 
> > The x86 code looks like this:
> > 
> >             rc = hvm_send_ioreq(s, &p, 0);
> >             if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
> >                 vio->io_req.state = STATE_IOREQ_NONE;
> >             else if ( !hvm_ioreq_needs_completion(&vio->io_req) )
> >                 rc = X86EMUL_OKAY;
> > 
> > Basically hvm_send_ioreq is expected to return RETRY.
> > Then, if it is a PIO write operation only, it is turned into OKAY right
> > away. Otherwise, rc stays as RETRY.
> > 
> > So, normally, hvmemul_do_io is expected to return RETRY, because the
> > emulator is not done yet. Am I understanding the code correctly?
> 
> "The emulator" unfortunately is ambiguous here: Do you mean qemu
> (or whichever else ioreq server) or the x86 emulator inside Xen?

I meant QEMU. I'll use "QEMU" instead of "emulator" in this thread going
forward for clarity.


> There are various conditions leading to RETRY. As far as
> hvm_send_ioreq() goes, it is expected to return RETRY whenever
> some sort of response is to be expected (the most notable
> exception being the hvm_send_buffered_ioreq() path), or when
> submitting the request isn't possible in the first place.
> 
> > If so, who is handling RETRY on x86? It tried to follow the call chain
> > but ended up in the x86 emulator and got lost :-)
> 
> Not sure I understand the question correctly, but I'll try an
> answer nevertheless: hvm_send_ioreq() arranges for the vCPU to be
> put to sleep (prepare_wait_on_xen_event_channel()). Once the event
> channel got signaled (and vCPU unblocked), hvm_do_resume() ->
> handle_hvm_io_completion() -> hvm_wait_for_io() then check whether
> the wait reason has been satisfied (wait_on_xen_event_channel()),
> and ...
> 
> > At some point later, after the emulator (QEMU) has completed the
> > request, handle_hvm_io_completion gets called which ends up calling
> > handle_mmio() finishing the job on the Xen side too.
> 
> ..., as you say, handle_hvm_io_completion() invokes the retry of
> the original operation (handle_mmio() or handle_pio() in
> particular) if need be.

OK, thanks for the details. My interpretation seems to be correct.

In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv should
return IO_RETRY. Then, xen/arch/arm/traps.c:do_trap_stage2_abort_guest
also needs to handle try_handle_mmio returning IO_RETRY the first
around, and IO_HANDLED when after QEMU does its job.

What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
early and let the scheduler do its job? Something like:

            enum io_state state = try_handle_mmio(regs, hsr, gpa);

            switch ( state )
            {
            case IO_ABORT:
                goto inject_abt;
            case IO_HANDLED:
                advance_pc(regs, hsr);
                return;
            case IO_RETRY:
                /* finish later */
                return;
            case IO_UNHANDLED:
                /* IO unhandled, try another way to handle it. */
                break;
            default:
                ASSERT_UNREACHABLE();
            }

Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
handle_hvm_io_completion() after QEMU completes the emulation. Today,
handle_mmio just sets the user register with the read value.

But it would be better if it called again the original function
do_trap_stage2_abort_guest to actually retry the original operation.
This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
IO_HANDLED instead of IO_RETRY, thus, it will advance_pc (the program
counter) completing the handling of this instruction.

The user register with the read value could be set by try_handle_mmio if
try_fwd_ioserv returns IO_HANDLED instead of IO_RETRY.

Is that how the state machine is expected to work?


> What's potentially confusing is that there's a second form of
> retry, invoked by the x86 insn emulator itself when it needs to
> split complex insns (the repeated string insns being the most
> important example). This results in actually exiting back to guest
> context without having advanced rIP, but after having updated
> other register state suitably (to express the progress made so
> far).

Ah! And it seems to be exactly the same label: X86EMUL_RETRY. It would
be a good idea to differentiate between them.

