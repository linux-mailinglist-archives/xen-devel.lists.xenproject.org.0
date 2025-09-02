Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AF6B40C56
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 19:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107204.1457720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utV3F-0003W7-Rs; Tue, 02 Sep 2025 17:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107204.1457720; Tue, 02 Sep 2025 17:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utV3F-0003Tn-Ob; Tue, 02 Sep 2025 17:44:13 +0000
Received: by outflank-mailman (input) for mailman id 1107204;
 Tue, 02 Sep 2025 17:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utV3E-0003Tb-5i
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 17:44:12 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f03f3e4-8824-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 19:44:11 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f7b6e4145so2235812e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 10:44:11 -0700 (PDT)
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
X-Inumbo-ID: 6f03f3e4-8824-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756835051; x=1757439851; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jn/viCOgNFC0lTtvUQY7w4C+puM3z+1KjMHgAJ8xAL4=;
        b=FTmVwl9vt1AYMC1VpLQeHlhZF3213aBzG8KKbwqp/z/xNoJc0mKwepsc4xqX4nmTux
         h6uaUFBFoWsaHt6OsEMBk2PZltNqpVOLAlwkl7Uzx2K5mKdKIEgQzF1X/9t/hfeaQx/6
         g5ORBV/seGWbs8a0MbWyNM6W6qVmeCrkr7gZeYiJNID4isi6tiMk723FgIu6MAyN3Ws+
         mZ+lLaSj82crECu1sxXXCmFoxUf01tei1GuXAVVqh0ubIzsY6AwFq4jc+8APQuHvO4/r
         +m9FpkEIpxHuQSciCvHcCWA2qypW+gSHCACeUlzGnwdmhu2aUVRa8mPfjgYVxWhPtF0z
         tOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756835051; x=1757439851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jn/viCOgNFC0lTtvUQY7w4C+puM3z+1KjMHgAJ8xAL4=;
        b=m/JjEPLPvKYTjW1lmJB9I9nziQ+o11SLRDB2rQWZWKp4DPk24bzypqfb/pnhIgzEXo
         ta5LwSfY6mLz/hyPYZSDiW31+Ex/A0iaBL9eOU8mtwRCfm+iKVbU+Vbu5LGUfBpb44UD
         uswOgPlR4UPEgHWqZRrnNByPa4yLutgVu91HMejQLe/sGNfzZKefXOE32R5pvwE2oglG
         t90ofEMKIFB35/1iJdGsaEP4LKqg6kxMKWsp1ElYVateILUuJn82Rre4dD2QxFKKjz1Z
         Y0Ff6Ear4SL+EKZkfO+qdTzTtSeMW6H1iY6A49DQG8FYPgBBYUPifYuxKrGf+cQCXQ+g
         h40g==
X-Gm-Message-State: AOJu0Yx9MuwHK2S44reBCBkHIupnc9ZFXlimOjh84zTXIhX7qPZO0Pa0
	AxuXA2zU1BYa46lHDVlXYh0J4ggUuQwVFPF3pWLVJnZLTJFerCwFDycVRCqwKBTGimXMqjyew2W
	jJEwpC8jmK+qEKT60yI4ky2qvzujTRGU=
X-Gm-Gg: ASbGncv8aWcDf5U+JQsyly+5ELfXKRzP3Ma30u6aIDy6T8vyossp/4V/Dh+8wn4kthR
	8DmEZpu5idKhZ6ix1gUyKYkEGSJLzlUvU7lMddfQh9v3GFe/1OEAAuyuolKVO3M2XcizUt0Uwaq
	oA0F2f9cLov166kc2V4JxJyAf0niEV6V78bMinX55gE1E88Wm11i87vgeqMuoJ6sPCLkTbILXt9
	3Jhxg==
X-Google-Smtp-Source: AGHT+IG73TqjaNimC4QjloHojVsBYgWmznJdrSPuUU/471DjQJ8EKH7nk4g+9/JkRD/xVddemGACp2tz1U9kmzq0veQ=
X-Received: by 2002:a05:6512:6203:b0:55f:4423:f52 with SMTP id
 2adb3069b0e04-55f708ec8dbmr3245061e87.37.1756835050302; Tue, 02 Sep 2025
 10:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <18c51957660441c945d51b02be965fbcc19c7c2b.1756763487.git.mykola_kvach@epam.com>
 <0fb4d962-a92a-4b8b-805d-60a03fe1b734@gmail.com>
In-Reply-To: <0fb4d962-a92a-4b8b-805d-60a03fe1b734@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 2 Sep 2025 20:43:59 +0300
X-Gm-Features: Ac12FXwIzD4h6VOCwZvg7vfzLS1DJ2hYUEQGaQJvY2A8ggx63NKxPpnfiVAjTY0
Message-ID: <CAGeoDV_XPjkpniPkaPXd82B80Q0qutfmXyRKedvRkWCkbL8bmQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] xen/arm: irq: Restore state of local IRQs during
 system resume
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

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

ok

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

Yes, we should. But currently I am restoring the same value
as it was before suspend...

I definitely agree that this needs to be fixed at the original
place where the issue was introduced, but I was planning to
address it in a future patch.

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

I don=E2=80=99t see a reason to introduce such "macaron-style" code. On ARM=
, the
system suspend state is only set when CONFIG_SYSTEM_SUSPEND is defined
anyway.

If you would prefer me to wrap all relevant code with this define, please
let me know and I=E2=80=99ll make the change. In this case, I think the cur=
rent
approach is cleaner, but I=E2=80=99m open to your opinion.

>
> >       }
> >
> >       return notifier_from_errno(rc);
>

Best regards,
Mykola

