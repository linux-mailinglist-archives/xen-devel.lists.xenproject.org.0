Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0606A8AE0D5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 11:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710477.1109720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzCH3-0002XZ-Gu; Tue, 23 Apr 2024 09:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710477.1109720; Tue, 23 Apr 2024 09:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzCH3-0002W2-E7; Tue, 23 Apr 2024 09:17:13 +0000
Received: by outflank-mailman (input) for mailman id 710477;
 Tue, 23 Apr 2024 09:17:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzCH2-0002Vw-Pt
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 09:17:12 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 433285c3-0152-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 11:17:10 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3499f1bed15so3502339f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 02:17:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n4-20020a5d4844000000b00349f098f4a6sm13989478wrs.53.2024.04.23.02.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 02:17:08 -0700 (PDT)
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
X-Inumbo-ID: 433285c3-0152-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713863829; x=1714468629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElYP5uT2Ra53Z2pSCuJPUGQUN+STqgqHRQyM1On+6Ic=;
        b=GqVbDg3f8G0+2sEym2T/eQptQeSb8xpt7P+kBtCHixsTW6306X9jhNZOlTj2e+j4PX
         lA50JwqHxptYIZea49T1Y3eiPKDRKnfSzd8B+d7u2bIqHZMGvGIoZ5TTbr6uiABuF8ih
         RDmiJmF5rGpIBfURlFghSLfyYn4mBylM5ITAeHVyZoylp0a2eJxFycAGlHZnnXYGVme3
         lRtnzch9fHjwl07l/OD/iB/+J8YNabAW3pcskdqxhAcLguV+TST74CC9rIrhOMF3df+b
         wYWD7sXdCW5I8nQBD5+//jPiRQQxXE1Y4Ku9Cj5DRAOx+uaY4tPO+oUkIsBueAlg90Eo
         TAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713863829; x=1714468629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElYP5uT2Ra53Z2pSCuJPUGQUN+STqgqHRQyM1On+6Ic=;
        b=YybpCotvgMBwJndWYxoppZu8XsAgbiv/M/+Dkn3ou5PbEB5hHNbqOwgmZNlNyOwLFJ
         Erqj3VYIdfylSvnZlpnIMMJSE42cC96vBNtn6qb1+39LVxAJ98uv59UwvEyhLmAO1Zkp
         tdNLh5xEynodRwEC3JwjRXGw6LU2rGyAMB+8ti6vwzu2lAImKkEL0aVX9pw4F7X2radt
         WAGF5Ow+mUKyxnEgpm0VRcBQix83GqoYOt8KM66dbipqItIB2IjWb+gmou2ApGdTWDyP
         1050fWuTTCgNz8mYcao1bJfs+VDtp+WBGMbDH8I20u7HP6IdWkN2gLvA7XobAjZrFAQO
         X6kw==
X-Forwarded-Encrypted: i=1; AJvYcCXxXkskQ7cUshOI/60w8q8qcpeC8BhMb89Nt+xNY2Sl09krsV647yOJcHoN02m7OHEV6oe21LLLJxm/8dv0tScK9wWSRe19WHvzpoPsSxU=
X-Gm-Message-State: AOJu0Yzw5AMn0sf3ncKF4UL98TG6GUCkn6a2ZbsCFRwgYWxCBY+WIrdz
	JYcRJU/nhylxVi4PnjRzykKmDqziJAQAgnw6/AdNtJzxJ78pest2UPPQMzaL7SGQfgtparjStyw
	=
X-Google-Smtp-Source: AGHT+IFLwWnSB5Ysq6k295Bk96JFMJw783dtX5WvkrK5N6le91V1vD6aO00OtGW9DAXT3FEVAIVPEQ==
X-Received: by 2002:adf:fec6:0:b0:349:af80:9b67 with SMTP id q6-20020adffec6000000b00349af809b67mr1127838wrs.30.1713863829253;
        Tue, 23 Apr 2024 02:17:09 -0700 (PDT)
