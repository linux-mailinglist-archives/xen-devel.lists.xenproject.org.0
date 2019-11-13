Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677BF9FFA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 02:16:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUhEr-0003Gv-Dj; Wed, 13 Nov 2019 01:14:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u0j9=ZF=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iUhEq-0003Go-Jp
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 01:14:28 +0000
X-Inumbo-ID: ef35f028-05b2-11ea-b678-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef35f028-05b2-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 01:14:27 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z188so430532lfa.11
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 17:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F4uqtms6iAx5kFSOD9VPXud7fii2k8D2IrCxfzmaW/I=;
 b=n86MtnLA9yjR67jATnHz/AMOiO9+CSPNH+2TulhkmQuSKknBTmTACM7dsTsCzwI5p8
 d/LUZLmd4EYrEC92odpAdyQzlaFdhHE6B5UjjyHlmhUmY6cdHbXF6zeDOZ8iN7Ek4ott
 G3dDzyxMgHlAGYykky6LS5QW3UB9/1hZMtU1xX5qikNLKJ9mE3KF7KjGkaMI62AYQO4Z
 tueJAJzEsGdxsXsoWXfTrSpjmtycCrO+/3LenM+4K/TPnkNqURjIQNVIl4CM7be7pair
 5HsVRQM9tFiqWQAkROlyKQ9hCDrckyqavVB66PQJ9VTBjC1CvLC18mkEFWgrO6CBes3t
 IQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F4uqtms6iAx5kFSOD9VPXud7fii2k8D2IrCxfzmaW/I=;
 b=YnCY3wppmgRoiImFtMxY6wXmsT+mLIJUtnSPO1ZNjWPhfX8Lpdj79PjG63MpLknztR
 SWIPdDtSfGopcskoDjeKdtCvHISha/sF7n2X4+aI2xT2qoInjBydwsndE9Ot2NM55zRj
 fHCgBRYaRNJ6jALoZwVAa6OMHVF1Ha1Tg5gri5Y8j8o4SO0sU3xEAVxCbOBGiUCmuNM9
 weQUZ/3ofWVkNdFzUoH2o+yCEMYICJSkIpWGdq6d8jVTHn19bjOkb7Thc4yN8XBP+2hv
 x8pRSVrP+Q+IWFez+13KQMfVCHxJZTjVj18A3x79j3AdE+WY/XiIlEnpy8g2Tmj9+Gg9
 yygw==
X-Gm-Message-State: APjAAAXnfTWk4JCB8wUydyFLOm36iW9fuTaxdc65oFhuZVqNRa3ICr8h
 WjauoOZs77Q3e0Yp587yUDlvcHcYspm7+/3SYhQ=
X-Google-Smtp-Source: APXvYqwFdV3/pOnFXvGLIO0NjtLqi9Wi1GSxUjUbnjasTD20r6aAWzdCG/y7Xt8s8acemIF0Pp3BqvOqPzfro3x0/hk=
X-Received: by 2002:a19:c606:: with SMTP id w6mr475012lff.71.1573607665957;
 Tue, 12 Nov 2019 17:14:25 -0800 (PST)
MIME-Version: 1.0
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-5-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111250570.2677@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911111250570.2677@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 13 Nov 2019 10:14:12 +0900
Message-ID: <CAJ=z9a1w3rcaybixnJGpNkNEhJDOHnOXz=RtEvX5u7N2nzqxwg@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [RFC 4/7] arm/gic: Drop pointless assertions
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Type: multipart/mixed; boundary="===============7161495344645577618=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7161495344645577618==
Content-Type: multipart/alternative; boundary="000000000000f200240597301565"

--000000000000f200240597301565
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2019, 05:52 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Wed, 6 Nov 2019, Andrii Anisov wrote:
> > From: Andrii Anisov <andrii_anisov@epam.com>
> >
> > Also armclang complains about the condition always true,
> > because `sgi` is of type enum with all its values under 16.
> >
> > Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>
> Although I am not completely opposed to this, given the choice I would
> prefer to keep the ASSERTs.
>

Why? What would that prevent? It is an enum, so unless you do an horrible
hack on the other side, this should always be valid.

But then, why would this be an issue here and not in the tens other place
where enum is used?



