Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F877DD0A1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 16:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625909.975688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqlm-0006Ud-MN; Tue, 31 Oct 2023 15:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625909.975688; Tue, 31 Oct 2023 15:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqlm-0006Ri-JX; Tue, 31 Oct 2023 15:35:06 +0000
Received: by outflank-mailman (input) for mailman id 625909;
 Tue, 31 Oct 2023 15:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSX0=GN=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1qxqll-0006Ra-HK
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 15:35:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 100f256a-7803-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 16:35:04 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso870849866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 08:35:04 -0700 (PDT)
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
X-Inumbo-ID: 100f256a-7803-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698766504; x=1699371304; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3KYXxOTKEr4IJ837N0t09kJUWHf+DVsFJvM9qAYdSo=;
        b=IeUQrl+PPrrdCU1CbxsrX0Q65KsEY/ArGN2O9+9gWyBpY9R1f0CbnNPA//W/SJR9wL
         Ul1Ft4w8UPHqHOUgyg73yv0HZ8Mb8t96smYeZ7/rJZIt4Q94wepF8Xnvdeafdi4MTccr
         DiktA4bDns5kLjV3XnDnK6xD+N8mPkB3Q7ENg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698766504; x=1699371304;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3KYXxOTKEr4IJ837N0t09kJUWHf+DVsFJvM9qAYdSo=;
        b=Ak2S4zi2w+HVeLMmKGmYQPHmsBgKiZcjHd3z0c5uTjAFSObPSj5iN0rkVhVxjoHrK3
         tFmXwMnmlMfvlMJvJQL1x100J1DzyOCG5URBOmCtOizctdYYNEKgayjmzvyJBt+c5IYY
         K7YLbPAMP3hLrIYsNvqDf1Xbf4dR+8Gd4OnZ1vsx91XVuXjvuIlXJxEVt5HIcbLUlvY7
         PXI2wZ/ODZp75Na1GvEGudeZ0LZq0RVhHkXYQgFgVPsiB4uDbsDzLY3ak1h/5DxDqK5g
         yZSm5riswUkoldCpMgso/4FLopSD983WFIhbCDFAKf/zahAAr7g8oVTFtMJCHoJFGXD4
         6aTQ==
X-Gm-Message-State: AOJu0Yy3+XnIdYk8M+w3maRJxlTRT9lwAAiwAFM13HiYX6fQvJRLdw+3
	Lg3QHIKDtGqRksZKJrAM1JTieG9P+f1qFF1QSSsENgGQwx4/8ZAvpUxSjP+0
X-Google-Smtp-Source: AGHT+IGmDoHoYvC0BjBxs6MQZaPXUH5w4GAeZuvVLlbZ2z5nA2Q99cjrLYvYnUleNBWuJNMmb4oE1y966sD56s8IIhA=
X-Received: by 2002:a17:906:c150:b0:9bf:63b2:b6f0 with SMTP id
 dp16-20020a170906c15000b009bf63b2b6f0mr10059409ejc.29.1698766503791; Tue, 31
 Oct 2023 08:35:03 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 31 Oct 2023 08:34:27 -0700
Message-ID: <CAO-mL=zv5bHvk+2GxDMxYxrqnsm4ORFTcT=rUGO7rQXzJgc4rw@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 2 November Community Call @
 16:00 GMT
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000003f68f060904e63d"

--00000000000003f68f060904e63d
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda and name next to any items in this *link
here* <https://cryptpad.fr/pad/#/2/pad/edit/2tlR6HPM95auHBaXHjMXCM8Q/>

If there are any action items that have been resolved, please remove them
from the sheet.

*COMMUNITY CALL INFORMATION*

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: 1st Thursday of each month*

*TIME: 16:00 British Time (either BST or GMT)*
*To allow time to switch between meetings, we will start at 16:05.  Aim to
join by 16:00 if possible to allocate time for technical difficulties etc. *

*SIGN UP SHEET:* Please add or remove yourself from the sign-up-sheet to be
CC'd in these emails in this *link here
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/> *

------------------------------------------------------------------------------------------------------------------------------

*Dial-in info and pin can be found here:*

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

*Meeting time:*

https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=11&day=2&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=10&day=5&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--00000000000003f68f060904e63d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi all,</p><p>Please add your proposed agenda and name =
next to any items in this <a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/2=
tlR6HPM95auHBaXHjMXCM8Q/"><b>link here</b></a>=C2=A0</p><p>If there are any=
 action items that have been resolved, please remove them from the sheet.=
=C2=A0</p><p><i style=3D""><b>COMMUNITY CALL INFORMATION</b></i></p><p><b>C=
ALL LINK:=C2=A0<a href=3D"https://www.google.com/url?q=3Dhttps://meet.jit.s=
i/XenProjectCommunityCall&amp;sa=3DD&amp;source=3Dcalendar&amp;ust=3D169919=
6661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" style=3D"cursor: auto;">=
https://meet.jit.si/XenProjectCommunityCall</a></b></p><p><b>DATE: 1st Thur=
sday of each month</b></p><p><b>TIME: 16:00 British Time (either BST or GMT=
)</b><br><i>To allow time to switch between meetings, we will start at 16:0=
5.=C2=A0 Aim to join by 16:00 if possible to allocate time for technical di=
fficulties etc.=C2=A0</i><br></p><p><b>SIGN UP SHEET:</b>=C2=A0Please add o=
r remove yourself from the sign-up-sheet to be CC&#39;d in these emails in =
this <b><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0=
sRCf+/">link here</a>=C2=A0</b></p><p>-------------------------------------=
---------------------------------------------------------------------------=
--------------</p><p><b>Dial-in info and pin can be found here:</b></p><p><=
a href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommu=
nityCall">https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommu=
nityCall</a></p><p><b>Meeting time:</b></p><p><a href=3D"https://www.timean=
ddate.com/worldclock/meetingdetails.html?year=3D2023&amp;month=3D10&amp;day=
=3D5&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=
=3D224&amp;p4=3D179" rel=3D"noreferrer" target=3D"_blank">https://www.timea=
nddate.com/worldclock/meetingdetails.html?year=3D2023&amp;month=3D11&amp;da=
y=3D2&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p=
3=3D224&amp;p4=3D179</a><br></p><div><div dir=3D"ltr" class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,<=
/div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,1=
36,136)">Open Source Community Manager</div><div style=3D"color:rgb(136,136=
,136)">XenServer, Cloud Software Group</div></div><div style=3D"color:rgb(1=
36,136,136)"><br></div></div></div></div></div>

--00000000000003f68f060904e63d--

