Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF1A06309
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 18:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867711.1279282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZYI-0003cB-Qq; Wed, 08 Jan 2025 17:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867711.1279282; Wed, 08 Jan 2025 17:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZYI-0003Zj-O8; Wed, 08 Jan 2025 17:09:06 +0000
Received: by outflank-mailman (input) for mailman id 867711;
 Wed, 08 Jan 2025 17:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HeEA=UA=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tVZYH-0003Zd-FY
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 17:09:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4361b323-cde3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 18:09:04 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa692211331so1545066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 09:09:04 -0800 (PST)
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
X-Inumbo-ID: 4361b323-cde3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736356144; x=1736960944; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U4fh6xLiXRuynsjWZERG9QnDY6MYtLlBf7DiIoXFTvE=;
        b=bKwSj1IG7rG/DppCXEEv88tpHE+ZeOrnPf3Ij6E3HO6/QJ3yRoO4jVGX+ShwYRumDC
         6x7KWvL5ydt3fAcGTl2XQGFCygcSghdVjglqoPSOl8PKMnE1evrsvzi1Wb+kF4BlW6N5
         AiGbC5yF9s08yTdPljI5tMlapWfqmnFEt4jRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736356144; x=1736960944;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4fh6xLiXRuynsjWZERG9QnDY6MYtLlBf7DiIoXFTvE=;
        b=WoFMp1ijLt8rJZD0p4hLaCl6raykxsUNH5JuNPldhdmd2ckJSyn0IgfNhfTA2bsTtg
         uq4HGxI0r2V9HxMXvfk6ZEYpsYjyiT4YN7CHb9z1tNaXeIn7kzg+EvdcpOSdi71hH5rF
         brrd4cQyCpVqrhPAnrTEjzJUxjC0kTLKoGZ4AaDBhFtGp8zSiiVPRrS9wag24MC63BI2
         Nz0TK4PixSxW4S3phlK0lrvQVHgjWKIdfUm4Blp/aRUShXj/h/hfvTSirFfzO8DEE35e
         1VXiuYbR0UqTx5RMrna81sFqyniPW0FCipLzCAfn+7S2Jo7NpUUjkY4u99W7q+ndRRgG
         Ub7w==
X-Gm-Message-State: AOJu0Yw6snuSmn2R/K6jH77Ec+jgDn68zvklGBJAm5xRVLM+2efIJDVZ
	O0Sai4VKqFnGqKjBhsdpuFdYvhm8y7hFaXjHnS7mZjgflB3MwiGkSKLwtbtoyidsttAHaeiMZqf
	IK4rYm1irizHADYHkQ29davG4sbzkC88Fmc5laWaq6UWfJWiXMXYwZg==
X-Gm-Gg: ASbGncuLX5XxZlSYrSNZwEHBCTT+z6eEsbrsqltB25n+8kzLPYFKxIl9lwweWY4DvG+
	CJmeB55G+5QkOJ6BwEW7zpZ3wTq6rBs4u5pPOcaZol5Mxqo26lixajxCjreckWb2iaw1hBgo=
X-Google-Smtp-Source: AGHT+IFMkA8zrwvKuV4OJtiA5pFQIkO2aiaADwbulLZYubXqcjzObmS5gQSx+2SZR6WVyvvI3uUDOuSD/Zy+4bkZWpI=
X-Received: by 2002:a17:907:1b17:b0:aa4:cd1e:c91b with SMTP id
 a640c23a62f3a-ab2c3c451a3mr9457866b.7.1736356143406; Wed, 08 Jan 2025
 09:09:03 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 8 Jan 2025 17:08:27 +0000
X-Gm-Features: AbW1kvbJELFWk72TJN47gtgaB-_IJLAZUKH8CkYAk0qVXiWsCqoao1_gaOZuO5w
Message-ID: <CAO-mL=wMNO3bpv9xSYUT1E9FeAC4zdyj4Y0qDvsfTsPFVwu9bg@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 9th Jan 2025
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000021b917062b34eb3d"

--00000000000021b917062b34eb3d
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below. If any action items are
missing or have been resolved, please add/remove them from the sheet.

https://cryptpad.fr/pad/#/2/pad/edit/TI2jaCcgSU2WnA6OeQJq-qAy/

*CALL LINK:* https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>

*DATE: *Thursday 9th January 2025

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
International meeting
times:*https://www.timeanddate.com/worldclock/meetingdetails.html?year=2025&month=1&day=9&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--00000000000021b917062b34eb3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><p>Hi all,=C2=A0</p><p>Please add your prop=
osed agenda items below. If any action items are missing or have been resol=
ved, please add/remove them from the sheet.=C2=A0</p><p><a href=3D"https://=
cryptpad.fr/pad/#/2/pad/edit/TI2jaCcgSU2WnA6OeQJq-qAy/">https://cryptpad.fr=
/pad/#/2/pad/edit/TI2jaCcgSU2WnA6OeQJq-qAy/</a>=C2=A0</p><p><b><span class=
=3D"gmail-il">CALL</span>=C2=A0LINK:</b>=C2=A0<a href=3D"https://www.google=
.com/url?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;sou=
rce=3Dcalendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7=
V0cBc" target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></p=
><p><b>DATE:=C2=A0</b>Thursday 9th January 2025</p><p><b>TIME:=C2=A0</b>160=
0 UTC (4 pm UK time)</p><i>Note the following administrative conventions fo=
r the=C2=A0<span class=3D"gmail-il">call</span>:</i></div><div><div><i>* To=
 allow time to switch between meetings, we plan on starting the<br>agenda a=
t 16:05 UTC sharp.=C2=A0 Aim to join by 16:03 UTC if possible to allocate<b=
r>time to sort out technical difficulties.</i></div><div><i><br>* If you wa=
nt to be CC&#39;ed please add or remove yourself from the<br>sign-up-sheet =
at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0=
sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pa=
d/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span class=3D"gmai=
l-il">Dial</span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00=
 British time<br>Further International meeting times:<br></i><a href=3D"htt=
ps://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&amp;mon=
th=3D1&amp;day=3D9&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;=
p2=3D37&amp;p3=3D224&amp;p4=3D179" target=3D"_blank">https://www.timeanddat=
e.com/worldclock/meetingdetails.html?year=3D2025&amp;month=3D1&amp;day=3D9&=
amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D22=
4&amp;p4=3D179 </a>=C2=A0<br><br>##=C2=A0<span class=3D"gmail-il">Dial</spa=
n>=C2=A0in details<br><a href=3D"https://meet.jit.si/static/dialInInfo.html=
?room=3DXenProjectCommunityCall" rel=3D"noreferrer" target=3D"_blank">https=
://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall</a></d=
iv></div></div><div><br></div></div><div><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks,</=
div><div>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136,136)">Com=
munity Manager</div><div style=3D"color:rgb(136,136,136)"><a href=3D"https:=
//xenproject.org/" target=3D"_blank">Xen Project</a><br></div></div></div><=
/div></div></div>

--00000000000021b917062b34eb3d--

