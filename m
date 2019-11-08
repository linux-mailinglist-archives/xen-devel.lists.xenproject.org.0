Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AC3F5B40
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 23:46:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTCzW-0002NC-LE; Fri, 08 Nov 2019 22:44:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zNiG=ZA=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iTCzU-0002N7-Kh
 for xen-devel@lists.xen.org; Fri, 08 Nov 2019 22:44:28 +0000
X-Inumbo-ID: 5135ba02-0279-11ea-9631-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5135ba02-0279-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 22:44:27 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v8so7837249ljh.5
 for <xen-devel@lists.xen.org>; Fri, 08 Nov 2019 14:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zCO0Ue+WCC5mboJw46/VD5nDxpH2tNOimij50ZSmUPM=;
 b=J7plNBnEyQoonINyUcHCIYERVSKINV5MudsVuZ/8a7/uELWrpULVBpAsd/HOLjngkY
 50vIpoz5Zmsz/F5uBrm52bpnpVZVVRfLOjtc2Fdm96i8Ozx7+Lb+BbYMIWggiFCG7Rc9
 iTfx1oj+Pg8r6/SwB2ZRx/zWQG7iWuoZa3J4wqX5uLHlhUVW7B3IOWttZwnaNyc+2/v2
 +hBA96oeigHs9vY/Zo1LalCFT6avOc7MlZkvjkCSrlz07DwthJo8ChW9VC1eLWxNY/4v
 G0RDZ34uEHDFVrFyj+onc3JJpDlO0Cn3SMTnNZMKetDIecFVsaucu7dbklOuHPgL43R5
 Jg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zCO0Ue+WCC5mboJw46/VD5nDxpH2tNOimij50ZSmUPM=;
 b=fE6+ZW87jNpjLwdaTVIB9eHtkuD2g2ayJUBonpRkh367HWZB5tMlPGrmYStwYi4Nr8
 r8vb0ueSVMr2NmoJd1PKEhkn/phh4/TrNuz/NaF9Y/8zF2NQmiSV7NYQ4rgx7CFGfz35
 eL1i/yl7s0zin1sLrp93Otdvv2ueGza+Aey7MkWnND6PHqSOMhrsHWLNWHclGpnp4BGS
 V23u+oxjcCKu8JV4VIQnghXSYSuYFmBpYCAhm/LRpkwE59zzYpo/AJ67JJFe5AG6D4QA
 VQou+Hi6UNlad4GKu1ZpKWN+L7Wlsd3Lr2IkaL5wDije7HLlg+ugMIfsBMW1fLlUafDm
 5Fig==
X-Gm-Message-State: APjAAAVM25vG06dPrQTUkghhPqLKNDeRzuqkiPKX02fDT47FkgCoQaq+
 GzpkyhB6mNc99Z9cmEiVWgBcQynvnuKTKxY1RhQ=
X-Google-Smtp-Source: APXvYqxQjEdIveXm39NE57ErhjJ8nCRigvFUgqCKf8GO5Kq+FAWJRgMX3yvQZTzkegqcxI5cmt+AV7sqKBqGd6pLtzA=
X-Received: by 2002:a2e:8947:: with SMTP id b7mr8081552ljk.29.1573253065854;
 Fri, 08 Nov 2019 14:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sat, 9 Nov 2019 07:44:13 +0900
Message-ID: <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
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
 Peng Fan <peng.fan@nxp.com>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="===============7795858920872336594=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7795858920872336594==
Content-Type: multipart/alternative; boundary="00000000000021d2f90596dd86f1"

--00000000000021d2f90596dd86f1
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Sat, 9 Nov 2019, 04:27 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 7 Nov 2019, Peng Fan wrote:
> > The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>

To be honest, I am not sure the code is correct. A read to those registers
should tell you the list of interrupts active. As we always return 0, this
will not return the correct state of the GIC.

I know that returning the list of actives interrupts is complicated with
the old vGIC, but I don't think silently ignoring it is a good idea.

The question here is why the guest accessed those registers? What is it
trying to figure out?



> Juergen, I think this fix should be in the release (and also
> backported to stable trees.)
>

Without an understanding of the problem, I disagree with this request (see
above).

As an aside, the range ISPENDR  has the same issue.

Cheers,




>
>
> > ---
> >  xen/arch/arm/vgic-v3.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> > index 422b94f902..e802f2055a 100644
> > --- a/xen/arch/arm/vgic-v3.c
> > +++ b/xen/arch/arm/vgic-v3.c
> > @@ -706,7 +706,7 @@ static int __vgic_v3_distr_common_mmio_read(const
> char *name, struct vcpu *v,
> >          goto read_as_zero;
> >
> >      /* Read the active status of an IRQ via GICD/GICR is not supported
> */
> > -    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVER):
> > +    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
> >      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
> >          goto read_as_zero;
> >
> > --
> > 2.16.4
> >
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--00000000000021d2f90596dd86f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Sorry for the formatting.<br><br><div class=3D"gmail_quote" dir=3D"auto"=
><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 9 Nov 2019, 04:27 Stefano St=
abellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 7 Nov 20=
19, Peng Fan wrote:<br>
&gt; The end should be GICD_ISACTIVERN not GICD_ISACTIVER.<br>
&gt; <br>
&gt; Signed-off-by: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" target=
=3D"_blank" rel=3D"noreferrer">peng.fan@nxp.com</a>&gt;<br>
<br>
Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">To be=
 honest, I am not sure the code is correct. A read to those registers shoul=
d tell you the list of interrupts active. As we always return 0, this will =
not return the correct state of the GIC.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">I know that returning the list of actives interrupts is co=
mplicated with the old vGIC, but I don&#39;t think silently ignoring it is =
a good idea.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The questio=
n here is why the guest accessed those registers? What is it trying to figu=
re out?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Juergen, I think this fix should be in the release (and also<br>
backported to stable trees.)<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Without an understanding of the problem, I disa=
gree with this request (see above).</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">As an aside, the range ISPENDR=C2=A0 has the same issue.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/arm/vgic-v3.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c<br>
&gt; index 422b94f902..e802f2055a 100644<br>
&gt; --- a/xen/arch/arm/vgic-v3.c<br>
&gt; +++ b/xen/arch/arm/vgic-v3.c<br>
&gt; @@ -706,7 +706,7 @@ static int __vgic_v3_distr_common_mmio_read(const =
char *name, struct vcpu *v,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto read_as_zero;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Read the active status of an IRQ via GICD/GICR =
is not supported */<br>
&gt; -=C2=A0 =C2=A0 case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVER):<br>
&gt; +=C2=A0 =C2=A0 case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto read_as_zero;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.16.4<br>
&gt; <br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"=
noreferrer">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.xenproject.org/mailm=
an/listinfo/xen-devel</a></blockquote></div></div></div>

--00000000000021d2f90596dd86f1--


--===============7795858920872336594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7795858920872336594==--

