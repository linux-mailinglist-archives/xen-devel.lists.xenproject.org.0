Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC6sM9BEe2l+DAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 12:30:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BFAAFA18
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 12:30:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216288.1526208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlQDc-0004hS-L8; Thu, 29 Jan 2026 11:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216288.1526208; Thu, 29 Jan 2026 11:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlQDc-0004f9-ID; Thu, 29 Jan 2026 11:29:48 +0000
Received: by outflank-mailman (input) for mailman id 1216288;
 Thu, 29 Jan 2026 11:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXHF=AC=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vlQDb-0004eb-HF
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 11:29:47 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfafb916-fd05-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 12:29:46 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-59b7c2614f7so800373e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 03:29:45 -0800 (PST)
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
X-Inumbo-ID: cfafb916-fd05-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1769686184; cv=none;
        d=google.com; s=arc-20240605;
        b=EYF3qke2S/kTl41PFgRyPtTC8howcoyRTUnOe5yRGvYe9D8R0reqlzMJS9LQ89g82S
         nYwvaAtYyAgQEh59IS1ElniLrZ7eoLO3JgMgcIksOZKg3NQ0bBFFYJhSw6BI3MyZig9y
         BuqexAKIOfQQt/UCYUW//GiJM1ejXwJy+vNU+qfsanXpXnhODkrTGI9NvSY5xTxiEZp2
         y8cZ2LrPKppZm4hRhKyQJ0alPk/t1pXNOSP7ipnGfrK0+6ogMuwYs5BAv2r+L447381b
         osEY78ktt/FuB9UK1+dZc3Gp4Xei6nl34N/OBK63P6IUsFtHY86whJBzUstZyrOoy+0u
         5hvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ypZjUe8MnGLUz+5PA3E/bqEPtrbXT3gUW2pEGL1awI=;
        fh=6Yp745r9geSuA1DCXNlATJA3FpDPscZxI67TajJvjq8=;
        b=MEfrvKqXGggXgfCnwLSEXnN/619YnNb8goOischhogzg6cv+2qrJzJEf9KuJ215lK9
         m26j5SpujqDuSErMln7PG6fzjgSm3Dc21Zx5pK/fjLutceQGd3o442Noo/Iq3tTjb9SC
         OnMT8bpVq0SQOzsx+2k6MYHWzZe6CvzY/1YKMCl3Blg5HkbWjoBY3HNe8zs6f/9JfcNJ
         Z0pBXrPHZ1BAYgWqdf4HvOPnA6rAE4uGgdL/n70SZHaUYPiaShP0lV5VyGWz35RDMsFb
         lLPzmkReOzVjdwWZ5xn/pKMSHPeRttT5atGYmZBpk7TnXy3dYH12mVZDK+bLtBcMgor8
         DzSQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686184; x=1770290984; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ypZjUe8MnGLUz+5PA3E/bqEPtrbXT3gUW2pEGL1awI=;
        b=kTicKLKAEJrYbVhlmwcxKaeFAto89RH6+4wRwQZNcc37iekNDg0ySjiTPyYIB2/HpI
         8axCXAbynHUDAcCpFNjRgnSQwXnr6RsNGUBHlIpDI4n/Q+VvDYoDcKV2+ZETPmsbPhh/
         8uAAuXxDDaHP+9FLh4RlqSwpk8jkkQT1MAPTRC9ON1WunaMY5FSB1xmE1wJsRl9vthqS
         fG9M+EpHS8K2zTJ87V0ymDL/1t3UPWo/g4wAIXU0KdVhobq2j77/YV8B48zEvAmFn6c8
         WK7qKpWmPBByoYDhcbXFSMWadNi8U9yMcuoXoc3NpYVAz23zkgRHSrY9yE6RlPJb87Pf
         u9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686184; x=1770290984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ypZjUe8MnGLUz+5PA3E/bqEPtrbXT3gUW2pEGL1awI=;
        b=Da9x5KFaE5OcqE/8yXO2ZAObBDJDUi6tXIzguqkgj8C/qjGD18vZtx1O73zuRzhdGm
         JKcyGTyBdQPVLZKveXdt6wW28A5XPYPjDinnKr1E0xSEhiNUi4L+hlTT7bEDhypyiaS4
         DXO/Cp8bgMfnrDiLCv6zns0E4QFK2GIP6C2TEBYGXM8HTMFg1BG/6JRD+zjuZoJ+MEtM
         u1m+0PaGqfR2m7U9buGdSGueP+ad/7NowOXnAsIX+EsxjiEuEUytAOgJMnYCOPvSJ6gj
         ySZGpE1ajfGfwSypMiy0XgnOk+kgNKZoiQoEsGFPXErihjnG6buPFyZfTSg4CnJbwf7m
         9qiQ==
