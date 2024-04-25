Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5068B1D4B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 11:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711932.1112296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzv0Z-000794-FW; Thu, 25 Apr 2024 09:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711932.1112296; Thu, 25 Apr 2024 09:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzv0Z-00075L-AA; Thu, 25 Apr 2024 09:03:11 +0000
Received: by outflank-mailman (input) for mailman id 711932;
 Thu, 25 Apr 2024 09:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dwVJ=L6=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rzv0Y-000728-DQ
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 09:03:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1e9586c-02e2-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 11:03:08 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5872b74c44so80895266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 02:03:07 -0700 (PDT)
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
X-Inumbo-ID: a1e9586c-02e2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714035787; x=1714640587; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ItDmTkPqS4kA5MEJEvHYA6mgW8bpmqcGQZX9ai8pcw0=;
        b=cIx+s3NDLt47mxTmIl1L8tHbVkjJ2eltn8vGIfiqS0Ha6mYZlUSdsfQGKdREGuNyzb
         C0fKTbgASRPvL1qdi0KwksEP0NRdQ+LwNpO+m+GimPWFfLM78v2MzoTB3luRBhLVEXqQ
         g49HHFWJPYWgaz6lWeEdeY+j2+IK0Ix6tNmuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714035787; x=1714640587;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ItDmTkPqS4kA5MEJEvHYA6mgW8bpmqcGQZX9ai8pcw0=;
        b=tKfQ2iq4EeemAtzqRvEhcqDBFhiBwvQ+duv1JBZTJYwALWkbA9sNedkkKnFbcLnpzf
         s8ibnAnzNjBUAoMRNTPN3CPCTl2ZT8p+9wPMUtCCOP71XmxGBaTwzIn9TJzpa5cgullN
         kX6yiwjpM2Wbj/inK2fdzn4dJbUdrP0vyWNCSsATRdhmgpO/ji4IQeG7UnBnOhM6sKC4
         d2fBbQc1tY4oMNfylPT4B374+FTlxyGeaFLG8thpWIGFRAI5rVNUy1KNj1wqAaQfmQ5u
         zm3Sn5qMXZXPQEmK35R+7wZ2Wlzp/wf25Jv7Ju+xiXPdoboVmZb6XkY9plvKFIAm6lIy
         nqhQ==
X-Gm-Message-State: AOJu0YwYb/xbF3hQoTkGE9RWVb7USlUi7PD51B6niZtJzDOvL5+xgP3Y
	Wkzc4BA7Fxsf9wgc8vmmNNOl43/q3gwAa35xKJBmFEwkXw2hy7BsY7lrJUG8n+RmBVFbKYejT2+
	QuLWi3zxosLk/T6FGXrggxyvKJwNuOSn/ba7hgSlWex4UtxZMxMS6FA==
X-Google-Smtp-Source: AGHT+IH+gHKsn6HbMMNXsm69ls7vzRiXcyLJ91aZu3InF/1z6Ogv65pgAt9lPopbqSf/MiRkDE1crJRQW/nsvDXPeZU=
X-Received: by 2002:a17:906:4353:b0:a52:33b0:fcb1 with SMTP id
 z19-20020a170906435300b00a5233b0fcb1mr2958359ejm.32.1714035786629; Thu, 25
 Apr 2024 02:03:06 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 25 Apr 2024 10:02:30 +0100
Message-ID: <CAO-mL=wk729ZVWouO2F3zueVT=mPqFMfa8txKiFpd5=m+R7y0Q@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - May 2024 Community Call
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000031e7980616e80e8a"

--00000000000031e7980616e80e8a
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below.

https://cryptpad.fr/pad/#/2/pad/edit/FluG1Qk1UTGr3CdvJBXTk6AF/

If any action items are missing or have been resolved, please add/remove
them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Thursday 2nd May 2024*

*TIME: 1500 UTC (4 pm UK time)*
*Note the following administrative conventions for the call:*












** To allow time to switch between meetings, we plan on starting theagenda
at 16:05 UTC sharp.  Aim to join by 16:03 UTC if possible to allocatetime
to sort out technical difficulties.* If you want to be CC'ed please add or
remove yourself from thesign-up-sheet
at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>== Dial-in
Information ==## Meeting time16:00 - 17:00 British timeFurther
International meeting times:*
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=5&day=2&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000031e7980616e80e8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div><div>Hi all,<br><p>Please add=
 your proposed agenda items below.</p><p><a href=3D"https://cryptpad.fr/pad=
/#/2/pad/edit/FluG1Qk1UTGr3CdvJBXTk6AF/">https://cryptpad.fr/pad/#/2/pad/ed=
it/FluG1Qk1UTGr3CdvJBXTk6AF/</a>=C2=A0<br></p><p>If any action items are mi=
ssing or have been resolved, please add/remove them from the sheet.=C2=A0</=
p><p><b>CALL=C2=A0LINK:=C2=A0<a href=3D"https://www.google.com/url?q=3Dhttp=
s://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;source=3Dcalendar&am=
p;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" target=3D"=
_blank">https://meet.jit.si/XenProjectCommunityCall</a></b></p><p><b>DATE: =
Thursday 2nd May 2024</b></p><p><b>TIME: 1500 UTC (4 pm UK time)</b></p><i>=
Note the following administrative conventions for the=C2=A0call:</i></div><=
div><i><br></i></div><div><div><i>* To allow time to switch between meeting=
s, we plan on starting the<br>agenda at 16:05 UTC sharp.=C2=A0 Aim to join =
by 16:03 UTC if possible to allocate<br>time to sort out technical difficul=
ties.<br><br>* If you want to be CC&#39;ed please add or remove yourself fr=
om the<br>sign-up-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/=
edit/D9vGzihPxxAOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https:=
//cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=
=C2=A0Dial-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00 Britis=
h time<br>Further International meeting times:<br></i><a href=3D"https://ww=
w.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D5&=
amp;day=3D2&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37=
&amp;p3=3D224&amp;p4=3D179">https://www.timeanddate.com/worldclock/meetingd=
etails.html?year=3D2024&amp;month=3D5&amp;day=3D2&amp;hour=3D15&amp;min=3D0=
&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179</a>=C2=A0<=
br><br>##=C2=A0Dial=C2=A0in details<br><a href=3D"https://meet.jit.si/stati=
c/dialInInfo.html?room=3DXenProjectCommunityCall" rel=3D"noreferrer" target=
=3D"_blank">https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCom=
munityCall</a><div></div></div></div><div><br></div></div></div></div></div=
></div></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Cho=
i</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Community =
Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></d=
iv></div></div></div></div></div>

--00000000000031e7980616e80e8a--

