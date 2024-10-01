Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC2498C4C7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 19:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808456.1220365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svgxx-0006PP-Kf; Tue, 01 Oct 2024 17:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808456.1220365; Tue, 01 Oct 2024 17:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svgxx-0006Np-HW; Tue, 01 Oct 2024 17:47:17 +0000
Received: by outflank-mailman (input) for mailman id 808456;
 Tue, 01 Oct 2024 17:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tO+=Q5=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1svgxv-0006Nd-OP
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 17:47:15 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3160f776-801d-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 19:47:14 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c87853df28so6513249a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 10:47:14 -0700 (PDT)
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
X-Inumbo-ID: 3160f776-801d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727804833; x=1728409633; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jl2Gb6C5bvKqPMtpXy61q0ZvttUp6tH0xc6wlUxox7U=;
        b=VrAx3IEn3wlE+sQbOHJe62C932bSokZ0joU+Sv1/Ob5J4Wc5zxbDTfiLoTTgqaxQMH
         dStpw8NrSz+muqbSIaUUP6MFczf+ppkfn4/FvjpAg0Ud0eUiUh5X5ohc95dAbn0uTHFL
         lcTQ6k62lHkhfsl5OIJ+DfYwI16a6AGkN4rfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727804833; x=1728409633;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jl2Gb6C5bvKqPMtpXy61q0ZvttUp6tH0xc6wlUxox7U=;
        b=NbXVaN9C1cO4Cudy2JEI8g/n1MRGR+WgibMG/RviZLr46U+lAAI5+MCAErM5WM5dyu
         GA7jGD30ELxn1TqDOZgA2rFKW9TCBxPxoajfTEsbrGF3SWD4XmoG5Tz9WC4VVu+KCZtT
         8/QAlmU2Qgml00KXvC8uiDQVuL2IF94MGraPFx7bemG2Gv3qkr+OWiuW4T5oRlAavz6h
         YCrszoolxXUZp3E3gZ4htSrBBrp4UwP71hw4SolUE0d5t6c3Q3dJYSb4SL91bxs3z8fp
         6DztnG8LLckAUln3LTclq+POGq4Jht1lTchqCNgDO6I7QHKQkY+m3iRmPH2m+BuIXISD
         QOjA==
X-Gm-Message-State: AOJu0YyKIitV5s2BIbzlyH4S0PLrTLSAyu4673VdV0WgMpgDeywvBLsT
	5dEcpZ8+N3Y/ALTI3ETPK5Uhcf33YU/TIyrG9ZWF408xQEYynsTdBLFq0P7b1hEKuHS1gHkdS7O
	G9DynoqylLoOUTa87yuYVQjV0lrMn9e5RmNodLlZ6oZclGMg1iaU+euc8
X-Google-Smtp-Source: AGHT+IHYK9dQYCFV/GS6W46iA8H6bUb8Sa7vTLNlTKeo0dD2OIXKsi9A4/M+kJ+BZR/dPsvpqh9UauwwWje9QcF5hUM=
X-Received: by 2002:a05:6402:51cc:b0:5c8:957a:b1e2 with SMTP id
 4fb4d7f45d1cf-5c8b1728940mr212804a12.0.1727804833173; Tue, 01 Oct 2024
 10:47:13 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 1 Oct 2024 18:46:37 +0100
Message-ID: <CAO-mL=xm6RhRpQ2rYskAr3575-rm98FqE98pyYn0zknGvn3uMA@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 3rd October 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000052ccb106236de980"

--00000000000052ccb106236de980
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below:

https://cryptpad.fr/pad/#/2/pad/edit/d2n-WLcNd-u1HvPd3g5Mpu7-/

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Thursday 3rd October 2024*

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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=10&day=3=4&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCal
<https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall>

Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--00000000000052ccb106236de980
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><p>Please add your proposed agenda items b=
elow:=C2=A0</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/d2n-WLcNd=
-u1HvPd3g5Mpu7-/">https://cryptpad.fr/pad/#/2/pad/edit/d2n-WLcNd-u1HvPd3g5M=
pu7-/</a></p><p><b><span class=3D"gmail-il">CALL</span>=C2=A0LINK:=C2=A0<a =
href=3D"https://www.google.com/url?q=3Dhttps://meet.jit.si/XenProjectCommun=
ityCall&amp;sa=3DD&amp;source=3Dcalendar&amp;ust=3D1699196661201312&amp;usg=
=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" target=3D"_blank">https://meet.jit.si/XenP=
rojectCommunityCall</a></b></p><p><b>DATE: Thursday 3rd October 2024</b></p=
><p><b>TIME: 1500 UTC (4 pm UK time)</b></p><i>Note the following administr=
ative conventions for the=C2=A0<span class=3D"gmail-il">call</span>:</i></d=
iv><div><div><i>* To allow time to switch between meetings, we plan on star=
ting the<br>agenda at 15:05 UTC sharp.=C2=A0 Aim to join by 15:03 UTC if po=
ssible to allocate<br>time to sort out technical difficulties.</i></div><di=
v><i><br>* If you want to be CC&#39;ed please add or remove yourself from t=
he<br>sign-up-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit=
/D9vGzihPxxAOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cr=
yptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=
=A0<span class=3D"gmail-il">Dial</span>-in Information =3D=3D<br>## Meeting=
 time<br>16:00 - 17:00 British time<br>Further International meeting times:=
<br></i><a href=3D"https://www.timeanddate.com/worldclock/meetingdetails.ht=
ml?year=3D2024&amp;month=3D10&amp;day=3D3=3D4&amp;hour=3D15&amp;min=3D0&amp=
;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179" target=3D"_bl=
ank">https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024=
&amp;month=3D10&amp;day=3D3=3D4&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p=
1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179</a><br><br>##=C2=A0<span cla=
ss=3D"gmail-il">Dial</span>=C2=A0in details<br><a href=3D"https://meet.jit.=
si/static/dialInInfo.html?room=3DXenProjectCommunityCall" rel=3D"noreferrer=
" target=3D"_blank">https://meet.jit.si/static/dialInInfo.html?room=3DXenPr=
ojectCommunityCal</a></div></div><div><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div><br></div></div></div></div><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136,136)">C=
ommunity Manager</div><div style=3D"color:rgb(136,136,136)"><a href=3D"http=
s://xenproject.org/" target=3D"_blank">Xen Project</a><br></div></div></div=
></div></div></div>

--00000000000052ccb106236de980--

