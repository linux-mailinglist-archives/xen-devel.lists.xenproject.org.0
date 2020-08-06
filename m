Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AFC23E33A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 22:33:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3mZ5-0004xe-Vm; Thu, 06 Aug 2020 20:32:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3mZ4-0004xZ-Nb
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 20:32:38 +0000
X-Inumbo-ID: 9ebcb23d-936c-4a6e-a579-d7c6782b22a3
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ebcb23d-936c-4a6e-a579-d7c6782b22a3;
 Thu, 06 Aug 2020 20:32:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC2C120855;
 Thu,  6 Aug 2020 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596745957;
 bh=zfVa+e5Pv577pD3yrUmrJ2ITyvuhQKGJiFQlFwlLYzg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=cFugBYn+7Ec6q/g1IQJRdQh94u6k6CKNcmsOPAISGMHsSk6Mj6Gd1tx+zHFVy4HrU
 7jH/jaToOT/fVU8xtJxbiGUrx160OlkpR6+5qemKUd6saLO0sLdwNNbTnvSRFc8GEs
 o+6XPe5TBas1UI/K4AoPcUL2zfIdoXSO6KMwELSE=
Date: Thu, 6 Aug 2020 13:32:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <51e30c1c-6b19-e646-fdc4-683b3197817a@suse.com>
Message-ID: <alpine.DEB.2.21.2008061331140.16004@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
 <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
 <51e30c1c-6b19-e646-fdc4-683b3197817a@suse.com>
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

On Thu, 6 Aug 2020, Jan Beulich wrote:
> On 06.08.2020 02:37, Stefano Stabellini wrote:
> > What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
> > early and let the scheduler do its job? Something like:
> > 
> >             enum io_state state = try_handle_mmio(regs, hsr, gpa);
> > 
> >             switch ( state )
> >             {
> >             case IO_ABORT:
> >                 goto inject_abt;
> >             case IO_HANDLED:
> >                 advance_pc(regs, hsr);
> >                 return;
> >             case IO_RETRY:
> >                 /* finish later */
> >                 return;
> >             case IO_UNHANDLED:
> >                 /* IO unhandled, try another way to handle it. */
> >                 break;
> >             default:
> >                 ASSERT_UNREACHABLE();
> >             }
> > 
> > Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
> > handle_hvm_io_completion() after QEMU completes the emulation. Today,
> > handle_mmio just sets the user register with the read value.
> > 
> > But it would be better if it called again the original function
> > do_trap_stage2_abort_guest to actually retry the original operation.
> > This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
> > IO_HANDLED instead of IO_RETRY, thus, it will advance_pc (the program
> > counter) completing the handling of this instruction.
> > 
> > The user register with the read value could be set by try_handle_mmio if
> > try_fwd_ioserv returns IO_HANDLED instead of IO_RETRY.
> > 
> > Is that how the state machine is expected to work?
> 
> I think so. Just because it has taken us quite some time (years) on
> the x86 side to get reasonably close to how hardware would behave
> (I think we're still not fully there): The re-execution path needs
> to make sure it observes exactly the same machine state as the
> original path did. In particular changes to memory (by another vCPU)
> must not be observed.

Thanks for the heads up. I think I understand how it is supposed to work
now. I hope Oleksandr is on the same page.

