Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C639940E7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 10:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812761.1225538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5O9-0006uh-M1; Tue, 08 Oct 2024 08:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812761.1225538; Tue, 08 Oct 2024 08:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5O9-0006tC-J8; Tue, 08 Oct 2024 08:16:13 +0000
Received: by outflank-mailman (input) for mailman id 812761;
 Tue, 08 Oct 2024 08:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy5O8-0006sY-FR
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 08:16:12 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 940b32c4-854d-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 10:16:11 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso7617166a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 01:16:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05ad8cfsm4081993a12.37.2024.10.08.01.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 01:16:10 -0700 (PDT)
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
X-Inumbo-ID: 940b32c4-854d-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728375371; x=1728980171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XD1ID4dK0vBevMAWfrj3Br3tfpyEJB+nRXLc2CosiCc=;
        b=QmvwfoCKzFB8WEYH5guvsWQkWrTT/QMMatowgE3Ml0K3GwPjrdfbyMxdIPuNjGXvek
         2EHst6u1N9AFOmh7O2dP1tB2pKbDic5yhE+FeDL+u6uLRgywm7rUYEKLuCiebqpsbRvB
         lqSBdce7OI3J9rQ/hytLRpLtJCERw+aXePcn6VPQBeVPJeIVPiRz3E3GnJmPt7SJ2+/0
         NDizGnl7DqcmAZU4oS1LNHAb77XccRzLG4tTp0BhBq92S1GjnVDcwvY/0jFlfltMmY6A
         VXm9tYLnKO62pLQ9s2YEDU1EtPyWr8wyC6o+ilfSFBiAtsqCsQvO9l/pDfa2GWkgOr0/
         a3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375371; x=1728980171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XD1ID4dK0vBevMAWfrj3Br3tfpyEJB+nRXLc2CosiCc=;
        b=bmLui61px8pzvDDayhWR96GIi+e5bl5BSCOwLRInNwdvVfdY/rbvWz4Max8trbB2oI
         8XexR4RGQA171wUXzziTb83OeK2FGvvnZ2xEPJcbTvx8pZpdz2YbMO0ZSq4gf1oLN8Jy
         qAJQ7G92KY6y8B1nRHVxEU9CmCKrJ5mJ6z31WGlBpzKIl39EprkNvLVOGXD+VvNi1oxy
         h7RnUSlSGf9BcCS6D4m7dAnNqKXkUfKDNQeg34djfoOmotUp69gzC8qizrchBahhs5n4
         ia8DwKTkHHp5JCjeLQPK19IQWK89ZFOhfXZvUtfPoev8g9FbllqiMG4WSPe0bQJDo5F0
         fGTw==
X-Forwarded-Encrypted: i=1; AJvYcCXW/jgf4QxOnJVgY/jZ1aaUVifocj+VDj28K9Sjmh67150O59eCQYD7laKwM/dK/bCQ3s3dZkXkWVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztBCGFXPoE2lLLER4+tNUmDCqbEetXH3WZVsNcChWPtSAyIh7/
	fPSXJnSVIaydGuuD9WaAChmzy/QhwGYHf1RzNN4YPQzi03d3qBszUeOA7DAJUWj/WDAvTq6twgo
	=
X-Google-Smtp-Source: AGHT+IEM5hZLBoOpSDT7lXegmWf0Ym768BFwps70e1KhrP18nlnkP15HqNzUgS021OsgmMKC1phF3Q==
X-Received: by 2002:a05:6402:2808:b0:5c8:9861:a2c0 with SMTP id 4fb4d7f45d1cf-5c8d2e743c6mr11913965a12.25.1728375370766;
        Tue, 08 Oct 2024 01:16:10 -0700 (PDT)
