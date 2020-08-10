Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9F32413DD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 01:34:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5HJ8-00056K-F0; Mon, 10 Aug 2020 23:34:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVj=BU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k5HJ6-00056C-5f
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 23:34:20 +0000
X-Inumbo-ID: ee4bccd4-e02b-478c-a0f1-6d591fcbf6eb
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee4bccd4-e02b-478c-a0f1-6d591fcbf6eb;
 Mon, 10 Aug 2020 23:34:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55648206DA;
 Mon, 10 Aug 2020 23:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597102458;
 bh=JlWIceHJKmkCzLojUgDXFu8M8TOrsQD3Kh5m9CJMlv4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0nL56wCN9Gi3aIYWwcoKODFe/BxskENM7i96BQPhkyPG1/P1rqzOLp2J1HwQDotpA
 2KdYUykzmgIm9kNQ9/Z5tZDPATTxXn65EyFFsrsFeW4RJaw31B8g+dunXuTTB8k1U0
 l3k3goVG8yGtsdUVs7CK50hHwnNjhzRLRQBn8R00=
Date: Mon, 10 Aug 2020 16:34:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <910ec6ee-1076-2c9d-c01d-b6b4cc0bc6b8@gmail.com>
Message-ID: <alpine.DEB.2.21.2008101210240.16004@sstabellini-ThinkPad-T480s>
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
 <910ec6ee-1076-2c9d-c01d-b6b4cc0bc6b8@gmail.com>
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

On Sat, 8 Aug 2020, Oleksandr wrote:
> On 08.08.20 00:50, Stefano Stabellini wrote:
> > On Fri, 7 Aug 2020, Oleksandr wrote:
> > > On 06.08.20 03:37, Stefano Stabellini wrote:
> > > 
> > > Hi Stefano
> > > 
> > > Trying to simulate IO_RETRY handling mechanism (according to model below)
> > > I
> > > continuously get IO_RETRY from try_fwd_ioserv() ...
> > > 
> > > > OK, thanks for the details. My interpretation seems to be correct.
> > > > 
> > > > In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv should
> > > > return IO_RETRY. Then, xen/arch/arm/traps.c:do_trap_stage2_abort_guest
> > > > also needs to handle try_handle_mmio returning IO_RETRY the first
> > > > around, and IO_HANDLED when after QEMU does its job.
> > > > 
> > > > What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
> > > > early and let the scheduler do its job? Something like:
> > > > 
> > > >               enum io_state state = try_handle_mmio(regs, hsr, gpa);
> > > > 
> > > >               switch ( state )
> > > >               {
> > > >               case IO_ABORT:
> > > >                   goto inject_abt;
> > > >               case IO_HANDLED:
> > > >                   advance_pc(regs, hsr);
> > > >                   return;
> > > >               case IO_RETRY:
> > > >                   /* finish later */
> > > >                   return;
> > > >               case IO_UNHANDLED:
> > > >                   /* IO unhandled, try another way to handle it. */
> > > >                   break;
> > > >               default:
> > > >                   ASSERT_UNREACHABLE();
> > > >               }
> > > > 
> > > > Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
> > > > handle_hvm_io_completion() after QEMU completes the emulation. Today,
> > > > handle_mmio just sets the user register with the read value.
> > > > 
> > > > But it would be better if it called again the original function
> > > > do_trap_stage2_abort_guest to actually retry the original operation.
> > > > This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
> > > > IO_HANDLED instead of IO_RETRY,
> > > I may miss some important point, but I failed to see why try_handle_mmio
> > > (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at this stage.
> > > Or current try_fwd_ioserv() logic needs rework?
> > I think you should check the ioreq->state in try_fwd_ioserv(), if the
> > result is ready, then ioreq->state should be STATE_IORESP_READY, and you
> > can return IO_HANDLED.
> > 
> > That is assuming that you are looking at the live version of the ioreq
> > shared with QEMU instead of a private copy of it, which I am not sure.
> > Looking at try_fwd_ioserv() it would seem that vio->io_req is just a
> > copy? The live version is returned by get_ioreq() ?
> 
> If I understand the code correctly, indeed, get_ioreq() returns live version
> shared with emulator.
> Desired state change (STATE_IORESP_READY) what actually the hvm_wait_for_io()
> is waiting for is set here (in my case):
> https://xenbits.xen.org/gitweb/?p=people/pauldu/demu.git;a=blob;f=demu.c;h=f785b394d0cf141dffa05bdddecf338214358aea;hb=refs/heads/master#l698 
> 
> > Even in handle_hvm_io_completion, instead of setting vio->io_req.state
> > to STATE_IORESP_READY by hand, it would be better to look at the live
> > version of the ioreq because QEMU will have already set ioreq->state
> > to STATE_IORESP_READY (hw/i386/xen/xen-hvm.c:cpu_handle_ioreq).
> It seems that after detecting STATE_IORESP_READY in hvm_wait_for_io() the
> state of live version is set to STATE_IOREQ_NONE immediately, so looking at
> the live version down the handle_hvm_io_completion()
> or in try_fwd_ioserv() shows us nothing I am afraid.

I see. That is because we want to "free" the ioreq as soon as possible,
which is good. handle_hvm_io_completion also sets vio->io_req.state to
STATE_IORESP_READY, so our private copy is still set to
STATE_IORESP_READY. Thus, try_fwd_ioserv should do the right thing
simply reading vio->io_req.state: try_fwd_ioserv should be able to
return IO_HANDLED when the "state" is STATE_IORESP_READY, right?

