Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326295661F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 10:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779408.1189151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyCO-0006gY-Bn; Mon, 19 Aug 2024 08:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779408.1189151; Mon, 19 Aug 2024 08:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyCO-0006dF-6g; Mon, 19 Aug 2024 08:57:12 +0000
Received: by outflank-mailman (input) for mailman id 779408;
 Mon, 19 Aug 2024 08:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhAH=PS=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sfyCM-0005fE-Lh
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 08:57:10 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04e346f4-5e09-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 10:57:10 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f025b94e07so45650841fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 01:57:10 -0700 (PDT)
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
X-Inumbo-ID: 04e346f4-5e09-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724057830; x=1724662630; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FYMsk7TEsbmJN7jxn5NfCREsiyNySqeYW4WZR8Xrlo=;
        b=kXxxsjjU/TiC1kGLKDH4lmKZuFNuQmgpHFptArFLhaimjvT53RSLX0cAd/XNMVyxQo
         X0r711fCKcS8CZ48186XTGA8wfaKq9Nv0L99D0ys9ppP0EV5wU5m3nR2eFXSkQXmpgXP
         2GjWZNjHnuiFLRAUVULdupy77ktGed99nKjEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724057830; x=1724662630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FYMsk7TEsbmJN7jxn5NfCREsiyNySqeYW4WZR8Xrlo=;
        b=H+QQNF9KYi7qkY7ujdaAcL4DizcTqxTgqFcm38CYYSU+US9x6JJtnuOKXS4mN0FXCA
         UDgrv4UG/o6Acc3VeWSNyp2AvJJ9wrvqIQ70gElmSz9VjdMC7eCsOMMeyGjH38gYZB7v
         MxG7qBlEDG58kpY7a6mVQFuYvMdGhU2iT2+glFD78MaomwidvTui0z4h0/66DfaKnkp4
         NfyF9jTS6TkfmmRrpKIrun1VQKglsX0L1f6Nr/yzU/qQHefflHfPI0UOcWAFgHY5u0W3
         Su0Awy3iSFN7eUuJTIvvZKjr9NnqtQ7e745/HDRcKh2Uov9QU2k9ARIIGwMFArf9MRVO
         FJog==
X-Forwarded-Encrypted: i=1; AJvYcCWiBG6eFt8Y3+4uivOzk2EPIwq4B7TqfwkZuzg6egIFCcANonfxjuBnx1yDOo8LVfKk05daA6TJ3XG/xgxlvG5eP/kT3V8esTjruK33cOU=
X-Gm-Message-State: AOJu0YyWK9LFo7nU2NYRll12LhF59jJ9wqKQQntBtCvDf/cKnsFJAi7K
	2jRi+S85n55XhQqoJxjajADHD8+ZDyO0vSeHec4oyuu+GnqefjeG1i+ZpkZI4+/9jx72nTiLd1p
	TvsCBIlb4x02FBDzewYr3rguYPdaBgjUUKILiXA==
X-Google-Smtp-Source: AGHT+IHCN7WapRzkg4OaxXWKThPzcwODCHtxX2D5KQ4oDFOMVjbKdkvEur16UAlPQmMl6S+It3pVV5P0K54YQwLDTg8=
X-Received: by 2002:a2e:4a12:0:b0:2f3:c033:d2e3 with SMTP id
 38308e7fff4ca-2f3c033d35emr60914241fa.15.1724057828733; Mon, 19 Aug 2024
 01:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
 <20240725082725.2685481-4-fouad.hilly@cloud.com> <d26bc29f-3ceb-4fe4-af58-c188f9bbf097@suse.com>
In-Reply-To: <d26bc29f-3ceb-4fe4-af58-c188f9bbf097@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Mon, 19 Aug 2024 09:56:57 +0100
Message-ID: <CAJKAvHbM=Dhi=VRuaKKGMgoyOP9PHyF=Q50wfezpxs=mkRTZug@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] x86/ucode: Introduce --force option to xen-ucode
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000007456600620057e8b"

