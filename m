Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF98213C854
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 16:50:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irktj-0008QQ-R3; Wed, 15 Jan 2020 15:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FWRo=3E=gmail.com=madhuparnabhowmik04@srs-us1.protection.inumbo.net>)
 id 1irkti-0008QL-M5
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 15:47:58 +0000
X-Inumbo-ID: 66ed1aa6-37ae-11ea-b89f-bc764e2007e4
Received: from mail-ot1-x341.google.com (unknown [2607:f8b0:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66ed1aa6-37ae-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 15:47:58 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id b18so16524289otp.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 07:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ilVXlccIzQKwAZB4Z6h6iuKbcrKSnYqM64tYSFmmHT0=;
 b=usbrjaHTxYyp00JfyzM3KR6KLIDz0nAnhdxjs6vH3azZpp3o6+ErwcXDq0AIVyFWOB
 idRZbrmEEe1fm9JoMlnt016ivdhXc8qzYyTIpPK7J2fLJralhgOpVatnfiwuhxfdOEAs
 DiPWxAom0wNJWBrum47YEezYGmp3iRnsiXpr9JvE4K7Zq9AVS26Tn1g+NurE4zCXwct1
 sYSejHPw5fRNFAJ8FPEkAQ4P4GWmXfcUTc+tjWdRT3vzNM4P7rQh+LJ2XYBaDLXJp6RK
 ko5MHSTax/z4ktCK9o3E6VNBueObnuVw6FJmC16JHORKxQ9rv4HUDdseGQ5CzZSKtk5+
 oSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ilVXlccIzQKwAZB4Z6h6iuKbcrKSnYqM64tYSFmmHT0=;
 b=scDLgBonRzZW4yD40wdGdocFs5aTbYmchqvoi0T9gVeuw/cW9wfbJGKhJSDgF21ap4
 zxXGywANNr3HxkC1UTSdNLlXO7+s0Lot87ER76MLz4qlN2gH03dm87+g61h2+ORcgNMa
 p1uY6MCquSP1Gce9e8EDgIEht7L4ku/hvWPYL82fQV8oHP9CQms05MfI7SDxzt8+18rJ
 h3DeMffh75YAIXM1w5q8p/vIKJpVu/gdTmppJqaha/9Tdvgeso+pZoTm/+iL+pGSmTkN
 f4Wc+RZe1B1W5A+D/0T8kL4dI2e7XZALLBF5M76O2C4xmnPsLu0AQHON5z5P03xOAvss
 DFWw==
X-Gm-Message-State: APjAAAXhAXpiXB+I9fMHU7ZG1SO7g0uWcHVNh934ryWwOCjIPW5bIMF/
 goc/ZW1HhKi4bJFhlhKv+vl9cLuaoSrfaVPgus8=
X-Google-Smtp-Source: APXvYqzYBAceFg/OddEAdGD0tzP9ldtUOajIec7RUFyS4DHU4xpXu9K+ET09n64mXTNpZ/Gv1ROQd5F5Y8QHj/KEh4o=
X-Received: by 2002:a05:6830:1141:: with SMTP id
 x1mr3238772otq.120.1579103277426; 
 Wed, 15 Jan 2020 07:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20200115141840.10553-1-madhuparnabhowmik04@gmail.com>
 <20200115150545.j5gu7lm3l3ouv7l4@debian>
In-Reply-To: <20200115150545.j5gu7lm3l3ouv7l4@debian>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Wed, 15 Jan 2020 21:17:46 +0530
Message-ID: <CAF65HP3nP1J9U6yBhjf9LqRqXA34ASfNs0gfo+66BhO87WwYAw@mail.gmail.com>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [Xen-devel] [PATCH] net: xen-netback: hash.c: Use built-in RCU
 list checking
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, paul@xen.org,
 netdev@vger.kernel.org, Amol Grover <frextrite@gmail.com>,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: multipart/mixed; boundary="===============4395192034003002212=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4395192034003002212==
Content-Type: multipart/alternative; boundary="000000000000ea2d81059c2fa183"

--000000000000ea2d81059c2fa183
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 8:35 PM Wei Liu <wei.liu@kernel.org> wrote:

> On Wed, Jan 15, 2020 at 07:48:40PM +0530, madhuparnabhowmik04@gmail.com
> wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > list_for_each_entry_rcu has built-in RCU and lock checking.
> > Pass cond argument to list_for_each_entry_rcu.
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>
> You seem to have dropped the second hunk which modified
> xenvif_flush_hash, is that a mistake?
>

I am sorry again, Yes I forgot to add the second hunk.
I will send the final patch with both the hunks in a while.

Thank you,
Madhuparna

Wei.
>
> > ---
> >  drivers/net/xen-netback/hash.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/xen-netback/hash.c
> b/drivers/net/xen-netback/hash.c
> > index 10d580c3dea3..3f9783f70a75 100644
> > --- a/drivers/net/xen-netback/hash.c
> > +++ b/drivers/net/xen-netback/hash.c
> > @@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, const
> u8 *tag,
> >
> >       found = false;
> >       oldest = NULL;
> > -     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
> > +     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
> > +                             lockdep_is_held(&vif->hash.cache.lock)) {
> >               /* Make sure we don't add duplicate entries */
> >               if (entry->len == len &&
> >                   memcmp(entry->tag, tag, len) == 0)
> > --
> > 2.17.1
> >
>

--000000000000ea2d81059c2fa183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15, 2020 at 8:35 PM Wei L=
iu &lt;<a href=3D"mailto:wei.liu@kernel.org">wei.liu@kernel.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jan =
15, 2020 at 07:48:40PM +0530, <a href=3D"mailto:madhuparnabhowmik04@gmail.c=
om" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<br>
&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; <br>
&gt; list_for_each_entry_rcu has built-in RCU and lock checking.<br>
&gt; Pass cond argument to list_for_each_entry_rcu.<br>
&gt; <br>
&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhow=
mik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br=
>
<br>
You seem to have dropped the second hunk which modified<br>
xenvif_flush_hash, is that a mistake?<br></blockquote><div>=C2=A0</div><div=
>I am sorry again, Yes I forgot to add the second hunk.</div><div>I will se=
nd the final patch with both the hunks in a while.</div><div><br></div><div=
>Thank you,</div><div>Madhuparna</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Wei.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/net/xen-netback/hash.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/=
hash.c<br>
&gt; index 10d580c3dea3..3f9783f70a75 100644<br>
&gt; --- a/drivers/net/xen-netback/hash.c<br>
&gt; +++ b/drivers/net/xen-netback/hash.c<br>
&gt; @@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, cons=
t u8 *tag,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0found =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oldest =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list_for_each_entry_rcu(entry, &amp;vif-&gt;hash.=
cache.list, link) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_rcu(entry, &amp;vif-&gt;hash.=
cache.list, link,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockdep_is_held(&amp;vif-&gt;hash.cache.=
lock)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Make sure we =
don&#39;t add duplicate entries */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (entry-&gt;le=
n =3D=3D len &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0me=
mcmp(entry-&gt;tag, tag, len) =3D=3D 0)<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div></div>

--000000000000ea2d81059c2fa183--


--===============4395192034003002212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4395192034003002212==--

