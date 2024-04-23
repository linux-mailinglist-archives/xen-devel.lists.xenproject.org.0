Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F3A8AE2A7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 12:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710522.1109771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzDfB-0002LD-TD; Tue, 23 Apr 2024 10:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710522.1109771; Tue, 23 Apr 2024 10:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzDfB-0002Ih-QK; Tue, 23 Apr 2024 10:46:13 +0000
Received: by outflank-mailman (input) for mailman id 710522;
 Tue, 23 Apr 2024 10:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzDfA-0002IY-LW
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 10:46:12 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2453f5f-015e-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 12:46:10 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41a74e60753so14392735e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 03:46:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b0041a9c3444a6sm3269478wmb.28.2024.04.23.03.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 03:46:09 -0700 (PDT)
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
X-Inumbo-ID: b2453f5f-015e-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713869170; x=1714473970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MByRVRTXZ2POLvHPgofObCeYVVOfDpmF690HRHS6F+E=;
        b=N7gNhtcSVJv6wFDIGZSVT9AtM9TI46tw3Re5wij8vFa+M3IjzCnYrneXrKd7t+8dkz
         QeQ8iz4nPjTgVI0EDYgk5ngf84rAD0uTFa0C5avyHNV16B2M09+qlZquu8AldLQOKg1z
         1IMZ3Ct1uMyTdPdyv2l6KCQAMH17NA31pLAQNorm984IzToD2sPRdES+xzQtuBdgwlSV
         NjswBqxKNRL/KtFS3TyOVOOCYnD/qt2cIQJ1SNRQd3e24cMGYbldZLWYnChFAfz8yhiF
         DKbmTrcyFsaS2pCELfxNgnUl+XNxxAnvjyn5sZGeYZxTv9PeMCWfzDcUOOlQpqhpjshm
         RQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713869170; x=1714473970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MByRVRTXZ2POLvHPgofObCeYVVOfDpmF690HRHS6F+E=;
        b=EMdrvZXRz5+ohaGTw/qfxM8ZFzg/oV5NP7n9BeLwy31czy/Z0viY+oyT1bOUansk//
         FyxIUP+J2yTv0pE0vfCEMTl65/uBy+VbIe8TfC2YKXccRVyluCimLON8yoZrEAvru0Dz
         YGME3ivCy8hvvoXw3rhZaA85u/vtjsKcX0Dry7j4KlmoX7SmOoGd2RCpLtVkPTqkH+3Q
         qA/KjomXM871AESDwRF2B/7RBtdHNMHcjyMTjfz/90KIZngh+owtdWInrDrW2aip0pK0
         sXMr07uFie6ZAM5TsPJn2peBLYszenGd6AFF0qRM44UNZ4P926qEVl4bA3oWIAXBpMEO
         eUFw==
X-Forwarded-Encrypted: i=1; AJvYcCXtL53cDzEJL+8dJw0zNqYc0//BZQVf2kUo9//NV5kQemlzw5NxR/8fKImN2MDbGTswI6CM9nnCa3YAwuxfqzUeYbKKUYvoHB/ctV7RrDg=
X-Gm-Message-State: AOJu0YwTEwcZm8Bcmh27ZRVkhIQPH4zJT7FIdP9enVKCcxogxQq59W7J
	O7tOAQTGegjxZxGTi+WlCftRoyzUPWjr+rClIpAxEDjj/M3n5M+TFsL2R7hcyw==
X-Google-Smtp-Source: AGHT+IHHFh2+cepSfYJJ/85BD5t2gJZvF86uIg6gQotGmHXZEbKuG8GIjHiSB2s27/Gz4EK6Cwp7jg==
X-Received: by 2002:a05:600c:4e92:b0:418:f991:713f with SMTP id f18-20020a05600c4e9200b00418f991713fmr8700666wmq.23.1713869169522;
        Tue, 23 Apr 2024 03:46:09 -0700 (PDT)
