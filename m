Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576C9AD14C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 18:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824848.1239057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3eWd-0002HX-68; Wed, 23 Oct 2024 16:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824848.1239057; Wed, 23 Oct 2024 16:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3eWd-0002EB-12; Wed, 23 Oct 2024 16:47:59 +0000
Received: by outflank-mailman (input) for mailman id 824848;
 Wed, 23 Oct 2024 16:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlqr=RT=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1t3eWb-0002AO-Ip
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 16:47:57 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d159768-915e-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 18:47:55 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5cb15b84544so5155458a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 09:47:55 -0700 (PDT)
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
X-Inumbo-ID: 8d159768-915e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729702074; x=1730306874; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ovZvirNUrPHAZVWGClhiwXigYSywURKiIu8D/t9Xd9A=;
        b=XRSJWS8KhkJGKwCU7iPMenBgcj7K0uAmSS4xjkUyjSY7/scni+/VQ2Qb0qXymT1pa3
         +5Q6DMR0ftQ1FpOsfGYQDRX05U6L77kUA2xkW1Ea0YZlL/c8frO5SbZwcCH/x4Pur07T
         jKV2fqdm1NCkMrK3W2bkcuhu0qG00ghe4blIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702074; x=1730306874;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ovZvirNUrPHAZVWGClhiwXigYSywURKiIu8D/t9Xd9A=;
        b=VtM+lL+9UOLhWMowTedU4VvrWQZufGtswglruXGlqWFcciSA+z09Iqde7JT6lzvaIx
         DlWzAICSDgcsSemWOl5GtV+GHhh62WjVGuRdEjB6Ek961rc2m8PT9kJoFDLkNUI1xRgt
         gZtWcGqoUXPpPC/cRe4nEPWc/P8QQQEYbZnBvZdHQnlGV/c6Mu4951PlU802YRd5mE6w
         /C+c8MjyHjW0FDlNT/ynU3YOpwyLzZodxy7EIoH/ZH+ll/YgnkKML7BmWD+0unDC7HEn
         xH8sFX4EOSFQtcb0cp8kaLbquFdPk2nGCnSXAYruzcTDfewyL4r/2EJVw6rGxZE2ewJQ
         tXHg==
X-Gm-Message-State: AOJu0YyjGahgf4XfU95Q36jdtKazuyH/2XmOLMSkq/p/TjNHPIb+7Onc
	H84LeGfNawnhG0zmiPpQz8cif2nq4vdyRr/XYLcsv6k5mKbtDKBQm8OeinlkhsTrkw2ycXbRxWr
	rGTjDGLlgvP73TIp3y4Yo5T4e3WKWypo/YjZdkJiQAx5vRsUq6SU=
X-Google-Smtp-Source: AGHT+IEEqLtEHDSSRj3ay93GeSWaMKSmfTGoX/ksMdojlNcK6PhE9unfCCYBCUK6i4f45WB3mpbE4jenoBjmXyWcV/o=
X-Received: by 2002:a17:907:9411:b0:a99:762f:b298 with SMTP id
 a640c23a62f3a-a9abf94de80mr329006666b.41.1729702073963; Wed, 23 Oct 2024
 09:47:53 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 23 Oct 2024 17:47:17 +0100
Message-ID: <CAO-mL=zEqsMPE85XMVF=xJagTYLdU16Uo5NPDMf5zowLOqKCjA@mail.gmail.com>
Subject: Goodbye to our Xen Project Colo
To: xen-devel <xen-devel@lists.xenproject.org>, xen-announce@lists.xenproject.org
Cc: committers@xenproject.org
Content-Type: multipart/alternative; boundary="000000000000afb588062527a5ca"

--000000000000afb588062527a5ca
Content-Type: text/plain; charset="UTF-8"

Hi all,

A while back, the Xen Project was notified by the data centre facility
hosting the physical hardware for OSSTest and some of the GitLab runners,
were due to be shut down.

Since then we have had extensive discussions and explored multiple options
to mitigate the impact of this on our project.

At the end of July, we sent out a communication explaining our decision to
best focus our efforts on GitLab, which offers a more modern and
sustainable infrastructure.  As we prepare to leave the colo by the end of
the month, the remainder servers we are saving will be shipped to AMD
to help host our future Xen Project operations.

These are listed below:

   - 1x Zen3: verdesse 1U AMD EPYC 7543P 32-Core Milan (Zen 3) 2021
   - 1x ThunderX: rochester 1U Cavium ThunderX-88XX ARMv8.1 2014
   - 1x Zen3: verdesse 1U AMD EPYC 7543P 32-Core Milan (Zen 3) 2021
   - 1x ThunderX: rochester 1U Cavium ThunderX-88XX ARMv8.1 2014
   - 1x serial port concentrator
   - 1x PDU
   - 2x Zen2 espadeiro: espadeiro 1U AMD EPYC 7502P 32-Core Rome (Zen 2)
   2019
   - 2x Zen2 rubintos: rubintos 2U AMD Ryzen 9 3900X 12-Core Matisse (Zen
   2) 2019

As we say goodbye to our colo, I'd like to reiterate that OSSTest has been
instrumental to the Xen Project for many years, and we'd like to extend our
gratitude to everyone who has contributed.

Thank you again to our community for your continued support

Kelly Choi
Community Manager
Xen Project
<https://xenproject.org/>

--000000000000afb588062527a5ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>A while back, the Xen Project w=
as notified by the data centre facility hosting the physical hardware for O=
SSTest and some of the GitLab runners, were due to be shut down.=C2=A0</div=
><div><br></div><div>Since then we have had extensive discussions and explo=
red multiple options to mitigate the impact of this on our project.=C2=A0</=
div><div><br></div><div>At the end of July, we sent out a communication exp=
laining our decision to best focus our efforts on GitLab, which offers a mo=
re modern and sustainable infrastructure.=C2=A0 As we prepare to leave the =
colo by the end of the month, the remainder servers we are saving will be s=
hipped to AMD to=C2=A0help host our future Xen Project operations.</div><di=
v><br></div><div>These are listed below:</div><ul><li>1x Zen3: verdesse 1U =
AMD EPYC 7543P 32-Core Milan (Zen 3) 2021</li><li>1x ThunderX: rochester 1U=
 Cavium ThunderX-88XX ARMv8.1 2014</li><li>1x Zen3: verdesse 1U AMD EPYC 75=
43P 32-Core Milan (Zen 3) 2021</li><li>1x ThunderX: rochester 1U Cavium Thu=
nderX-88XX ARMv8.1 2014</li><li>1x serial port concentrator=C2=A0</li><li>1=
x PDU=C2=A0</li><li>2x Zen2 espadeiro: espadeiro 1U AMD EPYC 7502P 32-Core =
Rome (Zen 2) 2019</li><li>2x Zen2 rubintos: rubintos 2U AMD Ryzen 9 3900X 1=
2-Core Matisse (Zen 2) 2019</li></ul><div>As we say goodbye to our colo, I&=
#39;d like to reiterate that OSSTest has been instrumental to the Xen Proje=
ct for many years, and we&#39;d like to extend our gratitude to everyone wh=
o has contributed.</div><div><br></div><div>Thank you again to our communit=
y for your continued support</div><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"te=
xt-align:left"><br></div><div>Kelly Choi<br></div><div><div style=3D"color:=
rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,13=
6)"><a href=3D"https://xenproject.org/" target=3D"_blank">Xen Project<br></=
a><br></div></div></div></div></div></div>

--000000000000afb588062527a5ca--

