Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2DECA807C
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 15:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179144.1502756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXCt-0007RV-3I; Fri, 05 Dec 2025 14:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179144.1502756; Fri, 05 Dec 2025 14:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXCt-0007Ot-0h; Fri, 05 Dec 2025 14:54:51 +0000
Received: by outflank-mailman (input) for mailman id 1179144;
 Fri, 05 Dec 2025 14:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBPq=6L=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vRXCr-0007On-BR
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 14:54:49 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 577248cb-d1ea-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 15:54:47 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-37cef3ccb82so16592901fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 06:54:46 -0800 (PST)
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
X-Inumbo-ID: 577248cb-d1ea-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764946486; x=1765551286; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oj4yj7tzriBUrwcVuJwE3ZbW75nE9yFe4/d5bikw/ZA=;
        b=TW/VL3MvBopPsj4s8U/3y+Cz4miFs5PMqTfY/u2XdfMt5hMP1IDuA/54YwwMYh2ZXw
         P3ZblYh/DzEOwpaIEF8jiM5kYc+/zDN2/5rAB2EDYH575H2BPeWrBcIAma8qX+03nAI3
         8pTMcI5cXBJ7a8Ssz+O1u6EvfxAwXnNvB59RvuycGg1wiTDfF/6ihoo0EKIs4biLTRt2
         C594zS3QXOa+cVmkC3+2mHmGPsdhWptkeo63NVzBP6a8tXV6LRdLZlbNErVvCDAIb7Dy
         Bp1Bnta5xYr/elEpctCJHCgdm+7zO4wMlLu6IL/qVR1G/5N4U25AtfplhHZrBHM9BycK
         em3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764946486; x=1765551286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oj4yj7tzriBUrwcVuJwE3ZbW75nE9yFe4/d5bikw/ZA=;
        b=ruOp5bFAPOXhJmGzuRCYJ5m5MehdVwYe0TH2D6JHeoVjRkvBdkU8Pw6N5gUms5uSFB
         TKRtUzsxWb6USX2kRoGqksjaYT82oYb7v64s5+6wpuqIiEPhPIxww8RxmEtNKycpdAs/
         06OELBJBhbrCiHmfekI4ZgQ9KU98aLhSzMqlS+k9iDDCKhaAbh8H44A42ciXz/X5Px9M
         CmTcELn863kp/KYeIPkSyR2lkgTlgBwC84MbCfdLKq2QVZqryEj+55yR+vy9qjw/xKDO
         xen+sr5cMyqXhsQJTBufLi7Rl8HUdrO20hsxEyFPTXa+OulP+PXi73ykbg17B8Vn3jgP
         0bdA==
X-Gm-Message-State: AOJu0YwnuQ8eUOKLHmCHaQ7vEQcAssYXnoS5PurrVIxkegmzrMFg0gh0
	ED7Zq96r8qWwhbFZnDd0HGrIAB6Ajf/EOfvC3wVCtPwkNwT6P1rFaNWH/jS8AJFKfoTBH7tsHPy
	sfaDPASLxPVZM6OCDF5aoss9EQdltThSfPAsqmas=
X-Gm-Gg: ASbGncveU76oAi7fsHCMmObn7GeidbdZRQjMybfdI8kVvshGXwMWge4E18TPGd80YZd
	N581ATyLQ8EXzY6haTWCHvYvT5mtU9oIxehhfFY6DwyozzrMAxTHdN9k7RX6496oNr0i2iZbJZh
	HYpErAe5FhrrIJeFdCSskRG/q99m5jVYTrGzgeIYlHevzo1TaTYYIdqtXlYZoam7SN8N0KTyQn6
	Ao+wasDFwYGJvOt1y+CzzCYkjtJjosWfuMmwnS/c1LBKBdbV6zPsDdaMJCGzAODTOQmuA==
X-Google-Smtp-Source: AGHT+IGYpWu2YnCUjq9mZPvUGM3BJqta79D4A+EtxPKC2EtnHsX5amvlYYueo5FT28n7eLro74HLf/fRwznd/TCH29k=
X-Received: by 2002:a05:651c:31cc:b0:37a:2bcc:279e with SMTP id
 38308e7fff4ca-37e6390d9e0mr33909161fa.23.1764946485997; Fri, 05 Dec 2025
 06:54:45 -0800 (PST)
MIME-Version: 1.0
References: <f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296.git.mykola_kvach@epam.com>
 <aTLkwMpxchYSMnyT@mail-itl>
In-Reply-To: <aTLkwMpxchYSMnyT@mail-itl>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 5 Dec 2025 16:54:34 +0200
X-Gm-Features: AWmQ_bkHSzdiMUlqQlwEnJS7sM9Q03vRQqLU45e1Tofy0b3srgREUhqzN99iwjI
Message-ID: <CAGeoDV8FnNxoqr18W82DhE=fLWJSQr68xr_vPew_z=hyt2BbeA@mail.gmail.com>
Subject: Re: [PATCH] systemd: default system-sleep dir without pkg-config
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 5, 2025 at 3:57=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Dec 05, 2025 at 03:13:32PM +0200, Mykola Kvach wrote:
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
>
> Requires re-running autoconf, otherwise still fails:

Thanks for the note. I had assumed the Autoconf-generated files were refres=
hed
during release or at merge time, since this updates generated artifacts. If=
 the
expectation is that contributors regenerate and include them with the patch=
,
I will add the updated Autoconf outputs in the next revision of this series=
.

>
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/12336879267
>
> With autoconf:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2198372475
>
> It's better now, so:
> Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>

Thanks, for the review and for testing both with and without Autoconf
regeneration.

>
> But unconditional --enable-systemd uncovered other issues (not related
> to the configure change).
>
>
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
> > --
> > 2.43.0
> >
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab

Best regards,
Mykola

