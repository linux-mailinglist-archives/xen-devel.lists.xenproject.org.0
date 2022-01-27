Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DBE49EE30
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 23:41:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261763.453490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDDRs-0006np-06; Thu, 27 Jan 2022 22:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261763.453490; Thu, 27 Jan 2022 22:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDDRr-0006lD-TL; Thu, 27 Jan 2022 22:40:59 +0000
Received: by outflank-mailman (input) for mailman id 261763;
 Thu, 27 Jan 2022 22:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWrC=SL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nDDRq-0006l7-Bd
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 22:40:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 304e3108-7fc2-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 23:40:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAC5961BBE;
 Thu, 27 Jan 2022 22:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F8AC340E4;
 Thu, 27 Jan 2022 22:40:53 +0000 (UTC)
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
X-Inumbo-ID: 304e3108-7fc2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643323254;
	bh=kFzTHGJaeoDb+qvVKWXZSk+JOj/DTDahkGYdIqOMslI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MXAA765m6+rLGhiElFAwdXvK5iDF+f4NlAxjFol+vmpiSLYM4WSH9inXACKJDq2Wi
	 DHpfhY6jUtGjHggDRGMF3+2T3B0h+Ul17qZPI+UsnXO0t2aQFQKFI5iCiz126tfRd8
	 xAQenOAGXP78I9g2HXC01QPufHPJsQcbpf6m+Z8MTwcoa7mYa+HXYHO7kUMI0P500u
	 PQudBA4qoCzthryntOtimYXIPe2jbornZ0U1Q4hsBu1laaQ1MR0D6aaSACS4xA0Bi4
	 3asi/B/Yw1OQoAkcp77GCEX8ywMbvFIYIc6h3NVrFaUrTcpgR/XGwvkanpvBv7jwNz
	 /2mmDSQY7n8ug==
Date: Thu, 27 Jan 2022 14:40:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    Julien Grall <julien.grall.oss@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, stefanos@xilinx.com, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching
 for a MMIO handler
In-Reply-To: <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop>
References: <20220126165827.61168-1-ayankuma@xilinx.com> <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com> <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com> <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com> <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org> <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com> <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-84538357-1643321245=:27308"
Content-ID: <alpine.DEB.2.22.394.2201271407560.27308@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-84538357-1643321245=:27308
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2201271407561.27308@ubuntu-linux-20-04-desktop>

