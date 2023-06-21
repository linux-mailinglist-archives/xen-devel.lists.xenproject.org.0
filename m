Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811C73910F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 22:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553137.863521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC4kU-0002wk-Ay; Wed, 21 Jun 2023 20:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553137.863521; Wed, 21 Jun 2023 20:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC4kU-0002tW-7f; Wed, 21 Jun 2023 20:48:18 +0000
Received: by outflank-mailman (input) for mailman id 553137;
 Wed, 21 Jun 2023 20:48:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qC4kT-0002tQ-8W
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 20:48:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qC4kS-0002Ek-O5; Wed, 21 Jun 2023 20:48:16 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qC4kS-0000o9-GR; Wed, 21 Jun 2023 20:48:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=FZDuBlidfWs/iNigJ8yU+5e9gtFkAe0KGyvRMsg5l6M=; b=NBDgbAhAs1UCoNydFrIqH6yOnv
	TyDD5+x4b/eXkmFMXha0cNHEGiTb//Myj+Gva5kjTWz5OfCIztNXD2zfBRytu4nte09PUZnkGIiuA
	ya/uOh2IBTxfjiV1dXEWyj6YK/Yzwa37HmfK0s0051FCyKaWRlFPq+uBlwh8LFGDnNfQ=;
Message-ID: <4fc1fcee-e210-fe16-f762-3f23700d51b9@xen.org>
Date: Wed, 21 Jun 2023 21:48:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
 Shawn Anastasio <shawnanastasio@raptorengineering.com>
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
In-Reply-To: <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

Below some remark about the coding style. I will try to spot all of them 
so please go through your code and check if my comments applies in other 
places.

On 21/06/2023 17:59, Shawn Anastasio wrote:
> On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
> including an early serial console are provided by Open Firmware.
> Implement the required interfaces to call into Open Firmware and write
> to the serial console.
> 
> Since Open Firmware runs in 32-bit Big Endian mode and Xen runs in
> 64-bit Little Endian mode, a thunk is required to save/restore
> any potentially-clobbered registers as well as to perform the
> required endianness switch. Thankfully, linux already has such
> a routine, which was imported into ppc64/of-call.S.
> 
> Support for bare metal (PowerNV) will be implemented in a future
> patch.
> 
> Signed-off-by: Shawn Anastasio <shawnanastasio@raptorengineering.com>
> ---
>   xen/arch/ppc/Kconfig.debug              |   5 +
>   xen/arch/ppc/Makefile                   |   3 +
>   xen/arch/ppc/boot-of.c                  | 116 +++++++++++++
>   xen/arch/ppc/configs/ppc64_defconfig    |   1 +
>   xen/arch/ppc/early_printk.c             |  28 +++
>   xen/arch/ppc/include/asm/boot.h         |  24 +++
>   xen/arch/ppc/include/asm/bug.h          |   6 +
>   xen/arch/ppc/include/asm/byteorder.h    |  37 ++++
>   xen/arch/ppc/include/asm/cache.h        |   6 +
>   xen/arch/ppc/include/asm/early_printk.h |  15 ++
>   xen/arch/ppc/include/asm/msr.h          |  67 ++++++++
>   xen/arch/ppc/include/asm/processor.h    | 207 ++++++++++++++++++++++
>   xen/arch/ppc/include/asm/reg_defs.h     | 218 ++++++++++++++++++++++++
>   xen/arch/ppc/include/asm/string.h       |   6 +
>   xen/arch/ppc/include/asm/types.h        |  35 ++++
>   xen/arch/ppc/ppc64/Makefile             |   1 +
>   xen/arch/ppc/ppc64/asm-offsets.c        |  55 ++++++
>   xen/arch/ppc/ppc64/head.S               |  48 +++---
>   xen/arch/ppc/ppc64/of-call.S            |  85 +++++++++
>   xen/arch/ppc/setup.c                    |  31 ++++
>   20 files changed, 972 insertions(+), 22 deletions(-)
>   create mode 100644 xen/arch/ppc/boot-of.c
>   create mode 100644 xen/arch/ppc/early_printk.c
>   create mode 100644 xen/arch/ppc/include/asm/boot.h
>   create mode 100644 xen/arch/ppc/include/asm/bug.h
>   create mode 100644 xen/arch/ppc/include/asm/byteorder.h
>   create mode 100644 xen/arch/ppc/include/asm/cache.h
>   create mode 100644 xen/arch/ppc/include/asm/early_printk.h
>   create mode 100644 xen/arch/ppc/include/asm/msr.h
>   create mode 100644 xen/arch/ppc/include/asm/processor.h
>   create mode 100644 xen/arch/ppc/include/asm/reg_defs.h
>   create mode 100644 xen/arch/ppc/include/asm/string.h
>   create mode 100644 xen/arch/ppc/include/asm/types.h
>   create mode 100644 xen/arch/ppc/ppc64/of-call.S
>   create mode 100644 xen/arch/ppc/setup.c
> 
> diff --git a/xen/arch/ppc/Kconfig.debug b/xen/arch/ppc/Kconfig.debug
> index e69de29bb2..608c9ff832 100644
> --- a/xen/arch/ppc/Kconfig.debug
> +++ b/xen/arch/ppc/Kconfig.debug
> @@ -0,0 +1,5 @@
> +config EARLY_PRINTK
> +    bool "Enable early printk"
> +    default DEBUG
> +    help
> +      Enables early printk debug messages
> diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
> index 98220648af..4c4cdcb60e 100644
> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -1,4 +1,7 @@
>   obj-$(CONFIG_PPC64) += ppc64/
> +obj-y += setup.o
> +obj-y += boot-of.o
> +obj-$(CONFIG_EARLY_PRINTK) += early_printk.o

