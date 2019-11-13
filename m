Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE705FBE1E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 04:10:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iV5UA-0003Nz-MJ; Thu, 14 Nov 2019 03:07:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NsSN=ZG=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iV5U9-0003Nu-RI
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 03:07:53 +0000
X-Inumbo-ID: f23b730e-068b-11ea-b678-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f23b730e-068b-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 03:07:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d5so4944662ljl.4
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 19:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p/CC9ZS7BU5juYi5nES5o3Li/JxeELAcv1945wWQWLw=;
 b=gwIv9wMcYAaD56vnZOoQ1mSiqerRHwbgWxod1MS7b72NMyOtOXa/Z1RlDZi6wvSp/I
 Lvaj7UOzf0SJO/XooZ3vTlYQyLVSLZh0nPLQFmPgT3DVh6qsFyEkFSy6U6brNu1vcr5B
 ZcmFkNVO5rKH7V3LjFxSSD1nzQaVk7mbe4IGUvMCsq+K4vP/gJfMAhhF9i6A3rUcRg83
 vWcvgT0+IRWNijJRuPyXTcx10Yl6c47mAJWvW+lQwpwuBw/g2Nsw92TEMn/B+8564sWY
 If7GVMs/nYxRQ8PWizvwGMZnwobgLURMgaQgw0jjMQJDgE+mp5dMZNx9dae7SNbyEUfm
 HwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p/CC9ZS7BU5juYi5nES5o3Li/JxeELAcv1945wWQWLw=;
 b=uBK3yyGEBn9PCrZ1ijH8iHeDcf/QgPqgv1S15LlGNiCSTaot2yUAe3bU4zrZWjHjMn
 /pVXQbXdVAETXOWv/3hKV2ybpwvIMbEd45n3iPm0Ddu6eJ7+orVfnReQESjoM2Tyth96
 Mt72raH4QFYr9RKv/wvIVRoAAeMmpPxhIFZm3bvJ30Achmt4+rtCP2uRPQJ5tTmEY107
 ZcNrdAEPu8VB1rokHfTYhnHlpYHSvLy0QfDJwk2+MDw4qAogQNzqmk9g3gx5o9bV5VgS
 fwsO/SXYEZ6iSt8FBXk3KnYVNRDzjUFmrQV46D0CcEr2ItQfjiEj+39JK+kiVYB2UZZ3
 /1qg==
X-Gm-Message-State: APjAAAVtgqLg/yZvRpwhI2ndTuz2sBFr/eOcQaZdeflWofUhwdafRPCH
 N2ENvDUMqGYktSqR/7M0eAiJgmf2oqud8qNbHgk=
X-Google-Smtp-Source: APXvYqznL+SiKGkq9EPXSwzwpKc4rnCxLo60t4EMhhRR/aLjFnY90Ya7cCNL3SCJRVx7T4hpQ4qfJvK72E2xJMO9gD8=
X-Received: by 2002:a2e:2a05:: with SMTP id q5mr4918615ljq.170.1573700871726; 
 Wed, 13 Nov 2019 19:07:51 -0800 (PST)
MIME-Version: 1.0
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111254510.2677@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911111254510.2677@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 14 Nov 2019 08:03:35 +0900
Message-ID: <CAJ=z9a2ORW7NbPKTny=oNux0jSAY+vGkAWK1XQ+QS=gTQryPYQ@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [RFC 6/7] arm: Introduce dummy empty functions for
 data only C files
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
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Type: multipart/mixed; boundary="===============0088370006770509669=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0088370006770509669==
Content-Type: multipart/alternative; boundary="000000000000712d84059745c9c6"

--000000000000712d84059745c9c6
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2019, 05:57 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Wed, 6 Nov 2019, Andrii Anisov wrote:
> > From: Andrii Anisov <andrii_anisov@epam.com>
> >
> > ARM Compiler 6 has a proven bug: it compiles data only C files with
> > SoftVFP attributes. This leads to a failed linkage afterwards with
> > an error:
> >
> > Error: L6242E: Cannot link object built_in.o as its attributes are
> incompatible with the image attributes.
> > ... A64 clashes with SoftVFP.
> >
> > The known workaround is introducing some code into the affected file,
> > e.g. an empty (non-static) function is enough.
>
> Oh man, this is truly horrible.
>
> If we really have to do this please:
>
> - use the same dummy function name in all files
> - the function should be static
> - hiding the function within a #ifdef ARMCC block
> - potentially hide the whole horrible hack behind a #define so that it
>   would become at the call site:
>
>  +ARMCC_DUMMY_FUNC_HACK()


The risk here is we may introduce new file in the future possibly in common
code with similar issues. So I would prefer if we can find an automatic way
to do this. Some ideas:
    - Add the function at compile time (via makefile). This would be done
for all the files but that's should not be a major issues.
    - Force disable softfvp either via command line, new line in the code
or rewriting the attribute of the object.

But before spending time trying to workaround a buggy compiler. What's the
plan with it? Is it going to be used in production or just a demo?

Cheers,

--000000000000712d84059745c9c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 12 Nov 2019, 05:57 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed, 6 Nov 2019, Andrii Anisov=
 wrote:<br>
&gt; From: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" targ=
et=3D"_blank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br>
&gt; <br>
&gt; ARM Compiler 6 has a proven bug: it compiles data only C files with<br=
>
&gt; SoftVFP attributes. This leads to a failed linkage afterwards with<br>
&gt; an error:<br>
&gt; <br>
&gt; Error: L6242E: Cannot link object built_in.o as its attributes are inc=
ompatible with the image attributes.<br>
&gt; ... A64 clashes with SoftVFP.<br>
&gt; <br>
&gt; The known workaround is introducing some code into the affected file,<=
br>
&gt; e.g. an empty (non-static) function is enough.<br>
<br>
Oh man, this is truly horrible.<br>
<br>
If we really have to do this please:<br>
<br>
- use the same dummy function name in all files<br>
- the function should be static<br>
- hiding the function within a #ifdef ARMCC block<br>
- potentially hide the whole horrible hack behind a #define so that it<br>
=C2=A0 would become at the call site:<br>
<br>
=C2=A0+ARMCC_DUMMY_FUNC_HACK()</blockquote></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">The risk here is we may introduce new file in the=
 future possibly in common code with similar issues. So I would prefer if w=
e can find an automatic way to do this. Some ideas:</div><div dir=3D"auto">=
=C2=A0 =C2=A0 - Add the function at compile time (via makefile). This would=
 be done for all the files but that&#39;s should not be a major issues.</di=
v><div dir=3D"auto">=C2=A0 =C2=A0 - Force disable softfvp either via comman=
d line, new line in the code or rewriting the attribute of the object.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">But before spending time try=
ing to workaround a buggy compiler. What&#39;s the plan with it? Is it goin=
g to be used in production or just a demo?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><br></div></div>

--000000000000712d84059745c9c6--


--===============0088370006770509669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0088370006770509669==--

