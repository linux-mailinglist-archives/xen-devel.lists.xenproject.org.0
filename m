Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA289E3B86
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 14:44:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848565.1263415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIpf9-0007kp-2f; Wed, 04 Dec 2024 13:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848565.1263415; Wed, 04 Dec 2024 13:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIpf8-0007ie-Vs; Wed, 04 Dec 2024 13:43:30 +0000
Received: by outflank-mailman (input) for mailman id 848565;
 Wed, 04 Dec 2024 13:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raRd=S5=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tIpf7-0007iY-TL
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 13:43:29 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdbe5309-b245-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 14:43:27 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a68480164so901835666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2024 05:43:27 -0800 (PST)
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
X-Inumbo-ID: bdbe5309-b245-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733319807; x=1733924607; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Fopsikh4/TA9+CQof8cGFRjnBqSfg99ecS2CWbxhJc=;
        b=XyTPmSe1xJDXe0Q3/RNYa7JvlSYdcHqI4TIQDAQzqNpQtvuCn6h2UdWICGt8PTy7AJ
         uOv8yncg/yEmeZZ6tf/jovHowDbA516p1k1N+SU5wiK3dbzI5UbxakBRsDv+Upegkbqn
         R6GNLBodoJRn9RlBsVCTTc5jJ+XZa7GyN4ORM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733319807; x=1733924607;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Fopsikh4/TA9+CQof8cGFRjnBqSfg99ecS2CWbxhJc=;
        b=Y771hWWMiA//ZQblKfKk027DHqtlTN2e66VbL3kLjNO5wMExxOVqSNYR5sL2gLtfkz
         8g9zGJk783VOwnvwSWPxIgFJrZfX9A72y+OC9we3P+OdayufxPs3+2jQTGlBxrnEhL8c
         niNrmOtmKab+Tt78a4MsNh9Vmr8woYyWfGkqsw+Fe4p7O8aSyDfXhkPpu0CALi2czuKu
         9Z/sYNJUQkMsdKzi5K7afDLa+cP8ZHl0ODgx8i4fEzURkPkzrYhC/lor9vDluzN4U/Yr
         vB+traVEDTBtt9TvFcoy2qfFwjSTOEwpE0aMwP5FEN1kUq8XqDEepJ38XrypUgsKzmTs
         iL5Q==
X-Gm-Message-State: AOJu0YzLd4BUUt+szH4jpe1EWBtNj2iNMa7vcESrRPtqyIJWmviZRk8H
	Ds4MJgnjfoLOGekJSahV7Rv+vBRit8Y2kYNBky4e2OK4QObLmnRz1kUDQxJYQZkC/u6JkpUNNGW
	5yHrfczSctITYoQ14nCGap9XSoSwZJPMQIhQk1sdECZRR9dXseYP9/w==
X-Gm-Gg: ASbGncueGxSug6xCVmKtS0sBzBnSN5ClJFcC9FD6beLe2FToBqn0T6dKNYqYflJ+TaG
	jP3KSWPY9YBh7+Wy1ZsUbED7pKZxPYA==
X-Google-Smtp-Source: AGHT+IFkvBAX+bmgKG/FdjOVbYFgg0BOxFA3iBysHkk55EM+Fp1arTdJEfbVlWlqef1Ho4w4WXJXEfyvxetHnZhFM8M=
X-Received: by 2002:a17:907:7815:b0:a9e:43d9:401a with SMTP id
 a640c23a62f3a-aa5f7d15961mr542476066b.14.1733319806494; Wed, 04 Dec 2024
 05:43:26 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 4 Dec 2024 13:42:50 +0000
Message-ID: <CAO-mL=wOATC683cLBqLXGV9irKysQTD9Ce0q98HqJ6PJXKt9Yw@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 5th Dec 2024
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000059552a062871f741"

--00000000000059552a062871f741
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below. If any action items are
missing or have been resolved, please add/remove them from the sheet.

https://cryptpad.fr/pad/#/2/pad/edit/rEgpgVlezL41HDxAxxTdteJ-/

*CALL LINK:* https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>

*DATE: *Thursday 5th December 2024

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
International meeting times:*
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=12&day=5&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--00000000000059552a062871f741
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><p>Hi all,=C2=A0</p><p>Please add your proposed =
agenda items below. If any action items are missing or have been resolved, =
please add/remove them from the sheet.=C2=A0</p><p><a href=3D"https://crypt=
pad.fr/pad/#/2/pad/edit/rEgpgVlezL41HDxAxxTdteJ-/">https://cryptpad.fr/pad/=
#/2/pad/edit/rEgpgVlezL41HDxAxxTdteJ-/</a>=C2=A0=C2=A0</p><p><b>CALL LINK:<=
/b>=C2=A0<a href=3D"https://www.google.com/url?q=3Dhttps://meet.jit.si/XenP=
rojectCommunityCall&amp;sa=3DD&amp;source=3Dcalendar&amp;ust=3D169919666120=
1312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" target=3D"_blank">https://meet=
.jit.si/XenProjectCommunityCall</a></p><p><b>DATE:=C2=A0</b>Thursday 5th De=
cember 2024</p><p><b>TIME:=C2=A0</b>1600 UTC (4 pm UK time)</p><i>Note the =
following administrative conventions for the=C2=A0<span class=3D"gmail-il">=
call</span>:</i></div><div><div><i>* To allow time to switch between meetin=
gs, we plan on starting the<br>agenda at 16:05 UTC sharp.=C2=A0 Aim to join=
 by 16:03 UTC if possible to allocate<br>time to sort out technical difficu=
lties.</i></div><div><i><br>* If you want to be CC&#39;ed please add or rem=
ove yourself from the<br>sign-up-sheet at=C2=A0<a href=3D"https://cryptpad.=
fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D=
"_blank">https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a>=
<br><br>=3D=3D=C2=A0<span class=3D"gmail-il">Dial</span>-in Information =3D=
=3D<br>## Meeting time<br>16:00 - 17:00 British time<br>Further Internation=
al meeting times:<br></i><a href=3D"https://www.timeanddate.com/worldclock/=
meetingdetails.html?year=3D2024&amp;month=3D12&amp;day=3D5&amp;hour=3D16&am=
p;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179" =
target=3D"_blank">https://www.timeanddate.com/worldclock/meetingdetails.htm=
l?year=3D2024&amp;month=3D12&amp;day=3D5&amp;hour=3D16&amp;min=3D0&amp;sec=
=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179</a>=C2=A0<br><br>#=
#=C2=A0<span class=3D"gmail-il">Dial</span>=C2=A0in details<br><a href=3D"h=
ttps://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall" r=
el=3D"noreferrer" target=3D"_blank">https://meet.jit.si/static/dialInInfo.h=
tml?room=3DXenProjectCommunityCall</a></div></div></div><div><br></div><div=
><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Thanks,</div><div>Kelly Choi<br></div><div><div s=
tyle=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:=
rgb(136,136,136)"><a href=3D"https://xenproject.org/" target=3D"_blank">Xen=
 Project</a><br></div></div></div></div></div></div>

--00000000000059552a062871f741--

