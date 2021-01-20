Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7AC2FDA01
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 20:48:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71726.128689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2JSU-00014J-8c; Wed, 20 Jan 2021 19:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71726.128689; Wed, 20 Jan 2021 19:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2JSU-00013u-5A; Wed, 20 Jan 2021 19:48:02 +0000
Received: by outflank-mailman (input) for mailman id 71726;
 Wed, 20 Jan 2021 19:48:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l2JSS-00013p-Pm
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 19:48:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f2b9aff-3010-415b-b879-93092415cf85;
 Wed, 20 Jan 2021 19:47:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D5C32343E;
 Wed, 20 Jan 2021 19:47:58 +0000 (UTC)
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
X-Inumbo-ID: 7f2b9aff-3010-415b-b879-93092415cf85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611172078;
	bh=Uylvc275ckLCMUtxiOO1wRpc255HDTMXtSu+n3eBEqE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d9fPP0m7nmgaT1yz+k4uyMR1M6DwVvUsUpa6NBKCKfnusrrzvO6s/yeZTn1C2EELp
	 Yxvlcjf7J7JBmj4r322C4NIxUZ5ClzU5wZy0GPZji9VsWywta5F382NbbnTPOy4VZR
	 67VCziW+h+ATo5UYJYiNgz9/FctOlwSQP6RDs9WhVn0DhIKCXKzVBALRwxfSww+GVd
	 0aUJQ/beatukiqVkGAkRgvEV2axtAsyqjq2Ue4pQrxe4GDXL4NAbMJvdhNk3vuV3Lo
	 dHhDFXIS5P5lSVv2gPcWG7P8ZdFC5+8N/fIuinc4F9SeF1cU+F4FpQAL+bgVvnEdlw
	 NE6Wld2ULSFGw==
Date: Wed, 20 Jan 2021 11:47:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
    Julien Grall <julien.grall@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
In-Reply-To: <9c12c1a7-81e3-20e9-7419-a625f23e4c27@xen.org>
Message-ID: <alpine.DEB.2.21.2101201147100.14528@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-15-git-send-email-olekstysh@gmail.com> <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org> <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com> <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com> <b79b07eb-02db-16bb-2d8b-a55b0c355dbb@xen.org> <a7b26b16-cdec-3734-284e-a907e3cc356c@gmail.com> <alpine.DEB.2.21.2101191626560.14528@sstabellini-ThinkPad-T480s>
 <9c12c1a7-81e3-20e9-7419-a625f23e4c27@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1388229174-1611172078=:14528"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1388229174-1611172078=:14528
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 20 Jan 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 20/01/2021 00:50, Stefano Stabellini wrote:
> > On Tue, 19 Jan 2021, Oleksandr wrote:
> > > diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> > > index 40b9e59..0508bd8 100644
> > > --- a/xen/arch/arm/ioreq.c
> > > +++ b/xen/arch/arm/ioreq.c
> > > @@ -101,12 +101,10 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs
> > > *regs,
> > > 
> > >   bool arch_ioreq_complete_mmio(void)
> > >   {
> > > -    struct vcpu *v = current;
> > >       struct cpu_user_regs *regs = guest_cpu_user_regs();
> > >       const union hsr hsr = { .bits = regs->hsr };
> > > -    paddr_t addr = v->io.req.addr;
> > > 
> > > -    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
> > > +    if ( handle_ioserv(regs, current) == IO_HANDLED )
> > >       {
> > >           advance_pc(regs, hsr);
> > >           return true;
> > 
> > Yes, but I think we want to keep the check
> > 
> >      vio->req.state == STATE_IORESP_READY
> > 
> > So maybe (uncompiled, untested):
> > 
> >      if ( v->io.req.state != STATE_IORESP_READY )
> >          return false;
> 
> Is it possible to reach this function with v->io.req.state !=
> STATE_IORESP_READY? If not, then I would suggest to add an
> ASSERT_UNREACHABLE() before the return.

If I am reading the state machine right it should *not* be possible to
get here with v->io.req.state != STATE_IORESP_READY, so yes,
ASSERT_UNREACHABLE() would work.
--8323329-1388229174-1611172078=:14528--

