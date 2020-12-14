Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037332D93C6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 09:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51946.90884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koirC-0001c3-7P; Mon, 14 Dec 2020 08:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51946.90884; Mon, 14 Dec 2020 08:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koirC-0001be-43; Mon, 14 Dec 2020 08:05:22 +0000
Received: by outflank-mailman (input) for mailman id 51946;
 Mon, 14 Dec 2020 08:05:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K590=FS=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1koirA-0001bZ-5M
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 08:05:20 +0000
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9972717d-5d78-4853-ae96-9d20773f3514;
 Mon, 14 Dec 2020 08:05:19 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id q22so3509953eja.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Dec 2020 00:05:19 -0800 (PST)
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
X-Inumbo-ID: 9972717d-5d78-4853-ae96-9d20773f3514
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TiB2F/QWVAlfD2IsKZXhLFiZ75QHq0FFdQ/Lizli0g0=;
        b=F315ig/6/Gu7lB+D3/eCEGRGZzsyMTap3fAtk2tQ6P6Vkm6DEJK15FNnVvp+jcjujD
         liTiZGjVI7uNM6WbG2ZYdCjObA9P6KKY9/b0f59rKrPIkStxpyIh/NncDp242+VgBmvd
         /KJlqgHxBNhrr4y/RVZyDMBjYn2aU3JMZa0J7xmyhVvBe9crJTCIjg39wsbnTFBgl89J
         nWn7w83o/TFQhoXB313BkvWEgzVRDFgSWDBGg83JL/JbTKtsOexswDFm/K2wTqOyRCCv
         MqIzh6tZuacUZEokI5s1Wwx9/4kNP8vr4/csavrGM9gm61kIO19ZHdpjQXH9ueNQNxXN
         /lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TiB2F/QWVAlfD2IsKZXhLFiZ75QHq0FFdQ/Lizli0g0=;
        b=HvlDIeTB2pUtLPQi81tqiGtIelknn6BgqfX6mqTV1AHBdgNWgfAdi3x/A4x85vL+ek
         D+9Y/+bA03Oj4+C8MTjknNLyiMnlQe/VD9qen+u/nFe2Jbw34UojuYa6wN3poZIBVy8o
         Mr2qrT/n9K6gYdsbx3bRbxj0u/wpmoNV9sqoInL4yhEoYJElVEWVqk/AuoxBwSdKgiwb
         pmHOlpGm8ITHXe53a503ASAuvKjwHGn5g94/CJwlf4iUOx9Q3Rnr+XQgEHDgh9YLV2AM
         R51OG1GqhBTqPotpF/ZZ09BcHL2QIp4QS+GvP+spwD5GSZPZ7lMkHuVbWf01M+01MMSp
         pjMA==
X-Gm-Message-State: AOAM532iHADdkzDIlHiIAbUlrVU5ji/c3ERAr/mlJgl5Dlb0e36XyMoW
	zfdM2H3pK6PzjytWSEHbhKKtDBrWUTSwIj9oLI4=
X-Google-Smtp-Source: ABdhPJznfNt7s53g5IQ7FIyvHkE8ul5p+FofIGYKbfcP6yJUlWHy0cPXR1+relJpFBG9qlDzAUw/X9v5sYr7YLru7eo=
X-Received: by 2002:a17:906:9452:: with SMTP id z18mr12709453ejx.389.1607933118217;
 Mon, 14 Dec 2020 00:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com> <20201210134752.780923-14-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-14-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 14 Dec 2020 12:05:05 +0400
Message-ID: <CAJ+F1C+_CE5uaQ7QMkaca498WFcRWSb+zez2zwi_BqUMCTK2zA@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] compiler.h: remove QEMU_GNUC_PREREQ
To: QEMU <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	"open list:ARM" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005583ba05b6681a42"

