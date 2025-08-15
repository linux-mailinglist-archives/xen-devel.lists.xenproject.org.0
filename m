Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E78B27F46
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 13:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083330.1442960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umsjC-0002pe-O7; Fri, 15 Aug 2025 11:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083330.1442960; Fri, 15 Aug 2025 11:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umsjC-0002mY-Ku; Fri, 15 Aug 2025 11:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1083330;
 Fri, 15 Aug 2025 11:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDBg=23=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1umsjB-0002mS-PE
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 11:36:09 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078cd27f-79cc-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 13:36:06 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-61bd4ba9fafso597672eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 04:36:06 -0700 (PDT)
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
X-Inumbo-ID: 078cd27f-79cc-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755257765; x=1755862565; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88s+LwtH5M8MvWXP+YQs20eZKOWUrlWO3DOfhaSJxSo=;
        b=B/aSC5AlJK4gUafsPd6bD5T8BvUdmGLHCQwil4cX18RhKaBga2RH3+saW6VitBchwh
         tF3i3r9itpAOWoiPAotFKEa0RGa7QCwfoIfQME3nA47UejF4Jo1cI2wc2dCg2UQ+0SZK
         X+3Yq3L3VjbMqI4voKx6JMRWPvcViDSbeZYnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755257765; x=1755862565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88s+LwtH5M8MvWXP+YQs20eZKOWUrlWO3DOfhaSJxSo=;
        b=SyIaZXSOeMAp060k/0mFJUdMo/oF1dUXFGnNIy6eHOO0X9s0KjWup9m1ckWl9MgTls
         OIPRaeKINiYics5fPvFJBMn24dZNIDdXbPPYZO7c5obk2YlTu58kmcQxRso5UmNYkh9p
         4cMv2EEvEID/mtbpZ5XB8PEltSkl6VAKYiocqpwCDIzF9xilPJuSzEHTbJXYjRga0Y9L
         5gHkPn6l3zFQFYC4laVSGfG1lWLgx7XTA2ty7HimLdGDl1zhmBlotwFj9y/qHgmnbl15
         O+Ywrm7JZCCtJEjgbnmNsl4iJkBN907UXYw5m9cxZiyb2fCibTCoLC3OYC4bD+mI0UVA
         aSyQ==
X-Gm-Message-State: AOJu0YwvQs5Jo1qkrPGxRnOEhnXMug9fl7iOoW1uIa8bbfS4WqzKA5aw
	6K/pMibjHnihbhHPZ6qk1Uz5r8yxmSp3libwLUbfOmeWb6AuH3SK7DDgVJQnCMKFCEPSOWgrza7
	zMqShhuQDaLCmahHzA7wc5YX/PHyBKsf/2dLcYWrJCA==
X-Gm-Gg: ASbGncsB0mVvjIG2eKnXUWh4YKDN7aB2ILrsLOzETrRUmlPUDha1bqVviTj4569ZV5H
	Gwb1O3n2DzCHXfYsI5X7nAtP5lbL0Vn/1mvedSws0wL0dJKPZ89qS6UbvX72HOogwtP9hspMFRZ
	GDuwQ8893TBHEsgWXZzZp8GscZ/hdgeBBo1TIoZaFyGHmT+rAr09Qg4+wyI2kyWwhJgqVkISvuA
	oNLYRI=
X-Google-Smtp-Source: AGHT+IEuoINvLaaUyfbos5t52MXcUB7aOp+Pe5YN7OAe7VOwYXMmTVg9v+DTOZG6pY4XLullwHxxPzEq8QTyoMk6Aus=
X-Received: by 2002:a05:6820:228d:b0:61b:d93c:eb30 with SMTP id
 006d021491bc7-61beac2af48mr1006698eaf.7.1755257765144; Fri, 15 Aug 2025
 04:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 15 Aug 2025 12:35:54 +0100
