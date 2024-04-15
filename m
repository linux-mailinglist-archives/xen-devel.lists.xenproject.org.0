Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB68A4D81
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 13:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706056.1103083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwKNF-0006Dh-AJ; Mon, 15 Apr 2024 11:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706056.1103083; Mon, 15 Apr 2024 11:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwKNF-0006B9-7Z; Mon, 15 Apr 2024 11:19:45 +0000
Received: by outflank-mailman (input) for mailman id 706056;
 Mon, 15 Apr 2024 11:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQAh=LU=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rwKND-0006B3-Cg
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 11:19:43 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e4aa333-fb1a-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 13:19:42 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-518a56cdbceso2046782e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 04:19:42 -0700 (PDT)
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
X-Inumbo-ID: 0e4aa333-fb1a-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713179982; x=1713784782; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t9x7UxFYQJD0O0rY79qm3eAKOY6SZQ1MjRrWksfOPLM=;
        b=g6cpF12njAQbiICrbei9002t1Vn8FnULHt0u+yTkgoFs/mOwYu9tLyJGBug46KGHBw
         2CzVFhE+nMUyKe9dPl6yaL0w08jTwogrReiYJFlXFkqjh10l1AHgUV6YK4n+q8DixUoD
         lcM+qy7zwg7deAipOkFCLzqFKMLb4VAZwOhPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713179982; x=1713784782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9x7UxFYQJD0O0rY79qm3eAKOY6SZQ1MjRrWksfOPLM=;
        b=K1Kz1grGNFtSVgXsm83jviU5u0/u/JkfNqWxtFuOmdmd+FX+WBREPPmpBvYkoT7BZ6
         Zck0wETZFzmz0+2KlbJU2XY2aEnv2dzrO32LT6nsAaC67Bl5gpt3tk2W8zrYFjt0+yqC
         +FyTDcPiHKkhz30lBaBpMXqiPbFJeO1PYAULaYOF3QKvmXyfEuCfgrtzpAG7cra5ZNq7
         8Wab6zfEa7yxkVUUeH2mSG1/EQwuO9J9kK6hKcgXYzvcY7HxQVcFq3fy9yPcrv0P0/NL
         /rN2HoMEwWzKeRInbuM2vVn7x/ZoyqAQl+3lkM7QVkDJIiMDGEI+ZTVpcj8bZ6tKPcjN
         tO4w==
X-Forwarded-Encrypted: i=1; AJvYcCWqJ6QR6Gb3M26uQnwK3UAONqCfvjkHOnqjC5kYWcqSHiiXKxSalbkxLmdK0fTaZKxXvNAHB753RSDyF3+I1AO0zPtumAE1Ju2Kegz/YbE=
X-Gm-Message-State: AOJu0YymRdDhUeJVX9jHNI8HhuIZP8ebpe3zMoptaTHAMHAAAWuSCFav
	ljFybBXfiWsN5g7+LIkyGN3tkbO0b/DC0MOhYH0jjEcGIL9fTs2RtO6DAz6XqK7tCS4aCzc02bp
	T9rXkQcsv6ujLsI3J3Fjmiyw7bguV0TAs5IEDZA==
X-Google-Smtp-Source: AGHT+IFcNxR3QX4yhYah6UwRp7V8eBL8iuuilubgIH1FHHM7io2AoUYACc2SnteXjz1cNPsSmILW4cEhcDObdqET5f8=
X-Received: by 2002:a05:6512:241:b0:516:cd6f:cc53 with SMTP id
 b1-20020a056512024100b00516cd6fcc53mr5540451lfo.39.1713179981747; Mon, 15 Apr
 2024 04:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se> <084b9ed5-1585-4802-b504-6ccd2f262542@xen.org>
 <69dcd768-74b8-4033-8ab3-77848d6774dc@citrix.com> <4b39f4fa-246d-479e-ab76-ff234b641703@xen.org>
In-Reply-To: <4b39f4fa-246d-479e-ab76-ff234b641703@xen.org>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 15 Apr 2024 12:19:05 +0100
Message-ID: <CAO-mL=wLm4J_rMa914BUxY0AL+3yZLP72NkfkA8zergQM5W=Hg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, John Ernberg <john.ernberg@actia.se>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"conduct@xenproject.org" <conduct@xenproject.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan <peng.fan@nxp.com>, 
	Jonas Blixt <jonas.blixt@actia.se>
