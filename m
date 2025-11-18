Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BCEC6A71C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165133.1491939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLO3Z-0002oo-0i; Tue, 18 Nov 2025 15:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165133.1491939; Tue, 18 Nov 2025 15:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLO3Y-0002lh-UA; Tue, 18 Nov 2025 15:55:48 +0000
Received: by outflank-mailman (input) for mailman id 1165133;
 Tue, 18 Nov 2025 15:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLO3X-0002lb-Dt
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:55:47 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ac5e962-c497-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:55:45 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-59431f57bf6so5878131e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:55:44 -0800 (PST)
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
X-Inumbo-ID: 0ac5e962-c497-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763481344; x=1764086144; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmCQ5Yz2tMK4rWZkBUZdB/rLk7V6Q/PG+TafV+tsdSM=;
        b=WvBUTd8OBcGIMxPhrXHxXsC26GDV5E6yDwPFYW0bBEC2sp+oYy6VzlL0+FGgYOYEGX
         R2KcNlsDZiQgY1TUZCre4bf4QXu9gMWMr0EK9Fu38NMxFGsBIs30RgoQcfcutmTT8oon
         gvuAjC3bh9HeLrpv5OeOYoeFatHW1zDNAEwh4Xzff9+Bzq14uDRDBRizh7TX15Kkqlno
         4ZhmC9tqcOeRetCgmgPV8STVD5QcdMlel6Wusety0aRyRIeCxRqu+XNZRD7c63Z2xyGa
         Xf/ar1U5L3lLNuWOqxQb+1AZ4MjzWch0OiHCcRKRxD1BVdPWo1khhnq1WWR01DJo+raZ
         cpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481344; x=1764086144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmCQ5Yz2tMK4rWZkBUZdB/rLk7V6Q/PG+TafV+tsdSM=;
        b=QkfZYmUkm7Gnf/qh57lXc2dMqvnVzlhBINOgqiPuhsl3XC70CRpCyHYIDxAjR/JBiq
         1QllMZvFoxK3+H4cKBgGrAejX06VogpIyK8S/c/9sF4fVzONCRo26+VzOiqo45JA7if0
         knW9p/I75hIx5uX4PpLD5DR7+03MstwK2PFe36t+NAvei/cHaGKsBvMdEUDQZKIfUYHS
         qr23tSMLhmDFiEhYlUYY+sTTZbmVHowsy90Tv733a1AlXeP3Zp7Uwmwsj3xfHuZ9wl/a
         JcX4DX/MpqpABfjbhpxgg2HesAo0ip9uLl4CGlb7xKp8CbO/YEFMKOq9P8y4hI9nMwnL
         Qwzg==
X-Gm-Message-State: AOJu0YxBDLN9Mx82YQ/njXkIOSTBitHHBGulSs3cPMO6RQi7IeRJ0mgg
	vhypVTbj4s9jrKxGoZXQe+4KHQFCc48cbfxyrGvg5zWyDAJTUHtUSrJQTuMVNx8KTbiKIsxD5PW
	ZdYtQqyHAWGjSK7YrxPmQv4QhFV4OPmI=
X-Gm-Gg: ASbGncv26Q7SL6mMmsTc1vNacwCOy/wyFR7b8g0x+HBJMyVawqFPqx5U6ijlY5YkwIz
	8q2BdVwIKlm9arVLJvu7786wMAlsMXZIpfE8ufOG1qJR9AycQZN+FxGUYnDEGuxOs5LU6v2NiwK
	7qYNwJS0dMCFq+mgTJww0AVI/jfj57niWimm0jYMk+r9hWaIPillVrHOfI/93XiMez8+G7pALAa
	FKLo/G/JdyP59j+GMyl06eipvPSVn81QymaPQbE+2I+JlJGSGraKo81tAM=
X-Google-Smtp-Source: AGHT+IGex/SbzY5WvQlUFm9l/y3jFWxhhf/eHjkUryKurRFs4xn9j72sN6CHuSOEdvc6Uc4Aqfa+BvzQMAYWkiVLieA=
X-Received: by 2002:a05:6512:124b:b0:595:9d6b:1192 with SMTP id
 2adb3069b0e04-5959d6b131fmr107589e87.3.1763481344180; Tue, 18 Nov 2025
 07:55:44 -0800 (PST)
MIME-Version: 1.0
References: <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
 <0d0f4689-97e2-408f-91e4-dd59f47bdb95@xen.org> <CAGeoDV9zgfyHaHb5W6+T4F9Hjxv_R5wnGkcbwcN2xgRUhY+v2w@mail.gmail.com>
