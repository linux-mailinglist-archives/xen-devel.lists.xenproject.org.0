Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1CB9BB077
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 11:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829922.1244853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7ttQ-0003BY-2H; Mon, 04 Nov 2024 10:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829922.1244853; Mon, 04 Nov 2024 10:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7ttP-00038U-Ui; Mon, 04 Nov 2024 10:01:03 +0000
Received: by outflank-mailman (input) for mailman id 829922;
 Mon, 04 Nov 2024 10:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xqlq=R7=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1t7ttO-00038O-Cg
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 10:01:02 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b05880e3-9a93-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 11:00:58 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c9634c9160so4547228a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 02:00:58 -0800 (PST)
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
X-Inumbo-ID: b05880e3-9a93-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImIwNTg4MGUzLTlhOTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzE0NDU4LjMxMTIwNCwic2VuZGVyIjoia2VsbHkuY2hvaUBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730714457; x=1731319257; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0guM7jzGLdgcLzVb+KuTWePpuFIwY6+vEyhrkAz6tPM=;
        b=CYh/3pBINRQgKNYhM3WKAof+I6p4fF5W1ytuLqO0MoUGGgzs0Kceqbi5u5rKZNwfsH
         Ln7O7bVQiszPj9iB/2nk9V/Z+irVbc9N1uQ6zPHLt0mjCq88Cy1C9oHIGRKBsoyzGgHA
         fLJd0lSJ8FkaKN5DQ73dEqeCeSQkPZKHdYGUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714457; x=1731319257;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0guM7jzGLdgcLzVb+KuTWePpuFIwY6+vEyhrkAz6tPM=;
        b=hocRYJxORDy6h+DdFgyC5UoMjJSCSmi+Csiu/Ei3TJvF9nxkPZD7g0DYIqZYpiKnnt
         jML2qxnrPBaRm50/VJJJiWk1SxJcwhrve+3gx9nmNtYaUFSa/7TCeIUx1F17r73uSS2W
         hrXfQbi1RkDpFCjZM+wKm4ELjbDa5Mh3SMOFoDZ7CIpt+nArI8rrE9X55zTSDBZjhwti
         aLqErCQysCQ4ahJud/xh1Pwx2D4Ll80qXqfAHG2o7kaNvEziB3R8AJhKjAOsOrR6go5K
         16XPDpCLWH4DbPN6xmpeBPWVdvfMqfdy3l1vZAi3mO2BSlYIFJ1MtaOiRuTPGnbcFzbM
         SsOw==
X-Gm-Message-State: AOJu0YwMwL+XocNINFgcipYTeNBEqqHPqeE1ARh4NTmgho3XAklfLci6
	DukJf64mww+8gwnfTmnuNaTxcAzkCIzzOKMpiE+FzW/xwdo4vH/ey8w465eJ7MfAOHpbL4F8TZy
	7yakxeQTvmmyNyfoZYTn1Jy1GbxY9iUyR3DKI5cwsrkig5pb8ok7WwA==
X-Google-Smtp-Source: AGHT+IE7XPmfjRyXw3bwjIk9OlvoqFmAxHf+mD719do6OedOIe5omS29Xl5ABXtpORNjAOUiOOGtXiiNrP+4xFaseXw=
X-Received: by 2002:a05:6402:3508:b0:5ce:ce43:32f with SMTP id
 4fb4d7f45d1cf-5cece4305a3mr5030924a12.35.1730714457214; Mon, 04 Nov 2024
 02:00:57 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 4 Nov 2024 10:00:00 +0000
Message-ID: <CAO-mL=zF6fQZVzV+B0rQtH4aDsusU23juj0O-PhFjDF_-eF6PA@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 7th Nov 2024
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000006e38b80626135ce5"

--0000000000006e38b80626135ce5
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below.

https://cryptpad.fr/pad/#/2/pad/edit/6eu2rGXaB1e5M2nDrv190JcR/

If any action items are missing or have been resolved, please add/remove
them from the sheet.

*CALL LINK:* https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>

*DATE: *Thursday 7th November 2024

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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2024&month=11&day=7&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--0000000000006e38b80626135ce5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi all,<br><p>Please add your proposed agenda it=
ems below.=C2=A0</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/6eu2=
rGXaB1e5M2nDrv190JcR/">https://cryptpad.fr/pad/#/2/pad/edit/6eu2rGXaB1e5M2n=
Drv190JcR/</a>=C2=A0</p><p>If any action items are missing or have been res=
olved, please add/remove them from the sheet.=C2=A0</p><p><b><span class=3D=
"gmail-il">CALL</span>=C2=A0LINK:</b>=C2=A0<a href=3D"https://www.google.co=
m/url?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;source=
=3Dcalendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0c=
Bc" target=3D"_blank" style=3D"">https://meet.jit.si/XenProjectCommunityCal=
l</a></p><p><b>DATE: </b>Thursday 7th November 2024</p><p><b>TIME: </b>1600=
 UTC (4 pm UK time)</p><i>Note the following administrative conventions for=
 the=C2=A0<span class=3D"gmail-il">call</span>:</i></div><div><div><i>* To =
allow time to switch between meetings, we plan on starting the<br>agenda at=
 16:05 UTC sharp.=C2=A0 Aim to join by 16:03 UTC if possible to allocate<br=
>time to sort out technical difficulties.</i></div><div><i><br>* If you wan=
t to be CC&#39;ed please add or remove yourself from the<br>sign-up-sheet a=
t=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0s=
RCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad=
/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span class=3D"gmail=
-il">Dial</span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00 =
British time<br>Further International meeting times:<br></i><a href=3D"http=
s://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&amp;mont=
h=3D11&amp;day=3D7&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;=
p2=3D37&amp;p3=3D224&amp;p4=3D179">https://www.timeanddate.com/worldclock/m=
eetingdetails.html?year=3D2024&amp;month=3D11&amp;day=3D7&amp;hour=3D16&amp=
;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179</a=
>=C2=A0<br><br>##=C2=A0<span class=3D"gmail-il">Dial</span>=C2=A0in details=
<br><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenProject=
CommunityCall" rel=3D"noreferrer" target=3D"_blank">https://meet.jit.si/sta=
tic/dialInInfo.html?room=3DXenProjectCommunityCall</a></div></div><div><div=
 dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><br></div></di=
v></div></div></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sm=
artmail=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks,</div><div>Kelly C=
hoi<br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</=
div><div style=3D"color:rgb(136,136,136)"><a href=3D"https://xenproject.org=
/" target=3D"_blank">Xen Project</a><br></div></div></div></div></div></div=
>

--0000000000006e38b80626135ce5--

