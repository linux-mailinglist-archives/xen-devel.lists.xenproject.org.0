Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305BEA6A3C4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921673.1325458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDE4-0001uH-EC; Thu, 20 Mar 2025 10:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921673.1325458; Thu, 20 Mar 2025 10:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDE4-0001re-AM; Thu, 20 Mar 2025 10:34:12 +0000
Received: by outflank-mailman (input) for mailman id 921673;
 Thu, 20 Mar 2025 10:34:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVbL=WH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvDE2-0001rW-Vf
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:34:10 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbc49140-0576-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 11:34:10 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54ad1e75f49so422632e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 03:34:10 -0700 (PDT)
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
X-Inumbo-ID: dbc49140-0576-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742466849; x=1743071649; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+sdNEvkgyfxZGH4q2UckX89IcUSg62K0ZvWWRSUPUU=;
        b=T6WXSTqpqraKMO1EN+zDUSPQ3geNxijM+QghXYeLQmnpwhVceuETkoofpRQNXrNnCR
         iohUhSECuzJkGHKrdjE/cUy6YX3pFwL7nRkCedkSR+NuIeUYUY09h+ATjEugyr5buO8T
         tC11xIhTaWJOOOPhdjos6DpjqlpM8U/qyTvMIS/e2y3CD0QeVV5rjo683FSTEEAR89x8
         +pT1Sn6uipQQk2kOFD0bQYplHL6on/9H9XytIslWra8Etk8hcJr7RCk3+EWwhPyjwpbc
         XYUqp5hY6hIVUjjSsRCcC4qRxM1M8DfMolPP4+gxby+zI05dxFBjJLeRjVK+K3kpvIrz
         dT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466849; x=1743071649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+sdNEvkgyfxZGH4q2UckX89IcUSg62K0ZvWWRSUPUU=;
        b=oDLf5ojHFnndTicEtZBK8/6E9nmkVMlrfatucSlpLBCaxBzOVlgNsTQQN14QOcpszU
         usnNQ5u3T8gKMMmHIS+EZGPNb+VjouZGITZTzh+BTg3VmW2FftRDFhMdlgVSdo8VO+WT
         HDtpqodvjNlCUzV4Jhb2gAQFbaVEAooRBIZPqi92xqNQrLfM+sTEj2YObxYkSylw/n1z
         VHMKbqBS+iU7rJc0KJGILQ4hoQQTDKMnhPCwY0M+dqJ5Wfv8E/UMzXGzsenQHmReDbHh
         c0gFGGaAEIaWMNta/O4c1tgqtCPJdzF97eII8uLLtPNx67jL/fJGTUmTdu6GnGIL9RTy
         eO6Q==
X-Gm-Message-State: AOJu0YyuJcPJX0hWLu/kwGo53713mMaaiiZxlNAMcXIfACSRExzWzKgW
	OPdAnUPGNZXklPzWC7Lw088rBiNqNm6hQO73mRFpEMEexoh7zm+lBAEQHivMJTsvLzCkkJZKc6g
	1YCAO/Th4rmzMAML/l+dKQUBldrA=
X-Gm-Gg: ASbGnctvFbbJvhYC/U5bJHH4uvfeAB00ui1OdmGDzeTqGYvO9D2tI88+h627HmpekGN
	4wkDlBuxkW7c412ZGCdMYZ8i2z/EZfmCZ0d02sqyGtqixGLzo6qIUileY8Jhl6+ntOWstwrobHY
	YReRo1TYYNet3MWPzS6pyOFBNqpSU+CFNeR+Y=
X-Google-Smtp-Source: AGHT+IFT6fa3wRQ4C6/cNQQ6bF8/9CWjteB8TxoUlM3aJGEmEUjkvxz7A6yNdYLOnLR87atKP3zImvlYpYnhGhScFRg=
X-Received: by 2002:a05:6512:3e06:b0:549:86c8:1132 with SMTP id
 2adb3069b0e04-54acb1bf0abmr2434614e87.17.1742466849056; Thu, 20 Mar 2025
 03:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <18a8a86ca0c1b884278d635fb18b3b53e062f10e.1741164138.git.xakep.amatop@gmail.com>
 <257d612f-62ec-4507-8e18-f8e10fb20975@epam.com>
In-Reply-To: <257d612f-62ec-4507-8e18-f8e10fb20975@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 20 Mar 2025 12:33:58 +0200
X-Gm-Features: AQ5f1JrESIrJMlqf5dV3na82IhzdW4N876Q4U89SoW924y2pqVzGOfEFOeYS6e8
Message-ID: <CAGeoDV-mgNhK7XuGcnE9sc56ZF1UG-Nfzkr0RqAme-V-9k1JKA@mail.gmail.com>
Subject: Re: [PATCH 03/16] xen/arm: introduce a separate struct for watchdog timers
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: xen-devel@lists.xenproject.org, 
	Mirela Simonovic <mirela.simonovic@aggios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>, 
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 19, 2025 at 6:14=E2=80=AFPM Grygorii Strashko
<grygorii_strashko@epam.com> wrote:
>
>
>
> On 05.03.25 11:11, Mykola Kvach wrote:
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > Introduce a separate struct for watchdog timers. It is needed to proper=
ly
> > implement the suspend/resume actions for the watchdog timers. To be abl=
e
> > to restart watchdog timer after suspend we need to remember their
> > frequency somewhere. To not bloat the struct timer a new struct
> > watchdog_timer is introduced, containing the original timer and the las=
t
> > set timeout.
> >
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > This commit was introduced in patch series V2.
> > ---
> >   xen/common/keyhandler.c    |  2 +-
> >   xen/common/sched/core.c    | 11 ++++++-----
> >   xen/include/xen/sched.h    |  3 ++-
> >   xen/include/xen/watchdog.h |  6 ++++++
> >   4 files changed, 15 insertions(+), 7 deletions(-)
> >
> > diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> > index 0bb842ec00..caf614c0c2 100644
> > --- a/xen/common/keyhandler.c
> > +++ b/xen/common/keyhandler.c
> > @@ -305,7 +305,7 @@ static void cf_check dump_domains(unsigned char key=
)
> >           for ( i =3D 0 ; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> >               if ( test_bit(i, &d->watchdog_inuse_map) )
> >                   printk("    watchdog %d expires in %d seconds\n",
> > -                       i, (u32)((d->watchdog_timer[i].expires - NOW())=
 >> 30));
> > +                       i, (u32)((d->watchdog_timer[i].timer.expires - =
NOW()) >> 30));
>
> I'd like to propose to add watchdog API wrapper here, like
>
> watchdog_domain_expires_sec(d,id)
>
> or
>
> watchdog_domain_dump(d)
>
> and so hide implementation internals.

