Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69C2B40E77
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107400.1457830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXTc-0002RC-2T; Tue, 02 Sep 2025 20:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107400.1457830; Tue, 02 Sep 2025 20:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXTb-0002Ph-W1; Tue, 02 Sep 2025 20:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1107400;
 Tue, 02 Sep 2025 20:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utXTb-0002Pb-B8
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:19:35 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23258f48-883a-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 22:19:32 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55f72452a8eso3822679e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 13:19:32 -0700 (PDT)
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
X-Inumbo-ID: 23258f48-883a-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756844372; x=1757449172; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg5CC8giSLI9lHr4w/CbFA6ZTg9IkPNj6lNJrLtIztM=;
        b=HbChGueF8SJ5mDAZaXtBTPmkcPYVx6lSNqyFuF63FCLz8SBnZITzeNDzZcbbxqLcfP
         RRpKnVW1L5WJ+0ANEoQn3KvZHcB73DlCHoJmKU1N8CXy0fphjGmVDG7RAfofSauotgob
         rIjJ4rY3CHGIdg6EiDvkx6WnocAQ/oSEFDZRu+MgvjD4UgfEBw6trawijDKKpd7QsjQQ
         I/ccYSI4e1loUYqr5W6ywQyLZ4VNe5TGPCu3MArhmVhUVZatyUe1TDG5LPz019ZEWr0E
         Quv6pay0C92r2ztrBZMTaMVseF4B1A+WAiHDKMhWdEfgMaj8S4ukRbuPpQQ/avnCOljN
         XYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756844372; x=1757449172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cg5CC8giSLI9lHr4w/CbFA6ZTg9IkPNj6lNJrLtIztM=;
        b=fYAukayRODHLsm3eY8ZlT/1y4/0mqQ5ldxDlAaUAZ3eks+Kdha/Eg+YNOUXAK1pX+1
         RNrjBNSIF6QVVzr5Bf+hkDaQskRgx9bhGPiwrkKRdCXdXoqzJ5JJuCyAOJdoqqz4uf1B
         diDDU9h5USlDzNuvQl8U2Kcf7RsyX20iXEMLvVgDvu1uCwIdxxtQDzD3ogWkLH6ssneu
         B+CBeML8QzH7YeC7/xsgpW40dUqUJYRzVNVKAsQWgoCpjO56HAHS1R88qSbiOn68KpbW
         EIdEXu6MT5OOgU0AYVzjehuY2gdlCzAOD11u7J9anN+r6jmTuyPDhOzJ8ymM44vOs+af
         b85A==
X-Gm-Message-State: AOJu0YzK+L6MrPdF1/8hNxFH5W/Ttw4f2BkGDOZHpQLGzhG9XiiS56Jy
	oOR3HlRczDlznCF52JEotW0ik0nK7+0JF5H16fNj9k76zFKyZlU9WpGtdaDg22+gMnEHgvRaS+q
	QwC9xXNRdIjYoHu4JF2r4PASalhkS7XI=
X-Gm-Gg: ASbGncvMiD+y94iNplOAHGi63bViTVCoq1HX3E81cv1Ub7+vkRBEsDjtjCQW28s4ri4
	xTNYLIFf42shnVhZtF3Cw8YTdyM0CVf7e+5nQwGR3TlshlJZsUvaqHjdMmQcovtmZNNK0osldMX
	jiXzxIm+mgdo31v94534XlwO8tWFEhb4OZScKSLwQEYuhlDyLbHAcPCwLW4wswftZw9+O7Tn7yX
	Et6QHRDxm+/A07h