X-Gm-Message-State: AOJu0Yy4457gCMh6BE8i/2xgOIVZp0mzNIxlr8LI/r4ucogyYVaB8Sz8
	nThhworVxr3x1pOKExpA7s63EN/3lF/zz/UD1PHwKsreoUMQdb5HFEDyl6CMi61vnsuPImVL30U
	R1TDZoNcrZqDcDWXeHoM7T+JvQ2nMPjY=
X-Gm-Gg: AZuq6aJNHq+rsIah9GtAiMej+nOtkI43RCdW8xlARFnvbrSJYVy4cnvK76E0/6q0Oux
	JulcOCC9jgHW3dshHuFL963eQozdVEm+/loVy2DT4J7li9MUNH0ZDq0sH3UJ7y2RahXPrKDi+Ft
	aVVIvF10N3ztNO4vca/18S+HXCOvNqRJi5Gd9kRlZH5PSKkdtMCYN+/+kHqB7XHiM50y0YrRqEH
	5SfM3wIRJze7Odcudbdp8SD4xrp9RQhmT51Xxgu6BANMA5GjMSaVdD/M0Mr/qkZ82v87A==
X-Received: by 2002:a05:6512:3f0d:b0:59b:b3fd:ea24 with SMTP id
 2adb3069b0e04-59e04030a09mr3801362e87.44.1769686184198; Thu, 29 Jan 2026
 03:29:44 -0800 (PST)
MIME-Version: 1.0
References: <436a0405a9482dadce7f7cdb1e9721ee461f26a7.1768219676.git.mykola_kvach@epam.com>
 <c59eabda-3b97-4231-bd90-29326ba8a326@xen.org>
In-Reply-To: <c59eabda-3b97-4231-bd90-29326ba8a326@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 29 Jan 2026 13:29:32 +0200
X-Gm-Features: AZwV_Qh7JX39bholpi_J8mkD3OIcxepOaxLGO9o3_XhZCyh6pcmYDIoYz0wX8Yc
Message-ID: <CAGeoDV9rpqW2XZVqVPSym9=bEyMY5udiL-oXwGUvOBtHudLdCw@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: ignore spurious interrupts from virtual timer
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 21BFAAFA18
X-Rspamd-Action: no action

Hi Julien,

Thank you for the review.

On Mon, Jan 12, 2026 at 4:04=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 12/01/2026 12:50, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > If a spurious virtual timer interrupt occurs (i.e. the interrupt fires
> > but CNTV_CTL_EL0 does not report it as pending), Xen masks the virtual
> > timer and injects the vtimer IRQ into the guest. For Linux guests, the
> > timer interrupt is unmasked only after programming a new CVAL value fro=
m
> > the timer interrupt handler. When the interrupt is not reported as
> > pending, the handler can skip that programming step, leaving the timer
> > masked and stalling the affected CPU.
>
> I guess this is happening if Linux is trying to modify CVAL with the
> local interrupt masked?

CVAL/TVAL programming in Linux is indeed done with local IRQs disabled.
The virtual timer IRQ handler runs in hardirq context with local IRQs
disabled.

However, the failure here is not "Linux modifies CVAL while IRQs are
masked". The problematic case is that Xen injects a vtimer IRQ while the
architectural state already says it is *not pending* (CNTV_CTL_EL0 has
ISTATUS=3D0, and CNTV_TVAL_EL0 is positive). In my Xen trace the injection
happens with ctl=3D0x1 and cntv_tval=3D0xf320, yet Xen still injects vIRQ 2=
7.

When Linux receives such an injected interrupt, it reads ISTATUS=3D0 and
treats it as spurious, so it skips the normal re-arm path that would
program a new CVAL and leave the timer enabled. If Xen masked the vtimer
output before injection, it can remain masked, and the CPU stops getting
timer events.

So local IRQ masking is expected in Linux; the root cause is injecting
when ISTATUS is already 0.

To add more data points, here is a partial log from the stuck case.

In my instrumentation:
  - "snap ... index 0" is from leave_hypervisor_to_guest (Xen->guest)
  - "snap ... index 1" is from enter_hypervisor_from_guest (guest->Xen)

We do a normal timer expiry/injection path (vtimer: virt timer expired,
then vgic_inject_irq), return to the guest (snap index 0), and later
re-enter Xen (snap index 1). The issue is that on a subsequent entry
from the guest, Xen hits vtimer_interrupt with CNTV_CTL_EL0=3D0x1 and
CNTV_TVAL_EL0 positive, but still injects vIRQ 27:

[513559989049] CPU1: snap: vcpu d1v0 index 0 now 513559988779 seq
4008771 pcpu 1 time ctl 1 cval 542163190853 cntvct 542159034528
[513559989679] CPU1: [1] b0a0020200000202 [513559989964] CPU1:
[513559995049] CPU1: snap: vcpu d1v0 index 1 now 513559994374 seq
4008771 pcpu 1 time ctl 1 cval 542159103072 cntvct 542159040944

