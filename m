Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9866810A762
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 01:16:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZkxj-0005dO-JB; Wed, 27 Nov 2019 00:13:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Kpg=ZT=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iZkxi-0005dJ-Dj
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 00:13:42 +0000
X-Inumbo-ID: c4588bce-10aa-11ea-a55d-bc764e2007e4
Received: from mail-vs1-xe44.google.com (unknown [2607:f8b0:4864:20::e44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4588bce-10aa-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 00:13:41 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id y195so312548vsy.5
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 16:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r18oB+ZlWNRSy62Fo/6PHlbwsYsak4md1sAfXodz2vo=;
 b=QL1Fct6OS+EuqhKrh96+WDP/xgV51490AdpQsyFatHDSS8yAIboMPlEgDlhrCf3HPh
 qvPLLNZkOxgEsOOQHNLdNLWrxJMtXd38w3eU50A54mJ4YbhFG/KwkEhk3IRF9U4dnyLK
 6JJnKafOq4BImotn3krdPxvcm3QZqwl+D61P43/zv1ByrBggFbg6L4lAD2+MIIROWRss
 48PnSyvuCC4LZ3xafncBzV7/CiGuaLQC51p7t77WXfEx7LJu9gr2378yF1S/uhax899k
 ofRjLGtn/mHnYoNDBtQZ+/4fxBuyUAUbw50XT3fVEc0lYpw51uVWscBFJkF2Db+bWQah
 4+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r18oB+ZlWNRSy62Fo/6PHlbwsYsak4md1sAfXodz2vo=;
 b=s35yroDSCIgn/j4u5JfcjukKzz88/ZB78/cpBtWZgfeWEPlHi8yeaOioO2E99XrjEs
 noPUdULeugILeIj7u8GILuUeANEHooUvyOz8AoX/v0u9YfQOC4o1JtBASgJ9//lKH1nr
 0F+ImxZofgiQwOAeDeNmsT00UYbbgX4Bm/rxw9E/c/1afZNjSfaxvnFjaOw6kBkhEYuj
 8dPIXVnXL6DXOCv96GgbnT4HfV8bn4lgg4pScV1Vd5Ej+R8yk51URn/WE2TRIbRWcc1b
 YQ6Jt1S66jPi2nzP4gso6CPIkTrVdnXJa9TX6m49kwaLGx3fCU6DFDUA0V2zrSAsV9Fp
 GjrA==
X-Gm-Message-State: APjAAAXiCRpsGrnw0J3oXqZcN4/DV8SDHD4YmvISRKeLMkynXDPATwoN
 3JaooB1QpN4VCDO9/Sx2NXgjW21pjbRfmjn30dE=
X-Google-Smtp-Source: APXvYqzn9B2gI5HY1VY7T9XpHhitcoR6m7bYqP7LIJMlSNgfKPNAQSRIddbjN5cfBZopsDQfLoqtexn0TUTJzG3+8MY=
X-Received: by 2002:a67:d198:: with SMTP id w24mr26685657vsi.13.1574813620856; 
 Tue, 26 Nov 2019 16:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
 <alpine.DEB.2.21.1911261418240.8205@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911261418240.8205@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@gmail.com>
Date: Wed, 27 Nov 2019 00:13:29 +0000
Message-ID: <CAF3u54B5GHVFkmghDPYhO+W4Z3L6bMqg2MnPvvpr7J+FDNq5Xg@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery
 of PPIs to guests
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============7264794904304555261=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7264794904304555261==
Content-Type: multipart/alternative; boundary="000000000000756d3b059848dec5"

--000000000000756d3b059848dec5
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Nov 2019, 23:18 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Fri, 15 Nov 2019, Stewart Hildebrand wrote:
> > Allow vgic_get_hw_irq_desc to be called with a vcpu argument.
> >
> > Use vcpu argument in vgic_connect_hw_irq.
> >
> > vgic_connect_hw_irq is called for PPIs and SPIs, not SGIs. Enforce with
> > ASSERTs.
> >
> > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> >
> > ---
> > v3: new patch
> >
> > ---
> > Note: I have only modified the old vgic to allow delivery of PPIs.
> > ---
> >  xen/arch/arm/gic-vgic.c | 24 ++++++++++++++++--------
> >  xen/arch/arm/vgic.c     |  6 +++---
> >  2 files changed, 19 insertions(+), 11 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> > index 98c021f1a8..2c66a8fa92 100644
> > --- a/xen/arch/arm/gic-vgic.c
> > +++ b/xen/arch/arm/gic-vgic.c
> > @@ -418,7 +418,7 @@ struct irq_desc *vgic_get_hw_irq_desc(struct domain
> *d, struct vcpu *v,
> >  {
> >      struct pending_irq *p;
> >
> > -    ASSERT(!v && virq >= 32);
> > +    ASSERT((!v && (virq >= 32)) || (!d && v && (virq >= 16) && (virq <
> 32)));
>
> I don't think !d is necessary for this to work as intended so I would
> limit the ASSERT to
>
>   ASSERT((!v && (virq >= 32)) || (v && (virq >= 16) && (virq < 32)));
>
> the caller can always pass v->domain
>

But then you have the risk to run into d != v->domain. So at least with the
ASSERT you document the expectation.

Cheers,


>
> >      if ( !v )
> >          v = d->vcpu[0];
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000756d3b059848dec5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 26 Nov 2019, 23:18 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Fri, 15 Nov 2019, Stewart Hild=
ebrand wrote:<br>
&gt; Allow vgic_get_hw_irq_desc to be called with a vcpu argument.<br>
&gt; <br>
&gt; Use vcpu argument in vgic_connect_hw_irq.<br>
&gt; <br>
&gt; vgic_connect_hw_irq is called for PPIs and SPIs, not SGIs. Enforce wit=
h<br>
&gt; ASSERTs.<br>
&gt; <br>
&gt; Signed-off-by: Stewart Hildebrand &lt;<a href=3D"mailto:stewart.hildeb=
rand@dornerworks.com" target=3D"_blank" rel=3D"noreferrer">stewart.hildebra=
nd@dornerworks.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; v3: new patch<br>
&gt; <br>
&gt; ---<br>
&gt; Note: I have only modified the old vgic to allow delivery of PPIs.<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/arm/gic-vgic.c | 24 ++++++++++++++++--------<br>
&gt;=C2=A0 xen/arch/arm/vgic.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt;=C2=A0 2 files changed, 19 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c<br>
&gt; index 98c021f1a8..2c66a8fa92 100644<br>
&gt; --- a/xen/arch/arm/gic-vgic.c<br>
&gt; +++ b/xen/arch/arm/gic-vgic.c<br>
&gt; @@ -418,7 +418,7 @@ struct irq_desc *vgic_get_hw_irq_desc(struct domai=
n *d, struct vcpu *v,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct pending_irq *p;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 ASSERT(!v &amp;&amp; virq &gt;=3D 32);<br>
&gt; +=C2=A0 =C2=A0 ASSERT((!v &amp;&amp; (virq &gt;=3D 32)) || (!d &amp;&a=
mp; v &amp;&amp; (virq &gt;=3D 16) &amp;&amp; (virq &lt; 32)));<br>
<br>
I don&#39;t think !d is necessary for this to work as intended so I would<b=
r>
limit the ASSERT to<br>
<br>
=C2=A0 ASSERT((!v &amp;&amp; (virq &gt;=3D 32)) || (v &amp;&amp; (virq &gt;=
=3D 16) &amp;&amp; (virq &lt; 32)));<br>
<br>
the caller can always pass v-&gt;domain<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">But then you have the risk to run in=
to d !=3D v-&gt;domain. So at least with the ASSERT you document the expect=
ation.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( !v )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D d-&gt;vcpu[0];<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"=
noreferrer">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.xenproject.org/mailm=
an/listinfo/xen-devel</a></blockquote></div></div></div>

--000000000000756d3b059848dec5--


--===============7264794904304555261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7264794904304555261==--

