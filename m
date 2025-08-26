Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A1B364E3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094420.1449748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwP-0008Ph-Tn; Tue, 26 Aug 2025 13:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094420.1449748; Tue, 26 Aug 2025 13:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwP-0008Nt-PN; Tue, 26 Aug 2025 13:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1094420;
 Tue, 26 Aug 2025 13:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqtwO-0007MD-Kq
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:42:24 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f336bdf-8282-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 15:42:24 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3367f35d129so14258181fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 06:42:24 -0700 (PDT)
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
X-Inumbo-ID: 7f336bdf-8282-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756215743; x=1756820543; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnaOqRCWc8b654/XwwpXZoEHzRvpKDZrAMeumSj2xd8=;
        b=LPXomDm4aSTwZP51YTETMpaKFglMNI8yXhQNBEmlNHhHA99ADtm1LeZof9XAyhRpGE
         whT+hnTl+/T1Id+tvAGllk3St5PBMqzga3lJQa1Ek+eQYOd4z/ZzeDuVlUyVpfPVNkPo
         DGLDPa7b/P9drfcjYrYKu2MuQIx5ouKmmOYlCBj6EcKMX4IAidR1zkMgjREHhazpQlN5
         lKfU5Ky9p7R6lPZX9OmVRWbfid7wCguW28wZ8U4VyYa0kGrWuBeK/fDDTumCgL6xpm4t
         nU6snZgFDSgHOUFKqzHeyWnGZmw1C8/IU8gbGaF/O6FhAEMxLUjPO09+o/nNZwccXTKr
         iOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215743; x=1756820543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnaOqRCWc8b654/XwwpXZoEHzRvpKDZrAMeumSj2xd8=;
        b=AwHYk6qd7Dpgm70ME0RoQ1yTu+iJ+0BkEpYe8BlO6gajik1ys9MOm3XfCySqSoHPsq
         IaJyE70dwEBLFBn5TNvbuc1TjvoK4321WU1QILpu0XOpvveoDL7wLNlZclzBT9ICzB9Q
         ym1+tVeXY3JEfq/KauFUleSA3RfI5G16L6BpJKeEewN2hMW10yHDK8+JogXbTBrcSqXT
         I6mp862zpvxMhW1L6npHu/02y1isQOHp5JzW19gXm9HS334lk3K6X/0NAX2R/vGV/PcB
         aDz6f7ZdQIPBd8hSSFd/TtBmJpQ+K0Yi41jGPko7Xnz+RRRGnas9ffLQ5rYhSkekPFCi
         obTg==
X-Gm-Message-State: AOJu0Yys6JPbud66ct4oALxKCVc8kt15eWR5siQvN6oYpvKnHLP0uNtj
	YHH5ThK8BvUMIQJGc5f3PunL1XCq6LUcNgTp8BKjicmq9uDAf/2Amo2oZrDcg4LQb15QDzH39uv
	PBcPTbSMKccm/EFU/OAG1gI8irM2KWcU=
X-Gm-Gg: ASbGncuqVluhHTqBOSgzZqB/H+O0tGkiOiYMkdXTZyte+6wAMaF2Pvb0E95S3JTPVju
	3UqOOfAqxAMfaG+mG2kyPF5dtgktJNaKcjsysqnvbUhxaBtybcGddmg8QcJ09HgYRzTnwrF+hsg
	Rtf04iTho0OZDaFNviYyQmp9mZTbnusOvepWTjvGvqknmxgbEgmTn/ZmWVii8kKAiCA5SvnFRJZ
	BHsLQ==
X-Google-Smtp-Source: AGHT+IH//yRuM1FqfeXTKhILIlT9lcQnPijRfnb9hxuttzNT3+RGc28R0T8wMNb4j0+8FT/+zuKbsyQG/6BwJC3APR8=
X-Received: by 2002:a05:651c:3247:10b0:32b:7614:5745 with SMTP id
 38308e7fff4ca-33650f647f2mr29916881fa.20.1756215742777; Tue, 26 Aug 2025
 06:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <779a90853f249f8d8c4973874baeee1f787e92e0.1754943875.git.mykola_kvach@epam.com>
 <877byuamrm.fsf@epam.com>
