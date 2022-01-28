Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F64A01CB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 21:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262137.454260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDXml-0002Ob-Te; Fri, 28 Jan 2022 20:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262137.454260; Fri, 28 Jan 2022 20:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDXml-0002ML-P8; Fri, 28 Jan 2022 20:23:55 +0000
Received: by outflank-mailman (input) for mailman id 262137;
 Fri, 28 Jan 2022 20:23:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wh6+=SM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nDXmk-0002MF-MM
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 20:23:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34d88280-8078-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 21:23:52 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CEA861DE6;
 Fri, 28 Jan 2022 20:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB32C340E7;
 Fri, 28 Jan 2022 20:23:50 +0000 (UTC)
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
X-Inumbo-ID: 34d88280-8078-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643401430;
	bh=h2p3P8tCDfqYzUJeQVQQvYaqzrKqILqYev3vTMM8wdk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DguDyx4Xns10ui98AznNlveuy5rwtql+ns7OV9vfuR4owdaHcE/UzQWXPSe4EA0X7
	 R4jV0d0bMCcpstq+4NkzTpcJwAtPZfkoU1m+qm9PHvQGxghSYXHwwcMmQ27RDpeBTT
	 qGt+fXo6FFbJL0mEdri520DqC31XBngWeBreBvDhfEvUIvtqQhrhl5jKKDx5joSIec
	 w7HUkdCaEi6EvcQFmdjx+/aaoL+8H7toRCYSTYaOaOfmChb8CZOxxYSbQP88uoL0DI
	 ZGXCdn6wcBTAQpDtAG6TGM0kQmwHEloSyexTzQlvaj89jcE790PaT0+3TMky7B1Q9u
	 1BkLRLK0WFF3Q==
Date: Fri, 28 Jan 2022 12:23:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien.grall.oss@gmail.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, stefanos@xilinx.com, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching
 for a MMIO handler
In-Reply-To: <9880cf7c-962f-8a32-483c-2bf5889d3273@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201281216130.27308@ubuntu-linux-20-04-desktop>
References: <20220126165827.61168-1-ayankuma@xilinx.com> <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com> <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com> <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com> <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org> <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com> <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org> <alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2Sp6w0b21p96YHx4w_m0jAbYJ4v=cVar-1nPeL7SotZw@mail.gmail.com> <CAJ=z9a1HML30aGn52GY34g-QbvLPHep7j=H-UDxsH1+B0CEb3Q@mail.gmail.com> <alpine.DEB.2.22.394.2201271513330.27308@ubuntu-linux-20-04-desktop> <9880cf7c-962f-8a32-483c-2bf5889d3273@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Jan 2022, Julien Grall wrote:
> On 28/01/2022 01:20, Stefano Stabellini wrote:
> > On Thu, 27 Jan 2022, Julien Grall wrote:
> > > On Thu, 27 Jan 2022 at 23:05, Julien Grall <julien.grall.oss@gmail.com>
> > > wrote:
> > > > 
> > > > On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini
> > > > <sstabellini@kernel.org> wrote:
> > > > > I am with you on both points.
> > > > > 
> > > > > One thing I noticed is that the code today is not able to deal with
> > > > > IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
> > > > > emulator handlers. p2m_resolve_translation_fault and try_map_mmio are
> > > > > called after try_handle_mmio returns IO_UNHANDLED but try_handle_mmio
> > > > > is
> > > > > not called a second time (or am I mistaken?)
> > > > 
> > > > Why would you need it? If try_mmio_fault() doesn't work the first time,
> > > > then
> > > 
> > > Sorry I meant try_handle_mmio().
> > > 
> > > > it will not work the second it.
> > 
> > I think I explained myself badly, I'll try again below.
> > 
> > 
> > > > > Another thing I noticed is that currently find_mmio_handler and
> > > > > try_fwd_ioserv expect dabt to be already populated and valid so it
> > > > > would
> > > > > be better if we could get there only when dabt.valid.
> > > > > 
> > > > > With these two things in mind, I think maybe the best thing to do is
> > > > > to
> > > > > change the code in do_trap_stage2_abort_guest slightly so that
> > > > > p2m_resolve_translation_fault and try_map_mmio are called first when
> > > > > !dabt.valid.
> > > > 
> > > > An abort will mostly likely happen because of emulated I/O. If we call
> > > > p2m_resolve_translation_fault() and try_map_mmio() first, then it means
> > > > the processing will take longer than necessary for the common case.
> > > > 
> > > > So I think we want to keep the order as it is. I.e first trying the MMIO
> > > > and then falling back to the less likely reason for a trap.
> > 
> > Yeah I thought about it as well. The idea would be that if dabt.valid is
> > set then we leave things as they are (we call try_handle_mmio first) but
> > if dabt.valid is not set (it is not valid) then we skip the
> > try_handle_mmio() call because it wouldn't succeed anyway and go
> > directly to p2m_resolve_translation_fault() and try_map_mmio().
> > 
> > If either of them work (also reading what you wrote about it) then we
> > return immediately.
> 
> Ok. So the assumption is data abort with invalid syndrome would mostly likely
> be because of a fault handled by p2m_resolve_translation_fault().
> 
> I think this makes sense. However, I am not convinced we can currently safely
> call try_map_mmio() before try_handle_mmio(). This is because the logic in
> try_map_mmio() is quite fragile and we may mistakenly map an emulated region.
> 
> Similarly, we can't call try_map_mmio() before p2m_resolve_translation_fault()
> because a transient fault may be
> misinterpreted.
> 
> I think we may be able to harden try_map_mmio() by checking if the I/O region
> is emulated. But this will need to be fully thought through first.

That's a good point. I wonder if it could be as simple as making sure
that iomem_access_permitted returns false for all emulated regions?
Looking at the code, it looks like it is already the case today. Is that
right?


> > If not, then we call decode_instruction from do_trap_stage2_abort_guest
> > and try again. The second time dabt.valid is set so we end up calling
> > try_handle_mmio() as usual.
> 
> With the approach below, you will also end up to call
> p2m_resolve_translation_fault() and try_map_mmio() a second time if
> try_handle_mmio() fails.
 
Yeah... we can find a way to avoid it.