Content-Type: multipart/alternative; boundary="0000000000003fbb22061620cca3"

--0000000000003fbb22061620cca3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We all have a responsibility and pledge to make this community a welcoming
environment.
As such, I would like to request we keep the Code of Conduct and patch
discussions separate.
Should there be a need for any Code of Conduct complaints/investigations,
this will be treated separately.

Thank you John for your contributions.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Mon, Apr 15, 2024 at 12:03=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:

>
>
> On 15/04/2024 11:50, Andrew Cooper wrote:
> > On 15/04/2024 11:25 am, Julien Grall wrote:
> >> Hi John,
> >>
> >> I saw this patch was committed. I have one question this may require
> >> some adjustment.
> >>
> >> On 08/04/2024 17:11, John Ernberg wrote:
> >>> ---
> >>>    xen/arch/arm/platforms/Makefile |   1 +
> >>>    xen/arch/arm/platforms/imx8qm.c | 139
> ++++++++++++++++++++++++++++++++
> >>>    2 files changed, 140 insertions(+)
> >>>    create mode 100644 xen/arch/arm/platforms/imx8qm.c
> >>>
> >>> diff --git a/xen/arch/arm/platforms/Makefile
> >>> b/xen/arch/arm/platforms/Makefile
> >>> index 8632f4115f..bec6e55d1f 100644
> >>> --- a/xen/arch/arm/platforms/Makefile
> >>> +++ b/xen/arch/arm/platforms/Makefile
> >>> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   +=3D sunxi.o
> >>>    obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o
> >>>    obj-$(CONFIG_ALL64_PLAT) +=3D xgene-storm.o
> >>>    obj-$(CONFIG_ALL64_PLAT) +=3D brcm-raspberry-pi.o
> >>> +obj-$(CONFIG_ALL64_PLAT) +=3D imx8qm.o
> >>>    obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp.o
> >>>    obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp-eemi.o
> >>> diff --git a/xen/arch/arm/platforms/imx8qm.c
> >>> b/xen/arch/arm/platforms/imx8qm.c
> >>> new file mode 100644
> >>> index 0000000000..3600a073e8
> >>> --- /dev/null
> >>> +++ b/xen/arch/arm/platforms/imx8qm.c
> >>> @@ -0,0 +1,139 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >>
> >> The majority of Xen code is using GPL-2.0-only. In the early days for
> >> Xen on Arm we started to use GPLv2+ which I consider it was a mistake.
> >> Unfortunately this started to spread as people copied/pasted the same
> >> copyright headers.
> >>
> >> So can you confirm whether you intended to use GPL-2.0+? If not would
> >> you be able to send a patch to adjust it? (Better to it before there
> >> are more modifications).
> >
> > Julien: I've called you out multiple times before.
>
> And there are multiple thread explaining why I am requesting if we can
> use GPLv2-only. In fact from CONTRIBUTING:
>
> The recommended license of a directory will depend on the COPYING file.
> If the new file is using a different license, this should be highlighted
> and discussed in the commit message or cover letter introducing the
> file.
>
> > Don't ever bully contributors into changing licensing.  It is
> > unacceptable behaviour, and in most cases - including this one by the
> > looks of things - not legal.
>
> I don't think I have bullied the contributor. I have asked politely
> whether it can be done. There is nothing illegal (see above).
>
> The problematic behavior is you trying to pressure the other people to
> accept your point of view by been condescending or insulting them like
> you did here.
>
> I have reported this behavior several times to CoC. And I guess this
> need to happen again.
>
> Cheers,
>
> --
> Julien Grall
>

