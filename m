Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB68700DF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 12:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688341.1072394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh6xT-0003Vs-7D; Mon, 04 Mar 2024 11:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688341.1072394; Mon, 04 Mar 2024 11:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh6xT-0003T9-40; Mon, 04 Mar 2024 11:58:15 +0000
Received: by outflank-mailman (input) for mailman id 688341;
 Mon, 04 Mar 2024 11:58:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYM3=KK=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rh6xS-0003Sy-Gu
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 11:58:14 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79fb4ffb-da1e-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 12:58:12 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso1005051466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 03:58:12 -0800 (PST)
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
X-Inumbo-ID: 79fb4ffb-da1e-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709553492; x=1710158292; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4uzf6dNKIpQngPAbvvM4mnGw7+WpEfvrugk5KLb21Uk=;
        b=lCSix2X7h0b9DR9Ch8PZKM9HoD9QgXwi5gcMbdsFoAZ3APPgvEGhxty7iFQYCKgsTP
         C4b8nWHJM3PEuro4TgxHB+lq5DE+h7/jp0bmMRMwDEcD6J8m7Ziq++weim2lJeClAX63
         NkQ1qKvojooUlPTVS4W/gW75jah+1tpf6Yjb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709553492; x=1710158292;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uzf6dNKIpQngPAbvvM4mnGw7+WpEfvrugk5KLb21Uk=;
        b=KWIUXucHO6DUpAvC8qfmpI2cg/0ZXFFeeuRwocWefqBivjgFHSMwXlwU/nOfP3Pxxb
         tj00sRStdIKSZIyHoV5yizjamEsV/8yKqMRI4HJWBhfF7j4+4uyoquvWuROeEZwJHiKj
         WtSnC+Tb6PKCMSnETRKDi1AtYu6U/tNxyPeXCfOP7Q6GAdValXiTg/wmXk5L5hnruhRp
         Hg4OHOFYLPFZPSIfSsQScA3Ls4kLKGvxxVgTjbC6khvblpvQowEIboIPRsCWOH7uB3Is
         6QhKm6Ic0nQvGiBMQbo2onKiid/fxuCthqZthtcK/xVN5I5QnbV0n8mSBpeunysyrLuC
         QlNw==
X-Gm-Message-State: AOJu0Yxtki/VzED7jmiqMEPm8aaVX87NoKM/GNTLqt3qQMuuD3SDLBv8
	DmT+Vyg45Xv494uqdPcwCbXp8V7BI/DE9uob9qRZFe7/MVHXgEEbOBK82pHbWntvxN9jF05X9WA
	X6hTJA6+wAX6cE00W3l3Q9M3M1SiGkxscLysmVb/aZh5MeB/aFFaRzu7n
X-Google-Smtp-Source: AGHT+IHGwcvG4U2sYEKH2O+yz8ID0X8wgbAAI7tUy/tq1prZGHH4posMNqOzW9CrDP6e672fJ+4Vhz60PW1ZzvLmiog=
X-Received: by 2002:a17:906:cec3:b0:a3c:5e17:1635 with SMTP id
 si3-20020a170906cec300b00a3c5e171635mr7679560ejb.30.1709553491880; Mon, 04
 Mar 2024 03:58:11 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 4 Mar 2024 11:57:35 +0000
Message-ID: <CAO-mL=zMo80c5ycsSOsW0kkeLyCWRZ-CwUo+BSKKR0yNVv=ruA@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for Community Call
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000009bc5150612d470ee"

--0000000000009bc5150612d470ee
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below.

https://cryptpad.fr/pad/#/2/pad/edit/VlIkjPmILf0abDG3j1Wn0091/

If any action items are missing or have been resolved, please add/remove
them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Thursday 7th March 2024*

*TIME: 1600 UTC (4 pm UK time)*
*Note the following administrative conventions for the call:*












** To allow time to switch between meetings, we plan on starting theagenda
at 16:05 UTC sharp.  Aim to join by 16:03 UTC if possible to allocatetime
to sort out technical difficulties.* If you want to be CC'ed please add or
remove yourself from thesign-up-sheet
at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>== Dial-in
Information ==## Meeting time16:00 - 17:00 British timeFurther
International meeting
times:https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=3&day=7&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=2&day=1&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
  *

Thanks,
Kelly
Community Manager
Xen Project

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

--0000000000009bc5150612d470ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div><div>Hi all,<br><p>Please add your proposed ag=
enda items below.</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/VlI=
kjPmILf0abDG3j1Wn0091/">https://cryptpad.fr/pad/#/2/pad/edit/VlIkjPmILf0abD=
G3j1Wn0091/</a>=C2=A0<br></p><p>If any action items are missing or have bee=
n resolved, please add/remove them from the sheet.=C2=A0</p><p><b><span cla=
ss=3D"gmail-il">CALL</span>=C2=A0LINK:=C2=A0<a href=3D"https://www.google.c=
om/url?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;sourc=
e=3Dcalendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0=
cBc" target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></b><=
/p><p><b>DATE: Thursday 7th March 2024</b></p><p><b>TIME: 1600 UTC (4 pm UK=
 time)</b></p><i>Note the following administrative conventions for the=C2=
=A0<span class=3D"gmail-il">call</span>:</i></div><div><i><br></i></div><di=
v><div><i>* To allow time to switch between meetings, we plan on starting t=
he<br>agenda at 16:05 UTC sharp.=C2=A0 Aim to join by 16:03 UTC if possible=
 to allocate<br>time to sort out technical difficulties.<br><br>* If you wa=
nt to be CC&#39;ed please add or remove yourself from the<br>sign-up-sheet =
at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0=
sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pa=
d/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span class=3D"gmai=
l-il">Dial</span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00=
 British time<br>Further International meeting times:<br><a href=3D"https:/=
/www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=
=3D2&amp;day=3D1&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=
=3D37&amp;p3=3D224&amp;p4=3D179" target=3D"_blank">https://www.timeanddate.=
com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D3&amp;day=3D7&am=
p;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&=
amp;p4=3D179</a>=C2=A0=C2=A0=C2=A0</i></div><div><br></div><div>Thanks,</di=
v><div>Kelly</div><div><div style=3D"color:rgb(136,136,136)">Community Mana=
ger</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0</div><br>#=
#=C2=A0<span class=3D"gmail-il">Dial</span>=C2=A0in details<br><a href=3D"h=
ttps://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall" r=
el=3D"noreferrer" target=3D"_blank">https://meet.jit.si/static/dialInInfo.h=
tml?room=3DXenProjectCommunityCall</a><div></div></div></div><div><br></div=
></div></div></div></div></div></div>

--0000000000009bc5150612d470ee--

