Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CA08C6796
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722364.1126232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Esa-0004Dy-TD; Wed, 15 May 2024 13:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722364.1126232; Wed, 15 May 2024 13:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Esa-0004CS-Q5; Wed, 15 May 2024 13:41:12 +0000
Received: by outflank-mailman (input) for mailman id 722364;
 Wed, 15 May 2024 13:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=733o=MS=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1s7EsZ-0004CM-Iw
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:41:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c94f0ed1-12c0-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 15:41:09 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a5a4bc9578cso158423666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:41:09 -0700 (PDT)
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
X-Inumbo-ID: c94f0ed1-12c0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715780469; x=1716385269; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wmrbt5g3xW5fHBu0hr4SidkuSpkmyoXxC17lF1jRack=;
        b=TL7lv6DIctA/jMNh8xZ/1h8JLvTSymcJAuLwWgsFEOFE0UmyIQI/hyJRHc8jku6XV4
         5pii10qzsI/e3eJYqnU/D6xzjDlKzl7xyaTF3tPdYcJCA6iE6DIHP72QwfetfCdMXpaT
         f9xUFbAnuf8+4b2qas8/1w5otD5lASVvvwVGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780469; x=1716385269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmrbt5g3xW5fHBu0hr4SidkuSpkmyoXxC17lF1jRack=;
        b=uZPxvvc7PxfnAUuGyVqAA2rnsQjNZJRghur0P4iHWldjka6HlYrd7IMG3ZfWKAkv2u
         eJytoWq1OcsEw6fju2d74j3lQxPpaS4fgc9j60eQypDspzvkiG5/qdf7jat9fDFh+zWS
         IhLh4hZBgBCIzxQN5d1hAD6fBowWLlEKCTbPteTuhsqtnCdcS3IR5c5UTXquoWjIonXr
         LQKjVcf/uT8qb15DzKaM/fHh9uBcsgG0F+741va7QjOxcWr4WE+qETYmOkmZIhFSWcLd
         6+YKyuHOgZl92I82ZVL7pf0fvNjh+rWdKMWJjj0hd08T43a/NV7mxJ31c79bj48K/KAq
         pdaA==
X-Forwarded-Encrypted: i=1; AJvYcCXR/sp+5EtDUAzVrshyb7wdccxYM0R+xQscZcuSpknf+gWMxiYOQtOO37SIBGR+ywVXpEnZlwg9GDDq4eh09Z/SGgW2yDPFa/Bbhd3VrZI=
X-Gm-Message-State: AOJu0YwTWlj+LVSZihjyxFewah6N3LLWQHSIirmm8PZ1HUM8F8KqBPJT
	RPL1cHWDGlfCXtR+QEgFUJX7162lV7KND6/GveIkIaBFSx1J/pdbeIjc7oSzQBXABM+B0zZs8+3
	YnbAoNjt99SfYIzX2aiIGV4XaLgfQ034glw7Abg==
X-Google-Smtp-Source: AGHT+IEscZaGsDpASJG1curHpIeR7pTebTZ9pxb2og0x4CArt/kD6LFJNrQieG1bc96DAjGzRza62K0inC2mkZyn1Fc=
X-Received: by 2002:a17:906:7f95:b0:a59:c833:d274 with SMTP id
 a640c23a62f3a-a5a2d5cb2a0mr1621341866b.37.1715780468723; Wed, 15 May 2024
 06:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com> <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com> <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com> <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
 <ZkHTC4RpUSpKj4wf@macbook> <ZkJz9U2A/mVKnkjA@mattapan.m5p.com>
 <08503965-4ba9-4fe3-a176-895623f4ad92@suse.com> <ZkPO0D0/Jx4ZnRBO@mattapan.m5p.com>
In-Reply-To: <ZkPO0D0/Jx4ZnRBO@mattapan.m5p.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 15 May 2024 14:40:31 +0100
Message-ID: <CAO-mL=z=VsGx2Cimw7bW5bx8BBF+xfckEMBafCmqSi8GpFtdXw@mail.gmail.com>
Subject: Re: Serious AMD-Vi(?) issue
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000005a04a206187e452b"

--0000000000005a04a206187e452b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Elliott,

Most of our developers are based in the EU timezone, however we are a
worldwide community.
The Xen Project is an open source community that everyone contributes to
and we do not divide how we provide help, based on location.

As explained previously, we are happy to help resolve issues and provide
advice where necessary. However, to do this, our developers need the
relevant information to provide accurate resolutions. Given that our
developers have repeatedly voiced their concerns, and are debugging this
out of interest, please help us by providing all the necessary information.

Until we have this information, it will be very difficult to help you
further. Should anything change, we would be glad to assist you.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Tue, May 14, 2024 at 9:51=E2=80=AFPM Elliott Mitchell <ehem+xen@m5p.com>=
 wrote:

