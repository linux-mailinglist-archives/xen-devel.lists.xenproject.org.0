Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31382413DC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 01:34:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5HJJ-00058N-OH; Mon, 10 Aug 2020 23:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVj=BU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k5HJI-00058F-Q0
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 23:34:32 +0000
X-Inumbo-ID: c0eac35a-3d07-4be8-a27e-860e5302fa37
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0eac35a-3d07-4be8-a27e-860e5302fa37;
 Mon, 10 Aug 2020 23:34:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DDD1206DA;
 Mon, 10 Aug 2020 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597102466;
 bh=UNAKJZe0LSWkIc0N1phrCRKY4Ib/jVT1H5CObG+5mXY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=TvICtCiSTGEzLilQUlsbwWQST8sJbBzMusxxq+o2ygWsmq7DyWs8m6o7zVU7yWKat
 akK7rBU1431liTqQRpLmJ3vUeJS8NcBTZD4TsV2LKH5sUmuZ+P06RW8joaZgJ7ekPO
 GdOvxQcE3QgDwNeaYBYvuB3vmuLbgEDEN7xdsUkk=
Date: Mon, 10 Aug 2020 16:34:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <27513b2b-e59b-d446-7e68-eac4bc503409@gmail.com>
Message-ID: <alpine.DEB.2.21.2008101200230.16004@sstabellini-ThinkPad-T480s>
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
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1044303261-1597086100=:16004"
Content-ID: <alpine.DEB.2.21.2008101201440.16004@sstabellini-ThinkPad-T480s>
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

--8323329-1044303261-1597086100=:16004
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2008101201441.16004@sstabellini-ThinkPad-T480s>

On Mon, 10 Aug 2020, Oleksandr wrote:
> On 08.08.20 01:19, Oleksandr wrote:
> > On 08.08.20 00:50, Stefano Stabellini wrote:
> > > On Fri, 7 Aug 2020, Oleksandr wrote:
> > > > On 06.08.20 03:37, Stefano Stabellini wrote:
> > > > 
> > > > Hi Stefano
> > > > 
> > > > Trying to simulate IO_RETRY handling mechanism (according to model
> > > > below) I
> > > > continuously get IO_RETRY from try_fwd_ioserv() ...
> > > > 
> > > > > OK, thanks for the details. My interpretation seems to be correct.
> > > > > 
> > > > > In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv should
> > > > > return IO_RETRY. Then, xen/arch/arm/traps.c:do_trap_stage2_abort_guest
> > > > > also needs to handle try_handle_mmio returning IO_RETRY the first
> > > > > around, and IO_HANDLED when after QEMU does its job.
> > > > > 
> > > > > What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
> > > > > early and let the scheduler do its job? Something like:
> > > > > 
> > > > >               enum io_state state = try_handle_mmio(regs, hsr, gpa);
> > > > > 
> > > > >               switch ( state )
> > > > >               {
> > > > >               case IO_ABORT:
> > > > >                   goto inject_abt;
> > > > >               case IO_HANDLED:
> > > > >                   advance_pc(regs, hsr);
> > > > >                   return;
> > > > >               case IO_RETRY:
> > > > >                   /* finish later */
> > > > >                   return;
> > > > >               case IO_UNHANDLED:
> > > > >                   /* IO unhandled, try another way to handle it. */
> > > > >                   break;
> > > > >               default:
> > > > >                   ASSERT_UNREACHABLE();
> > > > >               }
> > > > > 
> > > > > Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
> > > > > handle_hvm_io_completion() after QEMU completes the emulation. Today,
> > > > > handle_mmio just sets the user register with the read value.
> > > > > 
> > > > > But it would be better if it called again the original function
> > > > > do_trap_stage2_abort_guest to actually retry the original operation.
> > > > > This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
> > > > > IO_HANDLED instead of IO_RETRY,
> > > > I may miss some important point, but I failed to see why try_handle_mmio
> > > > (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at this
> > > > stage.
> > > > Or current try_fwd_ioserv() logic needs rework?
> > > I think you should check the ioreq->state in try_fwd_ioserv(), if the
> > > result is ready, then ioreq->state should be STATE_IORESP_READY, and you
> > > can return IO_HANDLED.
> > 
> 
> I optimized test patch a bit (now it looks much simpler). I didn't face any
> issues during a quick test.

Both patches get much closer to following the proper state machine,
great! I think this patch is certainly a good improvement. I think the
other patch you sent earlier, slightly larger, is even better. It makes
the following additional changes that would be good to have:

- try_fwd_ioserv returns IO_HANDLED on state == STATE_IORESP_READY
- handle_mmio simply calls do_trap_stage2_abort_guest

I would also remove "handle_mmio_finish" and do the guest register
setting as well as setting vio->io_req.state to STATE_IOREQ_NONE
directly in try_fwd_ioserv.

 
> ---
>  xen/arch/arm/io.c    | 4 ----
>  xen/arch/arm/ioreq.c | 7 ++++++-
>  xen/arch/arm/traps.c | 4 +++-
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 436f669..3063577 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -156,10 +156,6 @@ static enum io_state try_fwd_ioserv(struct cpu_user_regs
> *regs,
>      else
>          vio->io_completion = HVMIO_mmio_completion;
> 
> -    /* XXX: Decide what to do */
> -    if ( rc 7== IO_RETRY )
> -        rc = IO_HANDLED;
> -
>      return rc;
>  }
>  #endif
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 8f60c41..e5235c6 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -33,6 +33,8 @@
>  #include <public/hvm/dm_op.h>
>  #include <public/hvm/ioreq.h>
> 
> +#include <asm/traps.h>
> +
>  bool handle_mmio(void)
>  {
>      struct vcpu *v = current;
> @@ -52,7 +54,7 @@ bool handle_mmio(void)
> 
>      /* XXX: Do we need to take care of write here ? */
>      if ( dabt.write )
> -        return true;
> +        goto done;
> 
>      /*
>       * Sign extend if required.
> @@ -72,6 +74,9 @@ bool handle_mmio(void)
> 
>      set_user_reg(regs, dabt.reg, r);
> 
> +done:
> +    advance_pc(regs, hsr);
> +
>      return true;
>  }
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index ea472d1..974c744 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1965,11 +1965,13 @@ static void do_trap_stage2_abort_guest(struct
> cpu_user_regs *regs,
>              case IO_HANDLED:
>                  advance_pc(regs, hsr);
>                  return;
> +            case IO_RETRY:
> +                /* finish later */
> +                return;
>              case IO_UNHANDLED:
>                  /* IO unhandled, try another way to handle it. */
>                  break;
>              default:
> -                /* XXX: Handle IO_RETRY */
>                  ASSERT_UNREACHABLE();
>              }
>          }
--8323329-1044303261-1597086100=:16004--

