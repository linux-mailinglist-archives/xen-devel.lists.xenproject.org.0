Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FA842726
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 15:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673489.1047838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpSB-0005hu-UW; Tue, 30 Jan 2024 14:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673489.1047838; Tue, 30 Jan 2024 14:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpSB-0005fz-RZ; Tue, 30 Jan 2024 14:51:11 +0000
Received: by outflank-mailman (input) for mailman id 673489;
 Tue, 30 Jan 2024 14:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/A0=JI=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rUpSA-0005fk-7H
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 14:51:10 +0000
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [2a00:1450:4864:20::543])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffd56700-bf7e-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 15:51:07 +0100 (CET)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-55783b7b47aso4862725a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 06:51:07 -0800 (PST)
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
X-Inumbo-ID: ffd56700-bf7e-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706626267; x=1707231067; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8lbpZAkXPHV7sHf+a2gF2ahdAgO1gk75VTx+qXCQrXo=;
        b=YiR9XvSdCUeoGJx6G/IRfcjTY/VgdIsIpzSbyWrTThThtcepfWJk+MHQ+PUuA4lx36
         l8Ml8BeXKNjvX4BIx7lUDLYO1LCnYzkkxXVAdIqs6iEGOcSh0/JOrAVwBpBPFySiD/mn
         ZlPHqoKGbfeuVi9ldg6AI3aiZoKR5k2X3Y784=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626267; x=1707231067;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8lbpZAkXPHV7sHf+a2gF2ahdAgO1gk75VTx+qXCQrXo=;
        b=lcC703JDIP5aGV2i4Xe8WjcN0CQmWkTyQDmwAio6P7dcSxmA6Q/PkjqCW91OiCeMXZ
         JK4GVTQ5g2Sa0itQeMYcmIJcjItfcf2MdYSNKt4buRC8ilwO7kzBxFbcv82GqbcIqNYh
         Rt7NOCVbhKUF7kPxJXmBXoizgDcRrrnTWNEvVXUN+dkg0L48m6lACCoZIdnJBqqA8x+8
         ypRtOHmHlka/tEhkemHqgHjLrcWLh0/AqT+s/jbfZOd68uyUnkJhjkfWkCh2r0NTEMna
         NOdO1bVrhaV+z5hO/hnLYBPUAONe7l0PKU/sYkijbITvumuJ2c4dXARBBeDa9qZAuPsw
         yDrQ==
X-Gm-Message-State: AOJu0YzoEpBdyU9k/sfMhmmer8T2xpeGmmldoti7vy8Ibip6c1Jg11CS
	eiHAKn2E5sKnKB6pAaBUcKVSz/L04cS+LF7iJf2ZHfXfDPZIl42tb/Ovq/kZi/HX0ZAzJeriMcp
	lkjeCXnNXIGBJuYvGCyg2h4GlYc3ih5hYwkGu7tSPTgtpBdHYB/mHytpV
X-Google-Smtp-Source: AGHT+IH4ro+9W0neN2FBQqIi1aav1yRSbZCmCLC85qCEP+MeMkhyBVeb0rwnmYpMWHdCwNZ6lmoeFHPqxjM0WNAeXaQ=
X-Received: by 2002:a05:6402:13cc:b0:55e:f9c4:129 with SMTP id
 a12-20020a05640213cc00b0055ef9c40129mr3809575edx.40.1706626266695; Tue, 30
 Jan 2024 06:51:06 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 30 Jan 2024 14:50:30 +0000
Message-ID: <CAO-mL=y4Li8i3Zu6egm4JfPuh39HzwqQy84V4+j8vkediM=2TA@mail.gmail.com>
Subject: [ANNOUNCE] Agenda for next community call
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000064289006102ae497"

--00000000000064289006102ae497
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below.

https://cryptpad.fr/pad/#/2/pad/edit/mc3pbD9Wghw16Gq1MGyn7mbe/

If any action items are missing or have been resolved, please add/remove
them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Thursday 1st February 2024*

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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=2&day=1&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000064289006102ae497
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><p>Please add your proposed agenda items b=
elow.</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/mc3pbD9Wghw16Gq=
1MGyn7mbe/" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/mc3pbD9W=
ghw16Gq1MGyn7mbe/</a><br></p><p>If any action items are missing or have bee=
n resolved, please add/remove them from the sheet.=C2=A0</p><p><b><span>CAL=
L</span>=C2=A0LINK:=C2=A0<a href=3D"https://www.google.com/url?q=3Dhttps://=
meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;source=3Dcalendar&amp;us=
t=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" target=3D"_bla=
nk">https://meet.jit.si/XenProjectCommunityCall</a></b></p><p><b>DATE: Thur=
sday 1st February 2024</b></p><p><b>TIME: 1600 UTC (4 pm UK time)</b></p>No=
te the following administrative conventions for the=C2=A0<span>call</span>:=
</div><div><br><div>* To allow time to switch between meetings, we plan on =
starting the<br>agenda at 16:05 UTC sharp.=C2=A0 Aim to join by 16:03 UTC i=
f possible to allocate<br>time to sort out technical difficulties.<br><br>*=
 If you want to be CC&#39;ed please add or remove yourself from the<br>sign=
-up-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPx=
xAOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/=
pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span>Dia=
l</span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00 British =
time<br>Further International meeting times:<br><a href=3D"https://www.time=
anddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D2&amp;da=
y=3D1&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p=
3=3D224&amp;p4=3D179" target=3D"_blank">https://www.timeanddate.com/worldcl=
ock/meetingdetails.html?year=3D2024&amp;month=3D2&amp;day=3D1&amp;hour=3D16=
&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D17=
9</a>=C2=A0=C2=A0=C2=A0<br><br>##=C2=A0<span>Dial</span>=C2=A0in details<br=
><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCom=
munityCall" rel=3D"noreferrer" target=3D"_blank">https://meet.jit.si/static=
/dialInInfo.html?room=3DXenProjectCommunityCall</a><div></div></div></div><=
div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Ch=
oi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Community=
 Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></=
div></div></div></div></div></div>

--00000000000064289006102ae497--

