Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF723A54EDF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 16:24:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903733.1311713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqD5I-0001sZ-JT; Thu, 06 Mar 2025 15:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903733.1311713; Thu, 06 Mar 2025 15:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqD5I-0001qY-GZ; Thu, 06 Mar 2025 15:24:28 +0000
Received: by outflank-mailman (input) for mailman id 903733;
 Thu, 06 Mar 2025 15:24:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4wq0=VZ=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tqD5H-0001iS-0K
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 15:24:27 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1637a1ce-fa9f-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 16:24:25 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-abf4cebb04dso154467666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 07:24:25 -0800 (PST)
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
X-Inumbo-ID: 1637a1ce-fa9f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741274664; x=1741879464; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IfpRx+4HWti9bQdpi7v8SRUcygtKRPDlLQgeTFRrDpk=;
        b=HLqa9OUzCw/jlJ+LMV9/H5kjoMRUv5SDkukE4+RDgRfssueZ/8LDUC52FIx/W+2W2d
         VTANfr0OJRTwz0M0DTXzo7tDS3jLachmYkeFZcTQRxOvjj6ekBe5KPW7zrOpgQnO1GOa
         R+31wlmgKRUf3FN/1WKWOQdoUoaSuOv/j9r/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741274664; x=1741879464;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IfpRx+4HWti9bQdpi7v8SRUcygtKRPDlLQgeTFRrDpk=;
        b=T+/gzYvFlTVOd6xl5h9IGS0Nz3+WRQQiU1QBeNBkSd7cxG1yqZoSntUJeYQwAh7mXq
         ZpJHxjG47uB2VUS+deu/qdVuPyPazXUdshrTMl0BeSybXiXDCC2qTulTdK8eiQ14VlAb
         I2RSNYmU/bfZD9Gvy6YmUJZPovogFki1IqmNZ+p0Sa89mvxcok9uUE/1v6HGPnHy689q
         17BykOcUSZanz7GMEFUV8189UU3VQ1p/O7RuAWy+V2LzBXHYOFO1MNq86uYtxGwtVS6Z
         7UoA2LJsfNMi+cMb2RQjp5wz7yqi8c84JqHBha62c6ADCksnjOI8WXMy7sPtCHFvkXJD
         iyDA==
X-Gm-Message-State: AOJu0YzHq9Ek7ymV4nQhC9rvKiAIAOhUOPRv7LnBpoX2gGWfxZforbmE
	fYVZCydyk9FOGV+E0cchsVpk1K4x9KopafflUpvwcdE55iv1f7Mlt6IExHle9pBF/1G7Jg88Nza
	BlOHxBKKpkNeu+4ljpnTH4XmX8bhjJA5i0r/iIHoZdBcEE4ug
X-Gm-Gg: ASbGncte4zu8qPjBc9t97cFJWH63lAhzF81GVSg3mnfZQYL2MHtXwQ8Tb0XXUt4FKcF
	WKZgoPnj/fWvVF7/IwuhOtASoj/MNl/hvRmN4wHyanwwBiXdx0B19J2VfRt6bSIA7qDZetszmf5
	Rsij7eIrGrUvKhDom8N8INx2SIQXSLQtN/KRPFmY5/7Yxo10a/qgCqX7BueKuF
X-Google-Smtp-Source: AGHT+IFG8Hjgc5IwezD9G4WANi05H7A6vd765haYU/2KUDPqtMpkkf7PCcNmWSZuCHXxJSr5Y8uCiqQTNf/S2ST6WCs=
X-Received: by 2002:a17:907:961e:b0:abb:b411:5e02 with SMTP id
 a640c23a62f3a-ac22cbb5723mr423946866b.18.1741274663692; Thu, 06 Mar 2025
 07:24:23 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 6 Mar 2025 15:24:12 +0000
X-Gm-Features: AQ5f1JqOjxcHusnvwMlnFvSOng7ureYgflORoBCR2NJY5QGKAtSBtk7YNgoztow
Message-ID: <CAO-mL=xZBFaHW0=3sz_1Kg0vno=YCb_ZP5foRz=r8D6D_hcySw@mail.gmail.com>
Subject: A Heartfelt Goodbye to the Xen Project Community
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Cc: Xen Project Advisory Board <advisory-board@lists.xenproject.org>, 
	"committers @ xenproject . org" <committers@xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000c950a8062fae190b"

--000000000000c950a8062fae190b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

It is with a heavy heart that I share that my time as the Community Manager
for the Xen Project has come to an end due to redundancy. While this was an
unexpected change, I want to take this opportunity to express my gratitude
and reflect on what an incredible journey it has been.

Being part of this community has been nothing short of amazing. I=E2=80=99v=
e had
the privilege of working alongside some of the most talented, passionate,
and dedicated people in open source. From contributors and maintainers to
users and advocates, every interaction has reinforced what makes Xen so
special=E2=80=94it=E2=80=99s not just about technology; it=E2=80=99s also a=
bout the people behind
it.

I=E2=80=99ve loved seeing the project evolve, celebrating its milestones, a=
nd
tackling challenges together. And while I may be stepping away from my
official role, I=E2=80=99ll always be cheering for the Xen Project from the
sidelines. I have no doubt that this community will continue to push
boundaries and achieve great things. Watch out for more board members
joining Xen Project soon!

Thank you to everyone who has supported, collaborated, and shared this
journey with me.

Let=E2=80=99s stay in touch=E2=80=94you can connect with me on LinkedIn
<https://www.linkedin.com/in/kellychoiuk/>.

Wishing you all the best, and hoping our paths cross again soon!
Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--000000000000c950a8062fae190b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"ltr"><div dir=3D"ltr"><div><p>Hi all,=C2=A0</p><p>It is wi=
th a heavy heart that I share that my time as the Community Manager for the=
 Xen Project has come to an end due to redundancy. While this was an unexpe=
cted change, I want to take this opportunity to express my gratitude and re=
flect on what an incredible journey it has been.</p><p>Being part of this c=
ommunity has been nothing short of amazing. I=E2=80=99ve had the privilege =
of working alongside some of the most talented, passionate, and dedicated p=
eople in open source. From contributors and maintainers to users and advoca=
tes, every interaction has reinforced what makes Xen so special=E2=80=94it=
=E2=80=99s not just about technology; it=E2=80=99s also about the people be=
hind it.</p><p>I=E2=80=99ve loved seeing the project evolve, celebrating it=
s milestones, and tackling challenges together. And while I may be stepping=
 away from my official role, I=E2=80=99ll always be cheering for the Xen Pr=
oject from the sidelines. I have no doubt that this community will continue=
 to push boundaries and achieve great things. Watch out for more board memb=
ers joining Xen Project soon!=C2=A0</p><p>Thank you to everyone who has sup=
ported, collaborated, and shared this journey with me.=C2=A0</p><p>Let=E2=
=80=99s stay in touch=E2=80=94you can <a href=3D"https://www.linkedin.com/i=
n/kellychoiuk/" target=3D"_blank">connect with me on LinkedIn</a>.=C2=A0</p=
><p>Wishing you all the best, and hoping our paths cross again soon!</p></d=
iv><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr"><div>Thanks,</div><div>Kelly Choi<br></div><div=
><div style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D=
"color:rgb(136,136,136)"><a href=3D"https://xenproject.org/" target=3D"_bla=
nk">Xen Project</a><br></div></div></div></div></div></div>
</div>
</div>

--000000000000c950a8062fae190b--

