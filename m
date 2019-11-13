Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CBAFBE1F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 04:11:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iV5UF-0003OC-Uu; Thu, 14 Nov 2019 03:07:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NsSN=ZG=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iV5UE-0003O5-Pw
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 03:07:58 +0000
X-Inumbo-ID: f266b73a-068b-11ea-9631-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f266b73a-068b-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 03:07:53 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d6so3749630lfc.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 19:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V6VroHmWKE+O9mUO3wa9woCypYJCX8HgnX/AFT976IU=;
 b=LgtT9ElGUlMZ3ZOLqhiXbpL6ToNiySBnw0i7EtIgL1llvJYKuELzg8F9rR23Ha57sB
 YJnDjdOqmd5tdt5J3yaEoEIIaK+2zfYFQzIcIGbV2aO9wIfsuCS0ij1J14ijYjJa/OqX
 qnaPxsUyphAYrxypwRG9RMB8j7uIXLORXZlDgjNctuv9sbNYHvKSABW/JanGVdduDOVG
 uroi41mnzPUrHRMVbCG9wc2ALDAjzZW4eRD8cL/LgrbzZMSVZcNZs1HVul8TNiAq/SpG
 aah51X5lWauJXy3jEBjENFN5WEmcdItKAVn9Auc4De6dpMyeQB4EENRG4IVSirRoqhqC
 ahpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V6VroHmWKE+O9mUO3wa9woCypYJCX8HgnX/AFT976IU=;
 b=gPyPJO+Urwlo32vt95Q2EVDCTMpYr/PYQxEmuTiI4tcsgp2BQrO10gNqhMmRKVOFWq
 m0F+/+/BtMTbunwY0JsDpqxXfatjuW8ZmbR26GFAWqzHiWqixp9x+1d/tYtYwrIFHhx5
 eg3KmvgNzwHsj+QBpctthNncqywZ3tzgYzC5LwCEw8oflDP57r3KYUos4+lOs2zPvx8n
 uXpo+blbA4S7vspXuOd2wKL/Y11WEPFIyblRypX05WutoJFp+INgdMQ+ohyogwoT6FUi
 FAfLx3HIZ+Tpkz2++nFWa9g6krEnMSmto6osmwzXqXsNFh2phT3888LH+3YuaIPsKqbk
 5+HA==
X-Gm-Message-State: APjAAAWvoU6mZwtVdu2NP2nGT6EI35pWXFtKF99Z1UbYJ3dhQrz1BW8t
 hxGw0zAH2DlnHH0PVqSsqzPrq3zVthneO+ep1pc=
X-Google-Smtp-Source: APXvYqxIIvKg2qgYDoKLhFDU5CuSNuHtgA5/GZEgg4U7qPx6ERtCEl1SF4/y1Pq5aepjgAN7nx2Qndw0l1uKRcqCkWM=
X-Received: by 2002:ac2:48af:: with SMTP id u15mr4758248lfg.11.1573700872144; 
 Wed, 13 Nov 2019 19:07:52 -0800 (PST)
MIME-Version: 1.0
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-3-git-send-email-andrii.anisov@gmail.com>
 <7d3b0692-11e1-ad70-618b-c17318a2f257@suse.com>
 <CAJwc6KsiYYFEjV=My+J1mrFCEYO-gS-SH9oqSwj7nzWjn4C-kA@mail.gmail.com>
 <0c7cefd6-9169-8a91-de32-3d63dfdc1ab0@suse.com>
 <8337bf4b07903b75a6690880e58ca117e9c08a47.camel@epam.com>
In-Reply-To: <8337bf4b07903b75a6690880e58ca117e9c08a47.camel@epam.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 14 Nov 2019 08:19:58 +0900
Message-ID: <CAJ=z9a3FrBOF=3wKp53U8rGWSVJCC4JCurTpyOMPvc6FNcadcA@mail.gmail.com>
To: Artem Mygaiev <Artem_Mygaiev@epam.com>
Subject: Re: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "joculator@gmail.com" <joculator@gmail.com>
Content-Type: multipart/mixed; boundary="===============4861263065230640779=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4861263065230640779==
Content-Type: multipart/alternative; boundary="000000000000778bf8059745c91f"