--0000000000007456600620057e8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 9:44=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 25.07.2024 10:27, Fouad Hilly wrote:
> > Introduce --force option to xen-ucode to force skipping microcode
> version check, which
> > allows the user to update x86 microcode even if both versions are the
> same or downgrade.
> > xc_microcode_update() refactored to accept flags and utilize
> xenpf_microcode_update2.
> >
> > Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> > Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > [v6]
> > 1- Fix usage() output for -f option to be explicitly wrapped for 80
> character width
> > [v5]
> > 1- Update commit message.
> > 2- Re-phrase --force option description.
> > [v4]
> > 1- Add --force to xen-ucode options.
> > 2- Update xc_microcode_update() to accept and handle flags.
> > ---
> >  tools/include/xenctrl.h   |  3 ++-
> >  tools/libs/ctrl/xc_misc.c | 12 +++++++-----
> >  tools/misc/xen-ucode.c    | 15 ++++++++++++---
> >  3 files changed, 21 insertions(+), 9 deletions(-)
> >
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index 9ceca0cffc2f..2c4608c09ab0 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -1171,7 +1171,8 @@ typedef uint32_t xc_node_to_node_dist_t;
> >  int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
> >  int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
> >                     xc_cputopo_t *cputopo);
> > -int xc_microcode_update(xc_interface *xch, const void *buf, size_t len=
);
> > +int xc_microcode_update(xc_interface *xch, const void *buf,
> > +                        size_t len, unsigned int flags);
> >  int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version
> *cpu_ver);
> >  int xc_get_ucode_revision(xc_interface *xch,
> >                            struct xenpf_ucode_revision *ucode_rev);
> > diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
> > index 50282fd60dcc..6a60216bda03 100644
> > --- a/tools/libs/ctrl/xc_misc.c
> > +++ b/tools/libs/ctrl/xc_misc.c
> > @@ -203,11 +203,12 @@ int xc_physinfo(xc_interface *xch,
> >      return 0;
> >  }
> >
> > -int xc_microcode_update(xc_interface *xch, const void *buf, size_t len=
)
> > +int xc_microcode_update(xc_interface *xch, const void *buf,
> > +                        size_t len, unsigned int flags)
> >  {
> >      int ret;
> >      struct xen_platform_op platform_op =3D {};
> > -    DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update, uc);
> > +    DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update2, uc);
> >
> >      uc =3D xc_hypercall_buffer_alloc(xch, uc, len);
> >      if ( uc =3D=3D NULL )
> > @@ -215,9 +216,10 @@ int xc_microcode_update(xc_interface *xch, const
> void *buf, size_t len)
> >
> >      memcpy(uc, buf, len);
> >
> > -    platform_op.cmd =3D XENPF_microcode_update;
> > -    platform_op.u.microcode.length =3D len;
> > -    set_xen_guest_handle(platform_op.u.microcode.data, uc);
> > +    platform_op.cmd =3D XENPF_microcode_update2;
> > +    platform_op.u.microcode2.length =3D len;
> > +    platform_op.u.microcode2.flags =3D flags;
> > +    set_xen_guest_handle(platform_op.u.microcode2.data, uc);
> >
> >      ret =3D do_platform_op(xch, &platform_op);
> >
> > diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> > index 2c9f337b86cb..688e540943b1 100644
> > --- a/tools/misc/xen-ucode.c
> > +++ b/tools/misc/xen-ucode.c
> > @@ -13,6 +13,8 @@
> >  #include <xenctrl.h>
> >  #include <getopt.h>
> >
> > +#include <xen/platform.h>
> > +
> >  static xc_interface *xch;
> >
> >  static const char intel_id[] =3D "GenuineIntel";
> > @@ -79,7 +81,9 @@ static void usage(FILE *stream, const char *name)
> >              "options:\n"
> >              "  -h, --help            display this help\n"
> >              "  -s, --show-cpu-info   show CPU information\n"
> > -            "Usage: %s [microcode file | options]\n", name, name);
> > +            "  -f, --force           skip certain checks; do not use
> unless\n"
> > +            "you know exactly what you are doing\n"
>
> Did you look at the produced output? Imo you want to have
>
>             "  -f, --force           skip certain checks; do not use
> unless\n"
>             "                        you know exactly what you are doing\=
n"
>
> > +            "Usage: %s [microcode file [-f,--force] | options]\n",
> name, name);
>
> At least
>
>             "Usage: %s [microcode file [-f|--force] | options]\n", name,
> name);
>
> But: "options" now includes -f / --force, yet that on its own makes no
> sense.
> I think this needs further textual clarification to properly indicate wha=
t
> is
> valid to use and what is not.
>

Will be fixed in v7:
static void usage(FILE *stream, const char *name)
{
    fprintf(stream,
            "%s: Xen microcode updating tool\n"
            "Usage: %s [options | microcode-file]\n"
            "options:\n"
            "  -h, --help                       display this help\n"
            "  -s, --show-cpu-info              show CPU information\n"
            "  -f, --force <microcode-file>     skip certain checks; do not
\n"
            "                                   use unless you know exactly
\n"
            "                                   what you are doing\n",
            name, name);
    show_curr_cpu(stream);
}

>
> Jan
>

Thanks,

Fouad

