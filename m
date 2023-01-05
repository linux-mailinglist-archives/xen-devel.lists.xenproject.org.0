Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE6C65ED6D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 14:42:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471927.731978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDQVR-0006vS-Hb; Thu, 05 Jan 2023 13:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471927.731978; Thu, 05 Jan 2023 13:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDQVR-0006ta-E2; Thu, 05 Jan 2023 13:42:05 +0000
Received: by outflank-mailman (input) for mailman id 471927;
 Thu, 05 Jan 2023 13:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImXy=5C=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pDQVQ-0006tR-0x
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 13:42:04 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc475629-8cfe-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 14:42:02 +0100 (CET)
Received: by mail-ed1-x541.google.com with SMTP id b88so45573959edf.6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 05:42:02 -0800 (PST)
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
X-Inumbo-ID: bc475629-8cfe-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YrwToGlaZtM/V+QOWTx69dqDId0AmAIUx3GIoQbT6Bg=;
        b=d7Yq66CGlHscffW/i9FbHmDw9qnz1UeqlyB5MFPDT9uagCWjCP9z8OaZF3J/jjmIze
         aqXu0+93ye5pNGMmVU22HJAZUmOJj33x4VJnxV/CTo81My0jdX6pSopHIoCGhMoi807T
         uAmxrMiNepxMhQNJi2uO6lG6fZ2/6kFL/33uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YrwToGlaZtM/V+QOWTx69dqDId0AmAIUx3GIoQbT6Bg=;
        b=oxivEhUslR+KUfCRZ/tBFqQfMlGPBVKMtBgAj9Q+oWyl3hQScTWp0jfIhVobxjhfaU
         uvF63SAma0liBLdweHOiwNvPxFFlWMg3WKVmHxtNIOuzOlP+NbfYOT9zdzpQv+8734Kx
         RljEyyTcwaa64viIwdUq9Af2drY1ZpSGfzISh8U5klOeyh7YZ1W7ezpDfQBJeXXSzZMp
         SjbNMPtZzs+Vqr4qBZgCX8uZ3iScZQq1E/LqlaQsJzrLQISfWbD+h3ZQBY57TnHHMCaW
         sTmkU7zUJG2NaHB36jJu+IYAItSR6PhP3V7hRDrvWeMFrIytWLLgzdGxS0Q3dLmjmFiS
         e57w==
X-Gm-Message-State: AFqh2ko+Aj40DtzvRP7ZjMSaP24ceZcIaegVdS3SavVezfwJFMwYHUjO
	iNyoLYrIiQZZfA4jYDlPwjT4sLzIW4lbS+DvNPbRFP3aJIa6dWqekWdUsw==
X-Google-Smtp-Source: AMrXdXt1cX7PSjEZmptCzOl7HpzC6qTift+SlOxtvTDV0eugEZ3rhm6bgNwftK07TNzV6MZ1x2mi35Ubsxbtus12P+g=
X-Received: by 2002:aa7:d895:0:b0:486:3d22:5685 with SMTP id
 u21-20020aa7d895000000b004863d225685mr3979832edq.106.1672926122015; Thu, 05
 Jan 2023 05:42:02 -0800 (PST)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 5 Jan 2023 08:41:51 -0500
Message-ID: <CA+zSX=aVsQMX0a+3h9x=xFoON0b30VakpGh=J4c9uVqfivVH1w@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 12 January Community Call @ 1600 UTC
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000003d17af05f18477c6"

--0000000000003d17af05f18477c6
Content-Type: text/plain; charset="UTF-8"

Hi all,

NB that as discussed at the previous call, this month's community call is
NEXT THURSDAY, 12 January.

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/9YJwttVUMtpCrgS4ZX3sbNyA/ and you can
edit to add items.  Alternatively, you can reply to this mail directly.

Agenda items appreciated a few days before the call: please put your name
besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the previous meeting otherwise, the call is on the 1st
Thursday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate time
to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the
sign-up-sheet at
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Best Regards
George


== Dial-in Information ==
## Meeting time
16:00 - 17:00 UTC
Further International meeting times:
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2020&month=4&day=2&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2021&month=04&day=8&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=1&day=12&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

--0000000000003d17af05f18477c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi all,<br></p><p>NB that as discussed at the previous =
call, this month&#39;s community call is NEXT THURSDAY, 12 January.</p><p>T=
he proposed agenda is in <a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/9Y=
JwttVUMtpCrgS4ZX3sbNyA/">https://cryptpad.fr/pad/#/2/pad/edit/9YJwttVUMtpCr=
gS4ZX3sbNyA/</a>=C2=A0and you can edit to add items.=C2=A0 Alternatively, y=
ou can reply to this mail directly.<br></p><p>Agenda items appreciated a fe=
w days before the call: please put your name besides items if you edit the =
document.<br></p><p>Note the following administrative conventions for the c=
all:<br>* Unless, agreed in the previous meeting otherwise, the call is on =
the 1st Thursday of each month at 1600 British Time (either GMT or BST)<br>=
* I usually send out a meeting reminder a few days before with a provisiona=
l agenda<br></p><p>* To allow time to switch between meetings, we&#39;ll pl=
an on starting the agenda at 16:05 sharp.=C2=A0 Aim to join by 16:03 if pos=
sible to allocate time to sort out technical difficulties &amp;c</p><p>* If=
 you want to be CC&#39;ed please add or remove yourself from the sign-up-sh=
eet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6R=
FPz0sRCf+/">https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/<=
/a><br></p><p>Best Regards<br>George<br></p><p><br></p><p>=3D=3D Dial-in In=
formation =3D=3D<br>## Meeting time<br>16:00 - 17:00 UTC<br>Further Interna=
tional meeting times:=C2=A0<a href=3D"https://www.timeanddate.com/worldcloc=
k/meetingdetails.html?year=3D2020&amp;month=3D4&amp;day=3D2&amp;hour=3D15&a=
mp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179"=
></a><a href=3D"https://www.timeanddate.com/worldclock/meetingdetails.html?=
year=3D2021&amp;month=3D04&amp;day=3D8&amp;hour=3D15&amp;min=3D0&amp;sec=3D=
0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179"></a><a href=3D"https=
://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2023&amp;month=
=3D1&amp;day=3D12&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p=
2=3D37&amp;p3=3D224&amp;p4=3D179">https://www.timeanddate.com/worldclock/me=
etingdetails.html?year=3D2023&amp;month=3D1&amp;day=3D12&amp;hour=3D16&amp;=
min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179</a>=
<br></p><p><br>## Dial in details<br>Web:=C2=A0<a href=3D"https://meet.jit.=
si/XenProjectCommunityCall">https://meet.jit.si/XenProjectCommunityCall</a>=
<br></p><p>Dial-in info and pin can be found here:<br></p><p><a href=3D"htt=
ps://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall">htt=
ps://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall</a><=
/p></div>

--0000000000003d17af05f18477c6--

