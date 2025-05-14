Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F77AB7210
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 19:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984523.1370641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFFRg-0003PG-Pz; Wed, 14 May 2025 16:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984523.1370641; Wed, 14 May 2025 16:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFFRg-0003NN-NF; Wed, 14 May 2025 16:59:04 +0000
Received: by outflank-mailman (input) for mailman id 984523;
 Wed, 14 May 2025 16:59:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/Iz=X6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFFRf-0003NH-U6
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 16:59:04 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc1ffb9c-30e4-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 18:59:01 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so412935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 09:59:01 -0700 (PDT)
Received: from [10.81.43.161] ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39794cdsm38529135e9.38.2025.05.14.09.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 09:59:00 -0700 (PDT)
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
X-Inumbo-ID: bc1ffb9c-30e4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747241941; x=1747846741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yCNbJSZ5Nk0lUiLImtFaDgJu7pm6RRt7/86hksyiolk=;
        b=XFr0InmyGKufLEAYptRGRvBenVrHkM/OUt28mQJRuKk9vFaTRjUpKVshaYmIX/ggzK
         kIt3rAS6fydqEupuxC0nuYWtTVW+1z01DeOZPG724UxJtPSrYGVdRHQOXZZszjtxNxLH
         kfxAQWveNi/PpXaZDiWZgcL6Bz77XAK6QfrHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747241941; x=1747846741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCNbJSZ5Nk0lUiLImtFaDgJu7pm6RRt7/86hksyiolk=;
        b=tQ5hcck4tgnmAzqjaF+Dr3c46tfjKnMGzYCC3e7/+tluJHB3q57fo3lP/pn9lR1xtQ
         1Xk1mNCjeBHHLaUYVOOVmVKpA+FDE713VYMH0BeXGaDvGIlgdhhGEXL9MGlYsayOW77u
         MYJvO8CaZAy7hBcTM3exUQS+j8wiIQT3llT3vH6doemG1fMfBEwMtGAprsa9JPz92f1j
         aUe7NmFKeKj6Wyp8J3k7rxbYIGldE4wRDw39YJVlG55MePpwVsOrVf96h+FsJ0hswbKh
         08vbTu/DR4pN0AIKMJA4QuaYYeAjrqaF1k76pDrXE8B8ltcDVvjbAb0uW8bMNDhqTStm
         l0dA==
X-Forwarded-Encrypted: i=1; AJvYcCWDDbWLd4RKs3Vx5QfQi/E2hoJd9kPtHWYiMjYdWjeQx0mjnVsxDGn3/66bOxeApRs5iAapc+GHHAk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUm+Y8i4tSKMA88UGpR+Hjvt1EEk0f7BI9T0Z3vgOolp2FC2Z6
	+2wEekm5jaGhEti+CYG3C3yjEEdKej3HuBkIllLFaQo4I1vpronGUpEuANwwO4Q=
X-Gm-Gg: ASbGncvxcVPeoMwd5w37/I1/zWSWkXioMjYFzn04X89S+aPa+ZPOIL1q1M/UxMu7ytN
	V7f1ZAOX9wR9onqkrEU9QGktI7AXTAS1zGpqvWaold8KTVOgpMjTB0wSDgh476sGYVMZgEqvbB7
	eGRlb/oVK/5XOfcWWokj65q9owafNfLZTKp0EYRWHki/D8MMxn9uEP4Os+J8gwn+rBu1qrcqMqR
	5vzKWbAeRxvuibus8E7FwMucRH6NsczL25bCm9Q0zdzKfWtHr4ZboCuZRM1LvYkWq7bqFVhA8ZW
	BKintZcgG9N0ud4lK/K686YqdeAAB/mJYsrKHMRB8hxbYfWBjyhjB2A0r9Hk
X-Google-Smtp-Source: AGHT+IHLw6IeRlDQEKt1WCqZoAtIChJ1hxP/NjMT9TYgGEwuuiRhtvI+sYbmk5r/QwZDz+DpJnTvtA==
X-Received: by 2002:a05:600c:1e09:b0:440:66c5:26f4 with SMTP id 5b1f17b1804b1-442f4c3d3ddmr23417485e9.1.1747241940913;
        Wed, 14 May 2025 09:59:00 -0700 (PDT)
Message-ID: <fdc5b712-4c93-42b4-a1b7-d992c720c387@citrix.com>
Date: Wed, 14 May 2025 17:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/22] xen/lib: add implementation of SHA-1
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <7fcab16c3efbc0eb28e0f8ec0d9c9d3188881ad4.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7fcab16c3efbc0eb28e0f8ec0d9c9d3188881ad4.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/05/2025 6:05 pm, Sergii Dmytruk wrote:
> diff --git a/xen/include/xen/sha1.h b/xen/include/xen/sha1.h
> new file mode 100644
> index 0000000000..085f750a6a
> --- /dev/null
> +++ b/xen/include/xen/sha1.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef XEN__SHA1_H
> +#define XEN__SHA1_H
> +
> +#include <xen/inttypes.h>

