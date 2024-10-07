Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB1992C69
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 14:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811973.1224634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxnI9-0006op-3u; Mon, 07 Oct 2024 12:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811973.1224634; Mon, 07 Oct 2024 12:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxnI9-0006k8-0h; Mon, 07 Oct 2024 12:56:49 +0000
Received: by outflank-mailman (input) for mailman id 811973;
 Mon, 07 Oct 2024 12:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sxnI7-0006c1-Iv
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 12:56:47 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b403ee7-84ab-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 14:56:45 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fabd2c4ac0so46558431fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 05:56:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05aa730sm3154868a12.36.2024.10.07.05.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 05:56:44 -0700 (PDT)
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
X-Inumbo-ID: 9b403ee7-84ab-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728305804; x=1728910604; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l5rHd8j7SQtWo0/HDn0HELBYlIhnDhpmKYqeRzmVZ+w=;
        b=Gl5SR2KuMm+wrm0YWF57YFAUsOm9lpUfm0tpYTZPFNFfJEvSE9+MUxTvdEuJvytkec
         XUp1ie7iQEBTFnn9v0wfmNthIG7exl9f0p7AOZk8lEJ4PSDREJAEuukTU39cjlonBGls
         7hnJB6Me2Aek9RUVph3/m0rFT9CtPJy69hLJ0+LBkkRDRDk5NohcE07Cplr/juxmxHK4
         JK9cB2abtyRc5dTlH0r/4gXUJzTGS2LQ12T2Jwqe+Jl3qNF8fz1NwfYv6YW8Inw5jRwW
         /YnAv7izMLqxADN8eLz0EU7s6IqwHoeB5TG6mLvoU9+yK5/9KBpFvcTXOfL+jLesQXOq
         DU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728305804; x=1728910604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5rHd8j7SQtWo0/HDn0HELBYlIhnDhpmKYqeRzmVZ+w=;
        b=DCHQgyQ/d2AqTjed8Mek7amRy43MWtIfIYUAjkAiNq8FC7OB3b2IXqaO319V67CIGt
         PAE0iyQ+67nrp6xZvG4PYtF8tsyfzy7M/vCp75VMtSnAfEobb7bvVUXJrQIBEJ/0UpVx
         r8qbprZcWrdzQHJNQC3JK4wvzw0v3yLFx2ken54KO6TUut3s4VYPmC6CzGbuQ55d66mm
         DIDZg0Lnif5W3aRWZE+4sV7Vg0E9sacqkccpB3DajWXDfLz+bHY0mm00W68EmMMjmi3I
         gCjAzcGs/PVvqYyc7pUph4fIe4d8rsjmaWDeS/etcHQykOAlViB2vwc+WsZW7Ro8Qtfy
         r/kw==
X-Forwarded-Encrypted: i=1; AJvYcCWq/tnKCsOSTrBxrJ8jzKEak+HbXO9WXukQiG5SR+gdNOMlgkTkYicwCGNva87qC4B9g2Ls5ukms80=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKxtOJN1uhoEQd9rkqD1uQPRYDuaJa/hjHUmucia5ugKBCaEDt
	efJQgjXukOjasbjc+wy5SqY5v7WygqlTHUySlBdAdoFXr6WnyIjzxSx2ElWHeg==
X-Google-Smtp-Source: AGHT+IHQuhaZMa4UP1pTIdanpAjT+7YEeHm2TfiibS3L4BDUR/l+kjM7CeuwOuOoITr62P2fbSERJQ==
X-Received: by 2002:a05:651c:2225:b0:2fa:c9eb:53ce with SMTP id 38308e7fff4ca-2faf3c740b1mr55222931fa.26.1728305804352;
        Mon, 07 Oct 2024 05:56:44 -0700 (PDT)
Message-ID: <82d6f3a3-b3bf-4e4b-bf5c-39f5b857897a@suse.com>
Date: Mon, 7 Oct 2024 14:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86: Introduce x86_decode_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
 <20241002152725.1841575-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241002152725.1841575-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.10.2024 17:27, Andrew Cooper wrote:
> --- /dev/null
> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
> @@ -0,0 +1,311 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include "private.h"
> +
> +#define Imm8   (1 << 0)
> +#define Imm    (1 << 1)
> +#define Moffs  (1 << 2)
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
> +/*  [0x40 ... 0x4f] = REX prefixes */

For these and other aspects further down, may I ask for a comment at the
top of the file setting the scope for this new function (and its
associated data) as being strictly 64-bit only? And perhaps even strictly
covering only what Xen may legitimately use (largely excluding APX for
the foreseeable future, i.e. until such time that we might decide to
allow Xen itself to use APX throughout its code).

Besides APX, with more immediate uses in mind, I wonder about e.g.
BMI/BMI2 insns, which live outside the one/two-byte maps.

I would further appreciate if we could be consistent with the mentioning
(or not) of prefixes: The REX ones here are the only ones that the table
mentions right now. In fact I wonder whether a Prefix attribute wouldn't
be nice to have, so you don't need to open-code all of them in the
function itself.

