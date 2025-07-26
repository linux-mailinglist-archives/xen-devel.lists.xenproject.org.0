Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B1B12911
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 07:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1059023.1426339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufXdl-0005PV-03; Sat, 26 Jul 2025 05:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1059023.1426339; Sat, 26 Jul 2025 05:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufXdk-0005NK-QC; Sat, 26 Jul 2025 05:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1059023;
 Sat, 26 Jul 2025 05:40:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PVjP=2H=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ufXdi-0005NC-K0
 for xen-devel@lists.xenproject.org; Sat, 26 Jul 2025 05:40:10 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d79f34-69e2-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 07:39:49 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-558facbc19cso2438294e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 22:39:49 -0700 (PDT)
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
X-Inumbo-ID: f1d79f34-69e2-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753508388; x=1754113188; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIXX8xb6mSUepnqrpr6wGcPEGuGsMuaaWudq8cd12gg=;
        b=auSmeD9H3eDPR8NbyWDO+aRFKlbRQOCPc/UNTsrYizLNzMoRdEPs4Ox8CKd+mPEvFc
         XAe5yYBizYVn/HYUF9gPsxEG4IG/6fWigbUznccIB3kAp30qJPUCK0EChyAmtQbZYe0+
         hTGHWiQ/UPoo5ius9SiaF39X1icro+abmUHhB/tLEFeANgXWU85kJfDf6SoMS7qVzM7x
         fJq5LbhnywHfBKiiEtkoIEOF8Rz1ZomrvRXvoXOHjbeVnTz7ftlWO5nfmrixVmIGqO9W
         wBT1VJXl+0t4f4vJ4BmqIpZqvRhNpxja6JdlZYIO6J73UcFrkzJY51FiA/9SEjOuRdCR
         uYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753508388; x=1754113188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIXX8xb6mSUepnqrpr6wGcPEGuGsMuaaWudq8cd12gg=;
        b=nx32W1NEunpKR6FgDahJtrEXVw6sUgsjf4nKbp87cnE5teRwY1zlAs6NP8ZJfKVaR5
         k4+KaUR33BFDL7YnSec6+FfrMO+UM/wHlpkLCnAaTLJl+X7u1bo+xWsBFzWy5JdBAfDK
         L7la4qJ7G32Fn1mHSsCicOKtDjRGsy0hO8D6w7bhTknxbZ13sjU9M7BiFI/V4tRhG2Mn
         RQ2sWPbMkoDCJYpEQDe+R8Scr8LAd4aEp4zBLYCA/MT+2eRs8pkNGyoxY/5exiqymTFP
         rvbvEZz3sHm3KDoZHoZtXiXX4xXHVxzoY2wRdEFQ8OASek0uIpTvizxIMh7SuD40SyDI
         PrJA==
X-Gm-Message-State: AOJu0Yy96xiu6KE03aCkZWvV6/HxCytJ8sWknTz73tLCAeO6j735WMZE
	vneojXq2QXkjV3YXoZEt9ipFokcTaaIceHBCKUyKPVA7VQdifFi0rbACf+Iijsv5aPQN0D/d8wC
	fN9yDFjj5UsQJL9dD4uzOBn1Z2wzMfW18EP21
X-Gm-Gg: ASbGnctmGv3Ya4EKYV7kBclvedQC2lFX8t9o3fzj5noPbu3wiFkyXC3MIcLmO9wmype
	rWlwgzIwOyfy3xz/aZGdTLb/Lw9o3SxTBquft0T0Bx4oKkq5AD/nsJZthG/FtTq+rzueStBiUlY
	zD6YaZ8oYvTy2dK5PKkYVWqyItypDeshVVD+1fuWB3Md0mQaLbO5fT0fQjimXLtY4Sz3ZkEtKBE
	jy7Ww==
X-Google-Smtp-Source: AGHT+IF/m+XS3LxTxUqWQYtASQKz3qrHjm7HxOrU8qUKWODNlSJKXlJxNBPpn3dEWqrVIJFyauxb9bZCpCFhgxIM9f4=
X-Received: by 2002:a05:6512:3b10:b0:553:2cef:2d2e with SMTP id
 2adb3069b0e04-55b5f3fc3bamr1205695e87.22.1753508388033; Fri, 25 Jul 2025
 22:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
 <aIOO4kNKM1cyn6Hf@l14>
