Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864CCA82EE
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 16:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179212.1502806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXic-0005Re-Gz; Fri, 05 Dec 2025 15:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179212.1502806; Fri, 05 Dec 2025 15:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXic-0005QX-DD; Fri, 05 Dec 2025 15:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1179212;
 Fri, 05 Dec 2025 15:27:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBPq=6L=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vRXia-0005QR-Sm
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 15:27:36 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec531519-d1ee-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 16:27:34 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5942bac322dso2327584e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 07:27:34 -0800 (PST)
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
X-Inumbo-ID: ec531519-d1ee-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764948454; x=1765553254; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg9Q8IvwftI+PWZC2jqqD2Ko0yXbyXiADG9swW+S17U=;
        b=Ds1T3BYwTxxAxb+1K6VXnQYMjIFUR70zefW9DwSIGWevdu7grcORqEZsbFdiS5h968
         jLozb/iJVjq68HOtH3bBlQ37ao/PXT7fFzAzgVHObucAYYF380bSniye7y/GnUBSnESs
         n4g46I2EEI+x3gHQ8PZ+eQgEo26BczmKFCrZVvwWzm25tf70hL3FloCl2ev5UGbljkrv
         zbuBSPAUsTGjq3uJESUwuRrUwLtN+rSQxFqnNlx041vRzYSbTg0/8VA8G6qw3oj9AZTB
         4VTjXbDqpfw/4yNeN4j0YxG4El5UwiB0MRVuGDpeRTwt9XIIYKUyoYousVPeZ33Yvl0H
         eHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764948454; x=1765553254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zg9Q8IvwftI+PWZC2jqqD2Ko0yXbyXiADG9swW+S17U=;
        b=dq/CybXqW+nL9VohXU+NraeipX89RenzWxPlLZAbd6c/r8+DqxwHW0Ck5by/AJSXbN
         g1wWOynP3qCh3nxMOAJjerk4mYWtJDHqFKBGphpiKh3eb424nJFnT2UslWXlLRNTdNuH
         PQ1qWlmz8f1QzTS6dcSsfVtIG4Ex0QWVuelrrwVYtnvQd2kx5OvC9ws7Uvn/9976gAPr
         xv6egIgeO5449I628reLn0SLpXm70hCw1RTHbqcZfR2jOPL/jSOV/jf9iXILnm3qeMVJ
         n7U2vrquLNclAn7DtKc5tG1qD+f4Mqwp58RHesigbm2YpK+pcLpnrwOHUzs3WeywN8F8
         Gxdg==
X-Gm-Message-State: AOJu0YzCNn04cS8fHIlNyyIAYYiOzC0rTRxj1cWenp8jqKZ8ini8Yl0g
	yM5yt2BMa7CMjgkjtTsQZODa2Zst9J1uCxu5EUPFPWO0i57y7fIRo+drtkTBdP2yGA535ZD2rdd
	xYPEWUbowl26dDpdSmxoC/vzCeUZwEQfS/sxsiBM=
X-Gm-Gg: ASbGncupTScN2UKb4ojBsiPfuiD3y/4B6RXqL5WeJwpVnNPKY6p4ZlIy0gwHmsjDnNt
	8THFilFm3x+Ud58ezv4R4SRM+at+goBESR425vSaVTLEoJpcFkPJxJdeIIjuuta1Amo7xk/dkXE
	F1ewaQ6iaXFHDUJaNazxi68owPe3gQXf+7Okvmf7MnGQKJ8pSLIhoyjczNSGKVTzgMB77igANNm
	CuyXG7EEiUI43NShlqX15e1jWgKb6lwoa7jAg7yt++MH36ZohV2p3P5cNwZZ7e2/1dBCQ==
X-Google-Smtp-Source: AGHT+IHkIECWn+H0grUO1vOoGeUpaD5oKYBrl6iQZyWMR1d6EgFq7FIFlz7GFCsYsYOurFAgt6tzvh1UGHLZot22zR0=
X-Received: by 2002:a05:6512:3d94:b0:594:5545:b743 with SMTP id
 2adb3069b0e04-597d3fa063dmr3962355e87.27.1764948453801; Fri, 05 Dec 2025
 07:27:33 -0800 (PST)
MIME-Version: 1.0
References: <f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296.git.mykola_kvach@epam.com>
 <71a560d9-c96a-4cf1-a616-c4366c1bb9c2@citrix.com>
In-Reply-To: <71a560d9-c96a-4cf1-a616-c4366c1bb9c2@citrix.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 5 Dec 2025 17:27:18 +0200
X-Gm-Features: AWmQ_bka10MqrXcSY_UQ1m0u4zx6vUYs9_uBGaH_3P5aIRRWc-t_CWrGd78MNMg
Message-ID: <CAGeoDV9-rYn2eNXygGsDNeRgFvt4oV42ygzC2bCgc6OAk6mq-A@mail.gmail.com>
Subject: Re: [PATCH] systemd: default system-sleep dir without pkg-config
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Dec 5, 2025 at 5:05=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 05/12/2025 1:13 pm, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Using PKG_CHECK_VAR() to obtain SYSTEMD_SLEEP_DIR reintroduced a build-=
time
> > dependency on systemd-devel. This breaks --enable-systemd builds that o=
nly
> > need the initscripts.
> >
> > Use the same defaulting scheme as other systemd paths: if SYSTEMD_SLEEP=
_DIR
> > isn't provided, set it to "$(prefix)/lib/systemd/system-sleep/".
> >
> > Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on =
suspend/resume")
> > Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Build in which the regression was detected:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
> > ---
> >  m4/systemd.m4 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/m4/systemd.m4 b/m4/systemd.m4
> > index c47a25ef93..ee684d3391 100644
> > --- a/m4/systemd.m4
> > +++ b/m4/systemd.m4
> > @@ -77,7 +77,7 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
> >       ], [])
> >
> >       AS_IF([test "x$SYSTEMD_SLEEP_DIR" =3D x], [
> > -         PKG_CHECK_VAR([SYSTEMD_SLEEP_DIR], [systemd], [systemdsleepdi=
r])
> > +         SYSTEMD_SLEEP_DIR=3D"\$(prefix)/lib/systemd/system-sleep/"
> >       ], [])
> >
> >       AS_IF([test "x$SYSTEMD_SLEEP_DIR" =3D x], [
>
> Actually on second thoughts...  The build failure was hitting this
> second check, not the PKG_CHECK_VAR() itself.
>
> If systemd-devel is installed, we should use what it provides.  So,
> can't we just do this:
>
> diff --git a/m4/systemd.m4 b/m4/systemd.m4
> index c47a25ef9393..5fb5a7089ee3 100644
> --- a/m4/systemd.m4
> +++ b/m4/systemd.m4
> @@ -81,7 +81,7 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
>         ], [])
>
>         AS_IF([test "x$SYSTEMD_SLEEP_DIR" =3D x], [
> -           AC_MSG_ERROR([SYSTEMD_SLEEP_DIR is unset])
> +           SYSTEMD_SLEEP_DIR=3D"\$(prefix)/lib/systemd/system-sleep/"
>         ], [])
>  ])
>
>
> ?

Agreed. Using the systemd-provided value when available and falling
back to the default otherwise makes sense. I=E2=80=99ve sent v2 of this ser=
ies
with your proposed change.

>
> ~Andrew


Best regards,
Mykola

