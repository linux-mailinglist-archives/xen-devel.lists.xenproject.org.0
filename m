Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB56FC06D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 08:01:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iV95F-0006HL-8R; Thu, 14 Nov 2019 06:58:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lG4C=ZG=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iV95D-0006HG-Ph
 for xen-devel@lists.xen.org; Thu, 14 Nov 2019 06:58:23 +0000
X-Inumbo-ID: 25d8711a-06ac-11ea-9631-bc764e2007e4
Received: from mail-vs1-xe43.google.com (unknown [2607:f8b0:4864:20::e43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25d8711a-06ac-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 06:58:22 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id c25so3193198vsp.0
 for <xen-devel@lists.xen.org>; Wed, 13 Nov 2019 22:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sr3Ajoz4UyyHvMsC8+QXKNayQ757GlSQCiOE8AVO/1Q=;
 b=iJpiA/d3jT9bP24rh+dNKeCarMNZLUUcxOiwnGgQWbdGTGOcRxT18oZfHMaap7fxvH
 J0bpSW4vibx3EKkvwaXpSgTpRmZI77JLOnKSK8wZDQP9UtZUrkX+AeHuNob/YZdObCsl
 Hs9Zcf9bcDvWfdStIYoT+kTPS1COfKF4lBYzrG8RWFXvpsZdMbwraM8TlaB9hy1sfZAz
 L90SjEErpW9SdxLT12JNSwIg1i+9vJdnpyjJ/G6+6lLaoLuP/EBQZgXEfiZAQEp1FdB0
 44zpxcNi5iHM80f42z9Xjak+b1zw23H1VriZ6NqoYLbizTnF1agI1VXIdGN4MEMYvPqk
 /1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sr3Ajoz4UyyHvMsC8+QXKNayQ757GlSQCiOE8AVO/1Q=;
 b=mFqHEK5UB29ccIpDqxzy/G9LR1iVBXmENbCzxlzL6BHQ4mr8pkm9KAQC3+S4M9c+vu
 AQvmdkWWbZwYEsfNakaBQ9xm9/bu4ce86GjmWyeptQzLOQI5KLZNis+DzJ1A/nwd2dag
 UuXLYrd5oQvu6VjXCCRQAZR5CNGugJ1RkVQm0G0/vhS/Koo2Kjc6ygp88oLhqzRmNoLZ
 d6gg/UC75WPxjtJZAPysfrcEyGkk+7xJrgniV/VPhk4Hl78b7y4HmkywFlgo92beab2H
 Lnbk7jRmXfZpShmWUGVWSYMJfCBpA+5K3q0OMvFn6djyXZi6xLebUilVM+wzP45YpwRQ
 dS0g==
X-Gm-Message-State: APjAAAWgIrkvemC10I7yKRaQeDX0lv6OVfHmH+zy0hl1u3slo9d2nJQV
 g1jgoR2C4Tu7DAJVighhfV/VLFu5D0KkNRHntIU=
X-Google-Smtp-Source: APXvYqy/AzRQW+TjJVUI5aCYHrU/ve+Z7pdU3S29JJRV0efm79UNpOJ4RM1KFUH4CJVqotltFZbwFnYzN2hwDW66IA4=
X-Received: by 2002:a67:fc04:: with SMTP id o4mr4539322vsq.35.1573714702136;
 Wed, 13 Nov 2019 22:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
 <AM0PR04MB44811934638A8DFF51B6B95788770@AM0PR04MB4481.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB44811934638A8DFF51B6B95788770@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Thu, 14 Nov 2019 13:58:09 +0700
Message-ID: <CAF3u54CC7DBwcWm3E=gyTC6qpyWXM6p2aU_+3CiBuasTMk9UBQ@mail.gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 julien grall <julien.grall.oss@gmail.com>
Content-Type: multipart/mixed; boundary="===============3473576562251704069=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3473576562251704069==
Content-Type: multipart/alternative; boundary="000000000000cc78b805974901e7"

--000000000000cc78b805974901e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Nov 2019, 11:45 Peng Fan, <peng.fan@nxp.com> wrote:

> Hi Julien,
>
> Inline marked with [Peng Fan]
>
> From: Julien Grall <julien.grall.oss@gmail.com>
> Sent: 2019=E5=B9=B411=E6=9C=889=E6=97=A5 6:44
> To: Stefano Stabellini <sstabellini@kernel.org>; Andre Przywara <
> andre.przywara@arm.com>
> Cc: Peng Fan <peng.fan@nxp.com>; J=C3=BCrgen Gro=C3=9F <jgross@suse.com>;
> julien.grall@arm.com; xen-devel@lists.xen.org
> Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER
> range
>
> Hi,
>
> Sorry for the formatting.
> On Sat, 9 Nov 2019, 04:27 Stefano Stabellini, <mailto:
> sstabellini@kernel.org> wrote:
> On Thu, 7 Nov 2019, Peng Fan wrote:
> > The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
> >
> > Signed-off-by: Peng Fan <mailto:peng.fan@nxp.com>
>
> Reviewed-by: Stefano Stabellini <mailto:sstabellini@kernel.org>
>
> To be honest, I am not sure the code is correct. A read to those register=
s
> should tell you the list of interrupts active. As we always return 0, thi=
s
> will not return the correct state of the GIC.
>
> I know that returning the list of actives interrupts is complicated with
> the old vGIC, but I don't think silently ignoring it is a good idea.
>
> The question here is why the guest accessed those registers? What is it
> trying to figure out?
>
> [Peng Fan] I am running Linux 5.4 kernel dom0, gic_peek_irq triggers abor=
t.
>

Do you have a call stack trace for this?

Cheers,

--000000000000cc78b805974901e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 12 Nov 2019, 11:45 Peng Fan, &lt;<a href=3D"ma=
ilto:peng.fan@nxp.com">peng.fan@nxp.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hi Julien,<br>
<br>
Inline marked with [Peng Fan]<br>
<br>
From: Julien Grall &lt;<a href=3D"mailto:julien.grall.oss@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">julien.grall.oss@gmail.com</a>&gt; <br>
Sent: 2019=E5=B9=B411=E6=9C=889=E6=97=A5 6:44<br>
To: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;; Andre Przywa=
ra &lt;<a href=3D"mailto:andre.przywara@arm.com" target=3D"_blank" rel=3D"n=
oreferrer">andre.przywara@arm.com</a>&gt;<br>
Cc: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" target=3D"_blank" rel=
=3D"noreferrer">peng.fan@nxp.com</a>&gt;; J=C3=BCrgen Gro=C3=9F &lt;<a href=
=3D"mailto:jgross@suse.com" target=3D"_blank" rel=3D"noreferrer">jgross@sus=
e.com</a>&gt;; <a href=3D"mailto:julien.grall@arm.com" target=3D"_blank" re=
l=3D"noreferrer">julien.grall@arm.com</a>; <a href=3D"mailto:xen-devel@list=
s.xen.org" target=3D"_blank" rel=3D"noreferrer">xen-devel@lists.xen.org</a>=
<br>
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER ran=
ge<br>
<br>
Hi,<br>
<br>
Sorry for the formatting.<br>
On Sat, 9 Nov 2019, 04:27 Stefano Stabellini, &lt;mailto:<a href=3D"mailto:=
sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@ke=
rnel.org</a>&gt; wrote:<br>
On Thu, 7 Nov 2019, Peng Fan wrote:<br>
&gt; The end should be GICD_ISACTIVERN not GICD_ISACTIVER.<br>
&gt; <br>
&gt; Signed-off-by: Peng Fan &lt;mailto:<a href=3D"mailto:peng.fan@nxp.com"=
 target=3D"_blank" rel=3D"noreferrer">peng.fan@nxp.com</a>&gt;<br>
<br>
Reviewed-by: Stefano Stabellini &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&g=
t;<br>
<br>
To be honest, I am not sure the code is correct. A read to those registers =
should tell you the list of interrupts active. As we always return 0, this =
will not return the correct state of the GIC.<br>
<br>
I know that returning the list of actives interrupts is complicated with th=
e old vGIC, but I don&#39;t think silently ignoring it is a good idea.<br>
<br>
The question here is why the guest accessed those registers? What is it try=
ing to figure out?<br>
<br>
[Peng Fan] I am running Linux 5.4 kernel dom0, gic_peek_irq triggers abort.=
<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Do you have a call stack trace for this?</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></d=
iv></div></div>

--000000000000cc78b805974901e7--


--===============3473576562251704069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3473576562251704069==--

