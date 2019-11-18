Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97064FFCC6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 02:11:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWVUn-00056F-4Y; Mon, 18 Nov 2019 01:06:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IxNH=ZK=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iWVUl-000568-Jv
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 01:06:23 +0000
X-Inumbo-ID: a2b6d424-099f-11ea-adbe-bc764e2007e4
Received: from mail-qt1-x830.google.com (unknown [2607:f8b0:4864:20::830])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2b6d424-099f-11ea-adbe-bc764e2007e4;
 Mon, 18 Nov 2019 01:06:22 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id t8so18361956qtc.6
 for <xen-devel@lists.xenproject.org>; Sun, 17 Nov 2019 17:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Ykce429D4eeS4hmFsbr5xce4Lu1V0vYoGVSFdgIt9g=;
 b=ZXwaFvZgDxCVjHXYFf5pvHKLByo5BwO6y/FACYrP7xG8X5ZwHj/zvddzaefiGKzqvc
 dMTXqVFsM2y8HqaaGPcZhpjYZsDsnKweWgbyBbHs20tGNMx7sjGZ+nG7xPho1SE/7oq2
 4rGF+bIjkZDC/sEvoy1I5fHznMC2XKa4nZO5jAmWHLuopmSB/ff2teYjQdCNvGr4HyN0
 M6K5ctAVeISwRLWRLOlfk4cF1wrl9Sv6SdZqOl/GkmJu2hDnb7dUmZFmk+6ausCWUwwr
 6TE7ACr1TqBIR86LD0s6zoqdPTvnxG3z4Ev9+4xejGeK3eMLD5AdJ0ht9O77yJu6lygz
 iTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Ykce429D4eeS4hmFsbr5xce4Lu1V0vYoGVSFdgIt9g=;
 b=Nz0Oj4a4RjnVUqu4ltLftRQhukfJZctbUVU34qRTb+sieCoM1wmSepAbaYZQYkzY2O
 5JP1T4XvH4VlQk0L+P5UqujIwE+41hkDo1HJ9rs1zwWLDPN2pZNmh9Hn6ynUCMsNCXtl
 JKMqQPTF/FE9y4x7WC79IDE3j5Oy8Lu+t/0n/pIFPrRdL0suZZp/mZqmS75tqnaJebDO
 6E6Dm/xhtV/8CWWyhPduLgxhNcD4D1eC94cPB0XLawA36r4EZW7EDMhZ8O6WGIxtrPoJ
 X7+ndgOPxtJjNxIM6gvZJFQ0a9rUfWgjmpd5CI4rf3tgSvW6AYC34riyCNhBnUnYw9Hw
 1IVg==
X-Gm-Message-State: APjAAAVr5HMUOjkawd6fBmoQIG9rKq80JysilzC7TBMTT3zAeLRuBp74
 yHOt4XHcpR08JWMB3NX6h+C8lh3WASUhb+pjVlHHWcLLuKk=
X-Google-Smtp-Source: APXvYqy1C3MobjjysJz/UL04gSUSx7odd5Bo+dqSYjQEMyOok3y16Ci77n/tJryrw8h63TLcvkhcdu9zirKQ5QxlHdA=
X-Received: by 2002:aed:2357:: with SMTP id i23mr25475685qtc.365.1574039181966; 
 Sun, 17 Nov 2019 17:06:21 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy9VN9fFC1M5P7OdLOiwZdgWjjWjMWppA63gnOe5wwGr4A@mail.gmail.com>
 <20191116230744.GC4109@mail-itl>
In-Reply-To: <20191116230744.GC4109@mail-itl>
From: Roman Shaposhnik <roman@zededa.com>
Date: Sun, 17 Nov 2019 17:06:11 -0800
Message-ID: <CAMmSBy8ZN4ihufbihSS5bxLKU-feMgfUNi2zDgcCuE9NL9pePA@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============9192406573207920176=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============9192406573207920176==
Content-Type: multipart/alternative; boundary="0000000000004dd0c50597948ee3"

--0000000000004dd0c50597948ee3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rich, Marek, thanks a million for quick replies -- I'll try your
suggestions tomorrow in my lab.

