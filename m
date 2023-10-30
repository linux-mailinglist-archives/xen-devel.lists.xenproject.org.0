Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7C7DBF6D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 18:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625342.974563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxWTz-00078m-OJ; Mon, 30 Oct 2023 17:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625342.974563; Mon, 30 Oct 2023 17:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxWTz-00076A-Kl; Mon, 30 Oct 2023 17:55:23 +0000
Received: by outflank-mailman (input) for mailman id 625342;
 Mon, 30 Oct 2023 17:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUpU=GM=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1qxWTy-000760-N1
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 17:55:22 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da5f8ae-774d-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 18:55:20 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9d2e6c8b542so258594166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 10:55:20 -0700 (PDT)
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
X-Inumbo-ID: 7da5f8ae-774d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698688519; x=1699293319; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MiY2qQWBuimm6imDvYmYikkg4CJ9NS3y2EviYwtmsTI=;
        b=Bfl/0JzpjD3/7oly+46eo70s8UONR3dfruMn7Hj0R+TTxG+hD4mGI3g3qpsC9lmeJ2
         2Vvtepjhw55z9DD9Q04/rA+YWbEIf0fiQgPqDKVWc6KQCuZ7uKYKbheTvAESpyOWZomC
         wQBgMqbbfE9qlwRlBcuED1vbW27hIcXp7BP2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698688519; x=1699293319;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MiY2qQWBuimm6imDvYmYikkg4CJ9NS3y2EviYwtmsTI=;
        b=nSoMtSwK9CSLLG6joBfYC6niamcr0SrZKLDDTEDXYzsbPjG9n8qA3nfBvFvZpyzdQr
         F1o8J8yi6BlnIAqeYll19w2V8Ci4wla9YWknoUdAm2PDV3hDGpRMkzg64W3wxZKwzrG4
         EMQH+ZinVNyuxtCEJ5z/xwqqSO9uzH2aezZn4l5mIDoMm2woGNVE4u8Ip1PAxfm3/w/e
         FQUkjs8a+WzMBUYv+5Lgf8SfFJcPIRwe2j8Cu2fE/qOkfMW2DLaAWaOEFMtwk2Y3maCX
         ajrFV70L7FKusPbapWH+pCB+wLBgDu+3zDjAa9/7+Yr1INoS9Gs03MR7+nkdS1nNYInl
         sW+g==
X-Gm-Message-State: AOJu0YwNwz/Xhq1IZLzhEz6PGNItnUmuAMAUBEhlGEiLQKUrGbvpF4R7
	cT5CpXEFDscYwP62plQMlP1+lsTtQwNBXy6zgxiWLQ==
X-Google-Smtp-Source: AGHT+IHNPsIf9nxsGhkCGuwD1pAPLkKB9Plx78p9A5AFUAbB4qnytQY3U6IJANdJ2Xq+Kt79KkQ0eBE+wXeMkEXg0qw=
X-Received: by 2002:a17:907:7654:b0:9d2:414c:b92 with SMTP id
 kj20-20020a170907765400b009d2414c0b92mr4308549ejc.68.1698688519182; Mon, 30
 Oct 2023 10:55:19 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 30 Oct 2023 10:54:43 -0700
Message-ID: <CAO-mL=xE=-8RjeAOKumLfcSf=wu0OWLK0X1Lz2JMCefBXbnTfA@mail.gmail.com>
Subject: Cambridge University Talk - 9th November 2023
To: xen-announce@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c5320b0608f2bde2"

--000000000000c5320b0608f2bde2
Content-Type: text/plain; charset="UTF-8"

Hello Xen Community!

I'm excited to share that we will be presenting a talk at Cambridge
University!
This is free and open to everyone, including students and the public.

Make sure to add this to your calendars and come along.

*Date: Thursday 9th November 2023*
*Time: 3 - 4pm *

*Location: *


*Computer LaboratoryWilliam Gates Building15 JJ Thomson Avenue*

*Cambridge CB3 0FDhttps://www.cl.cam.ac.uk/directions/
<https://www.cl.cam.ac.uk/directions/>  *

Title: Navigating the Open Source Landscape: Insights from Ayan Kumar and
Edwin Torok  <https://talks.cam.ac.uk/talk/index/205825>