--000000000000778bf8059745c91f
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Nov 2019, 02:15 Artem Mygaiev, <Artem_Mygaiev@epam.com> wrote:

> Hi Jan,
>
> Sorry for delayed reply
>
> On Thu, 2019-11-07 at 08:31 +0100, Jan Beulich wrote:
> > On 06.11.2019 23:08, Artem Mygaiev wrote:
> > > On Wed, Nov 6, 2019 at 4:28 PM Jan Beulich <
> > > jbeulich@suse.com
> > > > wrote:
> > > > On 06.11.2019 10:19, Andrii Anisov wrote:
> > > > > --- a/Config.mk
> > > > > +++ b/Config.mk
> > > > > @@ -221,7 +221,9 @@ CFLAGS += -Wall -Wstrict-prototypes
> > > > >
> > > > >  $(call cc-option-add,HOSTCFLAGS,HOSTCC,-Wdeclaration-after-
> > > > > statement)
> > > > >  $(call cc-option-add,CFLAGS,CC,-Wdeclaration-after-statement)
> > > > > +ifneq ($(armds),y)
> > > > >  $(call cc-option-add,CFLAGS,CC,-Wno-unused-but-set-variable)
> > > > > +endif
> > > > >  $(call cc-option-add,CFLAGS,CC,-Wno-unused-local-typedefs)
> > > > >
> > > > >  LDFLAGS += $(foreach i, $(EXTRA_LIB), -L$(i))
> > > >
> > > > ... this would be necessary.
> > >
> > > I am very sorry, this patch does not have a proper description
> > > indeed.
> > >
> > > For this particular change - arm clang does not undestand
> > > -Wno-unused-but-set-variable
> > > option at all, that is why it is under !$(armds)
> >
> > But avoiding to add options which the compiler doesn't understand
> > is the purpose of using cc-option-add, rather than blindly
> > adding
> > them to CFLAGS. What am I missing here?
>
> You are right, the script shall check the compiler option and avoid
> including it to CFLAGS. But armclang require '--target=...' to be
> specified in order to operate properly, and the proper fix shall be
> something like this (instead of 'ifneq' hack above):
>
> diff --git a/Config.mk b/Config.mk
> index 01487a7..abe8e44 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -107,7 +107,7 @@ cc-option = $(shell if test -z "`echo 'void*p=1;' | \
>  # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
>  cc-option-add = $(eval $(call cc-option-add-closure,$(1),$(2),$(3)))
>  define cc-option-add-closure
> -    ifneq ($$(call cc-option,$$($(2)),$(3),n),n)
> +    ifneq ($$(call cc-option,$$($(2) $(1)),$(3),n),n)
>          $(1) += $(3)
>      endif
>  endef
>
> so that CFLAGS that are already defined and include '--target=...'
> option from config/arm*.mk are passed to compiler to make it happy. I
> am not sure if this breaks anything else so decided to go with ugly
> 'ifneq' hack and check how this can be solved later on.
>

Why not including --target in CC variable as this was suggested for clang?

Cheers,

-- 
Julien Grall

--000000000000778bf8059745c91f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 14 Nov 2019, 02:15 Artem Mygaiev, &lt;<a href=
=3D"mailto:Artem_Mygaiev@epam.com">Artem_Mygaiev@epam.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Hi Jan,<br>
<br>
Sorry for delayed reply<br>
<br>
On Thu, 2019-11-07 at 08:31 +0100, Jan Beulich wrote:<br>
&gt; On 06.11.2019 23:08, Artem Mygaiev wrote:<br>
&gt; &gt; On Wed, Nov 6, 2019 at 4:28 PM Jan Beulich &lt;<br>
&gt; &gt; <a href=3D"mailto:jbeulich@suse.com" target=3D"_blank" rel=3D"nor=
eferrer">jbeulich@suse.com</a><br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; On 06.11.2019 10:19, Andrii Anisov wrote:<br>
&gt; &gt; &gt; &gt; --- a/Config.mk<br>
&gt; &gt; &gt; &gt; +++ b/Config.mk<br>
&gt; &gt; &gt; &gt; @@ -221,7 +221,9 @@ CFLAGS +=3D -Wall -Wstrict-prototyp=
es<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 $(call cc-option-add,HOSTCFLAGS,HOSTCC,-Wdeclarat=
ion-after-<br>
&gt; &gt; &gt; &gt; statement)<br>
&gt; &gt; &gt; &gt;=C2=A0 $(call cc-option-add,CFLAGS,CC,-Wdeclaration-afte=
r-statement)<br>
&gt; &gt; &gt; &gt; +ifneq ($(armds),y)<br>
&gt; &gt; &gt; &gt;=C2=A0 $(call cc-option-add,CFLAGS,CC,-Wno-unused-but-se=
t-variable)<br>
&gt; &gt; &gt; &gt; +endif<br>
&gt; &gt; &gt; &gt;=C2=A0 $(call cc-option-add,CFLAGS,CC,-Wno-unused-local-=
typedefs)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 LDFLAGS +=3D $(foreach i, $(EXTRA_LIB), -L$(i))<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ... this would be necessary.<br>
&gt; &gt; <br>
&gt; &gt; I am very sorry, this patch does not have a proper description<br=
>
&gt; &gt; indeed.<br>
&gt; &gt; <br>
&gt; &gt; For this particular change - arm clang does not undestand<br>
&gt; &gt; -Wno-unused-but-set-variable<br>
&gt; &gt; option at all, that is why it is under !$(armds)<br>
&gt; <br>
&gt; But avoiding to add options which the compiler doesn&#39;t understand<=
br>
&gt; is the purpose of using cc-option-add, rather than blindly<br>
&gt; adding<br>
&gt; them to CFLAGS. What am I missing here?<br>
<br>
You are right, the script shall check the compiler option and avoid<br>
including it to CFLAGS. But armclang require &#39;--target=3D...&#39; to be=
<br>
specified in order to operate properly, and the proper fix shall be<br>
something like this (instead of &#39;ifneq&#39; hack above):<br>
<br>
diff --git a/Config.mk b/Config.mk<br>
index 01487a7..abe8e44 100644<br>
--- a/Config.mk<br>
+++ b/Config.mk<br>
@@ -107,7 +107,7 @@ cc-option =3D $(shell if test -z &quot;`echo &#39;void*=
p=3D1;&#39; | \<br>
=C2=A0# Usage: $(call cc-option-add CFLAGS,CC,-march=3Dwinchip-c6)<br>
=C2=A0cc-option-add =3D $(eval $(call cc-option-add-closure,$(1),$(2),$(3))=
)<br>
=C2=A0define cc-option-add-closure<br>
-=C2=A0 =C2=A0 ifneq ($$(call cc-option,$$($(2)),$(3),n),n)<br>
+=C2=A0 =C2=A0 ifneq ($$(call cc-option,$$($(2) $(1)),$(3),n),n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(1) +=3D $(3)<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
=C2=A0endef<br>
<br>
so that CFLAGS that are already defined and include &#39;--target=3D...&#39=
;<br>
option from config/arm*.mk are passed to compiler to make it happy. I<br>
am not sure if this breaks anything else so decided to go with ugly<br>
&#39;ifneq&#39; hack and check how this can be solved later on.<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Why not incl=
uding --target in CC variable as this was suggested for clang?</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">--=C2=A0</div><div dir=3D"auto">Julien Grall</div></=
div>

--000000000000778bf8059745c91f--


--===============4861263065230640779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4861263065230640779==--

