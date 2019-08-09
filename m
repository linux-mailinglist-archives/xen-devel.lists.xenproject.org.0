Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D655C88709
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 02:01:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwElT-0002gm-Ts; Fri, 09 Aug 2019 23:57:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BcOg=WF=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hwElS-0002gh-Mk
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 23:57:42 +0000
X-Inumbo-ID: 789ab368-bb01-11e9-8980-bc764e045a96
Received: from mail-ua1-x942.google.com (unknown [2607:f8b0:4864:20::942])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 789ab368-bb01-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 23:57:40 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id s4so38332799uad.7
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2019 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=19ay6ahpgCQHlEj6mxDsAT/Bfwv3UIY6aa8WVdPxXaU=;
 b=f5sUG5ZmgKdKkwhiMRuYDYNUxi1GSwWlgrvWkJ0x9tL2Bdxdsl9DwcQGY//NhO797t
 OGcb0fUHkLe4z7Xjt9bcjsPCxs5E0uKv2yulevtacO2QFNDR6wBCSM+Canc9r72WRkyP
 Th75eReZDK9/DTByCQEBkfC8vvy2k9ZME8OXu2PCZ6izH1C+GjeK5HCIJtGA/mMfR+69
 XCrSyJQPHlBt6KH8DxrdLjwu72JVR/0rVovwASkWl3ltAH9reJWYu2IQzEpvlp4u6g+f
 LIhcU+o0JiIuLz1ll//phRnGaISiR6nIPD1QyJg+aJmdHgxbQbvkgR4Vv99DTDgnEFmq
 +rrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=19ay6ahpgCQHlEj6mxDsAT/Bfwv3UIY6aa8WVdPxXaU=;
 b=HKSt4FmS+w2npYzWpWXTJYbKK+6N6mRJA0qb5OzAq3eVcE/RxWkr8iwu1FXM4IH2EK
 d2rbOERnLG3iUlQ8gJ9q77MF6Bf5rnDjWh2u1dGtZj5Qhy8Dr7ugFDDqVih6X1Xo3ge8
 uVKiPdHgUvy6tIkz4or52+UySUKMXbO/kMmOQQAWNoMzuqw3q5i0NtWuFU7yRZBMdVEx
 KMWr/Mn3mSMyZYWWyhVukyOOM72B7cN/BXntV8v687pXki9BtOEjOI4sgD1lRzk0Ikxj
 Vbe5x4GUIhX83RKm1qRQnuDC8xrsJYu3jxYLPfvANDcmsafkTkb/SXHuOPGtyPWZgjRw
 frcg==
X-Gm-Message-State: APjAAAWdlu0sFIchxMWvNMW/C4rrzAfW9WbWsMxrxVElED4AB2gp+an0
 hi7EGhcmxnm0WEeMkpaa9Er1eegICqp4j085Vfo=
X-Google-Smtp-Source: APXvYqxHQGTeSwzWjgTGamHq8G8a5v89MwGLFpdp4sWaaOzuJqcatWoD+bPOaWG8XsegWT9whrSBz5rxUHfb0Mr0S5Y=
X-Received: by 2002:ab0:7555:: with SMTP id k21mr13772370uaq.0.1565395060013; 
 Fri, 09 Aug 2019 16:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-3-sstabellini@kernel.org>
 <ac88a18f-0651-628c-fb74-e979f26df6b3@arm.com>
 <alpine.DEB.2.21.1908091515220.7788@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908091515220.7788@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@gmail.com>
Date: Sat, 10 Aug 2019 00:57:27 +0100
Message-ID: <CAF3u54BMTPVAVw6Ge=2NGB_YRL7k50jqo7ktGCmuhUFSSXg+rg@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [PATCH v4 3/7] xen/arm: keep track of
 reserved-memory regions
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
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>
Content-Type: multipart/mixed; boundary="===============2451335804478660855=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2451335804478660855==
Content-Type: multipart/alternative; boundary="0000000000007c3e7a058fb7f025"

