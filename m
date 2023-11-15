Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC617EC165
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633592.988563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3EJm-0003hm-6z; Wed, 15 Nov 2023 11:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633592.988563; Wed, 15 Nov 2023 11:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3EJm-0003f1-3b; Wed, 15 Nov 2023 11:44:26 +0000
Received: by outflank-mailman (input) for mailman id 633592;
 Wed, 15 Nov 2023 11:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R+xL=G4=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r3EJk-0003ev-QZ
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:44:24 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 525cbb98-83ac-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 12:44:23 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9dd6dc9c00cso997427066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 03:44:23 -0800 (PST)
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
X-Inumbo-ID: 525cbb98-83ac-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700048662; x=1700653462; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kcBDmeGJ9ij1z8aEcYoHvE7FEF5bbkiplfcT8qeAfLU=;
        b=BfbWHp0CwHdAL+sRIwMrUtmwz390poh2mkpcAootpe56JFgsuV+dx3O8k/k31ocduV
         zlGl7Gsw35wQ6OR0qughGMvtY4fRmwdWxDiGjjglDFp9TMneIns7QDAREPGH+WbYXLum
         BHSG437De6xhqsFoFcWfH/iXB2FpBjJ2J+WJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700048662; x=1700653462;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcBDmeGJ9ij1z8aEcYoHvE7FEF5bbkiplfcT8qeAfLU=;
        b=GhHAk30YqqGrNhUUfHCc2QaEnfVJsOcijg5YDo+zkj6hKGEpwDIcN6A3ilKPaTx4cg
         oe+yi/ZYZrE5Tn3EnCDfHuvY/wd7iDvP57bbjK5x6Qn7SLcDdsdDtukZWdb1REkanj5D
         XXUtXMztAe7Ef+7T+gTym7oXo8kvU5Ac/0aX2pOA+2tjleLD2rIh3Ohzdbshnjif3dtO
         qd6dUiaCF9RNScAT3x06yrPYNYLDVHJYwyprUaTm9xfrn/wsq6vX+52C5pDWwGBDTt9D
         0mAPftdhFqoeq7ewBHfB3MosBtDwZNxhQj8EZOrlL1USLwwQ9HzV8LQs4nTJhDhc3NF5
         3Txg==
X-Gm-Message-State: AOJu0YzcySq7c/Yp5i+sJo71ZKEHvrSB9B38VEI5rX/2IDyeCI+ogSG4
	WdUikRsNlgiA2mFdJ4cIGrxRk5qTtNiTNvrVO24PyvYkeqNrH4WtpyVkGQ==
X-Google-Smtp-Source: AGHT+IFUKSilkHtLS7Jn0IKN25aexVmIjiJfBYSa2VvTFFomb0B97gIEJwVECdFBDjhYORjwNfX6ierDBROTig88iA8=
X-Received: by 2002:a17:906:1147:b0:9da:f372:4f6c with SMTP id
 i7-20020a170906114700b009daf3724f6cmr7848911eja.32.1700048662619; Wed, 15 Nov
 2023 03:44:22 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 15 Nov 2023 11:43:46 +0000
Message-ID: <CAO-mL=wq2_gtE224RfavM3o6mhEASwygN6-fnKEP1YNUiuWEig@mail.gmail.com>
Subject: Important - Documentation Discussion
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a3068a060a2f6c93"

--000000000000a3068a060a2f6c93
Content-Type: text/plain; charset="UTF-8"

Hi all,

As you may be aware, we are in the process of reviewing our existing
documentation platform and content. In order to meet the requirements of
the community and project, I need your input and feedback.

The aim of the new documentation is to encourage community members to
collaborate in updating content (where possible) and educate users on how
the project works. The updated documentation will be hosted on our new
upcoming website.

*Suggestion for user-orientated documentation:*

   - git - for hosting (gitlab recommended)
   - RST - for the format of the documentation
   - Sphynx - to generate web pages and PDF and other formats from RST

*Suggestion for developer reference documentation:*

   - Doxygen
   - Kerneldoc
   - Open to other suggestions here

Example of how documentation will be split:

   1. Getting started/beginner user guides
   2. Learning orientated tutorials
   3. Goal-orientated how-to guides
   4. Developer related documentation

Side note: Whilst I appreciate everyone has a different vision of what
ideal documentation looks like, please be mindful that not everyone's
thought processes or depth of knowledge are the same. All ideas are
welcome, and decisions made will always reflect community needs.

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--000000000000a3068a060a2f6c93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>As you may be aware, we are in =
the process of reviewing our existing documentation platform and content. I=
n order to meet the requirements of the community and project, I need your =
input and feedback.</div><div><br></div><div>The aim of the new documentati=
on is to encourage community members to collaborate in updating content (wh=
ere possible) and educate users on how the project works. The updated docum=
entation will be hosted on our new upcoming website.=C2=A0<br></div><div><b=
r></div><div><b>Suggestion for user-orientated documentation:</b></div><div=
><ul><li>git - for hosting (gitlab recommended)</li><li>RST - for the forma=
t of the documentation</li><li>Sphynx=C2=A0- to generate web pages and PDF =
and other formats from RST</li></ul></div><div><b>Suggestion for developer =
reference documentation:</b></div><div><ul><li>Doxygen=C2=A0</li><li>Kernel=
doc</li><li>Open to other suggestions here</li></ul></div><div>Example of h=
ow documentation will be split:</div><div><ol><li>Getting started/beginner =
user guides</li><li>Learning orientated tutorials</li><li>Goal-orientated h=
ow-to guides</li><li>Developer related documentation</li></ol><div>Side not=
e: Whilst I appreciate everyone has a different vision of what ideal docume=
ntation=C2=A0looks like, please be mindful that not everyone&#39;s thought =
processes or depth of knowledge are the same. All ideas are welcome, and de=
cisions made will always reflect community needs.=C2=A0=C2=A0</div></div><d=
iv><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kell=
y Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Open =
Source Community Manager</div><div style=3D"color:rgb(136,136,136)">XenServ=
er, Cloud Software Group</div></div></div></div></div></div></div>

--000000000000a3068a060a2f6c93--

