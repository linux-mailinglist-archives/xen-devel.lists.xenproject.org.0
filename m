Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A2E8B37C8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 15:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712793.1113635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0LDZ-0003qo-UG; Fri, 26 Apr 2024 13:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712793.1113635; Fri, 26 Apr 2024 13:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0LDZ-0003oU-Re; Fri, 26 Apr 2024 13:02:21 +0000
Received: by outflank-mailman (input) for mailman id 712793;
 Fri, 26 Apr 2024 13:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vyS=L7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s0LDY-0003oO-OB
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 13:02:20 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35bf4823-03cd-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 15:02:18 +0200 (CEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5a9ec68784cso1517769eaf.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 06:02:18 -0700 (PDT)
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
X-Inumbo-ID: 35bf4823-03cd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714136537; x=1714741337; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHMcwWaCG9GYk5WfcuZpFIxM87psXO84EspQY4xHPaU=;
        b=mZQ42TSaDPf4QEWraf1uX39CKQmN1WQA4O7PiN/aMJyq/AUOMjbfmKCD/Qrm26w1NZ
         TTvQuK3VjLYBr+J9d5/8KxVUGp2EMsNXwVl54S8kxw80+85qdUmckdhtWsuCHlgIpb9o
         mzTD1NdWy8sO5jZzJqgqOzWD5n/7HO1FSgxPnPontYdTGCJg7+UPDO+tUgEViKDtrhNM
         hgUrRTONmqp1tYOEXi732x0+3cTxCL3lKVokwa955sUkPxn3ds81SsxOK6jjujC9WoUR
         kXDohZI/XlPg6sDq/iznSujNm/gwDkcO0JMX9O03UKOH5S7FMcQLr2mwc9N8U8HOH878
         mJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714136537; x=1714741337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHMcwWaCG9GYk5WfcuZpFIxM87psXO84EspQY4xHPaU=;
        b=Q9J5ZrWESnKPWi8REAlwAfNmd+g2M9UghnPpUEFfTa4opFhHsft5v/VRRmRgM6sTZ6
         zfEq7zy/2UDMlUZA2iV33DmCFUANGZKfoc6uuCx9rS8G6eBX57B02DQkOd1iZ9q8U/lC
         rCQCc0UmLmsEv747yD6nGzyZP3Jey3EEemx9jo1q5HXB0zlCEg0fA39FSahkmcTd/Lhf
         peWQdS94SiVYQkXK6wbAnPzH8ffTTMmzXpeAV7CxcDnLJ8b0NCO5n2jjf1UcHmkcVedN
         2zAfrJ01Kt8KlonRz/OQutttoDeQlWD5UWw8CAj8QP1VUYagjv2h4A7twsatCrobmcak
         DU/Q==
X-Gm-Message-State: AOJu0Yz4LdvQsvBnfQmAaZeKT15W6SSCZZzl2lBYd2TU6yAp43Htq+mi
	4w9lLVSOnbY1wuqB+Dc8/tz/1otvEeuYyfT1iMOrBZfK3hX4kzkRcpxkwFTIEJb3nsHm/aZIfsN
	d0Vx8JX82ag0THfLcvUtUBG9tr8wATYLVaBmNYg==
X-Google-Smtp-Source: AGHT+IFQ0ricE03MQepWKE4ybP2re8cM5sl6vBvcz6lmb6Lc3LkrQR/Uqh+YfRwyka0xgiBBI+7ajzmU9lvdwxs3dmc=
X-Received: by 2002:a4a:d46:0:b0:5ac:c39b:3a7a with SMTP id
 67-20020a4a0d46000000b005acc39b3a7amr3534602oob.1.1714136536973; Fri, 26 Apr
 2024 06:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org> <A0908DCC-6E15-406B-8E29-F241B6EA8BE1@arm.com>
 <CAHUa44ETaCY2pbUjMOW5T2NSpmRCq3sWMjLUbK0DC2jpQxHJRQ@mail.gmail.com>
 <3A576E95-454B-4C66-A164-A2871DB4E2B2@arm.com> <CAHUa44EC_H7Q_A2M63dZnEGGNanyjGM6m2MuBg4_6BNEO-XDKA@mail.gmail.com>
 <42E71B74-157D-4A4E-AA57-2A93BB3D0007@arm.com>
In-Reply-To: <42E71B74-157D-4A4E-AA57-2A93BB3D0007@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 26 Apr 2024 15:02:04 +0200
Message-ID: <CAHUa44HhxHez35a95oEwnvMEObU_=6JrGVBc8rT5grFRHNUQyQ@mail.gmail.com>
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 2:41=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 26 Apr 2024, at 14:32, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Fri, Apr 26, 2024 at 2:19=E2=80=AFPM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 26 Apr 2024, at 14:11, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
> >>> Hi Bertrand,
> >>>
> >>> On Fri, Apr 26, 2024 at 11:20=E2=80=AFAM Bertrand Marquis
> >>> <Bertrand.Marquis@arm.com> wrote:
> >>>>
> >>>> Hi Jens,
> >>>>
> >>>>> On 26 Apr 2024, at 10:47, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> >>>>>
> > [...]
> >>>>> +struct notif_irq_info {
> >>>>> +    unsigned int irq;
> >>>>> +    int ret;
> >>>>> +    struct irqaction *action;
> >>>>> +};
> >>>>> +
> >>>>> +static void notif_irq_enable(void *info)
> >>>>> +{
> >>>>> +    struct notif_irq_info *irq_info =3D info;
> >>>>> +
> >>>>> +    irq_info->ret =3D setup_irq(irq_info->irq, 0, irq_info->action=
);
> >>>>> +    if ( irq_info->ret )
> >>>>> +        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %=
d\n",
> >>>>> +               irq_info->irq, irq_info->ret);
> >>>>> +}
> >>>>> +
> >>>>> +void ffa_notif_init(void)
> >>>>> +{
> >>>>> +    const struct arm_smccc_1_2_regs arg =3D {
> >>>>> +        .a0 =3D FFA_FEATURES,
> >>>>> +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
> >>>>> +    };
> >>>>> +    struct notif_irq_info irq_info =3D { };
> >>>>> +    struct arm_smccc_1_2_regs resp;
> >>>>> +    unsigned int cpu;
> >>>>> +
> >>>>> +    arm_smccc_1_2_smc(&arg, &resp);
> >>>>> +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> >>>>> +        return;
> >>>>> +
> >>>>> +    irq_info.irq =3D resp.a2;
> >>>>> +    if ( irq_info.irq < GIC_SGI_STATIC_MAX || irq_info.irq >=3D NR=
_GIC_SGI )
> >>>>> +    {
> >>>>> +        printk(XENLOG_ERR "ffa: notification initialization failed=
: conflicting SGI %u\n",
> >>>>> +               irq_info.irq);
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    /*
> >>>>> +     * SGIs are per-CPU so we must enable the IRQ on each CPU. We =
use an
> >>>>> +     * IPI to call notif_irq_enable() on each CPU including the cu=
rrent
> >>>>> +     * CPU. The struct irqaction is preallocated since we can't al=
locate
> >>>>> +     * memory while in interrupt context.
> >>>>> +     */
> >>>>> +    for_each_online_cpu(cpu)
> >>>>> +    {
> >>>>> +        irq_info.action =3D xmalloc(struct irqaction);
> >>>>
> >>>> You allocate one action per cpu but you have only one action pointer=
 in your structure
> >>>> which means you will overload the previously allocated one and lose =
track.
> >>>>
> >>>> You should have a table of actions in your structure instead unless =
one action is
> >>>> enough and can be reused on all cpus and in this case you should mov=
e out of
> >>>> your loop the allocation part.
> >>>
> >>> That shouldn't be needed because this is done in sequence only one CP=
U
> >>> at a time.
> >>
> >> Sorry i do not understand here.
> >> You have a loop over each online cpu and on each loop you are assignin=
g
> >> irq_info.action with a newly allocated struct irqaction so you are in =
practice
> >> overloading on cpu 2 the action that was allocated for cpu 1.
> >>
> >> What do you mean by sequence here ?
> >>
> >
> > My understanding is that for_each_online_cpu(cpu) loops over each cpu,
> > one at a time. The call
> > on_selected_cpus(cpumask_of(cpu), notif_irq_enable, &irq_info, 1);
> > returns after notif_irq_enable() has returned on the CPU in question
> > thanks to the "1" (wait) parameter. So once it has returned &irq_info
> > isn't used by the other CPU any longer and we can assign a new value
> > to irq_info.action.
>
> Right so you loose track of what was assigned so you are not able to
> free it.
> If that is wanted then why saving this in irq.action as you will only hav=
e
> there the one allocated for the last online cpu.

Wouldn't release_irq() free it? An error here is unlikely, but we may
be left with a few installed struct irqaction if it occurs. I can add
a more elaborate error path if it's worth the added complexity.

Thanks,
Jens

