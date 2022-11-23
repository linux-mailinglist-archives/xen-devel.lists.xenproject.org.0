Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05F63669F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 18:09:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447697.704223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxtFO-0008ML-AG; Wed, 23 Nov 2022 17:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447697.704223; Wed, 23 Nov 2022 17:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxtFO-0008Jb-7X; Wed, 23 Nov 2022 17:09:18 +0000
Received: by outflank-mailman (input) for mailman id 447697;
 Wed, 23 Nov 2022 17:09:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzeF=3X=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1oxtFM-0008JV-Ve
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 17:09:17 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f204587-6b51-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 18:09:15 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id r8so11493271ljn.8
 for <xen-devel@lists.xenproject.org>; Wed, 23 Nov 2022 09:09:15 -0800 (PST)
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
X-Inumbo-ID: 8f204587-6b51-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k3ZmQCA06DghUmm4/08LgMrzJ9Jcm98zIeKuuGnYmnE=;
        b=Z3w2hDG+gD3kDBUDOTKXJiKkdYGarxhaa7IjKH0qdbpY71ZVkcDbJYapTe/6UN+bap
         h+VQjDuJKwCCu4AqiErj6uj3ro/k5ooGbEANq/uGQHiK38hbNlxnMCSpZFV7TfD5aES9
         W4qlBd2ahS5ueBTlVBHxmoANBK2zGvvStCF+zUarDzP013T0Jbt0hlpWfSTEF9PEBGXZ
         cQODspNYYHb0aIUhb14/zAayPMNLsMjCX3Ii5z8Nn15s7dqyAPIvEdYvfy/Aaan88Zlb
         i6fp5YBXg862xT0+FO5DNH+NMC9YMmFgwXt8iHD2tdmopNULL2qiWKKN9qzd0+mgKat+
         fCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3ZmQCA06DghUmm4/08LgMrzJ9Jcm98zIeKuuGnYmnE=;
        b=ELU5232YOyhz8rMQ0wv0N8VqtY6LSywJQTTy0UuwhDjdp5nxIHil3R/d+ere2wNCJL
         tZ6RIjMXvSBaTJS6Xe9786naCtvBo8tLhWYBeBj6sm3U8SV3vvvqYuLa4X5uSeFRXdCj
         aVVYWrK5+yuOSJ3IKs90XPu3mTDNhRRAuIAf6a3JybFf7f7a6S4C4ZxUNDHGJf2+AR5z
         gGOxn4DvdOlBps83I6SXJyHvjY/EhIoGGwjRXkUrmdzPalYY93eHli/HWH4ssh+y5NIf
         4ch9jV/BTrMOhRBC0qVGO7IyTZv8Bh76X1atLVXcfjKJV6cXE52XMvR8JnfbnzjIZ+pV
         SaVw==
X-Gm-Message-State: ANoB5pkx0BlcA7PQElyvo13EMHntAvcBhvRnzH/+KEiQjdnRn2jDK9P4
	x0X7Ef4oNUul3G2qnclK1PHWEYCc6FmeYSVGetI=
X-Google-Smtp-Source: AA0mqf4+wh3zmf6SqcU+g9RnG/X8Je08CCEtO5G2E9SpIQOlEkVftFtm9SKylmUdUnN1i8yl1Wi0ljK1OTofLYT9i14=
X-Received: by 2002:a2e:be1c:0:b0:26e:6fb:4845 with SMTP id
 z28-20020a2ebe1c000000b0026e06fb4845mr4391642ljq.120.1669223355226; Wed, 23
 Nov 2022 09:09:15 -0800 (PST)
MIME-Version: 1.0
References: <f9cd7b84-6f51-d797-cd2a-b9c9bc62b0f6@suse.com> <d03dc8b3-4c1f-2db0-4d97-944972dc6e06@suse.com>
In-Reply-To: <d03dc8b3-4c1f-2db0-4d97-944972dc6e06@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 23 Nov 2022 09:09:01 -0800
Message-ID: <CACMJ4GY0eYPGN_hepOo__fu7D2pUnbzQ+GeqsWt_gk_7Mdtw+Q@mail.gmail.com>
Subject: Re: Ping: [PATCH] Argo: don't obtain excess page references
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000023a07805ee26597e"

--00000000000023a07805ee26597e
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 4:41 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 11.10.2022 11:28, Jan Beulich wrote:
> > find_ring_mfn() already holds a page reference when trying to obtain a
> > writable type reference. We shouldn't make assumptions on the general
> > reference count limit being effectively "infinity". Obtain merely a type
> > ref, re-using the general ref by only dropping the previously acquired
> > one in the case of an error.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> Ping?
>

Message received -- I will look at this. Thanks.

Christopher


>
> > ---
> > I further question the log-dirty check there: The present P2M type of a
> > page doesn't really matter for writing to the page (plus it's stale by
> > the time it is looked at). Instead I think every write to such a page
> > needs to be accompanied by a call to paging_mark_dirty().
> >
> > --- a/xen/common/argo.c
> > +++ b/xen/common/argo.c
> > @@ -1429,10 +1429,11 @@ find_ring_mfn(struct domain *d, gfn_t gf
> >          ret = -EAGAIN;
> >  #endif
> >      else if ( (p2mt != p2m_ram_rw) ||
> > -              !get_page_and_type(page, d, PGT_writable_page) )
> > +              !get_page_type(page, PGT_writable_page) )
> >          ret = -EINVAL;
> >
> > -    put_page(page);
> > +    if ( unlikely(ret) )
> > +        put_page(page);
> >
> >      return ret;
> >  }
> >
>
>

--00000000000023a07805ee26597e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 21, 2022 at 4:41 AM Jan B=
eulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 11.10.2=
022 11:28, Jan Beulich wrote:<br>
&gt; find_ring_mfn() already holds a page reference when trying to obtain a=
<br>
&gt; writable type reference. We shouldn&#39;t make assumptions on the gene=
ral<br>
&gt; reference count limit being effectively &quot;infinity&quot;. Obtain m=
erely a type<br>
&gt; ref, re-using the general ref by only dropping the previously acquired=
<br>
&gt; one in the case of an error.<br>
&gt; <br>
&gt; Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" ta=
rget=3D"_blank">jbeulich@suse.com</a>&gt;<br>
<br>
Ping?<br></blockquote><div><br></div><div>Message received -- I will look a=
t this. Thanks.</div><div><br></div><div>Christopher</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt; I further question the log-dirty check there: The present P2M type of =
a<br>
&gt; page doesn&#39;t really matter for writing to the page (plus it&#39;s =
stale by<br>
&gt; the time it is looked at). Instead I think every write to such a page<=
br>
&gt; needs to be accompanied by a call to paging_mark_dirty().<br>
&gt; <br>
&gt; --- a/xen/common/argo.c<br>
&gt; +++ b/xen/common/argo.c<br>
&gt; @@ -1429,10 +1429,11 @@ find_ring_mfn(struct domain *d, gfn_t gf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EAGAIN;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else if ( (p2mt !=3D p2m_ram_rw) ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !get_page_and_type(p=
age, d, PGT_writable_page) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !get_page_type(page,=
 PGT_writable_page) )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 put_page(page);<br>
&gt; +=C2=A0 =C2=A0 if ( unlikely(ret) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_page(page);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000023a07805ee26597e--