We commonly order the file alphabetically. So setup.o should be last.

>   
>   $(TARGET): $(TARGET)-syms
>   	cp -f $< $@
> diff --git a/xen/arch/ppc/boot-of.c b/xen/arch/ppc/boot-of.c
> new file mode 100644
> index 0000000000..1ceeaf1250
> --- /dev/null
> +++ b/xen/arch/ppc/boot-of.c
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

As you already have the SPDX license, the full license should be dropped.

> + *
> + * Copyright IBM Corp. 2005, 2006, 2007
> + * Copyright Raptor Engineering, LLC
> + *
> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
> + *          Hollis Blanchard <hollisb@us.ibm.com>
> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
> + */
> +
> +#include <xen/lib.h>
> +#include <asm/boot.h>
> +#include <asm/byteorder.h>
> +#include <asm/early_printk.h>
> +
> +#define ADDR(x) (uint32_t)(unsigned long)(x)
> +
> +/* OF entrypoint*/
> +static unsigned long of_vec;
> +
> +/* OF device handles*/
> +static int bof_chosen;
> +static int of_out;
> +
> +static int of_call(const char *service, uint32_t nargs, uint32_t nrets,
> +                   int32_t rets[], ...)
> +{
> +    int rc;
> +    va_list args;
> +    int i;
> +    struct of_service s = { 0 };
> +
> +    s.ofs_service = cpu_to_be32(ADDR(service));
> +    s.ofs_nargs = cpu_to_be32(nargs);
> +    s.ofs_nrets = cpu_to_be32(nrets);
> +
> +    /* copy all the params into the args array */
> +    va_start(args, rets);
> +
> +    for ( i = 0; i < nargs; i++ )
> +    {

We don't add {} for a single line.

> +        s.ofs_args[i] = cpu_to_be32(va_arg(args, uint32_t));
> +    }
> +
> +    va_end(args);
> +
> +    rc = enter_of(&s, of_vec);
> +
> +    /* copy all return values to the output rets array */
> +    for ( i = 0; i < nrets; i++ )
> +    {

Ditto.

> +        rets[i] = be32_to_cpu(s.ofs_args[i + nargs]);
> +    }
> +
> +    return rc;
> +}
> +
> +static int of_finddevice(const char *devspec)
> +{
> +    int rets[1] = { OF_FAILURE };
> +
> +    of_call("finddevice", 1, 1, rets, devspec);
> +    return rets[0];
> +}
> +
> +static int of_getprop(int ph, const char *name, void *buf, uint32_t buflen)
> +{
> +    int rets[1] = { OF_FAILURE };
> +
> +    of_call("getprop", 4, 1, rets, ph, ADDR(name), buf, buflen);
> +    return rets[0];
> +}
> +
> +int of_write(int ih, const char *addr, uint32_t len)
> +{
> +    int rets[1] = { OF_FAILURE };
> +
> +    of_call("write", 3, 1, rets, ih, addr, len);
> +    return rets[0];
> +}
> +
> +static void of_putchar(char c)
> +{
> +    if ( c == '\n' )
> +    {
> +        char buf = '\r';
> +        of_write(of_out, &buf, 1);
> +    }
> +    of_write(of_out, &c, 1);
> +}
> +
> +void boot_of_init(unsigned long vec)
> +{
> +    of_vec = vec;
> +
> +    /* Get a handle to the default console */
> +    bof_chosen = of_finddevice("/chosen");
> +    of_getprop(bof_chosen, "stdout", &of_out, sizeof(of_out));
> +    of_out = be32_to_cpu(of_out);
> +
> +    early_printk_init(of_putchar);
> +}