--0000000000005583ba05b6681a42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 10, 2020 at 6:07 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> When needed, the G_GNUC_CHECK_VERSION() glib macro can be used instead.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h    | 11 -----------
>  scripts/cocci-macro-file.h |  1 -
>  2 files changed, 12 deletions(-)
>
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 5e6cf2c8e8..1b9e58e82b 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -11,17 +11,6 @@
>  #define QEMU_STATIC_ANALYSIS 1
>  #endif
>
>
> -/*----------------------------------------------------------------------=
------
> -| The macro QEMU_GNUC_PREREQ tests for minimum version of the GNU C
> compiler.
> -| The code is a copy of SOFTFLOAT_GNUC_PREREQ, see softfloat-macros.h.
>
> -*-----------------------------------------------------------------------=
-----*/
> -#if defined(__GNUC__) && defined(__GNUC_MINOR__)
> -# define QEMU_GNUC_PREREQ(maj, min) \
> -         ((__GNUC__ << 16) + __GNUC_MINOR__ >=3D ((maj) << 16) + (min))
> -#else
> -# define QEMU_GNUC_PREREQ(maj, min) 0
> -#endif
> -
>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>
>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
> diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
> index c6bbc05ba3..20eea6b708 100644
> --- a/scripts/cocci-macro-file.h
> +++ b/scripts/cocci-macro-file.h
> @@ -19,7 +19,6 @@
>   */
>
>  /* From qemu/compiler.h */
> -#define QEMU_GNUC_PREREQ(maj, min) 1
>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>  #define QEMU_SENTINEL __attribute__((sentinel))
>

ping, thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005583ba05b6681a42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 10, 2020 at 6:07 PM &lt=
;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.=
com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
When needed, the G_GNUC_CHECK_VERSION() glib macro can be used instead.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/compiler.h=C2=A0 =C2=A0 | 11 -----------<br>
=C2=A0scripts/cocci-macro-file.h |=C2=A0 1 -<br>
=C2=A02 files changed, 12 deletions(-)<br>
<br>
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h<br>
index 5e6cf2c8e8..1b9e58e82b 100644<br>
--- a/include/qemu/compiler.h<br>
+++ b/include/qemu/compiler.h<br>
@@ -11,17 +11,6 @@<br>
=C2=A0#define QEMU_STATIC_ANALYSIS 1<br>
=C2=A0#endif<br>
<br>
-/*------------------------------------------------------------------------=
----<br>
-| The macro QEMU_GNUC_PREREQ tests for minimum version of the GNU C compil=
er.<br>
-| The code is a copy of SOFTFLOAT_GNUC_PREREQ, see softfloat-macros.h.<br>
-*-------------------------------------------------------------------------=
---*/<br>
-#if defined(__GNUC__) &amp;&amp; defined(__GNUC_MINOR__)<br>
-# define QEMU_GNUC_PREREQ(maj, min) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((__GNUC__ &lt;&lt; 16) + __GNUC_MINOR__=
 &gt;=3D ((maj) &lt;&lt; 16) + (min))<br>
-#else<br>
-# define QEMU_GNUC_PREREQ(maj, min) 0<br>
-#endif<br>
-<br>
=C2=A0#define QEMU_NORETURN __attribute__ ((__noreturn__))<br>
<br>
=C2=A0#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))<b=
r>
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h<br>
index c6bbc05ba3..20eea6b708 100644<br>
--- a/scripts/cocci-macro-file.h<br>
+++ b/scripts/cocci-macro-file.h<br>
@@ -19,7 +19,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0/* From qemu/compiler.h */<br>
-#define QEMU_GNUC_PREREQ(maj, min) 1<br>
=C2=A0#define QEMU_NORETURN __attribute__ ((__noreturn__))<br>
=C2=A0#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))<b=
r>
=C2=A0#define QEMU_SENTINEL __attribute__((sentinel))<br></blockquote><div>=
<br></div><div>ping, thanks <br></div></div><br>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005583ba05b6681a42--