> +    [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
> +
> +    [0x63]          = (Known|ModRM),       /* MOVSxd */
> +
> +    [0x68]          = (Known|Imm),         /* PUSH $imm */
> +    [0x69]          = (Known|ModRM|Imm),   /* IMUL $imm/r/rm */
> +    [0x6a]          = (Known|Imm8),        /* PUSH $imm8 */
> +    [0x6b]          = (Known|ModRM|Imm8),  /* PUSH $imm8/r/rm */

IMUL? I'm also slightly irritated by $imm{,8}/r/rm - better to use commas
to separate operands, and then rm is the middle one (2nd source) while r
is the destination (last), if already you want AT&T operand order.

> +    [0x6c ... 0x6f] = (Known),             /* INS/OUTS */
> +
> +    [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
> +    [0x80]          = (Known|ModRM|Imm8),  /* Grp1 */
> +    [0x81]          = (Known|ModRM|Imm),   /* Grp1 */
> +
> +    [0x83]          = (Known|ModRM|Imm8),  /* Grp1 */
> +    [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA r/rm */
> +
> +    [0x90 ... 0x99] = (Known),             /* NOP/XCHG rAX/CLTQ/CQTO */

Omitting PUSH (at 0x8f) is somewhat odd, considering that it's a pretty
"normal" insn.

> +    [0x9b ... 0x9f] = (Known),             /* FWAIT/PUSHF/POPF/SAHF/LAHF */
> +
> +    [0xa0 ... 0xa3] = (Known|Moffs),       /* MOVABS */
> +    [0xa4 ... 0xa7] = (Known),             /* MOVS/CMPS */
> +    [0xa8]          = (Known|Imm8),        /* TEST %al */
> +    [0xa9]          = (Known|Imm),         /* TEST %al */

%rAX?

> +    [0xaa ... 0xaf] = (Known),             /* STOS/LODS/SCAS */
> +    [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
> +    [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm{16,32,64}, %reg */
> +    [0xc0 ... 0xc1] = (Known|ModRM|Imm8),  /* Grp2 (ROL..SAR $imm8, %reg) */
> +
> +    [0xc3]          = (Known),             /* RET */

With the absence of Branch here I think it would be nice if at least the
description went into a little more detail as to the comment higher up
saying "... that we care about".

> +    [0xc6]          = (Known|ModRM|Imm8),  /* Grp11, Further ModRM decode */
> +    [0xc7]          = (Known|ModRM|Imm),   /* Grp11, Further ModRM decode */
> +
> +    [0xcb ... 0xcc] = (Known),             /* LRET/INT3 */
> +    [0xcd]          = (Known|Imm8),        /* INT $imm8 */

No IRET, when you have things like e.g. ICEBP and CLTS?

> +    [0xd0 ... 0xd3] = (Known|ModRM),       /* Grp2 (ROL..SAR {$1,%cl}, %reg) */
> +
> +    [0xe4 ... 0xe7] = (Known|Imm8),        /* IN/OUT $imm8 */
> +    [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
> +    [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */
> +    [0xec ... 0xef] = (Known),             /* IN/OUT %dx */
> +
> +    [0xf1]          = (Known),             /* ICEBP */
> +    [0xf4]          = (Known),             /* HLT */
> +    [0xf5]          = (Known),             /* CMC */
> +    [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3, Further ModRM decode */
> +    [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
> +    [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
> +};
> +static const uint8_t init_or_livepatch_const twobyte[256] = {
> +    [0x00 ... 0x03] = (Known|ModRM),       /* Grp6/Grp7/LAR/LSL */
> +    [0x06]          = (Known),             /* CLTS */
> +    [0x09]          = (Known),             /* WBINVD */
> +    [0x0b]          = (Known),             /* UD2 */
> +
> +    [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
> +    [0x20 ... 0x23] = (Known|ModRM),       /* MOV %cr/%dr */
> +
> +    [0x30 ... 0x33] = (Known),             /* WRMSR/RDTSC/RDMSR/RDPMC */
> +
> +    [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
> +
> +    [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */
> +    [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */
> +
> +    [0xa0 ... 0xa2] = (Known),             /* PUSH/POP %fs/CPUID */
> +    [0xa3]          = (Known|ModRM),       /* BT r/rm */
> +    [0xa4]          = (Known|ModRM|Imm8),  /* SHLD $imm8 */
> +    [0xa5]          = (Known|ModRM),       /* SHLD %cl */
> +
> +    [0xa8 ... 0xa9] = (Known),             /* PUSH/POP %gs */
> +
> +    [0xab]          = (Known|ModRM),       /* BTS */
> +    [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
> +    [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl/Grp15/IMUL */
> +
> +    [0xb0 ... 0xb9] = (Known|ModRM),       /* CMPXCHG/LSS/BTR/LFS/LGS/MOVZxx/POPCNT/Grp10 */

Grp10 is kind of odd - I think UD1 would be more concise, despite the SDM
indeed using group 10 there.

> +    [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
> +    [0xbb ... 0xbf] = (Known|ModRM),       /* BSR/BSF/BSR/MOVSX */

0xbb is BTC I think.

> +    [0xc0 ... 0xc1] = (Known|ModRM),       /* XADD */
> +    [0xc7]          = (Known|ModRM),       /* Grp9 */
> +    [0xc8 ... 0xcf] = (Known),             /* BSWAP */

With UD1 and UD2, perhaps UD0 would make sense to also have in the table?

> +};
> +
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
> + *  - The 67 prefix is not implemented, so the address size is only 64bit.

As to the earlier remark - maybe this part of the comment could simply
move to the top of the file?

> + * Inputs:
> + *  @ip  The position to start decoding from.
> + *  @end End of the replacement block.  Exceeding this is considered an error.
> + *
> + * Returns: x86_decode_lite_t
> + *  - On failure, length of 0.
> + *  - On success, length > 0.  For rel_sz > 0, rel points at the relative
> + *    field in the instruction stream.
> + */
> +x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)

Imo both pointers would be nice to be to-const.

> +{
> +    void *start = ip, *rel = NULL;
> +    unsigned int opc, rel_sz = 0;
> +    uint8_t b, d, rex = 0, osize = 4;
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

If you don't like the idea of a Prefix attribute I wonder in how far we
actually need all of the above, when you already ...

> +        case 0xf0: /* LOCK */
> +        case 0xf2: /* REPNE */
> +        case 0xf3: /* REP */
> +            break;
> +
> +        case 0x66: /* Operand size override */
> +            osize = 2;
> +            break;
> +
> +        /* case 0x67: Address size override, not implemented */

... deliberately leave of this one.

> +        case 0x40 ... 0x4f: /* REX */
> +            rex = b;
> +            continue;
> +
> +        default:
> +            goto prefixes_done;
> +        }
> +        rex = 0; /* REX cancelled by subsequent legacy prefix. */
> +    }
> + prefixes_done:
> +
> +    if ( rex & 0x08 ) /* REX.W */

Can you please use REX_W here?

> +        osize = 8;
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
> +
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
> +            rel_sz = 4;
> +            FETCH(uint32_t);
> +        }
> +        else if ( mod != 3 && rm == 4 ) /* SIB */
> +        {
> +            uint8_t sib = FETCH(uint8_t);
> +            uint8_t base = sib & 7;
> +
> +            if ( mod == 0 && base == 5 )
> +                goto disp32;
> +        }
> +
> +        if ( mod == 1 ) /* disp8 */
> +            FETCH(uint8_t);
> +        else if ( mod == 2 ) /* disp32 */
> +        {
> +        disp32:
> +            FETCH(uint32_t);

The values aren't used, so the types don't matter overly much, yet int8_t
and int32_t would be a more accurate representation of what's being
fetched.

> +        }
> +
> +        /* ModRM based decode adjustements */
> +        switch ( opc )
> +        {
> +        case 0xc7: /* Grp11 XBEGIN is a branch. */
> +            if ( modrm == 0xf8 )
> +                d |= Branch;
> +            break;
> +        case 0xf6: /* Grp3 TEST(s) have extra Imm8 */
> +            if ( reg == 0 || reg == 1 )
> +                d |= Imm8;
> +            break;
> +        case 0xf7: /* Grp3 TEST(s) have extra Imm */
> +            if ( reg == 0 || reg == 1 )
> +                d |= Imm;
> +            break;
> +        }

In this switch() you don't distinguish 1- and 2-byte maps at all. This
is an issue in particular for 0xc7.

Blank lines between case blocks would also be nice, as this switch() is
going to only ever grow.

> +    }
> +
> +    if ( d & Branch )
> +    {
> +        /*
> +         * We don't tolerate 66-prefixed call/jmp in alternatives.  Some are
> +         * genuinely decoded differently between Intel and AMD CPUs.
> +         *
> +         * We also don't support APX instructions, so don't have to cope with
> +         * JMPABS which is the first branch to have an 8-byte immediate.
> +         */
> +        if ( osize < 4 )
> +            goto bad_osize;
> +
> +        rel = ip;
> +        rel_sz = (d & Imm8) ? 1 : 4;
> +    }
> +
> +    if ( d & (Imm | Imm8 | Moffs) )
> +    {
> +        if ( d & Imm8 )
> +            osize = 1;
> +        else if ( d & Moffs )
> +            osize = 8;
> +        else if ( osize == 8 && !(opc >= 0xb8 && opc <= 0xbf) )

Again want to also take the opcode map into account, even if - by luck -
this would work as is for now.

Also could I talk you into converting the two comparisons into one, along
the lines of "(opc | 7) != 0xbf"?

> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -9,7 +9,9 @@
>  #ifdef __XEN__
>  
>  # include <xen/bug.h>
> +# include <xen/init.h>
>  # include <xen/kernel.h>
> +# include <xen/livepatch.h>
>  # include <asm/endbr.h>
>  # include <asm/msr-index.h>
>  # include <asm/x86-vendors.h>

It's only the new file that needs these - can we limit the dependencies
to just that one by putting these new #include-s there?

Jan

