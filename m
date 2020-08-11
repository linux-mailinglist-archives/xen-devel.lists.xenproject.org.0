Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0982422A1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 00:48:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5d3T-00046j-M0; Tue, 11 Aug 2020 22:47:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6luX=BV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k5d3S-00046e-2c
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 22:47:38 +0000
X-Inumbo-ID: 1c9444ad-7cf5-4253-958d-2d1b83e68e29
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c9444ad-7cf5-4253-958d-2d1b83e68e29;
 Tue, 11 Aug 2020 22:47:37 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7330206DA;
 Tue, 11 Aug 2020 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597186056;
 bh=8H+qNstykGmUfhCFE3cLgeILQfeMFVGhPT6xJlj9ybE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GvAOviaWvpy9a/7ypxqtdnv3eAtydaruX++P8PC3ka4boSc78wm3PHq7tMTPas6Fw
 OqPP16f31QF9q+52gESnfY/fwQvsboyjeYhc/+oA9OxSivAwIE6QqVpNXapM+HRnrH
 RmX/ygt7Eib8ByP4FvDrrAQZIT4SkUZQ44q93zNA=
Date: Tue, 11 Aug 2020 15:47:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <dc6de2f4-8f9d-aa96-8513-aecedb11e0ef@gmail.com>
Message-ID: <alpine.DEB.2.21.2008111433520.15669@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
 <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
 <013b142d-5296-5bbe-7d19-903f59e0c974@gmail.com>
 <alpine.DEB.2.21.2008071259580.16004@sstabellini-ThinkPad-T480s>
 <06f78323-b8f5-fd11-486a-437267eccc29@gmail.com>
 <27513b2b-e59b-d446-7e68-eac4bc503409@gmail.com>
 <alpine.DEB.2.21.2008101200230.16004@sstabellini-ThinkPad-T480s>
 <441f4413-b746-035e-948e-da3ff76a9a3b@xen.org>
 <dc6de2f4-8f9d-aa96-8513-aecedb11e0ef@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1210949560-1597182301=:15669"
Content-ID: <alpine.DEB.2.21.2008111445160.15669@sstabellini-ThinkPad-T480s>
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
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1210949560-1597182301=:15669
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2008111445161.15669@sstabellini-ThinkPad-T480s>

