Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A08AD93DF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 19:41:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014788.1392893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ8O6-0006kQ-SK; Fri, 13 Jun 2025 17:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014788.1392893; Fri, 13 Jun 2025 17:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ8O6-0006ht-Pe; Fri, 13 Jun 2025 17:40:22 +0000
Received: by outflank-mailman (input) for mailman id 1014788;
 Fri, 13 Jun 2025 17:40:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5wsr=Y4=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uQ8O5-0006hV-4f
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 17:40:21 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a15a836-487d-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 19:40:20 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-553b3316160so707746e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 10:40:20 -0700 (PDT)
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
X-Inumbo-ID: 7a15a836-487d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749836420; x=1750441220; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLOpd5cfiZVf0bMJOMKGHCiUQkKcGg4iz1OWyEC2yps=;
        b=XT0yHTRAsKpvNoIwTf0hiWJP5o1ZCE/xGOxgSfDwo2jcBFegBUstY8RaDtpBGMMBlR
         qT88/8pUwiXanLdaNA55u2m0fPm0XB433OhWDS3xYwsemtnupSCM7Tqn/n11hgd7CW7p
         MDYos3DSlGS4nCzvQWJesZH1uZpacDx+ERUQgYIg1v4JHVGsHjxy6jmMF8NrDfv8GtQB
         n9CWnmDFf555mXmIlg2/iaXy12/vUvZLn0k7ETg5mmRmbJ464VQ8YuhykkR9RAoP9RN/
         UeC9RiK3syxeWCiP1wNt57mHheMRX3LQFNCBMA7XuG7zGb2L62GixQ53VoPtwUqVwwEp
         eOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749836420; x=1750441220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLOpd5cfiZVf0bMJOMKGHCiUQkKcGg4iz1OWyEC2yps=;
        b=cj8JUwLINHSzSJOp6Q0Eff6p8wv+REYJKJexTkpeQAqHZ8GC3dEgEcAaGrofmL/jx1
         h0/H48lxHM5apWdubgZfTEp3ns4kfexKEY2PUiWTGyNchGl453O72TdnGp1lbsL8j/ar
         pZZe526+Uv9BFltjb/3QWs6r4UmUJiV1V0MYtEK8B2/qFZgfU0annw99b0TgcGiBYAL/
         sgxc5v6TFtJNGTzyIGOoKTo+MU9iQalUS876agMZBy80AHPlHaZInyYzVo7rDT7QvJGi
         sZb+9LNUsEd/lZ2FooI1/85nukXpn37TJ3WBNuDLMvrY7Hu/2KnI3lDdblWeHP7HGr6M
         FmxQ==
X-Gm-Message-State: AOJu0YwHpc2eInPMjvFHxT58IoQg85/YJiJQrJNZJqbChB9cCwkOXL9Q
	IsIa8Lv64/1N/DPwhPvpjcYO0YQUc8JkteVCx0VZ9Xptz1HnObFbo9+0qmFycdf9T8ukZG98dU+
	emjGqGuNwrzEcequh1+1NeUbhOXhcnYM=
X-Gm-Gg: ASbGncuU36b3jpn/Uo6rrdke9KlQAVJf1OzSKxqRYzosjfY2EHVfjhzaqJ5BUKM3Eek
	f75qe4q4R+ZMFc5WYBcWCOTQBBIMAUXbd9htX0RS2nJFM7S+hzjF8P8sgei3YQFmlgrU3Hu4Ld6
	r7sXvuj3I29w6nlupoAUwCbQoWRfLentvEpwRNVhQNoQ==
X-Google-Smtp-Source: AGHT+IFYPsNfR8jj4o17Vd1AgYxI94ChEeiBHTzZ0wrwCeVlNn8vifoP0lfIiyB+jQcVCV/+O/EPJUUYJdFzVyxwm/c=
X-Received: by 2002:a05:6512:12ca:b0:553:2ed2:15b4 with SMTP id
 2adb3069b0e04-553b6f4d916mr27611e87.57.1749836419420; Fri, 13 Jun 2025
 10:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748848482.git.mykola_kvach@epam.com> <d57cba4cfc0944c5483e68440a5675db735805be.1748848482.git.mykola_kvach@epam.com>
 <d489b84d-bf92-4f13-80d6-d6f325eada62@amd.com>
In-Reply-To: <d489b84d-bf92-4f13-80d6-d6f325eada62@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 13 Jun 2025 20:40:08 +0300
X-Gm-Features: AX0GCFvAfeLlu-0TTtcGflxTgYcfAKarDEpNqWhOfIVTRILlz72jMq_EEf0xzJQ
Message-ID: <CAGeoDV9_py04VYs782-ZzB4af1H0ObK-QTZ0=6Hn4umXw8xyuA@mail.gmail.com>
Subject: Re: [PATCH v4][PART 2 02/10] xen/arm: Add suspend and resume timer helpers
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ayan

