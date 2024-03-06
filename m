Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F6873C2F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 17:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689385.1074284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhu4z-0004i2-8S; Wed, 06 Mar 2024 16:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689385.1074284; Wed, 06 Mar 2024 16:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhu4z-0004fo-5o; Wed, 06 Mar 2024 16:25:17 +0000
Received: by outflank-mailman (input) for mailman id 689385;
 Wed, 06 Mar 2024 16:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QX5=KM=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rhu4y-0004fh-Iy
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 16:25:16 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1add25f2-dbd6-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 17:25:11 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d311081954so140991fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 08:25:11 -0800 (PST)
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
X-Inumbo-ID: 1add25f2-dbd6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709742311; x=1710347111; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8mHfSd5dqMvjggqW3GpO2/SzQGRtbOI8jB0i0HRbgeo=;
        b=EgYHpDmcUqELjuFCrfLSLQtRgywGkMd17QhN/y9jnNKmihdysvZI2yoCnJtNUd+yxx
         qAzEA0F/+6e8zMDQkImN1WBdbQZDQokgfn59MVIExb8oUumUAT5/DRxQjmuwEExYhFcw
         OPNiyV0fRzEXUqqT2MnHiDEMLcuH6mi4gGjFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742311; x=1710347111;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8mHfSd5dqMvjggqW3GpO2/SzQGRtbOI8jB0i0HRbgeo=;
        b=oh7hoq/yVd4wWrd7ph1zPe1vs0O5iiUgK2M/muK60kU4N6442NUIoGBauMOVwmr6sN
         ZpHWsmQzJ0u9Mfmb6ybzHgbD4/vxIdWgJANGWuaDSEx1SDuqeHxS2kOJHnrUf4gUZSXA
         DFbqi+8s1yKyR4VLlN37dqP5xMNqKoW63FtDwzNBCvIWdFfDCtAlb5a5kLuVpUyIngjb
         JIAjoPdC6HK8EI1eAqj/Da8kfxJ8xDQ/FTtJ/A7oK0TklWtSmne5v0otxzeA6j1Crb1v
         jOOy1rrPsZxZkwcOzPzhFSL4ogYvTUGwcjTm6CXPmQtDAQ4WUPccg8K90+RQ2WQO1osR
         ZP2A==
X-Gm-Message-State: AOJu0YyM9penzqeESc2AowlOYf7dYJvtevggapYvMUJe81MoGuTb2QXq
	30ulbiFBhmpcd3tqSV7WlKhkSEtW1740MUfYKno3bDlNkY69PNTOnhlEdRpzfDqlwEMkqj2S8/V
	9k0dSON5JqOv5ATj4ua4Y9/QYZBRTNH/40QEubICMxHb1r+yv
X-Google-Smtp-Source: AGHT+IGgwybRs5GXc6tnQKSWcDV2i+RIDltA5lDJSy8ZjETzvgCAroHuBNp3tilhh25fHvJ6anjHwLLsBlCoCdMy2EM=
X-Received: by 2002:a2e:9f14:0:b0:2d2:1a1f:ad77 with SMTP id
 u20-20020a2e9f14000000b002d21a1fad77mr3477625ljk.13.1709742310071; Wed, 06
 Mar 2024 08:25:10 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 6 Mar 2024 16:24:33 +0000
Message-ID: <CAO-mL=wXe1fpVTWOhZd5r8f83zn2-q65c7gW_12yOj3m4ubMKw@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for Community Call - 7th March 2024
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000000ccb900613006755"

--0000000000000ccb900613006755
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

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000000ccb900613006755
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div><div>Hi all,<br><p>Please add=
 your proposed agenda items below.</p><p><a href=3D"https://cryptpad.fr/pad=
/#/2/pad/edit/VlIkjPmILf0abDG3j1Wn0091/" target=3D"_blank">https://cryptpad=
.fr/pad/#/2/pad/edit/VlIkjPmILf0abDG3j1Wn0091/</a>=C2=A0<br></p><p>If any a=
ction items are missing or have been resolved, please add/remove them from =
the sheet.=C2=A0</p><p><b>CALL=C2=A0LINK:=C2=A0<a href=3D"https://www.googl=
e.com/url?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;so=
urce=3Dcalendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi=
7V0cBc" target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></=
b></p><p><b>DATE: Thursday 7th March 2024</b></p><p><b>TIME: 1600 UTC (4 pm=
 UK time)</b></p><i>Note the following administrative conventions for the=
=C2=A0call:</i></div><div><i><br></i></div><div><div><i>* To allow time to =
switch between meetings, we plan on starting the<br>agenda at 16:05 UTC sha=
rp.=C2=A0 Aim to join by 16:03 UTC if possible to allocate<br>time to sort =
out technical difficulties.<br><br>* If you want to be CC&#39;ed please add=
 or remove yourself from the<br>sign-up-sheet at=C2=A0<a href=3D"https://cr=
yptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRC=
f+/</a><br><br>=3D=3D=C2=A0Dial-in Information =3D=3D<br>## Meeting time<br=
>16:00 - 17:00 British time<br>Further International meeting times:<br><a h=
ref=3D"https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D20=
24&amp;month=3D2&amp;day=3D1&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=
=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179" target=3D"_blank">https://ww=
w.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D3&=
amp;day=3D7&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37=
&amp;p3=3D224&amp;p4=3D179</a>=C2=A0=C2=A0=C2=A0</i><br><br>##=C2=A0Dial=C2=
=A0in details<br><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=
=3DXenProjectCommunityCall" rel=3D"noreferrer" target=3D"_blank">https://me=
et.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall</a><div></d=
iv></div></div><div><br></div></div></div></div></div></div></div><div><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div>=
<div><div style=3D"color:rgb(136,136,136)">Community Manager</div><div styl=
e=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div><=
/div></div>

--0000000000000ccb900613006755--

