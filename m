Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7A927558
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 13:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753731.1161936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKrJ-0000hc-UT; Thu, 04 Jul 2024 11:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753731.1161936; Thu, 04 Jul 2024 11:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKrJ-0000g6-R7; Thu, 04 Jul 2024 11:42:41 +0000
Received: by outflank-mailman (input) for mailman id 753731;
 Thu, 04 Jul 2024 11:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMFS=OE=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sPKrI-0000g0-UF
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 11:42:40 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83b513d0-39fa-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 13:42:38 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38028so730479a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 04:42:38 -0700 (PDT)
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
X-Inumbo-ID: 83b513d0-39fa-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720093358; x=1720698158; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HzfFhpY9wpDm0aoDe9W7snDRqUECUqFzPYV35L92RvU=;
        b=OQMa9iS5BclEo0Y+BeUWfy5wuBJn89DbSJDbf4+cZY1RNs+gtLF6kMinTKJ3nrmdDv
         Xui0I++EnzIblhwRn07ClDSbsODHP9kX/NlaJmZf6JcDDK9FWR2XBMxO3TMysQGlomjE
         0YjAN6qkJRFK/OZehnqC+ao0CHMPFowcLL5q6d/StUH9YQX/6lSmT+ilDYsuleAINpld
         Cm2rFoLH4EZesLuEAvGOcDLJn/1/CvI/d9CZ6o3jaWid66WkCDrF1Xf43qLwVSJCWgcP
         r3XJ5tfGg4Ic/Eeo0Iz/tDqIqo/w3I3mzzpvCAIZeH0ZRkKTj5qXddj4W8qPmGJYkvxS
         rlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720093358; x=1720698158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzfFhpY9wpDm0aoDe9W7snDRqUECUqFzPYV35L92RvU=;
        b=GBRNP8IaYF0FShZ6UlgFBPjWJrz05YGJIMiIPr514QNFDUsXcvVZJZOG7BYauhJbKM
         kKDYtn/1W6zVYYDENnoKSJaO7JIBwBtkKF3WnLuEpq9djkB228HuYMH9y+cAuEnNM+Hr
         dAnqY7ESaw1ZUXZYvumljcSq+mP2i3tb5e9zFdt8+DWjUd/+Y/sfkBAcXA3b6ER/agJ2
         i/N5E5BtgOmrIPlmG2ZBD6EJ0Uj9iYZISLoiNmlxcsMCxHrVaToA/oQD+7LZ2sCYXiLx
         FcAkg1b1R+m9S4PWtImWLqEZnzvm/rRISTs7xkFII0s0Cyf2Cs+IUm+yCvsQDJv216wA
         bxZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdxn6OsZLXHhnvixBUG/DTL2bkiuQShuBj3a/1QEMQ2iVvsRdlIpldvNED1uClFSVOo4j4VIJrFTVELLZ6IavVTplaPK5fPtPcErhcG08=
X-Gm-Message-State: AOJu0Yw9gFu4r55doaLoMo9ukVd8g5j+m3gnPxZwEApy2SbMTi80yFfY
	OozABbJ/Ce2t9kDKdPDEWr1o/SAM7dK/hCXJZ9OlYb/FA3XkB0clrx+drJudD7ONBWknNiGGf1H
	zk+Q133oGx1QXFk4dDlWkowmCtrQ=
X-Google-Smtp-Source: AGHT+IHasBEGIlgvaru77AmnEamynOyBIUI9Gcvx3G8Hln78yqQw9r5HACJZLDYiclHUBv3xStP7OftQm8aV8lp5t9E=
X-Received: by 2002:a05:6402:34c2:b0:58d:e458:1310 with SMTP id
 4fb4d7f45d1cf-58e5acd87ccmr827965a12.13.1720093357631; Thu, 04 Jul 2024
 04:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
 <20240701224421.1432654-2-edgar.iglesias@gmail.com> <87ikxlo3lx.fsf@draig.linaro.org>
In-Reply-To: <87ikxlo3lx.fsf@draig.linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 4 Jul 2024 14:42:25 +0300
Message-ID: <CAJy5ezpD6i3Fc9K-i58=V0e1uxrB-VZ2sd+gtoOc4TnbkWHSZQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] physmem: Bail out qemu_ram_block_from_host() for
 invalid ram addrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
	paul@xen.org, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008fef90061c6a7180"

--0000000000008fef90061c6a7180
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 1:26=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:

> "Edgar E. Iglesias" <edgar.iglesias@gmail.com> writes:
>
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Bail out in qemu_ram_block_from_host() when
> > xen_ram_addr_from_mapcache() does not find an existing
> > mapping.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  system/physmem.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/system/physmem.c b/system/physmem.c
> > index 33d09f7571..59d1576c2b 100644
> > --- a/system/physmem.c
> > +++ b/system/physmem.c
> > @@ -2277,6 +2277,10 @@ RAMBlock *qemu_ram_block_from_host(void *ptr,
> bool round_offset,
> >          ram_addr_t ram_addr;
> >          RCU_READ_LOCK_GUARD();
> >          ram_addr =3D xen_ram_addr_from_mapcache(ptr);
> > +        if (ram_addr =3D=3D RAM_ADDR_INVALID) {
> > +            return NULL;
> > +        }
> > +
>
> Isn't this indicative of a failure? Should there at least be a trace
> point for failed mappings?
>
>
Yes but there are already trace points for the failure cases inside
xen_ram_addr_from_mapcache().
Do those address your concerns or do you think we need additional trace
points?

Cheers,
Edgar


> >          block =3D qemu_get_ram_block(ram_addr);
> >          if (block) {
> >              *offset =3D ram_addr - block->offset;
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--0000000000008fef90061c6a7180
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jul 4, 2024 at 1:26=E2=80=AFPM Al=
ex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@li=
naro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">&quot;Edgar E. Iglesias&quot; &lt;<a hre=
f=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">edgar.iglesias@gmai=
l.com</a>&gt; writes:<br>
<br>
&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesi=
as@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt;<br>
&gt; Bail out in qemu_ram_block_from_host() when<br>
&gt; xen_ram_addr_from_mapcache() does not find an existing<br>
&gt; mapping.<br>
&gt;<br>
&gt; Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@=
amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 system/physmem.c | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/system/physmem.c b/system/physmem.c<br>
&gt; index 33d09f7571..59d1576c2b 100644<br>
&gt; --- a/system/physmem.c<br>
&gt; +++ b/system/physmem.c<br>
&gt; @@ -2277,6 +2277,10 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, b=
ool round_offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_addr_t ram_addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RCU_READ_LOCK_GUARD();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_addr =3D xen_ram_addr_from_mapca=
che(ptr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ram_addr =3D=3D RAM_ADDR_INVALID) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
<br>
Isn&#39;t this indicative of a failure? Should there at least be a trace<br=
>
point for failed mappings?<br>
<br></blockquote><div><br></div><div>Yes but there are already trace points=
 for the failure cases inside xen_ram_addr_from_mapcache().</div><div>Do th=
ose address your concerns or do you think we need additional trace points?<=
/div><div><br></div><div>Cheers,</div><div>Edgar</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 block =3D qemu_get_ram_block(ram_add=
r);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (block) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *offset =3D ram_addr -=
 block-&gt;offset;<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div></div>

--0000000000008fef90061c6a7180--

