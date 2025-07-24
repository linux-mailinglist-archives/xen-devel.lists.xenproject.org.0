Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10E1B10FE4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056407.1424628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uez7K-0005zf-O7; Thu, 24 Jul 2025 16:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056407.1424628; Thu, 24 Jul 2025 16:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uez7K-0005x5-Kb; Thu, 24 Jul 2025 16:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1056407;
 Thu, 24 Jul 2025 16:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t79f=2F=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uez7I-0005wz-NO
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 16:48:24 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00db2517-68ae-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 18:48:19 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54b10594812so1282375e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 09:48:19 -0700 (PDT)
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
X-Inumbo-ID: 00db2517-68ae-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753375699; x=1753980499; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/4lF6seTt2WQcKnw795f3ulTBM+nKrz09UHn/OIDEY=;
        b=dsMnM3Sa9gCNz5mgso9kUtOOIq3PYZp5mRcbcIf52zoj+El7HABgmfmWAS+5qstcck
         6pf8AHdIS0h4nW9LufHoUvy45yrULb0ZOEeUwqIRWL83KIYksRQqxRxzQdDJs2ubwgAs
         5MtumGBHEkHvdCLnmC2koS6xuvffjiAQF0uJ5rC6tyX+cjzphumFoJqptw+WVSI5l2Rh
         MxFHGCBtebTatexKN9l36qz+PIMJ8bgTnkdXfYj92/By3zjBlgKX/DBtk68j9i1rKfaB
         2I4DNMXLg1f3gTOFL1Uga2CI0QcvDkGUVjJhNPi86RK+Mc8Zlvih1wPk/1TI/2Y2NxKZ
         NuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753375699; x=1753980499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/4lF6seTt2WQcKnw795f3ulTBM+nKrz09UHn/OIDEY=;
        b=cyMjZIMiGwkVA6bvv3ECJMBC7WfOiynuwPuY8BbdSWNRL8xDorgwk8XpYEreL1FKeV
         yksSfFSqhvFSob6A0t1LjQlphdYlL77fvg2hDUm17c+xkHHXUB4bLGJY9x/JkgAK5zmm
         YdmjmFRkGT7rqU1wygri4oY1X/zljahlZ0IVyOcWfjSlBeQtbabcfT8YsgYH99buYzcJ
         XfryNks9fSTZEGSjv/EJ3jWUyU2i+sroInP/Qu6eqWbMVMenw/mWwNhWjJgAB7Fv0LXM
         JFRvVNJer3h3jweEbcCAba6fWb7FeOx4V8XXQzUMjHj3LwlKQMSpuqsR8SSuHvlTxl7b
         glKA==
X-Forwarded-Encrypted: i=1; AJvYcCU8EkbymcdC8BaUtNugIqxVVMbGH1KQbbJs4DCwDg4tax+XOmOdKju8otugU6GLHsuuLtWZGd8iMMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeVHo4MDI565M1d1yYITVwkEJdZGahsuJpTAjytfMa/aWeg9Eo
	PY49Psb2vcq+n+ZGQwpiNiSJPO7dO0heCWI8J8xis8wCP8LCkDJNXr+Vz2t8zrIrXDk0v+OCF6v
	SvUx60YD4rvd3jH5OXNg1fVEX6ywdi9k=
X-Gm-Gg: ASbGncslBB76CWEWXJaW6nPWR4NMS7zXR26Oa1SKqe0NI04aLhoSqk8nCPt5OpbXF2u
	0FZXYXpOBZEF/ZaBpp9TACFVb55ChfhcCGeAG6gZrs9x+k5BV+p0Ri2lP1im99lCqFHJIQIxseN
	OyN+ncpOLlBONvO6VnE4ofeCSyuZyG5hmMod/q7FNWj0Y6g+m4kg1fmdeo/MoALCJqQXS44Kxxk
	CCk+w==
