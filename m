Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87458971AA1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794466.1203422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneGw-0002fN-Sv; Mon, 09 Sep 2024 13:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794466.1203422; Mon, 09 Sep 2024 13:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneGw-0002cw-PH; Mon, 09 Sep 2024 13:17:38 +0000
Received: by outflank-mailman (input) for mailman id 794466;
 Mon, 09 Sep 2024 13:17:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sneGu-0002b1-Hv
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:17:36 +0000
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [2607:f8b0:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfe6bc95-6ead-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 15:17:34 +0200 (CEST)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3df02c407c4so2740472b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:17:34 -0700 (PDT)
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
X-Inumbo-ID: dfe6bc95-6ead-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725887853; x=1726492653; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x9gG7f4SnRxF6lMQQo0cq2oGnMcAJFeIiPbPrHS1Tes=;
        b=IY/fQFJXYx/7tCP8TKycRFPrp7xlCU2eIJVZt2ZqhLkkQnas3hh9pLz02ZyNfV+xai
         QokR7DWbaLHtojN+5tjmCPTz5bicN36Xasj3ah1IX8Q9LoolbD9ZgeTf06d9w5QtOJIr
         8KGPHg4ZgaqNx/Wd6hU4ns1rZhi846w4olk1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887853; x=1726492653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9gG7f4SnRxF6lMQQo0cq2oGnMcAJFeIiPbPrHS1Tes=;
        b=QKT879s+PIS6yAZCUjyryfPkhKMQJ/kiUvWbUIVLoq1FDeOAH6VctyF4F6iJ9Qkuaz
         NwmfyVswVf1swQz1AYR3WMPhTWUrA1s6xj1niKQyzFL6wGnABmVwdbeg5JfNlt6lpmWZ
         IpoM8MSLXf0dOzgYji6f5jlec+isqwA5E9eD1iW+/QY61QAv5WIVwhkKYyFPqc/R1qhE
         FVtBdlTm8ft0LlJcU5U5xzE2e3ihVmp/v3r+b71TLauPWeWJu3ltFeoMxRJPcf6J/4pK
         DceYd85RYVWm1OOAjeoJK6YZKTsppfhK+NgVqO+LwVMT6W7gC6fAMg/VYtEkjDWcXqv+
         jYxA==
X-Forwarded-Encrypted: i=1; AJvYcCXLPBrv25q5LkNX6RkkxvPaY8P4wsxBtZrPALVBIwNSO2OYYDWO5Ze5NaDS/GRONMiJpMrHAY5zIq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvxyVaCYxE99YGsH0YuKH/EjWaIZ0+sqPp94sw5bz2VU30lbi0
	Mfju8GNtVNZtS4GXCX/F7cj20/nvEVl7JzBV7TjJkGH8+cHgIudgvtwd3GY54Mz7Rlh6umAE9hA
	KEfAubu4IzSJDQIhoBAlbBDEwEaKEvZihheQkjQ==
X-Google-Smtp-Source: AGHT+IE2+vQrtKFrnXl0SbciEjUHjfDUE4ZQTwm8gp9XOJWCq7/0sGLeA8L3uKnotHtUqcvmikNCitVeQjQXIac3358=
X-Received: by 2002:a05:6808:23ca:b0:3d9:22c5:a1d7 with SMTP id
 5614622812f47-3e02a039c60mr11288021b6e.45.1725887853089; Mon, 09 Sep 2024
 06:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240909100806.47280-1-frediano.ziglio@cloud.com>
 <20240909100806.47280-2-frediano.ziglio@cloud.com> <8730bb00-35a5-473b-9af0-92ce2a436330@suse.com>
 <CACHz=ZgCCo2t4EJXOT44D8jvmLxgvoQd3E3CwCUgDLNdWDCr0g@mail.gmail.com> <7114754a-116e-479b-8771-62278b8db6f0@suse.com>
In-Reply-To: <7114754a-116e-479b-8771-62278b8db6f0@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 9 Sep 2024 14:17:18 +0100
Message-ID: <CACHz=ZiJ0+3-4Z6rCsBfKfjFb3dLbJA4r-6_181w2ocEvw=JYw@mail.gmail.com>
Subject: Re: [PATCH] mm: Reuse PRI_gfn macro instead of manual specify the format
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000067ee2d0621af9449"

--00000000000067ee2d0621af9449
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:58=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 09.09.2024 14:53, Frediano Ziglio wrote:
> > On Mon, Sep 9, 2024 at 11:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 09.09.2024 12:08, Frediano Ziglio wrote:
> >>> Macros are defined to avoid type mismatch in format strings
> >>> but also to unify format amongst code.
> >>
> >> I'm certainly fine with this part.
> >>
> >>> In the meantime expands to 9 hexadecimal digits.
> >>
> >> What makes 9 special? What will the extra padding zeroes buy us?
> >>
> >>
> > I think either we want kind of fixed size or dynamic. 9 =3D=3D (48 - 12=
) / 4,
> > although possibly you would prefer 13 =3D=3D (64 - 12) / 4.
>
> 64 is too much for x86; it would want to be 52 there. The way it is right
> now this is (imo deliberately) not arch-specific, though.
>
>
Yes, but still given the canonic form of x64 you would need to use 13
digits to have all the same size.


> >>> --- a/xen/common/grant_table.c
> >>> +++ b/xen/common/grant_table.c
> >>> @@ -1848,7 +1848,7 @@ gnttab_unpopulate_status_frames(struct domain *=
d,
> >> struct grant_table *gt)
> >>>              if ( rc )
> >>>              {
> >>>                  gprintk(XENLOG_ERR,
> >>> -                        "Could not remove status frame %u (GFN %#lx)
> >> from P2M\n",
> >>> +                        "Could not remove status frame %u (GFN
> >> %"PRI_gfn") from P2M\n",
> >>
> >> The lost # means the number won't identify itself as hex anymore. Rath=
er
> >> than ...
> >>
> >>> @@ -3981,7 +3981,7 @@ void grant_table_warn_active_grants(struct doma=
in
> >> *d)
> >>>          if ( nr_active <=3D WARN_GRANT_MAX )
> >>>              printk(XENLOG_G_DEBUG "d%d has active grant %x ("
> >>>  #ifndef NDEBUG
> >>> -                   "GFN %lx, "
> >>> +                   "GFN %"PRI_gfn", "
> >>>  #endif
> >>>                     "MFN: %#"PRI_mfn")\n",
> >>
> >> (note this for below)
> >>
> >>> --- a/xen/include/xen/mm-frame.h
> >>> +++ b/xen/include/xen/mm-frame.h
> >>> @@ -5,7 +5,7 @@
> >>>  #include <xen/typesafe.h>
> >>>
> >>>  TYPE_SAFE(unsigned long, mfn);
> >>> -#define PRI_mfn          "05lx"
> >>> +#define PRI_mfn          "09lx"
> >>>  #define INVALID_MFN_RAW  (~0UL)
> >>>  #define INVALID_MFN      _mfn(INVALID_MFN_RAW)
> >>>  /*
> >>> @@ -41,7 +41,7 @@ static inline bool mfn_eq(mfn_t x, mfn_t y)
> >>>  }
> >>>
> >>>  TYPE_SAFE(unsigned long, gfn);
> >>> -#define PRI_gfn          "05lx"
> >>> +#define PRI_gfn          "09lx"
> >>
> >> ... moving to 09 (twice) here, how about we move to #? Requiring, of
> >> course,
> >> to drop already-questionable hashes like the one pointed out in the
> middle.
> >>
> > I suppose you are suggesting getting rid of the padding entirely and mo=
ve
> > to prefix, like "%#lx".
>
> Yes, i.e.
>
> #define PRI_mfn          "#lx"
>
> Surely more portable amongst different platforms.


> Then again I don't really know why "05lx" was chosen originally.
>
>
I assume x86 without PAE, 32 bit, so 5 =3D=3D (32 - 12) / 4.


> Jan
>

Sent updated one

Frediano

--00000000000067ee2d0621af9449
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Sep 9, 2024 at 1:58=E2=80=AFPM Jan Beulich &lt;<a href=3D"ma=
ilto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 09.09.2024 14:53, Frediano Zigl=
io wrote:<br>
&gt; On Mon, Sep 9, 2024 at 11:45=E2=80=AFAM Jan Beulich &lt;<a href=3D"mai=
lto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<b=
r>
&gt;&gt; On 09.09.2024 12:08, Frediano Ziglio wrote:<br>
&gt;&gt;&gt; Macros are defined to avoid type mismatch in format strings<br=
>
&gt;&gt;&gt; but also to unify format amongst code.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m certainly fine with this part.<br>
&gt;&gt;<br>
&gt;&gt;&gt; In the meantime expands to 9 hexadecimal digits.<br>
&gt;&gt;<br>
&gt;&gt; What makes 9 special? What will the extra padding zeroes buy us?<b=
r>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; I think either we want kind of fixed size or dynamic. 9 =3D=3D (48 - 1=
2) / 4,<br>
&gt; although possibly you would prefer 13 =3D=3D (64 - 12) / 4.<br>
<br>
64 is too much for x86; it would want to be 52 there. The way it is right<b=
r>
now this is (imo deliberately) not arch-specific, though.<br>
<br></blockquote><div><br></div><div>Yes, but still given the canonic form =
of x64 you would need to use 13 digits to have all the same size.<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;&gt; --- a/xen/common/grant_table.c<br>
&gt;&gt;&gt; +++ b/xen/common/grant_table.c<br>
&gt;&gt;&gt; @@ -1848,7 +1848,7 @@ gnttab_unpopulate_status_frames(struct d=
omain *d,<br>
&gt;&gt; struct grant_table *gt)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rc )<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
gprintk(XENLOG_ERR,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Could not remove status frame %u (GFN %#lx)<=
br>
&gt;&gt; from P2M\n&quot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Could not remove status frame %u (GFN<br>
&gt;&gt; %&quot;PRI_gfn&quot;) from P2M\n&quot;,<br>
&gt;&gt;<br>
&gt;&gt; The lost # means the number won&#39;t identify itself as hex anymo=
re. Rather<br>
&gt;&gt; than ...<br>
&gt;&gt;<br>
&gt;&gt;&gt; @@ -3981,7 +3981,7 @@ void grant_table_warn_active_grants(stru=
ct domain<br>
&gt;&gt; *d)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( nr_active &lt;=3D WARN_=
GRANT_MAX )<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_=
G_DEBUG &quot;d%d has active grant %x (&quot;<br>
&gt;&gt;&gt;=C2=A0 #ifndef NDEBUG<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;GFN %lx, &quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;GFN %&quot;PRI_gfn&quot;, &quot;<br>
&gt;&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;MFN: %#&quot;PRI_mfn&quot;)\n&quot;,<br>
&gt;&gt;<br>
&gt;&gt; (note this for below)<br>
&gt;&gt;<br>
&gt;&gt;&gt; --- a/xen/include/xen/mm-frame.h<br>
&gt;&gt;&gt; +++ b/xen/include/xen/mm-frame.h<br>
&gt;&gt;&gt; @@ -5,7 +5,7 @@<br>
&gt;&gt;&gt;=C2=A0 #include &lt;xen/typesafe.h&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 TYPE_SAFE(unsigned long, mfn);<br>
&gt;&gt;&gt; -#define PRI_mfn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;05lx&=
quot;<br>
&gt;&gt;&gt; +#define PRI_mfn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;09lx&=
quot;<br>
&gt;&gt;&gt;=C2=A0 #define INVALID_MFN_RAW=C2=A0 (~0UL)<br>
&gt;&gt;&gt;=C2=A0 #define INVALID_MFN=C2=A0 =C2=A0 =C2=A0 _mfn(INVALID_MFN=
_RAW)<br>
&gt;&gt;&gt;=C2=A0 /*<br>
&gt;&gt;&gt; @@ -41,7 +41,7 @@ static inline bool mfn_eq(mfn_t x, mfn_t y)<=
br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 TYPE_SAFE(unsigned long, gfn);<br>
&gt;&gt;&gt; -#define PRI_gfn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;05lx&=
quot;<br>
&gt;&gt;&gt; +#define PRI_gfn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;09lx&=
quot;<br>
&gt;&gt;<br>
&gt;&gt; ... moving to 09 (twice) here, how about we move to #? Requiring, =
of<br>
&gt;&gt; course,<br>
&gt;&gt; to drop already-questionable hashes like the one pointed out in th=
e middle.<br>
&gt;&gt;<br>
&gt; I suppose you are suggesting getting rid of the padding entirely and m=
ove<br>
&gt; to prefix, like &quot;%#lx&quot;.<br>
<br>
Yes, i.e.<br>
<br>
#define PRI_mfn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;#lx&quot;<br>
<br></blockquote><div>Surely more portable amongst different platforms.<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Then again I don&#39;t really know why &quot;05lx&quot; was chosen original=
ly.<br>
<br></blockquote><div><br></div><div>I assume x86 without PAE, 32 bit, so 5=
 =3D=3D (32 - 12) / 4.<br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
Jan<br></blockquote><div><br></div><div>Sent updated one</div><div><br></di=
v><div>Frediano</div><div><br></div></div></div>

--00000000000067ee2d0621af9449--

