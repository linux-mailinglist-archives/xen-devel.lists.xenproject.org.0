Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73988A4C26B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 14:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900298.1308207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6DW-0007RO-Mn; Mon, 03 Mar 2025 13:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900298.1308207; Mon, 03 Mar 2025 13:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6DW-0007Od-Jo; Mon, 03 Mar 2025 13:52:22 +0000
Received: by outflank-mailman (input) for mailman id 900298;
 Mon, 03 Mar 2025 13:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KmY=VW=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tp6DV-0007OX-A7
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 13:52:21 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b97b7739-f836-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 14:52:19 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-abf4b376f2fso354442666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 05:52:19 -0800 (PST)
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
X-Inumbo-ID: b97b7739-f836-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741009939; x=1741614739; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QPnh8amj6enWKzIhR062+TBgsv+8vsn9HyG1cXAF+c8=;
        b=aEQ/jkTnNc1AmLySHZbGHooLIblph74R0NT5QHFbGs6x1M0czpD7FTfJ2DITd0zVtT
         GBBj44td0Wz0ai6h5FTP71jt2rm2WaR67Lrhx7IROCe6YZZu8uzphJaZMchpqq0LeG0e
         AyFYPDZwaOiUOvTgQYZbmRwtrBM1s9jyZHZOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741009939; x=1741614739;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPnh8amj6enWKzIhR062+TBgsv+8vsn9HyG1cXAF+c8=;
        b=NH1WfvYGtOMgRNShZHjTXi62aOJOir98F3Do/pNmR51RGR3js7zHaAgHDUpQJ1ksdk
         zwUOnE4w0VAhysu5k3F6UnAB18DbwdEc2AikWr9BunaefZ026YUH7roEXt7nflZKj97D
         sQIQHPSeCLIya8n0MSs0nInT02za8Uz8/HPltTfV03PE3mpK3ZgqoWQGDuY4C6cdpWsT
         ebvzkzej27PepMhWAgeWFVmgvStj6IZY+uBd5pgw9RLuWQSxDeCAUHYRyYeYWEK2SeAO
         nIyPGM00LQ9PkdiSGBwYTe8wpLCxOdUVNvcujE/shJY6MaOmKGJ3lv6t2i3bPM8TWXor
         qK0g==
X-Gm-Message-State: AOJu0YxDQigaqIOaEKn0eeyGC7wiLxTP4MZT71qZVetFKTfBYyPKrjHb
	0LVk+JJwWuhmiZOSkDQEpFw3Oxne2Iluf2ZtCSFinz06pMzp3Id24iT0bdmC/dt3PBtjI6/fBvY
	yGPYSbiS94nVAikJICtRFbZ/aHZyCkc7XoZxum/s9/zGD5XgnTw+3HA==
X-Gm-Gg: ASbGncvjaDW3esUvR1NE6NVdIHypxy6a8uVR7PRqQczGvSgpxwjcrv3LBH4QcsmiGPK
	jOblw2GVH0t7zwNhx0u7nA/57RNKBlYwm1PfNbYAHVwCGKV2rl0rMDjUSIyhqH/A5xhJwth4sDT
	H/D6Be6vLvDAP2zwnLDTLi8F3ChB4gy2RtDtyvi52IKjD+2XJWxRsIk74Kf4I=
X-Google-Smtp-Source: AGHT+IFYz7oejKfNoztgWDzw36/uQaD6w0XRMLwoX2QMYH0g6a7+xn4adMtqYqaauCAV6lbi1LzPdXe2zDNkIHgoPmE=
X-Received: by 2002:a17:907:7f25:b0:abf:7a26:c47b with SMTP id
 a640c23a62f3a-abf7a26c60bmr320980866b.39.1741009938613; Mon, 03 Mar 2025
 05:52:18 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 3 Mar 2025 13:51:42 +0000
X-Gm-Features: AQ5f1JoORI4O7QoY26oiFHIIvFLl-e6lagIjzPJuDCeRbnw-Twq5n4H7YKnj8DY
Message-ID: <CAO-mL=zHSabDAt5faxWgsH7aFjnAQUAd25OgA-GMxyrCynKC5A@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 6th March 2025
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000f1305d062f7076c4"

--000000000000f1305d062f7076c4
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below. If any action items are
missing or have been resolved, please add/remove them from the sheet.

https://cryptpad.fr/pad/#/2/pad/edit/5aJq20OOLdSZ+nspYGPpVWYr/

*CALL LINK:* https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>

*DATE: *Thursday 6th March 2025

*TIME: *1600 UTC (4 pm UK time)
*Note the following administrative conventions for the call:*


** To allow time to switch between meetings, we plan on starting theagenda
at 16:05 UTC sharp.  Aim to join by 16:03 UTC if possible to allocatetime
to sort out technical difficulties.*








** If you want to be CC'ed please add or remove yourself from
thesign-up-sheet
at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>== Dial-in
Information ==## Meeting time16:00 - 17:00 British timeFurther
International meeting
times:*https://www.timeanddate.com/worldclock/meetingdetails.html?year=2025&month=3&day=6&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--000000000000f1305d062f7076c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,=C2=A0</div><div><div><p>Please add your propo=
sed agenda items below. If any action items are missing or have been resolv=
ed, please add/remove them from the sheet.=C2=A0</p><p><a href=3D"https://c=
ryptpad.fr/pad/#/2/pad/edit/5aJq20OOLdSZ+nspYGPpVWYr/">https://cryptpad.fr/=
pad/#/2/pad/edit/5aJq20OOLdSZ+nspYGPpVWYr/</a>=C2=A0</p><p><b><span class=
=3D"gmail-il">CALL</span>=C2=A0LINK:</b>=C2=A0<a href=3D"https://www.google=
.com/url?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;sou=
rce=3Dcalendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7=
V0cBc" target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></p=
><p><b>DATE:=C2=A0</b>Thursday 6th March 2025</p><p><b>TIME:=C2=A0</b>1600 =
UTC (4 pm UK time)</p><i>Note the following administrative conventions for =
the=C2=A0<span class=3D"gmail-il">call</span>:</i></div><div><div><i>* To a=
llow time to switch between meetings, we plan on starting the<br>agenda at =
16:05 UTC sharp.=C2=A0 Aim to join by 16:03 UTC if possible to allocate<br>=
time to sort out technical difficulties.</i></div><div><i><br>* If you want=
 to be CC&#39;ed please add or remove yourself from the<br>sign-up-sheet at=
=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sR=
Cf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/=
edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span class=3D"gmail-=
il">Dial</span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00 B=
ritish time<br>Further International meeting times:<br></i><a href=3D"https=
://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&amp;month=
=3D3&amp;day=3D6&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=
=3D37&amp;p3=3D224&amp;p4=3D179" target=3D"_blank">https://www.timeanddate.=
com/worldclock/meetingdetails.html?year=3D2025&amp;month=3D3&amp;day=3D6&am=
p;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&=
amp;p4=3D179  </a>=C2=A0<br><br>##=C2=A0<span class=3D"gmail-il">Dial</span=
>=C2=A0in details<br><a href=3D"https://meet.jit.si/static/dialInInfo.html?=
room=3DXenProjectCommunityCall" rel=3D"noreferrer" target=3D"_blank">https:=
//meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall</a></di=
v></div></div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks,</div><di=
v>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136,136)">Community =
Manager</div><div style=3D"color:rgb(136,136,136)"><a href=3D"https://xenpr=
oject.org/" target=3D"_blank">Xen Project</a><br></div></div></div></div></=
div></div>

--000000000000f1305d062f7076c4--

