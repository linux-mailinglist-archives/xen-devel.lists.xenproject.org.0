Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F01F9FED
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 02:12:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUh9l-0002RK-Ob; Wed, 13 Nov 2019 01:09:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u0j9=ZF=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iUh9k-0002RF-5d
 for xen-devel@lists.xen.org; Wed, 13 Nov 2019 01:09:12 +0000
X-Inumbo-ID: 32a0a250-05b2-11ea-9631-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a0a250-05b2-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 01:09:10 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y186so467413lfa.1
 for <xen-devel@lists.xen.org>; Tue, 12 Nov 2019 17:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UXMZxgHu96+EeB3Eg4uiahwcsbg5pD7fynnjr4m0PKs=;
 b=DFFFQCVq4qYZnjphmks8ZXYU2yRPB73wq8bV0TfsAZrPwcF1Qq+HcUaF86KvhLobGj
 NZygY71rDo8sVyln7XRI7n3fsFAP3PesNoLTVCMBABXw/RW4DkYLZhjBIpp6U/C2qlN+
 4h8GtFtFJikkrty8H64nuQqn6F5KYD+q1w7g1vgzkvVJTPSex4TWhBBj0vxF95r6z3hv
 pGlfsSeRN51ES3maN2u2XsV0XKDu0gtPUaKw6gPzbZ/faf7r0LVkJjaYSMfpkKfIj1fq
 5/5dOTsx3s1UlssBrd1jB3mruK8tRBwJ4+MgoYW91AQUk94YawCVt5jeuRqCHMeGMKK8
 zyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UXMZxgHu96+EeB3Eg4uiahwcsbg5pD7fynnjr4m0PKs=;
 b=GiRFJ7fM4RTgj1Q3V5kFuGty4C1JnXqabjfIr5pSfy6xAKO7WGTvuAh05FrohgHaf1
 Zrt2wIltN7XirH10hNAxAmCHAS31YNZ/CMjX+r3/y5nftOYzilZBmseiA2WWSmIXGuE8
 3z0jOVLYLVXMwkkYXCCBQV96rlF2xxlebXEY1RohzjGPZMXlxdA4ZXs48TYmehQbV0D/
 6rzOreRKWrjDQROKI/b67kAXt19eByILNSdZE1ovKnjkKFa6R9g24TfQuGB/0jn++DQs
 YiiqUCXC70uKTIxRhfpH/7QwzS7OoZHNJJ3u1qSwOSjEoBWDA6pM3LwPVOeYBEZl2DVj
 B1dg==
X-Gm-Message-State: APjAAAVj55LtQb7X+IG4jlVpkenObfstUIhvNmZn5GTBceqp0h1N/9wh
 0/jtu0pPcI1ziCWG5RoPfv6go2SJ0THncUZr62g=
X-Google-Smtp-Source: APXvYqzCuk1AHANYOpFtm0VpG3lZSxArlyk0iWAU2CC2CzF/uXA9cYX7ZeRlmRl1MfjwgT39oyhMagayjPbTRIiefvo=
X-Received: by 2002:a19:500d:: with SMTP id e13mr468318lfb.85.1573607349584;
 Tue, 12 Nov 2019 17:09:09 -0800 (PST)
MIME-Version: 1.0
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
 <alpine.DEB.2.21.1911111049000.2677@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911111049000.2677@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 13 Nov 2019 10:08:57 +0900
Message-ID: <CAJ=z9a0TPPzSCMBHsR9e2A1Qvpsrk_K7tqfcKTUYYcTq84hA+Q@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
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
 Andre Przywara <andre.przywara@arm.com>, Peng Fan <peng.fan@nxp.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="===============0755808346573012229=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0755808346573012229==
Content-Type: multipart/alternative; boundary="0000000000001687080597300375"

--0000000000001687080597300375
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2019, 04:01 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Sat, 9 Nov 2019, Julien Grall wrote:
> > On Sat, 9 Nov 2019, 04:27 Stefano Stabellini, <sstabellini@kernel.org>
> wrote:
> >       On Thu, 7 Nov 2019, Peng Fan wrote:
> >       > The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
> >       >
> >       > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> >       Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >
> >
> > To be honest, I am not sure the code is correct. A read to those
> registers should tell you the list of interrupts active. As we always
> > return 0, this will not return the correct state of the GIC.
> >
> > I know that returning the list of actives interrupts is complicated with
> the old vGIC, but I don't think silently ignoring it is a good
> > idea.
> > The question here is why the guest accessed those registers? What is it
> trying to figure out?
>
> We are not going to solve the general problem at this stage. At the
> moment the code:
>
> - ignore the first register only
> - print an error and return an IO_ABORT error for the other regs
>
> For the inconsistency alone the second option is undesirable. Also it
> doesn't match the write implementation, which does the same thing for
> all the GICD_ISACTIVER* regs instead of having a special treatment for
> the first one only. It looks like a typo in the original patch to me.
>
> The proposed patch switches the behavior to:
>
> - silently ignore all the GICD_ISACTIVER* regs (as proposed)


> is an improvement.
>

Peng mentioned that Linux is accessing it, so the worst thing we can do is
lying to the guest (as you suggest here). I would definitely not call that
an improvement.

In the current state, it is a Nack. If there were a warning, then I would
be more inclined to see this patch going through.

Cheers,

--0000000000001687080597300375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 12 Nov 2019, 04:01 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer"=
>sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On Sat, 9 Nov 2019, Julien Grall wrote:<br>
&gt; On Sat, 9 Nov 2019, 04:27 Stefano Stabellini, &lt;<a href=3D"mailto:ss=
tabellini@kernel.org" rel=3D"noreferrer noreferrer" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Thu, 7 Nov 2019, Peng Fan wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The end should be GICD_ISACTIVERN not G=
ICD_ISACTIVER.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Peng Fan &lt;<a href=3D"=
mailto:peng.fan@nxp.com" rel=3D"noreferrer noreferrer" target=3D"_blank">pe=
ng.fan@nxp.com</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Reviewed-by: Stefano Stabellini &lt;<a href=
=3D"mailto:sstabellini@kernel.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; To be honest, I am not sure the code is correct. A read to those regis=
ters should tell you the list of interrupts active. As we always<br>
&gt; return 0, this will not return the correct state of the GIC.<br>
&gt; <br>
&gt; I know that returning the list of actives interrupts is complicated wi=
th the old vGIC, but I don&#39;t think silently ignoring it is a good<br>
&gt; idea.<br>
&gt; The question here is why the guest accessed those registers? What is i=
t trying to figure out?<br>
<br>
We are not going to solve the general problem at this stage. At the<br>
moment the code:<br>
<br>
- ignore the first register only<br>
- print an error and return an IO_ABORT error for the other regs<br>
<br>
For the inconsistency alone the second option is undesirable. Also it<br>
doesn&#39;t match the write implementation, which does the same thing for<b=
r>
all the GICD_ISACTIVER* regs instead of having a special treatment for<br>
the first one only. It looks like a typo in the original patch to me.<br>
<br>
The proposed patch switches the behavior to:<br>
<br>
- silently ignore all the GICD_ISACTIVER* regs (as proposed)</blockquote></=
div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
is an improvement.<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div dir=3D"auto">Peng mentioned that Linux is accessing =
it, so the worst thing we can do is lying to the guest (as you suggest here=
). I would definitely not call that an improvement.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div dir=3D"auto">In the current state, it is a=
 Nack. If there were a warning, then I would be more inclined to see this p=
atch going through.</div></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Cheers,</div></div>

--0000000000001687080597300375--


--===============0755808346573012229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0755808346573012229==--

