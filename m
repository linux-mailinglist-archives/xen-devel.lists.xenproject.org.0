Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842CA7E6CAB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 15:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629667.982037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r16Ol-0004QV-2T; Thu, 09 Nov 2023 14:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629667.982037; Thu, 09 Nov 2023 14:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r16Ok-0004ID-Tc; Thu, 09 Nov 2023 14:52:46 +0000
Received: by outflank-mailman (input) for mailman id 629667;
 Thu, 09 Nov 2023 14:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7Ux=GW=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r16Oj-0004Dl-3C
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 14:52:45 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2667d91-7f0f-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 15:52:42 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso199182566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 06:52:42 -0800 (PST)
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
X-Inumbo-ID: a2667d91-7f0f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699541561; x=1700146361; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QChuKaTVNJC5tJXAqYjv1PeHlPETqcayoS15YgUGQjM=;
        b=jDVtVpqHQlUFmpur4o5d2jv3Ep3PTpTtsIkYPcKOe+v1uqk3ZKWVmttpkKfTTnQee+
         7F31h3oCLICWdjqZ1g4tKkWoGdrTo8jUYAAP55lfPB8IuBG06HeidHjwrg9NyKeede4S
         jFpk1c5fQ4o0VLlcGEVKeCFwcyPVjPAfXY4ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699541561; x=1700146361;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QChuKaTVNJC5tJXAqYjv1PeHlPETqcayoS15YgUGQjM=;
        b=DfO8BnFm9zrTuDymFDZgLzHs0BBM81fkaV4/pgq7970rQybs5Tq7EqsRvNGIsN7ckh
         2VLXSgCIBSz3G+8Jy7g2V7Io+3AVnrozUK+37BuJ69pZZhSblZHQOFT+OJaD+U27ojdH
         D3ERrMhd0IOmd90dxUgVg6GyoeFCrVnkbcP5WERmTBHmJxZ1ulg82ilH9N9v1KHs/BEv
         W3axkeOkYHP2H+cV99BWNHCJxIp2UQiNpdNs1dkUqlrG5amkLW1tFszVrvyvwvvOUryy
         HowPA9l+wommpwGMNGL9bfOXA8M7LBypuonzA39if/4p63/VGJu44p4yc/ewyfZtSxAu
         sgQQ==
X-Gm-Message-State: AOJu0YzPbrV+LA6jZthUUzn/aZioUTJi1yQYjLQV9EcE6R7w8tw0ws+j
	yQMhGrRRH8nQVoj2Pz3wCwPj6yMWvPpebCYqd8XihQ/zx+KL5hFvYsP88w==
X-Google-Smtp-Source: AGHT+IFfX2JhN+hOTzc0Bb+mqJe589E4i4MGtAKJGSWKGy5gNm37SVmx0T0GKrjQXos3h5OP13fzjJWV7bUSFH3X9BM=
X-Received: by 2002:a17:906:2258:b0:9a5:c38d:6b75 with SMTP id
 24-20020a170906225800b009a5c38d6b75mr9116623ejr.15.1699541561313; Thu, 09 Nov
 2023 06:52:41 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=xE=-8RjeAOKumLfcSf=wu0OWLK0X1Lz2JMCefBXbnTfA@mail.gmail.com>
 <CAO-mL=xypwP+F2wLfqJ3L-F+Wtd_VDdaexXROHOmbyXVcTDzsw@mail.gmail.com>
In-Reply-To: <CAO-mL=xypwP+F2wLfqJ3L-F+Wtd_VDdaexXROHOmbyXVcTDzsw@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 9 Nov 2023 14:52:05 +0000
Message-ID: <CAO-mL=xfvMbTfUyAa496GL1hSdaNqOWn74rZ9NNK1kWCs+6wjg@mail.gmail.com>
Subject: Re: Cambridge University Talk - 9th November 2023
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000000b269c0609b95b09"

--0000000000000b269c0609b95b09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

We start in 10 minutes!

Please see updated Zoom link:
https://cl-cam-ac-uk.zoom.us/j/97216272378?pwd=3DM2diTFhMTnppckJtNWhFVTBKK0=
REZz09

The session will also be recorded by the University of Cambridge.

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group


On Thu, Nov 9, 2023 at 10:11=E2=80=AFAM Kelly Choi <kelly.choi@cloud.com> w=
rote:

> Hey everyone,
>
> Just a reminder that we will be presenting a talk at the University of
> Cambridge today, followed by a Q&A!
>
> If you can't make it in person, you can join via Zoom here:
>
> Topic: Xen Project talk - University of Cambridge Time: Nov 9, 2023 03:00
> PM Universal Time UTC Join Zoom Meeting
> https://cloud.zoom.us/j/95208394179 Meeting ID: 952 0839 4179 --- One tap
> mobile +17209289299,,95208394179# US (Denver) +17866351003,,95208394179#
> US (Miami)
> Many thanks,
> Kelly Choi
>
> Open Source Community Manager
> XenServer, Cloud Software Group
>
>
> ---------- Forwarded message ---------
> From: Kelly Choi <kelly.choi@cloud.com>
> Date: Mon, Oct 30, 2023 at 5:54=E2=80=AFPM
> Subject: Cambridge University Talk - 9th November 2023
> To: <xen-announce@lists.xenproject.org>, <xen-users@lists.xenproject.org>=
,
> <xen-devel@lists.xenproject.org>
>
>
> Hello Xen Community!
>
> I'm excited to share that we will be presenting a talk at Cambridge
> University!
> This is free and open to everyone, including students and the public.
>
> Make sure to add this to your calendars and come along.
>
> *Date: Thursday 9th November 2023*
> *Time: 3 - 4pm *
>
> *Location: *
>
>
> *Computer LaboratoryWilliam Gates Building15 JJ Thomson Avenue*
>
> *Cambridge CB3 0FDhttps://www.cl.cam.ac.uk/directions/
> <https://www.cl.cam.ac.uk/directions/>  *
>
> Title: Navigating the Open Source Landscape: Insights from Ayan Kumar and
> Edwin Torok  <https://talks.cam.ac.uk/talk/index/205825>
>
> Join us for an illuminating seminar featuring two distinguished speakers,
> Ayan Kumar and Edwin Torok, who will delve into the intricate world of
> open-source projects.
>
> Ayan Kumar: In his engaging presentation, Ayan Kumar will be your guide
> through the inner workings of open-source projects, using the Xen
> hypervisor as a compelling example. With a keen focus on demystifying the
> nuances of open-source collaborations, Ayan will walk you through the
> step-by-step workflow for contributions, shedding light on the
> collaborative modes that fuel innovation. Get ready to be inspired by the
> fascinating ongoing developments in the Xen hypervisor. Ayan will also
> provide invaluable insights for newcomers, outlining promising avenues fo=
r
> their initial contributions. The session will culminate in a hands-on
> demonstration featuring a selection of noteworthy open-source projects.
>
> Edwin Torok: Edwin Torok will offer invaluable wisdom on the unique
> challenges of joining and maintaining a venerable, decade-old codebase,
> drawing from his extensive experience with the XAPI project. With a deep
> dive into the strategies and practices that sustain such a longstanding
> project, Edwin will equip you with the insights needed to navigate and
> contribute effectively to large-scale, established codebases.
>
> Don't miss this opportunity to gain firsthand knowledge from these two
> seasoned experts in the open-source arena. Join us for an enriching semin=
ar
> that promises to empower both beginners and seasoned developers alike.
>
> Many thanks,
> Kelly Choi
>
> Open Source Community Manager
> XenServer, Cloud Software Group
>

--0000000000000b269c0609b95b09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>We start in 10 minutes!=C2=A0</=
div><div><br></div><div>Please see updated Zoom link:</div><div><a href=3D"=
https://cl-cam-ac-uk.zoom.us/j/97216272378?pwd=3DM2diTFhMTnppckJtNWhFVTBKK0=
REZz09" target=3D"_blank">https://cl-cam-ac-uk.zoom.us/j/97216272378?pwd=3D=
M2diTFhMTnppckJtNWhFVTBKK0REZz09</a></div><div><br></div><div>The session w=
ill also be recorded by the University of Cambridge.</div><div><br clear=3D=
"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div>=
<div><br></div><div><div style=3D"color:rgb(136,136,136)">Open Source Commu=
nity Manager</div><div style=3D"color:rgb(136,136,136)">XenServer, Cloud So=
ftware Group</div></div></div></div></div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 9, 2023 at =
10:11=E2=80=AFAM Kelly Choi &lt;<a href=3D"mailto:kelly.choi@cloud.com">kel=
ly.choi@cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">Hey everyone,<div><br></div><div>Just a r=
eminder that we will be presenting a talk at the University of Cambridge to=
day,=C2=A0followed by a Q&amp;A!=C2=A0</div><div><br></div><div>If you can&=
#39;t make it in person, you can join via Zoom here:=C2=A0</div><div><br><s=
pan style=3D"color:rgb(0,0,0);font-family:&quot;Open Sans&quot;,sans-serif;=
font-size:13px">Topic: Xen Project talk - University of Cambridge
Time: Nov 9, 2023 03:00 PM Universal Time UTC

Join Zoom Meeting
</span><a href=3D"https://cloud.zoom.us/j/95208394179" style=3D"text-decora=
tion-line:none;font-family:&quot;Open Sans&quot;,sans-serif;font-size:13px"=
 target=3D"_blank">https://cloud.zoom.us/j/95208394179</a><span style=3D"co=
lor:rgb(0,0,0);font-family:&quot;Open Sans&quot;,sans-serif;font-size:13px"=
>

Meeting ID: 952 0839 4179

---