In-Reply-To: <877byuamrm.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 16:42:11 +0300
X-Gm-Features: Ac12FXyr_bjT2cYCw1pEfeLkfmN0Ea2lDw9aoEZkPzZGs-2yObHBM9dNf0aOtSI
Message-ID: <CAGeoDV-ge7L-=b8GoDnBSXG6aefAOo6VAmUvPvnKkSf48AjLcQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] xen/arm: irq: Restore state of local IRQs during
 system resume
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Sat, Aug 23, 2025 at 3:45=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > On ARM, the first 32 interrupts (SGIs and PPIs) are banked per-CPU
> > and not restored by gic_resume (for secondary cpus).
> >
> > This patch introduces restore_local_irqs_on_resume, a function that
> > restores the state of local interrupts on the target CPU during
> > system resume.
> >
> > It iterates over all local IRQs and re-enables those that were not
> > disabled, reprogramming their routing and affinity accordingly.
> >
> > The function is invoked from start_secondary, ensuring that local IRQ
> > state is restored early during CPU bring-up after suspend.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/arch/arm/irq.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > index 148f184f8b..b3ff38dc27 100644
> > --- a/xen/arch/arm/irq.c
> > +++ b/xen/arch/arm/irq.c
> > @@ -113,6 +113,47 @@ static int init_local_irq_data(unsigned int cpu)
> >      return 0;
> >  }
> >
> > +/*
> > + * The first 32 interrupts (PPIs and SGIs) are per-CPU,
> > + * so call this function on the target CPU to restore them.
> > + *
> > + * SPIs are restored via gic_resume.
> > + */
> > +static void restore_local_irqs_on_resume(void)
> > +{
> > +    int irq;
> > +
> > +    if ( system_state !=3D SYS_STATE_resume )
> > +        return;
>
> Maybe it is better to move this check to restore_local_irqs_on_resume()
> caller? You can put ASSERT(system_state =3D=3D SYS_STATE_resume) there
> instead.
>
> I am saying this because name of restore_local_irqs_on_resume() implies t=
hat it
> should be called only on resume.

Not a problem.
I'll move checking outside the function.

>
> > +
> > +    spin_lock(&local_irqs_type_lock);
> > +
> > +    for ( irq =3D 0; irq < NR_LOCAL_IRQS; irq++ )
> > +    {
> > +        struct irq_desc *desc =3D irq_to_desc(irq);
> > +
> > +        spin_lock(&desc->lock);
> > +
> > +        if ( test_bit(_IRQ_DISABLED, &desc->status) )
> > +        {
> > +            spin_unlock(&desc->lock);
> > +            continue;
> > +        }
> > +
> > +        /* it is needed to avoid asserts in below calls */
> > +        set_bit(_IRQ_DISABLED, &desc->status);
>
> Assert in the call below isn't just because. You need to either call
> desc->handler->disable() to properly disable the IRQ or justify why it
> is fine to just set the bit.

Got it. I=E2=80=99ll call the disable handler here instead.

>
> > +
> > +        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
> > +
> > +        /* _IRQ_DISABLED is cleared by below call */
> > +        desc->handler->startup(desc);
> > +
> > +        spin_unlock(&desc->lock);
> > +    }
> > +
> > +    spin_unlock(&local_irqs_type_lock);
> > +}
> > +
> >  static int cpu_callback(struct notifier_block *nfb, unsigned long acti=
on,
> >                          void *hcpu)
> >  {
> > @@ -131,6 +172,9 @@ static int cpu_callback(struct notifier_block *nfb,=
 unsigned long action,
> >              printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\=
n",
> >                     cpu);
> >          break;
> > +    case CPU_STARTING:
> > +        restore_local_irqs_on_resume();
> > +        break;
> >      }
> >
> >      return notifier_from_errno(rc);
>
> --
> WBR, Volodymyr

Best regards,
Mykola

