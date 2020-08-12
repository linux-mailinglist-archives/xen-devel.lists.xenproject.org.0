Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A913243160
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 01:10:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5zrP-000198-O2; Wed, 12 Aug 2020 23:08:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ZUe=BW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k5zrO-000193-CE
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 23:08:42 +0000
X-Inumbo-ID: b74a214b-ec2e-4d35-947c-53acb9a7c971
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b74a214b-ec2e-4d35-947c-53acb9a7c971;
 Wed, 12 Aug 2020 23:08:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEEB72076B;
 Wed, 12 Aug 2020 23:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597273720;
 bh=iDwx7ViYu6r/nUSVm7F9VF+4MoAWaCLs7SJxtComjVE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=IRmZibUGoHNdHo9JKflximyBDNJ8+qDbgvCCwa4UWzyQ30hpSMMbJzqa7485WddSf
 Ksn/mme3q06GGhKgnskfw9j1ZOrres5VxP01abhvI4Qz6VV3vBUPkeBE4L/xkIHn8V
 s4b4nD/s3tqO1bT3S07Nu30ODcfniRu7zoEoBo5s=
Date: Wed, 12 Aug 2020 16:08:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org, 
 xen-devel@lists.xenproject.org, 
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>, 
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>, 
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>, 
 'George Dunlap' <george.dunlap@citrix.com>, 
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 
 'Jun Nakajima' <jun.nakajima@intel.com>, 
 'Kevin Tian' <kevin.tian@intel.com>, 'Tim Deegan' <tim@xen.org>, 
 'Julien Grall' <julien.grall@arm.com>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <870b70b2-97da-3b3f-c06d-ffb5479328ac@gmail.com>
Message-ID: <alpine.DEB.2.21.2008121211450.15669@sstabellini-ThinkPad-T480s>
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
 <alpine.DEB.2.21.2008111433520.15669@sstabellini-ThinkPad-T480s>
 <870b70b2-97da-3b3f-c06d-ffb5479328ac@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1894020823-1597259830=:15669"
Content-ID: <alpine.DEB.2.21.2008121608340.15669@sstabellini-ThinkPad-T480s>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1894020823-1597259830=:15669
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2008121608341.15669@sstabellini-ThinkPad-T480s>

