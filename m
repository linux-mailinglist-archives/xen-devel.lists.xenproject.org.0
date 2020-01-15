Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7879713C4FB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 15:09:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irjJs-00082p-6u; Wed, 15 Jan 2020 14:06:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FWRo=3E=gmail.com=madhuparnabhowmik04@srs-us1.protection.inumbo.net>)
 id 1irjJq-00082k-MZ
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 14:06:50 +0000
X-Inumbo-ID: 460e5524-37a0-11ea-b89f-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 460e5524-37a0-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 14:06:49 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id z9so14053596oth.5
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 06:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m8YdJXVqEvndwQaLeFVf9Vj1JG2td61OIczMFvSzRn8=;
 b=tvUCjzBKS4OZGt+M+tUaFM1hyXi5cCrKIkMdPiRCYJifuYTQm50mcDmT25vHqnwkqj
 LCrwmHLyylO3lAXrSJqy/YdQY889G9G+9YTTNprLUv7rrYQTHxVAbvMO+fZp8fhS0CH0
 jE+3pw9byKMF8k/4s6hkzuioaC6Imyo1UlcG981UuO8llqy125ethfh/zXFNgkK5mC+q
 RP73415h8uztf9bPdRU4zFuMQ6YSRRRyJO/5deTC/Dp/z48HEZxaNqvglDxqrIWN8W4l
 PsNVe9zXRJu+WBG9+QfI5gh4+XnN3uSdpBRhSgUkNc/8u30Ufbx1v2wHnk3yrNHEpCdl
 HBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m8YdJXVqEvndwQaLeFVf9Vj1JG2td61OIczMFvSzRn8=;
 b=L+nYdeudvFRsAt1oKBuppwzqgFywTyUwjKOBkgsIg64TzO9gPV858kVK+pbMwn9M+5
 XDu/JelWoW2lZ0CER6QPoSJIasdXid0UarfUThDRVfaFMLA3CGUzUcYKDTd5xsC+BwRE
 jCtmKzH4KSlE2AZNjITCImUbuAgEbmG/O2Lo8DScD1cjuaVetG+djU6dmNwgJvwyka49
 D1jV3O98LKqsqXhtOnLJfGnn6bqfdYAFt1wFcfE3P0kLm2+Tl3cMza/LP7tiXLZERQtx
 1MCbsBed34FVNUfSXnkeIH2lBF0Mpino8G8uRR5HfzRQjeWqAvLfEtJqaTUHm51XlQ0L
 530w==
X-Gm-Message-State: APjAAAU1OicXkCi/gGwAQFu48/9VJB71fld2B7n6cUmntn/yuAKqIykY
 DoPGSGlT7+WtjGBfRW21Epzaglny+E/aquK/tSs=
X-Google-Smtp-Source: APXvYqygrxjPGS6mT9tBCVOZMdAaS/HYd3/ZbGljQQLQKA6OwyYyG/NZsutIW2+1noFA/lvA8nnn1dwNQ2L0xSE/efo=
X-Received: by 2002:a9d:2965:: with SMTP id d92mr2622695otb.175.1579097209166; 
 Wed, 15 Jan 2020 06:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
 <20200115135631.edr2nrfkycppxcku@debian>
In-Reply-To: <20200115135631.edr2nrfkycppxcku@debian>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Wed, 15 Jan 2020 19:36:38 +0530
Message-ID: <CAF65HP0q_KcrUP_50JxZL1xNc47=detHvdOzjBmuiqUtB3AwfA@mail.gmail.com>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [Xen-devel] [PATCH] net: xen-netbank: hash.c: Use built-in RCU
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
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Content-Type: multipart/mixed; boundary="===============6784015358804890257=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6784015358804890257==
Content-Type: multipart/alternative; boundary="00000000000037e1f1059c2e3836"

--00000000000037e1f1059c2e3836
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 7:26 PM Wei Liu <wei.liu@kernel.org> wrote:

> Thanks for the patch.
>
> There is a typo in the subject line. It should say xen-netback, not
> xen-netbank.
>
> Hi,

I am sorry about this, I will send this patch again.


