Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B45A6A394
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:25:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921623.1325418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvD5O-0006C0-Uy; Thu, 20 Mar 2025 10:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921623.1325418; Thu, 20 Mar 2025 10:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvD5O-00069K-RJ; Thu, 20 Mar 2025 10:25:14 +0000
Received: by outflank-mailman (input) for mailman id 921623;
 Thu, 20 Mar 2025 10:25:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVbL=WH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvD5N-000698-M6
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:25:13 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b2abacd-0575-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:25:12 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-543d8badc30so767804e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 03:25:12 -0700 (PDT)
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
X-Inumbo-ID: 9b2abacd-0575-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742466311; x=1743071111; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btvDhywzzDVzXqx25Umd41+YNwR9+dXxoM+kl8m73ao=;
        b=Ffk8RZGtlGxK9hSkAN6i6DhVk8B93i7aQjHi7f7sA/Z4IhjM+vdMxofZaBJJSvLxI2
         J3NLVCiV5NjyWxurmfgyJqI3CN000f4/tLYQH3H9lXDE/kfHlnO27bX/suXU/Wx8laas
         Qdd13Vcm7X5uiMNejUVBWWICpUHevhziNlL+jB4iEollYtbx728I+ZkAaE/7TUxpEhfn
         8fP3LWZi5oCJQiaI2gINdCOWZCqOEMBRMRpstXYeOi/uc1BdOPA/Kb+GlQJqHx6uxPmX
         6dIWii0/2BNarPtVdkOr4s5Eo74wg/f0CATFbXONlfjcyUkrom1XsOun7qDwLDnD0ckM
         adWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466311; x=1743071111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btvDhywzzDVzXqx25Umd41+YNwR9+dXxoM+kl8m73ao=;
        b=njKTYBQKdMV7uYdbbB8xUoH+KgfvIx9XwrS5aTChTrXbqSrOzMsskBNJ3Ups8bDY3f
         ybKOex+HfyTkih9laM30nA5AOyp1QU2ti6CMjUG3XpQ26CyCEr5MIkVu3LAL+j90Evhh
         DkH6Zv9Ylrp6o0o9QwbRw58XbPFr9Chb/vteo6oxkRumaIJ8GdBY6SUS7MMzCjD4MtWd
         nBI7VjPBP3c7z0romOBgk+AVqpMknPVq3lpmcylIqYZysEq+TWINXOLq62tSCMSfA3+N
         N2zn5F2a4WlPzZAX0RFWwCBnfNLYR/WFAyEYZ767Kxks+mqLLYGxeUHROhlEh9D0gUkp
         6/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUvNO6AuWYm6wVSNVuP45CrlhlJhSsvpnN0KT5jcaHeMAx+HO4YCvMMhwWQL/d+piW3uGLNfiwftnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw205k+pcmEmXcb24n908PeUVzBCUUb8SCJKgSgyS1LlAqOI9JL
	KI0E+BiAn7qVpLkdbyvK4NhU4n68AnAkq7c8HN3Qm3JStY8Tx5VuKRAIARW/nPryD4ibOSjhgtQ
	uTw0F03dCCbfXS278IgpfSAWm/GU=
X-Gm-Gg: ASbGnctvudX+iBb89n5AljIe+JG9HkKsj9IfH5EyNUUyTuI7z9EuJi6YmcRXbKLV9gL
	yw/A2qZhawuwonNHLw+4pHwpFJte91Ysg7ESP+gm2Kqcl/SnsMzpnh7tDCJEkAjdEsFNRs55SMm
	Qu2hRgv8Gr6T/yE6s5AYgtPPWT
X-Google-Smtp-Source: AGHT+IGQIC9NtKcmT66Ef2ElejEvfXSLFeykOCLe9DszeOppdxgbz43UA2wwFG6lFGIqk0/ydbxWaTBq4H3rG7TFB+w=
X-Received: by 2002:a05:6512:1286:b0:549:91e0:143 with SMTP id
 2adb3069b0e04-54acb19db19mr1811336e87.5.1742466311177; Thu, 20 Mar 2025
 03:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <18a8a86ca0c1b884278d635fb18b3b53e062f10e.1741164138.git.xakep.amatop@gmail.com>
 <ddbf31ae-5877-4df2-a6c7-8b0251ce2b01@suse.com>
