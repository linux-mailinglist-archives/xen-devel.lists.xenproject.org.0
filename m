Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB0A9711C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963118.1354172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Ffi-0006Z8-GP; Tue, 22 Apr 2025 15:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963118.1354172; Tue, 22 Apr 2025 15:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Ffi-0006XW-Bw; Tue, 22 Apr 2025 15:36:30 +0000
Received: by outflank-mailman (input) for mailman id 963118;
 Tue, 22 Apr 2025 15:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Ffg-0006Us-AB
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:36:28 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c8293d0-1f8f-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:36:24 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso58735255e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:36:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6db1b3sm180775875e9.29.2025.04.22.08.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:36:23 -0700 (PDT)
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
X-Inumbo-ID: 8c8293d0-1f8f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745336184; x=1745940984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E5L5GIdUonFlQn7DbV5XuGRLBKT2L2yQDEKrOzFLrOg=;
        b=AQFlKT56cejkwVkbJc0lmtyOgx5lmKaWeMhRS5NmmBU/dQTo5LVr0z5szZIup6GiR5
         hw6JTQ8GqcAqjffDHa0d+wOds4bhwjRIXZxIEDob0g2ox604xvIZulfMBqP+udi4WDp1
         OBS9K8bY2rI2IGy18TiAG+UgnY4S8XzHQGEtqEja5oLtsh6dpIIZobu221z0CzjJYnuv
         qXbteJdq30A4gXKxK1gEykv8SaAyEHS/bOUNiH17mnYqc9G8PJyJtUkNGB+5nOgJBERW
         TpU8Do7C5I6VmZq/6d2KKQmYvGAW4GI8A8tHYAXRe2Shp8dVI7zPSF/e0bgflMZ73cfl
         bu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336184; x=1745940984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5L5GIdUonFlQn7DbV5XuGRLBKT2L2yQDEKrOzFLrOg=;
        b=xKd583ty1pPHprRLV1WQe3kNckuWafQPGpC/AjgUBR1df4JfZ9d4bRQnquVD8zCRxj
         bTlBWhnDB98ZfPoO5JvBDYU1f09Zdtl1hfI3exrtq1TxaMtdR7RkISYa4XtFAAZG/BRd
         xIak7pMxFqtSSyn8AwmIBnbIV0Za+KLKuiqtLrdiArAyHbgGNzK07ECSbVxM2Sn8Y1VL
         VCChgq1e7GO2CorpbVWiG2mOWV7uk05jnN86oP98bYFmkh+E+D0+da5GCofMi5jj6Z6s
         VwEypgrKJJVlwPA0l4yOnqBqXr4E79WQQ/t+VKQIZTOWl5CLZuvDK9fDEjwHxTYqbqI/
         YUow==
X-Forwarded-Encrypted: i=1; AJvYcCVn4pgy2W32PxPu/AlMFJ9tiKwnrR/bupfm3EFVQpbqgH/n4beQKVHNcJEwD/O18A1ECqvcgFVVIMk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxKCPXdCGpwPLQQ5oExKGVJa9Yk4RYvb0+upiIi+gAuaBt8VV9
	Znoat7T0yk/IGySK8aC4ZKUWNaVgTzq7tanLn+FY3qqZgV1ZYhvuSGTy1bbhrQ==
X-Gm-Gg: ASbGncvxs5gRg54zcjiAmaQMrpLbS+mOmGaxzCR4jr7vplJ+fItm/RqoEm1crE10K5m
	AVPp65UBHla10/9G+CL2rxTcjf4wtiVnrVgkrjNeC0x2gfg/8ft1KeqtN/yjwoJDw4CpYEEGQGX
	xxOKUDOhaS7sURmFXDcxWtouLa7SWEx1VryKOsGTCkbFQH3Fs/MMtMVpo3y3AYaHRyGRNCef63r
	o2+wfc7xdHTXG3raecKVY+b94rmZZ3/x0+dJuNhTaFmeaiZUDj8puTgMVofM3g5SmAYHbubkRTt
	qv6MlH7kFRtOIlLOvUFgHEynhXTkD8MRk3wDB6eJhEMY0NscRlfKQUICT1fNJZVqzxsbFdzQJVM
	J7UUh1bVCoFpsEQG3H8V319kwwQ==