All files usually have an emacs magic block. E.g.:

/*
  * Local variables:
  * mode: C
  * c-file-style: "BSD"
  * c-basic-offset: 4
  * indent-tabs-mode: nil
  * End:
  */

> diff --git a/xen/arch/ppc/configs/ppc64_defconfig b/xen/arch/ppc/configs/ppc64_defconfig
> index 8783eb3488..f7cc075e45 100644
> --- a/xen/arch/ppc/configs/ppc64_defconfig
> +++ b/xen/arch/ppc/configs/ppc64_defconfig
> @@ -10,4 +10,5 @@
>   CONFIG_PPC64=y
>   CONFIG_DEBUG=y
>   CONFIG_DEBUG_INFO=y
> +CONFIG_EARLY_PRINTK=y
>   CONFIG_EXPERT=y
> diff --git a/xen/arch/ppc/early_printk.c b/xen/arch/ppc/early_printk.c
> new file mode 100644
> index 0000000000..309a1a7fd9
> --- /dev/null
> +++ b/xen/arch/ppc/early_printk.c
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/lib.h>
> +#include <asm/boot.h>
> +
> +static void (*putchar_func)(char);
> +
> +void early_printk_init(void (*putchar)(char))
> +{
> +    putchar_func = putchar;
> +}
> +
> +void early_puts(const char *s, size_t nr)
> +{
> +    if ( !putchar_func )
> +        return;
> +
> +    while ( nr-- > 0 )
> +        putchar_func(*s++);
> +}
> +
> +void early_printk(const char *s)
> +{
> +    if ( !putchar_func )
> +        return;
> +
> +    while ( *s )
> +        putchar_func(*s++);
> +}

Missing emacs magic.

> diff --git a/xen/arch/ppc/include/asm/boot.h b/xen/arch/ppc/include/asm/boot.h
> new file mode 100644
> index 0000000000..ea4a945bb4
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/boot.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_PPC_BOOT_H
> +#define _ASM_PPC_BOOT_H
> +
> +#include <xen/types.h>
> +
> +/* a collection of interfaces used during boot. */
> +enum {
> +    OF_FAILURE = -1,
> +    OF_SUCCESS = 0,
> +};
> +
> +struct of_service {
> +    __be32 ofs_service;
> +    __be32 ofs_nargs;
> +    __be32 ofs_nrets;
> +    __be32 ofs_args[10];
> +};
> +
> +extern int enter_of(struct of_service *args, unsigned long entry);

Here you add 'extern' but ...

> +
> +void boot_of_init(unsigned long);

not here. In Xen, we tend to not add 'extern' for prototypes. Also, 
please name the parameter as this makes clear what the value is. This 
would also make MISRA happy (IIRC this would rule 8.2).

> +
> +#endif /* _ASM_PPC_BOOT_H */

Missing emacs magic.

> diff --git a/xen/arch/ppc/include/asm/bug.h b/xen/arch/ppc/include/asm/bug.h
> new file mode 100644
> index 0000000000..a23ab1fa74
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/bug.h
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _ASM_PPC_BUG_H
> +#define _ASM_PPC_BUG_H
> +
> +#endif /* _ASM_PPC_BUG_H */

Can you clarify why you do need this empty header?

Also missing emacs magic.

