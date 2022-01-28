Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E59A49F076
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 02:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261813.453566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDFvs-0003yf-Sv; Fri, 28 Jan 2022 01:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261813.453566; Fri, 28 Jan 2022 01:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDFvs-0003vT-Pn; Fri, 28 Jan 2022 01:20:08 +0000
Received: by outflank-mailman (input) for mailman id 261813;
 Fri, 28 Jan 2022 01:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wh6+=SM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nDFvq-0003n7-Fl
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 01:20:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6badf8cb-7fd8-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 02:20:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 186EEB81998;
 Fri, 28 Jan 2022 01:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874B5C340E5;
 Fri, 28 Jan 2022 01:20:01 +0000 (UTC)
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
X-Inumbo-ID: 6badf8cb-7fd8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643332801;
	bh=xxpNVKIdYzaICyQ+EqVWA0iw9ASvPp4gk8AIVy6AaNs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W2DgZvnhWpaKofABkhdM8mBYzpWSW/6qYSZSZCl2V/F8LtOlMDUB4Z8wVmIcCLYG5
	 HSSOtGpgqTzzZpsHXCwbj2FvpBwOBKxkFykckLCalyWdIjbph3QfJ4yZTplkiJciPP
	 b+x67kJjMCMLITGYZ+yWVLKSBIqq4qd14/kW8n5eR3SbdPQ8zOfkNGeBrGFwpiJXA8
	 LvtDHWML3Vxqr/uq13ej3u1l8CPf+X+2Q6eS+ta6HrkBBWePtyKbIOT7rpMWSFhuwr
	 oG2dVOhMPASrc+CtWePhVAQiWMQyuY8q0Wb3Ir5Li1+YJqNEsewM5jdtqUMhxXJfWG
	 hQfYDc9hUFrLA==
Date: Thu, 27 Jan 2022 17:20:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, stefanos@xilinx.com, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching
 for a MMIO handler
In-Reply-To: <CAJ=z9a1HML30aGn52GY34g-QbvLPHep7j=H-UDxsH1+B0CEb3Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2201271513330.27308@ubuntu-linux-20-04-desktop>
References: <20220126165827.61168-1-ayankuma@xilinx.com> <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com> <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com> <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com> <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org> <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com> <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org> <alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2Sp6w0b21p96YHx4w_m0jAbYJ4v=cVar-1nPeL7SotZw@mail.gmail.com> <CAJ=z9a1HML30aGn52GY34g-QbvLPHep7j=H-UDxsH1+B0CEb3Q@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jan 2022, Julien Grall wrote:
> On Thu, 27 Jan 2022 at 23:05, Julien Grall <julien.grall.oss@gmail.com> wrote:
> >
> > On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > I am with you on both points.
> > >
> > > One thing I noticed is that the code today is not able to deal with
> > > IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
> > > emulator handlers. p2m_resolve_translation_fault and try_map_mmio are
> > > called after try_handle_mmio returns IO_UNHANDLED but try_handle_mmio is
> > > not called a second time (or am I mistaken?)
> >
> > Why would you need it? If try_mmio_fault() doesn't work the first time, then
> 
> Sorry I meant try_handle_mmio().
> 
> > it will not work the second it.

I think I explained myself badly, I'll try again below.


> > > Another thing I noticed is that currently find_mmio_handler and
> > > try_fwd_ioserv expect dabt to be already populated and valid so it would
> > > be better if we could get there only when dabt.valid.
> > >
> > > With these two things in mind, I think maybe the best thing to do is to
> > > change the code in do_trap_stage2_abort_guest slightly so that
> > > p2m_resolve_translation_fault and try_map_mmio are called first when
> > > !dabt.valid.
> >
> > An abort will mostly likely happen because of emulated I/O. If we call
> > p2m_resolve_translation_fault() and try_map_mmio() first, then it means
> > the processing will take longer than necessary for the common case.
> >
> > So I think we want to keep the order as it is. I.e first trying the MMIO
> > and then falling back to the less likely reason for a trap.

Yeah I thought about it as well. The idea would be that if dabt.valid is
set then we leave things as they are (we call try_handle_mmio first) but
if dabt.valid is not set (it is not valid) then we skip the
try_handle_mmio() call because it wouldn't succeed anyway and go
directly to p2m_resolve_translation_fault() and try_map_mmio().

If either of them work (also reading what you wrote about it) then we
return immediately.

If not, then we call decode_instruction from do_trap_stage2_abort_guest
and try again. The second time dabt.valid is set so we end up calling
try_handle_mmio() as usual.

Just for clarity let me copy/paste the relevant code, apologies if it
was already obvious to you -- I got the impression my suggestion wasn't
very clear.



+again:
+        if ( is_data && hsr.dabt.valid )
        {
            enum io_state state = try_handle_mmio(regs, hsr, gpa);

            switch ( state )
            {
            case IO_ABORT:
                goto inject_abt;
            case IO_HANDLED:
                advance_pc(regs, hsr);
                return;
            case IO_RETRY:
                /* finish later */
                return;
            case IO_UNHANDLED:
                /* IO unhandled, try another way to handle it. */
                break;
            }
        }

        /*
         * First check if the translation fault can be resolved by the
         * P2M subsystem. If that's the case nothing else to do.
         */
        if ( p2m_resolve_translation_fault(current->domain,
                                           gaddr_to_gfn(gpa)) )
            return;

        if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
            return;

+        if ( !hsr.dabt.valid )
+        {
+            if ( !decode_instruction(regs, &hsr.dabt) )
+                goto again;
+        }

        break;
    default:
        gprintk(XENLOG_WARNING,
                "Unsupported FSC: HSR=%#"PRIregister" DFSC=%#x\n",
                hsr.bits, xabt.fsc);
    }

