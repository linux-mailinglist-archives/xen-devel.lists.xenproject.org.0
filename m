Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFC8286F8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 14:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664588.1034677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNC33-0002Fv-QM; Tue, 09 Jan 2024 13:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664588.1034677; Tue, 09 Jan 2024 13:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNC33-0002DY-N9; Tue, 09 Jan 2024 13:21:41 +0000
Received: by outflank-mailman (input) for mailman id 664588;
 Tue, 09 Jan 2024 13:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TUfc=IT=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rNC32-0002DQ-QK
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 13:21:40 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c941fd-aef2-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 14:21:39 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a2a17f3217aso313412866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 05:21:39 -0800 (PST)
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
X-Inumbo-ID: 05c941fd-aef2-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704806499; x=1705411299; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UEzy2BNPiipyrD9tho94J+rCXdCdv7DhoxljcDviQIU=;
        b=MuajzseDy/03/7dzi+wtGNFJerDAGRHNDD58WwGKkaS0TOa0KbTn2fZvhqhX7h2uHN
         Ist2GvhwiN3xFYkEM8K2giuf14T1uu6fTReyoVS40ZMiu2CZO6EPrB/jf3OPriSe1QXw
         oyzXKDHeAZDxzluX1PANtE5VaLJWU/rw8NDLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704806499; x=1705411299;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEzy2BNPiipyrD9tho94J+rCXdCdv7DhoxljcDviQIU=;
        b=jPDmPUO5Gq/RSQbgyGNWNmb1v9BaZ1IhDYJJEWYg05GQmwrkNv5hwvbEp7HcfsWvJA
         cTeYUxmMe9hGH4x0N6jsORfPLnoJyPhdG5h5Wawz3Vf7fyNwELb1ZU/HeM/CaOFGvlNA
         nfimTXlUdA6oV6lqPKDSES4DvQtgWDVBPTMJOJQVjwniwQex/lBMCZWmDbNcUYkcU2sK
         9v6AXzQtzee2mIRbzfAqL2ktr0TlDBPON7FTH0s9bvhg2jJpjrgoN3VXYucBj4oDs48W
         go8FT3LDI1AP5y/pzvoqLOi7HTpNKxZAOzSkIPSJ8R1PkchqxvwYHC4ZAFRHwY/kKy29
         8yjg==
X-Gm-Message-State: AOJu0YzbP1NdEO1c3M1xM7ApQqPSSoHrsYShLe+OwKQGNFUY328UbmjC
	gJbkmi1DK/mnoGOXy3OkEUPvOsExw8PvRvvVpGmBJS5b1zL4F8rjbKTvj5kRhEa5VQ==
X-Google-Smtp-Source: AGHT+IFgtCG4D+qxdYYxAEEjdvQmKDJzw+zvRK/w8dYlA72FDq/+rRBsR0sYdUv15qecVzGuX6G7cSGFI+GaV1mq5hA=
X-Received: by 2002:a17:906:6a21:b0:a28:825d:99ab with SMTP id
 qw33-20020a1709066a2100b00a28825d99abmr750843ejc.19.1704806499030; Tue, 09
 Jan 2024 05:21:39 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 9 Jan 2024 13:21:03 +0000
Message-ID: <CAO-mL=yuK+t344CBL+KLFKUFc1kLfyj-eJxtHQ4t5Ltw777vFA@mail.gmail.com>
Subject: Xen Project Annual Survey
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Cc: committers@xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c951df060e83316f"

--000000000000c951df060e83316f
Content-Type: text/plain; charset="UTF-8"

Happy New Year Xen Community,

As we start the New Year, I'd like to ask you to reflect on how the project
went in 2023. This will help us track the health of the community and also
give you a chance to express your ideas and feedback.

The survey can be answered anonymously and should take less than 10 minutes.

*Link: https://cryptpad.fr/form/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuWh2c58bhBYI/
<https://cryptpad.fr/form/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuWh2c58bhBYI/>
*
*Deadline: 31st January 2024. *

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000c951df060e83316f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Happy New Year Xen Community,<div><br></div><div>As we sta=
rt the New Year, I&#39;d like to ask you to reflect on how the project went=
 in 2023. This will help us track the health of the community and also give=
 you a chance to express your ideas and feedback.=C2=A0</div><div><br></div=
><div>The survey can be answered anonymously and should take less than 10 m=
inutes.</div><div><br></div><div><b>Link:=C2=A0<a href=3D"https://cryptpad.=
fr/form/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuWh2c58bhBYI/">https:/=
/cryptpad.fr/form/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuWh2c58bhBYI=
/</a>=C2=A0</b></div><div><b>Deadline: 31st January 2024.=C2=A0</b></div><d=
iv><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kell=
y Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Commu=
nity Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<b=
r></div></div></div></div></div></div></div>

--000000000000c951df060e83316f--