--0000000000007456600620057e8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 25, 2024 at 9:44=E2=80=AF=
AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">j=
beulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 25.07.2024 10:27, Fouad Hilly wrote:<br>
&gt; Introduce --force option to xen-ucode to force skipping microcode vers=
ion check, which<br>
&gt; allows the user to update x86 microcode even if both versions are the =
same or downgrade.<br>
&gt; xc_microcode_update() refactored to accept flags and utilize xenpf_mic=
rocode_update2.<br>
&gt; <br>
&gt; Signed-off-by: Fouad Hilly &lt;<a href=3D"mailto:fouad.hilly@cloud.com=
" target=3D"_blank">fouad.hilly@cloud.com</a>&gt;<br>
&gt; Reviewed-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix=
.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
&gt; ---<br>
&gt; [v6]<br>
&gt; 1- Fix usage() output for -f option to be explicitly wrapped for 80 ch=
aracter width<br>
&gt; [v5]<br>
&gt; 1- Update commit message.<br>
&gt; 2- Re-phrase --force option description.<br>
&gt; [v4]<br>
&gt; 1- Add --force to xen-ucode options.<br>
&gt; 2- Update xc_microcode_update() to accept and handle flags.<br>
&gt; ---<br>
&gt;=C2=A0 tools/include/xenctrl.h=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
&gt;=C2=A0 tools/libs/ctrl/xc_misc.c | 12 +++++++-----<br>
&gt;=C2=A0 tools/misc/xen-ucode.c=C2=A0 =C2=A0 | 15 ++++++++++++---<br>
&gt;=C2=A0 3 files changed, 21 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h<br>
&gt; index 9ceca0cffc2f..2c4608c09ab0 100644<br>
&gt; --- a/tools/include/xenctrl.h<br>
&gt; +++ b/tools/include/xenctrl.h<br>
&gt; @@ -1171,7 +1171,8 @@ typedef uint32_t xc_node_to_node_dist_t;<br>
&gt;=C2=A0 int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);<br>
&gt;=C2=A0 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0xc_cputopo_t *cputopo);<br>
&gt; -int xc_microcode_update(xc_interface *xch, const void *buf, size_t le=
n);<br>
&gt; +int xc_microcode_update(xc_interface *xch, const void *buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 size_t len, unsigned int flags);<br>
&gt;=C2=A0 int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_vers=
ion *cpu_ver);<br>
&gt;=C2=A0 int xc_get_ucode_revision(xc_interface *xch,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct xenpf_ucode_revision *ucode_rev);<br>
&gt; diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c<br>
&gt; index 50282fd60dcc..6a60216bda03 100644<br>
&gt; --- a/tools/libs/ctrl/xc_misc.c<br>
&gt; +++ b/tools/libs/ctrl/xc_misc.c<br>
&gt; @@ -203,11 +203,12 @@ int xc_physinfo(xc_interface *xch,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -int xc_microcode_update(xc_interface *xch, const void *buf, size_t le=
n)<br>
&gt; +int xc_microcode_update(xc_interface *xch, const void *buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 size_t len, unsigned int flags)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct xen_platform_op platform_op =3D {};<br>
&gt; -=C2=A0 =C2=A0 DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update,=
 uc);<br>
&gt; +=C2=A0 =C2=A0 DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update2=
, uc);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 uc =3D xc_hypercall_buffer_alloc(xch, uc, len);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( uc =3D=3D NULL )<br>
&gt; @@ -215,9 +216,10 @@ int xc_microcode_update(xc_interface *xch, const =
void *buf, size_t len)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 memcpy(uc, buf, len);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 platform_op.cmd =3D XENPF_microcode_update;<br>
&gt; -=C2=A0 =C2=A0 platform_op.u.microcode.length =3D len;<br>
&gt; -=C2=A0 =C2=A0 set_xen_guest_handle(platform_op.u.microcode.data, uc);=
<br>
&gt; +=C2=A0 =C2=A0 platform_op.cmd =3D XENPF_microcode_update2;<br>
&gt; +=C2=A0 =C2=A0 platform_op.u.microcode2.length =3D len;<br>
&gt; +=C2=A0 =C2=A0 platform_op.u.microcode2.flags =3D flags;<br>
&gt; +=C2=A0 =C2=A0 set_xen_guest_handle(platform_op.u.microcode2.data, uc)=
;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D do_platform_op(xch, &amp;platform_op);<br>
&gt;=C2=A0 <br>
&gt; diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c<br>
&gt; index 2c9f337b86cb..688e540943b1 100644<br>
&gt; --- a/tools/misc/xen-ucode.c<br>
&gt; +++ b/tools/misc/xen-ucode.c<br>
&gt; @@ -13,6 +13,8 @@<br>
&gt;=C2=A0 #include &lt;xenctrl.h&gt;<br>
&gt;=C2=A0 #include &lt;getopt.h&gt;<br>
&gt;=C2=A0 <br>
&gt; +#include &lt;xen/platform.h&gt;<br>
&gt; +<br>
&gt;=C2=A0 static xc_interface *xch;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const char intel_id[] =3D &quot;GenuineIntel&quot;;<br>
&gt; @@ -79,7 +81,9 @@ static void usage(FILE *stream, const char *name)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;options:\n&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -h, --hel=
p=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 display this help\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -s, --sho=
w-cpu-info=C2=A0 =C2=A0show CPU information\n&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Usage: %s [microcode =
file | options]\n&quot;, name, name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -f, --force=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip certain checks; do not use unles=
s\n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;you know exactly what=
 you are doing\n&quot;<br>
