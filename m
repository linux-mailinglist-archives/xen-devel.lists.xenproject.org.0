Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0B7E677F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 11:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629546.981875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r121Y-0003E6-LL; Thu, 09 Nov 2023 10:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629546.981875; Thu, 09 Nov 2023 10:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r121Y-0003BR-If; Thu, 09 Nov 2023 10:12:32 +0000
Received: by outflank-mailman (input) for mailman id 629546;
 Thu, 09 Nov 2023 10:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7Ux=GW=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r121X-0003BG-B0
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 10:12:31 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bedf99e-7ee8-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 11:12:27 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so982822a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 02:12:27 -0800 (PST)
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
X-Inumbo-ID: 7bedf99e-7ee8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699524746; x=1700129546; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oq5I8F/ktr4JnSF3mcwgG9TuDb6I8i0PLn/PTfGga4=;
        b=OosPvZTf/L6w2/n917BfzETBaLzN3OtQUOlFGAsGAXae/B92sTul7GpWKGc8BTuD7d
         K8oA+5iIIePwueCXryBikoc8MKR5DDg3qefLGqR4J1zRivDXxc2ghqwym7FPgebpGj3d
         /f+y/FVqKKpbtYltPGq0DSuuODpWsTRXCtvOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524746; x=1700129546;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oq5I8F/ktr4JnSF3mcwgG9TuDb6I8i0PLn/PTfGga4=;
        b=uJZSrRlA2KuII2EYUeXHSjt4r76n1QLYUruY50vm2Uf17V/4W0EmbcjboTUNcHdJus
         jduV+fqkzk6ckPghPhPJC2ecQZF8pMePYjg8FBYyzsEc1Wbq0eCBI7YG7tsvTem2yGx/
         +2GfNvJibdtShu+UgVWoULDz5Qh5N55RlZMx5gxleHEWWDmvSsFicaozTv4ammFBut6Z
         PvxvM1sK9+lOJPyMfwu1pd91rTBHi7KLNFBPGGKM52DTwvRbuKlIfrSzjHG1260TdLKI
         i6bB0HFjQdDjZgtH8r536OPurx9eb+DCn0Sw/6RZs4yGTOAhX2UnGdtqgRUxtde3XEAF
         xjcg==
X-Gm-Message-State: AOJu0YyNQxh6W2XMMhVXa0c1ZAtvqOEGzL1CJCf903RHBy0b/Aq0CjAS
	HbayyFgl7Vclr8g4Z4GIF6ivith+W/yuiVuNEs4JidivfceosED3+0Jf5A==
X-Google-Smtp-Source: AGHT+IG1Jk2grWyNMfDrmrUQt439PGSmS6siVJ7P28fVQTg9FWIXIPzeAWnQE0m2uFjtoFIT3l+D7p30FMYMmZzc6Rw=
X-Received: by 2002:a17:906:fe4c:b0:9d2:5cf8:e61 with SMTP id
 wz12-20020a170906fe4c00b009d25cf80e61mr3050820ejb.35.1699524746489; Thu, 09
 Nov 2023 02:12:26 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=xE=-8RjeAOKumLfcSf=wu0OWLK0X1Lz2JMCefBXbnTfA@mail.gmail.com>
In-Reply-To: <CAO-mL=xE=-8RjeAOKumLfcSf=wu0OWLK0X1Lz2JMCefBXbnTfA@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 9 Nov 2023 10:11:50 +0000
Message-ID: <CAO-mL=xypwP+F2wLfqJ3L-F+Wtd_VDdaexXROHOmbyXVcTDzsw@mail.gmail.com>
Subject: Fwd: Cambridge University Talk - 9th November 2023
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000cd4fb00609b570e8"

--000000000000cd4fb00609b570e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey everyone,

Just a reminder that we will be presenting a talk at the University of
Cambridge today, followed by a Q&A!

If you can't make it in person, you can join via Zoom here:

Topic: Xen Project talk - University of Cambridge Time: Nov 9, 2023 03:00
PM Universal Time UTC Join Zoom Meeting https://cloud.zoom.us/j/95208394179
Meeting ID: 952 0839 4179 --- One tap mobile +17209289299,,95208394179# US
(Denver) +17866351003,,95208394179# US (Miami)
Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group


