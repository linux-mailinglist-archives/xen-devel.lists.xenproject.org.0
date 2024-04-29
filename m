Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8AC8B549C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 11:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713956.1114880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Njk-0005Vn-0d; Mon, 29 Apr 2024 09:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713956.1114880; Mon, 29 Apr 2024 09:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Njj-0005U0-UF; Mon, 29 Apr 2024 09:55:51 +0000
Received: by outflank-mailman (input) for mailman id 713956;
 Mon, 29 Apr 2024 09:55:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a10X=MC=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s1Njh-0005Tu-Si
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 09:55:49 +0000
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [2001:4860:4864:20::36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a696467f-060e-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 11:55:47 +0200 (CEST)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-233e41de0caso2245746fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 02:55:47 -0700 (PDT)
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
X-Inumbo-ID: a696467f-060e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714384546; x=1714989346; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7pdWgzTUxwKoBbIlrPKqmAJe3pjTz/fyQXgTS1c4DY=;
        b=CcLZjdvE8dwMBh6VCM2ibeN1Yi9x8fxOuaPiOawbk2RettyLLmNlgiQDWEJ3T4WcBB
         Zm6DskyQRcV0Go40bGwl7L7r4ZAhwNwhGEz+L0UvVs6aotsNOGEk5vLTQn8MvAEfifky
         QO5cPclU+N5ayCMZxjlL9a3Dt90UDVmLXi9Lov75Rs0JLkzG3IUs0X4ChYfIYu7smkWB
         HWxceVQ/YIWg4WczNiHO6EWL9UY++cejseOkfOdvb0vUtyhqGHVy32FtmyiFuT/ShcGH
         V3p/7nQKl4nc4+YMgWbuDXCWAKy/5yy43LwvayCYSYy/MfX84hXDt6PDIiJ/UbkmMFLm
         q7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714384546; x=1714989346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7pdWgzTUxwKoBbIlrPKqmAJe3pjTz/fyQXgTS1c4DY=;
        b=P/ILB46kM88W9+zr2VHkXBdPZ8JHiZJyS6DNYJpaT8EfG9PP/fR5bbgD7+rT8HoFV9
         Ih2iBxb4zGhZyKmxm/IeJRKTTP7qZWogiO+p5HoX8oFvmADn0/gkK7oaPcaZEmTRRUjo
         rZaeDllh6I11J+6aau68Te6VVlfXb8gvJC+Hm8YqP+pAblclKqTiJz11FaooXPvhhtgF
         xRtsrUPvt1w+cvfxgDxs325SoLXnvv49OA/Q3KjWQWHblC6KpTsDyTZcZ1D2T3mZeR0d
         kre0OyBU2xvrJ7TQol44Hxl4jrXnHYbUSRf3QC2dSKaWvQLn/cTrZ4rO0MM48TKOfkP3
         1AKg==
X-Gm-Message-State: AOJu0YwR/08GngCg/gicSOs4uOPY5Lt0CMLgaTlr9nQsAvuvbeUqKgPC
	CLXn8cXZu3W0NAUWRzjlXwqr0FhA6BoDFHYyPbBbY8tyKZyCbiDeeD95whlPGxLZpfLUhVmfmKY
	esqNSI3R+5ffijvjGsMLajI8Vv76QoFf+sUIC2zAmbicN34BG4Yw=
X-Google-Smtp-Source: AGHT+IEGtZtKn6e1NYtclir+2c8hj/ILdNKmUGN9nqh56DYq2Dl4LCf2m2oQJQDQEX9NOxodhFO0qQa3ucBuiilJNlc=
X-Received: by 2002:a05:6870:960e:b0:23a:fb36:ffb3 with SMTP id
 d14-20020a056870960e00b0023afb36ffb3mr10799239oaq.19.1714384546125; Mon, 29
 Apr 2024 02:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org> <807e4e70-f3b2-4b40-9004-d55bd9407bbf@xen.org>
In-Reply-To: <807e4e70-f3b2-4b40-9004-d55bd9407bbf@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 29 Apr 2024 11:55:34 +0200
Message-ID: <CAHUa44H+ZieqRSHEigziZVRiYus_nayL=2nooZPj8bkRcNTvJg@mail.gmail.com>
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Fri, Apr 26, 2024 at 7:58=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Jens,
>
> On 26/04/2024 09:47, Jens Wiklander wrote:
> > +static void notif_irq_enable(void *info)
> > +{
> > +    struct notif_irq_info *irq_info =3D info;
> > +
> > +    irq_info->ret =3D setup_irq(irq_info->irq, 0, irq_info->action);
> In v2, you were using request_irq(). But now you seem to be open-coding
> it. Can you explain why?

It's because request_irq() does a memory allocation that can't be done
in interrupt context.
>
> > +    if ( irq_info->ret )
> > +        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n"=
,
> > +               irq_info->irq, irq_info->ret);
> > +}
> > +
> > +void ffa_notif_init(void)
> > +{
> > +    const struct arm_smccc_1_2_regs arg =3D {
> > +        .a0 =3D FFA_FEATURES,
> > +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
> > +    };
> > +    struct notif_irq_info irq_info =3D { };
> > +    struct arm_smccc_1_2_regs resp;
> > +    unsigned int cpu;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> > +        return;
> > +
> > +    irq_info.irq =3D resp.a2;
> > +    if ( irq_info.irq < GIC_SGI_STATIC_MAX || irq_info.irq >=3D NR_GIC=
_SGI )
> > +    {
> > +        printk(XENLOG_ERR "ffa: notification initialization failed: co=
nflicting SGI %u\n",
> > +               irq_info.irq);
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * SGIs are per-CPU so we must enable the IRQ on each CPU. We use =
an
> > +     * IPI to call notif_irq_enable() on each CPU including the curren=
t
> > +     * CPU. The struct irqaction is preallocated since we can't alloca=
te
> > +     * memory while in interrupt context.
> > +     */
> > +    for_each_online_cpu(cpu)
> Even though we currently don't support CPU hotplug, you want to add a
> CPU Notifier to also register the IRQ when a CPU is onlined
> ffa_notif_init().
>
> For an example, see time.c. We may also want to consider to enable TEE
> in presmp_initcalls() so we don't need to have a for_each_online_cpu().

I was considering that too. I'll update the code.

Thanks,
Jens

