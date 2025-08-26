Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691C5B364DA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094416.1449738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwJ-000867-L9; Tue, 26 Aug 2025 13:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094416.1449738; Tue, 26 Aug 2025 13:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwJ-00083M-Hm; Tue, 26 Aug 2025 13:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1094416;
 Tue, 26 Aug 2025 13:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqtwI-0007MD-8P
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:42:18 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ade9d84-8282-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 15:42:16 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-3367144d196so21211171fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 06:42:16 -0700 (PDT)
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
X-Inumbo-ID: 7ade9d84-8282-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756215736; x=1756820536; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAdfRT3RfdTKzniVhm6L20d/MG9qOdM1V7J02o/Uq+E=;
        b=A0h7SaBEDgkHCaiqvX0OeCrwt9XDwTRfG53JkaFsAHfhqEry/pVlyDbVitFUVqRCKy
         BQsfRVM13sNOVhPKvryJVqWtY38fDW59ar8HzxHJUemjv7iIVxYeYC8mMogkl58lCpay
         n/OaYwfejy+y9za0QI/vQhFWEj+dT1jnO4ClZNRTFfUWwb8l6FY1x6rriubbMUz+8eaF
         /X6VoJL5XTpJSceSoZ1EcOZ6s8fU0nNuuug/ugLYw3e2Op0Z7b1vnqGBSFIMP8moXUTV
         E6KiuU0Ig5f20CxVHKnlnwxUU5SWkKus35E/UCNs/NUpyB5S134f/HAl2l7/a1Zharvs
         s4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215736; x=1756820536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAdfRT3RfdTKzniVhm6L20d/MG9qOdM1V7J02o/Uq+E=;
        b=mAhr75IIO8llBLS7N2vzhH6o3vlvVenuKj1wqsuUNB5fEWAsDDWkvpxgKaluvCxFxx
         +UVpFfIKWF6ElUg3sJaTi9isABnLu7DdcGDsJuOsNrFjqDMyeXx7f4Y19jNu7fEl3lLi
         N6DtheTWJ3SNbf5kdwRiPEe2JUbctN0KTse2UKGiqGO0KjWje9RJTGGNQfKaxvksNlRA
         qGYbrgKBSQ20LgieZ64hJkDkH1zuZZVegaxz6VjxhxutWWV0Z6eQnBuOY1OU+b8EJUU2
         BFcXmXjsDRtZD07Z9mmWYBgBxz0v4hIQ6k6xLcvKlqP7psF/aqdswH0JCxDW1SNe3Z59
         YvXg==
X-Gm-Message-State: AOJu0YzBAS75wKuSZYVI4cPGxCapCHep3M4QY9RNZaO61JK5WDZi5IRm
	DTJHdc540I2iSQKfIGBdZSclcufrw7rsv2yxjVKPKiN0Un6t9drD+bmCIU7mEpGb4AINImCqmhH
	+kf5Nj/pPoTtf8ajJhVcxlOrxZUE+UJo=
X-Gm-Gg: ASbGncvivMXn2MYD6PIvJLdSBY6xNj1tmLSBmegzUKRTBUAFgxlUBDqRHaxdz6X2dFZ
	RMeLa50wZusLlTXjw5bpTTdRCJBuHBsj+4kH3lZxNIXIS8o3QbCpWyRRPedMUZdkEqIAQTqbuws
	FTOU4ri7twn0EdpJFliEgNXaQzU9zeasCuTcPpSuX75jNOiQuSsiOkEcbCKVZHl22Gtx4+ilaN2
	C8VQX8DWEcgeQW73Ak8Cy/tjLA=