It was already proposed by Jan Beulich. I'll do it.

>
> >
> >           arch_dump_domain_info(d);
> >
> > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > index d6296d99fd..b1c6b6b9fa 100644
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -1556,7 +1556,8 @@ static long domain_watchdog(struct domain *d, uin=
t32_t id, uint32_t timeout)
> >           {
> >               if ( test_and_set_bit(id, &d->watchdog_inuse_map) )
> >                   continue;
> > -            set_timer(&d->watchdog_timer[id], NOW() + SECONDS(timeout)=
);
> > +            d->watchdog_timer[id].timeout =3D timeout;
> > +            set_timer(&d->watchdog_timer[id].timer, NOW() + SECONDS(ti=
meout));
> >               break;
> >           }
> >           spin_unlock(&d->watchdog_lock);
> > @@ -1572,12 +1573,12 @@ static long domain_watchdog(struct domain *d, u=
int32_t id, uint32_t timeout)
> >
> >       if ( timeout =3D=3D 0 )
> >       {
> > -        stop_timer(&d->watchdog_timer[id]);
> > +        stop_timer(&d->watchdog_timer[id].timer);
> >           clear_bit(id, &d->watchdog_inuse_map);
> >       }
> >       else
> >       {
> > -        set_timer(&d->watchdog_timer[id], NOW() + SECONDS(timeout));
> > +        set_timer(&d->watchdog_timer[id].timer, NOW() + SECONDS(timeou=
t));
> >       }
> >
> >       spin_unlock(&d->watchdog_lock);
> > @@ -1593,7 +1594,7 @@ void watchdog_domain_init(struct domain *d)
> >       d->watchdog_inuse_map =3D 0;
> >
> >       for ( i =3D 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> > -        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, =
0);
> > +        init_timer(&d->watchdog_timer[i].timer, domain_watchdog_timeou=
t, d, 0);
> >   }
> >
> >   void watchdog_domain_destroy(struct domain *d)
> > @@ -1601,7 +1602,7 @@ void watchdog_domain_destroy(struct domain *d)
> >       unsigned int i;
> >
> >       for ( i =3D 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> > -        kill_timer(&d->watchdog_timer[i]);
> > +        kill_timer(&d->watchdog_timer[i].timer);
> >   }
> >
> >   /*
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index 177784e6da..d0d10612ce 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -24,6 +24,7 @@
> >   #include <asm/current.h>
> >   #include <xen/vpci.h>
> >   #include <xen/wait.h>
> > +#include <xen/watchdog.h>
> >   #include <public/xen.h>
> >   #include <public/domctl.h>
> >   #include <public/sysctl.h>
>
> I think struct watchdog_timer (or whatever you going to add) need to be m=
oved in sched.h
> because...
>
> > @@ -569,7 +570,7 @@ struct domain
> >   #define NR_DOMAIN_WATCHDOG_TIMERS 2
> >       spinlock_t watchdog_lock;
> >       uint32_t watchdog_inuse_map;
> > -    struct timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
> > +    struct watchdog_timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
> >
> >       struct rcu_head rcu;
> >
> > diff --git a/xen/include/xen/watchdog.h b/xen/include/xen/watchdog.h
> > index 4c2840bd91..2b7169632d 100644
> > --- a/xen/include/xen/watchdog.h
> > +++ b/xen/include/xen/watchdog.h
> > @@ -8,6 +8,12 @@
> >   #define __XEN_WATCHDOG_H__
> >
> >   #include <xen/types.h>
> > +#include <xen/timer.h>
>
> ...this interface is not related to domain's watchdogs.
>  From x86 code, it seems like some sort of HW watchdog used to check pCPU=
s state
> and not domains/vcpu. And it's Not enabled for Arm now.

Sorry, but maybe I missed something. However, this struct and the
previous watchdog timer
are used as fields of the domain struct and correspond to a particular
domain. Also, take a look
at some functions where the watchdog timer field is used: domain_watchdog,
watchdog_domain_init, and watchdog_domain_destroy.
I see a direct connection with a domain..

>
> > +
> > +struct watchdog_timer {
> > +    struct timer timer;
> > +    uint32_t timeout;
> > +};
> >
> >   #ifdef CONFIG_WATCHDOG
> >

Best regards,
Mykola

