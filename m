Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF7B23F496
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 23:51:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4AGH-0004kC-Ao; Fri, 07 Aug 2020 21:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tr6f=BR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k4AGG-0004k7-Ca
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 21:50:48 +0000
X-Inumbo-ID: 45022f6d-0751-4755-b529-ea264dbe6131
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45022f6d-0751-4755-b529-ea264dbe6131;
 Fri, 07 Aug 2020 21:50:46 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 084392177B;
 Fri,  7 Aug 2020 21:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596837045;
 bh=d8HaMhlTaGM01v77iK+nJX2tQA+46Ioxn1SY+g1hQcw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Zm/4TetZWuR2g+Ua9OGU61GhTPMowUQXuPQMp7n45X3abkUGCoivS6sSv1N1jSE95
 BmNT8rRiXOBVCc+WzfJaTlrY+CbBts4WAeYo5SG4VFz2flUZ8ktAlLinPfVAVKn5zZ
 /0BrT+GCvyoRl1li3PbiApdx9OHa3mQaEWs5quXc=
Date: Fri, 7 Aug 2020 14:50:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <013b142d-5296-5bbe-7d19-903f59e0c974@gmail.com>
Message-ID: <alpine.DEB.2.21.2008071259580.16004@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
 <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
 <013b142d-5296-5bbe-7d19-903f59e0c974@gmail.com>
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

On Fri, 7 Aug 2020, Oleksandr wrote:
> On 06.08.20 03:37, Stefano Stabellini wrote:
> 
> Hi Stefano
> 
> Trying to simulate IO_RETRY handling mechanism (according to model below) I
> continuously get IO_RETRY from try_fwd_ioserv() ...
> 
> > OK, thanks for the details. My interpretation seems to be correct.
> > 
> > In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv should
> > return IO_RETRY. Then, xen/arch/arm/traps.c:do_trap_stage2_abort_guest
> > also needs to handle try_handle_mmio returning IO_RETRY the first
> > around, and IO_HANDLED when after QEMU does its job.
> > 
> > What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
> > early and let the scheduler do its job? Something like:
> > 
> >              enum io_state state = try_handle_mmio(regs, hsr, gpa);
> > 
> >              switch ( state )
> >              {
> >              case IO_ABORT:
> >                  goto inject_abt;
> >              case IO_HANDLED:
> >                  advance_pc(regs, hsr);
> >                  return;
> >              case IO_RETRY:
> >                  /* finish later */
> >                  return;
> >              case IO_UNHANDLED:
> >                  /* IO unhandled, try another way to handle it. */
> >                  break;
> >              default:
> >                  ASSERT_UNREACHABLE();
> >              }
> > 
> > Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
> > handle_hvm_io_completion() after QEMU completes the emulation. Today,
> > handle_mmio just sets the user register with the read value.
> > 
> > But it would be better if it called again the original function
> > do_trap_stage2_abort_guest to actually retry the original operation.
> > This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
> > IO_HANDLED instead of IO_RETRY,
> I may miss some important point, but I failed to see why try_handle_mmio
> (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at this stage.
> Or current try_fwd_ioserv() logic needs rework?

I think you should check the ioreq->state in try_fwd_ioserv(), if the
result is ready, then ioreq->state should be STATE_IORESP_READY, and you
can return IO_HANDLED.

That is assuming that you are looking at the live version of the ioreq
shared with QEMU instead of a private copy of it, which I am not sure.
Looking at try_fwd_ioserv() it would seem that vio->io_req is just a
copy? The live version is returned by get_ioreq() ?

Even in handle_hvm_io_completion, instead of setting vio->io_req.state
to STATE_IORESP_READY by hand, it would be better to look at the live
version of the ioreq because QEMU will have already set ioreq->state
to STATE_IORESP_READY (hw/i386/xen/xen-hvm.c:cpu_handle_ioreq).

 
> > thus, it will advance_pc (the program
> > counter) completing the handling of this instruction.
> > 
> > The user register with the read value could be set by try_handle_mmio if
> > try_fwd_ioserv returns IO_HANDLED instead of IO_RETRY.
> > 
> > Is that how the state machine is expected to work?

