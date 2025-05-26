Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD4AC4003
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 15:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997537.1378369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJXU8-0001vT-Fj; Mon, 26 May 2025 13:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997537.1378369; Mon, 26 May 2025 13:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJXU8-0001sV-Cm; Mon, 26 May 2025 13:03:20 +0000
Received: by outflank-mailman (input) for mailman id 997537;
 Mon, 26 May 2025 13:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXNe=YK=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJXU7-0001sP-6j
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 13:03:19 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cac2aa78-3a31-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 15:03:17 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-551fe540b74so2536146e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 06:03:17 -0700 (PDT)
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
X-Inumbo-ID: cac2aa78-3a31-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748264597; x=1748869397; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Go//RU6xzmSyHgSW+OWt7KIVzBB+xYiGlRtxx8cg2M4=;
        b=Kz2WsjJoQeLStQgNh2sPeZ8O80vVHPBbl3L1sWDN2GFpjavOnyfo6vlZeGwf7pvZi4
         kCmEZqj0nEE5JJyL0xrzE4FexPH0BscMGnHD0JRxKbt1q17Sy5CWzXZXBvDtLJM/4XxM
         49/0KOb2brNzNthOp/QxFsRGUz8PflyslQ6SMXMs+1tWThBTZUx+gjzUs7yhSJq0HeE4
         j8+quN557mbx5hKsaoL9KNPYFNP80aPsw1Xkyi1Rfpp2JZu8yYgWfjHxnPTg0tFKmNYz
         BDzDA9yS1Ioi/cEJ8Zq5LEGB1Q1KMVVZvzwnT+B/Sr6uE3j//DgHrQyBTNctUuLwHOGy
         jr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748264597; x=1748869397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Go//RU6xzmSyHgSW+OWt7KIVzBB+xYiGlRtxx8cg2M4=;
        b=YqzYfERxsC4aEwe7rxJvEWmgDWBN4+j/MTrH45XJ3ngx/5P2KgS9tYCbIH7kA1ICzE
         HUUuashUInThi/RWSxy51+yOVM2zvr+osbBjXqoGDFwPB++WE96QLfUA1lBmhYNn/gf7
         3LOtKQh2guNSn3gZ+VNDAavd+p8qIJYf/3pgE2y1grWYLCJZatWr+l961pe2rB/W33M8
         8bhZ/YishcSBx6/OYCfSdMy4D3vklB/jg2FA7+2AQSlv/66krapJdD6EjJjFM+lCvhp2
         NEPewKGE57HJqlQuzJ/YSm55bJGpENyUUxhOkWunZO9a0SLxHoWbNWQVEBlD1X6sRaOp
         ol+A==
X-Gm-Message-State: AOJu0YziP+dz0jyCW27G7Tcv7ZzWHIA4X39gO7/5m+oLZd/7yW+GV3YM
	nsm2LmOquxriS1NeKXf+y9GWz14lWZLX0D3Nud6t+r2I9ytuDGZ6t8+2+gp67MY3VmByj8B8ddE
	QwuV8JGVQ2mVouJf+FhYojulvtzLlLVU=
X-Gm-Gg: ASbGncvZKiM+nwGaWN1q3UKRmt8XkgsWd6/r8axP01jfCToZdBmCi9jLTsctA4Ocv/7
	EEi8sqiL80Y+HLJwGns6ryWNavutkvdJKyIvfUhBvq5zWIqu6u5xkz5mL2Vu5nYaCY6uiXisnXb
	MJlnKHPFlfIi4c2G2kcCcwb4q/mGOTLODs
X-Google-Smtp-Source: AGHT+IGiJ4M4+crjYAYAgHgFUEBl99Y+jSLo4E4ffi4kwcnYHqaIr4uKrZwu6rGLhtAOK3uPStvoa4q8gGlpG8LBQU0=
X-Received: by 2002:a05:6512:1094:b0:553:241d:4e77 with SMTP id
 2adb3069b0e04-553241d5142mr779742e87.22.1748264596010; Mon, 26 May 2025
 06:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
 <0d0ed573-d810-4e78-9a12-985e9150c107@xen.org>
