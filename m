Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946182FC61A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 01:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71162.127257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l21i9-0000j2-0t; Wed, 20 Jan 2021 00:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71162.127257; Wed, 20 Jan 2021 00:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l21i8-0000if-U4; Wed, 20 Jan 2021 00:51:00 +0000
Received: by outflank-mailman (input) for mailman id 71162;
 Wed, 20 Jan 2021 00:50:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l21i7-0000ia-HY
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 00:50:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e11dfcbd-02a5-4953-b10a-372c6cde7569;
 Wed, 20 Jan 2021 00:50:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB3C523108;
 Wed, 20 Jan 2021 00:50:57 +0000 (UTC)
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
X-Inumbo-ID: e11dfcbd-02a5-4953-b10a-372c6cde7569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611103858;
	bh=6k8MlF333mXXPUOYjfv3nFd/cs5OFSEJEzCDmbCyIO4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kcuo042Na9mA/fmzJEnRicu1vR9Rox29zVVDz0PQPzsgNBlXb97257K1XdmeTjAzK
	 i51bbtseYqRiuZ5gfuL+8QlEu/gLeH1TJbw5GtJIQB5T2fU6ZOG6o0iMLZNs693/se
	 1htn2P9WAc0LaCWYqRenqpIuXO+t6Xg8WSp4E/RW8MXx0rfhfHFr0+WYgGEqe+Kqp9
	 xtQnm0uTeehiF4u60hL4sif8p/2N/lOdf+bUsmI+Wl4fxaPDxkeqOhUGmLsASe42AW
	 Sv0EFO8u/UskcTH/LPjjyXP+6a40Zqx/C4T7ef+94D6ZV6psQ1VrjBeYt5OKjdHkop
	 IkAkbOnTF4lfg==
Date: Tue, 19 Jan 2021 16:50:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
In-Reply-To: <a7b26b16-cdec-3734-284e-a907e3cc356c@gmail.com>
Message-ID: <alpine.DEB.2.21.2101191626560.14528@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-15-git-send-email-olekstysh@gmail.com> <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org> <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com> <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com> <b79b07eb-02db-16bb-2d8b-a55b0c355dbb@xen.org> <a7b26b16-cdec-3734-284e-a907e3cc356c@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-44906125-1611102555=:14528"
Content-ID: <alpine.DEB.2.21.2101191633510.14528@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-44906125-1611102555=:14528
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2101191633511.14528@sstabellini-ThinkPad-T480s>

On Tue, 19 Jan 2021, Oleksandr wrote:
> > > > > > >       PROGRESS(xen):
> > > > > > >           ret = relinquish_memory(d, &d->xenpage_list);
> > > > > > >           if ( ret )
> > > > > > > diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> > > > > > > index ae7ef96..9814481 100644
> > > > > > > --- a/xen/arch/arm/io.c
> > > > > > > +++ b/xen/arch/arm/io.c
> > > > > > > @@ -16,6 +16,7 @@
> > > > > > >    * GNU General Public License for more details.
> > > > > > >    */
> > > > > > >   +#include <xen/ioreq.h>
> > > > > > >   #include <xen/lib.h>
> > > > > > >   #include <xen/spinlock.h>
> > > > > > >   #include <xen/sched.h>
> > > > > > > @@ -23,6 +24,7 @@
> > > > > > >   #include <asm/cpuerrata.h>
> > > > > > >   #include <asm/current.h>
> > > > > > >   #include <asm/mmio.h>
> > > > > > > +#include <asm/hvm/ioreq.h>
> > > > > > 
> > > > > > Shouldn't this have been included by "xen/ioreq.h"?
> > > > > Well, for V1 asm/hvm/ioreq.h was included by xen/ioreq.h. But, it
> > > > > turned out that there was nothing inside common header required arch
> > > > > one to be included and
> > > > > I was asked to include arch header where it was indeed needed (several
> > > > > *.c files).
> > > > 
> > > > Fair enough.
> > > > 
> > > > [...]
> > > > 
> > > > > > 
> > > > > > If you return IO_HANDLED here, then it means the we will take care
> > > > > > of previous I/O but the current one is going to be ignored. 
> > > > > Which current one? As I understand, if try_fwd_ioserv() gets called
> > > > > with vio->req.state == STATE_IORESP_READY then this is a second round
> > > > > after emulator completes the emulation (the first round was when
> > > > > we returned IO_RETRY down the function and claimed that we would need
> > > > > a completion), so we are still dealing with previous I/O.
> > > > > vcpu_ioreq_handle_completion() -> arch_ioreq_complete_mmio() ->
> > > > > try_handle_mmio() -> try_fwd_ioserv() -> handle_ioserv()
> > > > > And after we return IO_HANDLED here, handle_ioserv() will be called to
> > > > > complete the handling of this previous I/O emulation.
> > > > > Or I really missed something?
> > > > 
> > > > Hmmm... I somehow thought try_fw_ioserv() would only be called the first
> > > > time. Do you have a branch with your code applied? This would help to
> > > > follow the different paths.
> > > Yes, I mentioned about it in cover letter.
> > > 
> > > Please see
> > > https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml5
> > > why 5 - because I started counting from the RFC)
> > 
> > Oh, I looked at the cover letter and didn't find it. Hence why I asked. I
> > should have looked more carefully. Thanks!
> > 
> > I have looked closer at the question and I am not sure to understand why
> > arch_ioreq_complete_mmio() is going to call try_handle_mmio().
> > 
> > This looks pretty innefficient to me because we already now the IO was
> > handled by the IOREQ server.
> > 
> > I realize that x86 is calling handle_mmio() again. However, I don't think we
> > need the same on Arm because the instruction for accessing device memory are
> > a lot simpler (you can only read or store at most a 64-bit value).
> 
> I think, I agree.

Yes I agree too


> > So I would like to keep our emulation simple and not rely on try_ioserv_fw()
> > to always return true when call from completion (AFAICT it is not possible
> > to return false then).
> 
> 
> So what you are proposing is just a replacement try_ioserv_fw() by
> handle_ioserv() technically?
> 
> 
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 40b9e59..0508bd8 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -101,12 +101,10 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> 
>  bool arch_ioreq_complete_mmio(void)
>  {
> -    struct vcpu *v = current;
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      const union hsr hsr = { .bits = regs->hsr };
> -    paddr_t addr = v->io.req.addr;
> 
> -    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
> +    if ( handle_ioserv(regs, current) == IO_HANDLED )
>      {
>          advance_pc(regs, hsr);
>          return true;

Yes, but I think we want to keep the check

    vio->req.state == STATE_IORESP_READY

So maybe (uncompiled, untested):

    if ( v->io.req.state != STATE_IORESP_READY )
        return false;

    if ( handle_ioserv(regs, current) == IO_HANDLED )
    {
        advance_pc(regs, hsr);
        return true;
    }
--8323329-44906125-1611102555=:14528--