[513559999009] CPU1: virt_timer_save: vcpu d1v0 ctl=3D0x1
cval=3D0x7e3b336460 cntvct=3D0x7e3b328200
[513559999519] CPU1: virt_timer_save: setting timer for vcpu d1v0
513560053249 513559999459
[513560054630] CPU1: vtimer: virt timer expired for vcpu d1v0 ctl 0
cval 542159103072 cntvct 542159104512
[513560055185] CPU1: vgic_inject_irq: vcpu d1v0 virq 27
[513560056100] CPU1: VCPU unblock d1v0 pause 1 poll_evtchn 0
[513560057105] CPU1: VCPU wake d1v0
[513560058710] CPU1: virt_timer_restore: vcpu d1v0 ctl=3D0x3
cval=3D0x7e3b336460 CPU 1 status 1 expires=3D513560053249 now 513560058650
cntvct=3D0x7e3b337b00
[513560061050] CPU1: snap: vcpu d1v0 index 0 now 513560060795 seq
4008772 pcpu 1 time ctl 7 cval 542159103072 cntvct 542159111344
[513560061755] CPU1: [0] 50a000000000001b [513560062025] CPU1:
[513560067785] CPU1: snap: vcpu d1v0 index 1 now 513560067185 seq
4008772 pcpu 1 time ctl 1 cval 542159180688 cntvct 542159118528
[513560068415] CPU1:
[513560070215] CPU1: WFI blocking d1v0
[513560072180] CPU1: virt_timer_save: vcpu d1v0 ctl=3D0x1
cval=3D0x7e3b349390 cntvct=3D0x7e3b33b2e0
[513560072690] CPU1: virt_timer_save: setting timer for vcpu d1v0
513560126014 513560072630
[513560127275] CPU1: vtimer: virt timer expired for vcpu d1v0 ctl 0
cval 542159180688 cntvct 542159181984
[513560128250] CPU1: vgic_inject_irq: vcpu d1v0 virq 27
[513560132015] CPU1: virt_timer_restore: vcpu d1v0 ctl=3D0x3
cval=3D0x7e3b349390 CPU 1 status 1 expires=3D513560126014 now 513560131955
cntvct=3D0x7e3b34ac70
[513560134340] CPU1: snap: vcpu d1v0 index 0 now 513560134070 seq
4008773 pcpu 1 time ctl 7 cval 542159180688 cntvct 542159189504
[513560135045] CPU1: [0] 50a000000000001b [513560135345] CPU1:

[513560140940] CPU1: vtimer_interrupt: vcpu d1v0 ctl=3D0x1 cval
cache=3D0x7e3b349390 cval reg 0x7e3b35c4b0 cntvct=3D0x7e3b34d180
cntv_tval=3D0xf320
        LR0=3D0x10a000000000001b LR1=3D0 LR2=3D0 LR3=3D0

[513560142230] CPU1: vgic_inject_irq: vcpu d1v0 virq 27
[513560143595] CPU1: vgic_raise_guest_irq: vcpu d1v0 virq 27 lr 0
[513560144540] CPU1: VCPU unblock d1v0 pause 0 poll_evtchn 0
[513560146175] CPU1: snap: vcpu d1v0 index 1 now 513560145740 seq
4008773 pcpu 1 time ctl 3 cval 542159258800 cntvct 542159202128
[513560146820] CPU1: [0] 50a000000000001b [513560147090] CPU1:
[513560148875] CPU1: WFI blocking d1v0
[513560149310] CPU1: VCPU unblock d1v0 pause 1 poll_evtchn 0
[513560150885] CPU1: VCPU wake d1v0
[513560152370] CPU1: snap: vcpu d1v0 index 0 now 513560152115 seq
4008774 pcpu 1 time ctl 3 cval 542159258800 cntvct 542159208736
[513560153060] CPU1: [0] 50a000000000001b [513560153360] CPU1:
[513560157080] CPU1: snap: vcpu d1v0 index 1 now 513560156435 seq
4008774 pcpu 1 time ctl 3 cval 542159258800 cntvct 542159213760


The same line also shows that CNTV_CVAL_EL0 already differs from Xen's
cached value:

  cval cache=3D0x7e3b349390, cval reg=3D0x7e3b35c4b0

So the injection is not aligned with the current CVAL/ISTATUS state.
This matches Linux treating the interrupt as spurious (ISTATUS=3D0) and
skipping the normal re-arm path, which can leave the vtimer output
masked and the CPU without further timer events.

This is why the fix is at the injection boundary: if CNTV_CTL_EL0
indicates ISTATUS=3D0, Xen should not mask and inject the vtimer IRQ.