<br>
Did you look at the produced output? Imo you want to have<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -f, --force=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip certain checks; do not use unless\n&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 you know exactly w=
hat you are doing\n&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Usage: %s [microcode =
file [-f,--force] | options]\n&quot;, name, name);<br>
<br>
At least<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Usage: %s [microcode file [=
-f|--force] | options]\n&quot;, name, name);<br>
<br>
But: &quot;options&quot; now includes -f / --force, yet that on its own mak=
es no sense.<br>
I think this needs further textual clarification to properly indicate what =
is<br>
valid to use and what is not.<br></blockquote><div><br></div><div>Will be f=
ixed in v7:</div><div style=3D"color:rgb(204,204,204);background-color:rgb(=
31,31,31);font-family:Consolas,&quot;Courier New&quot;,monospace;font-size:=
14px;line-height:19px;white-space:pre-wrap"><div><span style=3D"color:rgb(8=
6,156,214)">static</span> <span style=3D"color:rgb(86,156,214)">void</span>=
 <span style=3D"color:rgb(220,220,170)">usage</span>(FILE <span style=3D"co=
lor:rgb(212,212,212)">*</span><span style=3D"color:rgb(156,220,254)">stream=
</span>, <span style=3D"color:rgb(86,156,214)">const</span> <span style=3D"=
color:rgb(86,156,214)">char</span> <span style=3D"color:rgb(212,212,212)">*=
</span><span style=3D"color:rgb(156,220,254)">name</span>)</div><div>{</div=
><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)">fprintf</span>(s=
tream,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"c=
olor:rgb(206,145,120)">&quot;</span><span style=3D"color:rgb(156,220,254)">=
%s</span><span style=3D"color:rgb(206,145,120)">: Xen microcode updating to=
ol</span><span style=3D"color:rgb(215,186,125)">\n</span><span style=3D"col=
or:rgb(206,145,120)">&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,120)">&quot;Usage: </span><s=
pan style=3D"color:rgb(156,220,254)">%s</span><span style=3D"color:rgb(206,=
145,120)"> [options | microcode-file]</span><span style=3D"color:rgb(215,18=
6,125)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</span></div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206=
,145,120)">&quot;options:</span><span style=3D"color:rgb(215,186,125)">\n</=
span><span style=3D"color:rgb(206,145,120)">&quot;</span></div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,120)">&=
quot; =C2=A0-h, --help =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 display this help</span><span style=3D"color:rgb(2=
15,186,125)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</span><=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rg=
b(206,145,120)">&quot; =C2=A0-s, --show-cpu-info =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0show CPU information</span><span style=3D"color:rgb=
(215,186,125)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</span=
></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:=
rgb(206,145,120)">&quot; =C2=A0-f, --force &lt;microcode-file&gt; =C2=A0 =
=C2=A0 skip certain checks; do not</span><span style=3D"color:rgb(215,186,1=
25)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</span></div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,14=
5,120)">&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use unless you =
know exactly</span><span style=3D"color:rgb(215,186,125)">\n</span><span st=
yle=3D"color:rgb(206,145,120)">&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,120)">&quot; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 what you are doing</span><span style=
=3D"color:rgb(215,186,125)">\n</span><span style=3D"color:rgb(206,145,120)"=
>&quot;</span>,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, n=
ame);</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)">show_c=
urr_cpu</span>(stream);</div></div><div><span style=3D"background-color:rgb=
(31,31,31);color:rgb(204,204,204);font-family:Consolas,&quot;Courier New&qu=
ot;,monospace;font-size:14px;white-space:pre-wrap">}</span>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Jan<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div>Fo=
uad=C2=A0</div></div></div>

--0000000000007456600620057e8b--

