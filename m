Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEBA84063B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 14:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672944.1047051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rURNN-0002Cz-St; Mon, 29 Jan 2024 13:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672944.1047051; Mon, 29 Jan 2024 13:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rURNN-0002AU-QA; Mon, 29 Jan 2024 13:08:37 +0000
Received: by outflank-mailman (input) for mailman id 672944;
 Mon, 29 Jan 2024 13:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kvg3=JH=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rURNM-0002AD-HH
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 13:08:36 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81f479f7-bea7-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 14:08:34 +0100 (CET)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-55eed368b0bso2044673a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 05:08:34 -0800 (PST)
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
X-Inumbo-ID: 81f479f7-bea7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706533714; x=1707138514; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y3MCm4bTwBIid/dNRuePrKPkhjaSFd7D1VYEOokGxqY=;
        b=apjo20tqP12PtlixU4Gf38dyCrZen4UEvbMjHNY1e1xLtzNxG6xsQw/eZgkEUiL8M5
         /CiVNbCh2DMRwvERzGE/AGV6N5IkGCbJHUGZQe8P9wW8U7qtP5wbyiqJwYsjowOnE6EO
         gTzz9ifD/CR5JKiW4QHxtHQtnE7OGRsb6yH4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706533714; x=1707138514;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3MCm4bTwBIid/dNRuePrKPkhjaSFd7D1VYEOokGxqY=;
        b=MhL/w+ZGV4HYC7rTTMddMsGGgOZLV+DeNp1igH0KyppkH1gEsjDdS/q9EC3VqDAtMo
         cQSo8XCDuwXEfrDJdfacjPn4iRl4dixaxtsVapQlXtAWu8hg+Q9qIVmdzAupUYi2IvU8
         bRK/ZHu21i3YnofIBODLNvCpouQQQNGZYbKfTylS36M/R5sQv00/68I60z3ANTLGAU65
         JW4EMb7yWzYYxcvRjIz74lP7ZO94anuVm/HSN/kgFeK2CsiwcWNWVi5/P8ojh2Pp7WU8
         AAsd1ZEClYiZRRAB3S388m09nu2uLVSHH3EPiOXqpWKraoqP9YKw1fAZVcouYwBBMHDe
         4l8w==
X-Gm-Message-State: AOJu0YzqVEUJc3hXj5pFp3mJQFYs5ux1DQCPeM6PEQpEuhQzARv1Hjzk
	9Kb1iVk0SyCIw8PZpV46d0oYGKEXMiTB1Ep+6MVnC8s30/M+3tkEUrAGJNOowADzzHVtDg52SEB
	0/0zCCY+dytDFsKR49PD8V4yGad/pgysZpIWyKaZvyY1iN0pU5nd+rswbRDM=
X-Google-Smtp-Source: AGHT+IFMGCTXE9G4WkC2QYRYPHLMBCgqFImsd26/rPuuvWpJlPYJ++A1dX9inRiNSBBabcgblgNK8Wyb+nnEPjWdVus=
X-Received: by 2002:a50:ec8d:0:b0:55f:1da7:62f6 with SMTP id
 e13-20020a50ec8d000000b0055f1da762f6mr908839edr.13.1706533713769; Mon, 29 Jan
 2024 05:08:33 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 29 Jan 2024 13:07:57 +0000
Message-ID: <CAO-mL=xKRBje+Fg-pJ1A7ZLvjuORogCOxSrb_c-P8RF4nhkPXQ@mail.gmail.com>
Subject: Final reminder: Xen Project Annual Survey
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000ce8ceb061015573f"

--000000000000ce8ceb061015573f
Content-Type: text/plain; charset="UTF-8"

Hi all,

Final reminder to have your chance to say how the community is performing!

What are we doing well and what can we improve on?

Tell us here anonymously:
https://cryptpad.fr/form/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuWh2c58bhBYI/

*Survey closes on 31st January 2024*

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000ce8ceb061015573f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>Final reminder to have your cha=
nce to say how the community is performing!=C2=A0</div><div><br></div><div>=
What are we doing well and what can we improve on?</div><div><br></div><div=
>Tell us here anonymously:=C2=A0</div><div><a href=3D"https://cryptpad.fr/f=
orm/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuWh2c58bhBYI/">https://cry=
ptpad.fr/form/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuWh2c58bhBYI/</a=
></div><div><br></div><div><i>Survey closes on 31st January 2024</i></div><=
div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>=
Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">C=
ommunity Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=
=A0<br></div></div></div></div></div></div></div>

--000000000000ce8ceb061015573f--