X-Gm-Features: Ac12FXzeqTLRUVPyFsJhJ7p1Y3OIqvB6iO0MHD6jYJtqRE7ObzkwnvR7CChn8ik
Message-ID: <CACHz=ZhFgyy4GoZEge1wJahdq=F8bSiU+dNubqEMj6n_Myzydg@mail.gmail.com>
Subject: Re: [PATCH v2] xen: Use auto as per C23
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 11:25=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> In macros it is common to declare local variables using typeof(param) in =
order
> to ensure that side effects are only evaluated once.  A consequence of th=
is is
> double textural expansion of the parameter, which can get out of hand ver=
y
> quickly with nested macros.
>
> In C23, the auto keyword has been repurposed to perform type inference.
>
> A GCC extension, __auto_type, is now avaialble in the new toolchain basel=
ine
> and avoids the double textural expansion.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
>
> The resulting build is identical.
>
> v2:
>  * Use auto directly
>  * Eclair configuration
>
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/198528943=
4
> ---
>  automation/eclair_analysis/ECLAIR/toolchain.ecl | 11 +++++++++--
>  docs/misra/C-language-toolchain.rst             |  2 ++
>  xen/include/xen/compiler.h                      | 14 ++++++++++++++
>  xen/include/xen/macros.h                        | 14 +++++++-------
>  4 files changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation=
/eclair_analysis/ECLAIR/toolchain.ecl
> index 842f8377e561..125f99a06583 100644
> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -15,6 +15,7 @@
>      __alignof__, __alignof: see Sections \"6.48 Alternate Keywords\" and=
 \"6.44 Determining the Alignment of Functions, Types or Variables\" of "GC=
C_MANUAL".
>      asm, __asm__: see Sections \"6.48 Alternate Keywords\" and \"6.47 Ho=
w to Use Inline Assembly Language in C Code\" of "GCC_MANUAL".
>      __attribute__: see Section \"6.39 Attribute Syntax\" of "GCC_MANUAL"=
.
> +    __auto_type: see Section \"6.7 Referring to a Type with typeof\" of =
"GCC_MANUAL".
>      __builtin_offsetof: see Section \"6.53 Support for offsetof\" of "GC=
C_MANUAL".
>      __builtin_types_compatible_p: see Section \"6.59 Other Built-in Func=
tions Provided by GCC\" of "GCC_MANUAL".
>      __builtin_va_arg: non-documented GCC extension.
> @@ -26,6 +27,7 @@
>  -name_selector+=3D{alignof, "^(__alignof__|__alignof)$"}
>  -name_selector+=3D{asm, "^(__asm__|asm)$"}
>  -name_selector+=3D{attribute, "^__attribute__$"}
> +-name_selector+=3D{auto_type, "^__auto_type$"}
>  -name_selector+=3D{builtin_offsetof, "^__builtin_offsetof$"}
>  -name_selector+=3D{builtin_types_p, "^__builtin_types_compatible_p$"}
>  -name_selector+=3D{builtin_va_arg, "^__builtin_va_arg$"}
> @@ -39,6 +41,7 @@
>  "alignof||
>  asm||
>  attribute||
> +auto_type||
>  builtin_offsetof||
>  builtin_types_p||
>  builtin_va_arg||
> @@ -114,6 +117,7 @@ volatile"
>  -doc_end
>
>  -doc_begin=3D"
> +    ext_auto_type: see Section \"6.7 Referring to a Type with typeof\" o=
f "GCC_MANUAL".
>      ext_c_missing_varargs_arg: see Section \"6.21 Macros with a Variable=
 Number of Arguments\" of "GCC_MANUAL".
>      ext_enum_value_not_int: non-documented GCC extension.
>      ext_flexible_array_in_array: see Section \"6.18 Arrays of Length Zer=
o\" of "GCC_MANUAL".
> @@ -126,6 +130,7 @@ volatile"
>      ext_return_has_void_expr: see the documentation for -Wreturn-type in=
 Section \"3.8 Options to Request or Suppress Warnings\" of "GCC_MANUAL".
>      ext_sizeof_alignof_void_type: see Section \"6.24 Arithmetic on void-=
 and Function-Pointers\" of "GCC_MANUAL".