> On Tue, May 14, 2024 at 10:22:51AM +0200, Jan Beulich wrote:
> > On 13.05.2024 22:11, Elliott Mitchell wrote:
> > > On Mon, May 13, 2024 at 10:44:59AM +0200, Roger Pau Monn=C3=A9 wrote:
> > >> Why do you mask the device SBDF in the above snippet?  I would reall=
y
> > >> like to understand what's so privacy relevant in a PCI SBDF number.
> > >
> > > I doubt it reveals much.  Simply seems unlikely to help debugging and
> > > therefore I prefer to mask it.
> >
> > SBDF in one place may be matchable against a memory address in another
> > place. _Any_ hiding of information is hindering analysis. Please can
> > you finally accept that it needs to be the person doing the analysis
> > to judge what is or is not relevant to them?
>
> Not going to happen as I'd accepted this long ago.  The usual approach
> is all developers have PGP keys (needed for security issues anyway) and
> you don't require all logs to be public.
>
> I've noticed the core of the Xen project appears centered in the EU.  Yet
> you're not catering to data privacy at all?  Or is this a service
> exclusively provided to people who prove they're EU citizens?
>
>
> --
> (\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)_=
__/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
>
>
>

--0000000000005a04a206187e452b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Elliott,<div><br></div><div>Most of our developers a=
re based in the EU timezone, however we are a worldwide community.=C2=A0</d=
iv><div>The Xen Project is an open source community that everyone contribut=
es to and we do not divide how we provide help, based on location.=C2=A0</d=
iv><div><br></div><div>As explained previously, we are happy to help resolv=
e issues and provide advice where necessary. However, to do this, our devel=
opers need the relevant information to provide accurate resolutions. Given =
that our developers have repeatedly voiced their concerns, and are debuggin=
g this out of interest, please help us by=C2=A0providing all the necessary =
information.=C2=A0</div><div><br></div><div>Until we have this information,=
 it will be very difficult to help you further. Should anything change, we =
would be glad to assist you.</div><div><br clear=3D"all"><div><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><d=
iv style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"co=
lor:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div><b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, May 14, 2024 at 9:51=E2=80=AFPM Elliott Mitchell &lt;<a hre=
f=3D"mailto:ehem%2Bxen@m5p.com">ehem+xen@m5p.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, May 14, 2024 at 10:=
22:51AM +0200, Jan Beulich wrote:<br>
&gt; On 13.05.2024 22:11, Elliott Mitchell wrote:<br>
&gt; &gt; On Mon, May 13, 2024 at 10:44:59AM +0200, Roger Pau Monn=C3=A9 wr=
ote:<br>
&gt; &gt;&gt; Why do you mask the device SBDF in the above snippet?=C2=A0 I=
 would really<br>
&gt; &gt;&gt; like to understand what&#39;s so privacy relevant in a PCI SB=
DF number.<br>
&gt; &gt; <br>
&gt; &gt; I doubt it reveals much.=C2=A0 Simply seems unlikely to help debu=
gging and<br>
&gt; &gt; therefore I prefer to mask it.<br>
&gt; <br>
&gt; SBDF in one place may be matchable against a memory address in another=
<br>
&gt; place. _Any_ hiding of information is hindering analysis. Please can<b=
r>
&gt; you finally accept that it needs to be the person doing the analysis<b=
r>
&gt; to judge what is or is not relevant to them?<br>
<br>
Not going to happen as I&#39;d accepted this long ago.=C2=A0 The usual appr=
oach<br>
is all developers have PGP keys (needed for security issues anyway) and<br>
you don&#39;t require all logs to be public.<br>
<br>
I&#39;ve noticed the core of the Xen project appears centered in the EU.=C2=
=A0 Yet<br>
you&#39;re not catering to data privacy at all?=C2=A0 Or is this a service<=
br>
exclusively provided to people who prove they&#39;re EU citizens?<br>
<br>
<br>
-- <br>
(\___(\___(\______=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --=3D&gt; 8-) EHM &lt;=
=3D--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ______/)___/)___/)<br>
=C2=A0\BS (=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mail=
to:ehem%2Bsigmsg@m5p.com" target=3D"_blank">ehem+sigmsg@m5p.com</a>=C2=A0 P=
GP 87145445=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 )=C2=A0 =C2=A0/=
<br>
=C2=A0 \_CS\=C2=A0 =C2=A0|=C2=A0 _____=C2=A0 -O #include &lt;stddisclaimer.=
h&gt; O-=C2=A0 =C2=A0_____=C2=A0 |=C2=A0 =C2=A0/=C2=A0 _/<br>
8A19\___\_|_/58D2 7E3D DDF4 7BA6 &lt;-PGP-&gt; 41D1 B375 37D0 8714\_|_/___/=
5445<br>
<br>
<br>
</blockquote></div>

--0000000000005a04a206187e452b--

