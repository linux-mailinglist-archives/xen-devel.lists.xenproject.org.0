Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBBB971A08
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794439.1203374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sndu9-0005WK-9c; Mon, 09 Sep 2024 12:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794439.1203374; Mon, 09 Sep 2024 12:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sndu9-0005T9-5X; Mon, 09 Sep 2024 12:54:05 +0000
Received: by outflank-mailman (input) for mailman id 794439;
 Mon, 09 Sep 2024 12:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sndu7-0005T1-Ge
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:54:03 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9571b9cd-6eaa-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 14:54:01 +0200 (CEST)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3e04552579cso496934b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:54:01 -0700 (PDT)
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
X-Inumbo-ID: 9571b9cd-6eaa-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725886440; x=1726491240; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dn6L7lk/i4jyRkLDgGffuOT/IgCi6bfn7CZ8B0n3eJY=;
        b=U7PslAh0f2Kq9jVtEXZaa+pSleqx4NeNFGHl6/+ObHg2IOO+Hr9GdinllBN+3ZkACD
         FLhoXuuc4RdGV+JEF4FqA0CsZnST8BrdJx3qbfNbcvEAw8I0IYv2Ywy/Oto/PBG7md+F
         Kf6yP0VQX9fx/fB9dUaZtur6S550CzTCR0C4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886440; x=1726491240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dn6L7lk/i4jyRkLDgGffuOT/IgCi6bfn7CZ8B0n3eJY=;
        b=lsVA7xfiF0ZQxi0OdECyjO7FB3QjbeU/+VhwjFjZNkvhvzVqsTvly507NXMlHrQQfb
         nhJyOgWsMP+38NbNcCdrVJaQpPbBipqckYRSSR59Ei1BS5FvArYxmkAG8rURtlx/ZPEZ
         pLNt3sJmyiqJtxoo0/zqqxWY0lWXfKi/j1Vq/AzW5h+wDfyU8vaexnJ0iUUPUhysRYpM
         22PGJuY+SiGv1QmgeIe7bzB0EZ7QqzH9ypzVcoNGbCHhyxCuj5MmBlFBdxqVDP+iLwjt
         MG6hripAIa5kkBHj34DS8jWjW1YFZvhrAa2hewusVyOb1VdXuULzB5HXw6hYBLFwqcLf
         uQow==
X-Forwarded-Encrypted: i=1; AJvYcCUiXUjwUC8TLC1kHwuwWW8G9jhsuQf3VrAvGxun1slr04AHsb8P62cI8islFJ43OrIlzeQucl3vD48=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMpsVXZ/ndcyLo0mqndekKNzzTMJgyM6fWxlqenhbMSNsQGaGW
	GwTBWrO36ws6Mgr0IAZzvlnOU2zBthJS4NDt15IonEM1VwO5KnYdMkAOTfG/y50/dv0CSDnnDBp
	mB6MlVeiYSAMtyL25yGskoc6fi5X3tlieQPAnFg==
X-Google-Smtp-Source: AGHT+IHJZs9xBkYAUzCKD6YmnCUCyNfUjWVv8QxsnebaFACAVV/OQESI5OXR+2U+5amv0vsMbsy9qm1KeOn6X7/h4As=
X-Received: by 2002:a05:6830:6f82:b0:710:e38a:f151 with SMTP id
 46e09a7af769-710e38af2d7mr4479641a34.1.1725886439530; Mon, 09 Sep 2024
 05:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240909100806.47280-1-frediano.ziglio@cloud.com>
 <20240909100806.47280-2-frediano.ziglio@cloud.com> <8730bb00-35a5-473b-9af0-92ce2a436330@suse.com>
In-Reply-To: <8730bb00-35a5-473b-9af0-92ce2a436330@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 9 Sep 2024 13:53:48 +0100
Message-ID: <CACHz=ZgCCo2t4EJXOT44D8jvmLxgvoQd3E3CwCUgDLNdWDCr0g@mail.gmail.com>
Subject: Re: [PATCH] mm: Reuse PRI_gfn macro instead of manual specify the format
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000026bdc90621af401b"

--00000000000026bdc90621af401b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 09.09.2024 12:08, Frediano Ziglio wrote:
> > Macros are defined to avoid type mismatch in format strings
> > but also to unify format amongst code.
>
> I'm certainly fine with this part.
>
> > In the meantime expands to 9 hexadecimal digits.
>
> What makes 9 special? What will the extra padding zeroes buy us?
>
>
I think either we want kind of fixed size or dynamic. 9 =3D=3D (48 - 12) / =
4,
although possibly you would prefer 13 =3D=3D (64 - 12) / 4.


> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/common/grant_table.c   | 6 +++---
> >  xen/include/xen/mm-frame.h | 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> > index ab36f45ded..775cd7e065 100644
> > --- a/xen/common/grant_table.c
> > +++ b/xen/common/grant_table.c
> > @@ -1848,7 +1848,7 @@ gnttab_unpopulate_status_frames(struct domain *d,
> struct grant_table *gt)
> >              if ( rc )
> >              {
> >                  gprintk(XENLOG_ERR,
> > -                        "Could not remove status frame %u (GFN %#lx)
> from P2M\n",
> > +                        "Could not remove status frame %u (GFN
> %"PRI_gfn") from P2M\n",
>
> The lost # means the number won't identify itself as hex anymore. Rather
> than ...
>
> > @@ -3981,7 +3981,7 @@ void grant_table_warn_active_grants(struct domain
> *d)
> >          if ( nr_active <=3D WARN_GRANT_MAX )
> >              printk(XENLOG_G_DEBUG "d%d has active grant %x ("
> >  #ifndef NDEBUG
> > -                   "GFN %lx, "
> > +                   "GFN %"PRI_gfn", "
> >  #endif
> >                     "MFN: %#"PRI_mfn")\n",
>
> (note this for below)
>
> > --- a/xen/include/xen/mm-frame.h
> > +++ b/xen/include/xen/mm-frame.h
> > @@ -5,7 +5,7 @@
> >  #include <xen/typesafe.h>
> >
> >  TYPE_SAFE(unsigned long, mfn);
> > -#define PRI_mfn          "05lx"
> > +#define PRI_mfn          "09lx"
> >  #define INVALID_MFN_RAW  (~0UL)
> >  #define INVALID_MFN      _mfn(INVALID_MFN_RAW)
> >  /*
> > @@ -41,7 +41,7 @@ static inline bool mfn_eq(mfn_t x, mfn_t y)
> >  }
> >
> >  TYPE_SAFE(unsigned long, gfn);
> > -#define PRI_gfn          "05lx"
> > +#define PRI_gfn          "09lx"
>
> ... moving to 09 (twice) here, how about we move to #? Requiring, of
> course,
> to drop already-questionable hashes like the one pointed out in the middl=
e.
>
>
I suppose you are suggesting getting rid of the padding entirely and move
to prefix, like "%#lx".


> Jan
>

I can do it

Frediano

--00000000000026bdc90621af401b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Sep 9, 2024 at 11:45=E2=80=AFAM Jan Beulich &lt;<a href=3D"m=
ailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 09.09.2024 12:08, Frediano Zig=
lio wrote:<br>
&gt; Macros are defined to avoid type mismatch in format strings<br>
&gt; but also to unify format amongst code.<br>
<br>
I&#39;m certainly fine with this part.<br>
<br>
&gt; In the meantime expands to 9 hexadecimal digits.<br>
<br>
What makes 9 special? What will the extra padding zeroes buy us?<br>
<br></blockquote><div><br></div><div>I think either we want kind of fixed s=
ize or dynamic. 9 =3D=3D (48 - 12) / 4, although possibly you would prefer =
13 =3D=3D (64 - 12) / 4.<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt; Signed-off-by: Frediano Ziglio &lt;<a href=3D"mailto:frediano.ziglio@c=
loud.com" target=3D"_blank">frediano.ziglio@cloud.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 xen/common/grant_table.c=C2=A0 =C2=A0| 6 +++---<br>
&gt;=C2=A0 xen/include/xen/mm-frame.h | 4 ++--<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c<br>
&gt; index ab36f45ded..775cd7e065 100644<br>
&gt; --- a/xen/common/grant_table.c<br>
&gt; +++ b/xen/common/grant_table.c<br>
&gt; @@ -1848,7 +1848,7 @@ gnttab_unpopulate_status_frames(struct domain *d=
, struct grant_table *gt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rc )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gprintk(=
XENLOG_ERR,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;Could not remove status frame %u (GFN %#lx) from P2M\n=
&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;Could not remove status frame %u (GFN %&quot;PRI_gfn&q=
uot;) from P2M\n&quot;,<br>
<br>
The lost # means the number won&#39;t identify itself as hex anymore. Rathe=
r<br>
than ...<br>
<br>
&gt; @@ -3981,7 +3981,7 @@ void grant_table_warn_active_grants(struct domai=
n *d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( nr_active &lt;=3D WARN_GRANT_MA=
X )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_G_DEBUG =
&quot;d%d has active grant %x (&quot;<br>
&gt;=C2=A0 #ifndef NDEBUG<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;GFN %lx, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;GFN %&quot;PRI_gfn&quot;, &quot;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;MFN: %#&quot;PRI_mfn&quot;)\n&quot;,<br>
<br>
(note this for below)<br>
<br>
&gt; --- a/xen/include/xen/mm-frame.h<br>
&gt; +++ b/xen/include/xen/mm-frame.h<br>
&gt; @@ -5,7 +5,7 @@<br>
&gt;=C2=A0 #include &lt;xen/typesafe.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 TYPE_SAFE(unsigned long, mfn);<br>
&gt; -#define PRI_mfn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;05lx&quot;<br=
>
&gt; +#define PRI_mfn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;09lx&quot;<br=
>
&gt;=C2=A0 #define INVALID_MFN_RAW=C2=A0 (~0UL)<br>
&gt;=C2=A0 #define INVALID_MFN=C2=A0 =C2=A0 =C2=A0 _mfn(INVALID_MFN_RAW)<br=
>
&gt;=C2=A0 /*<br>
&gt; @@ -41,7 +41,7 @@ static inline bool mfn_eq(mfn_t x, mfn_t y)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 TYPE_SAFE(unsigned long, gfn);<br>
&gt; -#define PRI_gfn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;05lx&quot;<br=
>
&gt; +#define PRI_gfn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;09lx&quot;<br=
>
<br>
... moving to 09 (twice) here, how about we move to #? Requiring, of course=
,<br>
to drop already-questionable hashes like the one pointed out in the middle.=
<br>
<br></blockquote><div><br></div><div>I suppose you are suggesting getting r=
id of the padding entirely and move to prefix, like &quot;%#lx&quot;.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Jan<br></blockquote><div><br></div><div>I can do it</div><div><br></div><di=
v>Frediano</div><div>=C2=A0<br></div></div></div>

--00000000000026bdc90621af401b--

