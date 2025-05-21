Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6CCABE8C9
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 03:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991352.1375238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHXqP-0003y9-9S; Wed, 21 May 2025 01:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991352.1375238; Wed, 21 May 2025 01:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHXqP-0003wa-6g; Wed, 21 May 2025 01:02:05 +0000
Received: by outflank-mailman (input) for mailman id 991352;
 Wed, 21 May 2025 01:02:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fb4M=YF=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uHXqO-0003wU-9y
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 01:02:04 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34be3fc8-35df-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 03:02:02 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-550e2b9084dso6990198e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 18:02:02 -0700 (PDT)
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
X-Inumbo-ID: 34be3fc8-35df-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747789322; x=1748394122; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Las3xNmpnzPodzQgSlhouDoCKTDiT0A+EO/X0XnBjs0=;
        b=I//Gwx5EwYda2W6F5O08hx9fe+hv55EMFRVxq9bz6lvq9yeSnh30xGXS7HP/NxluSD
         99gsmsmcgIHjB/oi4L7PEH56ath5s4B8Or/eWM+d6sJfv0KMnhRJdtQLrOZXWK5Y8HM5
         Sfly7dSEhC7WFRt+5i3LcANfeWYWRwZ4m3GDX/3NxLfpSnPP0ZWv7hO7tzrAHddq1IDo
         VMWGIjihyvnP+mYaCcyukeRzgT16MhUnOygpcHp3L9V4dxUUoSjI7ptxH+87VftnMsMw
         9wQheK7cdV1wIyFPsGJ1cA9KPKCg2W/uCq7ckzi86FhcsYzoZtrnO7fjrKvqlJRC5vxC
         JDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747789322; x=1748394122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Las3xNmpnzPodzQgSlhouDoCKTDiT0A+EO/X0XnBjs0=;
        b=qvxA1LfryyNSG9ZRgXPPGDuUC3w4p84iLQJKSeTxFhF+XqH8a3Dewr/YrhI1bIU1Ai
         EfdsjtGGqebruOJyLYpu3JPc+DoWBsVDuPFGp7sHDRZGearUz7aqTsgpS86nImD8ILOf
         QCyvXw1+BhoA/h7p/+apJMTjht2/VmjI6gy70hf8Qw5vp+cA7rDcg46bW6+Q1dpzCBMo
         4ab9c+fWSlCJHWasQvZ/5DmZIyiBzLNDXV6Nq7vEEUBJRShl2r7jlbvfRV1p6x8XvPeR
         t3NUIFNmZAV0L1DJCJvpXLSv2oH5ijn/vT1TDC3Yowq0jCK3fARdeVoYjzmTdje8RJQR
         XiFg==
X-Gm-Message-State: AOJu0YwwHvCpoRs+bxBNbHPDhRCVIhQZKYkP1QVkPXnk8VGabRlOGXRl
	CDGWug0F3paWn6h0YlzDg90dEXfgwV3ADzJHG4M/itb0UhPJRf2Sa0J3nG76T20nRntGWd0a6we
	8Bs9vrs3MHDgd1DilSGMUa82KVNOLveA=
X-Gm-Gg: ASbGncsGc5E+R2qJL51Iz8rcY01k6ndchtH3QiOfWy2FlVV7s/9k/SaIkvuu+boGBqJ
	Elu79apPfwaJSKSEhAm9htqm+uHQTXQjE1psvNTWxW6uDDMdqG3pB+81Re9Aju54L6uoHppKOlJ
	ukuc9hmRVpRzSTr+/rKQuy3YYW7+GLTYM=
X-Google-Smtp-Source: AGHT+IF3HNLdNZhp9DCb931kzsZfgUHkPUwlmfwiyl3EuxvBL4+b22sPw8GiViKXmXdaQQSq9u5KIxFcpxv4IHRW5rw=
X-Received: by 2002:a05:6512:1342:b0:551:f76c:59ec with SMTP id
 2adb3069b0e04-551f76c5cecmr2117665e87.48.1747789321931; Tue, 20 May 2025
 18:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250520141027.120958-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250520141027.120958-1-andrew.cooper3@citrix.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 21 May 2025 02:01:50 +0100
X-Gm-Features: AX0GCFstFF_PAcvDgiM9qlK8k0YLU-TzV0F1omJnoZ9PZbsSDnJLveO6nMoIS9Y
Message-ID: <CACMJ4GY83K7-MvzViM5EwfJEQo9n0Ym_5NZYt9tx=uHBB8gB8Q@mail.gmail.com>
Subject: Re: [PATCH] xen/argo: Command line handling improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Denis Mukhin <dmkhn@proton.me>
Content-Type: multipart/alternative; boundary="000000000000ad12e906359ae906"

--000000000000ad12e906359ae906
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:10=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com>
wrote:

> Treat "argo" on the command line as a positive boolean, rather than
> requiring
> the user to pass "argo=3D1/on/enable/true".
>
> Move both opt_argo* variables into __ro_after_init.  They're set during
> command line parsing and never modified thereafter.
>

