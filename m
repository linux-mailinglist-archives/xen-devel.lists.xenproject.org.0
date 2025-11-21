Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E12CC77CD9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 09:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168402.1494419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMMES-00054d-AY; Fri, 21 Nov 2025 08:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168402.1494419; Fri, 21 Nov 2025 08:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMMES-00052Q-7u; Fri, 21 Nov 2025 08:11:04 +0000
Received: by outflank-mailman (input) for mailman id 1168402;
 Fri, 21 Nov 2025 08:11:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfdr=55=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vMMEQ-00052K-98
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 08:11:02 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d798709-c6b1-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 09:11:00 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5957753e0efso1762161e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Nov 2025 00:11:00 -0800 (PST)
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
X-Inumbo-ID: 9d798709-c6b1-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763712660; x=1764317460; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDI502NeGSM3bNc6E0vlRG07doDTXfl1100MZKBUhW8=;
        b=AVFBgn5tPQI7P3aao9wu75pPLu7eNqWv+JxiC/PZCGSgEdlCcSDyxllT4WYqLbnu6w
         IuIRm4xX+OrqdBT9UktFZaCweZ+3Rkowyh//M5fl2YUWvjEyWkVCHZlqTV7ubIv9Kw9m
         5sZ1CziTnWhkHZn0+qNXt8NizTOYFSmvy0Wc9soIcFW5TXuTs2+B8DtNszokpUsz46wB
         8l3H5pxdhITw4tWaW2+kWdmR/FDh362/UDNxfGYaU46U3m8JWbLHXPXUECF/cR5+rsN7
         juNw3/ZCjBsBtsAgYHN/FOepgN1C9tvAk2+gVkS80F5jUq+fmLcJzdFxd9papePN17g5
         e+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763712660; x=1764317460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bDI502NeGSM3bNc6E0vlRG07doDTXfl1100MZKBUhW8=;
        b=ASdFyy4TCKqAUwQHPPSWH+TjnuhFKojlmWviXq40e5rbJp/kmx3Emo7wuOweexPFk+
         z7NfKlTpoVwlLQS4StE11SDthnn2ShOKIR4ndmh2MAgN9eSUiEJRyobmoiYnhSodzrCz
         f9kYW+0Ek0kX02M8upyc3hxeVVuxyYTCPVe31pdqUzKtL1wmQzaTJPAYTIn9vjZKNKat
         B6/s0JjqF4V5zDvCJuxtqhCrqkVjMnNf5dXWNKOjI+X32UULCHx1OmLD4VyA0ueTg/j9
         OplVB9yz9JbSTmptXMMkN625oHAUgU0Q2C8+Y0706qfB2Nug/J6pfBfH7+NIorIM+G0o
         uONQ==
X-Gm-Message-State: AOJu0YwwoQWEhE53WyawoErP2fynqWikGIScjQfcngT4mEFPb+Elgyrs
	Rq/D0KN9qL7/w2JOmvv5566NNd43NAwCR6OwUkD9IwMzfWy0zFcYdI7vzLEBlt+9MbOUoteciv8
	mmWf6wsYNnM/nXBjE2etvcasFF+C0lQBxhyf1vIk=
X-Gm-Gg: ASbGncsIoKludSoPogV0/PXGp4cUAqCQNRqercySabpMPA09R42FvXmK5UkCV5GmF8D
	T4YW9QZeaqZ6VRVQJf6RW35pHXs7SCXF/vE4MSfva8kbAmWnnKST445MXGO49XtRAvaY3es1ONZ
	JBUhU5ONieVhDqRTgqwy0SiUae3kmKVnrOhsliH9+BZP2WhcHI9FgFYAWj8o4rqnDl+dXrOeSQu
	0+rfVhOrAlZ5AYLw5FL7DHhViF7sYuAvDacrKYt3ivBBe3B1niSUqixCo5tTYfcRQwGkxw=
X-Google-Smtp-Source: AGHT+IELUkdA+82lDS7w1J1rEZBqOXf2ibAQLzbicJclvPK3vWm0ltpzABiqyegRA4nCUMXEGhPOc25FnFnUq+apxdc=
X-Received: by 2002:a05:6512:3ba2:b0:594:28f6:b065 with SMTP id
 2adb3069b0e04-596a3ebe090mr560741e87.17.1763712659345; Fri, 21 Nov 2025
 00:10:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <781c8e1b3a4d9b269bfde125072a84baae3f9bb3.1756763487.git.mykola_kvach@epam.com>
 <0ac3217d-f3d6-4bac-ac27-0afa6775f03c@xen.org>
In-Reply-To: <0ac3217d-f3d6-4bac-ac27-0afa6775f03c@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 21 Nov 2025 10:10:47 +0200
X-Gm-Features: AWmQ_bmQ3WWy1p0oFaseFppTULGrykdIclkP_r4_oYM0IXe8jFpNBZSlpXcMUmc
Message-ID: <CAGeoDV_ATk0kEpSZ6xhvncn8+19QqsQx4TMu_WQg2j5j7=Hhyg@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] xen/arm: Add suspend and resume timer helpers
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, 
	Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks for your review and for the time spent on this series.

On Sat, Sep 13, 2025 at 2:04=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 01/09/2025 23:10, Mykola Kvach wrote:
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > Timer interrupts must be disabled while the system is suspended to prev=
ent
> > spurious wake-ups.
>
> Yet, you don't seem to disable the virtual interrupt. Can you explain why=
?

Thanks for the question =E2=80=94 looks like I missed calling this out.

The virtual timer is already disabled on vCPU context switch. During the
suspend flow, ctxt_switch_from() calls virt_timer_save(), which clears
CNTV_CTL_EL0.ENABLE and preserves the timer state in
vcpu->arch.virt_timer. Therefore there is no live virtual timer interrupt
source by the time time_suspend() executes.

Also, the context switch happens before the suspend tasklet is invoked,
and time_suspend() is called from that tasklet.

>
> > Suspending the timers involves disabling both the EL1
> > physical timer and the EL2 hypervisor timer.
> I know this is what Arm is naming the timers. But I would rather s/EL1//
> and s/EL2// because the physical timer is also accessible from EL0.

Thanks, makes sense. I'll drop the EL1/EL2 wording and refer to them as
physical timer and hypervisor timer.

>
> Note that Xen doesn't use or expose the physical timer. So it should
> always be disabled at the point "time_suspend()" is called. I am still
> ok to disable it just in case though.

Right, Xen doesn't rely on CNTP, so it should already be disabled by
the time we reach time_suspend().

>
> > Resuming consists of raising
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
>
> The name of the times are "physical timer" and "hypervisor timer".

Ack

>
> > +static inline void disable_physical_timers(void)
>
> "Physical is a bit misleading" in this context. All the 3 timers
> (virtual, physical, hypervisor) are physical timers. My preference would
> be to name this function disable_timers() (assuming you also need to
> disable the virtual timer).

As explained above, CNTV is already disabled before suspend, so the helper
only targets CNTP/CNTHP. Renamed it to disable_phys_hyp_timers() accordingl=
y.

>
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
>
> I think we should add a comment about the physical timer.

I'll add a comment in time_resume() clarifying that the physical timer rema=
ins
disabled in Xen, while the virtual timer is restored per-vCPU on
context restore.

>
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   static int cpu_time_callback(struct notifier_block *nfb,
> >                                unsigned long action,
> >                                void *hcpu)Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