---------- Forwarded message ---------
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, Oct 30, 2023 at 5:54=E2=80=AFPM
Subject: Cambridge University Talk - 9th November 2023
To: <xen-announce@lists.xenproject.org>, <xen-users@lists.xenproject.org>, =
<
xen-devel@lists.xenproject.org>


Hello Xen Community!

I'm excited to share that we will be presenting a talk at Cambridge
University!
This is free and open to everyone, including students and the public.

Make sure to add this to your calendars and come along.

*Date: Thursday 9th November 2023*
*Time: 3 - 4pm *

*Location: *


*Computer LaboratoryWilliam Gates Building15 JJ Thomson Avenue*

*Cambridge CB3 0FDhttps://www.cl.cam.ac.uk/directions/
<https://www.cl.cam.ac.uk/directions/>  *

Title: Navigating the Open Source Landscape: Insights from Ayan Kumar and
Edwin Torok  <https://talks.cam.ac.uk/talk/index/205825>

Join us for an illuminating seminar featuring two distinguished speakers,
Ayan Kumar and Edwin Torok, who will delve into the intricate world of
open-source projects.

Ayan Kumar: In his engaging presentation, Ayan Kumar will be your guide
through the inner workings of open-source projects, using the Xen
hypervisor as a compelling example. With a keen focus on demystifying the
nuances of open-source collaborations, Ayan will walk you through the
step-by-step workflow for contributions, shedding light on the
collaborative modes that fuel innovation. Get ready to be inspired by the
fascinating ongoing developments in the Xen hypervisor. Ayan will also
provide invaluable insights for newcomers, outlining promising avenues for
their initial contributions. The session will culminate in a hands-on
demonstration featuring a selection of noteworthy open-source projects.

Edwin Torok: Edwin Torok will offer invaluable wisdom on the unique
challenges of joining and maintaining a venerable, decade-old codebase,
drawing from his extensive experience with the XAPI project. With a deep
dive into the strategies and practices that sustain such a longstanding
project, Edwin will equip you with the insights needed to navigate and
contribute effectively to large-scale, established codebases.

Don't miss this opportunity to gain firsthand knowledge from these two
seasoned experts in the open-source arena. Join us for an enriching seminar
that promises to empower both beginners and seasoned developers alike.

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--000000000000cd4fb00609b570e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey everyone,<div><br></div><div>Just a reminder that we w=
ill be presenting a talk at the University of Cambridge today,=C2=A0followe=
d by a Q&amp;A!=C2=A0</div><div><br></div><div>If you can&#39;t make it in =
person, you can join via Zoom here:=C2=A0</div><div><br class=3D"gmail-Appl=
e-interchange-newline"><span style=3D"color:rgb(0,0,0);font-family:&quot;Op=
en Sans&quot;,sans-serif;font-size:13px">Topic: Xen Project talk - Universi=
ty of Cambridge
Time: Nov 9, 2023 03:00 PM Universal Time UTC

Join Zoom Meeting
</span><a href=3D"https://cloud.zoom.us/j/95208394179" style=3D"text-decora=
tion-line:none;font-family:&quot;Open Sans&quot;,sans-serif;font-size:13px"=
>https://cloud.zoom.us/j/95208394179</a><span style=3D"color:rgb(0,0,0);fon=
t-family:&quot;Open Sans&quot;,sans-serif;font-size:13px">

Meeting ID: 952 0839 4179

---