Message-ID: <e5a14d99-4141-410e-a39c-c38b294a553b@suse.com>
Date: Tue, 23 Apr 2024 11:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86: Introduce x86_decode_lite()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240422181434.3463252-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2024 20:14, Andrew Cooper wrote:
> In order to relocate all IP-relative fields in an alternative replacement
> block, we need to decode the instructions enough to obtain their length and
> any relative fields.
> 
> Full x86_decode() is far too heavyweight, so introduce a minimal form which
> can make several simplifying assumptions.
> 
> This logic is sufficient to decode all alternative blocks that exist in Xen
> right now.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> --- a/xen/arch/x86/x86_emulate/Makefile
> +++ b/xen/arch/x86/x86_emulate/Makefile
> @@ -3,6 +3,7 @@ obj-y += 0fae.o
>  obj-y += 0fc7.o
>  obj-y += blk.o
>  obj-y += decode.o
> +obj-y += decode-lite.o

When LIVEPATCH=n, this could do with conversion to *.init.o, like is
done in the parent directory for alternative.c as well.

> --- /dev/null
> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
> @@ -0,0 +1,245 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include "private.h"
> +
> +#define Imm8   (1 << 0)
> +#define Imm    (1 << 1)
> +#define Branch (1 << 5) /* ... that we care about */
> +/*      ModRM  (1 << 6) */
> +#define Known  (1 << 7)
> +
> +#define ALU_OPS                                 \
> +    (Known|ModRM),                              \
> +    (Known|ModRM),                              \
> +    (Known|ModRM),                              \
> +    (Known|ModRM),                              \
> +    (Known|Imm8),                               \
> +    (Known|Imm)
> +
> +static const uint8_t init_or_livepatch_const onebyte[256] = {
> +    [0x00] = ALU_OPS, /* ADD */ [0x08] = ALU_OPS, /* OR  */
> +    [0x10] = ALU_OPS, /* ADC */ [0x18] = ALU_OPS, /* SBB */
> +    [0x20] = ALU_OPS, /* AND */ [0x28] = ALU_OPS, /* SUB */
> +    [0x30] = ALU_OPS, /* XOR */ [0x38] = ALU_OPS, /* CMP */
> +
> +    [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
> +
> +    [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
> +    [0x80]          = (Known|ModRM|Imm8),
> +    [0x81]          = (Known|ModRM|Imm),
> +
> +    [0x83]          = (Known|ModRM|Imm8),
> +    [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA r/rm */
> +
> +    [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */

I'm surprised you get away without at least NOP also marked as known.
Imo the whole 0x90 row should be marked so.

Similarly I'm not convinced that leaving the 0xA0 row unpopulated is a
good idea. It's at best a trap set up for somebody to fall into rather
sooner than later.

> +    [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm32, %reg */
> +
> +    [0xcc]          = (Known),             /* INT3 */
> +    [0xcd]          = (Known|Imm8),        /* INT $imm8 */

Like above, what about in particular any of the shifts/rotates and the
MOV that's in the 0xC0 row?

While the last sentence in the description is likely meant to cover
that, I think the description wants to go further as to any pretty
common but omitted insns. Already "x86: re-work memset()" and "x86: re-
work memcpy()" (v2 pending for, soon, 3 years) would make it necessary
to touch this table, thus increasing complexity of those changes to an
area they shouldn't be concerned about at all.

> +    [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
> +    [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */

0xe0 ... 0xe7 and 0xec ... 0xef would imo also better be covered, as
they easily can be (much like you also cover e.g. CMC despite it
appearing pretty unlikely that we use that insn anywhere).

> +    [0xf1]          = (Known),             /* ICEBP */
> +    [0xf4]          = (Known),             /* HLT */
> +    [0xf5]          = (Known),             /* CMC */
> +    [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3 */
> +    [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
> +    [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
> +};
> +static const uint8_t init_or_livepatch_const twobyte[256] = {
> +    [0x00 ... 0x01] = (Known|ModRM),       /* Grp6/Grp7 */

LAR / LSL? CLTS? WBINVD? UD2?

> +    [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
> +
> +    [0x20 ... 0x23] = (Known|ModRM),       /* MOV CR/DR */
> +
> +    [0x30 ... 0x34] = (Known),             /* WRMSR ... RDPMC */

0x34 is SYSENTER, isn't it?

> +    [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
> +
> +    [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */

What about things like VMREAD/VMWRITE?

> +    [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */

PUSH/POP fs/gs? CPUID?

> +    [0xab]          = (Known|ModRM),       /* BTS */

BTS (and BTC below) but not BT and BTR?

> +    [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
> +    [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl / Grp15 / IMUL */

SHRD but not SHLD?

CMPXCHG?

> +    [0xb8 ... 0xb9] = (Known|ModRM),       /* POPCNT/Grp10 (UD1) */
> +    [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
> +    [0xbb ... 0xbf] = (Known|ModRM),       /* BSR/BSF/BSR/MOVSX */

Nit (comment only): 0xbb is BTC.

MOVSX but not MOVZX and also not MOVSXD (in the 1-byte table)?

> +};

XADD, MOVNTI, and the whole 0xc7-based group?

> +/*
> + * Bare minimum x86 instruction decoder to parse the alternative replacement
> + * instructions and locate the IP-relative references that may need updating.
> + *
> + * These are:
> + *  - disp8/32 from near branches
> + *  - RIP-relative memory references
> + *
> + * The following simplifications are used:
> + *  - All code is 64bit, and the instruction stream is safe to read.

This, in particular, is imo important to state already ahead of the tables
above, to clarify why e.g. row 0x40 is unpopulated.

> + *  - The 67 prefix is not implemented, so the address size is only 64bit.
> + *
> + * Inputs:
> + *  @ip  The position to start decoding from.
> + *  @end End of the replacement block.  Exceeding this is considered an error.
> + *
> + * Returns: x86_decode_lite_t
> + *  - On failure, length of -1.
> + *  - On success, length > 0 and REL_TYPE_*.  For REL_TYPE != NONE, rel points
> + *    at the relative field in the instruction stream.
> + */
> +x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)
> +{
> +    void *start = ip, *rel = NULL;
> +    unsigned int opc, type = REL_TYPE_NONE;
> +    uint8_t b, d, osize = 4;
> +
> +#define OPC_TWOBYTE (1 << 8)
> +
> +    /* Mutates IP, uses END. */
> +#define FETCH(ty)                                       \
> +    ({                                                  \
> +        ty _val;                                        \
> +                                                        \
> +        if ( (ip + sizeof(ty)) > end )                  \
> +            goto overrun;                               \
> +        _val = *(ty *)ip;                               \
> +        ip += sizeof(ty);                               \
> +        _val;                                           \
> +    })
> +
> +    for ( ;; ) /* Prefixes */
> +    {
> +        switch ( b = FETCH(uint8_t) )
> +        {
> +        case 0x26: /* ES override */
> +        case 0x2e: /* CS override */
> +        case 0x36: /* DS override */
> +        case 0x3e: /* SS override */
> +        case 0x64: /* FS override */
> +        case 0x65: /* GS override */
> +        case 0xf0: /* Lock */
> +        case 0xf2: /* REPNE */
> +        case 0xf3: /* REP */
> +            break;
> +
> +        case 0x66: /* Operand size override */
> +            osize = 2;
> +            break;
> +
> +        /* case 0x67: Address size override, not implemented */
> +
> +        case 0x40 ... 0x4f: /* REX */
> +            continue;

Imo at least a comment is needed as to osize here: We don't use 0x66
followed by REX.W, I suppose, when 0x66 determines operand size. It
may also be an opcode extension, though, in which case osize set to
2 is (latently) wrong. "Latently" because all you need osize for is
to determine Imm's length.

However, what I again think need covering right away are opcodes
0xb8 ... 0xbc in combination with REX.W (osize needing to be 8 there).

Finally - why "continue" here, but "break" further up? Both (right
now) have exactly the same effect.

> +        default:
> +            goto prefixes_done;
> +        }
> +    }
> + prefixes_done:
> +
> +    /* Fetch the main opcode byte(s) */
> +    if ( b == 0x0f )
> +    {
> +        b = FETCH(uint8_t);
> +        opc = OPC_TWOBYTE | b;
> +
> +        d = twobyte[b];
> +    }
> +    else
> +    {
> +        opc = b;
> +        d = onebyte[b];
> +    }

IOW GPR insns in 0f38 and 0f3a spaces are left out, too. That's perhaps
less of an issue than some of the other omissions (and would be more
involved to cover when considering that some of them are VEX-encoded),
but still not ideal.

> +    if ( unlikely(!(d & Known)) )
> +        goto unknown;
> +
> +    if ( d & ModRM )
> +    {
> +        uint8_t modrm = FETCH(uint8_t);
> +        uint8_t mod = modrm >> 6;
> +        uint8_t reg = (modrm >> 3) & 7;
> +        uint8_t rm = modrm & 7;
> +
> +        /* ModRM/SIB decode */
> +        if ( mod == 0 && rm == 5 ) /* RIP relative */
> +        {
> +            rel = ip;
> +            type = REL_TYPE_d32;
> +            FETCH(uint32_t);
> +        }
> +        else if ( mod != 3 && rm == 4 ) /* SIB */
> +            FETCH(uint8_t);
> +
> +        if ( mod == 1 ) /* disp8 */
> +            FETCH(uint8_t);
> +        else if ( mod == 2 ) /* disp32 */
> +            FETCH(uint32_t);
> +
> +        /* ModRM based decode adjustements */
> +        switch ( opc )
> +        {
> +        case 0xf6: /* Grp3 TEST(s) have extra Imm8 */
> +            if ( reg == 0 || reg == 1 )
> +                d |= Imm8;
> +            break;
> +        case 0xf7: /* Grp3 TEST(s) have extra Imm */
> +            if ( reg == 0 || reg == 1 )
> +                d |= Imm;
> +            break;
> +        }
> +    }
> +
> +    if ( d & Branch )
> +    {
> +        /*
> +         * Don't tolerate 66-prefixed call/jmp in alternatives.  Some are
> +         * genuinely decoded differently between Intel and AMD CPUs.
> +         */
> +        if ( osize != 4 )
> +            goto bad_osize;
> +
> +        rel = ip;
> +        type = (d & Imm8) ? REL_TYPE_d8 : REL_TYPE_d32;

Perhaps ASSERT(!rel) and/or ASSERT(!type) ahead of these?

> +    }
> +
> +    if ( d & (Imm|Imm8) )
> +    {
> +        if ( d & Imm8 )
> +            osize = 1;
> +
> +        switch ( osize )
> +        {
> +        case 1: FETCH(uint8_t);  break;
> +        case 2: FETCH(uint16_t); break;
> +        case 4: FETCH(uint32_t); break;
> +        default: goto bad_osize;
> +        }
> +    }
> +
> +    return (x86_decode_lite_t){ ip - start, type, rel };
> +
> + bad_osize:
> +    printk(XENLOG_ERR "%s() Bad osize %u in %*ph\n",
> +           __func__, osize,
> +           (int)(unsigned long)(end - start), start);
> +    return (x86_decode_lite_t){ -1, REL_TYPE_NONE, NULL };

Maybe limit opcode quoting to ip - start here?

> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -9,7 +9,9 @@
>  #ifdef __XEN__
>  
>  # include <xen/bug.h>
> +# include <xen/init.h>
>  # include <xen/kernel.h>
> +# include <xen/livepatch.h>

Are both of these really needed here, rather than just in decode-lite.c?

> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -842,4 +842,21 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
>      ctxt->event = (struct x86_event){};
>  }
>  
> +/*
> + * x86_decode_lite().  Very minimal decoder for managing alternatives.
> + *
> + * @len is -1 on error, or positive on success.  If the instruction has a
> + * relative field, REL_TYPE_* gives the size, and @rel points at the field.
> + */
> +typedef struct {
> +    int8_t len;

Can't 0 be "error", thus permitting the field to be uint8_t?

> +    uint8_t rel_type;
> +#define REL_TYPE_NONE 0
> +#define REL_TYPE_d8   1
> +#define REL_TYPE_d32  2

Why not call the field rel_size and truly pass back the size?

> +    void *rel;

While I understand the goal of omitting const here and ...

> +} x86_decode_lite_t;
> +
> +x86_decode_lite_t x86_decode_lite(void *ip, void *end);

... here, I still find this fragile / misleading (the function itself, after
all, only ever fetches from memory). Even with the goal in mind, surely at
least "end" can be pointer-to-const?

The (struct) return type would also be easier for the compiler to deal
with if it didn't have a pointer field (and hence needs to be 128-bit). How
about returning an offset relative to "start"? That would then allow proper
constifying of both function parameters as well.

Jan

