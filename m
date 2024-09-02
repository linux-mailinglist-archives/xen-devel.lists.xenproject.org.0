Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43889687D4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 14:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787878.1197350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl6SZ-0005fq-8P; Mon, 02 Sep 2024 12:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787878.1197350; Mon, 02 Sep 2024 12:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl6SZ-0005ci-55; Mon, 02 Sep 2024 12:47:07 +0000
Received: by outflank-mailman (input) for mailman id 787878;
 Mon, 02 Sep 2024 12:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdGF=QA=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sl6SX-0005ca-93
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 12:47:05 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74a87de1-6929-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 14:47:04 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-534366c1aa2so4320580e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 05:47:04 -0700 (PDT)
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
X-Inumbo-ID: 74a87de1-6929-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725281224; x=1725886024; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=epJRt1uo4Lexsje12YBsFjRgkSZDtcBNrdYTIalCFkg=;
        b=gIEqlwnD2haUKg3jBjd+cNJ3lt9eiKvN84NWzICks+6YIPN3erpyBk/0kvme/HA3Qg
         0O+DNmf1MgI42j8vbAf4B0PdZ9EVnRHzIRorU6siT+nq8DvIr3DAQC+ENqBZABk7TYJv
         ry7JJedcf/knG1OvpMLp219rL4l1MQARdiDxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725281224; x=1725886024;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=epJRt1uo4Lexsje12YBsFjRgkSZDtcBNrdYTIalCFkg=;
        b=oZbuqzvkl1c2/US4jafPbpZQgs++C8OHrmtFeKWGDNfU00eRD2QmKS5CazV/nMBmwq
         T/zeE5R1/2TnIFdmjJe2ZZVMVDISKf6KZsQxVCo2ogIwqbse8ijO2H8rfdAxsdyxox6c
         v5QFkqIyO7rJrh7/7qvhWvWIdq5Gkqkqjxl6r5OkOSJdtMTGQd6CF06NrDuQO0GY/3ln
         icPojZnweP6GosWw6ydBSAfM97zx0bq63HFwuDaGiHnsIQSNYKrGTO/XLfqPw6a+tqEa
         Up1stlGX95zXq2U4ZoQwBMhgG3VUeSs990Cl+vr7mQc5S0cOcd/9xNNZOBhztlrjOmxG
         ZapA==
X-Gm-Message-State: AOJu0Yz5m08h9y3sH9YX/OkuMXTAngTJIOjIbk6SgOTths1nIXNIkCVQ
	SYHkSd5BpflP6MsJXOXU5d+lgcmMJb9jivgA46YrlKVQOg8F7LqhkqoE/M4UP+2p94FuXTV8wmt
	Iqxmhwt6nYyQt30iL91H8eUx/KTG7bwoESsvWInElM4Gps8UOonKGXg==
X-Google-Smtp-Source: AGHT+IHB4TuNrHy5UF0c3FqUX+kApgANloGmbRcajnhzJgvUqzVmT+PurasAD3cbAaxFGeHdevWKG9M+/IvaykCGkmg=
X-Received: by 2002:a05:6512:2241:b0:52c:e159:a998 with SMTP id
 2adb3069b0e04-53546b2bd62mr8259813e87.29.1725281222922; Mon, 02 Sep 2024
 05:47:02 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 2 Sep 2024 13:46:26 +0100
Message-ID: <CAO-mL=xDBeN_BeVtX0-nkL2H7BsUA5g_CnuVY9wdW5sVOu0VNQ@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 5th September 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000006e40c20621225636"

--0000000000006e40c20621225636
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below.

https://cryptpad.fr/pad/#/2/pad/edit/VxQ65XLa-w4D3D9z9ipZInnC/

If any action items are missing or have been resolved, please add/remove
them from the sheet.

*CALL LINK: https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>*

*DATE: Thursday 5th September 2024*

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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=9&day=5&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179

## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000006e40c20621225636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><p>Please add your proposed agenda items b=
elow.=C2=A0</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/VxQ65XLa-=
w4D3D9z9ipZInnC/">https://cryptpad.fr/pad/#/2/pad/edit/VxQ65XLa-w4D3D9z9ipZ=
InnC/</a>=C2=A0<br></p><p>If any action items are missing or have been reso=
lved, please add/remove them from the sheet.=C2=A0</p><p><b><span class=3D"=
gmail-il">CALL</span>=C2=A0LINK:=C2=A0<a href=3D"https://www.google.com/url=
?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;source=3Dca=
lendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" t=
arget=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></b></p><p>=
<b>DATE: Thursday 5th September 2024</b></p><p><b>TIME: 1500 UTC (4 pm UK t=
ime)</b></p><i>Note the following administrative conventions for the=C2=A0<=
span class=3D"gmail-il">call</span>:</i></div><div><div><i>* To allow time =
to switch between meetings, we plan on starting the<br>agenda at 15:05 UTC =
sharp.=C2=A0 Aim to join by 15:03 UTC if possible to allocate<br>time to so=
rt out technical difficulties.</i></div><div><i><br>* If you want to be CC&=
#39;ed please add or remove yourself from the<br>sign-up-sheet at=C2=A0<a h=
ref=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" rel=
=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/D9vG=
zihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span class=3D"gmail-il">Dial<=
/span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00 British ti=
me<br>Further International meeting times:<br></i><a href=3D"https://www.ti=
meanddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D9&amp;=
day=3D5&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp=
;p3=3D224&amp;p4=3D179" target=3D"_blank">https://www.timeanddate.com/world=
clock/meetingdetails.html?year=3D2024&amp;month=3D9&amp;day=3D5&amp;hour=3D=
15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D=
179</a><br><br>##=C2=A0<span class=3D"gmail-il">Dial</span>=C2=A0in details=
<br><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenProject=
CommunityCall" rel=3D"noreferrer" target=3D"_blank">https://meet.jit.si/sta=
tic/dialInInfo.html?room=3DXenProjectCommunityCall</a></div></div><div><div=
 dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><br></div></di=
v></div></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Ch=
oi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Community=
 Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></=
div></div></div></div></div></div>

--0000000000006e40c20621225636--