On Fri, Jun 13, 2025 at 5:44=E2=80=AFPM Ayan Kumar Halder <ayankuma@amd.com=
> wrote:
>
> Hi Mykola,
>
> On 02/06/2025 10:04, Mykola Kvach wrote:
> > CAUTION: This message has originated from an External Source. Please us=
e proper judgment and caution when opening attachments, clicking links, or =
responding to this email.
> >
> >
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > Timer interrupts must be disabled while the system is suspended to prev=
ent
> > spurious wake-ups. Suspending the timers involves disabling both the EL=
1
> > physical timer and the EL2 hypervisor timer. Resuming consists of raisi=
ng
> > the TIMER_SOFTIRQ, which prompts the generic timer code to reprogram th=
e
> > EL2 timer as needed. Re-enabling of the EL1 timer is left to the entity
> > that uses it.
> >
> > Introduce a new helper, disable_physical_timers, to encapsulate disabli=
ng
> > of the physical timers.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V4:
> >    - Rephrased comment and commit message for better clarity
> >    - Created separate function for disabling physical timers
> >
> > Changes in V3:
> >    - time_suspend and time_resume are now conditionally compiled
> >      under CONFIG_SYSTEM_SUSPEND
> > ---
> >   xen/arch/arm/include/asm/time.h |  5 +++++
> >   xen/arch/arm/time.c             | 38 +++++++++++++++++++++++++++-----=
-
> >   2 files changed, 37 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm=
/time.h
> > index 49ad8c1a6d..f4fd0c6af5 100644
> > --- a/xen/arch/arm/include/asm/time.h
> > +++ b/xen/arch/arm/include/asm/time.h
> > @@ -108,6 +108,11 @@ void preinit_xen_time(void);
> >
> >   void force_update_vcpu_system_time(struct vcpu *v);
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +void time_suspend(void);
> > +void time_resume(void);
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   #endif /* __ARM_TIME_H__ */
> >   /*
> >    * Local variables:
> > diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> > index e74d30d258..ad984fdfdd 100644
> > --- a/xen/arch/arm/time.c
> > +++ b/xen/arch/arm/time.c
> > @@ -303,6 +303,14 @@ static void check_timer_irq_cfg(unsigned int irq, =
const char *which)
> >              "WARNING: %s-timer IRQ%u is not level triggered.\n", which=
, irq);
> >   }
> >
> > +/* Disable physical timers for EL1 and EL2 on the current CPU */
> > +static inline void disable_physical_timers(void)
> > +{
> > +    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
> > +    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled *=
/
> > +    isb();
> > +}
> > +
> >   /* Set up the timer interrupt on this CPU */
> >   void init_timer_interrupt(void)
> >   {
> > @@ -310,9 +318,7 @@ void init_timer_interrupt(void)
> >       WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
> >       /* Do not let the VMs program the physical timer, only read the p=
hysical counter */
> >       WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
> > -    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
> > -    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled *=
/
> > -    isb();
> > +    disable_physical_timers();
> >
> >       request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
> >                   "hyptimer", NULL);
> > @@ -330,9 +336,7 @@ void init_timer_interrupt(void)
> >    */
> >   static void deinit_timer_interrupt(void)
> >   {
> > -    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
> > -    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
> > -    isb();
> > +    disable_physical_timers();
> >
> >       release_irq(timer_irq[TIMER_HYP_PPI], NULL);
> >       release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
> > @@ -372,6 +376,28 @@ void domain_set_time_offset(struct domain *d, int6=
4_t time_offset_seconds)
> >       /* XXX update guest visible wallclock time */
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +void time_suspend(void)
> > +{
> > +    disable_physical_timers();
> > +}
> > +
> > +void time_resume(void)
> > +{
> > +    /*
> > +     * Raising the timer softirq triggers generic code to call reprogr=
am_timer
> > +     * with the correct timeout (not known here).
> > +     *
> > +     * No further action is needed to restore timekeeping after power =
down,
> > +     * since the system counter is unaffected. See ARM DDI 0487 L.a, D=
12.1.2
> > +     * "The system counter must be implemented in an always-on power d=
omain."
> > +     */
> > +    raise_softirq(TIMER_SOFTIRQ);
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   static int cpu_time_callback(struct notifier_block *nfb,
> >                                unsigned long action,
> >                                void *hcpu)
> A question. Do you see CPU_DYING gets invoked during platform suspend ?

Yes, it is invoked through the following code flow:
system_suspend (introduced in this patch series)
    -> disable_nonboot_cpus
        -> cpu_down
            -> take_cpu_down
                -> _take_cpu_down


> I wonder how this code path is invoked with
>
> time_suspend()

time_suspend is called directly from system_suspend,
which was introduced in one of the latest commits in this patch series.

In one of the previous patch series, there was a request to separate
implementations and usage of functions.
This was done to reduce the amount of code in each commit and to
simplify the review process.

>
> - Ayan
>
> > --
> > 2.48.1
> >
> >

Best regards,
Mykola