X-Google-Smtp-Source: AGHT+IH0SSqKtxKWAc1F4OPpLOXQFrpKjGAfzjuuXaDGsPUBwKl+X6pBg3lNyhi3Flb8OJpDHM57SPH6tKjqF1NFoF8=
X-Received: by 2002:a05:6512:1307:b0:553:3407:eee0 with SMTP id
 2adb3069b0e04-55a5133b678mr2626479e87.4.1753375698772; Thu, 24 Jul 2025
 09:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
 <2b345a72-5ab7-443f-bff4-2b4ee9952825@suse.com> <CAGeoDV98LJup77GQ4YrbeqSBeoojaNe+46NX37dHoiFDDHUGtw@mail.gmail.com>
 <ea37a8cb-7d65-4c74-8c28-39579b5121cb@suse.com> <CAGeoDV9zYwGg0pSrMZVK8AdGpX1m8kjExc2twx93yR+SbnrkcA@mail.gmail.com>
 <CAGeoDV9+Tdk9S63hegQt=CpLD9Ka16qqGs9fApbG9-Q=jBW8PQ@mail.gmail.com> <fcae8366-8f32-4fd1-a2be-e6505a6e9420@suse.com>
In-Reply-To: <fcae8366-8f32-4fd1-a2be-e6505a6e9420@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 24 Jul 2025 19:48:07 +0300
X-Gm-Features: Ac12FXxT5EyJm36ocoCNXWzcOy1WGZG7qTmRqCY8Mevg68T_XK0NswqiKd4CqrU
Message-ID: <CAGeoDV8HKjKCEa-VC7xczkXWfoRJD5mEjBphnDJ9AGJOkCrEzQ@mail.gmail.com>
Subject: Re: [PATCH v4] xen/char: implement suspend/resume calls for SCIF driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 3:13=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.07.2025 13:41, Mykola Kvach wrote:
> > Hi all,
> >
> > On Tue, Jun 24, 2025 at 12:32=E2=80=AFPM Mykola Kvach <xakep.amatop@gma=
il.com> wrote:
> >>
> >> On Tue, Jun 24, 2025 at 11:32=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>
> >>> On 24.06.2025 10:29, Mykola Kvach wrote:
> >>>> On Tue, Jun 24, 2025 at 10:53=E2=80=AFAM Jan Beulich <jbeulich@suse.=
com> wrote:
> >>>>> On 24.06.2025 09:18, Mykola Kvach wrote:
> >>>>>> @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_=
uart_driver =3D {
> >>>>>>      .start_tx     =3D scif_uart_start_tx,
> >>>>>>      .stop_tx      =3D scif_uart_stop_tx,
> >>>>>>      .vuart_info   =3D scif_vuart_info,
> >>>>>> +#ifdef CONFIG_SYSTEM_SUSPEND
> >>>>>> +    .suspend      =3D scif_uart_suspend,
> >>>>>> +    .resume       =3D scif_uart_resume,
> >>>>>> +#endif
> >>>>>>  };
> >>>>>
> >>>>> As this being put inside #ifdef was to be expected, imo a prereq ch=
ange is to
> >>>>> also make the struct fields conditional in xen/console.h. I think I=
 did even
> >>>>> comment to this effect back at the time.
> >>>>
> >>>> Would you prefer that I include this change in the current patch
> >>>> series, or is it acceptable to address it in a separate patch?
> >>>
> >>> Either way is fine with me. I expect the header fine change to be abl=
e to go
> >>> in right away (once submitted), whereas the patch here may take some =
time for
> >>> people to review.
> >>
> >> Got it, I'll submit a separate patch to make the struct fields and
> >> related code wrapped within SYSTEM_SUSPEND.
> >
> > Jan=E2=80=99s proposal to conditionally include the 'suspend' and 'resu=
me' fields
> > in 'struct uart_driver' under CONFIG_SYSTEM_SUSPEND has already been
> > merged -- thanks!
> >
> > Could you please take another look at this patch when time permits?
>
> That's an Arm driver, so I don't expect the request was meant to go to me
> (as To: having just me was suggesting)?

You're right -- this is an Arm driver, and I didn=E2=80=99t mean to direct
the request solely to you. Others in CC are also involved.

I thought the review of this patch had stalled following your
previous comment, so I just wanted to notify everyone involved
that the related changes have already been merged. With that out
of the way, I hope this remaining patch can now be reviewed and,
if acceptable, merged as well.

I=E2=80=99m not entirely familiar with the proper process for these cases,
so apologies if this ping was inappropriate or caused any
disruption.

>
> Jan

Best regards,
Mykola