Please crib from sha2.h as much as you can.  Use xen/types.h, drop the
double underscore in the guard, and provide a link to the spec.

I think it's https://csrc.nist.gov/pubs/fips/180-1/final

The rest of the header is fine; I don't think we need split-update()
support yet.

> +
> +#define SHA1_DIGEST_SIZE  20
> +
> +void sha1_hash(uint8_t digest[SHA1_DIGEST_SIZE], const void *msg, size_t len);
> +
> +#endif /* XEN__SHA1_H */
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 5ccb1e5241..fd4b9ece63 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -17,6 +17,7 @@ lib-y += memset.o
>  lib-y += muldiv64.o
>  lib-y += parse-size.o
>  lib-y += rbtree.o
> +lib-$(CONFIG_X86) += sha1.o
>  lib-$(CONFIG_X86) += sha2-256.o
>  lib-y += sort.o
>  lib-y += strcasecmp.o
> diff --git a/xen/lib/sha1.c b/xen/lib/sha1.c
> new file mode 100644
> index 0000000000..c7a464e2cf
> --- /dev/null
> +++ b/xen/lib/sha1.c
> @@ -0,0 +1,218 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * SHA1 routine optimized to do word accesses rather than byte accesses,
> + * and to avoid unnecessary copies into the context array.
> + *
> + * This was based on the git SHA1 implementation.
> + */
> +
> +#include <xen/bitops.h>
> +#include <xen/sha1.h>
> +#include <xen/string.h>
> +#include <xen/types.h>
> +#include <xen/unaligned.h>
> +
> +/*
> + * If you have 32 registers or more, the compiler can (and should)
> + * try to change the array[] accesses into registers. However, on
> + * machines with less than ~25 registers, that won't really work,
> + * and at least GCC will make an unholy mess of it.
> + *
> + * So to avoid that mess which just slows things down, we force
> + * the stores to memory to actually happen (we might be better off
> + * with a 'W(t)=(val);asm("":"+m" (W(t))' there instead, as
> + * suggested by Artur Skawina - that will also make GCC unable to
> + * try to do the silly "optimize away loads" part because it won't
> + * see what the value will be).
> + *
> + * Ben Herrenschmidt reports that on PPC, the C version comes close
> + * to the optimized asm with this (ie on PPC you don't want that
> + * 'volatile', since there are lots of registers).
> + *
> + * On ARM we get the best code generation by forcing a full memory barrier
> + * between each SHA round, otherwise GCC happily gets wild with spilling and
> + * the stack frame size simply explode and performance goes down the drain.
> + */
> +
> +#define SHA1_BLOCK_SIZE         64
> +#define SHA1_WORKSPACE_WORDS    16
> +#define SHA1_WORKSPACE_MASK     (SHA1_WORKSPACE_WORDS - 1)
> +
> +struct sha1_state {
> +    uint32_t state[SHA1_DIGEST_SIZE / 4];
> +    uint64_t count;
> +    uint8_t buffer[SHA1_BLOCK_SIZE];
> +};

As it's uint64_t, the count field needs to be first to avoid padding.

