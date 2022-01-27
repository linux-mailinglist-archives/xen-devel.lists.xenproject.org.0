Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219F349EE70
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 00:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261776.453512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDDqF-0001cE-G7; Thu, 27 Jan 2022 23:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261776.453512; Thu, 27 Jan 2022 23:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDDqF-0001ZI-CD; Thu, 27 Jan 2022 23:06:11 +0000
Received: by outflank-mailman (input) for mailman id 261776;
 Thu, 27 Jan 2022 23:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3iz=SL=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1nDDqE-0001ZC-Cn
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 23:06:10 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6280962-7fc5-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 00:06:08 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id k18so7412612wrg.11
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 15:06:08 -0800 (PST)
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
X-Inumbo-ID: b6280962-7fc5-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=601x8TXtoK0XOMdCQkicw790lMFnRqZEvlm3korMnH8=;
        b=kJEvgj6iaDqMy1QIeOY1KlrbFv5HlmWK2/KsKSqqZbrzT+/41W5y5drEBrh8qBZYbB
         b01cDbCpMO8q1PyqZvXvJ2qKKSz31dSC2DBOo4C9kt7tf5bV+OEpVNil3rpP2UQCSTAq
         X0qsRo8A84u2ZK14QLzsLXvKXob7hrYHlb4WPOie8W2tVvP8UfL2hPtOEnLWuK0OFsc9
         27XnPDx2HH1F+WVNyFacDyeKE6Ij82JCYecnw2P99Ce0H/uZJFY4BvS99qAazLKJk+9g
         DMEZ+IJ7KPqouxJDqVfN61embvEZr0vVjqnmKPslMikEXSozYwJnDvtnb/0PcgNcBPh6
         Z8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=601x8TXtoK0XOMdCQkicw790lMFnRqZEvlm3korMnH8=;
        b=yKkMatBP3JK0N1cvvZB2U02Mis20oiwK8k06kXEVXi47aawS5COnXfPOhlrAcAy3V8
         KIZlqjKbdsM55e8cGkVjCSLugigHAxPoHz6CmyWNyZSWVa4Gpj1shuDc8OVXTpcOxnTY
         CMxrSMgdrjLUiXCSM2nZ02RJF6v0NT9fHyMW1jx7amucTbJHf7Th0C6Y2graDWyUyAJ/
         NU5bH7OMJ+lICRlbiiuAa/JhduvWsWO6U6In93UJiNhfhdTNgXOOQvLyYzVWrq6Qe/9p
         HAzFeqRiJ8Y4CdPplDycW2EHUfWH8IXJJ1Bga6sv2dBDvW85acIitCJbb9Hmfq9bYZ7M
         meHA==
X-Gm-Message-State: AOAM530wcMNZcM0JCv4lr6/XG+lG/0CXqjVINwdu2x/CPZDUt5ioW1Ea
	53uiilGRhsTWHlOt9PmcC58C/MrHcD7O7sm3kmA=
X-Google-Smtp-Source: ABdhPJzUsBCwZT1xbgpv62G0NFIfBTP05QthlsNT3lgvuu/V4ERR4909Sy6NN84DQgUZG087WI8ELpyE0TX+aFkrJLU=
X-Received: by 2002:a05:6000:1101:: with SMTP id z1mr4690430wrw.135.1643324767944;
 Thu, 27 Jan 2022 15:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20220126165827.61168-1-ayankuma@xilinx.com> <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
 <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com> <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com> <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org>
 <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com> <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org>
 <alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 27 Jan 2022 23:05:56 +0000
Message-ID: <CAJ=z9a2Sp6w0b21p96YHx4w_m0jAbYJ4v=cVar-1nPeL7SotZw@mail.gmail.com>
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, stefanos@xilinx.com, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini <sstabellini@kernel.org> wrote:
> I am with you on both points.
>
> One thing I noticed is that the code today is not able to deal with
> IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
> emulator handlers. p2m_resolve_translation_fault and try_map_mmio are
> called after try_handle_mmio returns IO_UNHANDLED but try_handle_mmio is
> not called a second time (or am I mistaken?)

Why would you need it? If try_mmio_fault() doesn't work the first time, then
it will not work the second it.

>
> Another thing I noticed is that currently find_mmio_handler and
> try_fwd_ioserv expect dabt to be already populated and valid so it would
> be better if we could get there only when dabt.valid.
>
> With these two things in mind, I think maybe the best thing to do is to
> change the code in do_trap_stage2_abort_guest slightly so that
> p2m_resolve_translation_fault and try_map_mmio are called first when
> !dabt.valid.

An abort will mostly likely happen because of emulated I/O. If we call
p2m_resolve_translation_fault() and try_map_mmio() first, then it means
the processing will take longer than necessary for the common case.

So I think we want to keep the order as it is. I.e first trying the MMIO
and then falling back to the less likely reason for a trap.

>
> Patch below only for explaning; it doesn't build as is and I am not sure
> it is 100% correct. For instance, if try_map_mmio succeeds, should we
> return or goto again?

If try_map_mmio() succeeds then it means we create a valid entry
in the stage-2. Therefore, we want to return to the guest and
try to execute the instruction.

The same is valid for p2m_resolve_translation_fault(). If it works
then it means we successfully set the valid bit in an entry. So
we want to re-try directly.

Cheers,

