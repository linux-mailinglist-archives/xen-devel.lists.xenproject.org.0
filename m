Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B0EB40E5C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107368.1457810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXJ0-0000Ef-Oq; Tue, 02 Sep 2025 20:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107368.1457810; Tue, 02 Sep 2025 20:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXJ0-0000By-Lg; Tue, 02 Sep 2025 20:08:38 +0000
Received: by outflank-mailman (input) for mailman id 1107368;
 Tue, 02 Sep 2025 20:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utXIz-0000Bs-JE
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:08:37 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a2c0866-8838-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 22:08:33 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f69cf4b77so4133884e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 13:08:33 -0700 (PDT)
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
X-Inumbo-ID: 9a2c0866-8838-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756843713; x=1757448513; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvCR52lESdjN68+p3ZTk4n3ifImJi43k8YhAjRFMIVA=;
        b=X6zE6oggw0jhRSNTWjoMn3KGsxhfg6SNEf8IqVw/rHbXLq1dwUdwx1ItZzdLEVv2nw
         /j5OPcj9nyIiFN6TYrwkehaepehi1+G5JXsGQMDIPW1IEbiK/vmTvZj+AlRqOdZmiILg
         AqM3PWFTe30m4MCsyarIKqbmwK0Bg1s9PMol5CGn1cHXPkdUAOF8sGbg/yP0oA3lbH9K
         nd16J87nebLYemSLFastfKQCxqzOJi0QDNlHfCB7GH+mikdkcd31d4IXcJINyCDihKuC
         kiyBwPiJrGqtD7MZHUNF+7pHgWHq9cWFSAZF3daY+wT0q0naJt6z1nnm/M3nmsu1zcv1
         bKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756843713; x=1757448513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvCR52lESdjN68+p3ZTk4n3ifImJi43k8YhAjRFMIVA=;
        b=r8pt3oqiOOaEAR++b/Wt+NeIw7DnuCeNBjsO+amAgy6/2rHOiRd9auNgAIlK6P1UW/
         ZwWA3ayF9nog1mJWCja3bI7m6feTgQXcz+5wAU66Gz49kv3ynXXh3qxe0+FMB87FXTrj
         IB9xvrFzjix7VxygsUcOst7bbXvCqSeI/2Vk+WBQdIVYFUeb7/7kHr28XxIei9egsz53
         03QBacmHJJm3EoKcardHYCFyPPCbEhBrOQfercQm46LdPznbGlklmlVyvNGhEaFLGODP
         ykskrijkE15ZH79XAzS5X78oLpJyFfWkozLw6laTuyvE+Raralp8WzjwEN1VgO8jlGyo
         Tobw==
X-Gm-Message-State: AOJu0YyTENzkwI4ohw158gZTbrpEt7UUFUNxa2Kyg6GBbrTsKb4EW/Jk
	ARburrCAyfkDWGrjiSaO0oBhry6Ok16SYNcsy9aGqUA/6pZ+Ov/A/T+EowiEBtIUCkmWZcJ5MqF
	zzbKBGJqkjNKltQ/ecfVZpEmogbAlkpM=
X-Gm-Gg: ASbGncuXqZDhSXFuOZOnDWPN1z9yM55rFLtz0sQg+h2GRZgfKsTwSchQQ5KC5KgMqs/
	1iwaTcd0CaJu8f9YsyKv3iERbCdkav69p7SKynr68hxwrIcUUYMjEi8cPVNm8Mjghz/94NoaraS
	CFFedCiT1Le+mmSZWfukaFK9r/0khr9fbzu0H76vjtlq1oYqSUaC3R92aTLjZ9fNQojzCcDR6gM
	z9kNGCK52zuoro+
X-Google-Smtp-Source: AGHT+IEFaS7sG9infLLYcClQpHGtnw+ylh7nh2Tq67ReNfd/h2dM90wwmuwWKCI2V9NaIEvy9ZKaSONcNasbLeEIivk=
X-Received: by 2002:a05:6512:1357:b0:55f:3ce4:585e with SMTP id
 2adb3069b0e04-55f708f118cmr3696830e87.31.1756843712620; Tue, 02 Sep 2025
 13:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <18c51957660441c945d51b02be965fbcc19c7c2b.1756763487.git.mykola_kvach@epam.com>
 <0fb4d962-a92a-4b8b-805d-60a03fe1b734@gmail.com> <CAGeoDV_XPjkpniPkaPXd82B80Q0qutfmXyRKedvRkWCkbL8bmQ@mail.gmail.com>
 <f7554cc0-893b-44a6-8987-7508dfeaba97@gmail.com>
