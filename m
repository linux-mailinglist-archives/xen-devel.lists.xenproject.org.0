Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE05FA9E4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 06:58:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUldb-0003j6-Gc; Wed, 13 Nov 2019 05:56:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u0j9=ZF=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iUldZ-0003iz-P1
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 05:56:17 +0000
X-Inumbo-ID: 4e06ca9c-05da-11ea-b678-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e06ca9c-05da-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 05:56:16 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k15so1133473lja.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 21:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGkvn5K/ngkcPhfGaCE3AIGj3OXKsVItzXuHXWSRpfg=;
 b=nGpOcWxlLKZdFegsupMIWSJlzWQdItz/v4CDzwhD33Yt/Bx/jqtqsAAcHVCzHqFrig
 zFdP71mxGF/dSwLO/FTWPijpkYULgiShyRwDyMYjW3ZiVfQ6RiTwou/Q4oOLYL9AmHtD
 TNN5LAdNk2CkuN1TWBxa7J/nY531pXICOZZbH2MA48uM/Pj30/9tYmakqFEYBwCWc8DF
 5ku8K3SPr0ybKvueWMsJ3CcHzzIhNNHzVY4Nx210jTmidYOVUgrNJ6tFfih7gwyrhAIn
 RtD/QXICmqphC1AQww7KXfO6aq+F9tOAsIILBMmnz2y4j75gQpWIMIumqiukyEw7nC+I
 Qugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGkvn5K/ngkcPhfGaCE3AIGj3OXKsVItzXuHXWSRpfg=;
 b=TGaFaI8ao+4qHt7G7LiKHqlsspEsAwlPfyf/3zAlRcrgdcXESPQLSG/6RGBfmRsLvi
 AUglrXbNSftkqsmrysekLIs1iT5kTQKdYOqd9YpjAC5EmOhgSdmkF14vXHoXU50iterh
 6vqOOp7vrLVpsfXk2zOaDHfljV8oVbA1R9FrEzP1Y0gGI2PflRftZr8fwADmpLJCIJ6W
 ltDfUZgkG3YVzfgtoTYu8nXQ9p3bR2UnaLaHI5K9uaMDfIavDouVa6A+V27MjQZO7HiE
 A0rtN5my90oJQmGO+s72HXKK82DFnvDBhNiHNnKOEQHHUVuxZyTuBNAf7jp2EAgjf0aA
 wsKA==
X-Gm-Message-State: APjAAAX5wiz/T7XrKCQ4jjFWC9dwAydjWlaVPLsQm78/NhlK9HsIl+Dy
 CRy7+ik8b67hgZM0pLR977VX+PFl356WVwE/CsY=
X-Google-Smtp-Source: APXvYqymCl0ItldoXcqyS8+8eRR5sfY7tIFuYxuQN62vP3o+3z+1h7gpvdxaaiLcNic4Sk340ujtA56Pdo1IMLOY3pA=
X-Received: by 2002:a05:651c:20a:: with SMTP id
 y10mr1128857ljn.76.1573624575448; 
 Tue, 12 Nov 2019 21:56:15 -0800 (PST)
MIME-Version: 1.0
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-4-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1573031953-12894-4-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 13 Nov 2019 14:56:02 +0900
Message-ID: <CAJ=z9a3JY5oJCeMQr72_4J+T+9us-_SwrbmZiBMeq0aYU5WHfQ@mail.gmail.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [Xen-devel] [RFC 3/7] arm64:armds: ARM Compiler 6.6 does not
 accept `rx` registers naming for AArch64
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============5057616043187760359=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5057616043187760359==
Content-Type: multipart/alternative; boundary="000000000000d4599605973405db"

--000000000000d4599605973405db
Content-Type: text/plain; charset="UTF-8"

Hi,

Aside what Stefano and Jan already said. Please, reword the commit title.
It should reflect what the commit does not describe the error (this should
part of the message).

On Wed, 6 Nov 2019, 18:19 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> From: Andrii Anisov <andrii_anisov@epam.com>
>
> So get the code duplication with `x`-es.
>

Please provide a link to the documentation so this can be cross-checked.

Cheers,


> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
> ---
>  xen/include/asm-arm/smccc.h | 60
> +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/xen/include/asm-arm/smccc.h b/xen/include/asm-arm/smccc.h
> index 126399d..3fa1144 100644
> --- a/xen/include/asm-arm/smccc.h
> +++ b/xen/include/asm-arm/smccc.h
> @@ -120,6 +120,8 @@ struct arm_smccc_res {
>  #define __constraint_read_6 __constraint_read_5, "r" (r6)
>  #define __constraint_read_7 __constraint_read_6, "r" (r7)
>
> +#ifdef CONFIG_ARM_32
> +
>  #define __declare_arg_0(a0, res)                        \
>      struct arm_smccc_res    *___res = res;              \
>      register unsigned long  r0 asm("r0") = (uint32_t)a0;\
> @@ -174,6 +176,64 @@ struct arm_smccc_res {
>      __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
>      register typeof(a7) r7 asm("r7") = __a7
>
> +#else /* ARM_64 */
> +
> +#define __declare_arg_0(a0, res)                        \
> +    struct arm_smccc_res    *___res = res;              \
> +    register unsigned long  r0 asm("x0") = (uint32_t)a0;\
> +    register unsigned long  r1 asm("x1");               \
> +    register unsigned long  r2 asm("x2");               \
> +    register unsigned long  r3 asm("x3")
> +
> +#define __declare_arg_1(a0, a1, res)                    \
> +    typeof(a1) __a1 = a1;                               \
> +    struct arm_smccc_res    *___res = res;              \
> +    register unsigned long  r0 asm("x0") = (uint32_t)a0;\
> +    register unsigned long  r1 asm("x1") = __a1;        \
> +    register unsigned long  r2 asm("x2");               \
> +    register unsigned long  r3 asm("x3")
> +
> +#define __declare_arg_2(a0, a1, a2, res)                \
> +    typeof(a1) __a1 = a1;                               \
> +    typeof(a2) __a2 = a2;                               \
> +    struct arm_smccc_res    *___res = res;                              \
> +    register unsigned long  r0 asm("x0") = (uint32_t)a0;\
> +    register unsigned long  r1 asm("x1") = __a1;        \
> +    register unsigned long  r2 asm("x2") = __a2;        \
> +    register unsigned long  r3 asm("x3")
> +
> +#define __declare_arg_3(a0, a1, a2, a3, res)            \
> +    typeof(a1) __a1 = a1;                               \
> +    typeof(a2) __a2 = a2;                               \
> +    typeof(a3) __a3 = a3;                               \
> +    struct arm_smccc_res    *___res = res;              \
> +    register unsigned long  r0 asm("x0") = (uint32_t)a0;\
> +    register unsigned long  r1 asm("x1") = __a1;        \
> +    register unsigned long  r2 asm("x2") = __a2;        \
> +    register unsigned long  r3 asm("x3") = __a3
> +
> +#define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
> +    typeof(a4) __a4 = a4;                               \
> +    __declare_arg_3(a0, a1, a2, a3, res);               \
> +    register unsigned long r4 asm("x4") = __a4
> +
> +#define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
> +    typeof(a5) __a5 = a5;                               \
> +    __declare_arg_4(a0, a1, a2, a3, a4, res);           \
> +    register typeof(a5) r5 asm("x5") = __a5
> +
> +#define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
> +    typeof(a6) __a6 = a6;                                   \
> +    __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
> +    register typeof(a6) r6 asm("x6") = __a6
> +
> +#define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
> +    typeof(a7) __a7 = a7;                                       \
> +    __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
> +    register typeof(a7) r7 asm("x7") = __a7
> +
> +#endif
> +
>  #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
>  #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
>
> --
> 2.7.4
>
>

--000000000000d4599605973405db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Aside what Stefano and Jan already said. Please, reword the commit title=
. It should reflect what the commit does not describe the error (this shoul=
d part of the message).</div><div dir=3D"auto"><br><div class=3D"gmail_quot=
e" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 6 Nov 2019, 1=
8:19 Andrii Anisov, &lt;<a href=3D"mailto:andrii.anisov@gmail.com">andrii.a=
nisov@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From=
: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" target=3D"_bl=
ank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br>
<br>
So get the code duplication with `x`-es.<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Please provide a link to the docume=
ntation so this can be cross-checked.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" =
target=3D"_blank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br>
---<br>
=C2=A0xen/include/asm-arm/smccc.h | 60 ++++++++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 60 insertions(+)<br>
<br>
diff --git a/xen/include/asm-arm/smccc.h b/xen/include/asm-arm/smccc.h<br>
index 126399d..3fa1144 100644<br>
--- a/xen/include/asm-arm/smccc.h<br>
+++ b/xen/include/asm-arm/smccc.h<br>
@@ -120,6 +120,8 @@ struct arm_smccc_res {<br>
=C2=A0#define __constraint_read_6 __constraint_read_5, &quot;r&quot; (r6)<b=
r>
=C2=A0#define __constraint_read_7 __constraint_read_6, &quot;r&quot; (r7)<b=
r>
<br>
+#ifdef CONFIG_ARM_32<br>
+<br>
=C2=A0#define __declare_arg_0(a0, res)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0struct arm_smccc_res=C2=A0 =C2=A0 *___res =3D res;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0register unsigned long=C2=A0 r0 asm(&quot;r0&quot;) =3D=
 (uint32_t)a0;\<br>
@@ -174,6 +176,64 @@ struct arm_smccc_res {<br>
=C2=A0 =C2=A0 =C2=A0__declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0register typeof(a7) r7 asm(&quot;r7&quot;) =3D __a7<br>
<br>
+#else /* ARM_64 */<br>
+<br>
+#define __declare_arg_0(a0, res)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 struct arm_smccc_res=C2=A0 =C2=A0 *___res =3D res;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r0 asm(&quot;x0&quot;) =3D (uin=
t32_t)a0;\<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r1 asm(&quot;x1&quot;);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r2 asm(&quot;x2&quot;);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r3 asm(&quot;x3&quot;)<br>
+<br>
+#define __declare_arg_1(a0, a1, res)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 typeof(a1) __a1 =3D a1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 struct arm_smccc_res=C2=A0 =C2=A0 *___res =3D res;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r0 asm(&quot;x0&quot;) =3D (uin=
t32_t)a0;\<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r1 asm(&quot;x1&quot;) =3D __a1=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r2 asm(&quot;x2&quot;);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r3 asm(&quot;x3&quot;)<br>
+<br>
+#define __declare_arg_2(a0, a1, a2, res)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 typeof(a1) __a1 =3D a1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 typeof(a2) __a2 =3D a2;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 struct arm_smccc_res=C2=A0 =C2=A0 *___res =3D res;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r0 asm(&quot;x0&quot;) =3D (uin=
t32_t)a0;\<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r1 asm(&quot;x1&quot;) =3D __a1=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r2 asm(&quot;x2&quot;) =3D __a2=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r3 asm(&quot;x3&quot;)<br>
+<br>
+#define __declare_arg_3(a0, a1, a2, a3, res)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 typeof(a1) __a1 =3D a1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 typeof(a2) __a2 =3D a2;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 typeof(a3) __a3 =3D a3;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 struct arm_smccc_res=C2=A0 =C2=A0 *___res =3D res;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r0 asm(&quot;x0&quot;) =3D (uin=
t32_t)a0;\<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r1 asm(&quot;x1&quot;) =3D __a1=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r2 asm(&quot;x2&quot;) =3D __a2=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 register unsigned long=C2=A0 r3 asm(&quot;x3&quot;) =3D __a3=
<br>
+<br>
+#define __declare_arg_4(a0, a1, a2, a3, a4, res)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
+=C2=A0 =C2=A0 typeof(a4) __a4 =3D a4;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 __declare_arg_3(a0, a1, a2, a3, res);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 register unsigned long r4 asm(&quot;x4&quot;) =3D __a4<br>
+<br>
+#define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 typeof(a5) __a5 =3D a5;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 __declare_arg_4(a0, a1, a2, a3, a4, res);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 register typeof(a5) r5 asm(&quot;x5&quot;) =3D __a5<br>
+<br>
+#define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)=C2=A0 =C2=A0 \<br=
>
+=C2=A0 =C2=A0 typeof(a6) __a6 =3D a6;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 __declare_arg_5(a0, a1, a2, a3, a4, a5, res);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 register typeof(a6) r6 asm(&quot;x6&quot;) =3D __a6<br>
+<br>
+#define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)=C2=A0 =C2=A0 =
\<br>
+=C2=A0 =C2=A0 typeof(a7) __a7 =3D a7;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 register typeof(a7) r7 asm(&quot;x7&quot;) =3D __a7<br>
+<br>
+#endif<br>
+<br>
=C2=A0#define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS=
__)<br>
=C2=A0#define __declare_args(count, ...)=C2=A0 ___declare_args(count, __VA_=
ARGS__)<br>
<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div></div></div>

--000000000000d4599605973405db--


--===============5057616043187760359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5057616043187760359==--

