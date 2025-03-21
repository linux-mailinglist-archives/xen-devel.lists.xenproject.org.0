Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133CFA6B80D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923820.1327232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ1w-00086w-6F; Fri, 21 Mar 2025 09:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923820.1327232; Fri, 21 Mar 2025 09:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ1w-00085r-1n; Fri, 21 Mar 2025 09:51:08 +0000
Received: by outflank-mailman (input) for mailman id 923820;
 Fri, 21 Mar 2025 09:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9U11=WI=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvZ1u-0007di-AO
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:51:06 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d37759-063a-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:51:05 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-30bfca745c7so17798791fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 02:51:05 -0700 (PDT)
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
X-Inumbo-ID: 01d37759-063a-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742550665; x=1743155465; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmS/lrjEXrFtZExQS/WwhL0lFt1f5u/PLpXgR8yoCqI=;
        b=lIxM+0GUUo1eaWMciteIhztovoOIkKB8Wf1gJRCq0NMpax2H/l+uV5TZ/BxxzrRn8w
         PbzWVyhpARFY9Ig3a2TXj+4sZMqhfg9gJ15UBH6Trli7FAR13RfC+Br2Kg768ARn0IXp
         rg7Lpi/JB1rPKBbrMXleXO4h9l6lYxfLnzvw8YNrVSuetz5+AZR/6LDZmDlgkPPRd765
         nL0gZpGqsYtkcvrbMrqmu/BKyMGPFRocCLiZ15nrjWf5KzUN51v5EKoJRhK+kTHINNRm
         F7zf4CGh3K5/l0fukYbmYHWcQlGMfOc30FF0PWaV6aPNkdXINip+DjqQjQ3gJBVpyRvr
         VlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550665; x=1743155465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmS/lrjEXrFtZExQS/WwhL0lFt1f5u/PLpXgR8yoCqI=;
        b=FvFRkfXRHjc0e1VMu/i5jggwQo5HMFJZk9BH7rS189r5BF3jvydnCW65soPd5Lse63
         wLCGLhqFMN72dcDyzuv+kF7+z6b6VOs1YbK/T4nWLUh7YqeX2ggX2FH40qxGIxABmc1Y
         tqRyjwQ5WAd4aMbzAIekJWTEBL5zLrwpc3APRNx16Ophafi25AQkk2E/gl+g6ETufRyB
         lU/8CLO43rgfMzKwgpu48z6JcUMHAhdKJVzEe/fBR0n6iOz40HB+fP+FsqgIxEIL7zMd
         r98jCUg3H3J0W1JdMYXsw4fp0XxIHbxcf7ioKfBZPrx4A30dFAibWbN1BET+C5CGj6sm
         wh7A==
X-Gm-Message-State: AOJu0YysyO8tCVFTz7WzSd9xOEubV3exjV/O7E5kvnrIKFpdsdBf4XrX
	F3subBWWblQdqUzVXAitNljisvGi6m8wcsFhGfuzG2o0kjq1uYh3GG/ZdXO6BpXyJ4K5FaHROJ+
	TG7a03nA0k70phrc3ST1XThYL7I8=
X-Gm-Gg: ASbGncv/eEB41kFJAcP91h3bo5ILx4bJS64WH11aO+YiCB0PlG3y/YH5QaYPWJ1RQOr
	bWOTcTtCQjhx+hF86h04qXgoznUM07Ct3SzdLylzEPhmNLQQ3704evczrUpfRa+82KkNPQZg4EB
	wSqfeCO0BxHk3Hg9iu8toGeLM4
X-Google-Smtp-Source: AGHT+IH0BX8lII3iuygD+O0LBwrx6sdgohZSwQ5HcbjCxjjd4XhPSmQ2c66NelD0LbJpgHVzq6X+JCPiidSDRX/rfC8=
X-Received: by 2002:a05:651c:c3:b0:30c:c8d:ba3c with SMTP id
 38308e7fff4ca-30d7e23396cmr8413281fa.17.1742550665088; Fri, 21 Mar 2025
 02:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
 <a0f4bb7b-d560-4017-af0a-1544623abd50@epam.com>
In-Reply-To: <a0f4bb7b-d560-4017-af0a-1544623abd50@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 21 Mar 2025 11:50:52 +0200
X-Gm-Features: AQ5f1JpMSAvkk9ipQVS6HSpMt4YHoBifeeVYPz9d4fNVOq2n9fOWlbqR1qbqfxo
Message-ID: <CAGeoDV8b2s8KhSAjdw4PeUSKTr69fCTf_D5nLyZeLaXcrd++5w@mail.gmail.com>
Subject: Re: [PATCH 08/16] xen/arm: add watchdog domain suspend/resume helpers
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Mirela Simonovic <mirela.simonovic@aggios.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 20, 2025 at 1:25=E2=80=AFPM Grygorii Strashko
<grygorii_strashko@epam.com> wrote:
>
>
>
> On 05.03.25 11:11, Mykola Kvach wrote:
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
>
> My understanding is that domain's watchdogs support are not mandatory req=
uirement
> for enabling basic System suspend2ram feature, as they are not enabled au=
tomatically.
> So, domain's watchdog patches can be separated and posted after basic fun=
ctionality
> is in place.

AFAIK, the hardware domain always has the watchdog enabled, at least for no=
w.

>
> [...]
>
> --
> Best regards,
> -grygorii

Best regards,
Mykola

