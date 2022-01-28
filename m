Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC9B4A01F4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 21:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262141.454271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDXsl-0003ja-I4; Fri, 28 Jan 2022 20:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262141.454271; Fri, 28 Jan 2022 20:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDXsl-0003hr-EH; Fri, 28 Jan 2022 20:30:07 +0000
Received: by outflank-mailman (input) for mailman id 262141;
 Fri, 28 Jan 2022 20:30:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wh6+=SM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nDXsk-0003dh-1v
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 20:30:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 120d823b-8079-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 21:30:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD72A61DE6;
 Fri, 28 Jan 2022 20:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E781CC340E7;
 Fri, 28 Jan 2022 20:30:00 +0000 (UTC)
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
X-Inumbo-ID: 120d823b-8079-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643401801;
	bh=RKV20mcs0YQ9ZC7KBpf+XAcxdeRT8EKhtQvq5kUUK+8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sbGLy2nKEEIhkv54P/gr8hp4m3phf1ze92FAdZEfCI16D+QmArj3V5+rrKYa0Pd40
	 wBWeqJrjs+S7UhNrG8Ujg/6bIRA4O2HoIUrJsopuv1uPLKyct36YL68xSxkxzVHfv0
	 Dc9HP5eETeKN+JipfQHH+FakgFXxviX2LNs9rGZOlZHY1hZqAfiDQs04yNedm3Dcb+
	 4dI+sSKLVp3LPt07CZGAMqVAl9zpRLB88pRxwhdC5FRiGKqAUJQmLSILQwE9vS1Je7
	 mbU7h2t+U95ny/mKnIRL/mU3eZ2sxOujXO9DOJXxVq+8q2auJrX51LRGOnqDKZG+XA
	 WZR8jSG7q1WmA==
Date: Fri, 28 Jan 2022 12:30:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien.grall.oss@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, stefanos@xilinx.com, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching
 for a MMIO handler
In-Reply-To: <95944225-6642-b41c-c496-d735826e3c93@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2201281224230.27308@ubuntu-linux-20-04-desktop>
References: <20220126165827.61168-1-ayankuma@xilinx.com> <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com> <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com> <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com> <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org> <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com> <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org> <alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2Sp6w0b21p96YHx4w_m0jAbYJ4v=cVar-1nPeL7SotZw@mail.gmail.com> <CAJ=z9a1HML30aGn52GY34g-QbvLPHep7j=H-UDxsH1+B0CEb3Q@mail.gmail.com> <alpine.DEB.2.22.394.2201271513330.27308@ubuntu-linux-20-04-desktop> <9880cf7c-962f-8a32-483c-2bf5889d3273@xen.org>
 <95944225-6642-b41c-c496-d735826e3c93@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-140742879-1643401618=:27308"
Content-ID: <alpine.DEB.2.22.394.2201281227040.27308@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-140742879-1643401618=:27308
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2201281227041.27308@ubuntu-linux-20-04-desktop>