--0000000000003fbb22061620cca3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>We all have a responsibili=
ty and pledge to make this community a welcoming environment.</div><div>As =
such, I would like to request we keep the Code of Conduct and patch discuss=
ions separate.=C2=A0</div><div>Should there be a need for any Code of Condu=
ct complaints/investigations, this will be treated separately.=C2=A0=C2=A0<=
/div><div><br></div><div>Thank you John for your contributions.=C2=A0</div>=
<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div=
>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">=
Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=
=A0<br></div></div></div></div></div><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 15, 2024 at 12:0=
3=E2=80=AFPM Julien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
<br>
On 15/04/2024 11:50, Andrew Cooper wrote:<br>
&gt; On 15/04/2024 11:25 am, Julien Grall wrote:<br>
&gt;&gt; Hi John,<br>
&gt;&gt;<br>
&gt;&gt; I saw this patch was committed. I have one question this may requi=
re<br>
&gt;&gt; some adjustment.<br>
&gt;&gt;<br>
&gt;&gt; On 08/04/2024 17:11, John Ernberg wrote:<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 xen/arch/arm/platforms/Makefile |=C2=A0=C2=A0 1 +=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 xen/arch/arm/platforms/imx8qm.c | 139 +++++++++++=
+++++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 140 insertions(+)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644 xen/arch/arm/platforms/imx8qm.=
c<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/xen/arch/arm/platforms/Makefile<br>
&gt;&gt;&gt; b/xen/arch/arm/platforms/Makefile<br>
&gt;&gt;&gt; index 8632f4115f..bec6e55d1f 100644<br>
&gt;&gt;&gt; --- a/xen/arch/arm/platforms/Makefile<br>
&gt;&gt;&gt; +++ b/xen/arch/arm/platforms/Makefile<br>
&gt;&gt;&gt; @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)=C2=A0=C2=A0 +=3D sunxi.=
o<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 obj-$(CONFIG_ALL64_PLAT) +=3D xgene-storm.o<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 obj-$(CONFIG_ALL64_PLAT) +=3D brcm-raspberry-pi.o=
<br>
&gt;&gt;&gt; +obj-$(CONFIG_ALL64_PLAT) +=3D imx8qm.o<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 obj-$(CONFIG_MPSOC_PLATFORM)=C2=A0 +=3D xilinx-zy=
nqmp.o<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 obj-$(CONFIG_MPSOC_PLATFORM)=C2=A0 +=3D xilinx-zy=
nqmp-eemi.o<br>
&gt;&gt;&gt; diff --git a/xen/arch/arm/platforms/imx8qm.c<br>
&gt;&gt;&gt; b/xen/arch/arm/platforms/imx8qm.c<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000000..3600a073e8<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/xen/arch/arm/platforms/imx8qm.c<br>
&gt;&gt;&gt; @@ -0,0 +1,139 @@<br>
&gt;&gt;&gt; +/* SPDX-License-Identifier: GPL-2.0-or-later */<br>
&gt;&gt;<br>
&gt;&gt; The majority of Xen code is using GPL-2.0-only. In the early days =
for<br>
&gt;&gt; Xen on Arm we started to use GPLv2+ which I consider it was a mist=
ake.<br>
&gt;&gt; Unfortunately this started to spread as people copied/pasted the s=
ame<br>
&gt;&gt; copyright headers.<br>
&gt;&gt;<br>
&gt;&gt; So can you confirm whether you intended to use GPL-2.0+? If not wo=
uld<br>
&gt;&gt; you be able to send a patch to adjust it? (Better to it before the=
re<br>
&gt;&gt; are more modifications).<br>
&gt; <br>
&gt; Julien: I&#39;ve called you out multiple times before.<br>
<br>
And there are multiple thread explaining why I am requesting if we can <br>
use GPLv2-only. In fact from CONTRIBUTING:<br>
<br>
The recommended license of a directory will depend on the COPYING file.<br>
If the new file is using a different license, this should be highlighted<br=
>
and discussed in the commit message or cover letter introducing the<br>
file.<br>
<br>
&gt; Don&#39;t ever bully contributors into changing licensing.=C2=A0 It is=
<br>
&gt; unacceptable behaviour, and in most cases - including this one by the<=
br>
&gt; looks of things - not legal.<br>
<br>
I don&#39;t think I have bullied the contributor. I have asked politely <br=
>
whether it can be done. There is nothing illegal (see above).<br>
<br>
The problematic behavior is you trying to pressure the other people to <br>
accept your point of view by been condescending or insulting them like <br>
you did here.<br>
<br>
I have reported this behavior several times to CoC. And I guess this <br>
need to happen again.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div>

--0000000000003fbb22061620cca3--

