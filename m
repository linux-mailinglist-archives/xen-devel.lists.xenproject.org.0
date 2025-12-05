Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FED7CA7BB1
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179085.1502717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRViE-0001Qq-RU; Fri, 05 Dec 2025 13:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179085.1502717; Fri, 05 Dec 2025 13:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRViE-0001OC-Oc; Fri, 05 Dec 2025 13:19:06 +0000
Received: by outflank-mailman (input) for mailman id 1179085;
 Fri, 05 Dec 2025 13:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBPq=6L=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vRViD-0001O6-A6
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:19:05 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7ff6564-d1dc-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 14:19:03 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5943d20f352so2355200e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 05:19:03 -0800 (PST)
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
X-Inumbo-ID: f7ff6564-d1dc-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764940743; x=1765545543; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAyu9hSJosXxaGg/yB5sp13CcyBRDHcHeqtMwroQXfs=;
        b=W+ZrNfsTUCo3u2mGj2R9LmnpL79fyIPuLU8/RJiIhFkFYYAEuJODu00AEKkVZz8ej+
         uLL2nkKFCqJ5ocVe9uIt8A5hLNJ5b/j198tR/ZxieuzHHUmECllOmxkoHJPCH/YvigJW
         ur3z0H0deq21iY+vN0OUiSDQP6Sb6YDOPIVXgJ//SqgFfcEInIYktWc5+2Knu3CGvEX5
         S0dTwp7bCjk/qD8SrbbS9aqOVbrtbkoXmoEI0f06wFr203ieFEjXwvR/px6Jwk8jcdqN
         bhPl/bakEajEOR2A8YxNekxZ5TOutvQ+Bv4SX6uLDcuh6xiWq0/rb0q9EnQbbxmO+z25
         Dy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940743; x=1765545543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IAyu9hSJosXxaGg/yB5sp13CcyBRDHcHeqtMwroQXfs=;
        b=Cq2h20FXKCt2AnL62P7wLLMDIrLwRHv/Klt511y5hmtdRIYM3eD1ewBDkCLtkPzKHv
         H7q98cEjbmqMl7JVQ4V9ppNWXJfehxF+KZkWj4iUYmLuQA6myNPEWsL+txKy8K+PtVHO
         sRKx8/JM5gQfUmOiwPL82BUVxPL7sHAhIgUWbKJnpgC9j7j4J7gueOW9utd/lXNBjy2h
         CepeUYwCMqk7PnYBtO9w4Km1gmN0sDHnivWhCftPIm3NWqBOffYpFRzYxNGbcsIJwZE4
         865N2ohbfFEXvBfeasrHfV38jYWlxLpJbjaykzwzb/ZIf/CYPXfC0x2BJuDcHcny+i0j
         rE+w==
X-Gm-Message-State: AOJu0YzNtpTeTdh2djz3pHYKoCGl26HoXk/64rclPxV2bq8X20fbkxTN
	PztaOjotafTafQ24Io+v4AZ4ZE3PObnyKP+efsI9NKT2ohG+lPN/UWNlA+LrkSuHAB2us5FiZTG
	mwhpM824xLcII2PQiJ6kTtec6DhYK684=
X-Gm-Gg: ASbGncuhdK7dfhDEEjDVQiktssYSvO05nbDPMpjsZzeK7uUjiUAti8l04u+dlCpWbzC
	2WZGScDmebzQtYUZxEnUoGFaGDM+gxNaLo3DBMg/ksGols5MNe7lg26edrcUrtFxpy4JAjpj0Dm
	5vvl6AkBXQO6yBK8LVSpWNXQDA6sAXXSqydgfYFI5ju/vm1ovha8TDtPcpV0grf2K/06kS18jM1
	RXRO2iK4340fu9XxH6FPFbyvZCE+vwQeO5sg210/eAiV54ybsR+5N5BYLTtasgLs9kC4Q==
X-Google-Smtp-Source: AGHT+IHhVbCzmWCGGUGvzeqKfrW80FrPXU1V0+tYemR0Kd31v6/E6vX59CGPdjWnXpVw76cGfhTlUGO6gMJBDBxvWGo=
X-Received: by 2002:a05:6512:b1b:b0:594:2e9b:f28f with SMTP id
 2adb3069b0e04-597d3efe1a6mr3422636e87.7.1764940742357; Fri, 05 Dec 2025
 05:19:02 -0800 (PST)
MIME-Version: 1.0
References: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
 <62173b6a-faef-4919-89ec-5075e4ed3fb9@citrix.com>
In-Reply-To: <62173b6a-faef-4919-89ec-5075e4ed3fb9@citrix.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 5 Dec 2025 15:18:51 +0200
X-Gm-Features: AWmQ_bnv8tXKGPsd7ZTG3GRCInO4wYyruEwR-WkuNfezwfoxUpay8ZsUBawtVs8
Message-ID: <CAGeoDV-tJOjReWqQhKPj-KfDfjzW6jq_LKcwG1XQ5VSuAFe9Ng@mail.gmail.com>
Subject: Re: [REGRESSION] Re: [PATCH v2] systemd: Add hooks to stop/start
 xen-watchdog on suspend/resume
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 1:48=E2=80=AFAM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 17/07/2025 9:16 pm, Mykola Kvach wrote:
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
> > +     ], [])
> > +
> > +     AS_IF([test "x$SYSTEMD_SLEEP_DIR" =3D x], [
> > +         AC_MSG_ERROR([SYSTEMD_SLEEP_DIR is unset])
> > +     ], [])
> >  ])
>
> Marek reports that this breaks the build.
>
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
>
> Specifically, for a build using --enable-systemd (to get the
> initscripts) but without systemd-dev(el) installed.
>
> A while back we went to a lot of effort to stop depending on
> systemd-dev(el).  For the sake of one path, we don't want to bring that
> dependency back.
>
> Can we see about breaking this dependency again please?

Patch with the fix:

https://patchew.org/Xen/f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296=
.git.mykola._5Fkvach@epam.com/

>
> ~Andrew