On Thu, 27 Jan 2022, Julien Grall wrote:
> On 27/01/2022 15:48, Ayan Kumar Halder wrote:
> > On 27/01/2022 13:57, Julien Grall wrote:
> > > 
> > > 
> > > On 27/01/2022 13:20, Ayan Kumar Halder wrote:
> > > > Hi,
> > > > 
> > > > Asking here as well (might not have been clear on irc).
> > > > 
> > > > On 27/01/2022 00:10, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On Wed, 26 Jan 2022, 17:56 Ayan Kumar Halder,
> > > > > <ayan.kumar.halder@xilinx.com> wrote:
> > > > > 
> > > > >     Hi Julien,
> > > > > 
> > > > >     On 26/01/2022 17:22, Julien Grall wrote:
> > > > > >     Hi,
> > > > > > 
> > > > > >     On Wed, 26 Jan 2022, 16:58 Ayan Kumar Halder,
> > > > > >     <ayan.kumar.halder@xilinx.com> wrote:
> > > > > > 
> > > > > >         Refer to Armv8 ARM DDI 0487G.b, Page D13-3219 "ISS encoding
> > > > > >         for an exception
> > > > > >         from a Data Abort" :-
> > > > > >         ISV - ISS[23:14] holds a valid instruction syndrome
> > > > > > 
> > > > > >         When the ISV is 0, the instruction could not be decoded by
> > > > > >         the hardware (ie ISS
> > > > > >         is invalid). One should immediately return an error to the
> > > > > >         caller with an
> > > > > >         appropriate error message.
> > > > > > 
> > > > > >     That's going to be very spammy because we have use-case where it
> > > > > >     could trap without a valid ISV (e.g. when break-before-make
> > > > > >     happens). So please don't had a message.
> > > > > 
> > > > >     There is already a logging statement in traps.c :-
> > > > > 
> > > > >     inject_abt:
> > > > >         gdprintk(XENLOG_DEBUG,
> > > > >                  "HSR=%#"PRIregister" pc=%#"PRIregister"
> > > > >     gva=%#"PRIvaddr" gpa=%#"PRIpaddr"\n",
> > > > >                  hsr.bits, regs->pc, gva, gpa);
> > > > > 
> > > > >     The reason for the error is to give the user some hint that an IO
> > > > >     abort is triggered by Xen.
> > > > > 
> > > > > The main difference here is inject_dabt should only be reached when we
> > > > > exhausted all the possibility in I/O handling.
> > > > > 
> > > > > In your case, if we can't handle as an MMIO then we should fallthrough
> > > > > the other method (see do_trap_stage2_abort_guest()).
> > > > > 
> > > > > In fact, moving the check early and doing the decoding before
> > > > > find_mmio() or try_fwd_io() is actually wrong. Sorry I should realized
> > > > > that earlier.
> > > > 
> > > > Why should we care about MMIO when ISS is invalid ?
> > > 
> > > Because a translation fault doesn't mean this is emulated MMIO. This may
> > > be actual RAM but with the stage-2 entry marked as invalid for tracking
> > > purpose (or else).
> > > 
> > > > Should we not check first if the ISS is valid or not as it will trigger
> > > > IO_abort regardless of the MMIO.
> > > 
> > > No. Imagine the guest decides to use a store exclusive on a RAM region
> > > that was temporally marked as invalid in the stage-2 page-table.
> > > 
> > > This will generate a data abort in Xen with ISV=0. We want to try to
> > > resolve the fault first and retry the instruction.
> > > 
> > > > 
> > > > I am assuming that once Xen resolves the MMIO
> > > > (p2m_resolve_translation_fault()), the guest will again try to run the
> > > > same instruction on MMIO region. This will be trapped in Xen which will
> > > > return IO abort as the post-indexing instruction could not be decoded.
> > > 
> > > The access will not trap again in Xen if the fault was resolved.
> > 
> > I think your words makes sense.
> > 
> > However, I am still concerned that we might not be doing the correct thing
> > in try_fwd_ioserv().
> > 
> > See this :-
> > 
> >      ioreq_t p = {
> >          .type = IOREQ_TYPE_COPY,
> >          .addr = info->gpa,
> >          .size = 1 << info->dabt.size,
> >          .count = 1,
> >          .dir = !info->dabt.write,
> >          /*
> >           * On x86, df is used by 'rep' instruction to tell the direction
> >           * to iterate (forward or backward).
> >           * On Arm, all the accesses to MMIO region will do a single
> >           * memory access. So for now, we can safely always set to 0.
> >           */
> >          .df = 0,
> >          .data = get_user_reg(regs, info->dabt.reg),
> >          .state = STATE_IOREQ_READY,
> >      };
> > If info->dabt.valid = 0, then '.size', '.dir' and '.data' fields are
> > invalid.
> 
> Sort of. ISV=0 means that bits [23:14] are RES0. So this doesn't cover the
> field WnR. The validity of WnR will depend on DFSC. In our case, we will
> always reach this code with a translation fault. So WnR should always be
> valid.
> 
> That said, the rest will not be valid.
> 
> > 
> > '.size' gets used in ioreq_server_select() to obtain the end address. It
> > seems incorrect to me.
> > 
> > I suppose "if ( !info->dabt.valid )" needs to be checked before "s =
> > ioreq_server_select(v->domain, &p);".
> 
> The trouble is we would need to return IO_UNHANDLED (so the rest of the code
> can pick it up) which I think is incorrect here.
> 
> The approach I can think of is to call ioreq_server_select() with size = 0
> (i.e. byte access). Then decode the size (if needed) and then check the access
> is correct.
> 
> This is not very nice. But that at the same time, I would like to avoid
> dealing emulated I/O in Xen or outside differently. Stefano?

I am with you on both points.

One thing I noticed is that the code today is not able to deal with
IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
emulator handlers. p2m_resolve_translation_fault and try_map_mmio are
called after try_handle_mmio returns IO_UNHANDLED but try_handle_mmio is
not called a second time (or am I mistaken?)

Another thing I noticed is that currently find_mmio_handler and
try_fwd_ioserv expect dabt to be already populated and valid so it would
be better if we could get there only when dabt.valid.

With these two things in mind, I think maybe the best thing to do is to
change the code in do_trap_stage2_abort_guest slightly so that
p2m_resolve_translation_fault and try_map_mmio are called first when
!dabt.valid.

Patch below only for explaning; it doesn't build as is and I am not sure
it is 100% correct. For instance, if try_map_mmio succeeds, should we
return or goto again?


diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 9339d12f58..d09f901a50 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1965,7 +1965,8 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
          *
          * Note that emulated region cannot be executed
          */
-        if ( is_data )
+again:
+        if ( is_data && hsr.dabt.valid )
         {
             enum io_state state = try_handle_mmio(regs, hsr, gpa);
 
@@ -1996,6 +1997,12 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
         if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
             return;
 
+        if ( !hsr.dabt.valid )
+        {
+            if ( !decode_instruction(regs, &hsr.dabt) )
+                goto again;
+        }
+
         break;
     default:
         gprintk(XENLOG_WARNING,
--8323329-84538357-1643321245=:27308--

