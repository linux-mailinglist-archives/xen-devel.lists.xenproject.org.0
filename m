Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D673F712
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 10:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555940.868141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE42n-0006ey-QJ; Tue, 27 Jun 2023 08:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555940.868141; Tue, 27 Jun 2023 08:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE42n-0006ck-Mj; Tue, 27 Jun 2023 08:27:25 +0000
Received: by outflank-mailman (input) for mailman id 555940;
 Tue, 27 Jun 2023 08:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YMkL=CP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qE42m-0006cN-C5
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 08:27:24 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa824c4-14c4-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 10:27:21 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b6a0d91e80so29699631fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 01:27:22 -0700 (PDT)
Received: from [192.168.203.175] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05651c102f00b002b330c8c0fdsm1626507ljm.83.2023.06.27.01.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:27:21 -0700 (PDT)
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
X-Inumbo-ID: 6fa824c4-14c4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687854442; x=1690446442;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pd43LfQ7Fgpi5HWBCdDglO9bwJDKVD+816GelcqXXS4=;
        b=CrUs8INk0bh/p86OG0WIsDffidsf7S5lTLwuYMJnthngJkKtwz3mq6BFO1lkYPTiW3
         eaTH8MYMA1f8JjgkITznvoD+/BDLT6d1nd1P9LWn1fDs/T2ihOP85uonn+JhTCWUhAkS
         vZ6LRNS69XStFKAWsrtCBarJfBLRyxFBfAV6UXNfI6yA4GWdtCK3n8/jPN10m/Fy2mNv
         aB4UToEcijhOnOSaTUqyYMdr0XAccS1DZO+vKaCTb9iByt0GWJhUl2RnPQVlAYMKQmIO
         X/ACCukx48HctYYUzKVi2lSe34BiNOQKGcDy25fOhD7R509sQodT9CUXeeMB7RK+psr9
         exFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854442; x=1690446442;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pd43LfQ7Fgpi5HWBCdDglO9bwJDKVD+816GelcqXXS4=;
        b=Auw+JC5e2iE0FpTDX49BK1cS+WnpLZW06g4TQcPUEaFaWYm59Q5UdQxngmtAArtm+C
         gvm6DmUFC3QWRPw9kZrED8kEMihvWuuSKL3JOBjCO18vTyex9V7IDTv+dMU16N5A6oFZ
         89b3i/lPANcWtnDvK16uZMOO984WDmlU2HatBdfw3Sg/0Jy58Pe15MOE/WeFvbMUYULB
         2wqNU3zIalBYyP8N+St2b+QbG4ZqvOuvG/hHGHjVg8M15hw7vZo3+Pkey5pMJ3nsOE68
         MKQJWmIvVLxoUxvmdFi8K766D+kCDeAixvgHarVO/AqzsOgtX6od4ZQq7z4Ne+k2HXbO
         AgvQ==
X-Gm-Message-State: AC+VfDyL++ZGhIwgh04rHhM0DxR4c909SHO5KZ0zr7DD8NwcRNQ+TTcB
	2JJYFtaF6x2hJKKF/H97qAE=
X-Google-Smtp-Source: ACHHUZ6yPwJgCklCycyWYaJRY0l9HCSWcElLUxyOxWXwKnvng5aaFiL/Qo2yxcA54lKOr8Fm3QImug==
X-Received: by 2002:a2e:8003:0:b0:2b6:a021:7a93 with SMTP id j3-20020a2e8003000000b002b6a0217a93mr3534510ljg.35.1687854441758;
        Tue, 27 Jun 2023 01:27:21 -0700 (PDT)
Message-ID: <dc5343cf8842f1eefd1b191359d812fd1bf8ef7e.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] xen/types: Rework stdint vs __{u,s}$N types
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>,  Timothy Pearson
 <tpearson@raptorengineering.com>, Roberto Bagnara
 <roberto.bagnara@bugseng.com>
Date: Tue, 27 Jun 2023 11:27:20 +0300
In-Reply-To: <20230627075618.1180248-4-andrew.cooper3@citrix.com>
References: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
	 <20230627075618.1180248-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