On Wed, 12 Aug 2020, Oleksandr wrote:
> On 12.08.20 01:47, Stefano Stabellini wrote:
> > On Tue, 11 Aug 2020, Oleksandr wrote:
> > > On 11.08.20 12:19, Julien Grall wrote:
> > > > On 11/08/2020 00:34, Stefano Stabellini wrote:
> > > > > On Mon, 10 Aug 2020, Oleksandr wrote:
> > > > > > On 08.08.20 01:19, Oleksandr wrote:
> > > > > > > On 08.08.20 00:50, Stefano Stabellini wrote:
> > > > > > > > On Fri, 7 Aug 2020, Oleksandr wrote:
> > > > > > > > > On 06.08.20 03:37, Stefano Stabellini wrote:
> > > > > > > > > 
> > > > > > > > > Hi Stefano
> > > > > > > > > 
> > > > > > > > > Trying to simulate IO_RETRY handling mechanism (according to
> > > > > > > > > model
> > > > > > > > > below) I
> > > > > > > > > continuously get IO_RETRY from try_fwd_ioserv() ...
> > > > > > > > > 
> > > > > > > > > > OK, thanks for the details. My interpretation seems to be
> > > > > > > > > > correct.
> > > > > > > > > > 
> > > > > > > > > > In which case, it looks like
> > > > > > > > > > xen/arch/arm/io.c:try_fwd_ioserv
> > > > > > > > > > should
> > > > > > > > > > return IO_RETRY. Then,
> > > > > > > > > > xen/arch/arm/traps.c:do_trap_stage2_abort_guest
> > > > > > > > > > also needs to handle try_handle_mmio returning IO_RETRY the
> > > > > > > > > > first
> > > > > > > > > > around, and IO_HANDLED when after QEMU does its job.
> > > > > > > > > > 
> > > > > > > > > > What should do_trap_stage2_abort_guest do on IO_RETRY?
> > > > > > > > > > Simply
> > > > > > > > > > return
> > > > > > > > > > early and let the scheduler do its job? Something like:
> > > > > > > > > > 
> > > > > > > > > >                 enum io_state state = try_handle_mmio(regs,
> > > > > > > > > > hsr,
> > > > > > > > > > gpa);
> > > > > > > > > > 
> > > > > > > > > >                 switch ( state )
> > > > > > > > > >                 {
> > > > > > > > > >                 case IO_ABORT:
> > > > > > > > > >                     goto inject_abt;
> > > > > > > > > >                 case IO_HANDLED:
> > > > > > > > > >                     advance_pc(regs, hsr);
> > > > > > > > > >                     return;
> > > > > > > > > >                 case IO_RETRY:
> > > > > > > > > >                     /* finish later */
> > > > > > > > > >                     return;
> > > > > > > > > >                 case IO_UNHANDLED:
> > > > > > > > > >                     /* IO unhandled, try another way to
> > > > > > > > > > handle
> > > > > > > > > > it. */
> > > > > > > > > >                     break;
> > > > > > > > > >                 default:
> > > > > > > > > >                     ASSERT_UNREACHABLE();
> > > > > > > > > >                 }
> > > > > > > > > > 
> > > > > > > > > > Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
> > > > > > > > > > handle_hvm_io_completion() after QEMU completes the
> > > > > > > > > > emulation.
> > > > > > > > > > Today,
> > > > > > > > > > handle_mmio just sets the user register with the read value.
> > > > > > > > > > 
> > > > > > > > > > But it would be better if it called again the original
> > > > > > > > > > function
> > > > > > > > > > do_trap_stage2_abort_guest to actually retry the original
> > > > > > > > > > operation.
> > > > > > > > > > This time do_trap_stage2_abort_guest calls try_handle_mmio()
> > > > > > > > > > and
> > > > > > > > > > gets
> > > > > > > > > > IO_HANDLED instead of IO_RETRY,
> > > > > > > > > I may miss some important point, but I failed to see why
> > > > > > > > > try_handle_mmio
> > > > > > > > > (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at
> > > > > > > > > this
> > > > > > > > > stage.
> > > > > > > > > Or current try_fwd_ioserv() logic needs rework?
> > > > > > > > I think you should check the ioreq->state in try_fwd_ioserv(),
> > > > > > > > if
> > > > > > > > the
> > > > > > > > result is ready, then ioreq->state should be STATE_IORESP_READY,
> > > > > > > > and
> > > > > > > > you
> > > > > > > > can return IO_HANDLED.
> > > > > > I optimized test patch a bit (now it looks much simpler). I didn't
> > > > > > face
> > > > > > any
> > > > > > issues during a quick test.
> > > > > Both patches get much closer to following the proper state machine,
> > > > > great! I think this patch is certainly a good improvement. I think the
> > > > > other patch you sent earlier, slightly larger, is even better. It
> > > > > makes
> > > > > the following additional changes that would be good to have:
> > > > > 
> > > > > - try_fwd_ioserv returns IO_HANDLED on state == STATE_IORESP_READY
> > > > > - handle_mmio simply calls do_trap_stage2_abort_guest
> > > > I don't think we should call do_trap_stage2_abort_guest() as part of the
> > > > completion because:
> > > >      * The function do_trap_stage2_abort_guest() is using registers that
> > > > are
> > > > not context switched (such as FAR_EL2). I/O handling is split in two
> > > > with
> > > > likely a context switch in the middle. The second part is the completion
> > > > (i.e call to handle_mmio()). So the system registers will be incorrect.
> > > >      * A big chunk of do_trap_stage2_abort_guest() is not necessary for
> > > > the
> > > > completion. For instance, there is no need to try to translate the guest
> > > > virtual address to a guest physical address.
> > > > 
> > > > Therefore the version below is probably the best approach.
> > > 
> > > Indeed, the first version (with calling do_trap_stage2_abort_guest() for a
> > > completion) is a racy. When testing it more heavily I faced an issue
> > > (sometimes) which resulted in DomU got stuck completely.
> > > 
> > > (XEN) d2v1: vGICD: bad read width 0 r11 offset 0x000f00
> > > 
> > > I didn't investigate an issue in detail, but I assumed that code in
> > > do_trap_stage2_abort_guest() caused that. This was the main reason why I
> > > decided to optimize an initial patch (and took only advance_pc).
> > > Reading Julien's answer I understand now what could happen.
> >  From your and Julien's feedback it is clear that calling
> > do_trap_stage2_abort_guest() is not possible and not a good idea.
> > 
> > 
> > The reason for my suggestion was to complete the implementation of the
> > state machine so that "RETRY" actually means "let's try again the
> > emulation" but the second time it will return "HANDLED".
> > 
> > Looking at this again, we could achieve the same goal in a better way by
> > moving the register setting from "handle_mmio" to "try_handle_mmio" and
> > also calling "try_handle_mmio" from "handle_mmio". Note that handle_mmio
> > would become almost empty like on x86.
> > 
> > 1) do_trap_stage2_abort_guest ->
> >         try_handle_mmio ->
> >              try_fwd_ioserv ->
> >                  IO_RETRY
> > 
> > 2) handle_hvm_io_completion ->
> >         handle_mmio ->
> >             try_handle_mmio ->
> >                 try_fwd_ioserv ->
> >                     IO_HANDLED
> > 
> > 
> > It is very similar to your second patch with a small change on calling
> > try_handle_mmio from handle_mmio and setting the register there. Do you
> > think that would work?
> If I understood correctly what you had suggested and properly implemented then
> it works, at least I didn't face any issues during testing.
> I think this variant adds some extra operations comparing to the previous one
> (for example an attempt to find a mmio handler at try_handle_mmio). But, if
> you think new variant is cleaner and better represents how the state machine
> should look like, I would be absolutely OK to take this variant for non-RFC
> series. Please note, there was a request to move try_fwd_ioserv() to
> arm/ioreq.c (I am going to move new handle_ioserv() as well).
 