Message-ID: <9507c361-845c-4c00-8cb2-507e413be544@suse.com>
Date: Tue, 8 Oct 2024 10:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86: Introduce x86_decode_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
 <20241002152725.1841575-2-andrew.cooper3@citrix.com>
 <82d6f3a3-b3bf-4e4b-bf5c-39f5b857897a@suse.com>
 <c83b550f-9cba-4ae5-a887-6a962588df88@citrix.com>
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
In-Reply-To: <c83b550f-9cba-4ae5-a887-6a962588df88@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.10.2024 19:17, Andrew Cooper wrote:
> On 07/10/2024 1:56 pm, Jan Beulich wrote:
>> On 02.10.2024 17:27, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
>>> @@ -0,0 +1,311 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include "private.h"
>>> +
>>> +#define Imm8   (1 << 0)
>>> +#define Imm    (1 << 1)
>>> +#define Moffs  (1 << 2)
>>> +#define Branch (1 << 5) /* ... that we care about */
>>> +/*      ModRM  (1 << 6) */
>>> +#define Known  (1 << 7)
>>> +
>>> +#define ALU_OPS                                 \
>>> +    (Known|ModRM),                              \
>>> +    (Known|ModRM),                              \
>>> +    (Known|ModRM),                              \
>>> +    (Known|ModRM),                              \
>>> +    (Known|Imm8),                               \
>>> +    (Known|Imm)
>>> +
>>> +static const uint8_t init_or_livepatch_const onebyte[256] = {
>>> +    [0x00] = ALU_OPS, /* ADD */ [0x08] = ALU_OPS, /* OR  */
>>> +    [0x10] = ALU_OPS, /* ADC */ [0x18] = ALU_OPS, /* SBB */
>>> +    [0x20] = ALU_OPS, /* AND */ [0x28] = ALU_OPS, /* SUB */
>>> +    [0x30] = ALU_OPS, /* XOR */ [0x38] = ALU_OPS, /* CMP */
>>> +/*  [0x40 ... 0x4f] = REX prefixes */
>> For these and other aspects further down, may I ask for a comment at the
>> top of the file setting the scope for this new function (and its
>> associated data) as being strictly 64-bit only? And perhaps even strictly
>> covering only what Xen may legitimately use (largely excluding APX for
>> the foreseeable future, i.e. until such time that we might decide to
>> allow Xen itself to use APX throughout its code).
>>
>> Besides APX, with more immediate uses in mind, I wonder about e.g.
>> BMI/BMI2 insns, which live outside the one/two-byte maps.
> 
> They're not needed yet, and it would require extra decode complexity.
> 
>> I would further appreciate if we could be consistent with the mentioning
>> (or not) of prefixes: The REX ones here are the only ones that the table
>> mentions right now. In fact I wonder whether a Prefix attribute wouldn't
>> be nice to have, so you don't need to open-code all of them in the
>> function itself.
> 
> The comment about REX prefixes is only here because you insisted on it.

Did I? Looking back at my v1 replies I can't spot such a comment. But anyway,
what I'd like to ask for is consistency: Mention all (relevant) prefixes, or
none of them.

>>> +    [0x6c ... 0x6f] = (Known),             /* INS/OUTS */
>>> +
>>> +    [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
>>> +    [0x80]          = (Known|ModRM|Imm8),  /* Grp1 */
>>> +    [0x81]          = (Known|ModRM|Imm),   /* Grp1 */
>>> +
>>> +    [0x83]          = (Known|ModRM|Imm8),  /* Grp1 */
>>> +    [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA r/rm */
>>> +
>>> +    [0x90 ... 0x99] = (Known),             /* NOP/XCHG rAX/CLTQ/CQTO */
>> Omitting PUSH (at 0x8f) is somewhat odd, considering that it's a pretty
>> "normal" insn.
> 
> Except it's not.  It's the XOP prefix too, and would require extra
> decode complexity.

Well, just like you don't decode VEX/EVEX, you could opt not to decode XOP
despite decoding this PUSH form. Otherwise I'm inclined to ask that no PUSH
or POP should be decoded.

>>> +    [0xc6]          = (Known|ModRM|Imm8),  /* Grp11, Further ModRM decode */
>>> +    [0xc7]          = (Known|ModRM|Imm),   /* Grp11, Further ModRM decode */
>>> +
>>> +    [0xcb ... 0xcc] = (Known),             /* LRET/INT3 */
>>> +    [0xcd]          = (Known|Imm8),        /* INT $imm8 */
>> No IRET, when you have things like e.g. ICEBP and CLTS?
> 
> The absence of IRET is intentional, because it can't be used safely. 
> SYSRET/EXIT are excluded too for consistency.
> 
> IRET can be added if/when it is needed, and someone has figured out a
> way of adjusting the exception table entry.

If it has an attached exception table entry. If it doesn't, I think its
use would in principle be fine. And an attached exception table entry could
similarly be a problem for any other insn, couldn't it? The same argument
would in particular apply to LRET, I think.

Anyway, once again my main concern here are apparent inconsistencies. Any
of them will make it more difficult to judge what needs / doesn't need
adding here going forward.

>>> +};
>>> +
>>> +/*
>>> + * Bare minimum x86 instruction decoder to parse the alternative replacement
>>> + * instructions and locate the IP-relative references that may need updating.
>>> + *
>>> + * These are:
>>> + *  - disp8/32 from near branches
>>> + *  - RIP-relative memory references
>>> + *
>>> + * The following simplifications are used:
>>> + *  - All code is 64bit, and the instruction stream is safe to read.
>>> + *  - The 67 prefix is not implemented, so the address size is only 64bit.
>> As to the earlier remark - maybe this part of the comment could simply
>> move to the top of the file?
> 
> I really don't want to split the comment.  It needs to all live together.
> 
> Given this is a single-function file, I also don't see the need for this
> comment to move away from here.  You can't interpret the decode tables
> without reading the function.

I'm torn; I think having some fundamental information at the top of the file
would help. Yet keeping commentary together is also a valid aspect.

>>> + * Inputs:
>>> + *  @ip  The position to start decoding from.
>>> + *  @end End of the replacement block.  Exceeding this is considered an error.
>>> + *
>>> + * Returns: x86_decode_lite_t
>>> + *  - On failure, length of 0.
>>> + *  - On success, length > 0.  For rel_sz > 0, rel points at the relative
>>> + *    field in the instruction stream.
>>> + */
>>> +x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)
>> Imo both pointers would be nice to be to-const.
> 
> In v1, you also identified why that wouldn't compile.

Hmm, right. It's been a while. Would it be too much to ask that you add a
sentence to that effect to the description?

>>> +{
>>> +    void *start = ip, *rel = NULL;
>>> +    unsigned int opc, rel_sz = 0;
>>> +    uint8_t b, d, rex = 0, osize = 4;
>>> +
>>> +#define OPC_TWOBYTE (1 << 8)
>>> +
>>> +    /* Mutates IP, uses END. */
>>> +#define FETCH(ty)                                       \
>>> +    ({                                                  \
>>> +        ty _val;                                        \
>>> +                                                        \
>>> +        if ( (ip + sizeof(ty)) > end )                  \
>>> +            goto overrun;                               \
>>> +        _val = *(ty *)ip;                               \
>>> +        ip += sizeof(ty);                               \
>>> +        _val;                                           \
>>> +    })
>>> +
>>> +    for ( ;; ) /* Prefixes */
>>> +    {
>>> +        switch ( b = FETCH(uint8_t) )
>>> +        {
>>> +        case 0x26: /* ES override */
>>> +        case 0x2e: /* CS override */
>>> +        case 0x36: /* DS override */
>>> +        case 0x3e: /* SS override */
>>> +        case 0x64: /* FS override */
>>> +        case 0x65: /* GS override */
>> If you don't like the idea of a Prefix attribute
> 
> I don't like the idea of making this intentionally dissimilar to the
> main decoder, just to safe a few lines of source code.
> 
> GCC optimises it into a bitmap anyway.

Well, okay then.

>>  I wonder in how far we
>> actually need all of the above, when you already ...
>>
>>> +        case 0xf0: /* LOCK */
>>> +        case 0xf2: /* REPNE */
>>> +        case 0xf3: /* REP */
>>> +            break;
>>> +
>>> +        case 0x66: /* Operand size override */
>>> +            osize = 2;
>>> +            break;
>>> +
>>> +        /* case 0x67: Address size override, not implemented */
>> ... deliberately leave of this one.
> 
> Excluding 67 is intentional because it a) has no business being used,
> and b) adds a huge amount of decode complexity.

I largely agree with a), but why b)? The only difference in decode is
how to treat moffs. In any event - the comments here again were because
things looks somewhat inconsistent the way they are right now. As that's
deliberate, it's perhaps tolerable.

