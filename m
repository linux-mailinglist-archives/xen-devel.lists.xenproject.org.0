Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490BE98DBCE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 16:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808834.1220888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw0RP-0003lo-5v; Wed, 02 Oct 2024 14:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808834.1220888; Wed, 02 Oct 2024 14:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw0RP-0003jK-38; Wed, 02 Oct 2024 14:34:59 +0000
Received: by outflank-mailman (input) for mailman id 808834;
 Wed, 02 Oct 2024 14:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Yge=Q6=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sw0RN-0003j7-Op
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 14:34:57 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e213ec4-80cb-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 16:34:55 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c42e7adbddso9399407a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 07:34:55 -0700 (PDT)
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
X-Inumbo-ID: 7e213ec4-80cb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727879695; x=1728484495; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VH2M/dzC5ntDec72HPj4BfYpAj12Irby0g+PDxU5/s0=;
        b=NwtKNDqCYDUTSMTNSMGoEPg1+FQtFce7zp1k3/cq4RGsZMeRJYrT3sYkr/0hFAmF1+
         0UjkHkBQxx9mGM5r6Knp1XKm+TG0TnIKf09LjOAknPHJDq+Ro8z9ylwIaLj/nVyjg/jl
         1FMX5Al0xa31f7CDcQBJypq+Kql11nPXt28bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879695; x=1728484495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VH2M/dzC5ntDec72HPj4BfYpAj12Irby0g+PDxU5/s0=;
        b=uf2bthVaeKUnX9dBhL+FsP70T1yxEiBoTBwlyn60Q15fXUef7gvRbZ1UFsNCiHAsGt
         ilXy3ivIQkmhuijpi4OFhJXBtHd/CwjV8+9YvFB38WCpILpowk5Tnegh5IxDs/pAHpAM
         cSiWSsTuFElcUpJw+4s1VtOyrf/O4B8h0Zki242OddcQMIFxIiAQavn91tYgKpZ1Z//m
         6ZaY+xo0KiyHsSB5OCoXz4DY5rFgvWe4UqdsdzDM48PhD6GTtOlKkoL1hE8hB00HFXGc
         rY5DnsbnzGdIfiEckGm3X5HjiObF7bAj8SotICImvaxeeQ3IhYybjtYsPkypVqzFxd/8
         fNdA==
X-Gm-Message-State: AOJu0Yxd5enBSlLQUKJwbg7z/rTrYt5E5IzOuZUCxvT3V35pVKIcRG/D
	Nk0PCa77kN5K6iFNXw60RWUKiTryxLBIMuoeyldgOX4k7YpEWoDgmq5/ihndhHjWxx0RBFCjwB5
	gscjTHPsbg35eAQrPdxuriZw++nhTy1EFvIq6WT+OsPExWpFGBzUCcg==
X-Google-Smtp-Source: AGHT+IFbr58TRMkEuCZetxEG3M2wxV788I+bkyKOQ12KtRiBRU8OW0dELx5alBDuns9sWhG0URltLk+QFO8EOZhfplc=
X-Received: by 2002:a05:6402:e07:b0:5c7:20f9:f556 with SMTP id
 4fb4d7f45d1cf-5c8b1a378f3mr2324070a12.21.1727879694681; Wed, 02 Oct 2024
 07:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=xm6RhRpQ2rYskAr3575-rm98FqE98pyYn0zknGvn3uMA@mail.gmail.com>
In-Reply-To: <CAO-mL=xm6RhRpQ2rYskAr3575-rm98FqE98pyYn0zknGvn3uMA@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 2 Oct 2024 15:34:18 +0100
Message-ID: <CAO-mL=wfZKqRA+_3k2cwAxrtycfUFk1o_5Wn91SVe3dMiwqCGw@mail.gmail.com>
Subject: Re: [ANNOUNCE] Call for agenda items - Community Call 3rd October 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Cc: "committers @ xenproject . org" <committers@xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000006aa50306237f57e5"

--0000000000006aa50306237f57e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

As the 3rd of October is a public holiday in Germany, I propose we postpone
the call by a week to the *10th October.*
If there are any urgent issues to discuss or objections, please reply to
this email.

Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>


On Tue, Oct 1, 2024 at 6:46=E2=80=AFPM Kelly Choi <kelly.choi@cloud.com> wr=
ote:

