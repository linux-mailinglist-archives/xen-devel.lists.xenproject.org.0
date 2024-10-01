Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874FB98C329
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 18:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808347.1220289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svfcP-00050B-Cu; Tue, 01 Oct 2024 16:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808347.1220289; Tue, 01 Oct 2024 16:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svfcP-0004ww-9w; Tue, 01 Oct 2024 16:20:57 +0000
Received: by outflank-mailman (input) for mailman id 808347;
 Tue, 01 Oct 2024 16:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tO+=Q5=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1svfcO-0004Y5-97
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 16:20:56 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2192d506-8011-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 18:20:53 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5398e7dda5fso2963492e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 09:20:53 -0700 (PDT)
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
X-Inumbo-ID: 2192d506-8011-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727799653; x=1728404453; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YIiU4zAZeAcgT2puQqCLsgQepdmVpsQ39Ss8uXbdIYA=;
        b=UjpLPusXXXwDzTuVGP0A3Cx4XyyVamtO+UTUmET/WyBXUYqDJbukp2ymkVNex6XZi/
         Dagq8wT79I262cx1I+GYV2dYCbl9GBN0b+FYyeeyztQaOR41t6la1qBMzdccB9vgUTdd
         ZQfc7HQR3qFLooWN0m2xGhEe9TmDRHdUH5C/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727799653; x=1728404453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIiU4zAZeAcgT2puQqCLsgQepdmVpsQ39Ss8uXbdIYA=;
        b=NVZiazFa7gctmioFolF3QhC5y9XjSKeOjE6Dbp5XZKVtoUtREKfUea2rp01dHuuwu4
         SfnpUe1VWK4tM8WkQipLtNLkqwCyVCJRafhqu6VLFnTByX47QOpnWzJFrqgwOhr4kKis
         sI/oDIgx0AGP/8UJpSD91hKVUlFz8TMIEiDE8mCWndgQZIMabmM8neSg78GEllA5QIV+
         XnKG6akj7c6+GerEJhQ13uFmMcPoXClkmOzBosJbt8U6Jjrl0TuKzeEQxHPyJdNvHHdS
         fLLC+GmmyzRHEFYHMdFfUzOgVU8xKrONh09WXZH1oV4P3owKrrv9gA1+MvixWZU6cs2g
         +G4g==
X-Gm-Message-State: AOJu0Yy8t+jjefC6PobR2SQuqy48/6axxkIkYhI8qHXgjWAc7rBH9aRk
	g662+C4riMdvx8yAGZXq4IpluFAMaad8zlMK3n4p2ZnFK0H/Y6unYiD7wzLeF48/UbeuwCO3Nby
	Bd4isjKIkLAU26pcT+gC/lZ2fdr8uqkQ++b9V/ryQ1SHXDoln
X-Google-Smtp-Source: AGHT+IHYWBgmlmS1Rx9bVIs+Fpd9SeJV+HE5jH6/z1jN1uZXis9r17SAoRBq+FINmZdXWZwJ0lr+eHBCp3YrDqrNk1E=
X-Received: by 2002:a05:6512:401e:b0:52c:dfa0:dca0 with SMTP id
 2adb3069b0e04-5389fc634c5mr8388716e87.43.1727799652783; Tue, 01 Oct 2024
 09:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=xm_C_0XNy49hQjtrOqDs_di4LT4fK-WTbhVXtnddQ_bw@mail.gmail.com>
In-Reply-To: <CAO-mL=xm_C_0XNy49hQjtrOqDs_di4LT4fK-WTbhVXtnddQ_bw@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 1 Oct 2024 17:20:16 +0100
Message-ID: <CAO-mL=xqc153b4w_rmjhZWbGpgCeWV7qUU+mV79Z7Q36ZzBW0g@mail.gmail.com>
Subject: Re: SAVE THE DATE - Next Xen Project Meetup (Cambridge)
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Cc: Xen Project Advisory Board <advisory-board@lists.xenproject.org>, 
	"committers @ xenproject . org" <committers@xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000008c489506236cb42c"

--0000000000008c489506236cb42c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

There seems to be an issue with the previous link.

Please register using this new link* HERE
<https://cryptpad.fr/form/#/2/form/view/I6uugZHhi6E8AP+Haft0+RwozJMKojY5lVs=
7waL-xDY/>*

Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>


On Tue, Oct 1, 2024 at 2:26=E2=80=AFPM Kelly Choi <kelly.choi@cloud.com> wr=
ote:

> Hi all,
>
> I'm pleased to announce the next Xen Project meetup in Cambridge!
>
>
> *Please save the date: Thursday 24th October 2024*
>
> *Location: XenServer office (Citrix), 101 Cambridge Science Park Rd,
> Milton, Cambridge CB4 0FY*
> *Time: 18:00 - 20:00 *
>
> What to expect?
> A developer social with food and drinks included!
> Informative sessions from speakers within the community (more details to
> follow).
> This is free to attend, but you will need to register *HERE
> <https://docs.google.com/forms/d/e/1FAIpQLScQS15qh_IAUhmbTy2gNmfxNzaVuI5Q=
Dw3G6oBa0rmrVt5-2w/viewform?usp=3Dsf_link>. *
>
> We are looking for a sponsor, so if your company wishes to support us
> please get in touch with me.
>
> Kelly Choi
> Community Manager
> Xen Project <https://xenproject.org/>
>

--0000000000008c489506236cb42c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>There seems to be an issue with=
 the previous link.</div><div><br></div><div>Please register using this new=
 link<b> <a href=3D"https://cryptpad.fr/form/#/2/form/view/I6uugZHhi6E8AP+H=
aft0+RwozJMKojY5lVs7waL-xDY/">HERE</a></b><br clear=3D"all"><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div><br></div><div>Kelly Choi<br></div><div><div style=3D"colo=
r:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,=
136)"><a href=3D"https://xenproject.org/" target=3D"_blank">Xen Project</a>=
<br></div></div></div></div></div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 1, 2024 at 2:26=E2=
=80=AFPM Kelly Choi &lt;<a href=3D"mailto:kelly.choi@cloud.com">kelly.choi@=
cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m pleased to a=
nnounce the next Xen Project meetup in Cambridge!=C2=A0</div><div><br></div=
><div><b>Please save the date: <br>Thursday 24th October 2024</b></div><div=
><b>Location: <br>XenServer office (Citrix), 101 Cambridge Science Park Rd,=
 Milton, Cambridge CB4 0FY</b></div><div><b>Time: 18:00 - 20:00=C2=A0</b></=
div><div><b><br></b></div><div>What to expect?</div><div>A developer social=
 with food and drinks included!</div><div>Informative sessions from speaker=
s within the community (more details to follow).</div><div>This is free to =
attend,=C2=A0but <font color=3D"#ff0000">you will need to register=C2=A0<b>=
<a href=3D"https://docs.google.com/forms/d/e/1FAIpQLScQS15qh_IAUhmbTy2gNmfx=
NzaVuI5QDw3G6oBa0rmrVt5-2w/viewform?usp=3Dsf_link" target=3D"_blank">HERE</=
a>.=C2=A0</b></font></div><div><br></div><div>We are looking for a sponsor,=
 so if your company wishes to support us please get in touch with me.</div>=
<div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136,136=
)">Community Manager</div><div style=3D"color:rgb(136,136,136)"><a href=3D"=
https://xenproject.org/" target=3D"_blank">Xen Project</a><br></div></div><=
/div></div></div></div></div>
</blockquote></div>

--0000000000008c489506236cb42c--