> Given that I would imagine that the ARM C Compiler will also complain
> about many other ASSERTs, I wonder if it wouldn't be better to just
> disable *all* ASSERTs when building with armcc by changing the
> implementation of the ASSERT MACRO.


ARM C compiler is valid here and I would not be surprised this will come up
in Clang and GCC in the future.

If you are worry that the enum is going to grow more than 16 items, then
you should use a BUILD_BUG_ON.




>
> > ---
> >  xen/arch/arm/gic.c | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index 113655a..58c6141 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -294,8 +294,6 @@ void __init gic_init(void)
> >
> >  void send_SGI_mask(const cpumask_t *cpumask, enum gic_sgi sgi)
> >  {
> > -    ASSERT(sgi < 16); /* There are only 16 SGIs */
> > -
> >      gic_hw_ops->send_SGI(sgi, SGI_TARGET_LIST, cpumask);
> >  }
> >
> > @@ -306,15 +304,11 @@ void send_SGI_one(unsigned int cpu, enum gic_sgi
> sgi)
> >
> >  void send_SGI_self(enum gic_sgi sgi)
> >  {
> > -    ASSERT(sgi < 16); /* There are only 16 SGIs */
> > -
> >      gic_hw_ops->send_SGI(sgi, SGI_TARGET_SELF, NULL);
> >  }
> >
> >  void send_SGI_allbutself(enum gic_sgi sgi)
> >  {
> > -   ASSERT(sgi < 16); /* There are only 16 SGIs */
> > -
> >     gic_hw_ops->send_SGI(sgi, SGI_TARGET_OTHERS, NULL);
> >  }
> >
> > --
> > 2.7.4
> >
>

--000000000000f200240597301565
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 12 Nov 2019, 05:52 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed, 6 Nov 2019, Andrii Anisov=
 wrote:<br>
&gt; From: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" targ=
et=3D"_blank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br>
&gt; <br>
&gt; Also armclang complains about the condition always true,<br>
&gt; because `sgi` is of type enum with all its values under 16.<br>
&gt; <br>
&gt; Signed-off-by: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.=
com" target=3D"_blank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br=
>
<br>
Although I am not completely opposed to this, given the choice I would<br>
prefer to keep the ASSERTs.<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Why? What would that prevent? It is an enum, so =
unless you do an horrible hack on the other side, this should always be val=
id.</div><div dir=3D"auto"><br></div><div dir=3D"auto">But then, why would =
this be an issue here and not in the tens other place where enum is used?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Given that I would imagine that the ARM C Compiler will also complain<br>
about many other ASSERTs, I wonder if it wouldn&#39;t be better to just<br>
disable *all* ASSERTs when building with armcc by changing the<br>
implementation of the ASSERT MACRO.</blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">ARM C compiler is valid here and I would not=
 be surprised this will come up in Clang and GCC in the future.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">If you are worry that the enum is g=
oing to grow more than 16 items, then you should use a BUILD_BUG_ON.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/arm/gic.c | 6 ------<br>
&gt;=C2=A0 1 file changed, 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c<br>
&gt; index 113655a..58c6141 100644<br>
&gt; --- a/xen/arch/arm/gic.c<br>
&gt; +++ b/xen/arch/arm/gic.c<br>
&gt; @@ -294,8 +294,6 @@ void __init gic_init(void)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void send_SGI_mask(const cpumask_t *cpumask, enum gic_sgi sgi)<b=
r>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 ASSERT(sgi &lt; 16); /* There are only 16 SGIs */<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gic_hw_ops-&gt;send_SGI(sgi, SGI_TARGET_LIST, cpum=
ask);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -306,15 +304,11 @@ void send_SGI_one(unsigned int cpu, enum gic_sgi=
 sgi)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void send_SGI_self(enum gic_sgi sgi)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 ASSERT(sgi &lt; 16); /* There are only 16 SGIs */<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gic_hw_ops-&gt;send_SGI(sgi, SGI_TARGET_SELF, NULL=
);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void send_SGI_allbutself(enum gic_sgi sgi)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0ASSERT(sgi &lt; 16); /* There are only 16 SGIs */<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0gic_hw_ops-&gt;send_SGI(sgi, SGI_TARGET_OTHERS, NUL=
L);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
</blockquote></div></div></div>

--000000000000f200240597301565--


--===============7161495344645577618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7161495344645577618==--