>  "
> +-name_selector+=3D{ext_auto_type, "^ext_auto_type$"}
>  -name_selector+=3D{ext_c_missing_varargs_arg, "^ext_c_missing_varargs_ar=
g$"}
>  -name_selector+=3D{ext_enum_value_not_int, "^ext_enum_value_not_int$"}
>  -name_selector+=3D{ext_flexible_array_in_array, "^ext_flexible_array_in_=
array$"}
> @@ -139,7 +144,8 @@ volatile"
>  -name_selector+=3D{ext_sizeof_alignof_void_type, "^ext_sizeof_alignof_vo=
id_type$"}
>
>  -config=3DSTD.diag,behavior+=3D{c99,GCC_ARM64,
> -"ext_c_missing_varargs_arg||
> +"ext_auto_type||
> +ext_c_missing_varargs_arg||
>  ext_forward_ref_enum_def||
>  ext_gnu_array_range||
>  ext_gnu_statement_expr_macro||
> @@ -149,7 +155,8 @@ ext_return_has_void_expr||
>  ext_sizeof_alignof_void_type"
>  }
>  -config=3DSTD.diag,behavior+=3D{c99,GCC_X86_64,
> -"ext_c_missing_varargs_arg||
> +"ext_auto_type||
> +ext_c_missing_varargs_arg||
>  ext_enum_value_not_int||
>  ext_flexible_array_in_array||
>  ext_flexible_array_in_struct||
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-=
toolchain.rst
> index cb81f5c09872..635936004554 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -94,6 +94,8 @@ The table columns are as follows:
>            see Sections "6.48 Alternate Keywords" and "6.44 Determining t=
he Alignment of Functions, Types or Variables" of GCC_MANUAL.
>         __attribute__:
>            see Section "6.39 Attribute Syntax" of GCC_MANUAL.
> +       __auto_type:
> +          see Section "6.7 Referring to a Type with typeof" of GCC_MANUA=
L.
>         __builtin_types_compatible_p:
>            see Section "6.59 Other Built-in Functions Provided by GCC" of=
 GCC_MANUAL.
>         __builtin_va_arg:
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index 88bf26bc5109..38ef5d82ad95 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -64,6 +64,20 @@
>  # define asm_inline asm
>  #endif
>
> +/*
> + * In C23, the auto keyword has been repurposed to perform type inferenc=
e.
> + *
> + * This behaviour is available via the __auto_type extension in supporte=
d
> + * toolchains.
> + *
> + * https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Ty=
pe.html
> + * https://clang.llvm.org/docs/LanguageExtensions.html#auto-type
> + */
> +#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
> +/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23 meaning. */
> +#define auto __auto_type
> +#endif
> +
>  /*
>   * Add the pseudo keyword 'fallthrough' so case statement blocks
>   * must end with any of these keywords:
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index f9ccde86fb23..ceca2e4a1bf1 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -63,18 +63,18 @@
>  /* Hide a value from the optimiser. */
>  #define HIDE(x)                                 \
>      ({                                          \
> -        typeof(x) _x =3D (x);                     \
> +        auto _x =3D (x);                          \
>          asm volatile ( "" : "+r" (_x) );        \
>          _x;                                     \
>      })
>
>  #define ABS(x) ({                              \
> -    typeof(x) x_ =3D (x);                        \
> +    auto x_ =3D (x);                             \
>      (x_ < 0) ? -x_ : x_;                       \
>  })
>
>  #define SWAP(a, b) \
> -   do { typeof(a) t_ =3D (a); (a) =3D (b); (b) =3D t_; } while ( 0 )
> +   do { auto t_ =3D (a); (a) =3D (b); (b) =3D t_; } while ( 0 )
>
>  #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
>
> @@ -102,15 +102,15 @@
>   */
>  #define min(x, y)                               \
>      ({                                          \
> -        const typeof(x) _x =3D (x);               \
> -        const typeof(y) _y =3D (y);               \
> +        const auto _x =3D (x);                    \
> +        const auto _y =3D (y);                    \
>          (void)(&_x =3D=3D &_y); /* typecheck */     \
>          _x < _y ? _x : _y;                      \
>      })
>  #define max(x, y)                               \
>      ({                                          \
> -        const typeof(x) _x =3D (x);               \
> -        const typeof(y) _y =3D (y);               \
> +        const auto _x =3D (x);                    \
> +        const auto _y =3D (y);                    \
>          (void)(&_x =3D=3D &_y); /* typecheck */     \
>          _x > _y ? _x : _y;                      \
>      })
>
> base-commit: b2c0dc44b37516b758c38de04c61ad295ac0dff2

Thanks for the change, nice to have it.

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