> diff --git a/xen/arch/ppc/include/asm/byteorder.h b/xen/arch/ppc/include/asm/byteorder.h
> new file mode 100644
> index 0000000000..cc4d55b355
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/byteorder.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASM_POWERPC_BYTEORDER_H
> +#define _ASM_POWERPC_BYTEORDER_H
> +
> +#include <asm/types.h>
> +#include <xen/compiler.h>
> +
> +static inline __attribute_const__ __u16 ___arch__swab16(__u16 value)
> +{
> +    __u16 result;
> +
> +    asm("rlwimi %0,%1,8,16,23"

In general, we tend to add a space of after the commas.

> +        : "=r" (result)
> +        : "r" (value), "0" (value >> 8));
> +    return result;
> +}
> +
> +static inline __attribute_const__ __u32 ___arch__swab32(__u32 value)
> +{
> +    __u32 result;
> +
> +    asm("rlwimi %0,%1,24,16,23\n\t"
> +        "rlwimi %0,%1,8,8,15\n\t"
> +        "rlwimi %0,%1,24,0,7"

Same here.

> +        : "=r" (result)
> +        : "r" (value), "0" (value >> 24));
> +    return result;
> +}
> +
> +#define __arch__swab16(x) ___arch__swab16(x)
> +#define __arch__swab32(x) ___arch__swab32(x)
> +
> +#define __BYTEORDER_HAS_U64__
> +
> +#include <xen/byteorder/little_endian.h>
> +
> +#endif /* _ASM_POWERPC_BYTEORDER_H */

Missing emacs magic.

> diff --git a/xen/arch/ppc/include/asm/cache.h b/xen/arch/ppc/include/asm/cache.h
> new file mode 100644
> index 0000000000..8a0a6b7b17
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/cache.h
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _ASM_PPC_CACHE_H
> +#define _ASM_PPC_CACHE_H
> +
> +#endif /* _ASM_PPC_CACHE_H */

Can you clarify why you do need this empty header?

Also missing emacs magic.

> diff --git a/xen/arch/ppc/include/asm/early_printk.h b/xen/arch/ppc/include/asm/early_printk.h
> new file mode 100644
> index 0000000000..d1d8b416f4
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/early_printk.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_PPC_EARLY_PRINTK_H
> +#define _ASM_PPC_EARLY_PRINTK_H
> +
> +#include <xen/early_printk.h>
> +
> +#ifdef CONFIG_EARLY_PRINTK
> +void early_printk_init(void (*putchar)(char));
> +void early_printk(const char *s);
> +#else
> +static inline void early_printk_init(void (*putchar)(char)) {}
> +static inline void early_printk(const char *s) {}
> +#endif
> +
> +#endif /* _ASM_PPC_EARLY_PRINTK_H */

Missing emacs magic.

> diff --git a/xen/arch/ppc/include/asm/msr.h b/xen/arch/ppc/include/asm/msr.h
> new file mode 100644
> index 0000000000..7ef0b5e3ad
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/msr.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

Can you drop the full license?

> + *
> + * Copyright (C) IBM Corp. 2005
> + *
> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
> + */
> +
> +#ifndef _POWERPC_MSR_H
> +#define _POWERPC_MSR_H
> +
> +#ifdef __ASSEMBLY__
> +#define ULL(x) x
> +#else
> +#define ULL(x) x ## ULL
> +#endif
> +
> +/* Flags in MSR: */
> +#define MSR_SF      ULL(0x8000000000000000)
> +#define MSR_TA      ULL(0x4000000000000000)
> +#define MSR_ISF     ULL(0x2000000000000000)
> +#define MSR_HV      ULL(0x1000000000000000)
> +#define MSR_VMX     ULL(0x0000000002000000)
> +#define MSR_MER     ULL(0x0000000000200000)
> +#define MSR_POW     ULL(0x0000000000040000)
> +#define MSR_ILE     ULL(0x0000000000010000)
> +#define MSR_EE      ULL(0x0000000000008000)
> +#define MSR_PR      ULL(0x0000000000004000)
> +#define MSR_FP      ULL(0x0000000000002000)
> +#define MSR_ME      ULL(0x0000000000001000)
> +#define MSR_FE0     ULL(0x0000000000000800)
> +#define MSR_SE      ULL(0x0000000000000400)
> +#define MSR_BE      ULL(0x0000000000000200)
> +#define MSR_FE1     ULL(0x0000000000000100)
> +#define MSR_IP      ULL(0x0000000000000040)
> +#define MSR_IR      ULL(0x0000000000000020)
> +#define MSR_DR      ULL(0x0000000000000010)
> +#define MSR_PMM     ULL(0x0000000000000004)
> +#define MSR_RI      ULL(0x0000000000000002)
> +#define MSR_LE      ULL(0x0000000000000001)
> +
> +/* MSR bits set on the systemsim simulator */
> +#define MSR_SIM       ULL(0x0000000020000000)
> +#define MSR_SYSTEMSIM ULL(0x0000000010000000)
> +
> +/* On a trap, srr1's copy of msr defines some bits as follows: */
> +#define MSR_TRAP_FE     ULL(0x0000000000100000) /* Floating Point Exception */
> +#define MSR_TRAP_IOP    ULL(0x0000000000080000) /* Illegal Instruction */
> +#define MSR_TRAP_PRIV   ULL(0x0000000000040000) /* Privileged Instruction */
> +#define MSR_TRAP        ULL(0x0000000000020000) /* Trap Instruction */
> +#define MSR_TRAP_NEXT   ULL(0x0000000000010000) /* PC is next instruction */
> +#define MSR_TRAP_BITS  (MSR_TRAP_FE|MSR_TRAP_IOP|MSR_TRAP_PRIV|MSR_TRAP)
> +
> +#endif /* _POWERPC_MSR_H */