On Tue, 2023-06-27 at 08:56 +0100, Andrew Cooper wrote:
> Xen uses the stdint types.=C2=A0 Rearrange the types headers to define th=
e
> compatibility __{u,s}$N types in terms of the stdint types, not the
> other way
> around.
>=20
> All all supported compilers on architectures other than x86 support
> the stdint
> __*_TYPE__ macros.=C2=A0 Move these into a new xen/stdint.h to avoid them
> being
> duplicated in each architecture.
>=20
> For the compilers which don't support the __*_TYPE__ macros,
> synthesize
> appropriate alternatives.
>=20
> This cleanup has the side effect of removing all use of the
> undocumented
> __signed__ GCC keyword.=C2=A0 This is a vestigial remnant of `gcc -
> traditional`
> mode for dialetcs of C prior to the introduction of the signed
> keyword.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Timothy Pearson <tpearson@raptorengineering.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
>=20
> v2:
> =C2=A0* Introduce xen/stdint.h as discussed at XenSummit
> ---
> =C2=A0xen/arch/arm/include/asm/types.h=C2=A0=C2=A0 | 19 -----------------
> =C2=A0xen/arch/riscv/include/asm/types.h | 19 -----------------
> =C2=A0xen/arch/x86/include/asm/types.h=C2=A0=C2=A0 | 14 -------------
> =C2=A0xen/include/xen/stdint.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 33
> ++++++++++++++++++++++++++++++
> =C2=A0xen/include/xen/types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++----------
> =C2=A05 files changed, 42 insertions(+), 63 deletions(-)
> =C2=A0create mode 100644 xen/include/xen/stdint.h
>=20
> diff --git a/xen/arch/arm/include/asm/types.h
> b/xen/arch/arm/include/asm/types.h
> index fb6618ef247f..545a5e9d1175 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -1,25 +1,6 @@
> =C2=A0#ifndef __ARM_TYPES_H__
> =C2=A0#define __ARM_TYPES_H__
> =C2=A0
> -typedef __signed__ char __s8;
> -typedef unsigned char __u8;
> -
> -typedef __signed__ short __s16;
> -typedef unsigned short __u16;
> -
> -typedef __signed__ int __s32;
> -typedef unsigned int __u32;
> -
> -#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> -#if defined(CONFIG_ARM_32)
> -typedef __signed__ long long __s64;
> -typedef unsigned long long __u64;
> -#elif defined (CONFIG_ARM_64)
> -typedef __signed__ long __s64;
> -typedef unsigned long __u64;
> -#endif
> -#endif
> -
> =C2=A0typedef signed char s8;
> =C2=A0typedef unsigned char u8;
> =C2=A0
> diff --git a/xen/arch/riscv/include/asm/types.h
> b/xen/arch/riscv/include/asm/types.h
> index 0c0ce78c8f6e..93a680a8f323 100644
> --- a/xen/arch/riscv/include/asm/types.h
> +++ b/xen/arch/riscv/include/asm/types.h
> @@ -1,25 +1,6 @@
> =C2=A0#ifndef __RISCV_TYPES_H__
> =C2=A0#define __RISCV_TYPES_H__
> =C2=A0
> -typedef __signed__ char __s8;
> -typedef unsigned char __u8;
> -
> -typedef __signed__ short __s16;
> -typedef unsigned short __u16;
> -
> -typedef __signed__ int __s32;
> -typedef unsigned int __u32;
> -
> -#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> -#if defined(CONFIG_RISCV_32)
> -typedef __signed__ long long __s64;
> -typedef unsigned long long __u64;
> -#elif defined (CONFIG_RISCV_64)
> -typedef __signed__ long __s64;
> -typedef unsigned long __u64;
> -#endif
> -#endif
> -
> =C2=A0typedef signed char s8;
> =C2=A0typedef unsigned char u8;
> =C2=A0
> diff --git a/xen/arch/x86/include/asm/types.h
> b/xen/arch/x86/include/asm/types.h
> index 2d56aed66782..c9d257716551 100644
> --- a/xen/arch/x86/include/asm/types.h
> +++ b/xen/arch/x86/include/asm/types.h
> @@ -1,20 +1,6 @@
> =C2=A0#ifndef __X86_TYPES_H__
> =C2=A0#define __X86_TYPES_H__
> =C2=A0
> -typedef __signed__ char __s8;
> -typedef unsigned char __u8;
> -
> -typedef __signed__ short __s16;
> -typedef unsigned short __u16;
> -
> -typedef __signed__ int __s32;
> -typedef unsigned int __u32;
> -
> -#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> -typedef __signed__ long __s64;
> -typedef unsigned long __u64;
> -#endif
> -
> =C2=A0typedef signed char s8;
> =C2=A0typedef unsigned char u8;
> =C2=A0
> diff --git a/xen/include/xen/stdint.h b/xen/include/xen/stdint.h
> new file mode 100644
> index 000000000000..4cf82790f196
> --- /dev/null
> +++ b/xen/include/xen/stdint.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_STDINT_H__
> +#define __XEN_STDINT_H__
> +
> +#ifndef __INT8_TYPE__ /* GCC <=3D 4.4 */
> +
> +typedef __INT8_TYPE__=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int8_t;
> +typedef __UINT8_TYPE__=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t;
> +typedef __INT16_TYPE__=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int16_t;
> +typedef __UINT16_TYPE__=C2=A0=C2=A0=C2=A0 uint16_t;
> +typedef __INT32_TYPE__=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int32_t;
> +typedef __UINT32_TYPE__=C2=A0=C2=A0=C2=A0 uint32_t;
> +typedef __INT64_TYPE__=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int64_t;
> +typedef __UINT64_TYPE__=C2=A0=C2=A0=C2=A0 uint64_t;
> +
> +#else
> +
> +/*
> + * Define the types using GCC internal notation.=C2=A0 Clang understands
> this too.
> + *
> https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
> + */
> +typedef=C2=A0=C2=A0 signed __attribute__((__mode__(QI)))=C2=A0=C2=A0=C2=
=A0=C2=A0 int8_t;
> +typedef unsigned __attribute__((__mode__(QI)))=C2=A0=C2=A0=C2=A0 uint8_t=
;
> +typedef=C2=A0=C2=A0 signed __attribute__((__mode__(HI)))=C2=A0=C2=A0=C2=
=A0 int16_t;
> +typedef unsigned __attribute__((__mode__(HI)))=C2=A0=C2=A0 uint16_t;
> +typedef=C2=A0=C2=A0 signed __attribute__((__mode__(SI)))=C2=A0=C2=A0=C2=
=A0 int32_t;
> +typedef unsigned __attribute__((__mode__(SI)))=C2=A0=C2=A0 uint32_t;
> +typedef=C2=A0=C2=A0 signed __attribute__((__mode__(DI)))=C2=A0=C2=A0=C2=
=A0 int64_t;
> +typedef unsigned __attribute__((__mode__(DI)))=C2=A0=C2=A0 uint64_t;
> +
> +#endif
> +
> +#endif /* __XEN_STDINT_H__ */
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index 8b22a02eeaa4..c873c81ccf06 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -2,6 +2,7 @@
> =C2=A0#define __TYPES_H__
> =C2=A0
> =C2=A0#include <xen/stdbool.h>
> +#include <xen/stdint.h>
> =C2=A0
> =C2=A0#include <asm/types.h>
> =C2=A0
> @@ -39,17 +40,14 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> =C2=A0#define LONG_MIN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (-LONG_M=
AX - 1)
> =C2=A0#define ULONG_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (~0UL)
> =C2=A0
> -typedef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t;
> -typedef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __s8=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int8_t;
> -
> -typedef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u16=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t;
> -typedef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __s16=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int16_t;
> -
> -typedef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t;
> -typedef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __s32=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int32_t;
> -
> -typedef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t;
> -typedef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __s64=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int64_t;
> +typedef uint8_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8;
> +typedef int8_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __s=
8;
> +typedef uint16_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u16;
> +typedef int16_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __s16;
> +typedef uint32_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32;
> +typedef int32_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __s32;
> +typedef uint64_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64;
> +typedef int64_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __s64;
> =C2=A0
> =C2=A0typedef __u16 __le16;
> =C2=A0typedef __u16 __be16;


