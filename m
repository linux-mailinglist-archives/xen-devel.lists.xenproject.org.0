Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F198814D3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696012.1086503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmy95-0000Ud-IZ; Wed, 20 Mar 2024 15:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696012.1086503; Wed, 20 Mar 2024 15:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmy95-0000Sg-F5; Wed, 20 Mar 2024 15:46:27 +0000
Received: by outflank-mailman (input) for mailman id 696012;
 Wed, 20 Mar 2024 15:46:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmy94-0000Sa-CT
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:46:26 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0116bcba-e6d1-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 16:46:24 +0100 (CET)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-222c0572eedso11800fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:46:24 -0700 (PDT)
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
X-Inumbo-ID: 0116bcba-e6d1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710949583; x=1711554383; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miw496bbDIatANlneGT6asc88zxT8lpacC8+/iUgDtU=;
        b=fSg2EC9Ox9P9U1/P/nNjvL0H7vipK/gHwDratTINXYslKxZadrv6ihPSwehQJ/kqyd
         Aj3LzBg2dMMwG9nKBsfKPSo3JIjPnijMOWkq2RurTVU13xsJoZ8ov2qnPB50shsy7z/d
         hxvA5NTdlfA8cZWcInpY535AGGqIGfWJeSOww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710949583; x=1711554383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miw496bbDIatANlneGT6asc88zxT8lpacC8+/iUgDtU=;
        b=dqjsL0007jIHW94wSTSpROuDj27M9U08hj72BWje1l6qd9Z2Up4jLrUy8KXUip1zhh
         81l9gAuHFrK9Zaoryd+fv//jFGRU2RCmPyteSIriEjbYiNj1pouAwd2zyE8TZ/u3dvll
         AMVIEEmnyVuQ0eQ+YjTewKoVgaZRTKf8BrMG6VqEnrpla4OnLY3mLL1Qfx1Ez3K73Sv0
         ZeSKUXrtWBd08c/k0/ngrKetX9Ykc+F/Kvy9nJ0X2C2WaK7MjQMa3nWDA79HqWqII0Fd
         jssXj907Sw+LpUwvL1sX8jBAH2ZCjyx+fk/olhEVCzU+LHG6694FdTRqCAPqy8OD01op
         RrBg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8BhxL0ZW+Znd+dzDRsvselYa0ZD404pqu6secCiA9XTW3mY1A2aVFGlFbubSIgF1xnUKH3slUdjsu/jGQT+SeDcsU62QdCyvfH3c9Ow=
X-Gm-Message-State: AOJu0YyLQXVkIriGJWXabIwdJ8i4PY8ws1TJi5NexfO042ITRv9+Hzej
	nzOToezyTHykvbyCCdF8EYGgPW37X94qmZYctR1jLA+Gh5OocGXeeqOx/ZTPOYKwP32cLPOxkt+
	Q9jdB5zh19TBrG9dkVH3cDjo5/Zj29cx/oVz61Q==
X-Google-Smtp-Source: AGHT+IHaeXm09jAW4Jb0Kdg81FUOBjr9CiJaWdARDsccbnssZok8wnbf/I+y475DoBGV5hYL2D0ASlqe2WY5VNexCKk=
X-Received: by 2002:a05:6870:8286:b0:221:46ea:6790 with SMTP id
 q6-20020a056870828600b0022146ea6790mr6438838oae.56.1710949583063; Wed, 20 Mar
 2024 08:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-6-andrew.cooper3@citrix.com> <dd9fb309-d89b-4658-8a1d-1c22758a6a95@suse.com>
In-Reply-To: <dd9fb309-d89b-4658-8a1d-1c22758a6a95@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 15:46:11 +0000
Message-ID: <CA+zSX=bFwRULcO-M6BPev4CnUN1YNQazZBN+=3vXc+RJ0=ULEQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] xen: Switch to new TRACE() API
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 1:45=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 18.03.2024 17:35, Andrew Cooper wrote:
> > @@ -736,9 +736,19 @@ static void vlapic_update_timer(struct vlapic *vla=
pic, uint32_t lvtt,
> >              delta =3D delta * vlapic->hw.timer_divisor / old_divisor;
> >          }
> >
> > -        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(d=
elta),
> > -                        TRC_PAR_LONG(is_periodic ? period : 0),
> > -                        vlapic->pt.irq);
> > +        if ( unlikely(tb_init_done) )
> > +        {
> > +            struct {
> > +                uint64_t delta, period;
> > +                uint32_t irq;
> > +            } __packed d =3D {
> > +                .delta =3D delta,
> > +                .period =3D is_periodic ? period : 0,
> > +                .irq =3D vlapic->pt.irq,
> > +            };
> > +
> > +            trace_time(TRC_HVM_EMUL_LAPIC_START_TIMER, sizeof(d), &d);
> > +        }
>
> Instead of this open-coding, how about
>
>         if ( is_periodic )
>             TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32=
,
>                        period, period >> 32, vlapic->pt.irq);
>         else
>             TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32=
,
>                        0, 0, vlapic->pt.irq);
>
> thus improving similarity / grep-ability with ...

Yuck -- I'm not keen on breaking the similarity, but I'm *really* not
a fan of duplicating code.  Both are kind of "code smell"-y to me, but
I think the second seems worse.

It sort of looks to me like the source of the problem is that the
`period` variable is overloaded somehow; in that it's used to update
some calculation even if !is_periodic, and so the two places it's used
as an actual period (the trace code, and the call to
`create_periodic_time()`) need to figure out if `periodic` is for them
to use or not.

What about adding a variable, "timer_period" for that purpose?
Something like the following?

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index dcbcf4a1fe..ea14fc1587 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -729,6 +729,8 @@ static void vlapic_update_timer(struct vlapic
*vlapic, uint32_t lvtt,

     if ( delta && (is_oneshot || is_periodic) )
     {
+        uint64_t timer_period =3D 0;
+
         if ( vlapic->hw.timer_divisor !=3D old_divisor )
         {
             period =3D (uint64_t)vlapic_get_reg(vlapic, APIC_TMICT)
@@ -736,12 +738,15 @@ static void vlapic_update_timer(struct vlapic
*vlapic, uint32_t lvtt,
             delta =3D delta * vlapic->hw.timer_divisor / old_divisor;
         }

-        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(delta=
),
-                        TRC_PAR_LONG(is_periodic ? period : 0),
-                        vlapic->pt.irq);
+        if ( is_periodic )
+            timer_period =3D period;
+
+        TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32,
+                   timer_period, timer_period >> 32,
+                   vlapic->pt.irq);

         create_periodic_time(current, &vlapic->pt, delta,
-                             is_periodic ? period : 0, vlapic->pt.irq,
+                             timer_period, vlapic->pt.irq,
                              is_periodic ? vlapic_pt_cb : NULL,
                              &vlapic->timer_last_update, false);


As with Jan, I'd be OK with checking it in the way it is if you prefer, so:

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