Mising emacs magic.

> diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
> new file mode 100644
> index 0000000000..6deba051a8
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/processor.h
> @@ -0,0 +1,207 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

Can you drop the full license?

> + *
> + * Copyright IBM Corp. 2005, 2006, 2007
> + * Copyright Raptor Engineering, LLC
> + *
> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
> + *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
> + *          Timothy Pearson <tpearson@raptorengineering.com>
> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
> + */
> +
> +#ifndef _ASM_PROCESSOR_H_
> +#define _ASM_PROCESSOR_H_
> +
> +#include <xen/config.h>
> +#include <asm/msr.h>
> +#include <asm/reg_defs.h>
> +
> +#define IOBMP_BYTES          8192
> +#define IOBMP_INVALID_OFFSET 0x8000
> +
> +/* Processor Version Register (PVR) field extraction */
> +
> +#define PVR_VER(pvr) (((pvr) >> 16) & 0xFFFF) /* Version field */
> +#define PVR_REV(pvr) (((pvr) >> 0) & 0xFFFF)  /* Revison field */
> +
> +#define __is_processor(pv) (PVR_VER(mfspr(SPRN_PVR)) == (pv))
> +
> +/*
> + * IBM has further subdivided the standard PowerPC 16-bit version and
> + * revision subfields of the PVR for the PowerPC 403s into the following:
> + */
> +
> +#define PVR_FAM(pvr)  (((pvr) >> 20) & 0xFFF) /* Family field */
> +#define PVR_MEM(pvr)  (((pvr) >> 16) & 0xF)   /* Member field */
> +#define PVR_CORE(pvr) (((pvr) >> 12) & 0xF)   /* Core field */
> +#define PVR_CFG(pvr)  (((pvr) >> 8) & 0xF)    /* Configuration field */
> +#define PVR_MAJ(pvr)  (((pvr) >> 4) & 0xF)    /* Major revision field */
> +#define PVR_MIN(pvr)  (((pvr) >> 0) & 0xF)    /* Minor revision field */
> +
> +/* Processor Version Numbers */
> +
> +#define PVR_403GA    0x00200000
> +#define PVR_403GB    0x00200100
> +#define PVR_403GC    0x00200200
> +#define PVR_403GCX   0x00201400
> +#define PVR_405GP    0x40110000
> +#define PVR_STB03XXX 0x40310000
> +#define PVR_NP405H   0x41410000
> +#define PVR_NP405L   0x41610000
> +#define PVR_601      0x00010000
> +#define PVR_602      0x00050000
> +#define PVR_603      0x00030000
> +#define PVR_603e     0x00060000
> +#define PVR_603ev    0x00070000
> +#define PVR_603r     0x00071000
> +#define PVR_604      0x00040000
> +#define PVR_604e     0x00090000
> +#define PVR_604r     0x000A0000
> +#define PVR_620      0x00140000
> +#define PVR_740      0x00080000
> +#define PVR_750      PVR_740
> +#define PVR_740P     0x10080000
> +#define PVR_750P     PVR_740P
> +#define PVR_7400     0x000C0000
> +#define PVR_7410     0x800C0000
> +#define PVR_7450     0x80000000
> +#define PVR_8540     0x80200000
> +#define PVR_8560     0x80200000
> +/*
> + * For the 8xx processors, all of them report the same PVR family for
> + * the PowerPC core. The various versions of these processors must be
> + * differentiated by the version number in the Communication Processor
> + * Module (CPM).
> + */
> +#define PVR_821  0x00500000
> +#define PVR_823  PVR_821
> +#define PVR_850  PVR_821
> +#define PVR_860  PVR_821
> +#define PVR_8240 0x00810100
> +#define PVR_8245 0x80811014
> +#define PVR_8260 PVR_8240
> +
> +/* 64-bit processors */
> +#define PVR_NORTHSTAR	0x0033
> +#define PVR_PULSAR      0x0034
> +#define PVR_POWER4	0x0035
> +#define PVR_ICESTAR	0x0036
> +#define PVR_SSTAR	0x0037
> +#define PVR_POWER4p	0x0038
> +#define PVR_970		0x0039
> +#define PVR_POWER5	0x003A
> +#define PVR_POWER5p	0x003B
> +#define PVR_970FX	0x003C
> +#define PVR_POWER6	0x003E
> +#define PVR_POWER7	0x003F
> +#define PVR_630		0x0040
> +#define PVR_630p	0x0041
> +#define PVR_970MP	0x0044
> +#define PVR_970GX	0x0045
> +#define PVR_POWER7p	0x004A
> +#define PVR_POWER8E	0x004B
> +#define PVR_POWER8NVL	0x004C
> +#define PVR_POWER8	0x004D
> +#define PVR_POWER9	0x004E
> +#define PVR_POWER10	0x0080
> +#define PVR_BE		0x0070
> +#define PVR_PA6T	0x0090
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/types.h>
> +
> +/* User-accessible registers: nost of these need to be saved/restored
> + * for every nested Xen invocation. */