>
> >
> > This patch mirrors the Linux arm generic timer handler: if the interrup=
t
> > fires but the pending bit is not set, treat it as spurious and ignore i=
t.
>
> Have you considered fixing properly our virtual timer emulation? I know
> this requires more code, but at least we are not adding more
> non-compliant code which requires patching the Guest OS.
>
> IIRC there was a series from Stewart to solve it and it was in pretty
> good shape at the time it was posted.
>

I don=E2=80=99t think this patch adds more non-compliant behavior or
requires any guest patching. Quite the opposite: it prevents Xen from
delivering a virtual timer interrupt when the architectural state says
it is not pending (CNTV_CTL_EL0.ISTATUS=3D0 / CNTV_TVAL_EL0 > 0). The
current behavior (mask + inject in that situation) is what produces the
spurious interrupt in the guest and can leave the timer output masked.

So the intent is a minimal, self-contained Xen-side bug fix at the
injection boundary:

If ISTATUS=3D=3D0, there is no vtimer interrupt to deliver, so we should
not mask and inject one.

This does not rely on guest spurious handling; it avoids creating
the spurious condition in the first place.

Also, could you please share the subject/Message-ID or a link to the
series you have in mind, so I can make sure I=E2=80=99m looking at the righ=
t
one?

> >
> > This issue is reproducible under heavy load on the R-Car X5H board
> > (Cortex-A720AE r0p0).
>  > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >   xen/arch/arm/include/asm/perfc_defn.h |  7 ++++---
> >   xen/arch/arm/time.c                   | 11 ++++++++++-
> >   2 files changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/inclu=
de/asm/perfc_defn.h
> > index effd25b69e..f83989d95a 100644
> > --- a/xen/arch/arm/include/asm/perfc_defn.h
> > +++ b/xen/arch/arm/include/asm/perfc_defn.h
> > @@ -69,9 +69,10 @@ PERFCOUNTER(ppis,                 "#PPIs")
> >   PERFCOUNTER(spis,                 "#SPIs")
> >   PERFCOUNTER(guest_irqs,           "#GUEST-IRQS")
> >
> > -PERFCOUNTER(hyp_timer_irqs,   "Hypervisor timer interrupts")
> > -PERFCOUNTER(virt_timer_irqs,  "Virtual timer interrupts")
> > -PERFCOUNTER(maintenance_irqs, "Maintenance interrupts")
> > +PERFCOUNTER(hyp_timer_irqs,             "Hypervisor timer interrupts")
> > +PERFCOUNTER(virt_timer_irqs,            "Virtual timer interrupts")
> > +PERFCOUNTER(virt_timer_spurious_irqs,   "Virtual timer spurious interr=
upts")
> > +PERFCOUNTER(maintenance_irqs,           "Maintenance interrupts")
> >
> >   PERFCOUNTER(atomics_guest,    "atomics: guest access")
> >   PERFCOUNTER(atomics_guest_paused,   "atomics: guest paused")
> > diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> > index cc3fcf47b6..d18d6568bb 100644
> > --- a/xen/arch/arm/time.c
> > +++ b/xen/arch/arm/time.c
> > @@ -258,6 +258,8 @@ static void htimer_interrupt(int irq, void *dev_id)
> >
> >   static void vtimer_interrupt(int irq, void *dev_id)
> >   {
> > +    register_t ctl;
> > +
> >       /*
> >        * Edge-triggered interrupts can be used for the virtual timer. E=
ven
> >        * if the timer output signal is masked in the context switch, th=
e
> > @@ -271,9 +273,16 @@ static void vtimer_interrupt(int irq, void *dev_id=
)
> >       if ( unlikely(is_idle_vcpu(current)) )
> >           return;
> >
> > +    ctl =3D READ_SYSREG(CNTV_CTL_EL0);
> > +    if ( unlikely(!(ctl & CNTx_CTL_PENDING)) )
>
> For the others, the Armv8 specification names this field ISTATUS.
> Regardless what I wrote above, the change look alright. Before I ack,
> can you confirm whether you checked other OSes (I am thinking at least
> Zephyr) will also ignore spurious interrupt?

Regarding other OSes: I haven't reproduced this with Zephyr domain yet,
but I did take a look at Zephyr's Arm generic timer IRQ handling. At
first glance it follows the usual pattern, and I don't immediately see
anything that would break if a spurious vtimer IRQ was/wasn't delivered.

That said, to be confident I will run a small domU test where I
artificially inject spurious vtimer interrupts into the guest (i.e.
deliver the IRQ while CNTV_CTL_EL0.ISTATUS is 0) and verify that
Zephyr does not get stuck and continues to re-arm the timer correctly.
I'll report the results in a follow-up.

Best regards,
Mykola

>
> Cheers,
>
> --
> Julien Grall
>