One tap mobile
</span><a href=3D"tel:+17209289299,,95208394179#" style=3D"text-decoration-=
line:none;font-family:&quot;Open Sans&quot;,sans-serif;font-size:13px">+172=
09289299,,95208394179#</a><span style=3D"color:rgb(0,0,0);font-family:&quot=
;Open Sans&quot;,sans-serif;font-size:13px"> US (Denver)
</span><a href=3D"tel:+17866351003,,95208394179#" style=3D"text-decoration-=
line:none;font-family:&quot;Open Sans&quot;,sans-serif;font-size:13px">+178=
66351003,,95208394179#</a><span style=3D"color:rgb(0,0,0);font-family:&quot=
;Open Sans&quot;,sans-serif;font-size:13px"> US (Miami)</span><br clear=3D"=
all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><=
div><br></div><div><div style=3D"color:rgb(136,136,136)">Open Source Commun=
ity Manager</div><div style=3D"color:rgb(136,136,136)">XenServer, Cloud Sof=
tware Group</div></div></div></div></div><br><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message -------=
--<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Kelly Choi</str=
ong> <span dir=3D"auto">&lt;<a href=3D"mailto:kelly.choi@cloud.com">kelly.c=
hoi@cloud.com</a>&gt;</span><br>Date: Mon, Oct 30, 2023 at 5:54=E2=80=AFPM<=
br>Subject: Cambridge University Talk - 9th November 2023<br>To:  &lt;<a hr=
ef=3D"mailto:xen-announce@lists.xenproject.org">xen-announce@lists.xenproje=
ct.org</a>&gt;,  &lt;<a href=3D"mailto:xen-users@lists.xenproject.org">xen-=
users@lists.xenproject.org</a>&gt;,  &lt;<a href=3D"mailto:xen-devel@lists.=
xenproject.org">xen-devel@lists.xenproject.org</a>&gt;<br></div><br><br><di=
v dir=3D"ltr">Hello Xen Community! <br><br>I&#39;m excited to share that we=
 will be presenting a talk at Cambridge University!=C2=A0<div>This is free =
and open to everyone, including students and the public. <br><br>Make sure =
to add this to your calendars and come along.<div><br></div><div><b>Date: T=
hursday 9th November 2023</b></div><div><b>Time: 3 - 4pm=C2=A0</b></div><di=
v><b>Location:=C2=A0<br></b></div><div><b>Computer Laboratory<br>William Ga=
tes Building<br>15 JJ Thomson Avenue</b></div><div><b>Cambridge CB3 0FD<br>=
<a href=3D"https://www.cl.cam.ac.uk/directions/" target=3D"_blank">https://=
www.cl.cam.ac.uk/directions/</a>=C2=A0=C2=A0</b></div><div><br>Title: <a hr=
ef=3D"https://talks.cam.ac.uk/talk/index/205825" target=3D"_blank">Navigati=
ng the Open Source Landscape: Insights from Ayan Kumar and Edwin Torok=C2=
=A0</a></div><div><br></div><div>Join us for an illuminating seminar featur=
ing two distinguished speakers, Ayan Kumar and Edwin Torok, who will delve =
into the intricate world of open-source projects.=C2=A0<div><br></div><div>=
Ayan Kumar: In his engaging presentation, Ayan Kumar will be your guide thr=
ough the inner workings of open-source projects, using the Xen hypervisor a=
s a compelling example. With a keen focus on demystifying the nuances of op=
en-source collaborations, Ayan will walk you through the step-by-step workf=
low for contributions, shedding light on the collaborative modes that fuel =
innovation. Get ready to be inspired by the fascinating ongoing development=
s in the Xen hypervisor. Ayan will also provide invaluable insights for new=
comers, outlining promising avenues for their initial contributions. The se=
ssion will culminate in a hands-on demonstration featuring a selection of n=
oteworthy open-source projects.=C2=A0</div><div><br></div><div>Edwin Torok:=
 Edwin Torok will offer invaluable wisdom on the unique challenges of joini=
ng and maintaining a venerable, decade-old codebase, drawing from his exten=
sive experience with the XAPI project. With a deep dive into the strategies=
 and practices that sustain such a longstanding project, Edwin will equip y=
ou with the insights needed to navigate and contribute effectively to large=
-scale, established codebases.=C2=A0</div><div><br></div><div>Don&#39;t mis=
s this opportunity to gain firsthand knowledge from these two seasoned expe=
rts in the open-source arena. Join us for an enriching seminar that promise=
s to empower both beginners and seasoned developers alike.<br><br></div><di=
v>Many thanks,<br>Kelly Choi<br><br>Open Source Community Manager<br>XenSer=
ver, Cloud Software Group<br></div></div></div></div>
</div></div></div>

--000000000000cd4fb00609b570e8--

