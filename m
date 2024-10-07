Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F3F9934B9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 19:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812255.1224994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxrMf-0002cW-8E; Mon, 07 Oct 2024 17:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812255.1224994; Mon, 07 Oct 2024 17:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxrMf-0002aJ-4e; Mon, 07 Oct 2024 17:17:45 +0000
Received: by outflank-mailman (input) for mailman id 812255;
 Mon, 07 Oct 2024 17:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arWC=RD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sxrMd-0002Zu-0b
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 17:17:43 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ea4cc24-84d0-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 19:17:40 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9932aa108cso385427066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 10:17:40 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99501181a6sm198410266b.139.2024.10.07.10.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 10:17:39 -0700 (PDT)
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
X-Inumbo-ID: 0ea4cc24-84d0-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728321460; x=1728926260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pnYbBSFeug3l/M+BpSP9PM1bv9hDXAFVFf88pRbo3RY=;
        b=eY9kjghQatM4rcx/MNokhyVEE0UCq07kLg+Bi0e+tDTqF2DrqVYIg0P+feGm4cDssh
         mdCY6VylU5rsBcYc6gXtCjJUYwhdFP+oYQYmzc7ENmWFr3JYj56sNsFrneFwphuC5ymK
         8KZDI5nqDfOnXoIvYwtGKr5b+KER4GuRB5MRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728321460; x=1728926260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnYbBSFeug3l/M+BpSP9PM1bv9hDXAFVFf88pRbo3RY=;
        b=MgOtPIzz0xgQVl/HE+ZJYdKbmRddoNWoPFK+DPicy+ix4yh6MhHKVEsZ43YiloSapC
         q0FDEpjhy8piax48JLVV/VC1k6PNcWzbadt22D92BHYd4dcow48J/pMXSps3KkaR9AvS
         9Op+MCor1ggKke+B6a7SJng5BKpPnbGCuYeyA/UpI6x+s4H7yEqDXqvpB7DRSVoN6bZt
         rI0F7RhC1FdB9UmN/lCTtLBnsIR5bVBHJK93Q3KQ4QyM0bjM3pyMfIoohPKNsSCfjV5I
         WLubpzKkNLu9HWcUe1p8T+1xt46hAmW2Fylm4ez+T8Ey5ddxKkI8+CqUqGONLPX/4jQ+
         ZqPg==
X-Forwarded-Encrypted: i=1; AJvYcCV2KNe9bRs1cuynkn5DWR0ZwDIJ89m6ZElVsbmgcYUp6v7bjxE9PR2OCCL9u/7kR9pkd5jnJFNr98I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqLd77zgjkf/CeLHHKWLKYDTDKM3A9aKL0oyO53l/wDwOg81zE
	ELDHDus4N1BT4nLewUucVITEEunQjBDhyPA7c1BZpGGZf2fzo7POYSrJOaKRHAo=
X-Google-Smtp-Source: AGHT+IExTs0BhJWgd+zyZFZEi05/ok5Keasq0OSLCH5tLD6pVVmO6Mq29r3mZDyCFnVdY4AS/1VMsg==
X-Received: by 2002:a17:907:7288:b0:a86:7cac:f871 with SMTP id a640c23a62f3a-a991c01a735mr1528698466b.54.1728321459924;
        Mon, 07 Oct 2024 10:17:39 -0700 (PDT)
Message-ID: <c83b550f-9cba-4ae5-a887-6a962588df88@citrix.com>
Date: Mon, 7 Oct 2024 18:17:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86: Introduce x86_decode_lite()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
 <20241002152725.1841575-2-andrew.cooper3@citrix.com>
 <82d6f3a3-b3bf-4e4b-bf5c-39f5b857897a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <82d6f3a3-b3bf-4e4b-bf5c-39f5b857897a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/10/2024 1:56 pm, Jan Beulich wrote:
> On 02.10.2024 17:27, Andrew Cooper wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
>> @@ -0,0 +1,311 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include "private.h"
>> +
>> +#define Imm8   (1 << 0)
>> +#define Imm    (1 << 1)
>> +#define Moffs  (1 << 2)
>> +#define Branch (1 << 5) /* ... that we care about */
>> +/*      ModRM  (1 << 6) */
>> +#define Known  (1 << 7)
>> +
>> +#define ALU_OPS                                 \
>> +    (Known|ModRM),                              \
>> +    (Known|ModRM),                              \
>> +    (Known|ModRM),                              \
>> +    (Known|ModRM),                              \
>> +    (Known|Imm8),                               \
>> +    (Known|Imm)
>> +
>> +static const uint8_t init_or_livepatch_const onebyte[256] = {
>> +    [0x00] = ALU_OPS, /* ADD */ [0x08] = ALU_OPS, /* OR  */
>> +    [0x10] = ALU_OPS, /* ADC */ [0x18] = ALU_OPS, /* SBB */
>> +    [0x20] = ALU_OPS, /* AND */ [0x28] = ALU_OPS, /* SUB */
>> +    [0x30] = ALU_OPS, /* XOR */ [0x38] = ALU_OPS, /* CMP */
>> +/*  [0x40 ... 0x4f] = REX prefixes */
> For these and other aspects further down, may I ask for a comment at the
> top of the file setting the scope for this new function (and its
> associated data) as being strictly 64-bit only? And perhaps even strictly
> covering only what Xen may legitimately use (largely excluding APX for
> the foreseeable future, i.e. until such time that we might decide to
> allow Xen itself to use APX throughout its code).
>
> Besides APX, with more immediate uses in mind, I wonder about e.g.
> BMI/BMI2 insns, which live outside the one/two-byte maps.

They're not needed yet, and it would require extra decode complexity.

> I would further appreciate if we could be consistent with the mentioning
> (or not) of prefixes: The REX ones here are the only ones that the table
> mentions right now. In fact I wonder whether a Prefix attribute wouldn't
> be nice to have, so you don't need to open-code all of them in the
> function itself.

The comment about REX prefixes is only here because you insisted on it.

But I really don't like double-explaining things.

>> +    [0x6c ... 0x6f] = (Known),             /* INS/OUTS */
>> +
>> +    [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
>> +    [0x80]          = (Known|ModRM|Imm8),  /* Grp1 */
>> +    [0x81]          = (Known|ModRM|Imm),   /* Grp1 */
>> +
>> +    [0x83]          = (Known|ModRM|Imm8),  /* Grp1 */
>> +    [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA r/rm */
>> +
>> +    [0x90 ... 0x99] = (Known),             /* NOP/XCHG rAX/CLTQ/CQTO */
> Omitting PUSH (at 0x8f) is somewhat odd, considering that it's a pretty
> "normal" insn.

Except it's not.  It's the XOP prefix too, and would require extra
decode complexity.

>> +    [0xc6]          = (Known|ModRM|Imm8),  /* Grp11, Further ModRM decode */
>> +    [0xc7]          = (Known|ModRM|Imm),   /* Grp11, Further ModRM decode */
>> +
>> +    [0xcb ... 0xcc] = (Known),             /* LRET/INT3 */
>> +    [0xcd]          = (Known|Imm8),        /* INT $imm8 */
> No IRET, when you have things like e.g. ICEBP and CLTS?

The absence of IRET is intentional, because it can't be used safely. 
SYSRET/EXIT are excluded too for consistency.

IRET can be added if/when it is needed, and someone has figured out a
way of adjusting the exception table entry.

>> +};
>> +
>> +/*
>> + * Bare minimum x86 instruction decoder to parse the alternative replacement
>> + * instructions and locate the IP-relative references that may need updating.
>> + *
>> + * These are:
>> + *  - disp8/32 from near branches
>> + *  - RIP-relative memory references
>> + *
>> + * The following simplifications are used:
>> + *  - All code is 64bit, and the instruction stream is safe to read.
>> + *  - The 67 prefix is not implemented, so the address size is only 64bit.
> As to the earlier remark - maybe this part of the comment could simply
> move to the top of the file?

I really don't want to split the comment.  It needs to all live together.

Given this is a single-function file, I also don't see the need for this
comment to move away from here.  You can't interpret the decode tables
without reading the function.

>
>> + * Inputs:
>> + *  @ip  The position to start decoding from.
>> + *  @end End of the replacement block.  Exceeding this is considered an error.
>> + *
>> + * Returns: x86_decode_lite_t
>> + *  - On failure, length of 0.
>> + *  - On success, length > 0.  For rel_sz > 0, rel points at the relative
>> + *    field in the instruction stream.
>> + */
>> +x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)
> Imo both pointers would be nice to be to-const.

In v1, you also identified why that wouldn't compile.

>
>> +{
>> +    void *start = ip, *rel = NULL;
>> +    unsigned int opc, rel_sz = 0;
>> +    uint8_t b, d, rex = 0, osize = 4;
>> +
>> +#define OPC_TWOBYTE (1 << 8)
>> +
>> +    /* Mutates IP, uses END. */
>> +#define FETCH(ty)                                       \
>> +    ({                                                  \
>> +        ty _val;                                        \
>> +                                                        \
>> +        if ( (ip + sizeof(ty)) > end )                  \
>> +            goto overrun;                               \
>> +        _val = *(ty *)ip;                               \
>> +        ip += sizeof(ty);                               \
>> +        _val;                                           \
>> +    })
>> +
>> +    for ( ;; ) /* Prefixes */
>> +    {
>> +        switch ( b = FETCH(uint8_t) )
>> +        {
>> +        case 0x26: /* ES override */
>> +        case 0x2e: /* CS override */
>> +        case 0x36: /* DS override */
>> +        case 0x3e: /* SS override */
>> +        case 0x64: /* FS override */
>> +        case 0x65: /* GS override */
> If you don't like the idea of a Prefix attribute

I don't like the idea of making this intentionally dissimilar to the
main decoder, just to safe a few lines of source code.

GCC optimises it into a bitmap anyway.

>  I wonder in how far we
> actually need all of the above, when you already ...
>
>> +        case 0xf0: /* LOCK */
>> +        case 0xf2: /* REPNE */
>> +        case 0xf3: /* REP */
>> +            break;
>> +
>> +        case 0x66: /* Operand size override */
>> +            osize = 2;
>> +            break;
>> +
>> +        /* case 0x67: Address size override, not implemented */
> ... deliberately leave of this one.

Excluding 67 is intentional because it a) has no business being used,
and b) adds a huge amount of decode complexity.

Whereas two of segment prefixes are already necessary to decode the
alternatives we have today.
>> +        case 0x40 ... 0x4f: /* REX */
>> +            rex = b;
>> +            continue;
>> +
>> +        default:
>> +            goto prefixes_done;
>> +        }
>> +        rex = 0; /* REX cancelled by subsequent legacy prefix. */
>> +    }
>> + prefixes_done:
>> +
>> +    if ( rex & 0x08 ) /* REX.W */
> Can you please use REX_W here?