In-Reply-To: <f7554cc0-893b-44a6-8987-7508dfeaba97@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 2 Sep 2025 23:08:21 +0300
X-Gm-Features: Ac12FXyW3XnFwspk-_0J4Bx7LoF27XV3Uh-CUd1XECJ_yAfhrNnRCawLXiK6jY0
Message-ID: <CAGeoDV9ZyEw69a=-fT+MSjt4E+w3kZj-eUwRLrMvChNMMSU53Q@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] xen/arm: irq: Restore state of local IRQs during
 system resume
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 9:16=E2=80=AFPM Oleksandr Tyshchenko <olekstysh@gmai=
l.com> wrote:
>
>
>
> On 02.09.25 20:43, Mykola Kvach wrote:
> > Hi Oleksandr,
>
> Hello Mykola
>
> >
> > On Tue, Sep 2, 2025 at 7:49=E2=80=AFPM Oleksandr Tyshchenko <olekstysh@=
gmail.com> wrote:
> >>
> >>
> >>
> >> On 02.09.25 01:10, Mykola Kvach wrote:
> >>
> >> Hello Mykola
> >>
> >>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> On ARM, the first 32 interrupts (SGIs and PPIs) are banked per-CPU
> >>> and not restored by gic_resume (for secondary cpus).
> >>>
> >>> This patch introduces restore_local_irqs_on_resume, a function that
> >>> restores the state of local interrupts on the target CPU during
> >>> system resume.
> >>>
> >>> It iterates over all local IRQs and re-enables those that were not
> >>> disabled, reprogramming their routing and affinity accordingly.
> >>>
> >>> The function is invoked from start_secondary, ensuring that local IRQ
> >>> state is restored early during CPU bring-up after suspend.
> >>>
> >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>> ---
> >>> Changes in V6:
> >>> - Call handler->disable() instead of just setting the _IRQ_DISABLED f=
lag
> >>> - Move the system state check outside of restore_local_irqs_on_resume=
()
> >>> ---
> >>>    xen/arch/arm/irq.c | 39 +++++++++++++++++++++++++++++++++++++++
> >>>    1 file changed, 39 insertions(+)
> >>>
> >>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> >>> index 6c899347ca..ddd2940554 100644
> >>> --- a/xen/arch/arm/irq.c
> >>> +++ b/xen/arch/arm/irq.c
> >>> @@ -116,6 +116,41 @@ static int init_local_irq_data(unsigned int cpu)
> >>>        return 0;
> >>>    }
> >>>
> >>> +/*
> >>> + * The first 32 interrupts (PPIs and SGIs) are per-CPU,
> >>> + * so call this function on the target CPU to restore them.
> >>> + *
> >>> + * SPIs are restored via gic_resume.
> >>> + */
> >>> +static void restore_local_irqs_on_resume(void)
> >>> +{
> >>> +    int irq;
> >>
> >> NIT: Please, use "unsigned int" if irq cannot be negative
> >
> > ok
> >
> >>
> >>> +
> >>> +    spin_lock(&local_irqs_type_lock);
> >>> +
> >>> +    for ( irq =3D 0; irq < NR_LOCAL_IRQS; irq++ )
> >>> +    {
> >>> +        struct irq_desc *desc =3D irq_to_desc(irq);
> >>> +
> >>> +        spin_lock(&desc->lock);
> >>> +
> >>> +        if ( test_bit(_IRQ_DISABLED, &desc->status) )
> >>> +        {
> >>> +            spin_unlock(&desc->lock);
> >>> +            continue;
> >>> +        }
> >>> +
> >>> +        /* Disable the IRQ to avoid assertions in the following call=
s */
> >>> +        desc->handler->disable(desc);
> >>> +        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
> >>
> >> Shouldn't we use GIC_PRI_IPI for SGIs?
> >
> > Yes, we should. But currently I am restoring the same value
> > as it was before suspend...
> >
> > I definitely agree that this needs to be fixed at the original
> > place where the issue was introduced, but I was planning to
> > address it in a future patch.
> >
> >>
> >>
> >>> +        desc->handler->startup(desc);
> >>> +
> >>> +        spin_unlock(&desc->lock);
> >>> +    }
> >>> +
> >>> +    spin_unlock(&local_irqs_type_lock);
> >>> +}
> >>> +
> >>>    static int cpu_callback(struct notifier_block *nfb, unsigned long =
action,
> >>>                            void *hcpu)
> >>>    {
> >>> @@ -134,6 +169,10 @@ static int cpu_callback(struct notifier_block *n=
fb, unsigned long action,
> >>>                printk(XENLOG_ERR "Unable to allocate local IRQ for CP=
U%u\n",
> >>>                       cpu);
> >>>            break;
> >>> +    case CPU_STARTING:
> >>> +        if ( system_state =3D=3D SYS_STATE_resume )
> >>> +            restore_local_irqs_on_resume();
> >>> +        break;
> >>
> >> May I please ask, why all this new code (i.e.
> >> restore_local_irqs_on_resume()) is not covered by #ifdef
> >> CONFIG_SYSTEM_SUSPEND?
> >
> > I don=E2=80=99t see a reason to introduce such "macaron-style" code. On=
 ARM, the
> > system suspend state is only set when CONFIG_SYSTEM_SUSPEND is defined
> > anyway.
>
> right
>
> >
> > If you would prefer me to wrap all relevant code with this define, plea=
se
> > let me know and I=E2=80=99ll make the change. In this case, I think the=
 current
> > approach is cleaner, but I=E2=80=99m open to your opinion.
>
> In other patches, you seem to wrap functions/code that only get called
> during suspend/resume with #ifdef CONFIG_SYSTEM_SUSPEND, so I wondered
> why restore_local_irqs_on_resume() could not be compiled out
> if the feature is not enabled. But if you still think it would be
> cleaner this way (w/o #ifdef), I would be ok.

It=E2=80=99s not entirely true -- I only wrapped code that has a direct dep=
endency
on host_system_suspend(), either being called from it or required for its
correct operation.

If you look through this patch series for the pattern:
SYS_STATE_(suspend|resume)

you=E2=80=99ll see that not all suspend/resume-related code is wrapped in
#ifdef CONFIG_SYSTEM_SUSPEND. This is intentional -- the same applies to
some code already merged into the common parts of Xen.

So restore_local_irqs_on_resume is consistent with the existing approach
in all cpu notifier blocks.

>
> >
> >>
> >>>        }
> >>>
> >>>        return notifier_from_errno(rc);
> >>
> >
> > Best regards,
> > Mykola
>

