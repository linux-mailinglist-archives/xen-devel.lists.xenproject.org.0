Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F078B374D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 14:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712760.1113580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0KkU-0003hn-Kr; Fri, 26 Apr 2024 12:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712760.1113580; Fri, 26 Apr 2024 12:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0KkU-0003fV-Hs; Fri, 26 Apr 2024 12:32:18 +0000
Received: by outflank-mailman (input) for mailman id 712760;
 Fri, 26 Apr 2024 12:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vyS=L7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s0KkT-0003fP-Kw
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 12:32:17 +0000
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03231615-03c9-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 14:32:15 +0200 (CEST)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6ea2436de79so1089944a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 05:32:15 -0700 (PDT)
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
X-Inumbo-ID: 03231615-03c9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714134734; x=1714739534; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1QetCPp9ikJfkn1ZPBghUc/DQ/UVrEXssGiZ0sqglU=;
        b=bWhw4DWGDFGmfjJO95/anR9oLYqf6O620S0gDKSUxLzj90iYpAGnm+w/r/HLt3arUC
         9/pIj4F/F7v3AkREl+RolpuKADVxK1HXpooKa27zMYzS0UCm1Ngx6JUEZmCGXtcGyeDB
         7IB9xHEJiUuvB61YY1Sb38CTL2uVrKqWuquZCWMxZ3qiCn6HHtvQWneWJQAgAGTWUDot
         Y1CIrBvTIHGeBLrI1v4Kca/5pyOtpv9AnmsbaU8fwlrG3lN6TumUF8xcL3sE8mQYjY/K
         jk9008HVPfQOt0I6HKKZZ7TphAIj/NnCmX0YKEItVOw4d+1b2YkgPrq7y1W5luX/Jnks
         b6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714134734; x=1714739534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1QetCPp9ikJfkn1ZPBghUc/DQ/UVrEXssGiZ0sqglU=;
        b=kVvWZIWbJuxxPDW5rBa3OCt0LspogK6O9dZjBOn6TZ1Vf9VNU0qMhb8JS52q+2Mrb/
         SaSVmsnZsZdOb2WEBaL2+YCHWrU1KRSAAs9YGqMJNt+eS44ipqdZbHfcAiKtXJwIvfio
         UH/hHotq2YxsBrjXy94QffsByFu0uMW8BCKw8UHJvOBPkl+PFKxjSF7SjluYw0QtI0iJ
         j1hklEYhFLP0aYbkO4OccHDLJLwmLfvrEglPG3NXjJIegMXC/79Uo3st4WlYRWJ8knFn
         bBvd297FXnG73Nt8KTVUuEoQOy2H9RqtmmJgd5l0LxJIQikQ2UVr/DzP+UNxtXWb/qWb
         NODw==
X-Gm-Message-State: AOJu0YzoSKZmAc0ak5c5NIICvRM9ZZ3uxiE7L913HdEtiLvGKUz5b0EQ
	/nxv5cIsdurkugcsWtSOoIuPycAEr+WjMYlR8pP/0M9JjkXWS8qAPG797WpHUDJAnWE9p1K1N9G
	9DX4d6/mZfHO2WD+ItukvSVjvzRlBPxojyFTuhw==
X-Google-Smtp-Source: AGHT+IH7RFi/3ghPY9kMWajdXO0u9pz+Oz4GZGzS8jYK0zywJuKCV9V04OcwVbI8ZYvG+0d1s/pKjsqKzPnUmvRNq68=
X-Received: by 2002:a05:6870:b003:b0:22e:d2b2:25fe with SMTP id
 y3-20020a056870b00300b0022ed2b225femr2386075oae.1.1714134734080; Fri, 26 Apr
 2024 05:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org> <A0908DCC-6E15-406B-8E29-F241B6EA8BE1@arm.com>
 <CAHUa44ETaCY2pbUjMOW5T2NSpmRCq3sWMjLUbK0DC2jpQxHJRQ@mail.gmail.com> <3A576E95-454B-4C66-A164-A2871DB4E2B2@arm.com>
In-Reply-To: <3A576E95-454B-4C66-A164-A2871DB4E2B2@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 26 Apr 2024 14:32:02 +0200
Message-ID: <CAHUa44EC_H7Q_A2M63dZnEGGNanyjGM6m2MuBg4_6BNEO-XDKA@mail.gmail.com>
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Apr 26, 2024 at 2:19=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 26 Apr 2024, at 14:11, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Fri, Apr 26, 2024 at 11:20=E2=80=AFAM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 26 Apr 2024, at 10:47, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
[...]
> >>> +struct notif_irq_info {
> >>> +    unsigned int irq;
> >>> +    int ret;
> >>> +    struct irqaction *action;
> >>> +};
> >>> +
> >>> +static void notif_irq_enable(void *info)
> >>> +{
> >>> +    struct notif_irq_info *irq_info =3D info;
> >>> +
> >>> +    irq_info->ret =3D setup_irq(irq_info->irq, 0, irq_info->action);
> >>> +    if ( irq_info->ret )
> >>> +        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\=
n",
> >>> +               irq_info->irq, irq_info->ret);
> >>> +}
> >>> +
> >>> +void ffa_notif_init(void)
> >>> +{
> >>> +    const struct arm_smccc_1_2_regs arg =3D {
> >>> +        .a0 =3D FFA_FEATURES,
> >>> +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
> >>> +    };
> >>> +    struct notif_irq_info irq_info =3D { };
> >>> +    struct arm_smccc_1_2_regs resp;
> >>> +    unsigned int cpu;
> >>> +
> >>> +    arm_smccc_1_2_smc(&arg, &resp);
> >>> +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> >>> +        return;
> >>> +
> >>> +    irq_info.irq =3D resp.a2;
> >>> +    if ( irq_info.irq < GIC_SGI_STATIC_MAX || irq_info.irq >=3D NR_G=
IC_SGI )
> >>> +    {
> >>> +        printk(XENLOG_ERR "ffa: notification initialization failed: =
conflicting SGI %u\n",
> >>> +               irq_info.irq);
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    /*
> >>> +     * SGIs are per-CPU so we must enable the IRQ on each CPU. We us=
e an
> >>> +     * IPI to call notif_irq_enable() on each CPU including the curr=
ent
> >>> +     * CPU. The struct irqaction is preallocated since we can't allo=
cate
> >>> +     * memory while in interrupt context.
> >>> +     */
> >>> +    for_each_online_cpu(cpu)
> >>> +    {
> >>> +        irq_info.action =3D xmalloc(struct irqaction);
> >>
> >> You allocate one action per cpu but you have only one action pointer i=
n your structure
> >> which means you will overload the previously allocated one and lose tr=
ack.
> >>
> >> You should have a table of actions in your structure instead unless on=
e action is
> >> enough and can be reused on all cpus and in this case you should move =
out of
> >> your loop the allocation part.
> >
> > That shouldn't be needed because this is done in sequence only one CPU
> > at a time.
>
> Sorry i do not understand here.
> You have a loop over each online cpu and on each loop you are assigning
> irq_info.action with a newly allocated struct irqaction so you are in pra=
ctice
> overloading on cpu 2 the action that was allocated for cpu 1.
>
> What do you mean by sequence here ?
>

My understanding is that for_each_online_cpu(cpu) loops over each cpu,
one at a time. The call
on_selected_cpus(cpumask_of(cpu), notif_irq_enable, &irq_info, 1);
returns after notif_irq_enable() has returned on the CPU in question
thanks to the "1" (wait) parameter. So once it has returned &irq_info
isn't used by the other CPU any longer and we can assign a new value
to irq_info.action.

Thanks,
Jens