> On Wed, Jan 15, 2020 at 06:11:28PM +0530, madhuparnabhowmik04@gmail.com
> wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > list_for_each_entry_rcu has built-in RCU and lock checking.
> > Pass cond argument to list_for_each_entry_rcu.
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > ---
> >  drivers/net/xen-netback/hash.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/xen-netback/hash.c
> b/drivers/net/xen-netback/hash.c
> > index 10d580c3dea3..30709bc9d170 100644
> > --- a/drivers/net/xen-netback/hash.c
> > +++ b/drivers/net/xen-netback/hash.c
> > @@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, const
> u8 *tag,
> >
> >       found = false;
> >       oldest = NULL;
> > -     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
> > +     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
> > +
>  lockdep_is_held(&vif->hash.cache.lock)) {
>
> There are probably too many tabs here. Indentation looks wrong.
>
> I will correct this when I resend this patch.


> The surrounding code makes it pretty clear that the lock is already held
> by the time list_for_each_entry_rcu is called, yet the checking involved
> in lockdep_is_held is not trivial, so I'm afraid I don't consider this a
> strict improvement over the existing code.
>
> Actually,  we want to make CONFIG_PROVE_LIST_RCU enabled by default.
And if the cond argument is not passed when the usage of
list_for_each_entry_rcu()
is outside of rcu_read_lock(), it will lead to a false positive.
Therefore, I think this patch is required.
Let me know if you have any objections.

Thank you,
Madhuparna


> If there is something I misunderstood, let me know.
>
> Wei.
>
> >               /* Make sure we don't add duplicate entries */
> >               if (entry->len == len &&
> >                   memcmp(entry->tag, tag, len) == 0)
> > @@ -102,7 +103,8 @@ static void xenvif_flush_hash(struct xenvif *vif)
> >
> >       spin_lock_irqsave(&vif->hash.cache.lock, flags);
> >
> > -     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
> > +     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
> > +
>  lockdep_is_held(&vif->hash.cache.lock)) {
> >               list_del_rcu(&entry->link);
> >               vif->hash.cache.count--;
> >               kfree_rcu(entry, rcu);
> > --
> > 2.17.1
> >
>

--00000000000037e1f1059c2e3836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15, 2020 at 7:26 PM Wei L=
iu &lt;<a href=3D"mailto:wei.liu@kernel.org">wei.liu@kernel.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks for t=
he patch.<br>
<br>
There is a typo in the subject line. It should say xen-netback, not<br>
xen-netbank.<br>
<br></blockquote><div>Hi,</div><div><br></div><div>I am sorry about this, I=
 will send this patch again.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
On Wed, Jan 15, 2020 at 06:11:28PM +0530, <a href=3D"mailto:madhuparnabhowm=
ik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<=
br>
&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; <br>
&gt; list_for_each_entry_rcu has built-in RCU and lock checking.<br>
&gt; Pass cond argument to list_for_each_entry_rcu.<br>
&gt; <br>
&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhow=
mik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 drivers/net/xen-netback/hash.c | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/=
hash.c<br>
&gt; index 10d580c3dea3..30709bc9d170 100644<br>
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
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockdep_is_held(&amp;vif-&gt;h=
ash.cache.lock)) {<br>
<br>
There are probably too many tabs here. Indentation looks wrong.<br>
<br></blockquote><div>I will correct this when I resend this patch.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
The surrounding code makes it pretty clear that the lock is already held<br=
>
by the time list_for_each_entry_rcu is called, yet the checking involved<br=
>
in lockdep_is_held is not trivial, so I&#39;m afraid I don&#39;t consider t=
his a<br>
strict improvement over the existing code.<br>
<br></blockquote><div>Actually,=C2=A0 we want to make CONFIG_PROVE_LIST_RCU=
 enabled by default.</div><div>And if the cond argument is not passed when =
the usage of list_for_each_entry_rcu()</div><div>is outside of rcu_read_loc=
k(), it will lead to a false positive.</div><div>Therefore, I think this pa=
tch is required.</div><div>Let me know if you have any objections.</div><di=
v><br></div><div>Thank you,</div><div>Madhuparna</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
If there is something I misunderstood, let me know.<br>
<br>
Wei.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Make sure we =
don&#39;t add duplicate entries */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (entry-&gt;le=
n =3D=3D len &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0me=
mcmp(entry-&gt;tag, tag, len) =3D=3D 0)<br>
&gt; @@ -102,7 +103,8 @@ static void xenvif_flush_hash(struct xenvif *vif)<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;vif-&gt;hash.cache.lo=
ck, flags);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0list_for_each_entry_rcu(entry, &amp;vif-&gt;hash.=
cache.list, link) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_rcu(entry, &amp;vif-&gt;hash.=
cache.list, link,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockdep_is_held(&amp;vif-&gt;h=
ash.cache.lock)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_rcu(&am=
p;entry-&gt;link);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vif-&gt;hash.cac=
he.count--;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree_rcu(entry,=
 rcu);<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div></div>

--00000000000037e1f1059c2e3836--


--===============6784015358804890257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6784015358804890257==--

