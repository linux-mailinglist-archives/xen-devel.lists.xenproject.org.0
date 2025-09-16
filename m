Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58BAB5934D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 12:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124587.1466872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uySmu-0007ix-J9; Tue, 16 Sep 2025 10:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124587.1466872; Tue, 16 Sep 2025 10:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uySmu-0007h9-GZ; Tue, 16 Sep 2025 10:19:52 +0000
Received: by outflank-mailman (input) for mailman id 1124587;
 Tue, 16 Sep 2025 10:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL7b=33=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uySms-0007gy-GE
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 10:19:50 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac6b6d9c-92e6-11f0-9809-7dc792cee155;
 Tue, 16 Sep 2025 12:19:48 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f98e7782bso6491643e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 03:19:48 -0700 (PDT)
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
X-Inumbo-ID: ac6b6d9c-92e6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758017988; x=1758622788; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJGhaFxrI3QvqCALSLc2lTh4znvwNyDw2PIa0ef8UTc=;
        b=iZzbxR+QXtsi0Vs6XxX0EeiK06tOfxwXEVUsfGPJmiwI7wGocpV6A1NeCNsxTEH1LC
         vJPUz82LgAKlZl7iBoo4NFwJFHOBzMihnfR0VlX7/LFUHEXrRz7Jg1+/svrX57H3itZG
         lUPu3o/l0UYwZtCHPQxS15Tmc5Tusl6PSBeE1sVN+NC+mXzDflPbF3dHe2Db3u0zPpCq
         q284XNaZcCrclnxQpkYUvIjGjeX/lIq1DdAhEVyk70hs+Uewnp/UpwkegbGAaxOf/WEx
         p0xc3x3BSJQV+CLIFn1t1jnuhZXrYZT/JqrP6UmWh+COTt5gUHs929mEEwyUZf0yc1xE
         Mrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017988; x=1758622788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJGhaFxrI3QvqCALSLc2lTh4znvwNyDw2PIa0ef8UTc=;
        b=g/0p8vbnDJS+uTIQYFgDFzKHaxXYUbl7MLtIPVssh8gpJ2ZZmJdMYMH2iYmfIYze50
         WLY2hwAfNJnMXkMVs648p2omunHH6kmZK27jcXi1RnemOrNXgtgdzJK/ZRBlujg9dSt+
         RAQwbZuniA+tmZDt61XTbGS3p8IOTiZCanmLt1XA6h3jBRRv+DC5CpsIntB+7DTf6pdm
         YX/GBVBKnD/11mL6CpUB6vLhVwwwwUYOLWUD7qEurWkrf6Oof5DxABdZ5VeBqfyKYXZc
         1k2+vRGaSvh+MLEP0hEpKSOxTdtTBVm4IHpMruVRGGsW94FSqjL8LEngNDresAgVl2pi
         xrKQ==
X-Gm-Message-State: AOJu0YwJVDS8exPDArGOIZeghg6ITtBTSbCYDscKsrs+V+J6La8By/LW
	gTfZO35OgEj5UWsEGY2ZOJc7PUW3pdHXQuK4J6wA/DlY7MOOziIEFn1pYqdv34FUIN4jgy2HZsH
	e13lypBZBjo23Xstfm42r7LVgPQkjyrE=
X-Gm-Gg: ASbGnctcUVIZded4ml32248xNqSVy/bythjCnHe743+AtxnBr6JxQHV995NKerx39zx
	zcrtZpMWEiBs1KC3NYzX9k+u44/jmnSsjCl/+F9FD2b0mzs7dgs+75PYUx/eKmRqwfdhu05G6rB
	prSaM2SxweOEwD2VLwim1n7Rv1vmF+zm8UViTd3CJ7HeCL7HGqvlvOX3RfJ3lLWPA8Xko0w+fsV
	qT++Q==