Yes, I think this version better represents the state machine, thanks
for looking into it. I think it is good.

In terms of number of operations, it doesn't look very concerning (in
the sense that it doesn't seem to add that many ops.) However we could
maybe improve it by passing a reference to the right mmio handler from
handle_mmio to try_handle_mmio if we have it. Or maybe we could save a
reference to the mmio handler as part of v->arch.hvm.hvm_io.io_req.

In any case, I think it is fine.

 
> ---
>  xen/arch/arm/io.c    | 47 +++++++++++++++++++++++++++++++++++++++++++----
>  xen/arch/arm/ioreq.c | 38 +++++++-------------------------------
>  xen/arch/arm/traps.c |  4 +++-
>  3 files changed, 53 insertions(+), 36 deletions(-)
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 436f669..4db7c55 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -109,6 +109,43 @@ static const struct mmio_handler
> *find_mmio_handler(struct domain *d,
>  }
> 
>  #ifdef CONFIG_IOREQ_SERVER
> +static enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu
> *v)
> +{
> +    const union hsr hsr = { .bits = regs->hsr };
> +    const struct hsr_dabt dabt = hsr.dabt;
> +    /* Code is similar to handle_read */
> +    uint8_t size = (1 << dabt.size) * 8;
> +    register_t r = v->arch.hvm.hvm_io.io_req.data;
> +
> +    /* We are done with the IO */
> +    /* XXX: Is it the right place? */
> +    v->arch.hvm.hvm_io.io_req.state = STATE_IOREQ_NONE;
> +
> +    /* XXX: Do we need to take care of write here ? */
> +    if ( dabt.write )
> +        return IO_HANDLED;
> +
> +    /*
> +     * Sign extend if required.
> +     * Note that we expect the read handler to have zeroed the bits
> +     * outside the requested access size.
> +     */
> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
> +    {
> +        /*
> +         * We are relying on register_t using the same as
> +         * an unsigned long in order to keep the 32-bit assembly
> +         * code smaller.
> +         */
> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
> +        r |= (~0UL) << size;
> +    }
> +
> +    set_user_reg(regs, dabt.reg, r);
> +
> +    return IO_HANDLED;
> +}
> +
>  static enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>                                      struct vcpu *v, mmio_info_t *info)
>  {
> @@ -130,6 +167,10 @@ static enum io_state try_fwd_ioserv(struct cpu_user_regs
> *regs,
>      {
>      case STATE_IOREQ_NONE:
>          break;
> +
> +    case STATE_IORESP_READY:
> +        return IO_HANDLED;
> +
>      default:
>          printk("d%u wrong state %u\n", v->domain->domain_id,
>                 vio->io_req.state);
> @@ -156,10 +197,6 @@ static enum io_state try_fwd_ioserv(struct cpu_user_regs
> *regs,
>      else
>          vio->io_completion = HVMIO_mmio_completion;
> 
> -    /* XXX: Decide what to do */
> -    if ( rc == IO_RETRY )
> -        rc = IO_HANDLED;
> -
>      return rc;
>  }
>  #endif
> @@ -185,6 +222,8 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> 
>  #ifdef CONFIG_IOREQ_SERVER
>          rc = try_fwd_ioserv(regs, v, &info);
> +        if ( rc == IO_HANDLED )
> +            return handle_ioserv(regs, v);
>  #endif
> 
>          return rc;
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 8f60c41..9068b8d 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -33,46 +33,22 @@
>  #include <public/hvm/dm_op.h>
>  #include <public/hvm/ioreq.h>
> 
> +#include <asm/traps.h>
> +
>  bool handle_mmio(void)
>  {
>      struct vcpu *v = current;
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      const union hsr hsr = { .bits = regs->hsr };
> -    const struct hsr_dabt dabt = hsr.dabt;
> -    /* Code is similar to handle_read */
> -    uint8_t size = (1 << dabt.size) * 8;
> -    register_t r = v->arch.hvm.hvm_io.io_req.data;
> -
> -    /* We should only be here on Guest Data Abort */
> -    ASSERT(dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> +    paddr_t addr = v->arch.hvm.hvm_io.io_req.addr;
> 
> -    /* We are done with the IO */
> -    /* XXX: Is it the right place? */
> -    v->arch.hvm.hvm_io.io_req.state = STATE_IOREQ_NONE;
> -
> -    /* XXX: Do we need to take care of write here ? */
> -    if ( dabt.write )
> -        return true;
> -
> -    /*
> -     * Sign extend if required.
> -     * Note that we expect the read handler to have zeroed the bits
> -     * outside the requested access size.
> -     */
> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
> +    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
>      {
> -        /*
> -         * We are relying on register_t using the same as
> -         * an unsigned long in order to keep the 32-bit assembly
> -         * code smaller.
> -         */
> -        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
> -        r |= (~0UL) << size;
> +        advance_pc(regs, hsr);
> +        return true;
>      }
> 
> -    set_user_reg(regs, dabt.reg, r);
> -
> -    return true;
> +    return false;
>  }
> 
>  /* Ask ioemu mapcache to invalidate mappings. */
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
> -- 
> 2.7.4
> 
> 
> 
> -- 
> Regards,
> 
> Oleksandr Tyshchenko
> 
--8323329-1894020823-1597259830=:15669--