X-Google-Smtp-Source: AGHT+IEAINxbtFlFQyPaFDgwf4yU9NLGLtstkjlQM0k5sBtufP5f2W0dEhtr0zEjUeNzjNdCw0eT9Q238VjMBlKi1eg=
X-Received: by 2002:a05:6512:4017:b0:55f:63ef:b2b3 with SMTP id
 2adb3069b0e04-55f708b7024mr3258255e87.22.1756844371809; Tue, 02 Sep 2025
 13:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <18c51957660441c945d51b02be965fbcc19c7c2b.1756763487.git.mykola_kvach@epam.com>
 <0fb4d962-a92a-4b8b-805d-60a03fe1b734@gmail.com> <CAGeoDV_XPjkpniPkaPXd82B80Q0qutfmXyRKedvRkWCkbL8bmQ@mail.gmail.com>
 <f7554cc0-893b-44a6-8987-7508dfeaba97@gmail.com> <CAGeoDV9ZyEw69a=-fT+MSjt4E+w3kZj-eUwRLrMvChNMMSU53Q@mail.gmail.com>
In-Reply-To: <CAGeoDV9ZyEw69a=-fT+MSjt4E+w3kZj-eUwRLrMvChNMMSU53Q@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 2 Sep 2025 23:19:20 +0300
X-Gm-Features: Ac12FXwwKHNF0p6YG3oQafV25qOuzWb1DLqsCKI-22JhNXOziPuxpU8271CuIAA
Message-ID: <CAGeoDV8=rw5ziF+QctcuA2qurqCVXZKZfdNX+tagXc1axw3vow@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] xen/arm: irq: Restore state of local IRQs during
 system resume
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 11:08=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> On Tue, Sep 2, 2025 at 9:16=E2=80=AFPM Oleksandr Tyshchenko <olekstysh@gm=
ail.com> wrote:
> >
> >
> >
> > On 02.09.25 20:43, Mykola Kvach wrote:
> > > Hi Oleksandr,
> >
> > Hello Mykola
> >
> > >
> > > On Tue, Sep 2, 2025 at 7:49=E2=80=AFPM Oleksandr Tyshchenko <olekstys=
h@gmail.com> wrote:
> > >>
> > >>
> > >>
> > >> On 02.09.25 01:10, Mykola Kvach wrote:
> > >>
> > >> Hello Mykola
> > >>
> > >>> From: Mykola Kvach <mykola_kvach@epam.com>
> > >>>
> > >>> On ARM, the first 32 interrupts (SGIs and PPIs) are banked per-CPU
> > >>> and not restored by gic_resume (for secondary cpus).
> > >>>
> > >>> This patch introduces restore_local_irqs_on_resume, a function that
> > >>> restores the state of local interrupts on the target CPU during
> > >>> system resume.
> > >>>
> > >>> It iterates over all local IRQs and re-enables those that were not
> > >>> disabled, reprogramming their routing and affinity accordingly.
> > >>>
> > >>> The function is invoked from start_secondary, ensuring that local I=
RQ
> > >>> state is restored early during CPU bring-up after suspend.
> > >>>
> > >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > >>> ---
> > >>> Changes in V6:
> > >>> - Call handler->disable() instead of just setting the _IRQ_DISABLED=
 flag
