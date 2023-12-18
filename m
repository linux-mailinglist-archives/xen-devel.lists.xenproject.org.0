Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A86A816D2A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655912.1023821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCGv-0006lP-GN; Mon, 18 Dec 2023 11:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655912.1023821; Mon, 18 Dec 2023 11:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCGv-0006jk-DG; Mon, 18 Dec 2023 11:58:57 +0000
Received: by outflank-mailman (input) for mailman id 655912;
 Mon, 18 Dec 2023 11:58:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U9fe=H5=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rFCGt-0006jZ-Kz
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:58:55 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d09113a7-9d9c-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 12:58:53 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-553338313a0so1242279a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:58:53 -0800 (PST)
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
X-Inumbo-ID: d09113a7-9d9c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702900733; x=1703505533; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RqjCOkcWk9lFw7XmwLS/EZADd87c7o4tyio1n/qNYRg=;
        b=YHUKr2G5U9HoZddGQ/tBeDx2pZING9daIvKoqDcarMP9HaFDpaAUy9QJ+DG4BrwrbH
         o62dKrw9xzh1hMLo9dPUmugzqhZrPV7hz0qkOM0VQVae2V2xt1TZLd9pg1wGQNLyaDwX
         Hwr+uQtVhdyD3780hiNSDQkHu7z3fmW4oRolc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702900733; x=1703505533;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RqjCOkcWk9lFw7XmwLS/EZADd87c7o4tyio1n/qNYRg=;
        b=WmRKzr0EoM1fDsaDYSEOhJ2DMmPtur7SeWpLsjPZHG7VVSA22USU/4nmQqOo35oxP2
         kIqT7CsPSS6vgwI/lPW86bpiyIcS19vtyrnsjHXzC3B5htZOp1n7qsEJfOAyej4CClcs
         iJxb/ivFESL2sCr1VxVAnO9Z3hBRsd8FS/lHcLfhB/5Y3kqkwId/dVftIgrdQbe+4yX1
         LC97Fyf7fLEHpwwdJHgjDRVGgxIbsoc6HPYltZMzHH7AvvjicXhCjs0liuY2beWuHqlV
         glN/oSG3Ju1OyiGkqlsSJLdqhzcKUgcrQRVIs4Y0YGDMOgwlkoDuG7EN+qi6FcocYryr
         CvjQ==
X-Gm-Message-State: AOJu0YxuCs0QFbxeeAV+t9+yXPGtUDWqZH9WM88XsQfIz8UeHd6hEqyq
	T95UBEE/VlklexPGjySp/dJvYkvs5bEPuAsveGCxu7874CTlxfLruSjumA==
X-Google-Smtp-Source: AGHT+IEVolVt9qkbvnMiizuoi5uWNCXUVM3ntt6N639M2TUrQIbtc1YtxtVxTSlCn073nZ9TdFgbu+4SBBQjjEFZNH0=
X-Received: by 2002:a05:6402:2051:b0:54c:5f17:1163 with SMTP id
 bc17-20020a056402205100b0054c5f171163mr8246854edb.58.1702900732700; Mon, 18
 Dec 2023 03:58:52 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 18 Dec 2023 11:58:16 +0000
Message-ID: <CAO-mL=ziVf=9E345gaRJMUMN1BortznAwzOOJRw-8LMwFRweiQ@mail.gmail.com>
Subject: Community Manager Update
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Cc: committers@xenproject.org
Content-Type: multipart/alternative; boundary="00000000000042c320060cc779d3"

--00000000000042c320060cc779d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Merry Christmas!

Just a quick update from myself.

Whilst I can=E2=80=99t speak for everyone in the community, I know we have =
valuable
members who are committed to making the Xen Project successful. We are a
strong and passionate community made up of individuals who consistently
seek improvement in ways of working to ensure our open source project is
welcoming and friendly. Our project is not only advancing the industry in
many ways, but there are policies and governance practices that the
community has helped shape to make it a better environment for all.

As such, I strongly condemn activities or communications that diminish our
efforts on how great the community is. We may not be perfect, but
collectively we are all working towards a common goal on how to be better.

This is a reminder to everyone to keep up the great work you are already
doing, and for other individuals to refrain from making comments that could
be seen as harmful to the community. Our communications can easily be
misperceived and interpreted by others negatively, so if your messaging is
not beneficial, please do not send these.

Our next steps will be to look at creating a community working or technical
group of some sort, to help address concerns and drive direction within the
community. Given this will be something that affects everyone, I=E2=80=99d =
like to
ask for your patience as we scope out the specifics before asking for your
feedback. I want to make sure we do this properly to ensure the process is
something that benefits the community in the long run. As soon as I have
the details, I will be sharing them with you all.

I wish you all a great holiday and a Happy New Year!

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000042c320060cc779d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>Merry=C2=A0Christmas!</div><div=
><br></div><div>Just a quick update from myself.</div><div><br></div>Whilst=
 I can=E2=80=99t speak for everyone in the community, I know we have valuab=
le members who are committed to making the Xen Project successful. We are a=
 strong and passionate community made up of individuals who consistently se=
ek improvement in ways of working to ensure our open source project is welc=
oming and friendly. Our project is not only advancing the industry in many =
ways, but there are policies and governance practices that the community ha=
s helped shape to make it a better environment for all. <br><br>As such, I =
strongly condemn activities or communications that diminish our efforts on =
how great the community is. We may not be perfect, but collectively we are =
all working towards a common goal on how to be better. <br><br>This is a re=
minder to everyone to keep up the great work you are already doing, and for=
 other individuals to refrain from making comments that could be seen as ha=
rmful to the community. Our communications can easily be misperceived and i=
nterpreted by others negatively, so if your messaging is not beneficial, pl=
ease do not send these. <br><br>Our next steps will be to look at creating =
a community working or technical group of some sort, to help address concer=
ns and drive direction within the community. Given this will be something t=
hat affects everyone, I=E2=80=99d like to ask for your patience as we scope=
 out the specifics before asking for your feedback. I want to make sure we =
do this properly to ensure the process is something=C2=A0that benefits the =
community in the long run. As soon as I have the details, I will be sharing=
 them with you all.=C2=A0<div><br></div><div>I wish you all a great holiday=
 and a Happy New Year!=C2=A0<br><div>=C2=A0 <br><div>Many thanks,<br></div>=
<div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature"><div dir=3D"ltr"><div>Kelly Choi</div><div><br></div><div><div styl=
e=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb=
(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></div></d=
iv></div>

--00000000000042c320060cc779d3--

