Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2063CA7987
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 13:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178945.1502607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRV7t-0008MG-Td; Fri, 05 Dec 2025 12:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178945.1502607; Fri, 05 Dec 2025 12:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRV7t-0008KL-Qn; Fri, 05 Dec 2025 12:41:33 +0000
Received: by outflank-mailman (input) for mailman id 1178945;
 Fri, 05 Dec 2025 12:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBPq=6L=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vRV7s-0008B4-6j
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 12:41:32 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b73ff35d-d1d7-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 13:41:27 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-37e6dd536b0so17801541fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 04:41:27 -0800 (PST)
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
X-Inumbo-ID: b73ff35d-d1d7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764938487; x=1765543287; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg3mUdjubCD9KqI/PnMq8qlB/qnh2Kq0Xx8tYirFTQc=;
        b=O8/Ny6BpjlKU5MprIv12P7PDEfkftp8V9xA9cYjz9040NlekidkpPWL9ZsPksoWBJN
         Mibe4igrpihSFH6ND0BltmgDT1RgNBzeDZXur/dzD86SdT8tv7fB1DC/X668BHbQynyP
         ZrHdwRsqJKVgPRmoHLOeCjM+6vzDpOzklsoxA4yQFXaelxKj5G7a+BFPZQvXryvAD/eZ
         T8y22Y9VgXg/gptDMFEqXaMOyWsuZQ6P+Pn9FUbNhqGSw/Rnqh74D9/6/wv33QX9/Y2k
         aHZnOCD7TS1wqyZCmkCdQv5uEIQnDbttnFv26F4VP3+1T0KAP2NVOYkQmLcGrdg0rS/z
         5O0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764938487; x=1765543287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eg3mUdjubCD9KqI/PnMq8qlB/qnh2Kq0Xx8tYirFTQc=;
        b=qGo9PVcKxsqZG/5iPIP6qLZXNERa72eZs9hMt0c8W3YLFJfTMgzOWR+Go79V8M2OTY
         4woNvKy8SSfkgiAnLjThUG/KtB+gUS/lR+HksoazuxyJSyfdwCms3uodFwNDCPqSNJT5
         ZlP4gZoYvwLys8LZLhtAoKViquGfAdnLVa6irsA1UVz5b0G2PcjJMqZ9zhXaFN10tDlI
         3UKmPz8OvrwkVAVBtPgXvC6pJd1jZwDcnjkn9N1mmqI0y9WjVA9JO/PaKzQ6nipJ33zk
         vZo4IVRF7CXEktEvvnOxY+xA1ave9nrquzz3VNsNtild4dp9OULLHdy2YrUBorWpeKky
         F6nw==
X-Gm-Message-State: AOJu0Yzp3iv8xteuHQUW/wmyroUA09Ewy6A0BObJB+V4IxCvIt5367IQ
	VPisC4h6vIsFODUpVcOlJoui7QTKuzM+Anq8lNTcxPHdNleaBx0Pyqx1XbO+8oiQ3f8rpD3R35D
	EqQPegr7YrO051lLc3mfBzUwTxN9ST/k=
X-Gm-Gg: ASbGncsPN0QU5/yDfqN0Ek8LRSXAmM1fyiuq3kmJv1bgfFAzxOmIEYtFz1Kh15rIrLX
	Nm0kOijs2NtKwX8dvmvT5cqZfPXGuG1rayI0vt4YHcs+PLmLAH0TSIdoJUrgIi2fCXDt1u+gEwQ
	CHorKGaN4LL69pP1OybcSNIf+C4GWQvgH3zGH5blfpPcG8m/hd2wNnpNpj9MYVRIMv3wkDeb6jc
	i85kDcTfDy8BgohJOf2U3lh0Ohw28t5Q5ecwWP1yASEThj08+3YlLFEB2YHPnSM9gBemc9TBkLP
	Jj0J
X-Google-Smtp-Source: AGHT+IHUAObCWiDmke//O6BC1ClLln7Ip/v+v4AjSOGnwPRSDJSLyEfKlH+GPWBOp+vnZgC6VZI5tvBQEh2kP/PaB+k=
X-Received: by 2002:a05:651c:409b:b0:37b:8f05:13bf with SMTP id
 38308e7fff4ca-37e639572ffmr20248741fa.43.1764938486268; Fri, 05 Dec 2025
 04:41:26 -0800 (PST)
MIME-Version: 1.0
References: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
 <62173b6a-faef-4919-89ec-5075e4ed3fb9@citrix.com>
In-Reply-To: <62173b6a-faef-4919-89ec-5075e4ed3fb9@citrix.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 5 Dec 2025 14:41:15 +0200
X-Gm-Features: AWmQ_bk-bQi3SItKspwLQEyx3kMbe9qFuKsJVmYXqFJIdK4z2snT6b8TcMp3WPU
Message-ID: <CAGeoDV-PLdhK2JX-c7kVX-Z=OE_uA3HgxDmxOOxbcGpnyRr4KA@mail.gmail.com>
Subject: Re: [REGRESSION] Re: [PATCH v2] systemd: Add hooks to stop/start
 xen-watchdog on suspend/resume
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

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

Thanks for the report.

The regression came from switching to PKG_CHECK_VAR. We should revert to
the original fallback so we don=E2=80=99t depend on systemd-devel:

    AS_IF([test "x$SYSTEMD_SLEEP_DIR" =3D x], [
        SYSTEMD_SLEEP_DIR=3D"\$(prefix)/lib/systemd/system-sleep/"
    ], [])

I=E2=80=99ll send a patch today to restore this.

>
> ~Andrew

Best regards,
Mykola