X-Google-Smtp-Source: AGHT+IG+zB1OqA8r0jCDQBM50rd7D3RT/EYwfe2xsMCAgjPj8rSeQHe3Tz1FLxAtGq/CX2pgLTr9JuwDwG06NTPIDMU=
X-Received: by 2002:a05:6512:3b97:b0:55f:3ae4:fe55 with SMTP id
 2adb3069b0e04-5763d4f8981mr685316e87.4.1758017987410; Tue, 16 Sep 2025
 03:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
 <0d0f4689-97e2-408f-91e4-dd59f47bdb95@xen.org>
In-Reply-To: <0d0f4689-97e2-408f-91e4-dd59f47bdb95@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 16 Sep 2025 13:19:36 +0300
X-Gm-Features: AS18NWD2GgZVJe0SKHZdEe-7g_RDtM1f2rth_di0bO15KJRo3yNTMQTSUMAfPwQ
Message-ID: <CAGeoDV9zgfyHaHb5W6+T4F9Hjxv_R5wnGkcbwcN2xgRUhY+v2w@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in setup_irq()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thank you for your review and the helpful comments.
I appreciate your time and feedback.

On Sat, Sep 13, 2025 at 1:01=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 03/09/2025 03:55, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Use GIC_PRI_IPI priority for SGI interrupts instead of the generic
> > GIC_PRI_IRQ priority in setup_irq().
> >
> > This change ensures that SGIs get the correct priority level when
> > being set up for Xen's use, maintaining proper interrupt precedence
> > in the system.
> >
> > The priority assignment now follows ARM GIC best practices:
> > - SGIs (0-15): GIC_PRI_IPI (higher priority)
> > - PPIs/SPIs (16+): GIC_PRI_IRQ (standard priority)
>
> Please provide a reference to the spec. But I don't follow why we should
> follow exactly what the spec suggest. This is up to us to decide what we
> want. Otherwise what's the point of having more than two priorities?

To clarify, the GIC specification does not require SGIs to have higher
priority than PPIs or SPIs. My reference to =E2=80=9Cbest practices=E2=80=
=9D is based on
how Xen typically configures SGIs with higher priority during initializatio=
n.
This is not a strict requirement, but it helps maintain interrupt precedenc=
e
in a way that aligns with established implementations.

If needed, PPIs or SPIs could be assigned higher priority depending on
system requirements.

>
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >   xen/arch/arm/irq.c | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > index 02ca82c089..17c7ac92b5 100644
> > --- a/xen/arch/arm/irq.c
> > +++ b/xen/arch/arm/irq.c
> > @@ -397,7 +397,13 @@ int setup_irq(unsigned int irq, unsigned int irqfl=
ags, struct irqaction *new)
> AFAIK, we are not using setup_irq() to handle SGIs because they are all
> static and always enabled. Are you planning to handle dynamic SGIs? If
> yes, then can you provide more details?As far as I know, there can be at =
least one =E2=80=9Cdynamic=E2=80=9D SGI in Xen.

As far as I know, there is at least one =E2=80=9Cdynamic=E2=80=9D SGI in Xe=
n. For
example, see ffa_notif.c in the functions ffa_notif_init_interrupt
and ffa_notif_init, which handle initialization of such SGIs.

>
> >       /* First time the IRQ is setup */
> >       if ( disabled )
> >       {
> > -        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
> > +        unsigned int prio =3D GIC_PRI_IRQ;
> > +
> > +        /* Use appropriate priority based on interrupt type */
> > +        if (desc->irq < NR_GIC_SGI)
> > +            prio =3D GIC_PRI_IPI;
>
> I am a bit split with this change. I feel static SGI (e.g. EVENT_CHECK,
> CALL_FUNCTION) should have higher priority to the dynamic SGIs because
> they are critical for Xen.

That=E2=80=99s a good point. My intention was to follow the general approac=
h of
assigning higher priority to SGIs, as done during GIC initialization.

>
> Before making my mind, I would like to understand a bit more the use case=
.
>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

