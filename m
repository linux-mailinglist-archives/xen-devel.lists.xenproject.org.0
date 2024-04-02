Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6964895539
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 15:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700124.1092761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rre50-0001Jc-Iv; Tue, 02 Apr 2024 13:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700124.1092761; Tue, 02 Apr 2024 13:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rre50-0001Hp-F3; Tue, 02 Apr 2024 13:21:34 +0000
Received: by outflank-mailman (input) for mailman id 700124;
 Tue, 02 Apr 2024 13:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCFD=LH=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rre4z-0001Hj-5V
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 13:21:33 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eab104ae-f0f3-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 15:21:31 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-515c198e835so5926513e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 06:21:30 -0700 (PDT)
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
X-Inumbo-ID: eab104ae-f0f3-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712064089; x=1712668889; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=coKFj95IyIApxyMgjspaqqhmG31T0WS5w5i6HpGvtaw=;
        b=Vy593+VVd9w7RradSLtl1ryBARB5Mz5wNxtemxNtAM4xLw8JWee4Es+CmbplNfrs8t
         b9OjdHVSzdv5rlSCTeopKX2yPX+CEaV98dL0iF4xTj4myLRmUSDtF3AYb0JnALl4qUCg
         p/gZMRT36HANY1Xj2JSB0taO+MGcduD822fWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712064089; x=1712668889;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=coKFj95IyIApxyMgjspaqqhmG31T0WS5w5i6HpGvtaw=;
        b=ONwbYYPvz8sGY5ZrVCuNer8mkMV3KDGTehK86eyewW+epuddHCBY7OSfCk/Y4dIPTz
         aDUOa2lxo1QqZIo4ckw0cYZKKv2NoSK2jMbmZ1Qbs9DcTH6gPjqNiYjXtse9vx/eOek1
         Cd2zZjw/6doQbC/EbSGai1HkQ981OXwYUaq4dPoHPJ6P18uFO2C8IV+h7Ey317NG9YgW
         mtswxWX9ini2/qRq3tFW1kKFuZkYOUhdl8y52HmdunW5rfViyIxofiNIjK56wJuegjVV
         RKykwhzS3a2g0/L7smmBbMXJJcKXdzit6iIbpaZFGHe8qspi5km/Oa72kEfXit7LJ7GY
         YmNQ==
X-Gm-Message-State: AOJu0Yx7SK3wImFT5Paf782RgAfjr/50nblexAccNUXoFFsA88R0Bga/
	HlvR8+p7OjLCh1qMVD4EEpZ2WQxPeFuVpRABOuQ5wqrgh51fWhS3YBjDDRKQEAiUSKOaOWyxcaa
	Mx3lbvcVE9uh04Efq9gtkIl8iV/je8O5oteVa+Pb4FTif3Luhcdb5eEMN
X-Google-Smtp-Source: AGHT+IGfoLcfGOfdNmZ3LGhzuMocCwlWR/wTZB2jd/h4tnp9fQRP+YzoprXPxYjMTooE6DglN9Ev1eGS/Mz0vIN/Xnw=
X-Received: by 2002:a05:6512:3e0a:b0:513:ca77:82cc with SMTP id
 i10-20020a0565123e0a00b00513ca7782ccmr8618613lfv.8.1712064089006; Tue, 02 Apr
 2024 06:21:29 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 2 Apr 2024 14:20:53 +0100
Message-ID: <CAO-mL=zMJ9ZWnCA0Gn7VGZjERQ3ZRWq=W-B8nau2nGfMiRNExA@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 4th April 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000dbcc2006151cfbb9"

--000000000000dbcc2006151cfbb9
Content-Type: text/plain; charset="UTF-8"

Hi all,

*Please add your proposed agenda items below.*

https://cryptpad.fr/pad/#/2/pad/edit/YWBsde6D8Y8R8z3PLBG2akrt/

If any action items are missing or have been resolved, please add/remove
them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Thursday 4th April 2024*

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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=4&day=4=4&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000dbcc2006151cfbb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><p><u>Please add your proposed agenda item=
s below.</u></p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/YWBsde6D=
8Y8R8z3PLBG2akrt/">https://cryptpad.fr/pad/#/2/pad/edit/YWBsde6D8Y8R8z3PLBG=
2akrt/</a>=C2=A0<br></p><p>If any action items are missing or have been res=
olved, please add/remove them from the sheet.=C2=A0</p><p><b><span class=3D=
"gmail-il">CALL</span>=C2=A0LINK:=C2=A0<a href=3D"https://www.google.com/ur=
l?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;source=3Dc=
alendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" =
target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></b></p><p=
><b>DATE: Thursday 4th April 2024</b></p><p><b>TIME: 1500 UTC (4 pm UK time=
)</b></p><i>Note the following administrative conventions for the=C2=A0<spa=
n class=3D"gmail-il" style=3D"">call</span>:</i></div><div><div><i>* To all=
ow time to switch between meetings, we plan on starting the<br>agenda at 15=
:05 UTC sharp.=C2=A0 Aim to join by 15:03 UTC if possible to allocate<br>ti=
me to sort out technical difficulties.</i></div><div><i><br>* If you want t=
o be CC&#39;ed please add or remove yourself from the<br>sign-up-sheet at=
=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sR=
Cf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/=
edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span class=3D"gmail-=
il">Dial</span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00 B=
ritish time<br>Further International meeting times:<br></i><a href=3D"https=
://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=
=3D4&amp;day=3D4=3D4&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&am=
p;p2=3D37&amp;p3=3D224&amp;p4=3D179">https://www.timeanddate.com/worldclock=
/meetingdetails.html?year=3D2024&amp;month=3D4&amp;day=3D4=3D4&amp;hour=3D1=
5&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D1=
79</a><br><br>##=C2=A0<span class=3D"gmail-il">Dial</span>=C2=A0in details<=
br><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectC=
ommunityCall" rel=3D"noreferrer" target=3D"_blank">https://meet.jit.si/stat=
ic/dialInInfo.html?room=3DXenProjectCommunityCall</a><div></div></div></div=
><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly =
Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Communi=
ty Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br>=
</div></div></div></div></div></div>

--000000000000dbcc2006151cfbb9--