The multi-line comment coding style is:

/*
  * foo
  * bar
  */

For single line comment, they should be:

/* foo bar */

[...]

> diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
> index 2fcefb40d8..589c72e382 100644
> --- a/xen/arch/ppc/ppc64/head.S
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -1,30 +1,34 @@
>   /* SPDX-License-Identifier: GPL-2.0-or-later */
>   
> +#include <asm/processor.h>
> +
>       .section .text.header, "ax", %progbits
>   
>   ENTRY(start)
> -    /*
> -     * Depending on how we were booted, the CPU could be running in either
> -     * Little Endian or Big Endian mode. The following trampoline from Linux
> -     * cleverly uses an instruction that encodes to a NOP if the CPU's
> -     * endianness matches the assumption of the assembler (LE, in our case)
> -     * or a branch to code that performs the endian switch in the other case.
> -     */
> -    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
> -    b . + 44          /* Skip trampoline if endian is good  */
> -    .long 0xa600607d  /* mfmsr r11                          */
> -    .long 0x01006b69  /* xori r11,r11,1                     */
> -    .long 0x00004039  /* li r10,0                           */
> -    .long 0x6401417d  /* mtmsrd r10,1                       */
> -    .long 0x05009f42  /* bcl 20,31,$+4                      */
> -    .long 0xa602487d  /* mflr r10                           */
> -    .long 0x14004a39  /* addi r10,r10,20                    */
> -    .long 0xa6035a7d  /* mtsrr0 r10                         */
> -    .long 0xa6037b7d  /* mtsrr1 r11                         */
> -    .long 0x2400004c  /* rfid                               */

This seems to be refactoring. It would be best if this is done in a 
separate patch as this is easier to review.

> -
> -    /* Now that the endianness is confirmed, continue */
> -1:  b 1b
> +    /* NOTE: argument registers (r3-r9) must be preserved until the C entrypoint */

I feel this is a bit too small to be noticeable. I would suggest to 
write a large comment so it is more obvious to spot the list of 
registers that should not be used. One way would be:

/*
  * r1 ...
  * r2 ..
  * r3 ...
  * ...
  */

> +    FIXUP_ENDIAN
> +
> +    /* set up the initial stack */
> +    LOAD_IMM64(r1, cpu0_boot_stack)
> +    li r8, 0
> +    std r8, 0(r1)
> +
> +    /* call the C entrypoint */
> +    LOAD_IMM64(r12, start_xen)
> +    mtctr r12
> +    bctrl
> +
> +    /* should never return */
> +    trap
>   
>       .size start, . - start
>       .type start, %function
> +
> +    .section .init.data, "aw", @progbits
> +
> +    /* Early init stack */
> +    .p2align 4
> +cpu0_boot_stack_bottom:
> +    .space STACK_SIZE
> +cpu0_boot_stack:
> +    .space STACK_FRAME_OVERHEAD

Cheers,

-- 
Julien Grall