> Whereas two of segment prefixes are already necessary to decode the
> alternatives we have today.
>>> +        case 0x40 ... 0x4f: /* REX */
>>> +            rex = b;
>>> +            continue;
>>> +
>>> +        default:
>>> +            goto prefixes_done;
>>> +        }
>>> +        rex = 0; /* REX cancelled by subsequent legacy prefix. */
>>> +    }
>>> + prefixes_done:
>>> +
>>> +    if ( rex & 0x08 ) /* REX.W */
>> Can you please use REX_W here?
> 
> Oh, it is available.  Ok.
> 
>>
>>> +        osize = 8;
>>> +
>>> +    /* Fetch the main opcode byte(s) */
>>> +    if ( b == 0x0f )
>>> +    {
>>> +        b = FETCH(uint8_t);
>>> +        opc = OPC_TWOBYTE | b;
>>> +
>>> +        d = twobyte[b];
>>> +    }
>>> +    else
>>> +    {
>>> +        opc = b;
>>> +        d = onebyte[b];
>>> +    }
>>> +
>>> +    if ( unlikely(!(d & Known)) )
>>> +        goto unknown;
>>> +
>>> +    if ( d & ModRM )
>>> +    {
>>> +        uint8_t modrm = FETCH(uint8_t);
>>> +        uint8_t mod = modrm >> 6;
>>> +        uint8_t reg = (modrm >> 3) & 7;
>>> +        uint8_t rm = modrm & 7;
>>> +
>>> +        /* ModRM/SIB decode */
>>> +        if ( mod == 0 && rm == 5 ) /* RIP relative */
>>> +        {
>>> +            rel = ip;
>>> +            rel_sz = 4;
>>> +            FETCH(uint32_t);
>>> +        }
>>> +        else if ( mod != 3 && rm == 4 ) /* SIB */
>>> +        {
>>> +            uint8_t sib = FETCH(uint8_t);
>>> +            uint8_t base = sib & 7;
>>> +
>>> +            if ( mod == 0 && base == 5 )
>>> +                goto disp32;
>>> +        }
>>> +
>>> +        if ( mod == 1 ) /* disp8 */
>>> +            FETCH(uint8_t);
>>> +        else if ( mod == 2 ) /* disp32 */
>>> +        {
>>> +        disp32:
>>> +            FETCH(uint32_t);
>> The values aren't used, so the types don't matter overly much, yet int8_t
>> and int32_t would be a more accurate representation of what's being
>> fetched.
> 
> Why does that matter?  I'm skipping a number of bytes, not interpreting
> the result.

It matters from a doc pov only at this point. When one simply reads this
code, one may wonder "why unsigned". Just like I did.

>>> +        }
>>> +
>>> +        /* ModRM based decode adjustements */
>>> +        switch ( opc )
>>> +        {
>>> +        case 0xc7: /* Grp11 XBEGIN is a branch. */
>>> +            if ( modrm == 0xf8 )
>>> +                d |= Branch;
>>> +            break;
>>> +        case 0xf6: /* Grp3 TEST(s) have extra Imm8 */
>>> +            if ( reg == 0 || reg == 1 )
>>> +                d |= Imm8;
>>> +            break;
>>> +        case 0xf7: /* Grp3 TEST(s) have extra Imm */
>>> +            if ( reg == 0 || reg == 1 )
>>> +                d |= Imm;
>>> +            break;
>>> +        }
>> In this switch() you don't distinguish 1- and 2-byte maps at all.
> 
> See OPC_TWOBYTE.  They are distinguished here.

Oh, I've overlooked that, sorry.

>>> +    }
>>> +
>>> +    if ( d & Branch )
>>> +    {
>>> +        /*
>>> +         * We don't tolerate 66-prefixed call/jmp in alternatives.  Some are
>>> +         * genuinely decoded differently between Intel and AMD CPUs.
>>> +         *
>>> +         * We also don't support APX instructions, so don't have to cope with
>>> +         * JMPABS which is the first branch to have an 8-byte immediate.
>>> +         */
>>> +        if ( osize < 4 )
>>> +            goto bad_osize;
>>> +
>>> +        rel = ip;
>>> +        rel_sz = (d & Imm8) ? 1 : 4;
>>> +    }
>>> +
>>> +    if ( d & (Imm | Imm8 | Moffs) )
>>> +    {
>>> +        if ( d & Imm8 )
>>> +            osize = 1;
>>> +        else if ( d & Moffs )
>>> +            osize = 8;
>>> +        else if ( osize == 8 && !(opc >= 0xb8 && opc <= 0xbf) )
>> Again want to also take the opcode map into account, even if - by luck -
>> this would work as is for now.
>>
>> Also could I talk you into converting the two comparisons into one, along
>> the lines of "(opc | 7) != 0xbf"?
> 
> That's the kind of obfuscation which should be left to the compiler.

If only it actually did. I didn't check recently, but last I checked they
still didn't take opportunities like this.

>>> --- a/xen/arch/x86/x86_emulate/private.h
>>> +++ b/xen/arch/x86/x86_emulate/private.h
>>> @@ -9,7 +9,9 @@
>>>  #ifdef __XEN__
>>>  
>>>  # include <xen/bug.h>
>>> +# include <xen/init.h>
>>>  # include <xen/kernel.h>
>>> +# include <xen/livepatch.h>
>>>  # include <asm/endbr.h>
>>>  # include <asm/msr-index.h>
>>>  # include <asm/x86-vendors.h>
>> It's only the new file that needs these - can we limit the dependencies
>> to just that one by putting these new #include-s there?
> 
> Not if you want the userspace harness in patch 2 to compile.

This is inside #ifdef __XEN__, so how can the userspace harness'es build
matter? Of course the #include-s, once moved, would need to be inside a
similar #ifdef.

Jan

