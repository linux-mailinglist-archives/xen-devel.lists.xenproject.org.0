Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1355B279FE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 09:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082857.1442561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umok8-0000C3-Ar; Fri, 15 Aug 2025 07:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082857.1442561; Fri, 15 Aug 2025 07:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umok8-00009H-62; Fri, 15 Aug 2025 07:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1082857;
 Fri, 15 Aug 2025 07:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZXrH=23=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umok6-00006B-OD
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 07:20:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d5d15e3-79a8-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 09:20:47 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D45BB4EE0742;
 Fri, 15 Aug 2025 09:20:46 +0200 (CEST)
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
X-Inumbo-ID: 5d5d15e3-79a8-11f0-a328-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755242446;
	b=bi6ly0sU3FUisvooVeqp0IYRtW3ev7CjBo6kcDbtEDzFbyI+HZsn2z2SDKyFY+HwoiOG
	 S3tajlBHNyq5MrnmsxBpTjpt142OJc7KX0gTLW6uRzPbSruw9YHQPNqvL7Ag53+wD3Cgv
	 gkiGXT7Dei0y/he5UreK4bA9FXPivyIWZQWJ+bXEwJIsclJ2ttYDldpmGy3CSfIZ33GRB
	 EmjYdFZdEBxUzGYu5V76H5OT/Mmz2vArVWi4RF9S6JZVGYWSbWUdvhT6DYCEvBee2jBrD
	 NBuQXhWxy9tc2W/2L7g5qLll9129VykEqkOv7Er5l1rQU2FCUZQ9g+H8jiXfvV6aofPU/
	 T71zm0JdPAhl4lctr8sgi8hpGbnZ9up5RHxLnSiPv8ux2UoNuc6EeXNrqRsjVD4T6A9e2
	 vvnV1bOqtJGAbNwwrrabCznWmEptKdQNMzs0D6nSSnyrLYwAi6PaoBW/nuulamKWhBAzI
	 1ErnexPBHq3WhSK5J/j9iojMW9S7F4tSOQhbKRiYhyOOiNtdwDHQ/IXa3+TvxWZfTufVu
	 T3iJj8P4Ifcl+skjEQLcjl2SSqSTj6kTKL+KNLFpPhi5EUoriWbtFJhKCqAbzqsVx8fEm
	 nqBi2RdUmcgPecklLdFDEG4OshZCGatcvKZlFQp/Wv2/CFF/Q6ay64/VFZuAblY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755242446;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q7Y7H8c+F1DqZMzbG89vk7tX0P1WIMm2jykyWtYIrdk=;
	b=oP/QNifGXTKsX7FbT/vLpfPgHt38KapDx9pfwYLAzP7jJDa1gry3OEoHw1QpQM+Jfu5J
	 PHf0K91gbIvoM0vQNyT3bP01p+v8jLpZnxUT1u8nlutUCVmV7WZft9IQV3U+ZsKq15zuX
	 +iax53P/BZICjkOF8rnr3EnILJtCloIbtf9IpeTE0hVp0nXuvzHJ82K3xVncpjb2uLoLk
	 9vC0NIWOPJ0Wd/ZEAZf8PlfPA8r+4QCDEUHMbefAH24OyxrGVqp5QQYztz5zL6YFWOQOn
	 DbfepoSTii4/XpL5i+IZbbFqzqRM0e0ykl5OVxhnn6lDUyCQWUV1dglpgNGdv487Vl0y/
	 OV62qHt/Eyy7zcbZqDQ210jsyGlcODpeUhEIdeLiEPphPZJdm93OYOVuc3rGHK+sCt9r3
	 xxe/Fl7Wl2TTP8tBGnvsYmj5QcBmbdt9RlXV/Eb+gA7kk+ATGbxoZYZLEx+ZF38lxnEZP
	 sguEfT5X0LFZRM5iAfeGNoT5XvRNWjUyjjS2uFLUyEGj4JNHbbMtxu6VXUwdBUNROuyGh
	 UiY78leo7HydYWmBaCcXQvL1FdSmZUk5nyyCDusCH15C7DtF1FaqylfZOcvci0Vr1Kyhj
	 EW6Qeq9nHAugVZ1mNf1WsYWEj7gsE1ckAs1PDv1qKDfDy86uJV7zpEluRQouWw4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755242446; bh=gqzTKs7uKnX+aOymgpnk0l7TG5zuKmwONeDcb2YAtHU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b1zVMIYnIC/pQMqAV+Y2Q7+WNEk4podEf1WkY2yag9mfq6fowXAqLmFFIdZgWtbgM
	 FHN3+UbA0UuPRWi3LTVB2KmppYzTNCy0vmPbvwnn+YYnPCmHNe8dEmbku1j/CY3RUU
	 X3MJrqHa/y4Kg3s5VOtr9qMIi9938ggcmss4Syn49YfOsCx/oFPTsCBFrrwpIQdGog
	 xjy4bI0a4VjHCbKRu04EWV34LRC00rL8gDzdLXdjkObTwM8pquF269Qgi5736IcGDZ
	 notydaEo1dgE91Yj2G5MZ5JY9gXIlXhbVyLg1xV9l9uDz4KW4WBvmJEBRf/IC6e+fw
	 ZfqDO52+uVMEg==
