Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A4C7F4CD8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 17:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638912.995874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qFn-0002lG-7h; Wed, 22 Nov 2023 16:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638912.995874; Wed, 22 Nov 2023 16:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qFn-0002jM-3k; Wed, 22 Nov 2023 16:39:07 +0000
Received: by outflank-mailman (input) for mailman id 638912;
 Wed, 22 Nov 2023 16:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xj/n=HD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r5qFl-0002j0-EY
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 16:39:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4b2daf4-8955-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 17:39:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0A1234EE073C;
 Wed, 22 Nov 2023 17:39:02 +0100 (CET)
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
X-Inumbo-ID: a4b2daf4-8955-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Wed, 22 Nov 2023 17:39:02 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Subject: Re: [PATCH 3/3] xen/MISRA: Remove nonstandard inline keywords
In-Reply-To: <20231122142733.1818331-4-andrew.cooper3@citrix.com>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
 <20231122142733.1818331-4-andrew.cooper3@citrix.com>
Message-ID: <e5476808dbef67bea7ce3902d4d8b3c1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-22 15:27, Andrew Cooper wrote:
> The differences between inline, __inline and __inline__ keywords are a
> vestigial remnant of older C standards, and in Xen we use inline almost
> exclusively.
> 
> Replace __inline and __inline__ with regular inline, and remove their
> exceptions from the MISRA configuration.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> I'm entirely guessing at the Eclair configuration.
> ---

The configuration changes are ok. One observation below.

>  .../eclair_analysis/ECLAIR/toolchain.ecl      |  6 +++---
>  docs/misra/C-language-toolchain.rst           |  2 +-
>  xen/arch/x86/include/asm/apic.h               | 20 +++++++++----------
>  xen/include/acpi/cpufreq/cpufreq.h            |  4 ++--
>  xen/include/xen/bitops.h                      |  4 ++--
>  xen/include/xen/compiler.h                    |  7 +++----
>  6 files changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl 
> b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> index e6cd289b5e92..71a1e2cce029 100644
> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -15,7 +15,7 @@
>      _Static_assert: see Section \"2.1 C Language\" of "GCC_MANUAL".
>      asm, __asm__: see Sections \"6.48 Alternate Keywords\" and \"6.47 
> How to Use Inline Assembly Language in C Code\" of "GCC_MANUAL".
>      __volatile__: see Sections \"6.48 Alternate Keywords\" and 
> \"6.47.2.1 Volatile\" of "GCC_MANUAL".
> -    __const__, __inline__, __inline: see Section \"6.48 Alternate 
> Keywords\" of "GCC_MANUAL".
> +    __const__ : see Section \"6.48 Alternate Keywords\" of 
> "GCC_MANUAL".
>      typeof, __typeof__: see Section \"6.7 Referring to a Type with 
> typeof\" of "GCC_MANUAL".
>      __alignof__, __alignof: see Sections \"6.48 Alternate Keywords\" 
> and \"6.44 Determining the Alignment of Functions, Types or Variables\" 
> of "GCC_MANUAL".
>      __attribute__: see Section \"6.39 Attribute Syntax\" of 
> "GCC_MANUAL".
> @@ -23,8 +23,8 @@
>      __builtin_va_arg: non-documented GCC extension.
>      __builtin_offsetof: see Section \"6.53 Support for offsetof\" of 
> "GCC_MANUAL".
>  "
> --config=STD.tokenext,behavior+={c99, GCC_ARM64, 
> "^(_Static_assert|asm|__asm__|__volatile__|__const__|__inline__|typeof|__typeof__|__alignof__|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
> --config=STD.tokenext,behavior+={c99, GCC_X86_64, 
> "^(_Static_assert|asm|__asm__|__volatile__|__const__|__inline__|__inline|typeof|__typeof__|__alignof__|__alignof|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
> +-config=STD.tokenext,behavior+={c99, GCC_ARM64, 
> "^(_Static_assert|asm|__asm__|__volatile__|__const__|typeof|__typeof__|__alignof__|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
> +-config=STD.tokenext,behavior+={c99, GCC_X86_64, 
> "^(_Static_assert|asm|__asm__|__volatile__|__const__|typeof|__typeof__|__alignof__|__alignof|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
>  -doc_end
> 
>  -doc_begin="Non-documented GCC extension."
> diff --git a/docs/misra/C-language-toolchain.rst 
> b/docs/misra/C-language-toolchain.rst
> index 2866cb191b1a..b7c2000992ac 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -84,7 +84,7 @@ The table columns are as follows:
>            see Sections "6.48 Alternate Keywords" and "6.47 How to Use 
> Inline Assembly Language in C Code" of GCC_MANUAL.
>         __volatile__:
>            see Sections "6.48 Alternate Keywords" and "6.47.2.1 
> Volatile" of GCC_MANUAL.
> -       __const__, __inline__, __inline:
> +       __const__:
>            see Section "6.48 Alternate Keywords" of GCC_MANUAL.
>         typeof, __typeof__:
>            see Section "6.7 Referring to a Type with typeof" of 
> GCC_MANUAL.

> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index 04b8bc18df0e..16d554f2a593 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -20,9 +20,8 @@
>  #define likely(x)     __builtin_expect(!!(x),1)
>  #define unlikely(x)   __builtin_expect(!!(x),0)
> 
> -#define inline        __inline__
> -#define always_inline __inline__ __attribute__ ((__always_inline__))
> -#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
> +#define always_inline inline __attribute__((__always_inline__))
> +#define gnu_inline    inline __attribute__((__gnu_inline__))
>  #define noinline      __attribute__((__noinline__))
> 
>  #define noreturn      __attribute__((__noreturn__))
> @@ -83,7 +82,7 @@
>   * inline functions not expanded inline get placed in .init.text.
>   */
>  #include <xen/init.h>
> -#define __inline__ __inline__ __init
> +#define inline inline __init

The violation of Rule 20.4 (A macro shall not be defined with the same 
name as a keyword) is still present due to this macro.


>  #endif
> 
>  #define __attribute_pure__  __attribute__((__pure__))

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

