Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE2693EF48
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 10:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766357.1176853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLJC-0001QY-GD; Mon, 29 Jul 2024 08:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766357.1176853; Mon, 29 Jul 2024 08:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLJC-0001NW-CE; Mon, 29 Jul 2024 08:00:42 +0000
Received: by outflank-mailman (input) for mailman id 766357;
 Mon, 29 Jul 2024 08:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2PyK=O5=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sYLJB-0001NL-4S
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 08:00:41 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5971792-4d80-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 10:00:40 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52efe4c7c16so4509733e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 01:00:40 -0700 (PDT)
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
X-Inumbo-ID: a5971792-4d80-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722240039; x=1722844839; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v+fGOGCd2qFL5BV0AyxUeQOj9yUyE03oPQ7rwv3EXQo=;
        b=OwD03sIzONqvkL3AN0fuijJifkHmuGDg+XZHPKffwaFq0SOzbXbfsqEYb74lAeq2m9
         RSYstTtqHWdlgydYBrST3uP9E0TXcpBG6Fdcwcb1vFSAciEAxK2MUGF9XO+8yPotshrs
         Xyo8/UrqZhKQqYC4/4i7wkuKg/2ffZMEHWzAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722240039; x=1722844839;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+fGOGCd2qFL5BV0AyxUeQOj9yUyE03oPQ7rwv3EXQo=;
        b=MIKYC1SIuTGOCABYeOdzcXuwDInjnea+IDKY6PSSJcJ+nizi8jWbgYdLs4/NMhBDTL
         e2ck4+YnYwYcNAlxH1G33X9uagRYSAeI24V8jAurqhm1BCfqru/kQp2UWe/NZpaeLRH8
         CAeAqASsi8V9UrOoTTNHjFq3oYOS6JhH3bwOwCWP77EMSskEAi3ibgcLXNSIPvRvEg3p
         aWL0lc6/kDyrZ9UzP//zcASI9k1jX1VVEIi/EGP2XIWHpxfhJic72UITKGkUxrSZC+Ud
         Vc7F5UpZ+SXH95fh41ngLIkThQKl15V0wKstXXnrpHuj5XBw+B4Bwwvm0ezJisyI8Yky
         09jg==
X-Gm-Message-State: AOJu0Yw4v13DgbjWajSvzxCZ3Cqh8cJ3N26RY2/aU7Gqvk8f6MiE1VBL
	g4cQLWnlgl1EqEGaaZ+SVh2QOxB9Zq0uROpxFHF8CW2peHbiHl0qSHfO8JFyy26N2uKcZDCsNZf
	16AbqmW/qVsDh91JPkIaeZ+RvxlHHw6Pg4nlFLxePDnfdupTsN30qEBGkq9Y=
X-Google-Smtp-Source: AGHT+IHU8w3PCBeOHoSvatmuWtGzo4NOxXh1713jK9MfIgMJXm4/JB57vOcb8jn7eYo+cFuuBPgStJikztnU/NLbIkE=
X-Received: by 2002:ac2:4558:0:b0:52e:be2c:4b05 with SMTP id
 2adb3069b0e04-5309b27d284mr3674453e87.21.1722240038806; Mon, 29 Jul 2024
 01:00:38 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 29 Jul 2024 09:00:00 +0100
Message-ID: <CAO-mL=y6W0xo=3hmhS1tCw5ywB_s8dZ2eWAsJH=L2yQhJ30ujQ@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 1st August 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000bb557f061e5e410c"

--000000000000bb557f061e5e410c
Content-Type: text/plain; charset="UTF-8"

Hi all,

*Please add your proposed agenda items below.*

https://cryptpad.fr/pad/#/2/pad/edit/VxQ65XLa-w4D3D9z9ipZInnC/

**Please can a community member help host and record the call this month as
I will be out of office**

If any action items are missing or have been resolved, please add/remove
them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Thursday 1st August 2024*

*TIME: 1500 UTC (4 pm UK time)*
*Note the following administrative conventions for the call:*


** To allow time to switch between meetings, we plan on starting theagenda
at 15:05 UTC sharp.  Aim to join by 15:03 UTC if possible to allocatetime
to sort out technical difficulties.*








** If you want to be CC'ed please add or remove yourself from
thesign-up-sheet
at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>== Dial-in
Information ==## Meeting time16:00 - 17:00 British timeFurther
International meeting times:*
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=8&day=1=4&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000bb557f061e5e410c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><p><u>Please add your proposed agenda item=
s below.</u>=C2=A0</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/Vx=
Q65XLa-w4D3D9z9ipZInnC/">https://cryptpad.fr/pad/#/2/pad/edit/VxQ65XLa-w4D3=
D9z9ipZInnC/</a>=C2=A0<br></p><p><font color=3D"#ff0000"><b>*Please can a c=
ommunity member help host and record the call this month as I will be out o=
f office*</b></font></p><p>If any action items are missing or have been res=
olved, please add/remove them from the sheet.=C2=A0</p><p><b><span class=3D=
"gmail-il">CALL</span>=C2=A0LINK:=C2=A0<a href=3D"https://www.google.com/ur=
l?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;source=3Dc=
alendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" =
target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></b></p><p=
><b>DATE: Thursday 1st August 2024</b></p><p><b>TIME: 1500 UTC (4 pm UK tim=
e)</b></p><i>Note the following administrative conventions for the=C2=A0<sp=
an class=3D"gmail-il">call</span>:</i></div><div><div><i>* To allow time to=
 switch between meetings, we plan on starting the<br>agenda at 15:05 UTC sh=
arp.=C2=A0 Aim to join by 15:03 UTC if possible to allocate<br>time to sort=
 out technical difficulties.</i></div><div><i><br>* If you want to be CC&#3=
9;ed please add or remove yourself from the<br>sign-up-sheet at=C2=A0<a hre=
f=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" rel=3D=
"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/D9vGzih=
PxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span class=3D"gmail-il">Dial</sp=
an>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00 British time<=
br>Further International meeting times:<br></i><a href=3D"https://www.timea=
nddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D8&amp;day=
=3D1=3D4&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&am=
p;p3=3D224&amp;p4=3D179" target=3D"_blank">https://www.timeanddate.com/worl=
dclock/meetingdetails.html?year=3D2024&amp;month=3D8&amp;day=3D1=3D4&amp;ho=
ur=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;=
p4=3D179</a><br><br>##=C2=A0<span class=3D"gmail-il">Dial</span>=C2=A0in de=
tails<br><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenPr=
ojectCommunityCall" rel=3D"noreferrer" target=3D"_blank">https://meet.jit.s=
i/static/dialInInfo.html?room=3DXenProjectCommunityCall</a></div></div><div=
><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div dir=3D"ltr"><div><br></div><div>Many thanks,</div><div>Kelly Choi<=
/div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Community Ma=
nager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div=
></div></div></div></div></div>

--000000000000bb557f061e5e410c--

