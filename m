Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAC9A407
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 01:42:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0wg9-0006vI-Fn; Thu, 22 Aug 2019 23:39:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TCGK=WS=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0wg8-0006vA-4g
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 23:39:40 +0000
X-Inumbo-ID: 1b9fb530-c536-11e9-8980-bc764e2007e4
Received: from mail-vs1-xe41.google.com (unknown [2607:f8b0:4864:20::e41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b9fb530-c536-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 23:39:39 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id x20so4816163vsx.13
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2019 16:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4uoNeBQLbN0a+q/BwRH3D7fLkKjuyXAdypRH/6RGSY=;
 b=oY+huU8ZOkkdSDOT+mRtkPQWywtVsTmfnQBMNe1L/eQujJo1j84+mnJlVRLNIKZrqo
 1Tl9sc4rk+vuZ7duU4VFEJLFWM2EEq3Bjx76vsMkl+1/2KIzKUara/YqwPf/Epkgmlky
 gLCfNjgzwf9g9tPG6ut7PuJ8NVVUF4q2CYIkfo0LT5R/EICHDZ8haDBJmA0nvtfIeMiW
 k52e3pArknD/DA8d7Bqx0BTLsAVF3uBb7zzEILOZCD+ToY/ou3JvzVok7193pUyLvrYW
 /oWgKEVvm7qsiNfndvBbZSaDAy3SPL7lbMWZidNuyP7dnk0Y29IjG5bFEhQOeSgX3Jvv
 HWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4uoNeBQLbN0a+q/BwRH3D7fLkKjuyXAdypRH/6RGSY=;
 b=BI5PG9/0FSZ2VLY9Pu2Lsdj8WiiQCT6faPAiuYi5ENp/HF+ylkfQvcc68Cz1HfA76V
 mlyi5ToABvfxy5de/rzxfWBKjx9lojly3q79G8mZsgOly6wsWtU4kAORkxQ0AS1Mpg0H
 gY86MEvf/E0x/utw8UISbq0+WJ/sVuLhofby3EWHMEV+39Af4rBs8+VknTfSBJ/oW1US
 vm70WbtQVwhXK8cbCzYvLeeeRsfPzRyFSqzHPQlyiTafPt3bUusyggBgDJ2xJnpssBtF
 Hh5aKP0p4Ji9TE2+BBHRG3WYgnW038kbfH6Ky/zBv5prFlJhPfL+rzX5O2u/c3h/PMUK
 RLmQ==
X-Gm-Message-State: APjAAAU0es0U3fWiKXDPYVG5AFQqe2ftMp/TWMyQrdY0/umCwUq0DgX+
 7R969Gh8w0Tl7loRFJmR8pXzchAx/Mc1UWggbqw=
X-Google-Smtp-Source: APXvYqwT4JzkxWtwhWTcVs76Nw6HShKckP1SisLhRbjJLelHQHdJKc2en5rOeWoN6ID/EGShXzc6wbHlx3JDNyLtyFs=
X-Received: by 2002:a67:fc14:: with SMTP id o20mr1148102vsq.160.1566517178982; 
 Thu, 22 Aug 2019 16:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-21-julien.grall@arm.com>
 <alpine.DEB.2.21.1908221101110.22783@sstabellini-ThinkPad-T480s>
 <937b6185-9a3e-f8b5-8335-2d948b3bb11a@arm.com>
 <alpine.DEB.2.21.1908221551080.25445@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908221551080.25445@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@gmail.com>
Date: Fri, 23 Aug 2019 00:39:26 +0100
Message-ID: <CAF3u54DXbYc3YruZN9kqKwVsjkrqJKYSg5B6hk4Hyi0ZW+FVrA@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [PATCH v3 20/28] xen/arm32: head: Remove 1:1
 mapping as soon as it is not used
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============8733770803370318593=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8733770803370318593==
Content-Type: multipart/alternative; boundary="000000000000fce6820590bd33e7"

--000000000000fce6820590bd33e7
Content-Type: text/plain; charset="UTF-8"

Sorry for the formatting.

On Thu, 22 Aug 2019, 23:55 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 22 Aug 2019, Julien Grall wrote:
> > > >            */
> > > > -        dsb
> > > > +        lsr   r1, r9, #FIRST_SHIFT
> > > > +        mov_w r0, LPAE_ENTRY_MASK
> > >
> > > ldr?
> >
> > What's wrong with the mov_w? Ok it is two instructions but... the
> constant
> > will be stored in a literal and therefore induce a memory load (see
> patch #8).
>
> I am just wondering why you would choose mov_w when you can just do a
> single simple ldr.
>

Well, I have just explained it and you likely saw the explanation in patch
#8 as you acked it. So I am not sure what other explanation you are looking
for.

The choice between ldr rX, =... and mov_w is pretty much a matter of taste
from our perspective.

They will both take 64-bit in memory, the former because of one instruction
and the constant stored in the literal pool. The latter because it is using
two instructions.

Technically, we could also reduce the number of instructions to one for
mov_w depending on the constant size. But that's micro-optimization.

mov_w will be slightly more efficient because you don't have an extra
memory load (from loading from a pool). Although it is pretty much
insignificant here.

I also have to admit that the syntax for ldr is slightly confusing. I
always have to look up in other place how it can be used and works.

So I would like to keep the ldr use to the strict minimum, i.e. for
non-cons value (such as symbol).

Cheers,

--000000000000fce6820590bd33e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Sorry for the formatting.<br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 22 Aug 2019, 23:55 St=
efano Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini=
@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, =
22 Aug 2019, Julien Grall wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsb<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsr=C2=A0 =C2=A0r1, r9, #FIRST_=
SHIFT<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov_w r0, LPAE_ENTRY_MASK<br>
&gt; &gt; <br>
&gt; &gt; ldr?<br>
&gt; <br>
&gt; What&#39;s wrong with the mov_w? Ok it is two instructions but... the =
constant<br>
&gt; will be stored in a literal and therefore induce a memory load (see pa=
tch #8).<br>
<br>
I am just wondering why you would choose mov_w when you can just do a<br>
single simple ldr.<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Well, I have just explained it and you likely saw the exp=
lanation in patch #8 as you acked it. So I am not sure what other explanati=
on you are looking for.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
The choice between ldr rX, =3D... and mov_w is pretty much a matter of tast=
e from our perspective.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
They will both take 64-bit in memory, the former because of one instruction=
 and the constant stored in the literal pool. The latter because it is usin=
g two instructions.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tech=
nically, we could also reduce the number of instructions to one for mov_w d=
epending on the constant size. But that&#39;s micro-optimization.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">mov_w will be slightly more effic=
ient because you don&#39;t have an extra memory load (from loading from a p=
ool). Although it is pretty much insignificant here.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I also have to admit that the syntax for ldr i=
s slightly confusing. I always have to look up in other place how it can be=
 used and works.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So I wo=
uld like to keep the ldr use to the strict minimum, i.e. for non-cons value=
 (such as symbol).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheer=
s,</div></div>

--000000000000fce6820590bd33e7--


--===============8733770803370318593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8733770803370318593==--

