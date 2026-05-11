Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJmuFYklAmqEoQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 20:52:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD128514B16
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 20:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306370.1578367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMVk5-0006Os-JX; Mon, 11 May 2026 18:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306370.1578367; Mon, 11 May 2026 18:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMVk5-0006NC-Gh; Mon, 11 May 2026 18:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1306370;
 Mon, 11 May 2026 18:52:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMVk3-0006N1-J7
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 18:52:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMVk3-001EDj-01
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 20:52:35 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a022534-2eae-0a2a0a5409dd-0a2a450484c4-40
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 20:52:34 +0200
Received: from [209.85.208.176] (helo=mail-lj1-f176.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a022572-1dec-0a2a45040019-d155d0b0c1ed-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 20:52:34 +0200
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-393a44854d2so36868541fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:52:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1778525554; cv=none;
        d=google.com; s=arc-20240605;
        b=RP9t7sQxDmWQhcJV8e61lJ39PyBiFXfwGaHAsJIRr/HrbXkT3MWzJfJz1DMro0xor/
         sPLh+DV7PN4rakmAKvAh9WnY3L9RIW5Hm5ld5aPZ7Z8tnojDM04EsI7VNakfjDU5e5pg
         1QDOZAD7C8MCQ8ACeUm5YBl1sxXGsjeerRrB2j38uI45J41gRMubGo91MueVA6YqMojG
         0Nl6vGkrhOKoLQZx7j2wkC6qzKloD6p+2O1w7fA4b53JYcv/H3U6xl3EikDEdidZHBkB
         uPomSKnVNwU5TBbTDnWoHlEq4L4if0Rlx5LmChwo3nmjj3MfsgiDv2nLL9MTwLJsPWp0
         rTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=naYHQ6TyAdVtGN3Kv18P8iV2zmMmIC7Yo8VrV1NrKyc=;
        fh=SFtdlMni3BnFH+oTSZbVgVF1hLyFxrwlVmTI+BqD6+c=;
        b=CyQI9JA6w/iY+0hVHOX0dvJ3GmKbAA1M3GpsnkvBdgh+pkLkTMDH7KUbw5mpWKcDq7
         GBrLD6igd0sUlueNuL/x64eHYJ/DF4jKsSiiZhu8cMRndmXMrzVUs8YTy2ZboucfuLeX
         Hiz5GUAeYC3S7hVGHnZeg0lu1Z0kJnj/4qYpr8HTXL8ZKz1wDMsSbSNP0UuEAdbO2fHc
         5exClNuvdvNcc0ULmwkQfDo/S0p0P35tN6sq+QCrem43rKN6A+/VgJuActW6naa1x8Z6
         kjZ4bhOsatKpEft3dA+L50sU7nvnr4P9vXuzIjk6CC4l7lwCc4nGbUs2S0eRwdTcY5wp
         nwZA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525554; x=1779130354; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naYHQ6TyAdVtGN3Kv18P8iV2zmMmIC7Yo8VrV1NrKyc=;
        b=clXdQWTS1qEVSnd2qnpOKvri4HDWY2sEmQKYq8At0B+WthUmZ0IGaokU0oB0aB+/j3
         erEMlVYbID9+hHR1L5is4H4EEojNfeZ8RXo9d29CEN3M9uaA+9I+wCXHiBow8zmNk5bC
         W92R0pVyDGfOwypmqtybPzzL8lIyOF4y5/UHn36BFhcV8oSms1/s/wO67uliFA/+ezBf
         GO890Fdvr7JHiNqsDehAQkIsYU+XKJTsN+kepBZDqnPNyIQbO+tcs121VkjNnwVIzorw
         8NRHwZTg5oWdD2nRLbJPLxYHaoLlGX4sVI7JhaO6FQhM2XnuGcvC8pbZ+Ki+FJjdu/eM
         TYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525554; x=1779130354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=naYHQ6TyAdVtGN3Kv18P8iV2zmMmIC7Yo8VrV1NrKyc=;
        b=IKmlkV75oTVF1sZSZTPTqyQHeKXWkUg+Dc0kVtPphc/vBKGa5Y7YtIS9mHjGTvcDCf
         0M2oXSN+9jE4F1fXXPJik6Lwtn4QWFa4j2L96d738HLPdOxsgB2fWZufycvlsVGXGZ2Z
         iZ6vbo94QbVd+sUA3dhYbpyeaAVOq4Qz9AHd7zFVFcscDiLNDaiGX5wKfn8Z/CpEzje4
         9Men0lexklg/jypXF/+pIi8NHmPxLsYN/NBX0x1mb8F38DxeqYDzNk0GwGLOrJOYA9U8
         7z8scFgjr4gCf2Ohkh7RoBBCZe6N0rpsYdYo5yWaPUXQLjC02jXMft/mS6LAqF2mjque
         XCMA==
X-Gm-Message-State: AOJu0YxTK8e17q08YCxaLgSYDI+CE2y+uBR5EZlQ6GH5Fp2fvBX2RMEx
	Kpg1ynqzkn0mh401inOk+m+Ozgf2xJVUFMqhgHjwCka6u0j/1cbIbMnxcW5ac+S1dKsZCw1v4MN
	o8aVEgZzznFwTMAi8rf5w8I5ezNEDdmc=
X-Gm-Gg: Acq92OFVn00bSsGje58hz+sMwg8bQcQCgwCbLCkxPSKDPH/LgawefwgrnlcCwHFQAid
	14Rd3LkJ2JJ4osT6AomrJdmtLgI9cMPeyfNULEh1hGDbMgmt71H4D9+yvqKkoLL8F6YaRG5FGEG
	7hgP+A1mLDrLFzfJ3XsRWdOz+/B2AWJp5908O/l4vSmTMKAzhiJCLKvhRssNLblhfOR/z+kK5rL
	qE35QpMM3KPt2s/m3SspcFUkQazqS5HeC2swy7w3zb56XxYgAVS1u2DOgo4kznkL3D4I8VKiw9o
	nmnrPQ==
X-Received: by 2002:a2e:a80b:0:b0:393:55e1:4bcd with SMTP id
 38308e7fff4ca-394081a4cd1mr30841201fa.31.1778525553821; Mon, 11 May 2026
 11:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <f87a2bcb6b09e95e07e51c27541ad91406e849d1.1775125380.git.mykola_kvach@epam.com>
 <515377c0-2d8c-4069-86d0-e50674fefc68@gmail.com>
In-Reply-To: <515377c0-2d8c-4069-86d0-e50674fefc68@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 11 May 2026 21:52:22 +0300
X-Gm-Features: AVHnY4J3h-b6myBnxQz8_mxa7K4zWtVZ_3YhrYRdOqN1yMuVXJvULZvcvf1b5gI
Message-ID: <CAGeoDV9OxZGFhORoXRGYnDKOXdUvGaFwLCo8Otbi2g96FRYkgA@mail.gmail.com>
Subject: Re: [PATCH v8 11/13] xen/arm: Save/restore context on suspend/resume
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1778525554-491763FF-87D55BBF/0/0
X-purgate-type: clean
X-purgate-size: 8050
X-Rspamd-Queue-Id: AD128514B16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,aggios.com:email,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Oleksandr,

Thank you for the review.

On Mon, May 11, 2026 at 7:00=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 4/2/26 13:45, Mykola Kvach wrote:
>
> Hello Mykola
>
> I did not spot any obvious issues with this patch. As far as I can tell,
> the save/restore register set appears to be complete and correct for the
> current codebase.
>
> Just one observation: there is an API asymmetry between
> prepare_resume_ctx() and hyp_resume() (save uses pointer, restore
> hardcodes global) ...
>
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > The context of CPU general purpose and system control registers must be
> > saved on suspend and restored on resume. This is implemented in
> > prepare_resume_ctx and before the return from the hyp_resume function.
> > The prepare_resume_ctx must be invoked just before the PSCI system susp=
end
> > call is issued to the ATF. The prepare_resume_ctx must return a non-zer=
o
> > value so that the calling 'if' statement evaluates to true, causing the
> > system suspend to be invoked. Upon resume, the context saved on suspend
> > will be restored, including the link register. Therefore, after
> > restoring the context, the control flow will return to the address
> > pointed to by the saved link register, which is the place from which
> > prepare_resume_ctx was called. To ensure that the calling 'if' statemen=
t
> > does not again evaluate to true and initiate system suspend, hyp_resume
> > must return a zero value after restoring the context.
> >
> > Note that the order of saving register context into cpu_context structu=
re
> > must match the order of restoring.
> >
> > Support for ARM32 is not implemented. Instead, compilation fails with a
> > build-time error if suspend is enabled for ARM32.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v8:
> > - fix alignments in code
> >
> > Changes in v7:
> > - no changes
> > ---
> >   xen/arch/arm/Makefile              |  1 +
> >   xen/arch/arm/arm64/head.S          | 90 +++++++++++++++++++++++++++++=
-
> >   xen/arch/arm/include/asm/suspend.h | 26 +++++++++
> >   xen/arch/arm/suspend.c             | 14 +++++
> >   4 files changed, 130 insertions(+), 1 deletion(-)
> >   create mode 100644 xen/arch/arm/suspend.c
> >
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index 69200b2728..c36158271a 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -51,6 +51,7 @@ obj-y +=3D setup.o
> >   obj-y +=3D shutdown.o
> >   obj-y +=3D smp.o
> >   obj-y +=3D smpboot.o
> > +obj-$(CONFIG_SYSTEM_SUSPEND) +=3D suspend.o
> >   obj-$(CONFIG_SYSCTL) +=3D sysctl.o
> >   obj-y +=3D time.o
> >   obj-y +=3D traps.o
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index 596e960152..2cb02ee314 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -562,6 +562,52 @@ END(efi_xen_start)
> >   #endif /* CONFIG_ARM_EFI */
> >
> >   #ifdef CONFIG_SYSTEM_SUSPEND
> > +/*
> > + * int prepare_resume_ctx(struct cpu_context *ptr)
> > + *
> > + * x0 - pointer to the storage where callee's context will be saved
>
>     ... the C signature takes a pointer (struct cpu_context *ptr) and
> the save path uses it, ...
>
> > + *
> > + * CPU context saved here will be restored on resume in hyp_resume fun=
ction.
> > + * prepare_resume_ctx shall return a non-zero value. Upon restoring co=
ntext
> > + * hyp_resume shall return value zero instead. From C code that invoke=
s
> > + * prepare_resume_ctx, the return value is interpreted to determine wh=
ether
> > + * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
> > + */
> > +FUNC(prepare_resume_ctx)
> > +        /* Store callee-saved registers */
> > +        stp   x19, x20, [x0], #16
> > +        stp   x21, x22, [x0], #16
> > +        stp   x23, x24, [x0], #16
> > +        stp   x25, x26, [x0], #16
> > +        stp   x27, x28, [x0], #16
> > +        stp   x29, lr, [x0], #16
> > +
> > +        /* Store stack-pointer */
> > +        mov   x2, sp
> > +        str   x2, [x0], #8
> > +
> > +        /* Store system control registers */
> > +        mrs   x2, VBAR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, VTCR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, VTTBR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, TPIDR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, MDCR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, HSTR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, CPTR_EL2
> > +        str   x2, [x0], #8
> > +        mrs   x2, HCR_EL2
> > +        str   x2, [x0], #8
> > +
> > +        /* prepare_resume_ctx must return a non-zero value */
> > +        mov   x0, #1
> > +        ret
> > +END(prepare_resume_ctx)
> >
> >   FUNC(hyp_resume)
> >           /* Initialize the UART if earlyprintk has been enabled. */
> > @@ -580,7 +626,49 @@ FUNC(hyp_resume)
> >           b     enable_secondary_cpu_mm
> >
> >   mmu_resumed:
> > -        b .
> > +        /* Now we can access the cpu_context, so restore the context h=
ere */
> > +        ldr   x0, =3Dcpu_context
>
>     ... but the restore path hardcodes =3Dcpu_context, ignoring whatever
> pointer was originally passed. If a caller were to pass anything other
> than &cpu_context, the resume would load from the wrong location. Since
> the sole call site does pass &cpu_context (called from system_suspend()
> in the last patch), this works correctly today =E2=80=94 but the API is s=
omewhat
> misleading.
>
> I might be missing something, but why not make prepare_resume_ctx() take
> no arguments and use =3Dcpu_context directly inside the assembly? That wa=
y
> the save and restore paths would both use the same global, and the API
> would not be misleading.

Yes, good point. Since the resume path restores from the global context obj=
ect,
the argument to prepare_resume_ctx() is misleading.

I will remove the argument and make both the save and restore paths use the
same global resume_cpu_context object.

Best regards,
Mykola

>
> > +
> > +        /* Restore callee-saved registers */
> > +        ldp   x19, x20, [x0], #16
> > +        ldp   x21, x22, [x0], #16
> > +        ldp   x23, x24, [x0], #16
> > +        ldp   x25, x26, [x0], #16
> > +        ldp   x27, x28, [x0], #16
> > +        ldp   x29, lr, [x0], #16
> > +
> > +        /* Restore stack pointer */
> > +        ldr   x2, [x0], #8
> > +        mov   sp, x2
> > +
> > +        /* Restore system control registers */
> > +        ldr   x2, [x0], #8
> > +        msr   VBAR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   VTCR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   VTTBR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   TPIDR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   MDCR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   HSTR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   CPTR_EL2, x2
> > +        ldr   x2, [x0], #8
> > +        msr   HCR_EL2, x2
> > +        isb
> > +
> > +        /*
> > +         * Since context is restored return from this function will ap=
pear
> > +         * as return from prepare_resume_ctx. To distinguish a return =
from
> > +         * prepare_resume_ctx which is called upon finalizing the susp=
end,
> > +         * as opposed to return from this function which executes on r=
esume,
> > +         * we need to return zero value here.
> > +         */
> > +        mov   x0, #0
> > +        ret
> >   END(hyp_resume)
> >
> >   #endif /* CONFIG_SYSTEM_SUSPEND */
>
>
> [snip]
>
>