X-Google-Smtp-Source: AGHT+IHuUomL3ajT2tg5sdchy83gSMB8mwCP/IHk4ei5CjZUS4JtqnoWmUjIgWL3WTnrOfM87pn2dBHc3Hrsf9un4wk=
X-Received: by 2002:a2e:330d:0:b0:336:85e3:a95c with SMTP id
 38308e7fff4ca-33685e3b284mr9034371fa.29.1756215735993; Tue, 26 Aug 2025
 06:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <98957da5c5068ae8340a21a9aa15a962905a8a22.1754943874.git.mykola_kvach@epam.com>
 <87qzx2an6k.fsf@epam.com>
In-Reply-To: <87qzx2an6k.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 16:42:04 +0300
X-Gm-Features: Ac12FXyeB4PejrWzfWfljLrUb9Y_fm_JV2MODpRnUIP-XDhyl8R0FMQWBo5HqHM
Message-ID: <CAGeoDV-NfadvNk1VOCBhLT_FCDDtPzkJkvwLvpaF0BsovGUQaw@mail.gmail.com>
Subject: Re: [PATCH v5 04/12] xen/arm: Prevent crash during
 disable_nonboot_cpus on suspend
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Sat, Aug 23, 2025 at 3:36=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> While I approve the change, the commit message is somewhat
> unclear. Maybe "Don't release IRQs on suspend" will be better?

Do you mean commit message title ?

>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > If we call disable_nonboot_cpus on ARM64 with system_state set
> > to SYS_STATE_suspend, the following assertion will be triggered:
> >
> > ```
> > (XEN) [   25.582712] Disabling non-boot CPUs ...
> > (XEN) [   25.587032] Assertion '!in_irq() && (local_irq_is_enabled() ||=
 num_online_cpus() <=3D 1)' failed at common/xmalloc_tlsf.c:714
> > [...]
> > (XEN) [   25.975069] Xen call trace:
> > (XEN) [   25.978353]    [<00000a000022e098>] xfree+0x130/0x1a4 (PC)
> > (XEN) [   25.984314]    [<00000a000022e08c>] xfree+0x124/0x1a4 (LR)
> > (XEN) [   25.990276]    [<00000a00002747d4>] release_irq+0xe4/0xe8
> > (XEN) [   25.996152]    [<00000a0000278588>] time.c#cpu_time_callback+0=
x44/0x60
> > (XEN) [   26.003150]    [<00000a000021d678>] notifier_call_chain+0x7c/0=
xa0
> > (XEN) [   26.009717]    [<00000a00002018e0>] cpu.c#cpu_notifier_call_ch=
ain+0x24/0x48
> > (XEN) [   26.017148]    [<00000a000020192c>] cpu.c#_take_cpu_down+0x28/=
0x34
> > (XEN) [   26.023801]    [<00000a0000201944>] cpu.c#take_cpu_down+0xc/0x=
18
> > (XEN) [   26.030281]    [<00000a0000225c5c>] stop_machine.c#stopmachine=
_action+0xbc/0xe4
> > (XEN) [   26.038057]    [<00000a00002264bc>] tasklet.c#do_tasklet_work+=
0xb8/0x100
> > (XEN) [   26.045229]    [<00000a00002268a4>] do_tasklet+0x68/0xb0
> > (XEN) [   26.051018]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x=
194
> > (XEN) [   26.057585]    [<00000a0000277e30>] start_secondary+0x21c/0x22=
0
> > (XEN) [   26.063978]    [<00000a0000361258>] 00000a0000361258
> > ```
> >
> > This happens because before invoking take_cpu_down via the stop_machine=
_run
> > function on the target CPU, stop_machine_run requests
> > the STOPMACHINE_DISABLE_IRQ state on that CPU. Releasing memory in
> > the release_irq function then triggers the assertion:
> >
> > /*
> >  * Heap allocations may need TLB flushes which may require IRQs to be
> >  * enabled (except when only 1 PCPU is online).
> >  */
> >
> > This patch adds system state checks to guard calls to request_irq
> > and release_irq. These calls are now skipped when system_state is
> > SYS_STATE_{resume,suspend}, preventing unsafe operations during
> > suspend/resume handling.
>
> If any call to release_irq() during suspend will trigger ASSERT, and it
> is fine to leave IRQs as is during suspend, maybe it will be easier to
> put
>
> +        if ( system_state =3D=3D SYS_STATE_suspend )
> +            return;
>
> straight into release_irq() code? This will be easier than playing
> whack-a-mole when some other patch will add another release_irq() call
> somewhere.