X-Google-Smtp-Source: AGHT+IHR9THzz0vb8F5y3c1q45QrTQLVge0OmO9gMmFd7h3X3/BR+nPdntu/u4zIJAG/7LIigCBE0A==
X-Received: by 2002:a05:600c:a4b:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-4406ab96871mr158178465e9.14.1745336183653;
        Tue, 22 Apr 2025 08:36:23 -0700 (PDT)
Message-ID: <a0dcf27e-a066-4e5f-97b2-e5f178e1b941@suse.com>
Date: Tue, 22 Apr 2025 17:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] lib/sha1.c: add file
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <8dec423182ed60e2233ed87d98066fed6dc20caf.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <8dec423182ed60e2233ed87d98066fed6dc20caf.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 17:06, Sergii Dmytruk wrote:
> From: Krystian Hebel <krystian.hebel@3mdeb.com>
> 
> The code comes from [1] and is licensed under GPL-2.0 license.
> It's a combination of:
>  - include/crypto/sha1.h
>  - include/crypto/sha1_base.h
>  - lib/crypto/sha1.c
>  - crypto/sha1_generic.c
> 
> Changes:
>  - includes
>  - formatting
>  - renames and splicing of some trivial functions that are called once
>  - dropping of `int` return values (only zero was ever returned)
>  - getting rid of references to `struct shash_desc`

Since you did move the code to (largely) Xen style, a few further requests
in that direction:

> --- /dev/null
> +++ b/xen/include/xen/sha1.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __XEN_SHA1_H
> +#define __XEN_SHA1_H
> +
> +#include <xen/inttypes.h>
> +
> +#define SHA1_DIGEST_SIZE  20
> +
> +void sha1_hash(const u8 *data, unsigned int len, u8 *out);

uint8_t please in both instances here, and more generally {,u}int<N>_t
in place of {s,u}<N>.

> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -38,6 +38,7 @@ lib-y += strtoll.o
>  lib-y += strtoul.o
>  lib-y += strtoull.o
>  lib-$(CONFIG_X86) += x86-generic-hweightl.o
> +lib-$(CONFIG_X86) += sha1.o

Please obey to alphabetic sorting.

> --- /dev/null
> +++ b/xen/lib/sha1.c
> @@ -0,0 +1,240 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * SHA1 routine optimized to do word accesses rather than byte accesses,
> + * and to avoid unnecessary copies into the context array.
> + *
> + * This was based on the git SHA1 implementation.
> + */
> +
> +#include <xen/bitops.h>
> +#include <xen/types.h>
> +#include <xen/sha1.h>
> +#include <xen/unaligned.h>
> +
> +/*
> + * If you have 32 registers or more, the compiler can (and should)
> + * try to change the array[] accesses into registers. However, on
> + * machines with less than ~25 registers, that won't really work,
> + * and at least gcc will make an unholy mess of it.
> + *
> + * So to avoid that mess which just slows things down, we force
> + * the stores to memory to actually happen (we might be better off
> + * with a 'W(t)=(val);asm("":"+m" (W(t))' there instead, as
> + * suggested by Artur Skawina - that will also make gcc unable to
> + * try to do the silly "optimize away loads" part because it won't
> + * see what the value will be).
> + *
> + * Ben Herrenschmidt reports that on PPC, the C version comes close
> + * to the optimized asm with this (ie on PPC you don't want that
> + * 'volatile', since there are lots of registers).
> + *
> + * On ARM we get the best code generation by forcing a full memory barrier
> + * between each SHA_ROUND, otherwise gcc happily get wild with spilling and
> + * the stack frame size simply explode and performance goes down the drain.
> + */
> +
> +#ifdef CONFIG_X86
> +  #define setW(x, val) (*(volatile uint32_t *)&W(x) = (val))

The # of pre-processor directives generally wants to be in the first column.

