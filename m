Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF557827CF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 13:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587528.918916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY2zU-0006aR-JR; Mon, 21 Aug 2023 11:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587528.918916; Mon, 21 Aug 2023 11:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY2zU-0006YV-Ge; Mon, 21 Aug 2023 11:22:36 +0000
Received: by outflank-mailman (input) for mailman id 587528;
 Mon, 21 Aug 2023 11:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M4ew=EG=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1qY2zS-0006YI-QM
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 11:22:34 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e2a41f-4015-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 13:22:33 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ff8f2630e3so5008151e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 04:22:33 -0700 (PDT)
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
X-Inumbo-ID: 05e2a41f-4015-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692616953; x=1693221753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pZDyCJOde/gelft6O61wieu2JY4LrUvkiV9x/AK6pmM=;
        b=hpPKeFfvOSpZP3UPXZ1DUT/T7JeDzUKHkRrvWQDKgukoH8ms9qqYR+KQBBhWhGd4Q+
         3B9jPKxd+QndZk0IMWEB9FOXEdgnRUQV5O0TYkJUVf4wktgonHCJJqbkPu1vpIYk68HG
         PRs8aRkZB6kf0BabXZkrDKZIN/pXavjnhfEDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692616953; x=1693221753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZDyCJOde/gelft6O61wieu2JY4LrUvkiV9x/AK6pmM=;
        b=ZtzCh8L8X3KFkwmQpT0r5s71ve5kOBu7XE85tUeYtvO8jO8Z2/2siePIlOFGE/cXd4
         8VTgHURo8/gTMdtID6YWmvCGtHZt6RnCJ/mIm1dNLRlGF1QKQt3QHxizMWRXdsg7quv+
         8114uIUir1IbLnO/oO+N3Rw+Vd9di4fYvecJqryYENlSGtjX7YZ6/srimOnyIDD9ntUO
         9AhT6BoAYctw90Lf70mypaijbhysdj/v7GFqcblAcpgjQmQnSaIpO2mwIjO/Si0MBpsK
         H5cs8bPGjgjDomp50l97gZzaCdZcue/Le17oFBqJPD1U6VOsCxBmLKO2COCq1DE9MOiy
         PiOw==
X-Gm-Message-State: AOJu0YypciaGw7nbRxt27ls3jxw7cAUmTtIyBqBN822HptjP5qUMQjYH
	SF653BaboeOj4gJvf2djQVYp9MawcA04TQQkHkCBow==
X-Google-Smtp-Source: AGHT+IFFtfpDj4/w2gpsm5zS+q5CqzU+spid68a5U920DlCEwpjlpemReBgXvOybvVDQTNKvx2EaaNoylaNlJc661ck=
X-Received: by 2002:a05:6512:318a:b0:4fe:1d88:2c61 with SMTP id
 i10-20020a056512318a00b004fe1d882c61mr5190971lfe.32.1692616952724; Mon, 21
 Aug 2023 04:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=zqZjGhPB7wDxcGM=FxU0-JCcc9AY7YSrPKV5Kpv3pDDw@mail.gmail.com>
 <ca3df86a-2204-441a-1b75-406f166fdf2f@netscape.net>
In-Reply-To: <ca3df86a-2204-441a-1b75-406f166fdf2f@netscape.net>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 21 Aug 2023 12:22:00 +0100
Message-ID: <CAO-mL=x=8g0eGFXp_euGF=V+rWg+tK2X80OVumg2jwDFytYE_Q@mail.gmail.com>
Subject: Re: Community Manager update - August 2023
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003555b706036d1877"

--0000000000003555b706036d1877
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Chuck,

Thanks for your feedback and highlighting this to me.
You're correct, they did rebrand so I will update this to 'IBM Cloud'.

Many thanks,
Kelly Choi

Open Source Community Manager, XenServer
Cloud Software Group


On Sat, Aug 19, 2023 at 12:34=E2=80=AFAM Chuck Zmudzinski <brchuckz@netscap=
e.net>
wrote:

> On 8/18/2023 6:55 AM, Kelly Choi wrote:
> > Hi everyone! :)
> >
> > I hope you're all well.
> >
> > If we haven't met before, I'd like to introduce myself. I'm Kelly, the
> Community Manager for The Xen Project. My role is to support everyone and
> make sure the project is healthy and thriving.
> >
> > *The latest update below requires your attention:*
> > *
> > *
> >
> >   * *We will be moving IRC channels fully to Matrix in September 2023.
> Once the channels have been created, further information will be shared. =
*
> >   * *New Mission Statement, goals, and purpose is attached to this emai=
l
> and will be shared publicly.*
> >
> > *Should anyone have any concerns or feedback, please let me know*
> >
> > Many thanks,
> > Kelly Choi
> >
> > Open Source Community Manager, XenServer
> > Cloud Software Group
>
> This looks good, but I thought IBM rebranded Softlayer as IBM Cloud
> several years ago. Maybe IBM Softlayer should be changed to IBM Cloud?
> Thanks.
>
> Chuck
>

--0000000000003555b706036d1877
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Chuck,<div><br></div><div>Thanks for your feedback and=
 highlighting this to me.=C2=A0</div><div>You&#39;re correct, they did rebr=
and so I will update this to &#39;IBM Cloud&#39;.</div><div><br clear=3D"al=
l"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><di=
v><br></div><div><div style=3D"color:rgb(136,136,136)">Open Source Communit=
y Manager, XenServer</div><div style=3D"color:rgb(136,136,136)">Cloud Softw=
are Group</div></div></div></div></div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 19, 2023 at 12=
:34=E2=80=AFAM Chuck Zmudzinski &lt;<a href=3D"mailto:brchuckz@netscape.net=
">brchuckz@netscape.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 8/18/2023 6:55 AM, Kelly Choi wrote:<br>
&gt; Hi everyone! :)=C2=A0<br>
&gt; <br>
&gt; I hope you&#39;re all well.=C2=A0<br>
&gt; <br>
&gt; If we haven&#39;t met before, I&#39;d like to introduce myself. I&#39;=
m Kelly, the Community=C2=A0Manager for The Xen Project. My role is to supp=
ort everyone and make sure the project is healthy and thriving.=C2=A0<br>
&gt; <br>
&gt; *The latest update below requires your attention:*<br>
&gt; *<br>
&gt; *<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* *We will be moving IRC channels fully to Matrix in Septe=
mber 2023. Once the channels have been created, further information will be=
 shared.=C2=A0*<br>
&gt;=C2=A0 =C2=A0* *New Mission Statement, goals, and purpose is attached t=
o this email and will be shared publicly.*<br>
&gt; <br>
&gt; *Should anyone have any concerns or feedback, please=C2=A0let me know*=
<br>
&gt; <br>
&gt; Many thanks,<br>
&gt; Kelly Choi<br>
&gt; <br>
&gt; Open Source Community Manager, XenServer<br>
&gt; Cloud Software Group<br>
<br>
This looks good, but I thought IBM rebranded Softlayer as IBM Cloud several=
 years ago. Maybe IBM Softlayer should be changed to IBM Cloud? Thanks.<br>
<br>
Chuck<br>
</blockquote></div>

--0000000000003555b706036d1877--

