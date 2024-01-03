Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08762822F5E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 15:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660958.1030652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL298-0008V3-Cn; Wed, 03 Jan 2024 14:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660958.1030652; Wed, 03 Jan 2024 14:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL298-0008Rn-9l; Wed, 03 Jan 2024 14:23:02 +0000
Received: by outflank-mailman (input) for mailman id 660958;
 Wed, 03 Jan 2024 14:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lN8p=IN=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rL297-0008Rh-Er
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 14:23:01 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9833bc65-aa43-11ee-9b0f-b553b5be7939;
 Wed, 03 Jan 2024 15:22:59 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-556c3f0d6c5so893652a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jan 2024 06:22:59 -0800 (PST)
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
X-Inumbo-ID: 9833bc65-aa43-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704291778; x=1704896578; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sfUd50JuQ7t5eBNDEI5gQYk96jpnuEgj/78a/sZUKgg=;
        b=Hw5RJHBdML0NfeG7RCMXrUvzOoX5MUpYcRd2wKQ83IR7fk1pp5IW/lxBzhVwINzRTx
         hy6FxwmLmk7w4fnuIF27uEUNozIEV/4rQ1ph+EZ+Zxd5WJ99f3ueM3VNm8vlMQuHv+FU
         Pp/1hNHKbthWr/kLXGFYta/9rZaN1E1ghlZj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704291778; x=1704896578;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sfUd50JuQ7t5eBNDEI5gQYk96jpnuEgj/78a/sZUKgg=;
        b=gjxRKKgDE6rA969EApcO4elWVNohQRDFDvQHSlhFDebC94jqxeP6XRf6DmBIMbWVLm
         Az8X9j00hTxASx9zYzDbpIP8CiqfPjFNa9YyKUpVjuP1mGyjc97gva9yv0SQfU6jhjpH
         bhR+wLFcItEKOFkiqmWQQJCbg0w5WmRaMlrGVRXkw86SixePM3Cu0J4a97M5LpjoLoZW
         CSsQ2N6c/Md0VfCYQUlvPrsIRsPEK6rHbwAIaTrVwCCK88kzrGtKLW7THVceuWguZh4R
         ncWYiZ9BaW+wxs+5B8aLrgt4ZdiN2RNgkNFB0hT9R6uPeehINp2RQCWGOIWSo5B94abA
         u5Pw==
X-Gm-Message-State: AOJu0YxM+FMZrlW9YaZC92Fdg193il54u3pHRG1cyac8O5DRGQnyas0X
	ZFGaTdDUsUM6Fxx2B5lzKAgyxNLFmmhObr4oJ1qaSl6mlMVP7lkXvMMnhQAEgjqCvsQN
X-Google-Smtp-Source: AGHT+IGiWfVumdl4kz71qOxQtdR5gjLwAZfSH4PxfevQ1UPZ3L0gzkRRfDuXnwOep7jjy8kg8caMieVRFQTPR+BWA/M=
X-Received: by 2002:a50:c111:0:b0:556:c883:4763 with SMTP id
 l17-20020a50c111000000b00556c8834763mr312030edf.119.1704291778128; Wed, 03
 Jan 2024 06:22:58 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 3 Jan 2024 14:22:21 +0000
Message-ID: <CAO-mL=zSuaajjj7Ynxfvf9YhV5sR+M=njdxzCXYA9Pty1kw4Gg@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for Community Call @ 1600 UTC, 18th
 Jan 2024
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000078885060e0b5abe"

--000000000000078885060e0b5abe
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda and name next to any items in this *link
here* <https://cryptpad.fr/pad/#/2/pad/edit/FoIa1svj6GD4rYr-H2DtEn9c/>

If any action items have been resolved, please remove them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Postponing till 18th January 2024 to allow everyone on PTO to join *

*TIME: 1600 UTC (4 pm UK time)*
Note the following administrative conventions for the call:

* To allow time to switch between meetings, we plan on starting the
agenda at 16:05 UTC sharp.  Aim to join by 16:03 UTC if possible to allocate
time to sort out technical difficulties.

* If you want to be CC'ed please add or remove yourself from the
sign-up-sheet at
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

== Dial-in Information ==
## Meeting time
16:00 - 17:00 British time
Further International meeting times:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=1&day=18&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000078885060e0b5abe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><p>Please add your proposed agenda and name nex=
t to any items in this=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit=
/FoIa1svj6GD4rYr-H2DtEn9c/" target=3D"_blank"><b>link here</b></a>=C2=A0</p=
><p>If any action items have been resolved, please remove them from the she=
et.=C2=A0</p><p><b><span class=3D"gmail-il">CALL</span>=C2=A0LINK:=C2=A0<a =
href=3D"https://www.google.com/url?q=3Dhttps://meet.jit.si/XenProjectCommun=
ityCall&amp;sa=3DD&amp;source=3Dcalendar&amp;ust=3D1699196661201312&amp;usg=
=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" target=3D"_blank">https://meet.jit.si/XenP=
rojectCommunityCall</a></b></p><p><b>DATE: Postponing till 18th January 202=
4 to allow everyone on PTO to join=C2=A0</b></p><p><b>TIME: 1600 UTC (4 pm =
UK time)</b></p>Note the following administrative conventions for the=C2=A0=
<span class=3D"gmail-il">call</span>:<div><br>* To allow time to switch bet=
ween meetings, we plan on starting the<br>agenda at 16:05 UTC sharp.=C2=A0 =
Aim to join by 16:03 UTC if possible to allocate<br>time to sort out techni=
cal difficulties.<br><br>* If you want to be CC&#39;ed please add or remove=
 yourself from the<br>sign-up-sheet at=C2=A0<a href=3D"https://cryptpad.fr/=
pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_b=
lank">https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br=
><br>=3D=3D=C2=A0<span class=3D"gmail-il">Dial</span>-in Information =3D=3D=
<br>## Meeting time<br>16:00 - 17:00 British time<br>Further International =
meeting times:<br><a href=3D"https://www.timeanddate.com/worldclock/meeting=
details.html?year=3D2024&amp;month=3D1&amp;day=3D18&amp;hour=3D16&amp;min=
=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179">https=
://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=
=3D1&amp;day=3D18&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p=
2=3D37&amp;p3=3D224&amp;p4=3D179</a><br><br>##=C2=A0<span class=3D"gmail-il=
">Dial</span>=C2=A0in details<br><a href=3D"https://meet.jit.si/static/dial=
InInfo.html?room=3DXenProjectCommunityCall" rel=3D"noreferrer" target=3D"_b=
lank">https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunity=
Call</a><div class=3D"gmail-yj6qo"></div><br class=3D"gmail-Apple-interchan=
ge-newline"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Cho=
i</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Community =
Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></d=
iv></div></div></div></div></div></div>

--000000000000078885060e0b5abe--