I=E2=80=99m fine with adding this check directly into release_irq(), as lon=
g as
the other maintainers agree with this approach.

>
>
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V4:
> >   - removed the prior tasklet-based workaround in favor of a more
> >     straightforward and safer solution
> >   - reworked the approach by adding explicit system state checks around
> >     request_irq and release_irq calls, skips these calls during suspend
> >     and resume states to avoid unsafe memory operations when IRQs are
> >     disabled
> > ---
> >  xen/arch/arm/gic.c           |  6 ++++++
> >  xen/arch/arm/tee/ffa_notif.c |  2 +-
> >  xen/arch/arm/time.c          | 18 ++++++++++++------
> >  3 files changed, 19 insertions(+), 7 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index a018bd7715..9856cb1592 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -388,6 +388,9 @@ void gic_dump_info(struct vcpu *v)
> >
> >  void init_maintenance_interrupt(void)
> >  {
> > +    if ( system_state =3D=3D SYS_STATE_resume )
> > +        return;
> > +
> >      request_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance_inte=
rrupt,
> >                  "irq-maintenance", NULL);
> >  }
> > @@ -461,6 +464,9 @@ static int cpu_gic_callback(struct notifier_block *=
nfb,
> >      switch ( action )
> >      {
> >      case CPU_DYING:
> > +        if ( system_state =3D=3D SYS_STATE_suspend )
> > +            break;
> > +
> >          /* This is reverting the work done in init_maintenance_interru=
pt */
> >          release_irq(gic_hw_ops->info->maintenance_irq, NULL);
> >          break;
> > diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.=
c
> > index 00efaf8f73..06f715a82b 100644
> > --- a/xen/arch/arm/tee/ffa_notif.c
> > +++ b/xen/arch/arm/tee/ffa_notif.c
> > @@ -347,7 +347,7 @@ void ffa_notif_init_interrupt(void)
> >  {
> >      int ret;
> >
> > -    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> > +    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI && system_state !=
=3D SYS_STATE_resume )
> >      {
> >          /*
> >           * An error here is unlikely since the primary CPU has already
> > diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> > index ad984fdfdd..b2e07ade43 100644
> > --- a/xen/arch/arm/time.c
> > +++ b/xen/arch/arm/time.c
> > @@ -320,10 +320,13 @@ void init_timer_interrupt(void)
> >      WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
> >      disable_physical_timers();
> >
> > -    request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
> > -                "hyptimer", NULL);
> > -    request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
> > -                   "virtimer", NULL);
> > +    if ( system_state !=3D SYS_STATE_resume )
> > +    {
> > +        request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
> > +                    "hyptimer", NULL);
> > +        request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
> > +                    "virtimer", NULL);
> > +    }
> >
> >      check_timer_irq_cfg(timer_irq[TIMER_HYP_PPI], "hypervisor");
> >      check_timer_irq_cfg(timer_irq[TIMER_VIRT_PPI], "virtual");
> > @@ -338,8 +341,11 @@ static void deinit_timer_interrupt(void)
> >  {
> >      disable_physical_timers();
> >
> > -    release_irq(timer_irq[TIMER_HYP_PPI], NULL);
> > -    release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
> > +    if ( system_state !=3D SYS_STATE_suspend )
> > +    {
> > +        release_irq(timer_irq[TIMER_HYP_PPI], NULL);
> > +        release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
> > +    }
> >  }
> >
> >  /* Wait a set number of microseconds */
>
> --
> WBR, Volodymyr

Best regards,
Mykola