In-Reply-To: <0d0ed573-d810-4e78-9a12-985e9150c107@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 26 May 2025 16:03:04 +0300
X-Gm-Features: AX0GCFuLBB0b0bWW883QrRHs4mQ1Zl7lhgsoGfQcw3woFop11TlL2PyofXX8xkM
Message-ID: <CAGeoDV9Oum2rse56ucr+=oxeTzdbzkBLbMTkfA8ZZUtjWnzeEA@mail.gmail.com>
Subject: Re: [PATCH 08/16] xen/arm: add watchdog domain suspend/resume helpers
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Mirela Simonovic <mirela.simonovic@aggios.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>
Content-Type: multipart/alternative; boundary="00000000000037fb820636099278"

--00000000000037fb820636099278
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, @Julien Grall

On Tue, Mar 11, 2025 at 11:04=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Mykola,
>
> On 05/03/2025 09:11, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > This patch implements suspend/resume helpers for the watchdog.
> > While a domain is suspended its watchdogs must be paused. Otherwise,
> > if the domain stays in the suspend state for a longer period of time
> > compared to the watchdog period, the domain would be shutdown on resume=
.
> > Proper solution to this problem is to stop (suspend) the watchdog timer=
s
> > after the domain suspends and to restart (resume) the watchdog timers
> > before the domain resumes. The suspend/resume of watchdog timers is don=
e
> > in Xen and is invisible to the guests.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v3:
> > - cover the code with CONFIG_SYSTEM_SUSPEND
> >
> > Changes in v2:
> > - drop suspended field from timer structure
> > - drop the call of watchdog_domain_resume from ctxt_switch_to
> > ---
> >   xen/common/sched/core.c | 39 +++++++++++++++++++++++++++++++++++++++
> >   xen/include/xen/sched.h |  9 +++++++++
> >   2 files changed, 48 insertions(+)
> >
> > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > index b1c6b6b9fa..6c2231826a 100644
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -1605,6 +1605,45 @@ void watchdog_domain_destroy(struct domain *d)
> >           kill_timer(&d->watchdog_timer[i].timer);
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
>
> The config option is Arm specific, yet this is common code. As x86,
> already suspend/resume, then shouldn't the config option be common?
>
> But more importantly, why do we need to save/restore the watchdogs for
> Arm but not x86? Is this a latent issue or design choice?

I=E2=80=99ve looked into this a bit. Here's what I've found:

A watchdog timer is created and initialized (but not started) for each
domain during the domain_create call. This timer can be triggered either by
the Linux kernel (I refer to Linux kernel=E2=80=93based operating systems b=
ecause I
have access to the code and can confirm that the Xen watchdog timer is
implemented there. I don=E2=80=99t have knowledge about the existence or
implementation of the Xen watchdog driver in other operating systems) Xen
watchdog driver or by the xenwatchdogd service.

Case 1: Watchdog started by the Linux kernel driver (I hope that operating
systems not based on the Linux kernel also implement proper handling for
the Xen watchdog timer driver during suspend and resume)
When the Xen watchdog is started by the Linux kernel driver, everything
works as expected. The driver correctly handles system suspend events:
https://elixir.bootlin.com/linux/v6.14.8/source/drivers/watchdog/xen_wdt.c#=
L169

Case 2: Watchdog started by xenwatchdogd service
However, when the watchdog is started by the xenwatchdogd service, neither
the underlying OS nor the daemon takes care of stopping the watchdog timer
during suspend:

https://elixir.bootlin.com/xen/v4.20.0/source/tools/hotplug/Linux/init.d/xe=
n-watchdog.in

https://elixir.bootlin.com/xen/v4.20.0/source/tools/hotplug/NetBSD/rc.d/xen=
-watchdog

Behavior on x86 during suspend:
- Linux guest is configured with xenwatchdogd, and the Xen watchdog is
started at boot
- the OS initiates suspend (we request)
- at that moment, there's an active watchdog timer in Xen for the domain,
set to, say, 15 seconds
- after suspend preparations, domain_shutdown() is called with the
SHUTDOWN_suspend argument inside Xen hypervisor internals
- inside this function, the is_shutting_down flag is set in the domain
structure
- when the watchdog timer expires, the Xen handler skips the reset action
because the domain is marked as shutting down:

https://elixir.bootlin.com/xen/v4.20.0/source/xen/common/sched/core.c#L1539

So far, everything behaves correctly.

*BUT* *for the second case there is another flow. The domain starts
resuming from suspend. As part of the resume process, the is_shutting_down
flag inside the domain is cleared, which re-enables normal watchdog
behavior. However, the watchdog timer=E2=80=94set before suspend=E2=80=94ha=
s nearly
expired. Because the OS and its user-space services (such as the watchdog
pinging daemon) have not yet fully resumed and restarted, the watchdog
timeout occurs before the ping can be sent. As a result, the watchdog
triggers a reset or shutdown (as far as i know can't be another action of
watchdog expiry, but we aren't interested in these options right now)
before the service has a chance to take control again =E2=80=94 effectively=
 making
a clean resume impossible.*

It's also unclear how common this situation is on x86 systems =E2=80=94
specifically, whether xenwatchdogd is typically used in domU or dom0, or
whether the kernel driver is more commonly relied upon instead.
---

In my opinion, since the guest OS is the one starting the Xen watchdog, it
should also manage its state during suspend/resume transitions. The general
expectation across architectures is that the OS handles device state
management when transitioning between power states. This includes stopping
or parking watchdog timers during suspend.
I think proper handling should be added to the relevant services to avoid
unexpected triggers.

What=E2=80=99s your take on this?

>
> > +
> > +void watchdog_domain_suspend(struct domain *d)
> > +{
> > +    unsigned int i;
> > +
> > +    spin_lock(&d->watchdog_lock);
> > +
> > +    for ( i =3D 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> > +    {
> > +        if ( test_bit(i, &d->watchdog_inuse_map) )
> > +        {
> > +            stop_timer(&d->watchdog_timer[i].timer);
> > +        }
> > +    }
> > +
> > +    spin_unlock(&d->watchdog_lock);
> > +}
> > +
> > +void watchdog_domain_resume(struct domain *d)
> > +{
> > +    unsigned int i;
> > +
> > +    spin_lock(&d->watchdog_lock);
> > +
> > +    for ( i =3D 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> > +    {
> > +        if ( test_bit(i, &d->watchdog_inuse_map) )
> > +        {
> > +            set_timer(&d->watchdog_timer[i].timer,
> > +                      NOW() + SECONDS(d->watchdog_timer[i].timeout));
> > +        }
> > +    }
> > +
> > +    spin_unlock(&d->watchdog_lock);
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   /*
> >    * Pin a vcpu temporarily to a specific CPU (or restore old pinning
state if
> >    * cpu is NR_CPUS).
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index d0d10612ce..caab4aad93 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -1109,6 +1109,15 @@ void scheduler_disable(void);
> >   void watchdog_domain_init(struct domain *d);
> >   void watchdog_domain_destroy(struct domain *d);
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +/*
> > + * Suspend/resume watchdogs of domain (while the domain is suspended
its
> > + * watchdogs should be on pause)
> > + */
> > +void watchdog_domain_suspend(struct domain *d);
> > +void watchdog_domain_resume(struct domain *d);
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   /*
> >    * Use this check when the following are both true:
> >    *  - Using this feature or interface requires full access to the
hardware
>
> Cheers,
>
> --
> Julien Grall
>

Kind regards,
Mykola

--00000000000037fb820636099278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, @Julien Grall<br><br>On Tue, Mar 11, 2025 at 11:04=E2=
=80=AFPM Julien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org<=
/a>&gt; wrote:<br>&gt;<br>&gt; Hi Mykola,<br>&gt;<br>&gt; On 05/03/2025 09:=
11, Mykola Kvach wrote:<br>&gt; &gt; From: Mykola Kvach &lt;<a href=3D"mail=
to:mykola_kvach@epam.com">mykola_kvach@epam.com</a>&gt;<br>&gt; &gt;<br>&gt=
; &gt; This patch implements suspend/resume helpers for the watchdog.<br>&g=
t; &gt; While a domain is suspended its watchdogs must be paused. Otherwise=
,<br>&gt; &gt; if the domain stays in the suspend state for a longer period=
 of time<br>&gt; &gt; compared to the watchdog period, the domain would be =
shutdown on resume.<br>&gt; &gt; Proper solution to this problem is to stop=
 (suspend) the watchdog timers<br>&gt; &gt; after the domain suspends and t=
o restart (resume) the watchdog timers<br>&gt; &gt; before the domain resum=
es. The suspend/resume of watchdog timers is done<br>&gt; &gt; in Xen and i=
s invisible to the guests.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Mirela =
Simonovic &lt;<a href=3D"mailto:mirela.simonovic@aggios.com">mirela.simonov=
ic@aggios.com</a>&gt;<br>&gt; &gt; Signed-off-by: Saeed Nowshadi &lt;<a hre=
f=3D"mailto:saeed.nowshadi@xilinx.com">saeed.nowshadi@xilinx.com</a>&gt;<br=
>&gt; &gt; Signed-off-by: Mykyta Poturai &lt;<a href=3D"mailto:mykyta_potur=
ai@epam.com">mykyta_poturai@epam.com</a>&gt;<br>&gt; &gt; Signed-off-by: My=
kola Kvach &lt;<a href=3D"mailto:mykola_kvach@epam.com">mykola_kvach@epam.c=
om</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; Changes in v3:<br>&gt; &gt; - cove=
r the code with CONFIG_SYSTEM_SUSPEND<br>&gt; &gt;<br>&gt; &gt; Changes in =
v2:<br>&gt; &gt; - drop suspended field from timer structure<br>&gt; &gt; -=
 drop the call of watchdog_domain_resume from ctxt_switch_to<br>&gt; &gt; -=
--<br>&gt; &gt; =C2=A0 xen/common/sched/core.c | 39 +++++++++++++++++++++++=
++++++++++++++++<br>&gt; &gt; =C2=A0 xen/include/xen/sched.h | =C2=A09 ++++=
+++++<br>&gt; &gt; =C2=A0 2 files changed, 48 insertions(+)<br>&gt; &gt;<br=
>&gt; &gt; diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c<b=
r>&gt; &gt; index b1c6b6b9fa..6c2231826a 100644<br>&gt; &gt; --- a/xen/comm=
on/sched/core.c<br>&gt; &gt; +++ b/xen/common/sched/core.c<br>&gt; &gt; @@ =
-1605,6 +1605,45 @@ void watchdog_domain_destroy(struct domain *d)<br>&gt; =
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill_timer(&amp;d-&gt;watchdog_time=
r[i].timer);<br>&gt; &gt; =C2=A0 }<br>&gt; &gt; =C2=A0<br>&gt; &gt; +#ifdef=
 CONFIG_SYSTEM_SUSPEND<br>&gt;<br>&gt; The config option is Arm specific, y=
et this is common code. As x86,<br>&gt; already suspend/resume, then should=
n&#39;t the config option be common?<br>&gt;<br>&gt; But more importantly, =
why do we need to save/restore the watchdogs for<br>&gt; Arm but not x86? I=
s this a latent issue or design choice?<br><br>I=E2=80=99ve looked into thi=
s a bit. Here&#39;s what I&#39;ve found:<br><br>A watchdog timer is created=
 and initialized (but not started) for each domain during the domain_create=
 call. This timer can be triggered either by the Linux kernel (I refer to L=
inux kernel=E2=80=93based operating systems because I have access to the co=
de and can confirm that the Xen watchdog timer is implemented there. I don=
=E2=80=99t have knowledge about the existence or implementation of the Xen =
watchdog driver in other operating systems) Xen watchdog driver or by the x=
enwatchdogd service.<br><br>Case 1: Watchdog started by the Linux kernel dr=
iver (I hope that operating systems not based on the Linux kernel also impl=
ement proper handling for the Xen watchdog timer driver during suspend and =
resume)<br>When the Xen watchdog is started by the Linux kernel driver, eve=
rything works as expected. The driver correctly handles system suspend even=
ts:<br><a href=3D"https://elixir.bootlin.com/linux/v6.14.8/source/drivers/w=
atchdog/xen_wdt.c#L169">https://elixir.bootlin.com/linux/v6.14.8/source/dri=
vers/watchdog/xen_wdt.c#L169</a><br><br>Case 2: Watchdog started by xenwatc=
hdogd service<br>However, when the watchdog is started by the xenwatchdogd =
service, neither the underlying OS nor the daemon takes care of stopping th=
e watchdog timer during suspend:<br>=C2=A0 =C2=A0 <a href=3D"https://elixir=
.bootlin.com/xen/v4.20.0/source/tools/hotplug/Linux/init.d/xen-watchdog.in"=
>https://elixir.bootlin.com/xen/v4.20.0/source/tools/hotplug/Linux/init.d/x=
en-watchdog.in</a><br>=C2=A0 =C2=A0 <a href=3D"https://elixir.bootlin.com/x=
en/v4.20.0/source/tools/hotplug/NetBSD/rc.d/xen-watchdog">https://elixir.bo=
otlin.com/xen/v4.20.0/source/tools/hotplug/NetBSD/rc.d/xen-watchdog</a><br>=
<br>Behavior on x86 during suspend:<br>- Linux guest is configured with xen=
watchdogd, and the Xen watchdog is started at boot<br>- the OS initiates su=
spend (we request)<br>- at that moment, there&#39;s an active watchdog time=
r in Xen for the domain, set to, say, 15 seconds<br>- after suspend prepara=
tions, domain_shutdown() is called with the SHUTDOWN_suspend argument insid=
e Xen hypervisor internals<br>- inside this function, the is_shutting_down =
flag is set in the domain structure<br>- when the watchdog timer expires, t=
he Xen handler skips the reset action because the domain is marked as shutt=
ing down:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://elixir.bootlin.c=
om/xen/v4.20.0/source/xen/common/sched/core.c#L1539">https://elixir.bootlin=
.com/xen/v4.20.0/source/xen/common/sched/core.c#L1539</a><br><br>So far, ev=
erything behaves correctly.<br><br><b>BUT</b> <i>for the second case there =
is another flow. The domain starts resuming from suspend. As part of the re=
sume process, the is_shutting_down flag inside the domain is cleared, which=
 re-enables normal watchdog behavior. However, the watchdog timer=E2=80=94s=
et before suspend=E2=80=94has nearly expired. Because the OS and its user-s=
pace services (such as the watchdog pinging daemon) have not yet fully resu=
med and restarted, the watchdog timeout occurs before the ping can be sent.=
 As a result, the watchdog triggers a reset or shutdown (as far as i know c=
an&#39;t be another action of watchdog expiry, but we aren&#39;t interested=
 in these options right now) before the service has a chance to take contro=
l again =E2=80=94 effectively making a clean resume impossible.</i><br><br>=
It&#39;s also unclear how common this situation is on x86 systems =E2=80=94=
 specifically, whether xenwatchdogd is typically used in domU or dom0, or w=
hether the kernel driver is more commonly relied upon instead.<br><div>---<=
/div><div><br></div>In my opinion, since the guest OS is the one starting t=
he Xen watchdog, it should also manage its state during suspend/resume tran=
sitions. The general expectation across architectures is that the OS handle=
s device state management when transitioning between power states. This inc=
ludes stopping or parking watchdog timers during suspend.<br>I think proper=
 handling should be added to the relevant services to avoid unexpected trig=
gers.<br><br>What=E2=80=99s your take on this?<br><br>&gt;<br>&gt; &gt; +<b=
r>&gt; &gt; +void watchdog_domain_suspend(struct domain *d)<br>&gt; &gt; +{=
<br>&gt; &gt; + =C2=A0 =C2=A0unsigned int i;<br>&gt; &gt; +<br>&gt; &gt; + =
=C2=A0 =C2=A0spin_lock(&amp;d-&gt;watchdog_lock);<br>&gt; &gt; +<br>&gt; &g=
t; + =C2=A0 =C2=A0for ( i =3D 0; i &lt; NR_DOMAIN_WATCHDOG_TIMERS; i++ )<br=
>&gt; &gt; + =C2=A0 =C2=A0{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( =
test_bit(i, &amp;d-&gt;watchdog_inuse_map) )<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stop=
_timer(&amp;d-&gt;watchdog_timer[i].timer);<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>&gt; &gt; + =C2=A0 =C2=A0}<br>&gt; &gt; +<br>&gt; &gt; + =
=C2=A0 =C2=A0spin_unlock(&amp;d-&gt;watchdog_lock);<br>&gt; &gt; +}<br>&gt;=
 &gt; +<br>&gt; &gt; +void watchdog_domain_resume(struct domain *d)<br>&gt;=
 &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0unsigned int i;<br>&gt; &gt; +<br>&gt;=
 &gt; + =C2=A0 =C2=A0spin_lock(&amp;d-&gt;watchdog_lock);<br>&gt; &gt; +<br=
>&gt; &gt; + =C2=A0 =C2=A0for ( i =3D 0; i &lt; NR_DOMAIN_WATCHDOG_TIMERS; =
i++ )<br>&gt; &gt; + =C2=A0 =C2=A0{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if ( test_bit(i, &amp;d-&gt;watchdog_inuse_map) )<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0set_timer(&amp;d-&gt;watchdog_timer[i].timer,<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOW() + S=
ECONDS(d-&gt;watchdog_timer[i].timeout));<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>&gt; &gt; + =C2=A0 =C2=A0}<br>&gt; &gt; +<br>&gt; &gt; + =C2=
=A0 =C2=A0spin_unlock(&amp;d-&gt;watchdog_lock);<br>&gt; &gt; +}<br>&gt; &g=
t; +<br>&gt; &gt; +#endif /* CONFIG_SYSTEM_SUSPEND */<br>&gt; &gt; +<br>&gt=
; &gt; =C2=A0 /*<br>&gt; &gt; =C2=A0 =C2=A0* Pin a vcpu temporarily to a sp=
ecific CPU (or restore old pinning state if<br>&gt; &gt; =C2=A0 =C2=A0* cpu=
 is NR_CPUS).<br>&gt; &gt; diff --git a/xen/include/xen/sched.h b/xen/inclu=
de/xen/sched.h<br>&gt; &gt; index d0d10612ce..caab4aad93 100644<br>&gt; &gt=
; --- a/xen/include/xen/sched.h<br>&gt; &gt; +++ b/xen/include/xen/sched.h<=
br>&gt; &gt; @@ -1109,6 +1109,15 @@ void scheduler_disable(void);<br>&gt; &=
gt; =C2=A0 void watchdog_domain_init(struct domain *d);<br>&gt; &gt; =C2=A0=
 void watchdog_domain_destroy(struct domain *d);<br>&gt; &gt; =C2=A0<br>&gt=
; &gt; +#ifdef CONFIG_SYSTEM_SUSPEND<br>&gt; &gt; +/*<br>&gt; &gt; + * Susp=
end/resume watchdogs of domain (while the domain is suspended its<br>&gt; &=
gt; + * watchdogs should be on pause)<br>&gt; &gt; + */<br>&gt; &gt; +void =
watchdog_domain_suspend(struct domain *d);<br>&gt; &gt; +void watchdog_doma=
in_resume(struct domain *d);<br>&gt; &gt; +#endif /* CONFIG_SYSTEM_SUSPEND =
*/<br>&gt; &gt; +<br>&gt; &gt; =C2=A0 /*<br>&gt; &gt; =C2=A0 =C2=A0* Use th=
is check when the following are both true:<br>&gt; &gt; =C2=A0 =C2=A0* =C2=
=A0- Using this feature or interface requires full access to the hardware<b=
r>&gt;<br>&gt; Cheers,<br>&gt;<br>&gt; --<br>&gt; Julien Grall<br><div>&gt;=
</div><div><br></div><div>Kind regards,</div><div>Mykola</div></div>

--00000000000037fb820636099278--

