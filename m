Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F64385990E
	for <lists+xen-devel@lfdr.de>; Sun, 18 Feb 2024 20:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682649.1061741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbmkO-0005Ux-C3; Sun, 18 Feb 2024 19:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682649.1061741; Sun, 18 Feb 2024 19:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbmkO-0005SG-8v; Sun, 18 Feb 2024 19:22:44 +0000
Received: by outflank-mailman (input) for mailman id 682649;
 Sun, 18 Feb 2024 19:22:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rbmkN-0005SA-5s
 for xen-devel@lists.xenproject.org; Sun, 18 Feb 2024 19:22:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rbmkM-0000M4-EO; Sun, 18 Feb 2024 19:22:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rbmkM-0007wi-5B; Sun, 18 Feb 2024 19:22:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=tZa49q/QosZ/QmxnsOn3llBAoWIA8D6bzF743wTe0YI=; b=13cOR7PUX180ZBLcOIysUAJRAE
	cQn9LA9BTtdd0VcIslhpWJWtV/WkE9yoTV/Nf1YqbdLs27a4A9VroB6p9/CGs1cTEDz0b4yvxmX/L
	6P62g8rEO/pcwunYwBo2tFXah5htt+A1u6slTkwgf8ll6vccLNq/omEHiF+UNYbwlWr8=;
Message-ID: <26e01c13-364d-474b-8b8e-d1721ff0daf0@xen.org>
Date: Sun, 18 Feb 2024 19:22:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/30] xen/riscv: introduce atomic.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <6554f2479e19ed3eae6de842ac1568c31d236461.1707146506.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6554f2479e19ed3eae6de842ac1568c31d236461.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/02/2024 15:32, Oleksii Kurochko wrote:
> From: Bobby Eshleman <bobbyeshleman@gmail.com>
> 
> Additionally, this patch introduces macros in fence.h,
> which are utilized in atomic.h.
> 
> atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n)
> were updated to use __*xchg_generic().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

The author is Bobby, but I don't see a Signed-off-by. Did you forgot it?

> ---
> Changes in V4:
>   - do changes related to the updates of [PATCH v3 13/34] xen/riscv: introduce cmpxchg.h
>   - drop casts in read_atomic_size(), write_atomic(), add_sized()
>   - tabs -> spaces
>   - drop #ifdef CONFIG_SMP ... #endif in fence.ha as it is simpler to handle NR_CPUS=1
>     the same as NR_CPUS>1 with accepting less than ideal performance.
> ---
> Changes in V3:
>    - update the commit message
>    - add SPDX for fence.h
>    - code style fixes
>    - Remove /* TODO: ... */ for add_sized macros. It looks correct to me.
>    - re-order the patch
>    - merge to this patch fence.h
> ---
> Changes in V2:
>   - Change an author of commit. I got this header from Bobby's old repo.
> ---
>   xen/arch/riscv/include/asm/atomic.h | 395 ++++++++++++++++++++++++++++
>   xen/arch/riscv/include/asm/fence.h  |   8 +
>   2 files changed, 403 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/atomic.h
>   create mode 100644 xen/arch/riscv/include/asm/fence.h
> 
> diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
> new file mode 100644
> index 0000000000..267d3c0803
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,395 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Taken and modified from Linux.

Which version of Linux? Can you also spell out what are the big changes? 
This would be helpful if we need to re-sync.

> + *
> + * atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were updated to use
> + * __*xchg_generic()
> + *
> + * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + * Copyright (C) 2021 Vates SAS
> + */
> +
> +#ifndef _ASM_RISCV_ATOMIC_H
> +#define _ASM_RISCV_ATOMIC_H
> +
> +#include <xen/atomic.h>
> +#include <asm/cmpxchg.h>
> +#include <asm/fence.h>
> +#include <asm/io.h>
> +#include <asm/system.h>
> +
> +void __bad_atomic_size(void);
> +
> +static always_inline void read_atomic_size(const volatile void *p,
> +                                           void *res,
> +                                           unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1: *(uint8_t *)res = readb(p); break;
> +    case 2: *(uint16_t *)res = readw(p); break;
> +    case 4: *(uint32_t *)res = readl(p); break;
> +    case 8: *(uint32_t *)res  = readq(p); break;
> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define read_atomic(p) ({                               \
> +    union { typeof(*p) val; char c[0]; } x_;            \
> +    read_atomic_size(p, x_.c, sizeof(*p));              \
> +    x_.val;                                             \
> +})
> +
> +#define write_atomic(p, x)                              \
> +({                                                      \
> +    typeof(*p) x__ = (x);                               \
> +    switch ( sizeof(*p) )                               \
> +    {                                                   \
> +    case 1: writeb((uint8_t)x__,  p); break;            \
> +    case 2: writew((uint16_t)x__, p); break;            \
> +    case 4: writel((uint32_t)x__, p); break;            \
> +    case 8: writeq((uint64_t)x__, p); break;            \
> +    default: __bad_atomic_size(); break;                \
> +    }                                                   \
> +    x__;                                                \
> +})
> +
> +#define add_sized(p, x)                                 \
> +({                                                      \
> +    typeof(*(p)) x__ = (x);                             \
> +    switch ( sizeof(*(p)) )                             \
> +    {                                                   \
> +    case 1: writeb(read_atomic(p) + x__, p); break;     \
> +    case 2: writew(read_atomic(p) + x__, p); break;     \
> +    case 4: writel(read_atomic(p) + x__, p); break;     \
> +    default: __bad_atomic_size(); break;                \
> +    }                                                   \
> +})
> +
> +/*
> + *  __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
> + *               non-scalar types unchanged.
> + *
> + * Prefer C11 _Generic for better compile-times and simpler code. Note: 'char'

Xen is technically built using c99/gnu99. So it is feels a bit odd to 
introduce a C11 feature. I see that _Generic is already used in PPC... 
However, if we decide to add more use of it, then I think this should at 
minimum be documented in docs/misra/C-language-toolchain.rst (the more 
if we plan the macro is moved to common as Jan suggested).

Cheers,

-- 
Julien Grall

