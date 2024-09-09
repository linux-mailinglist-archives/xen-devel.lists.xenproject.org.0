Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E3A971B81
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794530.1203495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snej9-0002dr-Gt; Mon, 09 Sep 2024 13:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794530.1203495; Mon, 09 Sep 2024 13:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snej9-0002an-E6; Mon, 09 Sep 2024 13:46:47 +0000
Received: by outflank-mailman (input) for mailman id 794530;
 Mon, 09 Sep 2024 13:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snej7-0002VR-Vq
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:46:46 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f387ca2c-6eb1-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 15:46:45 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5dfaccba946so2919266eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:46:45 -0700 (PDT)
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
X-Inumbo-ID: f387ca2c-6eb1-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725889604; x=1726494404; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PoLB7ABoStx6dnf18UOsV90naw90QD/Yt3tM02thUws=;
        b=LyAocoFVsIlTEggU9W5ZiD4yAsgUu7RISVL0z/WHhS/aykV/6btEFZiAWhnyTEk7ln
         9ZSufpaOq4XFvAmTRHjOwfmIG4RFt9UV8gEdqga7LOcFyrhSMHmYmt4en2JH4S313p7c
         45u0p0tJEtGELsFD6OuzUlw3F6yOIMl15qiUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889604; x=1726494404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PoLB7ABoStx6dnf18UOsV90naw90QD/Yt3tM02thUws=;
        b=t1AFGmNTF75MujQOgW/tDw7G+H/z9xMAULI6XBL2xbkP/GFZUO5mKzGoF/YtV/x1wI
         w/mfakEBMH1DodbOl/56vQdY6IVv9F5f8AL6/6EMeHAR8UCIbw+MwwwfrTRu1u20jiLW
         GfKlnTt5fXbho+1FACkJoYR3Gj17TRfJYm2VF/ObYo8RtUP9952vmJh6YAaXnPOKN6z2
         mJPaJ6B2f94HwLC1v7k6Tuj941dGj4PQ9bhhbVH0JBoOfTiXEg92IvXH0NI//zICOcK0
         b+Q/tUzRjh+UvR0fx60/WCRLqiydR5MmskRstqwf6xygGbWH1NmR7b1kC19XHfc8l4yg
         IAnw==
X-Gm-Message-State: AOJu0YxCB2vF0aMPeC5gp1p8j+SYFVO5XKTbyedCCOSnwtLnL6HMfZI/
	Fak5s3ya1z+/fUl0bKpGW8ESf9hZYyRWZJtkxHPEtu3lB7zmGD4lTYQ3drbhuMoaaj/0/E33+Jf
	A/R0wNN57hEpCTVvtRUzr1E6pwWCMw2gv85nlhQ==
X-Google-Smtp-Source: AGHT+IG8VuQleorSeMGk2+ULw9pEeiPSmMiE/G1qA/7dOuyzF6pIInDPHa+OKM3dwsauSnLk15nSLpQ8OLt2fqIP5Z0=
X-Received: by 2002:a05:6820:1b86:b0:5ce:d2e3:b18 with SMTP id
 006d021491bc7-5e1a9d96318mr9753154eaf.8.1725889604041; Mon, 09 Sep 2024
 06:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <201625791b87a4ab20e6fb38642ed64f88ce8b2d.1725888742.git.alessandro.zucchelli@bugseng.com>
In-Reply-To: <201625791b87a4ab20e6fb38642ed64f88ce8b2d.1725888742.git.alessandro.zucchelli@bugseng.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 9 Sep 2024 14:46:33 +0100
Message-ID: <CACHz=Zj8wu9Rm5H-OqYTSys3-zij64uEB9M5iAsfL8=-eFXDVQ@mail.gmail.com>
Subject: Re: [XEN PATCH v2] x86/mm address violations of MISRA C:2012 Rule 5.3
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000c55a670621affc4d"

--000000000000c55a670621affc4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 2:36=E2=80=AFPM Alessandro Zucchelli <
alessandro.zucchelli@bugseng.com> wrote:

> This addresses violations of MISRA C:2012 Rule 5.3 which states as
> following: An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope.
>
> In /x86/mm.c the object struct e820entry *e820 hides an identifier
> with the same name declared in x86/include/asm/e820.h.
>
> No functional change.
>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
> Changes in v2:
> - rebased against current staging tree
>
>  xen/arch/x86/mm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index c735aaf0e8..d537a799bc 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4708,7 +4708,7 @@ long arch_memory_op(unsigned long cmd,
> XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>          struct xen_foreign_memory_map fmap;
>          struct domain *d;
> -        struct e820entry *e820;
> +        struct e820entry *e;
>

Couldn't we use a more meaningful name, like e820entries?


>
>          if ( copy_from_guest(&fmap, arg, 1) )
>              return -EFAULT;
> @@ -4727,23 +4727,23 @@ long arch_memory_op(unsigned long cmd,
> XEN_GUEST_HANDLE_PARAM(void) arg)
>              return rc;
>          }
>
> -        e820 =3D xmalloc_array(e820entry_t, fmap.map.nr_entries);
> -        if ( e820 =3D=3D NULL )
> +        e =3D xmalloc_array(e820entry_t, fmap.map.nr_entries);
> +        if ( e =3D=3D NULL )
>          {
>              rcu_unlock_domain(d);
>              return -ENOMEM;
>          }
>
> -        if ( copy_from_guest(e820, fmap.map.buffer, fmap.map.nr_entries)=
 )
> +        if ( copy_from_guest(e, fmap.map.buffer, fmap.map.nr_entries) )
>          {
> -            xfree(e820);
> +            xfree(e);
>              rcu_unlock_domain(d);
>              return -EFAULT;
>          }
>
>          spin_lock(&d->arch.e820_lock);
>          xfree(d->arch.e820);
> -        d->arch.e820 =3D e820;
> +        d->arch.e820 =3D e;
>          d->arch.nr_e820 =3D fmap.map.nr_entries;
>          spin_unlock(&d->arch.e820_lock);
>
>
Frediano

--000000000000c55a670621affc4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Sep 9, 2024 at 2:36=E2=80=AFPM Alessandro Zucchelli &lt;<a h=
ref=3D"mailto:alessandro.zucchelli@bugseng.com">alessandro.zucchelli@bugsen=
g.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">This addresses violations of MISRA C:2012 Rule 5.3 which states as<br>
following: An identifier declared in an inner scope shall not hide an<br>
identifier declared in an outer scope.<br>
<br>
In /x86/mm.c the object struct e820entry *e820 hides an identifier<br>
with the same name declared in x86/include/asm/e820.h.<br>
<br>
No functional change.<br>
<br>
Signed-off-by: Alessandro Zucchelli &lt;<a href=3D"mailto:alessandro.zucche=
lli@bugseng.com" target=3D"_blank">alessandro.zucchelli@bugseng.com</a>&gt;=
<br>
---<br>
Changes in v2:<br>
- rebased against current staging tree<br>
<br>
=C2=A0xen/arch/x86/mm.c | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c<br>
index c735aaf0e8..d537a799bc 100644<br>
--- a/xen/arch/x86/mm.c<br>
+++ b/xen/arch/x86/mm.c<br>
@@ -4708,7 +4708,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HAND=
LE_PARAM(void) arg)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct xen_foreign_memory_map fmap;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct domain *d;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct e820entry *e820;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct e820entry *e;<br></blockquote><div><br>=
</div><div>Couldn&#39;t we use a more meaningful name, like e820entries?<br=
></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( copy_from_guest(&amp;fmap, arg, 1) )=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
@@ -4727,23 +4727,23 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HA=
NDLE_PARAM(void) arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 e820 =3D xmalloc_array(e820entry_t, fmap.map.n=
r_entries);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( e820 =3D=3D NULL )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D xmalloc_array(e820entry_t, fmap.map.nr_e=
ntries);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( e =3D=3D NULL )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_unlock_domain(d);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( copy_from_guest(e820, fmap.map.buffer, fm=
ap.map.nr_entries) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( copy_from_guest(e, fmap.map.buffer, fmap.=
map.nr_entries) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xfree(e820);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xfree(e);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_unlock_domain(d);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;d-&gt;arch.e820_lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfree(d-&gt;arch.e820);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;arch.e820 =3D e820;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;arch.e820 =3D e;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;arch.nr_e820 =3D fmap.map.nr_entrie=
s;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;d-&gt;arch.e820_lock);<b=
r>
<br></blockquote><div><br></div><div>Frediano</div><div>=C2=A0<br></div></d=
iv></div>

--000000000000c55a670621affc4d--

