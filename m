Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F85923D71F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 09:00:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3ZsY-0004UI-Qc; Thu, 06 Aug 2020 06:59:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3ZsY-0004UD-8T
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 06:59:54 +0000
X-Inumbo-ID: d7fcf635-7a57-4d5f-a186-bd9bab7e41ba
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7fcf635-7a57-4d5f-a186-bd9bab7e41ba;
 Thu, 06 Aug 2020 06:59:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A892ABCE;
 Thu,  6 Aug 2020 07:00:09 +0000 (UTC)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
 <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51e30c1c-6b19-e646-fdc4-683b3197817a@suse.com>
Date: Thu, 6 Aug 2020 08:59:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jun Nakajima' <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 02:37, Stefano Stabellini wrote:
> What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
> early and let the scheduler do its job? Something like:
> 
>             enum io_state state = try_handle_mmio(regs, hsr, gpa);
> 
>             switch ( state )
>             {
>             case IO_ABORT:
>                 goto inject_abt;
>             case IO_HANDLED:
>                 advance_pc(regs, hsr);
>                 return;
>             case IO_RETRY:
>                 /* finish later */
>                 return;
>             case IO_UNHANDLED:
>                 /* IO unhandled, try another way to handle it. */
>                 break;
>             default:
>                 ASSERT_UNREACHABLE();
>             }
> 
> Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
> handle_hvm_io_completion() after QEMU completes the emulation. Today,
> handle_mmio just sets the user register with the read value.
> 
> But it would be better if it called again the original function
> do_trap_stage2_abort_guest to actually retry the original operation.
> This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
> IO_HANDLED instead of IO_RETRY, thus, it will advance_pc (the program
> counter) completing the handling of this instruction.
> 
> The user register with the read value could be set by try_handle_mmio if
> try_fwd_ioserv returns IO_HANDLED instead of IO_RETRY.
> 
> Is that how the state machine is expected to work?

I think so. Just because it has taken us quite some time (years) on
the x86 side to get reasonably close to how hardware would behave
(I think we're still not fully there): The re-execution path needs
to make sure it observes exactly the same machine state as the
original path did. In particular changes to memory (by another vCPU)
must not be observed.

Jan