--0000000000007c3e7a058fb7f025
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Aug 2019, 23:21 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Wed, 7 Aug 2019, Julien Grall wrote:
> > Hi Stefano,
> >
> > On 06/08/2019 22:49, Stefano Stabellini wrote:
> > > As we parse the device tree in Xen, keep track of the reserved-memory
> > > regions as they need special treatment (follow-up patches will make use
> > > of the stored information.)
> > >
> > > Reuse process_memory_node to add reserved-memory regions to the
> > > bootinfo.reserved_mem array.
> > >
> > > Refuse to continue once we reach the max number of reserved memory
> > > regions to avoid accidentally mapping any portions of them into a VM.
> > >
> > > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> > >
> > > ---
> > > Changes in v4:
> > > - depth + 1 in process_reserved_memory_node
> >
> > Ah, you fixed it in this patch. But then, this does not match the
> > documentation in patch #1.
>
> Yes good point, see below
>
>
> > > - pass address_cells and size_cells to device_tree_for_each_node
> > > - pass struct meminfo * instead of a boolean to process_memory_node
> > > - improve in-code comment
> >
> > I can't see any comment, is that an improvement? :)
>
> It got lost with the refactoring of the code, but I don't think we need
> it anymore
>
>
> > > - use a separate process_reserved_memory_node (separate from
> > >    process_memory_node) function wrapper to have different error
> handling
> > >
> > > Changes in v3:
> > > - match only /reserved-memory
> > > - put the warning back in place for reg not present on a normal memory
> > >    region
> > > - refuse to continue once we reach the max number of reserved memory
> > >    regions
> > >
> > > Changes in v2:
> > > - call process_memory_node from process_reserved_memory_node to avoid
> > >    duplication
> > > ---
> > >   xen/arch/arm/bootfdt.c      | 43
> +++++++++++++++++++++++++++++++------
> > >   xen/include/asm-arm/setup.h |  1 +
> > >   2 files changed, 38 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > > index c22d57cd72..3e6fd63b16 100644
> > > --- a/xen/arch/arm/bootfdt.c
> > > +++ b/xen/arch/arm/bootfdt.c
> > > @@ -144,6 +144,7 @@ static int __init process_memory_node(const void
> *fdt,
> > > int node,
> > >       const __be32 *cell;
> > >       paddr_t start, size;
> > >       u32 reg_cells = address_cells + size_cells;
> > > +    struct meminfo *mem = (struct meminfo *)data;
> >
> > The cast is unnecessary.
> >
> > The rest of the code looks good. Pending the discussion about
> > device_tree_for_each_node:
> >
> > Acked-by: Julien Grall <julien.grall@arm.com>
>
> Thank you. I removed the cast. Also, I think that it makes more sense to
> do the depth increase (depth + 1) inside the implementation of
> device_tree_for_each_node instead of at the caller site, like it is done
> in this patch. This would match the documentation better and is cleaner
> from an interface point of view. So I'll remove the depth increase from
> this patch and move it to the first patch (min_depth = depth + 1).
>

Well, you don't need to pass the depth at all. It is just an artificial
number for libfdt to know were to stop.

We also don't need the absolute depth in any of the early FDT. The relative
one is sufficient.


> Given the change, I won't add the acked-by to give you the chance to
> give it another look.
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000007c3e7a058fb7f025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 9 Aug 2019, 23:21 Stefano Stabellini, &lt;<a h=
ref=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Wed, 7 Aug 2019, Julien Grall w=
rote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; On 06/08/2019 22:49, Stefano Stabellini wrote:<br>
&gt; &gt; As we parse the device tree in Xen, keep track of the reserved-me=
mory<br>
&gt; &gt; regions as they need special treatment (follow-up patches will ma=
ke use<br>
&gt; &gt; of the stored information.)<br>
&gt; &gt; <br>
&gt; &gt; Reuse process_memory_node to add reserved-memory regions to the<b=
r>
&gt; &gt; bootinfo.reserved_mem array.<br>
&gt; &gt; <br>
&gt; &gt; Refuse to continue once we reach the max number of reserved memor=
y<br>
&gt; &gt; regions to avoid accidentally mapping any portions of them into a=
 VM.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:stefanos@=
xilinx.com" target=3D"_blank" rel=3D"noreferrer">stefanos@xilinx.com</a>&gt=
;<br>
&gt; &gt; <br>
&gt; &gt; ---<br>
&gt; &gt; Changes in v4:<br>
&gt; &gt; - depth + 1 in process_reserved_memory_node<br>
&gt; <br>
&gt; Ah, you fixed it in this patch. But then, this does not match the<br>
&gt; documentation in patch #1.<br>
<br>
Yes good point, see below<br>
<br>
<br>
&gt; &gt; - pass address_cells and size_cells to device_tree_for_each_node<=
br>
&gt; &gt; - pass struct meminfo * instead of a boolean to process_memory_no=
de<br>
&gt; &gt; - improve in-code comment<br>
&gt; <br>
&gt; I can&#39;t see any comment, is that an improvement? :)<br>
<br>
It got lost with the refactoring of the code, but I don&#39;t think we need=
<br>
it anymore<br>
<br>
<br>
&gt; &gt; - use a separate process_reserved_memory_node (separate from<br>
&gt; &gt;=C2=A0 =C2=A0 process_memory_node) function wrapper to have differ=
ent error handling<br>
&gt; &gt; <br>
&gt; &gt; Changes in v3:<br>
&gt; &gt; - match only /reserved-memory<br>
&gt; &gt; - put the warning back in place for reg not present on a normal m=
emory<br>
&gt; &gt;=C2=A0 =C2=A0 region<br>
&gt; &gt; - refuse to continue once we reach the max number of reserved mem=
ory<br>
&gt; &gt;=C2=A0 =C2=A0 regions<br>
&gt; &gt; <br>
&gt; &gt; Changes in v2:<br>
&gt; &gt; - call process_memory_node from process_reserved_memory_node to a=
void<br>
&gt; &gt;=C2=A0 =C2=A0 duplication<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0xen/arch/arm/bootfdt.c=C2=A0 =C2=A0 =C2=A0 | 43 +++++=
++++++++++++++++++++++++++------<br>
&gt; &gt;=C2=A0 =C2=A0xen/include/asm-arm/setup.h |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A02 files changed, 38 insertions(+), 6 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c<br>
&gt; &gt; index c22d57cd72..3e6fd63b16 100644<br>
&gt; &gt; --- a/xen/arch/arm/bootfdt.c<br>
&gt; &gt; +++ b/xen/arch/arm/bootfdt.c<br>
&gt; &gt; @@ -144,6 +144,7 @@ static int __init process_memory_node(const v=
oid *fdt,<br>
&gt; &gt; int node,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const __be32 *cell;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0paddr_t start, size;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_cells =3D address_cells + size_=
cells;<br>
&gt; &gt; +=C2=A0 =C2=A0 struct meminfo *mem =3D (struct meminfo *)data;<br=
>
&gt; <br>
&gt; The cast is unnecessary.<br>
&gt; <br>
&gt; The rest of the code looks good. Pending the discussion about<br>
&gt; device_tree_for_each_node:<br>
&gt; <br>
&gt; Acked-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com" tar=
get=3D"_blank" rel=3D"noreferrer">julien.grall@arm.com</a>&gt;<br>
<br>
Thank you. I removed the cast. Also, I think that it makes more sense to<br=
>
do the depth increase (depth + 1) inside the implementation of<br>
device_tree_for_each_node instead of at the caller site, like it is done<br=
>
in this patch. This would match the documentation better and is cleaner<br>
from an interface point of view. So I&#39;ll remove the depth increase from=
<br>
this patch and move it to the first patch (min_depth =3D depth + 1).<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Well, y=
ou don&#39;t need to pass the depth at all. It is just an artificial number=
 for libfdt to know were to stop.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">We also don&#39;t need the absolute depth in any of the early FDT=
. The relative one is sufficient.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Given the change, I won&#39;t add the acked-by to give you the chance to<br=
>
give it another look.<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"=
noreferrer">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.xenproject.org/mailm=
an/listinfo/xen-devel</a></blockquote></div></div></div>

--0000000000007c3e7a058fb7f025--


--===============2451335804478660855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2451335804478660855==--