On Tue, 11 Aug 2020, Oleksandr wrote:
> On 11.08.20 12:19, Julien Grall wrote:
> > On 11/08/2020 00:34, Stefano Stabellini wrote:
> > > On Mon, 10 Aug 2020, Oleksandr wrote:
> > > > On 08.08.20 01:19, Oleksandr wrote:
> > > > > On 08.08.20 00:50, Stefano Stabellini wrote:
> > > > > > On Fri, 7 Aug 2020, Oleksandr wrote:
> > > > > > > On 06.08.20 03:37, Stefano Stabellini wrote:
> > > > > > > 
> > > > > > > Hi Stefano
> > > > > > > 
> > > > > > > Trying to simulate IO_RETRY handling mechanism (according to model
> > > > > > > below) I
> > > > > > > continuously get IO_RETRY from try_fwd_ioserv() ...
> > > > > > > 
> > > > > > > > OK, thanks for the details. My interpretation seems to be
> > > > > > > > correct.
> > > > > > > > 
> > > > > > > > In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv
> > > > > > > > should
> > > > > > > > return IO_RETRY. Then,
> > > > > > > > xen/arch/arm/traps.c:do_trap_stage2_abort_guest
> > > > > > > > also needs to handle try_handle_mmio returning IO_RETRY the
> > > > > > > > first
> > > > > > > > around, and IO_HANDLED when after QEMU does its job.
> > > > > > > > 
> > > > > > > > What should do_trap_stage2_abort_guest do on IO_RETRY? Simply
> > > > > > > > return
> > > > > > > > early and let the scheduler do its job? Something like:
> > > > > > > > 
> > > > > > > >                enum io_state state = try_handle_mmio(regs, hsr,
> > > > > > > > gpa);
> > > > > > > > 
> > > > > > > >                switch ( state )
> > > > > > > >                {
> > > > > > > >                case IO_ABORT:
> > > > > > > >                    goto inject_abt;
> > > > > > > >                case IO_HANDLED:
> > > > > > > >                    advance_pc(regs, hsr);
> > > > > > > >                    return;
> > > > > > > >                case IO_RETRY:
> > > > > > > >                    /* finish later */
> > > > > > > >                    return;
> > > > > > > >                case IO_UNHANDLED:
> > > > > > > >                    /* IO unhandled, try another way to handle
> > > > > > > > it. */
> > > > > > > >                    break;
> > > > > > > >                default:
> > > > > > > >                    ASSERT_UNREACHABLE();
> > > > > > > >                }
> > > > > > > > 
> > > > > > > > Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
> > > > > > > > handle_hvm_io_completion() after QEMU completes the emulation.
> > > > > > > > Today,
> > > > > > > > handle_mmio just sets the user register with the read value.
> > > > > > > > 
> > > > > > > > But it would be better if it called again the original function
> > > > > > > > do_trap_stage2_abort_guest to actually retry the original
> > > > > > > > operation.
> > > > > > > > This time do_trap_stage2_abort_guest calls try_handle_mmio() and
> > > > > > > > gets
> > > > > > > > IO_HANDLED instead of IO_RETRY,
> > > > > > > I may miss some important point, but I failed to see why
> > > > > > > try_handle_mmio
> > > > > > > (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at
> > > > > > > this
> > > > > > > stage.
> > > > > > > Or current try_fwd_ioserv() logic needs rework?
> > > > > > I think you should check the ioreq->state in try_fwd_ioserv(), if
> > > > > > the
> > > > > > result is ready, then ioreq->state should be STATE_IORESP_READY, and
> > > > > > you
> > > > > > can return IO_HANDLED.
> > > > > 
> > > > 
> > > > I optimized test patch a bit (now it looks much simpler). I didn't face
> > > > any
> > > > issues during a quick test.
> > > 
> > > Both patches get much closer to following the proper state machine,
> > > great! I think this patch is certainly a good improvement. I think the
> > > other patch you sent earlier, slightly larger, is even better. It makes
> > > the following additional changes that would be good to have:
> > > 
> > > - try_fwd_ioserv returns IO_HANDLED on state == STATE_IORESP_READY
> > > - handle_mmio simply calls do_trap_stage2_abort_guest
> > 
> > I don't think we should call do_trap_stage2_abort_guest() as part of the
> > completion because:
> >     * The function do_trap_stage2_abort_guest() is using registers that are
> > not context switched (such as FAR_EL2). I/O handling is split in two with
> > likely a context switch in the middle. The second part is the completion
> > (i.e call to handle_mmio()). So the system registers will be incorrect.
> >     * A big chunk of do_trap_stage2_abort_guest() is not necessary for the
> > completion. For instance, there is no need to try to translate the guest
> > virtual address to a guest physical address.
> > 
> > Therefore the version below is probably the best approach.
> 
> 
> Indeed, the first version (with calling do_trap_stage2_abort_guest() for a
> completion) is a racy. When testing it more heavily I faced an issue
> (sometimes) which resulted in DomU got stuck completely.
> 
> (XEN) d2v1: vGICD: bad read width 0 r11 offset 0x000f00
> 
> I didn't investigate an issue in detail, but I assumed that code in
> do_trap_stage2_abort_guest() caused that. This was the main reason why I
> decided to optimize an initial patch (and took only advance_pc).
> Reading Julien's answer I understand now what could happen.

From your and Julien's feedback it is clear that calling
do_trap_stage2_abort_guest() is not possible and not a good idea.


The reason for my suggestion was to complete the implementation of the
state machine so that "RETRY" actually means "let's try again the
emulation" but the second time it will return "HANDLED".

Looking at this again, we could achieve the same goal in a better way by
moving the register setting from "handle_mmio" to "try_handle_mmio" and
also calling "try_handle_mmio" from "handle_mmio". Note that handle_mmio
would become almost empty like on x86.

1) do_trap_stage2_abort_guest ->
       try_handle_mmio ->
            try_fwd_ioserv ->
                IO_RETRY

2) handle_hvm_io_completion ->
       handle_mmio ->
           try_handle_mmio ->
               try_fwd_ioserv ->
                   IO_HANDLED


It is very similar to your second patch with a small change on calling
try_handle_mmio from handle_mmio and setting the register there. Do you
think that would work?
--8323329-1210949560-1597182301=:15669--