One tap mobile
</span><a href=3D"tel:+17209289299,,95208394179#" style=3D"text-decoration-=
line:none;font-family:&quot;Open Sans&quot;,sans-serif;font-size:13px" targ=
et=3D"_blank">+17209289299,,95208394179#</a><span style=3D"color:rgb(0,0,0)=
;font-family:&quot;Open Sans&quot;,sans-serif;font-size:13px"> US (Denver)
</span><a href=3D"tel:+17866351003,,95208394179#" style=3D"text-decoration-=
line:none;font-family:&quot;Open Sans&quot;,sans-serif;font-size:13px" targ=
et=3D"_blank">+17866351003,,95208394179#</a><span style=3D"color:rgb(0,0,0)=
;font-family:&quot;Open Sans&quot;,sans-serif;font-size:13px"> US (Miami)</=
span><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div=
 dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><di=
v><div style=3D"color:rgb(136,136,136)">Open Source Community Manager</div>=
<div style=3D"color:rgb(136,136,136)">XenServer, Cloud Software Group</div>=
</div></div></div></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">---------- Forwarded message ---------<br>From: <stro=
ng class=3D"gmail_sendername" dir=3D"auto">Kelly Choi</strong> <span dir=3D=
"auto">&lt;<a href=3D"mailto:kelly.choi@cloud.com" target=3D"_blank">kelly.=
choi@cloud.com</a>&gt;</span><br>Date: Mon, Oct 30, 2023 at 5:54=E2=80=AFPM=
<br>Subject: Cambridge University Talk - 9th November 2023<br>To:  &lt;<a h=
ref=3D"mailto:xen-announce@lists.xenproject.org" target=3D"_blank">xen-anno=
unce@lists.xenproject.org</a>&gt;,  &lt;<a href=3D"mailto:xen-users@lists.x=
enproject.org" target=3D"_blank">xen-users@lists.xenproject.org</a>&gt;,  &=
lt;<a href=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_blank">xen-=
devel@lists.xenproject.org</a>&gt;<br></div><br><br><div dir=3D"ltr">Hello =
Xen Community! <br><br>I&#39;m excited to share that we will be presenting =
a talk at Cambridge University!=C2=A0<div>This is free and open to everyone=
, including students and the public. <br><br>Make sure to add this to your =
calendars and come along.<div><br></div><div><b>Date: Thursday 9th November=
 2023</b></div><div><b>Time: 3 - 4pm=C2=A0</b></div><div><b>Location:=C2=A0=
<br></b></div><div><b>Computer Laboratory<br>William Gates Building<br>15 J=
J Thomson Avenue</b></div><div><b>Cambridge CB3 0FD<br><a href=3D"https://w=
ww.cl.cam.ac.uk/directions/" target=3D"_blank">https://www.cl.cam.ac.uk/dir=
ections/</a>=C2=A0=C2=A0</b></div><div><br>Title: <a href=3D"https://talks.=
cam.ac.uk/talk/index/205825" target=3D"_blank">Navigating the Open Source L=
andscape: Insights from Ayan Kumar and Edwin Torok=C2=A0</a></div><div><br>=
</div><div>Join us for an illuminating seminar featuring two distinguished =
speakers, Ayan Kumar and Edwin Torok, who will delve into the intricate wor=
ld of open-source projects.=C2=A0<div><br></div><div>Ayan Kumar: In his eng=
aging presentation, Ayan Kumar will be your guide through the inner working=
s of open-source projects, using the Xen hypervisor as a compelling example=
. With a keen focus on demystifying the nuances of open-source collaboratio=
ns, Ayan will walk you through the step-by-step workflow for contributions,=
 shedding light on the collaborative modes that fuel innovation. Get ready =
to be inspired by the fascinating ongoing developments in the Xen hyperviso=
r. Ayan will also provide invaluable insights for newcomers, outlining prom=
ising avenues for their initial contributions. The session will culminate i=
n a hands-on demonstration featuring a selection of noteworthy open-source =
projects.=C2=A0</div><div><br></div><div>Edwin Torok: Edwin Torok will offe=
r invaluable wisdom on the unique challenges of joining and maintaining a v=
enerable, decade-old codebase, drawing from his extensive experience with t=
he XAPI project. With a deep dive into the strategies and practices that su=
stain such a longstanding project, Edwin will equip you with the insights n=
eeded to navigate and contribute effectively to large-scale, established co=
debases.=C2=A0</div><div><br></div><div>Don&#39;t miss this opportunity to =
gain firsthand knowledge from these two seasoned experts in the open-source=
 arena. Join us for an enriching seminar that promises to empower both begi=
nners and seasoned developers alike.<br><br></div><div>Many thanks,<br>Kell=
y Choi<br><br>Open Source Community Manager<br>XenServer, Cloud Software Gr=
oup<br></div></div></div></div>
</div></div></div>
</blockquote></div>

--0000000000000b269c0609b95b09--