> +#elif defined(CONFIG_ARM)
> +  #define setW(x, val) do { W(x) = (val); __asm__("":::"memory"); } while ( 0 )

__asm__ ( "" ::: "memory" );

as far as style goes. But then I see no need to open-code barrier().

> +#else
> +  #define setW(x, val) (W(x) = (val))
> +#endif
> +
> +/* This "rolls" over the 512-bit array */
> +#define W(x) (array[(x) & 15])
> +
> +/*
> + * Where do we get the source from? The first 16 iterations get it from
> + * the input data, the next mix it from the 512-bit array.
> + */
> +#define SHA_SRC(t) get_unaligned_be32((uint32_t *)data + t)
> +#define SHA_MIX(t) rol32(W(t + 13) ^ W(t + 8) ^ W(t + 2) ^ W(t), 1)

I fear Misra isn't going to like the lack of parenthesization of macro
arguments used in expressions. This looks to be an issue with most
macros here.

> +#define SHA_ROUND(t, input, fn, constant, A, B, C, D, E) do { \
> +        uint32_t TEMP = input(t); setW(t, TEMP);              \
> +        E += TEMP + rol32(A, 5) + (fn) + (constant);          \
> +        B = ror32(B, 2);                                      \
> +        TEMP = E; E = D; D = C; C = B; B = A; A = TEMP;       \
> +    } while ( 0 )
> +
> +#define T_0_15(t, A, B, C, D, E)  \
> +        SHA_ROUND(t, SHA_SRC, (((C ^ D) & B) ^ D), 0x5a827999, A, B, C, D, E)
> +#define T_16_19(t, A, B, C, D, E) \
> +        SHA_ROUND(t, SHA_MIX, (((C ^ D) & B) ^ D), 0x5a827999, A, B, C, D, E)
> +#define T_20_39(t, A, B, C, D, E) \
> +        SHA_ROUND(t, SHA_MIX, (B ^ C ^ D), 0x6ed9eba1, A, B, C, D, E)
> +#define T_40_59(t, A, B, C, D, E)                                             \
> +        SHA_ROUND(t, SHA_MIX, ((B & C) + (D & (B ^ C))), 0x8f1bbcdc, A, B, C, \
> +                  D, E)
> +#define T_60_79(t, A, B, C, D, E) \
> +        SHA_ROUND(t, SHA_MIX, (B ^ C ^ D), 0xca62c1d6, A, B, C, D, E)
> +
> +#define SHA1_BLOCK_SIZE         64
> +#define SHA1_WORKSPACE_WORDS    16
> +
> +struct sha1_state {
> +    uint32_t state[SHA1_DIGEST_SIZE / 4];
> +    uint64_t count;
> +    uint8_t buffer[SHA1_BLOCK_SIZE];
> +};
> +
> +typedef void sha1_block_fn(struct sha1_state *sst, const uint8_t *src, int blocks);

Please respect line length restrictions. The use of plain int here also looks
questionable, as just from the name that parameter looks like it can't have a
negative argument passed for it. This will want adjusting elsewhere as well.

> +/**
> + * sha1_transform - single block SHA1 transform (deprecated)
> + *
> + * @digest: 160 bit digest to update
> + * @data:   512 bits of data to hash
> + * @array:  16 words of workspace (see note)
> + *
> + * This function executes SHA-1's internal compression function.  It updates the
> + * 160-bit internal state (@digest) with a single 512-bit data block (@data).
> + *
> + * Don't use this function.  SHA-1 is no longer considered secure.  And even if
> + * you do have to use SHA-1, this isn't the correct way to hash something with
> + * SHA-1 as this doesn't handle padding and finalization.
> + *
> + * Note: If the hash is security sensitive, the caller should be sure
> + * to clear the workspace. This is left to the caller to avoid
> + * unnecessary clears between chained hashing operations.
> + */
> +void sha1_transform(uint32_t *digest, const uint8_t *data, uint32_t *array)

You add no declaration of this function in the header. Should it be static?
This would also help with the "Don't use ..." part of the comment.

Jan

