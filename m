Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A323B680513
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 05:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486530.753900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLtU-0003rh-AU; Mon, 30 Jan 2023 04:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486530.753900; Mon, 30 Jan 2023 04:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLtU-0003oj-7O; Mon, 30 Jan 2023 04:35:48 +0000
Received: by outflank-mailman (input) for mailman id 486530;
 Mon, 30 Jan 2023 04:35:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEu1=53=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1pMLtT-0003od-5q
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 04:35:47 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f72b79c-a057-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 05:35:44 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so28335106ejc.4
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jan 2023 20:35:44 -0800 (PST)
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
X-Inumbo-ID: 8f72b79c-a057-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tcwDFwSyVUur/SOWJhNh6+iBub0EwUFatnyIjButEEM=;
        b=ZUQ8cXXQpDrpHL8h5de9AieDoYs0Wk23NjVgU7iyHC1Tt7Sc0MQxdgyAdeoVmNGC8z
         F9hv4sQME6QYvAQcREVONApeAIQWfABuMUpGBg5wBO/MkD+wxpbOklyzdPrdkQG1MX9c
         jcTVMSZ7ivouIShrp8CGq/QqvAFiQ9KrG03+v5B8IwekjapBQZ2w1plDeWWjtcU84uZQ
         OBZqNhBSTq3nank/9SXdWxu74AOJQXSB0nbom8ggALHnTOzouhNsVRJCajv87CUYGhIh
         uZGCQkEiNNzWR+hL6OYjm6J2Z35xg+ho+4UYYr8AauFYfKvIzu2nClXmXckVYnRc8VLS
         AaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcwDFwSyVUur/SOWJhNh6+iBub0EwUFatnyIjButEEM=;
        b=YU6lfzm38hYhKt1mQX9Vi/5ganJzGqee/kRrs1YJqPyRSl7pUD6aXDCPGq4xwDqKUF
         CNTrFZFa1Ota+qtlYjypgBvmbjtcaAiC+fb28gNcRI0Uqe6tjV+ntFbdIaYo4n8DiH7v
         p5RaSdN3DZ1ILzDz7e7IFAz3zqyN0jB8cU5NN/0F0/1vd64oyJkmC0yhedYsveIfMhGK
         5SC7Wh2IG2h4rCU8kG+UKnqWuVvuhEzuga4zEhCSClox2/Wx5hrHcAiwLD32mMqxNYPq
         9yLxgZNmQ99RR3Qlb1m3sqE1Xy8O6RdSg81+ZvGM05bjv0zZTNg6muvfi6Fxl7eCn4ZP
         +7Kg==
X-Gm-Message-State: AO0yUKVstH/ohK4i/iVwfn6UKEQWvSKkY0BVkKsPATDzMG1geBScRY5U
	irYhl/BQ4slAtWBNmGH3Qef+vPj2/FHV+iAePNI=
X-Google-Smtp-Source: AK7set8aYsCUQ5546trUxrG0rN/8vlXwXeaXb9JRpPOYqsnpQPKZ7STy8bOYBcFowGxXjCEVRZ6+n3OATKC9cqn5RQQ=
X-Received: by 2002:a17:906:5856:b0:883:b70b:c049 with SMTP id
 h22-20020a170906585600b00883b70bc049mr1351753ejs.8.1675053344305; Sun, 29 Jan
 2023 20:35:44 -0800 (PST)
MIME-Version: 1.0
References: <f9cd7b84-6f51-d797-cd2a-b9c9bc62b0f6@suse.com> <d03dc8b3-4c1f-2db0-4d97-944972dc6e06@suse.com>
In-Reply-To: <d03dc8b3-4c1f-2db0-4d97-944972dc6e06@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 29 Jan 2023 20:35:32 -0800
Message-ID: <CACMJ4GbUjLczb9ru_QUERGaNCModspnqgGwAgCqUN+oZ_90NDA@mail.gmail.com>
Subject: Re: Ping: [PATCH] Argo: don't obtain excess page references
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000091357e05f373bfc1"

--00000000000091357e05f373bfc1
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

Hi Jan,

Sorry it has taken me so long to review this patch and thank-you for
posting it. The points raised are helpful.

Wrt to the patch - I can't ack because:
the general ref that is already held is from the page owner, and it may
actually be foreign; so the second ref acquire is currently ensuring that
it is a match for the owner of the ring. That needs addressing.

Am supportive of points raised:
- review + limit ref counts taken
    - better to not need two general page refs
- a type ref rather than general may be sufficient to hold for the ring
lifetime?
- paging_mark_dirty at writes
- p2m log dirty would be better to be allowed than EAGAIN
- allowing mapping of foreign pages may have uses though likely also
challenging

I should let you know that my time available is extremely limited at the
moment, sorry.

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

--00000000000091357e05f373bfc1
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
Ping?<br></blockquote><div><br></div><div>Hi Jan,<br><br>Sorry it has taken=
 me so long to review this patch and thank-you for posting it. The points r=
aised are helpful.<br><br>Wrt to the patch - I can&#39;t ack because:</div>=
<div>the general ref that is already held is from the page owner, and it ma=
y actually be foreign; so the second ref acquire is currently ensuring that=
 it is a match for the owner of the ring. That needs addressing.<br><br>Am =
supportive of points raised:<br>- review + limit ref counts taken<br>=C2=A0=
 =C2=A0 - better to not need two general page refs<br>- a type ref rather t=
han general may be sufficient to hold for the ring lifetime?<br>- paging_ma=
rk_dirty at writes<br>- p2m log dirty would be better to be allowed than EA=
GAIN<br>- allowing mapping of foreign pages may have uses though likely als=
o challenging<br><br>I should let you know that my time available is extrem=
ely limited at the moment, sorry.<br><br>Christopher<br></div><div><br></di=
v><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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

--00000000000091357e05f373bfc1--