In-Reply-To: <aIOO4kNKM1cyn6Hf@l14>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sat, 26 Jul 2025 08:39:36 +0300
X-Gm-Features: Ac12FXxK9X7nkXBG3Q6RcUf_Fb0CUBn_eJu8cnR5dSPN4XqD9ziQNQU3MTFZjIg
Message-ID: <CAGeoDV_OtWOy7FMUobtpkjS35H3L=4V+9JpGZy8f6Jb-pJk5pA@mail.gmail.com>
Subject: Re: [PATCH v2] systemd: Add hooks to stop/start xen-watchdog on suspend/resume
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 5:04=E2=80=AFPM Anthony PERARD <anthony@xenproject.=
org> wrote:
>
> On Thu, Jul 17, 2025 at 11:16:58PM +0300, Mykola Kvach wrote:
> > diff --git a/m4/systemd.m4 b/m4/systemd.m4
> > index ab12ea313d..ee684d3391 100644
> > --- a/m4/systemd.m4
> > +++ b/m4/systemd.m4
> > @@ -28,6 +28,12 @@ AC_DEFUN([AX_SYSTEMD_OPTIONS], [
> >               [set directory for systemd modules load files [PREFIX/lib=
/modules-load.d/]]),
> >               [SYSTEMD_MODULES_LOAD=3D"$withval"], [SYSTEMD_MODULES_LOA=
D=3D""])
> >       AC_SUBST(SYSTEMD_MODULES_LOAD)
> > +
> > +     AC_ARG_WITH(systemd-sleep,
> > +             AS_HELP_STRING([--with-systemd-sleep=3DDIR],
> > +             [set directory for systemd sleep script files [PREFIX/lib=
/systemd/system-sleep/]]),
> > +             [SYSTEMD_SLEEP_DIR=3D"$withval"], [SYSTEMD_SLEEP_DIR=3D""=
])
> > +     AC_SUBST(SYSTEMD_SLEEP_DIR)
> >  ])
> >
> >  AC_DEFUN([AX_ENABLE_SYSTEMD_OPTS], [
> > @@ -69,6 +75,14 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
> >       AS_IF([test "x$SYSTEMD_MODULES_LOAD" =3D x], [
> >           AC_MSG_ERROR([SYSTEMD_MODULES_LOAD is unset])
> >       ], [])
> > +
> > +     AS_IF([test "x$SYSTEMD_SLEEP_DIR" =3D x], [
> > +         SYSTEMD_SLEEP_DIR=3D"\$(prefix)/lib/systemd/system-sleep/"
>
> While reading this change, and systemd.m4, I notice a comment about
> using pkg-config, well it's a comment about using it for $SYSTEMD_DIR,
> but I believe it applies here too. It looks like we can replace this
> hard-coded path by:
>
>     PKG_CHECK_VAR([SYSTEMD_SLEEP_DIR], [systemd], [systemdsleepdir])
>
> Which will query system-sleep path from the system. (This just run
> `pkg-config --variable=3Dsystemdsleepdir systemd`, and store the result i=
n
> SYSTEMD_SLEEP_DIR) (The variable is now named "systemd_sleep_dir", but th=
e
> variable name without underscore is still available, and have been
> available for longer.)
>
> Is using PKG_CHECK_VAR would be fine with you?
>
> > +     ], [])
> > +
> > +     AS_IF([test "x$SYSTEMD_SLEEP_DIR" =3D x], [
> > +         AC_MSG_ERROR([SYSTEMD_SLEEP_DIR is unset])
> > +     ], [])
>
> After changing to use PKG_CHECK_VAR, I think this patch would be good to
> go, so: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> I can make the change on commit if that's ok.

That=E2=80=99s definitely OK, thank you for taking care of it.

>
> And I need to remember to run `./autogen.sh` to regen the configure
> scripts.
>
> Thanks,
>
> --
> Anthony PERARD

Best regards,
Mykola