Join us for an illuminating seminar featuring two distinguished speakers,
Ayan Kumar and Edwin Torok, who will delve into the intricate world of
open-source projects.

Ayan Kumar: In his engaging presentation, Ayan Kumar will be your guide
through the inner workings of open-source projects, using the Xen
hypervisor as a compelling example. With a keen focus on demystifying the
nuances of open-source collaborations, Ayan will walk you through the
step-by-step workflow for contributions, shedding light on the
collaborative modes that fuel innovation. Get ready to be inspired by the
fascinating ongoing developments in the Xen hypervisor. Ayan will also
provide invaluable insights for newcomers, outlining promising avenues for
their initial contributions. The session will culminate in a hands-on
demonstration featuring a selection of noteworthy open-source projects.

Edwin Torok: Edwin Torok will offer invaluable wisdom on the unique
challenges of joining and maintaining a venerable, decade-old codebase,
drawing from his extensive experience with the XAPI project. With a deep
dive into the strategies and practices that sustain such a longstanding
project, Edwin will equip you with the insights needed to navigate and
contribute effectively to large-scale, established codebases.

Don't miss this opportunity to gain firsthand knowledge from these two
seasoned experts in the open-source arena. Join us for an enriching seminar
that promises to empower both beginners and seasoned developers alike.

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--000000000000c5320b0608f2bde2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Xen Community! <br><br>I&#39;m excited to share that=
 we will be presenting a talk at Cambridge University!=C2=A0<div>This is fr=
ee and open to everyone, including students and the public. <br><br>Make su=
re to add this to your calendars and come along.<div><br></div><div><b>Date=
: Thursday 9th November 2023</b></div><div><b>Time: 3 - 4pm=C2=A0</b></div>=
<div><b>Location:=C2=A0<br></b></div><div><b>Computer Laboratory<br>William=
 Gates Building<br>15 JJ Thomson Avenue</b></div><div><b>Cambridge CB3 0FD<=
br><a href=3D"https://www.cl.cam.ac.uk/directions/" target=3D"_blank">https=
://www.cl.cam.ac.uk/directions/</a>=C2=A0=C2=A0</b></div><div><br>Title: <a=
 href=3D"https://talks.cam.ac.uk/talk/index/205825" target=3D"_blank">Navig=
ating the Open Source Landscape: Insights from Ayan Kumar and Edwin Torok=
=C2=A0</a></div><div><br></div><div>Join us for an illuminating seminar fea=
turing two distinguished speakers, Ayan Kumar and Edwin Torok, who will del=
ve into the intricate world of open-source projects.=C2=A0<div><br></div><d=
iv>Ayan Kumar: In his engaging presentation, Ayan Kumar will be your guide =
through the inner workings of open-source projects, using the Xen hyperviso=
r as a compelling example. With a keen focus on demystifying the nuances of=
 open-source collaborations, Ayan will walk you through the step-by-step wo=
rkflow for contributions, shedding light on the collaborative modes that fu=
el innovation. Get ready to be inspired by the fascinating ongoing developm=
ents in the Xen hypervisor. Ayan will also provide invaluable insights for =
newcomers, outlining promising avenues for their initial contributions. The=
 session will culminate in a hands-on demonstration featuring a selection o=
f noteworthy open-source projects.=C2=A0</div><div><br></div><div>Edwin Tor=
ok: Edwin Torok will offer invaluable wisdom on the unique challenges of jo=
ining and maintaining a venerable, decade-old codebase, drawing from his ex=
tensive experience with the XAPI project. With a deep dive into the strateg=
ies and practices that sustain such a longstanding project, Edwin will equi=
p you with the insights needed to navigate and contribute effectively to la=
rge-scale, established codebases.=C2=A0</div><div><br></div><div>Don&#39;t =
miss this opportunity to gain firsthand knowledge from these two seasoned e=
xperts in the open-source arena. Join us for an enriching seminar that prom=
ises to empower both beginners and seasoned developers alike.<br><br></div>=
<div>Many thanks,<br>Kelly Choi<br><br>Open Source Community Manager<br>Xen=
Server, Cloud Software Group<br></div></div></div></div>

--000000000000c5320b0608f2bde2--