Thanks,
Roman.

On Sat, Nov 16, 2019 at 3:07 PM Marek Marczykowski-G=C3=B3recki <
marmarek@invisiblethingslab.com> wrote:

> On Fri, Nov 15, 2019 at 09:24:38PM -0800, Roman Shaposhnik wrote:
> > Hi!
> >
> > as I've reported earlier -- part of my testing of Xen 4.13 RC2 failed
> > in a massive way with Dom0 never coming up. I've traced that problem
> > to the option that we're using to boot Xen:
> >     efi=3Dno-rs
> > We've been using this option for quite sometime and Xen 4.13 RC2
> > is the first one that seems to make Dom0 boot fail with this option
> > present (note that RC1 was fine).
> >
> > I was wondering whether there were any changes in the areas related
> > to UEFI in Xen that may have triggered this.
> >
> > Here's the boot line that works with RC2:
> >     dom0_mem=3D1024M,max:1024M dom0_max_vcpus=3D1 dom0_vcpus_pin smt=3D=
false
> > adding efi=3Dno-rs make Dom0 boot process fail:
> >     efi=3Dno-rs dom0_mem=3D1024M,max:1024M dom0_max_vcpus=3D1 dom0_vcpu=
s_pin
> smt=3Dfalse
>
> As Rich already said, there was indeed some related changes, that should
> make efi=3Dno-rs not needed as an workaround on many machines.
> But also it looks like the "efi: use directmap to access runtime
> services table" commit broke efi=3Dno-rs case. I'll send the fix shortly.
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
>

--0000000000004dd0c50597948ee3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Rich, Marek, thanks a million for quick replies -- I&#39;l=
l try your suggestions tomorrow in my lab.<div><br></div><div>Thanks,</div>=
<div>Roman.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sat, Nov 16, 2019 at 3:07 PM Marek Marczykowski-G=C3=B3=
recki &lt;<a href=3D"mailto:marmarek@invisiblethingslab.com">marmarek@invis=
iblethingslab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex">On Fri, Nov 15, =
2019 at 09:24:38PM -0800, Roman Shaposhnik wrote:<br>
&gt; Hi!<br>
&gt; <br>
&gt; as I&#39;ve reported earlier -- part of my testing of Xen 4.13 RC2 fai=
led<br>
&gt; in a massive way with Dom0 never coming up. I&#39;ve traced that probl=
em<br>
&gt; to the option that we&#39;re using to boot Xen:<br>
&gt;=C2=A0 =C2=A0 =C2=A0efi=3Dno-rs<br>
&gt; We&#39;ve been using this option for quite sometime and Xen 4.13 RC2<b=
r>
&gt; is the first one that seems to make Dom0 boot fail with this option<br=
>
&gt; present (note that RC1 was fine).<br>
&gt; <br>
&gt; I was wondering whether there were any changes in the areas related<br=
>
&gt; to UEFI in Xen that may have triggered this.<br>
&gt; <br>
&gt; Here&#39;s the boot line that works with RC2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0dom0_mem=3D1024M,max:1024M dom0_max_vcpus=3D1 dom0_=
vcpus_pin smt=3Dfalse<br>
&gt; adding efi=3Dno-rs make Dom0 boot process fail:<br>
&gt;=C2=A0 =C2=A0 =C2=A0efi=3Dno-rs dom0_mem=3D1024M,max:1024M dom0_max_vcp=
us=3D1 dom0_vcpus_pin smt=3Dfalse<br>
<br>
As Rich already said, there was indeed some related changes, that should<br=
>
make efi=3Dno-rs not needed as an workaround on many machines.<br>
But also it looks like the &quot;efi: use directmap to access runtime<br>
services table&quot; commit broke efi=3Dno-rs case. I&#39;ll send the fix s=
hortly.<br>
<br>
-- <br>
Best Regards,<br>
Marek Marczykowski-G=C3=B3recki<br>
Invisible Things Lab<br>
A: Because it messes up the order in which people normally read text.<br>
Q: Why is top-posting such a bad thing?<br>
</blockquote></div>

--0000000000004dd0c50597948ee3--


--===============9192406573207920176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9192406573207920176==--