MIME-Version: 1.0
Date: Fri, 15 Aug 2025 09:20:46 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH v2] xen: Use auto as per C23
In-Reply-To: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
References: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
Message-ID: <3056ed85948288639110e3cdd6b28c6e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-15 00:25, Andrew Cooper wrote:
> In macros it is common to declare local variables using typeof(param) 
> in order
> to ensure that side effects are only evaluated once.  A consequence of 
> this is
> double textural expansion of the parameter, which can get out of hand 
> very
> quickly with nested macros.
> 
> In C23, the auto keyword has been repurposed to perform type inference.
> 
> A GCC extension, __auto_type, is now avaialble in the new toolchain 
> baseline
> and avoids the double textural expansion.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

with a nit below:

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
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
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1985289434
> ---
>  automation/eclair_analysis/ECLAIR/toolchain.ecl | 11 +++++++++--
>  docs/misra/C-language-toolchain.rst             |  2 ++
>  xen/include/xen/compiler.h                      | 14 ++++++++++++++
>  xen/include/xen/macros.h                        | 14 +++++++-------
>  4 files changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl 
> b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> index 842f8377e561..125f99a06583 100644
> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -15,6 +15,7 @@
>      __alignof__, __alignof: see Sections \"6.48 Alternate Keywords\" 
> and \"6.44 Determining the Alignment of Functions, Types or Variables\" 
> of "GCC_MANUAL".
>      asm, __asm__: see Sections \"6.48 Alternate Keywords\" and \"6.47 
> How to Use Inline Assembly Language in C Code\" of "GCC_MANUAL".
>      __attribute__: see Section \"6.39 Attribute Syntax\" of 
> "GCC_MANUAL".
> +    __auto_type: see Section \"6.7 Referring to a Type with typeof\" 
> of "GCC_MANUAL".
>      __builtin_offsetof: see Section \"6.53 Support for offsetof\" of 
> "GCC_MANUAL".
>      __builtin_types_compatible_p: see Section \"6.59 Other Built-in 
> Functions Provided by GCC\" of "GCC_MANUAL".
>      __builtin_va_arg: non-documented GCC extension.
> @@ -26,6 +27,7 @@
>  -name_selector+={alignof, "^(__alignof__|__alignof)$"}
>  -name_selector+={asm, "^(__asm__|asm)$"}
>  -name_selector+={attribute, "^__attribute__$"}
> +-name_selector+={auto_type, "^__auto_type$"}
>  -name_selector+={builtin_offsetof, "^__builtin_offsetof$"}
>  -name_selector+={builtin_types_p, "^__builtin_types_compatible_p$"}
>  -name_selector+={builtin_va_arg, "^__builtin_va_arg$"}
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
>  -doc_begin="
> +    ext_auto_type: see Section \"6.7 Referring to a Type with typeof\" 
> of "GCC_MANUAL".
>      ext_c_missing_varargs_arg: see Section \"6.21 Macros with a 
> Variable Number of Arguments\" of "GCC_MANUAL".
>      ext_enum_value_not_int: non-documented GCC extension.
>      ext_flexible_array_in_array: see Section \"6.18 Arrays of Length 
> Zero\" of "GCC_MANUAL".
> @@ -126,6 +130,7 @@ volatile"
>      ext_return_has_void_expr: see the documentation for -Wreturn-type 
> in Section \"3.8 Options to Request or Suppress Warnings\" of 
> "GCC_MANUAL".
>      ext_sizeof_alignof_void_type: see Section \"6.24 Arithmetic on 
> void- and Function-Pointers\" of "GCC_MANUAL".
>  "
> +-name_selector+={ext_auto_type, "^ext_auto_type$"}
>  -name_selector+={ext_c_missing_varargs_arg, 
> "^ext_c_missing_varargs_arg$"}
>  -name_selector+={ext_enum_value_not_int, "^ext_enum_value_not_int$"}
>  -name_selector+={ext_flexible_array_in_array, 
> "^ext_flexible_array_in_array$"}
> @@ -139,7 +144,8 @@ volatile"
>  -name_selector+={ext_sizeof_alignof_void_type, 
> "^ext_sizeof_alignof_void_type$"}
> 
>  -config=STD.diag,behavior+={c99,GCC_ARM64,
> -"ext_c_missing_varargs_arg||
> +"ext_auto_type||
> +ext_c_missing_varargs_arg||
>  ext_forward_ref_enum_def||
>  ext_gnu_array_range||
>  ext_gnu_statement_expr_macro||
> @@ -149,7 +155,8 @@ ext_return_has_void_expr||
>  ext_sizeof_alignof_void_type"
>  }
>  -config=STD.diag,behavior+={c99,GCC_X86_64,
> -"ext_c_missing_varargs_arg||
> +"ext_auto_type||
> +ext_c_missing_varargs_arg||
>  ext_enum_value_not_int||
>  ext_flexible_array_in_array||
>  ext_flexible_array_in_struct||
> diff --git a/docs/misra/C-language-toolchain.rst 
> b/docs/misra/C-language-toolchain.rst
> index cb81f5c09872..635936004554 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -94,6 +94,8 @@ The table columns are as follows:
>            see Sections "6.48 Alternate Keywords" and "6.44 Determining 
> the Alignment of Functions, Types or Variables" of GCC_MANUAL.
>         __attribute__:
>            see Section "6.39 Attribute Syntax" of GCC_MANUAL.
> +       __auto_type:
> +          see Section "6.7 Referring to a Type with typeof" of 
> GCC_MANUAL.
>         __builtin_types_compatible_p:
>            see Section "6.59 Other Built-in Functions Provided by GCC" 
> of GCC_MANUAL.
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
> + * In C23, the auto keyword has been repurposed to perform type 
> inference.
> + *
> + * This behaviour is available via the __auto_type extension in 
> supported
> + * toolchains.
> + *
> + * 
> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
> + * https://clang.llvm.org/docs/LanguageExtensions.html#auto-type
> + */
> +#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
> +/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23 meaning. 
> */
> +#define auto __auto_type
> +#endif
> +

A more detailed explanation should live in deviations.rst under this 
bullet point

    * - R20.4
      - The override of the keyword \"inline\" in xen/compiler.h is 
present so
        that section contents checks pass when the compiler chooses not 
to
        inline a particular function.
      - Comment-based deviation.

as described in the SAF entry:

         {
             "id": "SAF-3-safe",
             "analyser": {
                 "eclair": "MC3A2.R20.4"
             },
             "name": "MC3A2.R20.4: allow the definition of a macro with 
the same name as a keyword in some special cases",
             "text": "The definition of a macro with the same name as a 
keyword can be useful in certain configurations to improve the 
guarantees that can be provided by Xen. See docs/misra/deviations.rst 
for a precise rationale for all such cases."
         },


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
> -        typeof(x) _x = (x);                     \
> +        auto _x = (x);                          \
>          asm volatile ( "" : "+r" (_x) );        \
>          _x;                                     \
>      })
> 
>  #define ABS(x) ({                              \
> -    typeof(x) x_ = (x);                        \
> +    auto x_ = (x);                             \
>      (x_ < 0) ? -x_ : x_;                       \
>  })
> 
>  #define SWAP(a, b) \
> -   do { typeof(a) t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
> +   do { auto t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
> 
>  #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + 
> __must_be_array(x))
> 
> @@ -102,15 +102,15 @@
>   */
>  #define min(x, y)                               \
>      ({                                          \
> -        const typeof(x) _x = (x);               \
> -        const typeof(y) _y = (y);               \
> +        const auto _x = (x);                    \
> +        const auto _y = (y);                    \
>          (void)(&_x == &_y); /* typecheck */     \
>          _x < _y ? _x : _y;                      \
>      })
>  #define max(x, y)                               \
>      ({                                          \
> -        const typeof(x) _x = (x);               \
> -        const typeof(y) _y = (y);               \
> +        const auto _x = (x);                    \
> +        const auto _y = (y);                    \
>          (void)(&_x == &_y); /* typecheck */     \
>          _x > _y ? _x : _y;                      \
>      })
> 
> base-commit: b2c0dc44b37516b758c38de04c61ad295ac0dff2

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