Oh, it is available.  Ok.

>
>> +        osize = 8;
>> +
>> +    /* Fetch the main opcode byte(s) */
>> +    if ( b == 0x0f )
>> +    {
>> +        b = FETCH(uint8_t);
>> +        opc = OPC_TWOBYTE | b;
>> +
>> +        d = twobyte[b];
>> +    }
>> +    else
>> +    {
>> +        opc = b;
>> +        d = onebyte[b];
>> +    }
>> +
>> +    if ( unlikely(!(d & Known)) )
>> +        goto unknown;
>> +
>> +    if ( d & ModRM )
>> +    {
>> +        uint8_t modrm = FETCH(uint8_t);
>> +        uint8_t mod = modrm >> 6;
>> +        uint8_t reg = (modrm >> 3) & 7;
>> +        uint8_t rm = modrm & 7;
>> +
>> +        /* ModRM/SIB decode */
>> +        if ( mod == 0 && rm == 5 ) /* RIP relative */
>> +        {
>> +            rel = ip;
>> +            rel_sz = 4;
>> +            FETCH(uint32_t);
>> +        }
>> +        else if ( mod != 3 && rm == 4 ) /* SIB */
>> +        {
>> +            uint8_t sib = FETCH(uint8_t);
>> +            uint8_t base = sib & 7;
>> +
>> +            if ( mod == 0 && base == 5 )
>> +                goto disp32;
>> +        }
>> +
>> +        if ( mod == 1 ) /* disp8 */
>> +            FETCH(uint8_t);
>> +        else if ( mod == 2 ) /* disp32 */
>> +        {
>> +        disp32:
>> +            FETCH(uint32_t);
> The values aren't used, so the types don't matter overly much, yet int8_t
> and int32_t would be a more accurate representation of what's being
> fetched.

Why does that matter?  I'm skipping a number of bytes, not interpreting
the result.

>
>> +        }
>> +
>> +        /* ModRM based decode adjustements */
>> +        switch ( opc )
>> +        {
>> +        case 0xc7: /* Grp11 XBEGIN is a branch. */
>> +            if ( modrm == 0xf8 )
>> +                d |= Branch;
>> +            break;
>> +        case 0xf6: /* Grp3 TEST(s) have extra Imm8 */
>> +            if ( reg == 0 || reg == 1 )
>> +                d |= Imm8;
>> +            break;
>> +        case 0xf7: /* Grp3 TEST(s) have extra Imm */
>> +            if ( reg == 0 || reg == 1 )
>> +                d |= Imm;
>> +            break;
>> +        }
> In this switch() you don't distinguish 1- and 2-byte maps at all.

See OPC_TWOBYTE.  They are distinguished here.
>> +    }
>> +
>> +    if ( d & Branch )
>> +    {
>> +        /*
>> +         * We don't tolerate 66-prefixed call/jmp in alternatives.  Some are
>> +         * genuinely decoded differently between Intel and AMD CPUs.
>> +         *
>> +         * We also don't support APX instructions, so don't have to cope with
>> +         * JMPABS which is the first branch to have an 8-byte immediate.
>> +         */
>> +        if ( osize < 4 )
>> +            goto bad_osize;
>> +
>> +        rel = ip;
>> +        rel_sz = (d & Imm8) ? 1 : 4;
>> +    }
>> +
>> +    if ( d & (Imm | Imm8 | Moffs) )
>> +    {
>> +        if ( d & Imm8 )
>> +            osize = 1;
>> +        else if ( d & Moffs )
>> +            osize = 8;
>> +        else if ( osize == 8 && !(opc >= 0xb8 && opc <= 0xbf) )
> Again want to also take the opcode map into account, even if - by luck -
> this would work as is for now.
>
> Also could I talk you into converting the two comparisons into one, along
> the lines of "(opc | 7) != 0xbf"?

That's the kind of obfuscation which should be left to the compiler.

I know you think like that, but most others (including myself) do not.
>> --- a/xen/arch/x86/x86_emulate/private.h
>> +++ b/xen/arch/x86/x86_emulate/private.h
>> @@ -9,7 +9,9 @@
>>  #ifdef __XEN__
>>  
>>  # include <xen/bug.h>
>> +# include <xen/init.h>
>>  # include <xen/kernel.h>
>> +# include <xen/livepatch.h>
>>  # include <asm/endbr.h>
>>  # include <asm/msr-index.h>
>>  # include <asm/x86-vendors.h>
> It's only the new file that needs these - can we limit the dependencies
> to just that one by putting these new #include-s there?

Not if you want the userspace harness in patch 2 to compile.

~Andrew

