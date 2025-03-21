Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35447A6B808
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923809.1327222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ1K-0007I0-Ox; Fri, 21 Mar 2025 09:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923809.1327222; Fri, 21 Mar 2025 09:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ1K-0007Gu-Kg; Fri, 21 Mar 2025 09:50:30 +0000
Received: by outflank-mailman (input) for mailman id 923809;
 Fri, 21 Mar 2025 09:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9U11=WI=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvZ1I-0007Gm-Va
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:50:28 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac05127-0639-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:50:27 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30bfd4d4c63so17594371fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 02:50:27 -0700 (PDT)
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
X-Inumbo-ID: eac05127-0639-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742550626; x=1743155426; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbJVYRBqRAw/j1OSOElAjGXQC8jctn0QdIhX22AJgxU=;
        b=CoERTXM+tDFX3xOcTuTJq1LGkfmgv75/i/Ge0hsg3NQvsFb4NLO/yzTw87BFbZ1o0t
         0b4iyveu9AXBTQlxuS7JksTXej4X+kfuYGHhBnfXsMcK9EQwQDH1s7R+eoLnv/YZ7wA6
         U8qR9AtzMUvAZRf/th1mVmKFiSNyxrq+SXbmITdJ0mmkAdcfw/cWigl0xDjn0n+qOiF3
         0/foTysPH8/aYmaQufXwdY/IFnU3/z28GdR1qEsBRnN0R+iGAyseTTp5ZYSqDmkSKui0
         6fRSuj3yq91mhY6ob2pkUTTs1IP5aa5tBkRc2kMUEduU6HEjGzF9cs4oNTVz3cQaFKZc
         qtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550626; x=1743155426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbJVYRBqRAw/j1OSOElAjGXQC8jctn0QdIhX22AJgxU=;
        b=IGWovmgLvgqFoyxVpWg+CXckP+qc5ly3rXwB+YwnyV8hqKAo2oJg4SqnWAggLVLNdA
         u5TOH7nvRT3lKnwqoAp29FbW2HfEjBpGShjTdERSibKMx3HUl9ik5RlJ1SPfQBZdNWSl
         ILW++bq3FeSKYsKniDkBusW7MaM4LpBGH65ROc1Oy42eZFsQ87HrlNsAY62tJllPOxL8
         QAF3j2nPQtjvgEixHUB5LeZLvZLg9AKT9GM602Q8ouQ65BVIwoxXW5o2SmQWO3qapZ69
         I6elxDp6NqzDYbrtocfbKI6DFlqlSPfHwjYSuoy8RKvAmZD+2itbaA5AYApQnVwWAihw
         5CGw==
X-Forwarded-Encrypted: i=1; AJvYcCXp7F5RginJjGHFKPI6xgYrLcoHKysR4dQ4HvgGgOWUJ0aWvlA08isMxdxNzu7Dup8HoMDIvBlye/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4axUGwVoku7yVVrZcIi5UgydSZL5IjQn/1sOuv+eRueWx6KEn
	VLXQWK4/0fqHLAVT+o2ZRcacv6LS84aE+P0YeKql8yVOILoJxDE/s3rGfXkbJ64W5a7WBVdgLr7
	GCFvdVjux6kaozcL20WGxoItGJA8=
X-Gm-Gg: ASbGncuW//18PPLgpbTj5u5yly59UUa47aUAPYz0ZFd5EqFP1/PNygEY5LOkmHAJouS
	/wHx7GgsVzwwMyKiaIsu4lGK+YoSiq4SSfkTNrnJyt6d0PQe0azQn3t54V+bkLHUvYjFz6IcRoT
	dIXawmTifgqheDbs10EN2cAfu7
X-Google-Smtp-Source: AGHT+IGAU/rW7E9oiLyuX3R1BaEX5HtiDH6vbmE+ME+CZ007tvrn8fIFVSoutUYdfvSR1egHXB0ahQQfT/wWaHZ8g3s=
X-Received: by 2002:a2e:bc0f:0:b0:30b:ecfc:78bf with SMTP id
 38308e7fff4ca-30d7e206777mr8541641fa.5.1742550626376; Fri, 21 Mar 2025
 02:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
 <428f538a-0761-4d06-9c4f-ba74cf441b0d@suse.com>
In-Reply-To: <428f538a-0761-4d06-9c4f-ba74cf441b0d@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 21 Mar 2025 11:50:15 +0200
X-Gm-Features: AQ5f1JpJJD7Y1NZ3XQhN7gB3MJjualgWc30sEiD3m0FEkyqv8BvK4W4OeMY9Rpo
Message-ID: <CAGeoDV9Tgd1MhVutbKhWRJkMMMix5yFVRcA6vX=fP=fzqFdV1w@mail.gmail.com>
Subject: Re: [PATCH 08/16] xen/arm: add watchdog domain suspend/resume helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Dario Faggioli <dfaggioli@suse.com>, 
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Mirela Simonovic <mirela.simonovic@aggios.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 13, 2025 at 5:34=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 05.03.2025 10:11, Mykola Kvach wrote:
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
>
> From: !=3D first S-o-b: is always raising the question of who's the origi=
nal
> author of a patch.

I'll try to change the From field if possible. Thank you for pointing that =
out.

>
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -1605,6 +1605,45 @@ void watchdog_domain_destroy(struct domain *d)
> >          kill_timer(&d->watchdog_timer[i].timer);
> >  }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
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
>
> We generally prefer to omit the braces if the body of an if() (or
> whatever it is) is a single statement / line.

will change

>
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
>
> The timeout may have almost expired before suspending; restoring to the
> full original period feels wrong. At the very least, if that's indeed
> intended behavior, imo this needs spelling out explicitly.

It takes some time to wake up the domain, but the watchdog timeout is
reset by a userspace daemon. As a result, we can easily encounter a
watchdog trigger during the  resume process. It looks like we should
stop the watchdog timer from the guest, and in that case, we can drop
all changes related to the watchdog in this patch series.
In any case, in this patch, we restore the default timeout instead of
using the real remaining time, so the behavior won't change. However,
I'm not sure exactly how much effort this would require. We can
enable/disable the watchdog using the Linux kernel driver and the Xen
watchdog daemon, but the Linux kernel already handles suspend/resume
of the Xen watchdog timer.

>
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -1109,6 +1109,15 @@ void scheduler_disable(void);
> >  void watchdog_domain_init(struct domain *d);
> >  void watchdog_domain_destroy(struct domain *d);
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +/*
> > + * Suspend/resume watchdogs of domain (while the domain is suspended i=
ts
> > + * watchdogs should be on pause)
> > + */
> > +void watchdog_domain_suspend(struct domain *d);
> > +void watchdog_domain_resume(struct domain *d);
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
>
> I don't think the #ifdef is strictly needed here?

ok, I'll drop it

>
> Jan

Best regards,
Mykola

