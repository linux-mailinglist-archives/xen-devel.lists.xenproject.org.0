Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A89B73942F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 02:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553234.863674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC8dY-0002mK-RA; Thu, 22 Jun 2023 00:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553234.863674; Thu, 22 Jun 2023 00:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC8dY-0002jN-NZ; Thu, 22 Jun 2023 00:57:24 +0000
Received: by outflank-mailman (input) for mailman id 553234;
 Thu, 22 Jun 2023 00:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kw6x=CK=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qC8dX-0002jH-Sw
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 00:57:23 +0000
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [2607:f8b0:4864:20::a36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bec14c24-1097-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 02:57:22 +0200 (CEST)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4716726b741so1509288e0c.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 17:57:22 -0700 (PDT)
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
X-Inumbo-ID: bec14c24-1097-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687395441; x=1689987441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bvGp+R6T4HMH65iifbzdZE6TTiz8VV7935CnlGgRYQ=;
        b=AVWRYJbDE4k/NcHmq3eykBjOocRGPlP0PmOXtKT/rc+y41Ldw8z6JK6CWunLU3o0Jo
         FsMZkl3opjzIXTlP9QWEg/xFuEZZx4hLeYyRmidsdlrRPqifj6Tgg/cJeI1n4z3IjNv7
         lRuQkXYNr5HDLDcNICpoSYI0v1fezlBHP6nBGEgDg+PcXjAs3D72Zc7saGFhn3/8h3DT
         UgXGlY07AJzFh/ZxW0+TJecVCB7WNHCHX8C+irJb9Z+AMcQrNaEvhpAmllivDlWjVxQW
         zf01oyTpidViguHvHWX/rkT+7bz7k2yFugG2rWcJBVhdbDclz28BbNyz0Cgm0zSzPFhv
         jsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687395441; x=1689987441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bvGp+R6T4HMH65iifbzdZE6TTiz8VV7935CnlGgRYQ=;
        b=QZcZG7INfWx61KCU//y2YBrLImDxzXGvS2/pVR2jWVJPWOX/RggctGLJ6y+z56Xue5
         6aL4nx6D01usTWPUxnnUmr1CW9hc9QeSG+viyFnnCmR9uZDQ59E6yr8CLFSydpVZlcUx
         lis+CYIwcmPX76GQbbwrBdd2piRcjgd2X5kwEe9fo352ZADprBtwLaEE53qjkdLWGSSr
         8dqXoOyV45jjlPLfDigd2lbb1SQ2pHp+mso0QOjyGnzv3c4eWFuIcU8rZF5DZ0IEIPWp
         wzNXpLnKYmXeSqIIyEkzAtkUR0F6C/zf/Hp+o5+8H5QH7nZPNQD+KpemS2ec/GvdU+sN
         q5Ww==
X-Gm-Message-State: AC+VfDz5wUzUKJxwXuVG/3W/8J37Vwky25xolih6SfvHSOSquRPkNFRU
	Ryakbj/el4pKKsj4b+loAKxpK8n0j/PsQcA/yyo=
X-Google-Smtp-Source: ACHHUZ6C8O2zy2KKTOBghTBSTtnFrZ0jg6Xw9ApyCIPUNn8ox/ycavwKWcJrTcgG8qnvOEY0+brCelLnJB7a3qTEQsc=
X-Received: by 2002:a1f:e406:0:b0:471:348a:7b8d with SMTP id
 b6-20020a1fe406000000b00471348a7b8dmr4908448vkh.8.1687395441592; Wed, 21 Jun
 2023 17:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230621211200.4132989-1-andrew.cooper3@citrix.com> <20230621211200.4132989-3-andrew.cooper3@citrix.com>
In-Reply-To: <20230621211200.4132989-3-andrew.cooper3@citrix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 10:56:55 +1000
Message-ID: <CAKmqyKO-Cz+0b8RzF=Youy42bHXuzeQdvHvHcs8LE=E-N4CTVA@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/types: Rework stdint vs __{u,s}$N types
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Timothy Pearson <tpearson@raptorengineering.com>, 
	Roberto Bagnara <roberto.bagnara@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 7:12=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Xen uses the stdint types.  Rearrange the types headers to define the
> compatibility __{u,s}$N types in terms of the stdint types, not the other=
 way
> around.
>
> All all supported compilers on architectures other than x86 support the s=
tdint
> __*_TYPE__ macros.  Move these into the common types.h to avoid them bein=
g
> duplicated in each architecture.
>
> For x86 on obsolete compilers, synthesize appropriate types.
>
> This cleanup has the side effect of removing all use of the undocumented
> __signed__ GCC keyword.  This is a vestigial remnant of `gcc -traditional=
`
> mode for dialetcs of C prior to the introduction of the signed keyword.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
>
> I've left the non __ types alone for now.  They're complicated mostly by =
ARM
> having differing ideas of what a paddr_t is.
>
> A different option would be to sort out the stdint types ahead of includi=
ng
> <asm/types.h>, which can either be done by introducing a <asm/stdint.h> o=
r
> upping the minimum compiler version for x86; a task which is massively
> overdue.
> ---
>  xen/arch/arm/include/asm/types.h   | 19 -------------------
>  xen/arch/riscv/include/asm/types.h | 19 -------------------
>  xen/arch/x86/include/asm/types.h   | 21 +++++++++------------
>  xen/include/xen/types.h            | 28 +++++++++++++++++-----------
>  4 files changed, 26 insertions(+), 61 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/=
types.h
> index fb6618ef247f..545a5e9d1175 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -1,25 +1,6 @@
>  #ifndef __ARM_TYPES_H__
>  #define __ARM_TYPES_H__
>
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
>  typedef signed char s8;
>  typedef unsigned char u8;
>
> diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/=
asm/types.h
> index 0c0ce78c8f6e..93a680a8f323 100644
> --- a/xen/arch/riscv/include/asm/types.h
> +++ b/xen/arch/riscv/include/asm/types.h
> @@ -1,25 +1,6 @@
>  #ifndef __RISCV_TYPES_H__
>  #define __RISCV_TYPES_H__
>
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
>  typedef signed char s8;
>  typedef unsigned char u8;
>
> diff --git a/xen/arch/x86/include/asm/types.h b/xen/arch/x86/include/asm/=
types.h
> index 2d56aed66782..a5d4f6e9587a 100644
> --- a/xen/arch/x86/include/asm/types.h
> +++ b/xen/arch/x86/include/asm/types.h
> @@ -1,18 +1,15 @@
>  #ifndef __X86_TYPES_H__
>  #define __X86_TYPES_H__
>
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
> +#ifndef __INT8_TYPE__ /* GCC <=3D 4.4 */
> +# define __INT8_TYPE__     signed  char
> +# define __UINT8_TYPE__  unsigned  char
> +# define __INT16_TYPE__           short
> +# define __UINT16_TYPE__ unsigned short
> +# define __INT32_TYPE__             int
> +# define __UINT32_TYPE__ unsigned   int
> +# define __INT64_TYPE__            long
> +# define __UINT64_TYPE__ unsigned  long
>  #endif
>
>  typedef signed char s8;
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index 8b22a02eeaa4..4083f1bf18b0 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -11,6 +11,15 @@ typedef signed long ssize_t;
>
>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
>
> +typedef __INT8_TYPE__        int8_t;
> +typedef __UINT8_TYPE__      uint8_t;
> +typedef __INT16_TYPE__      int16_t;
> +typedef __UINT16_TYPE__    uint16_t;
> +typedef __INT32_TYPE__      int32_t;
> +typedef __UINT32_TYPE__    uint32_t;
> +typedef __INT64_TYPE__      int64_t;
> +typedef __UINT64_TYPE__    uint64_t;
> +
>  #define BITS_TO_LONGS(bits) \
>      (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>  #define DECLARE_BITMAP(name,bits) \
> @@ -39,17 +48,14 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
>  #define LONG_MIN        (-LONG_MAX - 1)
>  #define ULONG_MAX       (~0UL)
>
> -typedef         __u8            uint8_t;
> -typedef         __s8            int8_t;
> -
> -typedef         __u16           uint16_t;
> -typedef         __s16           int16_t;
> -
> -typedef         __u32           uint32_t;
> -typedef         __s32           int32_t;
> -
> -typedef         __u64           uint64_t;
> -typedef         __s64           int64_t;
> +typedef uint8_t         __u8;
> +typedef int8_t          __s8;
> +typedef uint16_t        __u16;
> +typedef int16_t         __s16;
> +typedef uint32_t        __u32;
> +typedef int32_t         __s32;
> +typedef uint64_t        __u64;
> +typedef int64_t         __s64;
>
>  typedef __u16 __le16;
>  typedef __u16 __be16;
> --
> 2.30.2
>
>

