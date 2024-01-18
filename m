Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E301831ACE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 14:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668761.1041175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQSlX-0000t5-Pa; Thu, 18 Jan 2024 13:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668761.1041175; Thu, 18 Jan 2024 13:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQSlX-0000rC-N5; Thu, 18 Jan 2024 13:49:07 +0000
Received: by outflank-mailman (input) for mailman id 668761;
 Thu, 18 Jan 2024 13:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YzO2=I4=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rQSlW-0000r6-BF
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 13:49:06 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b723893-b608-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 14:48:17 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a28a997f3dfso921490566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 05:48:16 -0800 (PST)
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
X-Inumbo-ID: 3b723893-b608-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705585696; x=1706190496; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1WRU52iOvdInzP8A1XSNb/3ngHFP6I+/lXdWUhFpDk=;
        b=YwTZdQdT0XBxbQErhdr7BugN1VrJBT539Gp3amCdn8DheKbWFe/A+Mz1CL5pzdwmOS
         kmB2KTi/ADDAloGv+Ywmf1EQMCkUJblVlBB3x+c+ppxVR9GPs7wGsm5A+eEEuY751/3Z
         AFJUolClVtgkjtVx883ndAoYbv9PXagLlmjPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705585696; x=1706190496;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1WRU52iOvdInzP8A1XSNb/3ngHFP6I+/lXdWUhFpDk=;
        b=OLN9WuKHeCBhpM2HqSbFRdUURspUBVmO6FWsiLf/6y9iaW0JPMLSQIz3UL1erlzCCV
         Z6dJxsLE9/LoD3VtG4hz8QbxOD5ptlWofbxNDdXwuhlv2VmGywhgKMk65A8ROSDi7r3V
         Kjhl3zqaG5+5xhPUNBu7CHncsHyxuED9fsyj0GASxn4NetjFxXlMTiqEwdLwIthglC7I
         5wxHULhKx2mx0Xm++aZgtkA7HWWSp18prQQbcH6Wo/gQ0Usht6DrDi/Oo3CWEiXfSa3w
         FSa3I4Q+P8kEBm8cFTupHVzd+kCwjPPjg0OqgwPG2NR61y1ffnsVksPXUWwsG6kwbcai
         gXeg==
X-Gm-Message-State: AOJu0YyRCAqjBmUTDRPLE2hCt/j3TWbf20BVF/V2HafjCnHQJukihDHe
	w/vL2N0ZtA5Io0meK6rpTdT7XBVqSK+kkeGp/00RLbw7HPoTqiwzK+UYJgxb8GMZPM6ZbsK6FmQ
	x4SQnaX3fVm9FD3AKaznL3IJvM+BsegEb0A3pNc70ES602Rxs38WlEw==
X-Google-Smtp-Source: AGHT+IGkPKJeU/66fLkO0fR1xotYBFG+WW2Xt4eqWnxTkqwbta37GNXd5ON2bfw+z6qdY8Nwxg6X9ATBw44dLdcw3Fw=
X-Received: by 2002:a17:906:1392:b0:a28:b35d:f240 with SMTP id
 f18-20020a170906139200b00a28b35df240mr599202ejc.10.1705585696086; Thu, 18 Jan
 2024 05:48:16 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=zSuaajjj7Ynxfvf9YhV5sR+M=njdxzCXYA9Pty1kw4Gg@mail.gmail.com>
In-Reply-To: <CAO-mL=zSuaajjj7Ynxfvf9YhV5sR+M=njdxzCXYA9Pty1kw4Gg@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 18 Jan 2024 13:47:40 +0000
Message-ID: <CAO-mL=zVn4ewTK=b7zFR+uuf5hbuZPxYd4XB=ebx8+SACjQ=Ww@mail.gmail.com>
Subject: REMINDER: Community Call today @ 1600 UTC, 18th Jan 2024
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000008cb5c5060f389d05"

--0000000000008cb5c5060f389d05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

A reminder that we have our community call today.
Please find details below on how to join.

Many thanks,
Kelly Choi

Community Manager
Xen Project


---------- Forwarded message ---------
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, Jan 3, 2024 at 2:22=E2=80=AFPM
Subject: [ANNOUNCE] Call for agenda items for Community Call @ 1600 UTC,
18th Jan 2024
To: <xen-devel@lists.xenproject.org>


Hi all,