Instead of binding to static values set at boot, would
boolean_runtime_param be acceptable? This allows the system administrator
to adjust the Argo settings if the hypervisor has been compiled with it
enabled and booted with the default settings, and avoid having to reboot
and modify the bootloader configuration.

I agree with Daniel's request for a doc update where affected.

thanks,

Christopher



>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christopher Clark <christopher.w.clark@gmail.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Denis Mukhin <dmkhn@proton.me>
>
> Found while
> ---
>  xen/common/argo.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index cbe8911a4364..027b37b18a6c 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -79,8 +79,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_argo_unregister_ring_t);
>  DEFINE_COMPAT_HANDLE(compat_argo_iov_t);
>  #endif
>
> -static bool __read_mostly opt_argo;
> -static bool __read_mostly opt_argo_mac_permissive;
> +static bool __ro_after_init opt_argo;
> +static bool __ro_after_init opt_argo_mac_permissive;
>
>  static int __init cf_check parse_argo(const char *s)
>  {
> @@ -92,7 +92,10 @@ static int __init cf_check parse_argo(const char *s)
>          if ( !ss )
>              ss =3D strchr(s, '\0');
>
> -        if ( (val =3D parse_bool(s, ss)) >=3D 0 )
> +        /* Intepret "argo" as a positive boolean. */
> +        if ( *s =3D=3D '\0' )
> +            opt_argo =3D true;
> +        else if ( (val =3D parse_bool(s, ss)) >=3D 0 )
>              opt_argo =3D val;
>          else if ( (val =3D parse_boolean("mac-permissive", s, ss)) >=3D =
0 )
>              opt_argo_mac_permissive =3D val;
>
> base-commit: 293abb9e0c5e8df96cc5dfe457c62dfcb7542b19
> --
> 2.39.5
>
>

--000000000000ad12e906359ae906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, May 20, 2025 at 3:10=E2=80=AFPM A=
ndrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper=
3@citrix.com</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_cont=
ainer"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Treat &quot;argo&q=
uot; on the command line as a positive boolean, rather than requiring<br>
the user to pass &quot;argo=3D1/on/enable/true&quot;.<br>
<br>
Move both opt_argo* variables into __ro_after_init.=C2=A0 They&#39;re set d=
uring<br>
command line parsing and never modified thereafter.<br></blockquote><div><b=
r></div><div>Instead of binding to static values set at boot, would boolean=
_runtime_param be acceptable? This allows the system administrator to adjus=
t the Argo settings if the hypervisor has been compiled with it enabled and=
 booted with the default settings, and avoid having to reboot and modify th=
e bootloader configuration.</div><div><br></div><div>I agree with Daniel&#3=
9;s request for a doc update where affected.</div><div><br></div><div>thank=
s,</div><div><br></div><div>Christopher</div><div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.co=
m" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
---<br>
CC: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmail.com" =
target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
CC: Daniel P. Smith &lt;<a href=3D"mailto:dpsmith@apertussolutions.com" tar=
get=3D"_blank">dpsmith@apertussolutions.com</a>&gt;<br>
CC: Denis Mukhin &lt;<a href=3D"mailto:dmkhn@proton.me" target=3D"_blank">d=
mkhn@proton.me</a>&gt;<br>
<br>
Found while<br>
---<br>
=C2=A0xen/common/argo.c | 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/xen/common/argo.c b/xen/common/argo.c<br>
index cbe8911a4364..027b37b18a6c 100644<br>
--- a/xen/common/argo.c<br>
+++ b/xen/common/argo.c<br>
@@ -79,8 +79,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_argo_unregister_ring_t);<br>
=C2=A0DEFINE_COMPAT_HANDLE(compat_argo_iov_t);<br>
=C2=A0#endif<br>
<br>
-static bool __read_mostly opt_argo;<br>
-static bool __read_mostly opt_argo_mac_permissive;<br>
+static bool __ro_after_init opt_argo;<br>
+static bool __ro_after_init opt_argo_mac_permissive;<br>
<br>
=C2=A0static int __init cf_check parse_argo(const char *s)<br>
=C2=A0{<br>
@@ -92,7 +92,10 @@ static int __init cf_check parse_argo(const char *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !ss )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ss =3D strchr(s, &#39;\0&#3=
9;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( (val =3D parse_bool(s, ss)) &gt;=3D 0 )<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Intepret &quot;argo&quot; as a positive boo=
lean. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( *s =3D=3D &#39;\0&#39; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt_argo =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if ( (val =3D parse_bool(s, ss)) &gt;=3D =
0 )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt_argo =3D val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if ( (val =3D parse_boolean(&quot;ma=
c-permissive&quot;, s, ss)) &gt;=3D 0 )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt_argo_mac_permissive =3D=
 val;<br>
<br>
base-commit: 293abb9e0c5e8df96cc5dfe457c62dfcb7542b19<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div></div>

--000000000000ad12e906359ae906--