Message-ID: <582c47ed-4c61-49f2-9191-fb4bf9f64343@suse.com>
Date: Tue, 23 Apr 2024 12:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86: Introduce x86_decode_lite()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-2-andrew.cooper3@citrix.com>
 <e5a14d99-4141-410e-a39c-c38b294a553b@suse.com>
 <e5555566-52a9-4775-b26d-91bd10533065@citrix.com>
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
In-Reply-To: <e5555566-52a9-4775-b26d-91bd10533065@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 12:27, Andrew Cooper wrote:
> On 23/04/2024 10:17 am, Jan Beulich wrote:
>> On 22.04.2024 20:14, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
>>> @@ -0,0 +1,245 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include "private.h"
>>> +
>>> +#define Imm8   (1 << 0)
>>> +#define Imm    (1 << 1)
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
>>> +
>>> +    [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
>>> +
>>> +    [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
>>> +    [0x80]          = (Known|ModRM|Imm8),
>>> +    [0x81]          = (Known|ModRM|Imm),
>>> +
>>> +    [0x83]          = (Known|ModRM|Imm8),
>>> +    [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA r/rm */
>>> +
>>> +    [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
>> I'm surprised you get away without at least NOP also marked as known.
>> Imo the whole 0x90 row should be marked so.
>>
>> Similarly I'm not convinced that leaving the 0xA0 row unpopulated is a
>> good idea. It's at best a trap set up for somebody to fall into rather
>> sooner than later.
>>
>>> +    [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm32, %reg */
>>> +
>>> +    [0xcc]          = (Known),             /* INT3 */
>>> +    [0xcd]          = (Known|Imm8),        /* INT $imm8 */
>> Like above, what about in particular any of the shifts/rotates and the
>> MOV that's in the 0xC0 row?
>>
>> While the last sentence in the description is likely meant to cover
>> that, I think the description wants to go further as to any pretty
>> common but omitted insns. Already "x86: re-work memset()" and "x86: re-
>> work memcpy()" (v2 pending for, soon, 3 years) would make it necessary
>> to touch this table, thus increasing complexity of those changes to an
>> area they shouldn't be concerned about at all.
>>
>>> +    [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
>>> +    [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */
>> 0xe0 ... 0xe7 and 0xec ... 0xef would imo also better be covered, as
>> they easily can be (much like you also cover e.g. CMC despite it
>> appearing pretty unlikely that we use that insn anywhere).
>>
>>> +    [0xf1]          = (Known),             /* ICEBP */
>>> +    [0xf4]          = (Known),             /* HLT */
>>> +    [0xf5]          = (Known),             /* CMC */
>>> +    [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3 */
>>> +    [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
>>> +    [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
>>> +};
>>> +static const uint8_t init_or_livepatch_const twobyte[256] = {
>>> +    [0x00 ... 0x01] = (Known|ModRM),       /* Grp6/Grp7 */
>> LAR / LSL? CLTS? WBINVD? UD2?
>>
>>> +    [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
>>> +
>>> +    [0x20 ... 0x23] = (Known|ModRM),       /* MOV CR/DR */
>>> +
>>> +    [0x30 ... 0x34] = (Known),             /* WRMSR ... RDPMC */
>> 0x34 is SYSENTER, isn't it?
>>
>>> +    [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
>>> +
>>> +    [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */
>> What about things like VMREAD/VMWRITE?
>>
>>> +    [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */
>> PUSH/POP fs/gs? CPUID?
>>
>>> +    [0xab]          = (Known|ModRM),       /* BTS */
>> BTS (and BTC below) but not BT and BTR?
>>
>>> +    [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
>>> +    [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl / Grp15 / IMUL */
>> SHRD but not SHLD?
>>
>> CMPXCHG?
>>
>>> +    [0xb8 ... 0xb9] = (Known|ModRM),       /* POPCNT/Grp10 (UD1) */
>>> +    [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
>>> +    [0xbb ... 0xbf] = (Known|ModRM),       /* BSR/BSF/BSR/MOVSX */
>> Nit (comment only): 0xbb is BTC.
>>
>> MOVSX but not MOVZX and also not MOVSXD (in the 1-byte table)?
>>
>>> +};
>> XADD, MOVNTI, and the whole 0xc7-based group?
> 
> As you may have guessed, I filled in the opcode table until I could
> parse all replacements.
> 
> When, at the end of this, I didn't need the osize=8 movs, I took the
> decoding complexity back out.

While I can see that this requiring extra logic makes it desirable to
leave out, it'll easily be a surprise when, eventually, someone adds an
alternative using such. Please may I ask that for any "simple" integer
insn left out, that be clearly mentioned in or ahead of the tables?

>>> + *  - The 67 prefix is not implemented, so the address size is only 64bit.
>>> + *
>>> + * Inputs:
>>> + *  @ip  The position to start decoding from.
>>> + *  @end End of the replacement block.  Exceeding this is considered an error.
>>> + *
>>> + * Returns: x86_decode_lite_t
>>> + *  - On failure, length of -1.
>>> + *  - On success, length > 0 and REL_TYPE_*.  For REL_TYPE != NONE, rel points
>>> + *    at the relative field in the instruction stream.
>>> + */
>>> +x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)
>>> +{
>>> +    void *start = ip, *rel = NULL;
>>> +    unsigned int opc, type = REL_TYPE_NONE;
>>> +    uint8_t b, d, osize = 4;
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
>>> +        case 0xf0: /* Lock */
>>> +        case 0xf2: /* REPNE */
>>> +        case 0xf3: /* REP */
>>> +            break;
>>> +
>>> +        case 0x66: /* Operand size override */
>>> +            osize = 2;
>>> +            break;
>>> +
>>> +        /* case 0x67: Address size override, not implemented */
>>> +
>>> +        case 0x40 ... 0x4f: /* REX */
>>> +            continue;
>> Imo at least a comment is needed as to osize here: We don't use 0x66
>> followed by REX.W, I suppose, when 0x66 determines operand size. It
>> may also be an opcode extension, though, in which case osize set to
>> 2 is (latently) wrong. "Latently" because all you need osize for is
>> to determine Imm's length.
>>
>> However, what I again think need covering right away are opcodes
>> 0xb8 ... 0xbc in combination with REX.W (osize needing to be 8 there).
>>
>> Finally - why "continue" here, but "break" further up? Both (right
>> now) have exactly the same effect.
> 
> They're not the same when ...
> 
>>
>>> +        default:
>>> +            goto prefixes_done;
>>> +        }
> 
> 
> ... this has "cancel the REX prefix" in it.

Of course.

> I started by decoding REX, only to find I didn't need it, so took it
> back out.

At which point imo they want to all be "break". Once the cancellation
needs adding, where necessary "break" can be switched to "continue".
(Interestingly REX2 is different from REX in this regard, and hence
wouldn't need such cancellation, if ever we end up patching APX insns.)

>>> +    }
>>> + prefixes_done:
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
>> IOW GPR insns in 0f38 and 0f3a spaces are left out, too. That's perhaps
>> less of an issue than some of the other omissions (and would be more
>> involved to cover when considering that some of them are VEX-encoded),
>> but still not ideal.
> 
> They can all be added if needed, but right now they're not.
> 
> This decoder only need to cover instructions likely to be used in
> alternatives, and that pretty limits us to simple integer operations.
> 
> Any extra complexity here makes the function less and less "lite".

I understand this. At the same time to me anything pending and anything
previously submitted but disliked for whatever reason wants at least
considering to cover. In that context please recall that once there was
BMI2 patching (that you didn't like) ...

>>> +    }
>>> +
>>> +    if ( d & (Imm|Imm8) )
>>> +    {
>>> +        if ( d & Imm8 )
>>> +            osize = 1;
>>> +
>>> +        switch ( osize )
>>> +        {
>>> +        case 1: FETCH(uint8_t);  break;
>>> +        case 2: FETCH(uint16_t); break;
>>> +        case 4: FETCH(uint32_t); break;
>>> +        default: goto bad_osize;
>>> +        }
>>> +    }
>>> +
>>> +    return (x86_decode_lite_t){ ip - start, type, rel };
>>> +
>>> + bad_osize:
>>> +    printk(XENLOG_ERR "%s() Bad osize %u in %*ph\n",
>>> +           __func__, osize,
>>> +           (int)(unsigned long)(end - start), start);
>>> +    return (x86_decode_lite_t){ -1, REL_TYPE_NONE, NULL };
>> Maybe limit opcode quoting to ip - start here?
> 
> In the case that we've taken the bad_osize path, we've not decoded the
> full instruction.  The bytes beyond ip are useful for diagnostics.

Hmm. The reason for the reported failure lies within the [start,ip)
range. Yet I agree that would not be a complete insn. Otoh what is
being patched may be a meaningfully long series of insns, which aren't
useful to all log. If you think including the immediate (the value of
which is of no interest) is relevant, may I then please ask that you
bound logging at the insn size limit of 15?

>>> --- a/xen/arch/x86/x86_emulate/private.h
>>> +++ b/xen/arch/x86/x86_emulate/private.h
>>> @@ -9,7 +9,9 @@
>>>  #ifdef __XEN__
>>>  
>>>  # include <xen/bug.h>
>>> +# include <xen/init.h>
>>>  # include <xen/kernel.h>
>>> +# include <xen/livepatch.h>
>> Are both of these really needed here, rather than just in decode-lite.c?
> 
> Yes, for the userpsace harness.

The user space harness shouldn't include any Xen headers. Patch context
(the #ifdef at the top) even shows that this Xen-only code.

>>> +    void *rel;
>> While I understand the goal of omitting const here and ...
>>
>>> +} x86_decode_lite_t;
>>> +
>>> +x86_decode_lite_t x86_decode_lite(void *ip, void *end);
>> ... here, I still find this fragile / misleading (the function itself, after
>> all, only ever fetches from memory). Even with the goal in mind, surely at
>> least "end" can be pointer-to-const?
>>
>> The (struct) return type would also be easier for the compiler to deal
>> with if it didn't have a pointer field (and hence needs to be 128-bit). How
>> about returning an offset relative to "start"? That would then allow proper
>> constifying of both function parameters as well.
> 
> Quite the contrary.
> 
> I did initially pack it all into a single GPR, but both the written C
> and code generation of this form is better.
> 
> This is what the code generation looks like:
> 
> <xdl>:
> 55                      push   %rbp
> 48 89 e5                mov    %rsp,%rbp
> e8 77 fd ff ff          callq  ffff82d04033c580 <x86_decode_lite>
> 5d                      pop    %rbp
> 88 05 01 77 2f 00       mov    %al,0x2f7701(%rip)        # <xdl_len>
> 0f b6 c4                movzbl %ah,%eax
> 88 05 f7 76 2f 00       mov    %al,0x2f76f7(%rip)        # <xdl_type>
> 48 89 15 e8 76 2f 00    mov    %rdx,0x2f76e8(%rip)       # <xdl_rel>
> c3                      retq   

Well, "easier" in my earlier reply wasn't referring to the complexity
of generated code. Instead I'm slightly wary of compiler issues with
the calling convention for 128-bit struct returns.

> and keeping rel as a full pointer simplifies both sides of the function.

Hmm, I can see that being the case. I wonder whether const-correctness
doesn't weigh higher, though. But I'm also not going to insist.

Jan

