Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA0292D0A9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 13:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756875.1165623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVUQ-0004xS-Il; Wed, 10 Jul 2024 11:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756875.1165623; Wed, 10 Jul 2024 11:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVUQ-0004vX-Fe; Wed, 10 Jul 2024 11:28:02 +0000
Received: by outflank-mailman (input) for mailman id 756875;
 Wed, 10 Jul 2024 11:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urFr=OK=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sRVOH-00011k-N5
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 11:21:41 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 937a65ee-3eae-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 13:21:39 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38027so7677215a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 04:21:39 -0700 (PDT)
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
X-Inumbo-ID: 937a65ee-3eae-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720610498; x=1721215298; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CrUaedVc4Zs/lkDns9Qi/jUgL4HD/9st6mTw+uTtIXE=;
        b=Uv4saWsPDqddI3+5kD/Hh3LBsYXKDRQCLMRx/0NVfg4fh3YjjII5SRqaQFHS2m2OJ4
         WFna3PPkMVVdmozua7q7gVS2cKx0yC2LlIQmQdlEH8Emtke8QjKyK11kdHwL0hA3MzlM
         ZrOqYyzDba6OQXOwISsBiM+kQl1OBKeyHcz9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720610498; x=1721215298;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CrUaedVc4Zs/lkDns9Qi/jUgL4HD/9st6mTw+uTtIXE=;
        b=Wd9Ne8PJcj6Dl8yLcnGnlXcxu5xdvwEtQUh8F90BUAoeFcLd60BSnJDuGg8+TqV9A1
         Jux76SNToalYir8x3nRaGzv8tHRVxzuHMxfZmEsL0zQm8M90z6zQIj24Tv8+Z0UPfd/d
         kSz+zl865TzK7wB7lBDN17QhQncbQxuEJE0Rdot0I1C/xMLv/tlRSj6GYrqDsdCjSteA
         xTBb6/KhzfWzedSaD7HVLqTFqdawIC7lU/fbu4AfqqEG4hZYeaCCf7Kv0P3lqMD8Q8kc
         UcTZn2aVm96Xg/iHS3t1r62eF5EjvBALT62zjZ6uMGXQUr3rieYj3DheHNHtKMiRNh8w
         ES5A==
X-Gm-Message-State: AOJu0YxTnzJtTA8lvmFy28TnAf7LIHawyGz4weiQOUULAYLTmZR9q1aE
	po8ENLWbIAByus+/azbXKa5dIxyvggoTQs0Ji8jubPAVQExxr6WbxoqxgwGXt3uVcYySMwFov9j
	Dk807yXceq8ASSqAXAn+0Ei6ele9A5AAjwz9NVV88kj2G0DJYjfOCVrGujBQ=
X-Google-Smtp-Source: AGHT+IF1MSaFZ5t/usnA+qlxEWDJ4IHwOHIZBjikl9uKypla+GJdGMGF5+kbohHymzIyHodLbrctILpBkKC82i6+YJo=
X-Received: by 2002:a17:906:f80e:b0:a77:dc23:5625 with SMTP id
 a640c23a62f3a-a780b6b2e6emr312983766b.22.1720610498014; Wed, 10 Jul 2024
 04:21:38 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 10 Jul 2024 12:21:02 +0100
Message-ID: <CAO-mL=zoG6bKK0XA5xQu_=wBGHY62TEVkq1Q3ODGXRtNmKw_dQ@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 11th July 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000881489061ce2d9e9"

--000000000000881489061ce2d9e9
Content-Type: text/plain; charset="UTF-8"

Hi all,

*Please add your proposed agenda items below.*

https://cryptpad.fr/pad/#/2/pad/edit/8+z7QnqdirEYBrspUHUJvxCZ/

If any action items are missing or have been resolved, please add/remove
them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Thursday 11th July 2024*

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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=7&day=11=4&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000881489061ce2d9e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><p><u>Please add your proposed agenda item=
s below.</u>=C2=A0</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/8+=
z7QnqdirEYBrspUHUJvxCZ/">https://cryptpad.fr/pad/#/2/pad/edit/8+z7QnqdirEYB=
rspUHUJvxCZ/</a>=C2=A0<br></p><p>If any action items are missing or have be=
en resolved, please add/remove them from the sheet.=C2=A0</p><p><b><span cl=
ass=3D"gmail-il">CALL</span>=C2=A0LINK:=C2=A0<a href=3D"https://www.google.=
com/url?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;sour=
ce=3Dcalendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V=
0cBc" target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></b>=
</p><p><b>DATE: Thursday 11th July 2024</b></p><p><b>TIME: 1500 UTC (4 pm U=
K time)</b></p><i>Note the following administrative conventions for the=C2=
=A0<span class=3D"gmail-il">call</span>:</i></div><div><div><i>* To allow t=
ime to switch between meetings, we plan on starting the<br>agenda at 15:05 =
UTC sharp.=C2=A0 Aim to join by 15:03 UTC if possible to allocate<br>time t=
o sort out technical difficulties.</i></div><div><i><br>* If you want to be=
 CC&#39;ed please add or remove yourself from the<br>sign-up-sheet at=C2=A0=
<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" =
rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/D=
9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span class=3D"gmail-il">Di=
al</span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00 British=
 time<br>Further International meeting times:<br></i><a href=3D"https://www=
.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D7&a=
mp;day=3D11=3D4&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=
=3D37&amp;p3=3D224&amp;p4=3D179" target=3D"_blank">https://www.timeanddate.=
com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D7&amp;day=3D11=
=3D4&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=
=3D224&amp;p4=3D179</a><br><br>##=C2=A0<span class=3D"gmail-il">Dial</span>=
=C2=A0in details<br><a href=3D"https://meet.jit.si/static/dialInInfo.html?r=
oom=3DXenProjectCommunityCall" rel=3D"noreferrer" target=3D"_blank">https:/=
/meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall</a><div>=
</div></div></div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,=
</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,=
136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen =
Project=C2=A0<br></div></div></div></div></div></div>

--000000000000881489061ce2d9e9--

