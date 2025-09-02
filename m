Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B046CB40FF9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 00:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107594.1457969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utZO1-00014X-Qw; Tue, 02 Sep 2025 22:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107594.1457969; Tue, 02 Sep 2025 22:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utZO1-00012B-Nr; Tue, 02 Sep 2025 22:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1107594;
 Tue, 02 Sep 2025 22:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utZO0-000125-JW
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 22:21:56 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a7b7e66-884b-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 00:21:54 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f7a34fb35so2248660e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 15:21:53 -0700 (PDT)
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
X-Inumbo-ID: 3a7b7e66-884b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756851713; x=1757456513; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQypM20kVsD54oX5v8mDhtQA8PZenADmQOEGUfI9XJY=;
        b=IqobnaYNpfA0ylhHhWP3+Tj9vc8YC02EqHfmEcKdoq4W+ID4cUzw/fgPhoZs69zQdb
         tZSbDiYvWkLI4OCx56uZjp7rtEmkIjTR2le8nXLvrsg9OsR4B+EdMSC68wFg2CaxqZgY
         AOOMv8fQmzgcuxoqCbg+lsH/Pb6O1+zKzBb3Lv+T9+qxDGnvzI6cCmIVKVFvQ8gTbsez
         l//05KnFf6SsmpgAGetRwel2Owljj2peivjwluG4VmX8E0Pmez9fOprPJHnIpc1a6Nnu
         VJdJMq/65NaxoY6vwcpWr/fo5uYBPSVgJ/JCBiJ7CxUjRYJmESlVDR4Bo+TYfsULQpBL
         0B9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756851713; x=1757456513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQypM20kVsD54oX5v8mDhtQA8PZenADmQOEGUfI9XJY=;
        b=gixGuas7NNWktFd6mZExtbegUNK3WGBZQ/hLqqeb0HXtfU8fklKa5mjMnoueqqxwiF
         BoiKpQRopOoMdi4KtxMX0BfpQWwDMZQIdTc9yx6EgG8c2kXSBOH/tO1o1sRE0iQdz5rN
         rT4q0c04htn+ZNl/+KABdk6zQeIclTsqOFN/8odfkVDHX3bU8VdcREjCdS1zZWYQ78QY
         S70T8KPkEvuYuLKfiwKELEtmfhILjNT0nzzDKIprCMq5nrTccWXGs4rXuuAYz7iPOdw7
         swW4gFmymT6l1bLQPy9QnL8+4orakQqoP5OGKVA4cFKqxo8ykO1twRfnxgykOEscS75E
         pfWw==
X-Gm-Message-State: AOJu0Yzh6/Euj7zd5092EpxKprPVthTDJt9QGNl5LiYY1n5wbiYq8IEL
	OYYwNF0hyOWygJMKDYuT+1QHbuqd4fSZk94Y8dhQuPlWVa5JywR/MiwQbuK/Bf/Z4Evsyoa9lv3
	yFemaPKEUYmkzBHUCwtrULcGXVrGsrYw=
X-Gm-Gg: ASbGncsUlrJUh3tfyjZNkSaPkuelY+P31XTpwls6hhOOPnAOFRU2JK/2V9gRsaxjNf/
	71SCodComjE55eoPwWAVspAUJSX2NAd21r7SndYi3YWuBP7jOAi3BI+H3uJ3AW+9cwv1bdHGPpl
	TewXUvWxvRNoloQVcMwZeZ1A1hy79jjfsMz4TnSLYqYZPoQdGOeiflqHTF62AUrDxq/0kKZivtK
	PdBJYg0gwwxFXBa
X-Google-Smtp-Source: AGHT+IFGxJuRvg1FGeBW+e9xp2Y9kYy5F5Z9M1amwEp2ec0axbGRItnmvplg7sQ4Hk02Zn6vn5/Wjm+GmEVIqLG3d1o=
X-Received: by 2002:a05:6512:32cb:b0:55f:4fac:3f0c with SMTP id
 2adb3069b0e04-55f708db36cmr3713181e87.30.1756851712506; Tue, 02 Sep 2025
 15:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <18c51957660441c945d51b02be965fbcc19c7c2b.1756763487.git.mykola_kvach@epam.com>
 <0fb4d962-a92a-4b8b-805d-60a03fe1b734@gmail.com>
In-Reply-To: <0fb4d962-a92a-4b8b-805d-60a03fe1b734@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 3 Sep 2025 01:21:41 +0300
X-Gm-Features: Ac12FXwHNeXtdZtMB8tYdSk0_2dyXMbhvFVUdfekan3M5pmBuC0R90gdygSz5uI
Message-ID: <CAGeoDV-EgX1pW-T8JXEBiQqYTGZ7TzFtyNHbbxGSZBs3VKhXpQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] xen/arm: irq: Restore state of local IRQs during
 system resume
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 7:49=E2=80=AFPM Oleksandr Tyshchenko <olekstysh@gmai=
l.com> wrote:
>
>
>
> On 02.09.25 01:10, Mykola Kvach wrote:
>
> Hello Mykola
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
> > Changes in V6:
> > - Call handler->disable() instead of just setting the _IRQ_DISABLED fla=
g
> > - Move the system state check outside of restore_local_irqs_on_resume()
> > ---
> >   xen/arch/arm/irq.c | 39 +++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 39 insertions(+)
> >
> > diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > index 6c899347ca..ddd2940554 100644
> > --- a/xen/arch/arm/irq.c
> > +++ b/xen/arch/arm/irq.c
> > @@ -116,6 +116,41 @@ static int init_local_irq_data(unsigned int cpu)
> >       return 0;
> >   }
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
>
> NIT: Please, use "unsigned int" if irq cannot be negative
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
> > +        /* Disable the IRQ to avoid assertions in the following calls =
*/
> > +        desc->handler->disable(desc);
> > +        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
>
> Shouldn't we use GIC_PRI_IPI for SGIs?

I'll update the priority value in the next version.

Initially, I assumed gic_route_irq_to_xen() was used for all
interrupts with the same priority. But looking more closely, it
doesn't appear to be called for SGIs at all.

In fact, SGI configuration, including priority, is handled during CPU
initialization in gic_init_secondary_cpu(), which is called before
the CPU_STARTING notifier.

Given that, it's probably better to avoid updating SGI priorities here
entirely and rely on their boot-time configuration instead.

>
>
> > +        desc->handler->startup(desc);
> > +
> > +        spin_unlock(&desc->lock);
> > +    }
> > +
> > +    spin_unlock(&local_irqs_type_lock);
> > +}
> > +
> >   static int cpu_callback(struct notifier_block *nfb, unsigned long act=
ion,
> >                           void *hcpu)
> >   {
> > @@ -134,6 +169,10 @@ static int cpu_callback(struct notifier_block *nfb=
, unsigned long action,
> >               printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u=
\n",
> >                      cpu);
> >           break;
> > +    case CPU_STARTING:
> > +        if ( system_state =3D=3D SYS_STATE_resume )
> > +            restore_local_irqs_on_resume();
> > +        break;
>
> May I please ask, why all this new code (i.e.
> restore_local_irqs_on_resume()) is not covered by #ifdef
> CONFIG_SYSTEM_SUSPEND?
>
> >       }
> >
> >       return notifier_from_errno(rc);
>