In-Reply-To: <CAGeoDV9zgfyHaHb5W6+T4F9Hjxv_R5wnGkcbwcN2xgRUhY+v2w@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 17:55:33 +0200
X-Gm-Features: AWmQ_blhoTtQAtqaA9niqb69pw1gLDTqhOP28V8vXXd7wyHph5nV6jcxbjoY7To
Message-ID: <CAGeoDV-qcfni8ihaU-L8E_e3ctd1A8mc2CQ4NfAunqFY37NiBw@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in setup_irq()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Gentle ping on this patch.

About two months ago I replied to your questions on the priority choice
and on the dynamic SGI use case (ffa_notif). Could you let me know
whether my explanation makes sense, and if you would like me to rework
the patch?

If you think the current approach is not acceptable, I am also happy to
drop or redesign it based on your guidance.

It would also be helpful to get feedback from other Arm maintainers.

Thanks,
Mykola

On Tue, Sep 16, 2025 at 1:19=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> Hi Julien,
>
> Thank you for your review and the helpful comments.
> I appreciate your time and feedback.
>
> On Sat, Sep 13, 2025 at 1:01=E2=80=AFAM Julien Grall <julien@xen.org> wro=
te:
> >
> > Hi Mykola,
> >
> > On 03/09/2025 03:55, Mykola Kvach wrote:
> > > From: Mykola Kvach <mykola_kvach@epam.com>
> > >
> > > Use GIC_PRI_IPI priority for SGI interrupts instead of the generic
> > > GIC_PRI_IRQ priority in setup_irq().
> > >
> > > This change ensures that SGIs get the correct priority level when
> > > being set up for Xen's use, maintaining proper interrupt precedence
> > > in the system.
> > >
> > > The priority assignment now follows ARM GIC best practices:
> > > - SGIs (0-15): GIC_PRI_IPI (higher priority)
> > > - PPIs/SPIs (16+): GIC_PRI_IRQ (standard priority)
> >
> > Please provide a reference to the spec. But I don't follow why we shoul=
d
> > follow exactly what the spec suggest. This is up to us to decide what w=
e
> > want. Otherwise what's the point of having more than two priorities?
>
> To clarify, the GIC specification does not require SGIs to have higher
> priority than PPIs or SPIs. My reference to =E2=80=9Cbest practices=E2=80=
=9D is based on
> how Xen typically configures SGIs with higher priority during initializat=
ion.
> This is not a strict requirement, but it helps maintain interrupt precede=
nce
> in a way that aligns with established implementations.
>
> If needed, PPIs or SPIs could be assigned higher priority depending on
> system requirements.
>
> >
> > >
> > > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > > ---
> > >   xen/arch/arm/irq.c | 8 +++++++-
> > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > > index 02ca82c089..17c7ac92b5 100644
> > > --- a/xen/arch/arm/irq.c
> > > +++ b/xen/arch/arm/irq.c
> > > @@ -397,7 +397,13 @@ int setup_irq(unsigned int irq, unsigned int irq=
flags, struct irqaction *new)
> > AFAIK, we are not using setup_irq() to handle SGIs because they are all
> > static and always enabled. Are you planning to handle dynamic SGIs? If
> > yes, then can you provide more details?As far as I know, there can be a=
t least one =E2=80=9Cdynamic=E2=80=9D SGI in Xen.
>
> As far as I know, there is at least one =E2=80=9Cdynamic=E2=80=9D SGI in =
Xen. For
> example, see ffa_notif.c in the functions ffa_notif_init_interrupt
> and ffa_notif_init, which handle initialization of such SGIs.
>
> >
> > >       /* First time the IRQ is setup */
> > >       if ( disabled )
> > >       {
> > > -        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
> > > +        unsigned int prio =3D GIC_PRI_IRQ;
> > > +
> > > +        /* Use appropriate priority based on interrupt type */
> > > +        if (desc->irq < NR_GIC_SGI)
> > > +            prio =3D GIC_PRI_IPI;
> >
> > I am a bit split with this change. I feel static SGI (e.g. EVENT_CHECK,
> > CALL_FUNCTION) should have higher priority to the dynamic SGIs because
> > they are critical for Xen.
>
> That=E2=80=99s a good point. My intention was to follow the general appro=
ach of
> assigning higher priority to SGIs, as done during GIC initialization.
>
> >
> > Before making my mind, I would like to understand a bit more the use ca=
se.
> >
> > Cheers,
> >
> > --
> > Julien Grall
> >
>
> Best regards,
> Mykola