> > >>> - Move the system state check outside of restore_local_irqs_on_resu=
me()
> > >>> ---
> > >>>    xen/arch/arm/irq.c | 39 +++++++++++++++++++++++++++++++++++++++
> > >>>    1 file changed, 39 insertions(+)
> > >>>
> > >>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > >>> index 6c899347ca..ddd2940554 100644
> > >>> --- a/xen/arch/arm/irq.c
> > >>> +++ b/xen/arch/arm/irq.c
> > >>> @@ -116,6 +116,41 @@ static int init_local_irq_data(unsigned int cp=
u)
> > >>>        return 0;
> > >>>    }
> > >>>
> > >>> +/*
> > >>> + * The first 32 interrupts (PPIs and SGIs) are per-CPU,
> > >>> + * so call this function on the target CPU to restore them.
> > >>> + *
> > >>> + * SPIs are restored via gic_resume.
> > >>> + */
> > >>> +static void restore_local_irqs_on_resume(void)
> > >>> +{
> > >>> +    int irq;
> > >>
> > >> NIT: Please, use "unsigned int" if irq cannot be negative
> > >
> > > ok
> > >
> > >>
> > >>> +
> > >>> +    spin_lock(&local_irqs_type_lock);
> > >>> +
> > >>> +    for ( irq =3D 0; irq < NR_LOCAL_IRQS; irq++ )
> > >>> +    {
> > >>> +        struct irq_desc *desc =3D irq_to_desc(irq);
> > >>> +
> > >>> +        spin_lock(&desc->lock);
> > >>> +
> > >>> +        if ( test_bit(_IRQ_DISABLED, &desc->status) )
> > >>> +        {
> > >>> +            spin_unlock(&desc->lock);
> > >>> +            continue;
> > >>> +        }
> > >>> +
> > >>> +        /* Disable the IRQ to avoid assertions in the following ca=
lls */
> > >>> +        desc->handler->disable(desc);
> > >>> +        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
> > >>
> > >> Shouldn't we use GIC_PRI_IPI for SGIs?
> > >
> > > Yes, we should. But currently I am restoring the same value
> > > as it was before suspend...
> > >
> > > I definitely agree that this needs to be fixed at the original
> > > place where the issue was introduced, but I was planning to
> > > address it in a future patch.
> > >
> > >>
> > >>
> > >>> +        desc->handler->startup(desc);
> > >>> +
> > >>> +        spin_unlock(&desc->lock);
> > >>> +    }
> > >>> +
> > >>> +    spin_unlock(&local_irqs_type_lock);
> > >>> +}
> > >>> +
> > >>>    static int cpu_callback(struct notifier_block *nfb, unsigned lon=
g action,
> > >>>                            void *hcpu)
> > >>>    {
> > >>> @@ -134,6 +169,10 @@ static int cpu_callback(struct notifier_block =
*nfb, unsigned long action,
> > >>>                printk(XENLOG_ERR "Unable to allocate local IRQ for =
CPU%u\n",
> > >>>                       cpu);
> > >>>            break;
> > >>> +    case CPU_STARTING:
> > >>> +        if ( system_state =3D=3D SYS_STATE_resume )
> > >>> +            restore_local_irqs_on_resume();
> > >>> +        break;
> > >>
> > >> May I please ask, why all this new code (i.e.
> > >> restore_local_irqs_on_resume()) is not covered by #ifdef
> > >> CONFIG_SYSTEM_SUSPEND?
> > >
> > > I don=E2=80=99t see a reason to introduce such "macaron-style" code. =
On ARM, the
> > > system suspend state is only set when CONFIG_SYSTEM_SUSPEND is define=
d
> > > anyway.
> >
> > right
> >
> > >
> > > If you would prefer me to wrap all relevant code with this define, pl=
ease
> > > let me know and I=E2=80=99ll make the change. In this case, I think t=
he current
> > > approach is cleaner, but I=E2=80=99m open to your opinion.
> >
> > In other patches, you seem to wrap functions/code that only get called
> > during suspend/resume with #ifdef CONFIG_SYSTEM_SUSPEND, so I wondered
> > why restore_local_irqs_on_resume() could not be compiled out
> > if the feature is not enabled. But if you still think it would be
> > cleaner this way (w/o #ifdef), I would be ok.
>
> It=E2=80=99s not entirely true -- I only wrapped code that has a direct d=
ependency
> on host_system_suspend(), either being called from it or required for its
> correct operation.
>
> If you look through this patch series for the pattern:
> SYS_STATE_(suspend|resume)
>
> you=E2=80=99ll see that not all suspend/resume-related code is wrapped in
> #ifdef CONFIG_SYSTEM_SUSPEND. This is intentional -- the same applies to
> some code already merged into the common parts of Xen.
>
> So restore_local_irqs_on_resume is consistent with the existing approach
> in all cpu notifier blocks.

Of course, I can wrap all code in this patch series if needed. For me, the
current approach looks clearer and aligns with existing code. On the other
hand, I introduced this config option not so long ago, so that may be why
some parts in common code and even in some architectures like x86 are still
uncovered.

In any case, I don't mind covering all the code if you think it would be be=
tter.
Right now, this implementation is mainly my preference and aligns with the
existing code. There isn't any other reasoning behind this decision.


>
> >
> > >
> > >>
> > >>>        }
> > >>>
> > >>>        return notifier_from_errno(rc);
> > >>
> > >
> > > Best regards,
> > > Mykola
> >