> +
> +/* This "rolls" over the 512-bit array */
> +static void set_w(uint32_t w[SHA1_WORKSPACE_WORDS], size_t i, uint32_t val)
> +{
> +#ifdef CONFIG_X86
> +    *(volatile uint32_t *)&w[i & SHA1_WORKSPACE_MASK] = val;
> +#else
> +    w[i & SHA1_WORKSPACE_MASK] = val;
> +# ifdef CONFIG_ARM
> +    barrier();
> +# endif
> +#endif

This is horrible.  I think the problems discussed are created by having
the loops in sha1_transform() broken in a wrong (read, unhelpful) way.  
The 5-way shuffle of the chaining variables probably is beyond the
compilers' ability to unroll given the multiples of 4 currently used.

See the implementation in SKL where I spent a while optimising the code
generation.  Admittedly that was optimising for size rather than speed,
but the end result look to be good for both.

> +}
> +
> +static uint32_t blend(const uint32_t w[SHA1_WORKSPACE_WORDS], size_t i)
> +{
> +/* This "rolls" over the 512-bit array */
> +#define w(i) w[(i) & SHA1_WORKSPACE_MASK]
> +
> +    return rol32(w(i + 13) ^ w(i + 8) ^ w(i + 2) ^ w(i), 1);
> +
> +#undef w
> +}
> +
> +/**
> + * sha1_transform - single block SHA1 transform
> + *
> + * @digest: 160 bit digest to update
> + * @data:   512 bits of data to hash
> + *
> + * This function executes SHA-1's internal compression function.  It updates the
> + * 160-bit internal state (@digest) with a single 512-bit data block (@data).
> + */
> +static void sha1_transform(uint32_t *digest, const uint8_t *data)
> +{
> +    uint32_t a, b, c, d, e, t;
> +    uint32_t workspace[SHA1_WORKSPACE_WORDS];
> +    unsigned int i = 0;
> +
> +    a = digest[0];
> +    b = digest[1];
> +    c = digest[2];
> +    d = digest[3];
> +    e = digest[4];
> +
> +    /* Round 1 - iterations 0-16 take their input from 'data' */
> +    for ( ; i < 16; ++i ) {

Xen style has this { on the next line.

> +        t = get_unaligned_be32((uint32_t *)data + i);
> +        set_w(workspace, i, t);
> +        e += t + rol32(a, 5) + (((c ^ d) & b) ^ d) + 0x5a827999U;
> +        b = ror32(b, 2);
> +        t = e; e = d; d = c; c = b; b = a; a = t;
> +    }
> +
> +    /* Round 1 - tail. Input from 512-bit mixing array */
> +    for ( ; i < 20; ++i ) {
> +        t = blend(workspace, i);
> +        set_w(workspace, i, t);
> +        e += t + rol32(a, 5) + (((c ^ d) & b) ^ d) + 0x5a827999U;
> +        b = ror32(b, 2);
> +        t = e; e = d; d = c; c = b; b = a; a = t;
> +    }
> +
> +    /* Round 2 */
> +    for ( ; i < 40; ++i ) {
> +        t = blend(workspace, i);
> +        set_w(workspace, i, t);
> +        e += t + rol32(a, 5) + (b ^ c ^ d) + 0x6ed9eba1U;
> +        b = ror32(b, 2);
> +        t = e; e = d; d = c; c = b; b = a; a = t;
> +    }
> +
> +    /* Round 3 */
> +    for ( ; i < 60; ++i ) {
> +        t = blend(workspace, i);
> +        set_w(workspace, i, t);
> +        e += t + rol32(a, 5) + ((b & c) + (d & (b ^ c))) + 0x8f1bbcdcU;
> +        b = ror32(b, 2);
> +        t = e; e = d; d = c; c = b; b = a; a = t;
> +    }
> +
> +    /* Round 4 */
> +    for ( ; i < 80; ++i ) {
> +        t = blend(workspace, i);
> +        set_w(workspace, i, t);
> +        e += t + rol32(a, 5) + (b ^ c ^ d) + 0xca62c1d6U;
> +        b = ror32(b, 2);
> +        t = e; e = d; d = c; c = b; b = a; a = t;
> +    }
> +
> +    digest[0] += a;
> +    digest[1] += b;
> +    digest[2] += c;
> +    digest[3] += d;
> +    digest[4] += e;
> +}
> +
> +static void sha1_init(struct sha1_state *sctx)
> +{
> +    sctx->state[0] = 0x67452301UL;
> +    sctx->state[1] = 0xefcdab89UL;
> +    sctx->state[2] = 0x98badcfeUL;
> +    sctx->state[3] = 0x10325476UL;
> +    sctx->state[4] = 0xc3d2e1f0UL;
> +    sctx->count = 0;
> +}
> +
> +static void sha1_update(struct sha1_state *sctx, const uint8_t *msg, size_t len)
> +{
> +    unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
> +
> +    sctx->count += len;
> +
> +    if ( (partial + len) >= SHA1_BLOCK_SIZE )
> +    {
> +        if ( partial )
> +        {
> +            int rem = SHA1_BLOCK_SIZE - partial;

Unsigned int please.

> +
> +            memcpy(sctx->buffer + partial, msg, rem);
> +            msg += rem;
> +            len -= rem;
> +
> +            sha1_transform(sctx->state, sctx->buffer);
> +        }
> +
> +        for ( ; len >= SHA1_BLOCK_SIZE; len -= SHA1_BLOCK_SIZE )
> +        {
> +            sha1_transform(sctx->state, msg);
> +            msg += SHA1_BLOCK_SIZE;
> +        }
> +        partial = 0;
> +    }
> +
> +    /* Remaining data becomes partial. */
> +    memcpy(sctx->buffer + partial, msg, len);
> +}
> +
> +static void sha1_final(struct sha1_state *sctx, void *out)

Please make this uint8_t digest[SHA1_DIGEST_SIZE] straight away.  This
was an oversight of mine in sha2-256.c which was fixed when exposing the
function (c/s aea52ce607fe).

~Andrew

