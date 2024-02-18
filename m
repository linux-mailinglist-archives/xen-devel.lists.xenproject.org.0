Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC48598CF
	for <lists+xen-devel@lfdr.de>; Sun, 18 Feb 2024 20:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682637.1061721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbmPO-0001fM-Id; Sun, 18 Feb 2024 19:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682637.1061721; Sun, 18 Feb 2024 19:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbmPO-0001cS-Fo; Sun, 18 Feb 2024 19:01:02 +0000
Received: by outflank-mailman (input) for mailman id 682637;
 Sun, 18 Feb 2024 19:01:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rbmPM-0001cM-U7
 for xen-devel@lists.xenproject.org; Sun, 18 Feb 2024 19:01:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rbmPM-0008Qa-Dc; Sun, 18 Feb 2024 19:01:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rbmPM-0006ka-2L; Sun, 18 Feb 2024 19:01:00 +0000
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
	bh=Gach0ne8t5TA97xMT6m7LLcX8cXY3fyAnDntvmWBjq0=; b=nbO/VRS4l5I2WuyjTk+Hyp04Lr
	QP6EZZdYPvqeq1P0fnfXsW7qg8Lwdu/ASqVssB5iClwdLIAb8oiqkYSUFYIz5B6csH3RUeZM6hWBS
	k1bu/rZ1SWKesiL1/8syhrmh9XZb3GxJ3qePIR/K41vf9vLv04zgk371o6YV4mX+qKj8=;
Message-ID: <491937fd-2459-416f-944b-0c63f7c12473@xen.org>
Date: Sun, 18 Feb 2024 19:00:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/02/2024 15:32, Oleksii Kurochko wrote:
> The header was taken from Linux kernl 6.4.0-rc1.
> 
> Addionally, were updated:
> * add emulation of {cmp}xchg for 1/2 byte types

This explaination is a little bit light. IIUC, you are implementing them 
using 32-bit atomic access. Is that correct? If so, please spell it out.

Also, I wonder whether it would be better to try to get rid of the 1/2 
bytes access. Do you know where they are used?

> * replace tabs with spaces
Does this mean you are not planning to backport any Linux fixes?

> * replace __* varialbed with *__

s/varialbed/variable/

> * introduce generic version of xchg_* and cmpxchg_*.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>   - Code style fixes.
>   - enforce in __xchg_*() has the same type for new and *ptr, also "\n"
>     was removed at the end of asm instruction.
>   - dependency from https://lore.kernel.org/xen-devel/cover.1706259490.git.federico.serafini@bugseng.com/
>   - switch from ASSERT_UNREACHABLE to STATIC_ASSERT_UNREACHABLE().
>   - drop xchg32(ptr, x) and xchg64(ptr, x) as they aren't used.
>   - drop cmpxcg{32,64}_{local} as they aren't used.
>   - introduce generic version of xchg_* and cmpxchg_*.
>   - update the commit message.
> ---
> Changes in V3:
>   - update the commit message
>   - add emulation of {cmp}xchg_... for 1 and 2 bytes types
> ---
> Changes in V2:
>   - update the comment at the top of the header.
>   - change xen/lib.h to xen/bug.h.
>   - sort inclusion of headers properly.
> ---
>   xen/arch/riscv/include/asm/cmpxchg.h | 237 +++++++++++++++++++++++++++
>   1 file changed, 237 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
> 
> diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
> new file mode 100644
> index 0000000000..b751a50cbf
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> @@ -0,0 +1,237 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (C) 2014 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_CMPXCHG_H
> +#define _ASM_RISCV_CMPXCHG_H
> +
> +#include <xen/compiler.h>
> +#include <xen/lib.h>
> +
> +#include <asm/fence.h>
> +#include <asm/io.h>
> +#include <asm/system.h>
> +
> +#define ALIGN_DOWN(addr, size)  ((addr) & (~((size) - 1)))
> +
> +#define __amoswap_generic(ptr, new, ret, sfx, release_barrier, acquire_barrier) \
> +({ \
> +    asm volatile( \
> +        release_barrier \
> +        " amoswap" sfx " %0, %2, %1\n" \
> +        acquire_barrier \
> +        : "=r" (ret), "+A" (*ptr) \
> +        : "r" (new) \
> +        : "memory" ); \
> +})
> +
> +#define emulate_xchg_1_2(ptr, new, ret, release_barrier, acquire_barrier) \
> +({ \
> +    uint32_t *ptr_32b_aligned = (uint32_t *)ALIGN_DOWN((unsigned long)ptr, 4); \
> +    uint8_t mask_l = ((unsigned long)(ptr) & (0x8 - sizeof(*ptr))) * BITS_PER_BYTE; \
> +    uint8_t mask_size = sizeof(*ptr) * BITS_PER_BYTE; \
> +    uint8_t mask_h = mask_l + mask_size - 1; \
> +    unsigned long mask = GENMASK(mask_h, mask_l); \
> +    unsigned long new_ = (unsigned long)(new) << mask_l; \
> +    unsigned long ret_; \
> +    unsigned long rc; \
> +    \
> +    asm volatile( \
> +        release_barrier \
> +        "0: lr.d %0, %2\n" \

I was going to ask why this is lr.d rather than lr.w. But I see Jan 
already asked. I agree with him that it should probably be a lr.w and ...

> +        "   and  %1, %0, %z4\n" \
> +        "   or   %1, %1, %z3\n" \
> +        "   sc.d %1, %1, %2\n" \

... respectively sc.w. The same applies for cmpxchg.

Cheers,

-- 
Julien Grall