In-Reply-To: <ddbf31ae-5877-4df2-a6c7-8b0251ce2b01@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 20 Mar 2025 12:25:00 +0200
X-Gm-Features: AQ5f1Jonyf3qzt9JIU2FdeuIWaoMFGt2B0AtdIHBUCdgRpzLE6lnN8J4PleLqNo
Message-ID: <CAGeoDV_h9vgyKyk_kH4XwsoWiJN0dx2UY+N0JAezUknGk9ez3g@mail.gmail.com>
Subject: Re: [PATCH 03/16] xen/arm: introduce a separate struct for watchdog timers
To: Jan Beulich <jbeulich@suse.com>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>, 
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 13, 2025 at 5:27=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 05.03.2025 10:11, Mykola Kvach wrote:
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
>
> A From: with no corresponding S-o-b: is potentially problematic. You also
> can't simply add one with her agreement, though.

Thank you for pointing that out! I'll revisit all commits and add the missi=
ng
Signed-off-by tags in the next version of patch series.

>
> > ---
> > This commit was introduced in patch series V2.
>
> Yet, btw, the whole series isn't tagged with a version.

Yes, I added a description of the versions in the cover letter and
followed the style
used in version 2 meaning I avoided using tags. Since years have passed bet=
ween
the patch series, I thought including tags might confuse reviewers.
If you want I'll add a correct tag in the next version of this patch series=
,
i.e. V4 instead of V2.

>
> > --- a/xen/common/keyhandler.c
> > +++ b/xen/common/keyhandler.c
> > @@ -305,7 +305,7 @@ static void cf_check dump_domains(unsigned char key=
)
> >          for ( i =3D 0 ; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> >              if ( test_bit(i, &d->watchdog_inuse_map) )
> >                  printk("    watchdog %d expires in %d seconds\n",
> > -                       i, (u32)((d->watchdog_timer[i].expires - NOW())=
 >> 30));
> > +                       i, (u32)((d->watchdog_timer[i].timer.expires - =
NOW()) >> 30));
>
> I realize you mean to just do a mechanical replacement here, yet the use =
of
> u32 is not only against our style (should be uint32_t then), but it's als=
o
> not clear to me that this subtraction can't ever yield a negative result.
> Hence the use of %d looks more correct to me than the cast to an unsigned
> type.
>
> In any event the already long line now grows too long and hence needs
> wrapping.

Maybe it would be better to send a separate patch for this. I'm not sure if=
 such
changes are needed within the scope of this patch series

>
> > @@ -569,7 +570,7 @@ struct domain
> >  #define NR_DOMAIN_WATCHDOG_TIMERS 2
> >      spinlock_t watchdog_lock;
> >      uint32_t watchdog_inuse_map;
> > -    struct timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
> > +    struct watchdog_timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
>
> An alternative would be to have a separate array for the timeout values.
> This would also save some space, seeing that on 64-bit arches you
> introduce 32 bits of tail padding in the struct.

Maybe it will be enough to leave it as is and only change the order of
the timeout
value and the timer. This way, we will avoid potential padding issues
and still get
the benefits of using a single struct.

>
> If we go the struct watchdog_timer route, may I at least suggest to renam=
e
> the field to just "watchdog", so things like &d->watchdog_timer[i].timer
> don't say "timer" twice?

I agree, I'll change the name of the fields to avoid duplication.

>
> > --- a/xen/include/xen/watchdog.h
> > +++ b/xen/include/xen/watchdog.h
> > @@ -8,6 +8,12 @@
> >  #define __XEN_WATCHDOG_H__
> >
> >  #include <xen/types.h>
> > +#include <xen/timer.h>
> > +
> > +struct watchdog_timer {
> > +    struct timer timer;
> > +    uint32_t timeout;
>
> This wants a brief comment mentioning the granularity.

Thanks for pointing that out, I'll add a comment.

>
> Jan