Please add your proposed agenda and name next to any items in this *link
here* <https://cryptpad.fr/pad/#/2/pad/edit/FoIa1svj6GD4rYr-H2DtEn9c/>

If any action items have been resolved, please remove them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=3Dhttps://meet.jit.si/XenProjectCommunityCall=
&sa=3DD&source=3Dcalendar&ust=3D1699196661201312&usg=3DAOvVaw1FcogEsMjFSd1P=
mi7V0cBc>*

*DATE: Postponing till 18th January 2024 to allow everyone on PTO to join *

*TIME: 1600 UTC (4 pm UK time)*
Note the following administrative conventions for the call:

* To allow time to switch between meetings, we plan on starting the
agenda at 16:05 UTC sharp.  Aim to join by 16:03 UTC if possible to allocat=
e
time to sort out technical difficulties.

* If you want to be CC'ed please add or remove yourself from the
sign-up-sheet at
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

=3D=3D Dial-in Information =3D=3D
## Meeting time
16:00 - 17:00 British time
Further International meeting times:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&mont=
h=3D1&day=3D18&hour=3D16&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D17=
9

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000008cb5c5060f389d05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>A reminder that we have our com=
munity call today.</div><div>Please find details below on how to join.</div=
><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><di=
v>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)"=
>Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=
=C2=A0<br></div></div></div></div></div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message --------=
-<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Kelly Choi</stro=
ng> <span dir=3D"auto">&lt;<a href=3D"mailto:kelly.choi@cloud.com">kelly.ch=
oi@cloud.com</a>&gt;</span><br>Date: Wed, Jan 3, 2024 at 2:22=E2=80=AFPM<br=
>Subject: [ANNOUNCE] Call for agenda items for Community Call @ 1600 UTC, 1=
8th Jan 2024<br>To:  &lt;<a href=3D"mailto:xen-devel@lists.xenproject.org">=
xen-devel@lists.xenproject.org</a>&gt;<br></div><br><br><div dir=3D"ltr">Hi=
 all,<br><p>Please add your proposed agenda and name next to any items in t=
his=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/FoIa1svj6GD4rYr-H2=
DtEn9c/" target=3D"_blank"><b>link here</b></a>=C2=A0</p><p>If any action i=
tems have been resolved, please remove them from the sheet.=C2=A0</p><p><b>=
<span>CALL</span>=C2=A0LINK:=C2=A0<a href=3D"https://www.google.com/url?q=
=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;source=3Dcale=
ndar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" tar=
get=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></b></p><p><b=
>DATE: Postponing till 18th January 2024 to allow everyone on PTO to join=
=C2=A0</b></p><p><b>TIME: 1600 UTC (4 pm UK time)</b></p>Note the following=
 administrative conventions for the=C2=A0<span>call</span>:<div><br>* To al=
low time to switch between meetings, we plan on starting the<br>agenda at 1=
6:05 UTC sharp.=C2=A0 Aim to join by 16:03 UTC if possible to allocate<br>t=
ime to sort out technical difficulties.<br><br>* If you want to be CC&#39;e=
d please add or remove yourself from the<br>sign-up-sheet at=C2=A0<a href=
=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" rel=3D"=
noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihP=
xxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span>Dial</span>-in Information =
=3D=3D<br>## Meeting time<br>16:00 - 17:00 British time<br>Further Internat=
ional meeting times:<br><a href=3D"https://www.timeanddate.com/worldclock/m=
eetingdetails.html?year=3D2024&amp;month=3D1&amp;day=3D18&amp;hour=3D16&amp=
;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179" t=
arget=3D"_blank">https://www.timeanddate.com/worldclock/meetingdetails.html=
?year=3D2024&amp;month=3D1&amp;day=3D18&amp;hour=3D16&amp;min=3D0&amp;sec=
=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179</a><br><br>##=C2=
=A0<span>Dial</span>=C2=A0in details<br><a href=3D"https://meet.jit.si/stat=
ic/dialInInfo.html?room=3DXenProjectCommunityCall" rel=3D"noreferrer" targe=
t=3D"_blank">https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCo=
mmunityCall</a><div></div><br><div><div dir=3D"ltr" class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</d=
iv><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136=
,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Pro=
ject=C2=A0<br></div></div></div></div></div></div></div>
</div></div></div>

--0000000000008cb5c5060f389d05--