On Fri, 28 Jan 2022, Ayan Kumar Halder wrote:
> Hi Julien/Stefano,
> 
> Good discussion to learn about Xen (from a newbie's perspective). :)
> 
> I am trying to clarify my understanding. Some queries as below :-
> 
> On 28/01/2022 09:46, Julien Grall wrote:
> > 
> > 
> > On 28/01/2022 01:20, Stefano Stabellini wrote:
> > > On Thu, 27 Jan 2022, Julien Grall wrote:
> > > > On Thu, 27 Jan 2022 at 23:05, Julien Grall <julien.grall.oss@gmail.com>
> > > > wrote:
> > > > > 
> > > > > On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini
> > > > > <sstabellini@kernel.org> wrote:
> > > > > > I am with you on both points.
> > > > > > 
> > > > > > One thing I noticed is that the code today is not able to deal with
> > > > > > IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
> > > > > > emulator handlers. p2m_resolve_translation_fault and try_map_mmio
> > > > > > are
> > > > > > called after try_handle_mmio returns IO_UNHANDLED but
> > > > > > try_handle_mmio is
> > > > > > not called a second time (or am I mistaken?)
> > > > > 
> > > > > Why would you need it? If try_mmio_fault() doesn't work the first
> > > > > time, then
> > > > 
> > > > Sorry I meant try_handle_mmio().
> > > > 
> > > > > it will not work the second it.
> > > 
> > > I think I explained myself badly, I'll try again below.
> > > 
> > > 
> > > > > > Another thing I noticed is that currently find_mmio_handler and
> > > > > > try_fwd_ioserv expect dabt to be already populated and valid so it
> > > > > > would
> > > > > > be better if we could get there only when dabt.valid.
> > > > > > 
> > > > > > With these two things in mind, I think maybe the best thing to do is
> > > > > > to
> > > > > > change the code in do_trap_stage2_abort_guest slightly so that
> > > > > > p2m_resolve_translation_fault and try_map_mmio are called first when
> > > > > > !dabt.valid.
> > > > > 
> > > > > An abort will mostly likely happen because of emulated I/O. If we call
> > > > > p2m_resolve_translation_fault() and try_map_mmio() first, then it
> > > > > means
> > > > > the processing will take longer than necessary for the common case.
> > > > > 
> > > > > So I think we want to keep the order as it is. I.e first trying the
> > > > > MMIO
> > > > > and then falling back to the less likely reason for a trap.
> > > 
> > > Yeah I thought about it as well. The idea would be that if dabt.valid is
> > > set then we leave things as they are (we call try_handle_mmio first) but
> > > if dabt.valid is not set (it is not valid) then we skip the
> > > try_handle_mmio() call because it wouldn't succeed anyway and go
> > > directly to p2m_resolve_translation_fault() and try_map_mmio().
> > > 
> > > If either of them work (also reading what you wrote about it) then we
> > > return immediately.
> > 
> > Ok. So the assumption is data abort with invalid syndrome would mostly
> > likely be because of a fault handled by p2m_resolve_translation_fault().
> > 
> > I think this makes sense. However, I am not convinced we can currently
> > safely call try_map_mmio() before try_handle_mmio(). This is because the
> > logic in try_map_mmio() is quite fragile and we may mistakenly map an
> > emulated region.
> 
> By emulated region, you mean vgic.dbase (Refer
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/vgic-v2.c;h=589c033eda8f5e11af33c868eae2c159f985eac9;hb=0bdc43c8dec993258e930b34855853c22b917519#l702,
> which has not been mapped to the guest) and thus requires an MMIO handler.
> 
> Is my understanding correcr ?
 
I'll try to answer for Julien but yes.


> If so, can Xen mantain a table of such emulated regions ? I am guessing that
> all emulated regions will have a mmio_handler. Then, before invoking
> try_map_mmio(), it can check the table.

Today we keep those as a list, see find_mmio_handler (for regions
emulated in Xen) and also ioreq_server_select (for regions emulated by
QEMU or other external emulators.)

But I think there might be a simpler way: if you look at try_map_mmio,
you'll notice that there is iomem_access_permitted check. I don't think
that check can succeed for an emulated region. (I'd love for Julien and
others to confirm this observation though.)

 
> > Similarly, we can't call try_map_mmio() before
> > p2m_resolve_translation_fault() because a transient fault may be
> > misinterpreted.
> > 
> > I think we may be able to harden try_map_mmio() by checking if the I/O
> > region is emulated. But this will need to be fully thought through first.
> > 
> > > 
> > > If not, then we call decode_instruction from do_trap_stage2_abort_guest
> > > and try again. The second time dabt.valid is set so we end up calling
> > > try_handle_mmio() as usual.
> > 
> > With the approach below, you will also end up to call
> > p2m_resolve_translation_fault() and try_map_mmio() a second time if
> > try_handle_mmio() fails.
> > 
> > > 
> > > Just for clarity let me copy/paste the relevant code, apologies if it
> > > was already obvious to you -- I got the impression my suggestion wasn't
> > > very clear.
> > > 
> > > 
> > > 
> > > +again:
> > > +        if ( is_data && hsr.dabt.valid )
> > >          {
> > >              enum io_state state = try_handle_mmio(regs, hsr, gpa);
> > > 
> > >              switch ( state )
> > >              {
> > >              case IO_ABORT:
> > >                  goto inject_abt;
> > >              case IO_HANDLED:
> > >                  advance_pc(regs, hsr);
> > >                  return;
> > >              case IO_RETRY:
> > >                  /* finish later */
> > >                  return;
> > >              case IO_UNHANDLED:
> > >                  /* IO unhandled, try another way to handle it. */
> > >                  break;
> > >              }
> > >          }
> > > 
> > >          /*
> > >           * First check if the translation fault can be resolved by the
> > >           * P2M subsystem. If that's the case nothing else to do.
> > >           */
> > >          if ( p2m_resolve_translation_fault(current->domain,
> > >                                             gaddr_to_gfn(gpa)) )
> > >              return;
> > > 
> > >          if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
> > >              return;
> > > 
> > > +        if ( !hsr.dabt.valid )
> > One more thing I noticed, a stage 2 fault can also happen on an access made
> > for a stage 1 translation walk. In this case, I think we don't want to
> > decode the instruction.
> > 
> > So this would need to be !hsr.dabt.valid && !hsr.dabt.s1ptw. Depending on
> > which patch we go with, this would also need to be adjusted in the other one
> > as well.
> 
> This triggered me to check for the remaining bits as well. Refer DDI 0487G.b
> Armv8 Arm, "ISS encoding for an exception from a Data Abort", Page D13-3219
> 
> I guess we need to check the following :-
> 
> 1. !hsr.dabt.valid
> 
> 2. !hsr.dabt.s1ptw - Abort may be due to stage 1 translation table walk
> 
> 3. !hsr.dabt.cache - Abort is due to cache maintenance or address translation
> instructions. We do not decode these instructions.
> 
> 4. !hsr.dabt.eat - Abort is external

Yes, makes sense to me

 
> There is no need to check the following due to the reasons mentioned :-
> 
> 1. hsr.dabt.dfsc - no need as we have already determined that it is a
> translation fault from EL0/EL1.
> 
> 2. hsr.dabt.write - no need as the fault can be caused due to both read or
> write
> 
> 3. hsr.dabt.fnv - no use for this in instruction decoding

These also makes sense to me


> 4. hsr.dabt.sbzp0 - Bits[12:11] - We know that DFSC cannot be 0b010000
> (FEAT_RAS), We may not check for FEAT_LS64 as from the instruction opcode, we
> can make out that it is not ST64BV, LD64B, ST64B or ST64BV0
> 
>                          Bit[13] - VCNR - The instruction opcode will tell us
> that it is not MRS/MSR instruction.

Yeah this check could be useful in the future but it would be redundant
at the moment. I am fine either way, I'll let other comment.

--8323329-140742879-1643401618=:27308--

