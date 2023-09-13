Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6179EE47
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 18:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601498.937509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgSmU-0004k0-MZ; Wed, 13 Sep 2023 16:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601498.937509; Wed, 13 Sep 2023 16:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgSmU-0004i4-J9; Wed, 13 Sep 2023 16:31:58 +0000
Received: by outflank-mailman (input) for mailman id 601498;
 Wed, 13 Sep 2023 16:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xM15=E5=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1qgSmT-0004hy-4Q
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 16:31:57 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c6515c3-5253-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 18:31:55 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31f6ddb3047so6888966f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 09:31:54 -0700 (PDT)
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
X-Inumbo-ID: 0c6515c3-5253-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694622713; x=1695227513; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cdMb535OD4+ZFN1hEEhJaRly87Gdiar1NF7LHXDszEY=;
        b=hacTxDiQKAvljgP3F47SWS+h3CertRmliE7HYm1jt1DycflyPAWVeFGv4VLTeJTfuE
         pGqUhG3Zd3WNIXfmNV9b8raxA/IM+NaljzGj9DmA1cJwsHTjyAkVTCty0v/4bvMlbTXs
         m/hiwkT0FW75Gd87wllCgN2aYL9/1iaMvpHY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694622713; x=1695227513;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdMb535OD4+ZFN1hEEhJaRly87Gdiar1NF7LHXDszEY=;
        b=N8iklUS3m0EjLsLVugtB7RZKDc2s8hisY9988WPl/7LbxjRRQA2BQF0MBmfRr5ikAx
         1czXR4ofS4AwV9gDwBZnZ2HbAuBUhR58XAyAniikY5a1DqCNsbu/s7I2oAT6ZdDezh/B
         W8GsPutcLzzIgXj6swsWfhq1/kdUlUM2DuiJEjwdSoczDTcBaVZ5XhaK4rI2Nd4W34cs
         kFC+bkvbUpAZ5zjN7qdQa7aJSplXhhOgzOY+2ISFdf8/YX5E/rn6u8WRgbxM5InQ+g/u
         2HBBmJxCYMrNSx4BXtelTdLZqeq5EpFokUZvjS92/656dlBW6YL/jc+lcwzu4MqbsvHr
         8o8Q==
X-Gm-Message-State: AOJu0Yy89dqxGQSgA3R6A3mekacQyK+Ox056lVSwdLEOoP4SnEDgAgGL
	iS/fqpMgckcgU1PqgA5k5nxqCJvKzkseb03WNH0D2jlerL7gmp17RRk=
X-Google-Smtp-Source: AGHT+IFbvN0UKGmAcBNfIG93bxONO8fDoZx99QLW30bcs/EESh6JR45TP7ZUgJOy6EqA0w1g8JoM6c4BxIDn8HQk9dY=
X-Received: by 2002:adf:f38c:0:b0:315:8a13:ef17 with SMTP id
 m12-20020adff38c000000b003158a13ef17mr2572155wro.65.1694622713021; Wed, 13
 Sep 2023 09:31:53 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 13 Sep 2023 17:31:17 +0100
Message-ID: <CAO-mL=zc3sOnnqPiWXTxUSJxxC=eF6B6V+mmFaQa=Oo2ZcZ9cw@mail.gmail.com>
Subject: Community Guidelines
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d6a0140605401835"

--000000000000d6a0140605401835
Content-Type: text/plain; charset="UTF-8"

Hi all,

I hope everyone is well.

First and foremost, I want to express my appreciation for the dedication
and hard work everyone has put into this project. It is evident that you
have the best interests of the community at heart, and your contributions
are invaluable.

It is natural for disagreements to arise in collaborative environments,
especially within the context of open-source projects where diversity of
opinion is a strength. It is important that we approach these situations
with a mindset of finding common ground and moving forward for the
betterment of the project.

In situations like this, it is helpful to be reminded that decisions
should:

   1. Focus on the Project's Goals: Remind ourselves of the overarching
   goals and vision of the project. What will best serve the community,
   maintain the integrity of the codebase, and align with the project's
   objectives?
   2. Seek Compromise: Explore potential areas of compromise or alternative
   solutions that may address the concerns raised by both parties. This may
   involve finding a middle ground or suggesting modifications to the patch.

It is crucial that all members maintain a high level of respect,
professionalism, and courtesy towards one another. Disagreements are
natural, and they should be seen as opportunities for growth rather than
sources of conflict.

As a community, we also have rules in place to ensure effective
collaboration and a fair way of operating within the project. As such,
please be advised that if an individual continues to operate by breaking
rules, warnings will be given and consequences will be followed.
I do hope that it will never come to such a stage, but my role is to ensure
actions are accountable and that each decision made is in the best interest
of the project and community members.

Following on from the above, I will be working with you all on an updated
process to ensure any future potential conflicts are handled fairly.

Again, thank you for your continued dedication to this project.
Should you have any concerns, please message me directly.

Kelly
Open Source Community Manager, XenServer
Cloud Software Group

--000000000000d6a0140605401835
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I hope everyone is w=
ell.</div><div><br></div>First and foremost, I want to express my appreciat=
ion for the dedication and hard work everyone has put into this project. It=
 is evident that you have the best interests of the community at heart, and=
 your contributions are invaluable.<br><br>It is natural for disagreements =
to arise in collaborative environments, especially within the context of op=
en-source projects where diversity of opinion is a strength. It is importan=
t that we approach these situations with a mindset of finding common ground=
 and moving forward for the betterment of the project.<div><br>In situation=
s like this, it is helpful to be reminded that decisions should:=C2=A0<br><=
div><ol><li style=3D"margin-left:15px">Focus on the Project&#39;s Goals: Re=
mind ourselves of the overarching goals and vision of the project. What wil=
l best serve the community, maintain the integrity of the codebase, and ali=
gn with the project&#39;s objectives?</li><li style=3D"margin-left:15px">Se=
ek Compromise: Explore potential areas of compromise or alternative solutio=
ns that may address the concerns raised by both parties. This may involve f=
inding a middle ground or suggesting modifications to the patch.</li></ol>I=
t is crucial that all members maintain a high level of respect, professiona=
lism, and courtesy towards one another. Disagreements are natural, and they=
 should be seen as opportunities for growth rather than sources of conflict=
.</div><div><br></div><div>As a community, we also have rules in place to e=
nsure effective collaboration and a fair way of operating within the projec=
t. As such, please be advised that if an individual continues to operate by=
 breaking rules, warnings will be given and consequences will be followed.=
=C2=A0</div><div>I do hope that it will never come to such a stage, but my =
role is to ensure actions are accountable and that each decision made is in=
 the best interest of the project and community members.=C2=A0</div><div><b=
r>Following on from the above, I will be working with you all on an updated=
 process to ensure any future=C2=A0potential conflicts are handled fairly.<=
/div><div><br>Again, thank you for your continued dedication to this projec=
t.=C2=A0</div><div>Should you have any concerns, please message me directly=
.</div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature">=
<div dir=3D"ltr"><div>Kelly</div></div></div></div></div><div><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div style=3D"color:rgb(136,136,136)">Open Source Community M=
anager, XenServer</div><div style=3D"color:rgb(136,136,136)">Cloud Software=
 Group</div></div></div></div></div></div></div>

--000000000000d6a0140605401835--

