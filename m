Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB79E2FF75E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72470.130500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hb4-00076j-HX; Thu, 21 Jan 2021 21:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72470.130500; Thu, 21 Jan 2021 21:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hb4-00076K-EF; Thu, 21 Jan 2021 21:34:30 +0000
Received: by outflank-mailman (input) for mailman id 72470;
 Thu, 21 Jan 2021 21:34:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrjv=GY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l2hb3-00076F-9H
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:34:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3721b5b6-772e-48de-a5c9-5541648117ac;
 Thu, 21 Jan 2021 21:34:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D774B2064A;
 Thu, 21 Jan 2021 21:34:26 +0000 (UTC)
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
X-Inumbo-ID: 3721b5b6-772e-48de-a5c9-5541648117ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611264867;
	bh=NwN1GqszfSYuIJwgLKM+mAL1gqjygo5NF8XehLPBgdc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DmyMFQTIDAl61bbhjorS43SRnIdPUXQTVY8Eut6wrrbc0k5I5wjHOEHDTpKLFAdeU
	 QKKPunnKG/LFqeiNszZ13Go5KKuaUXqij6k2RFqULMvGghWC9uFF/4Fz1/N376oJj/
	 /QnwGrkTA1tTeBlQEtFc4wCWQBxv3ZaYKcYbE4+rTkkG1i8vmvn2HD3ntyXHaYC2my
	 oVbyEiXivxnslIAMu0q5Iif/6EydR99tzf+/Kj1rIFtUxhasgKpN7Gg39VCKQKsfSY
	 X3jBjYnLTGamGKgdSHqryR0374BsCEIP1sidnzsmWaXQJRwaAEi3MWRMfwAqtLU6Yh
	 qB/ALEW3wLZ8A==
Date: Thu, 21 Jan 2021 13:34:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
In-Reply-To: <4c682b4c-2deb-6d3a-fee1-588e36c89a93@gmail.com>
Message-ID: <alpine.DEB.2.21.2101211334010.30512@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-15-git-send-email-olekstysh@gmail.com> <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org> <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com> <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com> <b79b07eb-02db-16bb-2d8b-a55b0c355dbb@xen.org> <a7b26b16-cdec-3734-284e-a907e3cc356c@gmail.com> <alpine.DEB.2.21.2101191626560.14528@sstabellini-ThinkPad-T480s> <9c12c1a7-81e3-20e9-7419-a625f23e4c27@xen.org>
 <alpine.DEB.2.21.2101201147100.14528@sstabellini-ThinkPad-T480s> <4c682b4c-2deb-6d3a-fee1-588e36c89a93@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-462705362-1611264867=:30512"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-462705362-1611264867=:30512
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 21 Jan 2021, Oleksandr wrote:
> On 20.01.21 21:47, Stefano Stabellini wrote:
> > On Wed, 20 Jan 2021, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 20/01/2021 00:50, Stefano Stabellini wrote:
> > > > On Tue, 19 Jan 2021, Oleksandr wrote:
> > > > > diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> > > > > index 40b9e59..0508bd8 100644
> > > > > --- a/xen/arch/arm/ioreq.c
> > > > > +++ b/xen/arch/arm/ioreq.c
> > > > > @@ -101,12 +101,10 @@ enum io_state try_fwd_ioserv(struct
> > > > > cpu_user_regs
> > > > > *regs,
> > > > > 
> > > > >    bool arch_ioreq_complete_mmio(void)
> > > > >    {
> > > > > -    struct vcpu *v = current;
> > > > >        struct cpu_user_regs *regs = guest_cpu_user_regs();
> > > > >        const union hsr hsr = { .bits = regs->hsr };
> > > > > -    paddr_t addr = v->io.req.addr;
> > > > > 
> > > > > -    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
> > > > > +    if ( handle_ioserv(regs, current) == IO_HANDLED )
> > > > >        {
> > > > >            advance_pc(regs, hsr);
> > > > >            return true;
> > > > Yes, but I think we want to keep the check
> > > > 
> > > >       vio->req.state == STATE_IORESP_READY
> > > > 
> > > > So maybe (uncompiled, untested):
> > > > 
> > > >       if ( v->io.req.state != STATE_IORESP_READY )
> > > >           return false;
> > > Is it possible to reach this function with v->io.req.state !=
> > > STATE_IORESP_READY? If not, then I would suggest to add an
> > > ASSERT_UNREACHABLE() before the return.
> > If I am reading the state machine right it should *not* be possible to
> > get here with v->io.req.state != STATE_IORESP_READY, so yes,
> > ASSERT_UNREACHABLE() would work.
> Agree here. If the assumption is not correct (unlikely), I think I will catch
> this during testing.
> In addition, we can probably drop case STATE_IORESP_READY in try_fwd_ioserv().
> 
> 
> [not tested]

Yes, looks OK

 
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 40b9e59..c7ee1a7 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -71,9 +71,6 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>      case STATE_IOREQ_NONE:
>          break;
> 
> -    case STATE_IORESP_READY:
> -        return IO_HANDLED;
> -
>      default:
>          gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
>          return IO_ABORT;
> @@ -104,9 +101,14 @@ bool arch_ioreq_complete_mmio(void)
>      struct vcpu *v = current;
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      const union hsr hsr = { .bits = regs->hsr };
> -    paddr_t addr = v->io.req.addr;
> 
> -    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
> +    if ( v->io.req.state != STATE_IORESP_READY )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return false;
> +    }
> +
> +    if ( handle_ioserv(regs, v) == IO_HANDLED )
>      {
>          advance_pc(regs, hsr);
>          return true;
--8323329-462705362-1611264867=:30512--

