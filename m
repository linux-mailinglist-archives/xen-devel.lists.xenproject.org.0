Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D8903D31
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 15:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738402.1145169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1VI-0003Ge-1Q; Tue, 11 Jun 2024 13:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738402.1145169; Tue, 11 Jun 2024 13:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1VH-0003EI-To; Tue, 11 Jun 2024 13:25:35 +0000
Received: by outflank-mailman (input) for mailman id 738402;
 Tue, 11 Jun 2024 13:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t3ge=NN=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sH1VG-0002n8-IJ
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 13:25:34 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14e7437f-27f6-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 15:25:33 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so1344533a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 06:25:33 -0700 (PDT)
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
X-Inumbo-ID: 14e7437f-27f6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718112333; x=1718717133; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3T80f/U57WIOBBnkYbt17B9SaLcZhGHQ8mzVH8zpSHo=;
        b=fna2WouTmi4/oSNTIjGfVDpN+ntXt6dPHn9vOy+UnefDmddXK4xDD6p8kv1vtsMP9w
         7ps1SdYxE2+RYSqFXmbc27+lSiOYbnzShuUBw9cwqTtOxQ8xfjk5D/CLhqdxQA2QPGy2
         MK1qlpfTOK7UK7/c7c95TnCZ+o0CpUTHLdve8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112333; x=1718717133;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3T80f/U57WIOBBnkYbt17B9SaLcZhGHQ8mzVH8zpSHo=;
        b=Tq28M7JhF1tdaoPNDiS8Lhb/AnQiYSSo6sD+OSD4btFaauybBfjU43ipAfG8pUMkjX
         CLUCzwDHRViE8trPormHrxQN1BnGqN1PfvuU1Runlt+qhMkITlFuO4BtCcY0sK981mD7
         saSDi2o9Bt8az8wdk5y4jXlLlH+lNzs4Tv2c+58kkyl8fs4LyR6MmwEeqpqDa0f+zAHc
         9M6pmJrMI/4WGRvsj3C7FJMB7gWy3bcMP11fkyVp1M7e1ReDP6QzXMcbKV5rGGAangaY
         +ULizM8ZJIpY4slLDwOT15IBeQ88GIiqrJNTiGByYntsF/7zmhQBn2XlC7aTOCMQl2Oa
         YvYw==
X-Gm-Message-State: AOJu0YyWg1/WVJLXFeB6f0gRK10iPai2mDeJgT0s/5EqK7x9hecbavIv
	3rcRaWupc64MbE/zsd+6pnP98rXS7kuJ1OLtJvHw4zU9TnH6S0tOW60NgK0Gwu+u9tT4t51WqWk
	e04ftzFuP8xDh5pxX/KOD8qeNQ+6azKvoe5qEdC35LRxcXopcXeIJ5UXT
X-Google-Smtp-Source: AGHT+IGaS9CUpsVER0k0bf3BjYsivGWZXHGyR11QL/4m+NsL8970f4EJtFs8daUXKhhanWBQRyulx2KnhbxOl8Q0fEI=
X-Received: by 2002:a50:a419:0:b0:57c:7676:ea4d with SMTP id
 4fb4d7f45d1cf-57c7676ec61mr3571638a12.13.1718112332577; Tue, 11 Jun 2024
 06:25:32 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 11 Jun 2024 14:24:56 +0100
Message-ID: <CAO-mL=xMsBa=Gndq6sPkC3_JRnJiV5YeMZTqGxS2Nu_n61rMxg@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 13th June 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000044ada9061a9d33cc"

--00000000000044ada9061a9d33cc
Content-Type: text/plain; charset="UTF-8"

Hi all,

*Please add your proposed agenda items below.*

https://cryptpad.fr/pad/#/2/pad/edit/Uj1NJNpA9pgpXJJ54dyuqhDQ/

If any action items are missing or have been resolved, please add/remove
them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Thursday 13th June 2024*

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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=6&day=13=4&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000044ada9061a9d33cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi all,<br><p><u>Please add your proposed agenda=
 items below.</u>=C2=A0</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/ed=
it/Uj1NJNpA9pgpXJJ54dyuqhDQ/">https://cryptpad.fr/pad/#/2/pad/edit/Uj1NJNpA=
9pgpXJJ54dyuqhDQ/</a>=C2=A0<br></p><p>If any action items are missing or ha=
ve been resolved, please add/remove them from the sheet.=C2=A0</p><p><b>CAL=
L=C2=A0LINK:=C2=A0<a href=3D"https://www.google.com/url?q=3Dhttps://meet.ji=
t.si/XenProjectCommunityCall&amp;sa=3DD&amp;source=3Dcalendar&amp;ust=3D169=
9196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" target=3D"_blank">htt=
ps://meet.jit.si/XenProjectCommunityCall</a></b></p><p><b>DATE: Thursday 13=
th June 2024</b></p><p><b>TIME: 1500 UTC (4 pm UK time)</b></p><i>Note the =
following administrative conventions for the=C2=A0call:</i></div><div><div>=
<i>* To allow time to switch between meetings, we plan on starting the<br>a=
genda at 15:05 UTC sharp.=C2=A0 Aim to join by 15:03 UTC if possible to all=
ocate<br>time to sort out technical difficulties.</i></div><div><i><br>* If=
 you want to be CC&#39;ed please add or remove yourself from the<br>sign-up=
-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAO=
e6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad=
/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0Dial-in Info=
rmation =3D=3D<br>## Meeting time<br>16:00 - 17:00 British time<br>Further =
International meeting times:<br></i><a href=3D"https://www.timeanddate.com/=
worldclock/meetingdetails.html?year=3D2024&amp;month=3D6&amp;day=3D13=3D4&a=
mp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224=
&amp;p4=3D179" target=3D"_blank">https://www.timeanddate.com/worldclock/mee=
tingdetails.html?year=3D2024&amp;month=3D6&amp;day=3D13=3D4&amp;hour=3D15&a=
mp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179<=
/a><br><br>##=C2=A0Dial=C2=A0in details<br><a href=3D"https://meet.jit.si/s=
tatic/dialInInfo.html?room=3DXenProjectCommunityCall" rel=3D"noreferrer" ta=
rget=3D"_blank">https://meet.jit.si/static/dialInInfo.html?room=3DXenProjec=
tCommunityCall</a><div></div></div></div><div><br></div></div><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div=
><div style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D=
"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div=
></div>

--00000000000044ada9061a9d33cc--