> Hi all,
>
> Please add your proposed agenda items below:
>
> https://cryptpad.fr/pad/#/2/pad/edit/d2n-WLcNd-u1HvPd3g5Mpu7-/
>
> *CALL LINK: https://meet.jit.si/XenProjectCommunityCall
> <https://www.google.com/url?q=3Dhttps://meet.jit.si/XenProjectCommunityCa=
ll&sa=3DD&source=3Dcalendar&ust=3D1699196661201312&usg=3DAOvVaw1FcogEsMjFSd=
1Pmi7V0cBc>*
>
> *DATE: Thursday 3rd October 2024*
>
> *TIME: 1500 UTC (4 pm UK time)*
> *Note the following administrative conventions for the call:*
>
>
> ** To allow time to switch between meetings, we plan on starting theagend=
a
> at 15:05 UTC sharp.  Aim to join by 15:03 UTC if possible to allocatetime
> to sort out technical difficulties.*
>
>
>
>
>
>
>
>
> ** If you want to be CC'ed please add or remove yourself from
> thesign-up-sheet
> at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
> <https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>=3D=3D Di=
al-in
> Information =3D=3D## Meeting time16:00 - 17:00 British timeFurther
> International meeting times:*
> https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&mo=
nth=3D10&day=3D3=3D4&hour=3D15&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p=
4=3D179
>
> ## Dial in details
> https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCal
> <https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCal=
l>
>
> Kelly Choi
> Community Manager
> Xen Project <https://xenproject.org/>
>

--0000000000006aa50306237f57e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>As the 3rd of October is a publ=
ic holiday in Germany, I propose we postpone the call by a week to the <b>1=
0th=C2=A0October.</b>=C2=A0</div><div>If there are any urgent issues to dis=
cuss or objections, please reply to this email.=C2=A0</div><div><div><div d=
ir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><div><br></div><div>Kelly Choi<br></div><div><div style=3D"co=
lor:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,13=
6,136)"><a href=3D"https://xenproject.org/" target=3D"_blank">Xen Project</=
a><br></div></div></div></div></div><br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 1, 2024 at 6:46=
=E2=80=AFPM Kelly Choi &lt;<a href=3D"mailto:kelly.choi@cloud.com">kelly.ch=
oi@cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div>Hi all,<br><p>Please add your proposed ag=
enda items below:=C2=A0</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/ed=
it/d2n-WLcNd-u1HvPd3g5Mpu7-/" target=3D"_blank">https://cryptpad.fr/pad/#/2=
/pad/edit/d2n-WLcNd-u1HvPd3g5Mpu7-/</a></p><p><b><span>CALL</span>=C2=A0LIN=
K:=C2=A0<a href=3D"https://www.google.com/url?q=3Dhttps://meet.jit.si/XenPr=
ojectCommunityCall&amp;sa=3DD&amp;source=3Dcalendar&amp;ust=3D1699196661201=
312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7V0cBc" target=3D"_blank">https://meet.=
jit.si/XenProjectCommunityCall</a></b></p><p><b>DATE: Thursday 3rd October =
2024</b></p><p><b>TIME: 1500 UTC (4 pm UK time)</b></p><i>Note the followin=
g administrative conventions for the=C2=A0<span>call</span>:</i></div><div>=
<div><i>* To allow time to switch between meetings, we plan on starting the=
<br>agenda at 15:05 UTC sharp.=C2=A0 Aim to join by 15:03 UTC if possible t=
o allocate<br>time to sort out technical difficulties.</i></div><div><i><br=
>* If you want to be CC&#39;ed please add or remove yourself from the<br>si=
gn-up-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzih=
PxxAOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.f=
r/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span>D=
ial</span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:00 Britis=
h time<br>Further International meeting times:<br></i><a href=3D"https://ww=
w.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D10=
&amp;day=3D3=3D4&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=
=3D37&amp;p3=3D224&amp;p4=3D179" target=3D"_blank">https://www.timeanddate.=
com/worldclock/meetingdetails.html?year=3D2024&amp;month=3D10&amp;day=3D3=
=3D4&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=
=3D224&amp;p4=3D179</a><br><br>##=C2=A0<span>Dial</span>=C2=A0in details<br=
><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCom=
munityCall" rel=3D"noreferrer" target=3D"_blank">https://meet.jit.si/static=
/dialInInfo.html?room=3DXenProjectCommunityCal</a></div></div><div><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><br></div></div></=
div></div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">=
<div>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136,136)">Communi=
ty Manager</div><div style=3D"color:rgb(136,136,136)"><a href=3D"https://xe=
nproject.org/" target=3D"_blank">Xen Project</a><br></div></div></div></div=
></div></div>
</blockquote></div>

--0000000000006aa50306237f57e5--

