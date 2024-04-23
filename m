Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E78AE222
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 12:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710512.1109761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzDNI-0006q3-AX; Tue, 23 Apr 2024 10:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710512.1109761; Tue, 23 Apr 2024 10:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzDNI-0006ns-78; Tue, 23 Apr 2024 10:27:44 +0000
Received: by outflank-mailman (input) for mailman id 710512;
 Tue, 23 Apr 2024 10:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6UPA=L4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rzDNG-0006ne-8y
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 10:27:42 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c9dc1b9-015c-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 12:27:40 +0200 (CEST)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5aa241232faso4054283eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 03:27:40 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p9-20020ac84089000000b00437a996ca44sm4707893qtl.21.2024.04.23.03.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 03:27:38 -0700 (PDT)
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
X-Inumbo-ID: 1c9dc1b9-015c-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713868059; x=1714472859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hgNqbXIio+hx0vzWzU2UJHpfuMJRCQEbKQfmOyspTo8=;
        b=WtHQVGUd7SorVmMLL++JKuGIzsj1y0s9u9qcMyXr+s88BvtioguWtoGX3IqSfSOc/h
         mirwrpJEFm3Qw5ucWLrb/ofcjdvdqBRp9fn0Wug/6C+gUGoCYn9TzSgOglkqjiS4dz6/
         /5Q4VS5ab3SsMVpLP1v7WfBZYM45LMTO6gZXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713868059; x=1714472859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgNqbXIio+hx0vzWzU2UJHpfuMJRCQEbKQfmOyspTo8=;
        b=nT50fxN5xktQAgE77fwIwErQxnvGKuIDSHb3QZhw40dTXKTOy53rNaCXgHu/gonkmz
         UBK6oF4oqNRHk9tNozkyYIcH0NiqUgrXLXCRke+OA6ipewTE0G51fE4RRVvINoKaywBi
         ypBrVGLH9CKTIsLDD61OLGldOBPQUGMuFTjaTy2diJ56GTRVMT651fHHZHyKZGS6yx+N
         eFYRbGKlA8qQ5InOf5Fvv0jpriXvbUUgxZqaqPzl3TadSIRRnqwKtk+eKjb5fkF+zEFy
         YJYZ+yUmaOgKTetXzJdop8t4Hnaw5LAdteDQc+DLiHIn9gRVLtVr/+Ew8nK3zlOIPUzV
         GM0w==
X-Forwarded-Encrypted: i=1; AJvYcCVcXhLcwIT2H00OKR3mZQt11SaFY8/yIe6SKr6x2ceGSnzDKYGhOEW4TkOelQgL4b3DTRmC5ymK6z8SQlKT6qp8n2O+4msGf/HwjuFYh/M=
X-Gm-Message-State: AOJu0YwB8372HBKftM8DVIdvMfxIOG1euoyLxRMDsyyt2Sk+mmtgR0PX
	561jH3psyXkWHquaG3Qc9BO6alDRZBgUgsDXdzS+DOcKFcpTub26sethIybWxlPnRd5lo8WnZ2Q
	1OCw=
X-Google-Smtp-Source: AGHT+IFEJkwC1E7u3MhPylRS40AAYVp1tm+Fasf0gwuy4Ir6ZxFUrgWhyi5C7r3TuS14URurC0FYkQ==
X-Received: by 2002:a05:6358:b5c3:b0:186:431:d9be with SMTP id wb3-20020a056358b5c300b001860431d9bemr19941543rwc.19.1713868059308;
        Tue, 23 Apr 2024 03:27:39 -0700 (PDT)
Message-ID: <e5555566-52a9-4775-b26d-91bd10533065@citrix.com>
Date: Tue, 23 Apr 2024 11:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86: Introduce x86_decode_lite()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-2-andrew.cooper3@citrix.com>
 <e5a14d99-4141-410e-a39c-c38b294a553b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e5a14d99-4141-410e-a39c-c38b294a553b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2024 10:17 am, Jan Beulich wrote:
> On 22.04.2024 20:14, Andrew Cooper wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
>> @@ -0,0 +1,245 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include "private.h"
>> +
>> +#define Imm8   (1 << 0)
>> +#define Imm    (1 << 1)
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
>> +
>> +    [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
>> +
>> +    [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
>> +    [0x80]          = (Known|ModRM|Imm8),
>> +    [0x81]          = (Known|ModRM|Imm),
>> +
>> +    [0x83]          = (Known|ModRM|Imm8),
>> +    [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA r/rm */
>> +
>> +    [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
> I'm surprised you get away without at least NOP also marked as known.
> Imo the whole 0x90 row should be marked so.
>
> Similarly I'm not convinced that leaving the 0xA0 row unpopulated is a
> good idea. It's at best a trap set up for somebody to fall into rather
> sooner than later.
>
>> +    [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm32, %reg */
>> +
>> +    [0xcc]          = (Known),             /* INT3 */
>> +    [0xcd]          = (Known|Imm8),        /* INT $imm8 */
> Like above, what about in particular any of the shifts/rotates and the
> MOV that's in the 0xC0 row?
>
> While the last sentence in the description is likely meant to cover
> that, I think the description wants to go further as to any pretty
> common but omitted insns. Already "x86: re-work memset()" and "x86: re-
> work memcpy()" (v2 pending for, soon, 3 years) would make it necessary
> to touch this table, thus increasing complexity of those changes to an
> area they shouldn't be concerned about at all.
>
>> +    [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
>> +    [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */
> 0xe0 ... 0xe7 and 0xec ... 0xef would imo also better be covered, as
> they easily can be (much like you also cover e.g. CMC despite it
> appearing pretty unlikely that we use that insn anywhere).
>
>> +    [0xf1]          = (Known),             /* ICEBP */
>> +    [0xf4]          = (Known),             /* HLT */
>> +    [0xf5]          = (Known),             /* CMC */
>> +    [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3 */
>> +    [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
>> +    [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
>> +};
>> +static const uint8_t init_or_livepatch_const twobyte[256] = {
>> +    [0x00 ... 0x01] = (Known|ModRM),       /* Grp6/Grp7 */
> LAR / LSL? CLTS? WBINVD? UD2?
>
>> +    [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
>> +
>> +    [0x20 ... 0x23] = (Known|ModRM),       /* MOV CR/DR */
>> +
>> +    [0x30 ... 0x34] = (Known),             /* WRMSR ... RDPMC */
> 0x34 is SYSENTER, isn't it?
>
>> +    [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
>> +
>> +    [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */
> What about things like VMREAD/VMWRITE?
>
>> +    [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */
> PUSH/POP fs/gs? CPUID?
>
>> +    [0xab]          = (Known|ModRM),       /* BTS */
> BTS (and BTC below) but not BT and BTR?
>
>> +    [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
>> +    [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl / Grp15 / IMUL */
> SHRD but not SHLD?
>
> CMPXCHG?
>
>> +    [0xb8 ... 0xb9] = (Known|ModRM),       /* POPCNT/Grp10 (UD1) */
>> +    [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
>> +    [0xbb ... 0xbf] = (Known|ModRM),       /* BSR/BSF/BSR/MOVSX */
> Nit (comment only): 0xbb is BTC.
>
> MOVSX but not MOVZX and also not MOVSXD (in the 1-byte table)?
>
>> +};
> XADD, MOVNTI, and the whole 0xc7-based group?

As you may have guessed, I filled in the opcode table until I could
parse all replacements.

When, at the end of this, I didn't need the osize=8 movs, I took the
decoding complexity back out.

In an ideal world I would have finished the userspace harness too, but I
ran out of time.  Where it's just populating the table, that's fine. 
Where it complicates the decoding logic, that needs more thought.
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
> This, in particular, is imo important to state already ahead of the tables
> above, to clarify why e.g. row 0x40 is unpopulated.

I initially had that, but took it out.  I can put it back in.

>
>> + *  - The 67 prefix is not implemented, so the address size is only 64bit.
>> + *
>> + * Inputs:
>> + *  @ip  The position to start decoding from.
>> + *  @end End of the replacement block.  Exceeding this is considered an error.
>> + *
>> + * Returns: x86_decode_lite_t
>> + *  - On failure, length of -1.
>> + *  - On success, length > 0 and REL_TYPE_*.  For REL_TYPE != NONE, rel points
>> + *    at the relative field in the instruction stream.
>> + */
>> +x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)
>> +{
>> +    void *start = ip, *rel = NULL;
>> +    unsigned int opc, type = REL_TYPE_NONE;
>> +    uint8_t b, d, osize = 4;
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
>> +        case 0xf0: /* Lock */
>> +        case 0xf2: /* REPNE */
>> +        case 0xf3: /* REP */
>> +            break;
>> +
>> +        case 0x66: /* Operand size override */
>> +            osize = 2;
>> +            break;
>> +
>> +        /* case 0x67: Address size override, not implemented */
>> +
>> +        case 0x40 ... 0x4f: /* REX */
>> +            continue;
> Imo at least a comment is needed as to osize here: We don't use 0x66
> followed by REX.W, I suppose, when 0x66 determines operand size. It
> may also be an opcode extension, though, in which case osize set to
> 2 is (latently) wrong. "Latently" because all you need osize for is
> to determine Imm's length.
>
> However, what I again think need covering right away are opcodes
> 0xb8 ... 0xbc in combination with REX.W (osize needing to be 8 there).
>
> Finally - why "continue" here, but "break" further up? Both (right
> now) have exactly the same effect.

They're not the same when ...

>
>> +        default:
>> +            goto prefixes_done;
>> +        }


... this has "cancel the REX prefix" in it.

I started by decoding REX, only to find I didn't need it, so took it
back out.

>> +    }
>> + prefixes_done:
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
> IOW GPR insns in 0f38 and 0f3a spaces are left out, too. That's perhaps
> less of an issue than some of the other omissions (and would be more
> involved to cover when considering that some of them are VEX-encoded),
> but still not ideal.

They can all be added if needed, but right now they're not.

This decoder only need to cover instructions likely to be used in
alternatives, and that pretty limits us to simple integer operations.

Any extra complexity here makes the function less and less "lite".
>> +    }
>> +
>> +    if ( d & (Imm|Imm8) )
>> +    {
>> +        if ( d & Imm8 )
>> +            osize = 1;
>> +
>> +        switch ( osize )
>> +        {
>> +        case 1: FETCH(uint8_t);  break;
>> +        case 2: FETCH(uint16_t); break;
>> +        case 4: FETCH(uint32_t); break;
>> +        default: goto bad_osize;
>> +        }
>> +    }
>> +
>> +    return (x86_decode_lite_t){ ip - start, type, rel };
>> +
>> + bad_osize:
>> +    printk(XENLOG_ERR "%s() Bad osize %u in %*ph\n",
>> +           __func__, osize,
>> +           (int)(unsigned long)(end - start), start);
>> +    return (x86_decode_lite_t){ -1, REL_TYPE_NONE, NULL };
> Maybe limit opcode quoting to ip - start here?

In the case that we've taken the bad_osize path, we've not decoded the
full instruction.  The bytes beyond ip are useful for diagnostics.

>
>> --- a/xen/arch/x86/x86_emulate/private.h
>> +++ b/xen/arch/x86/x86_emulate/private.h
>> @@ -9,7 +9,9 @@
>>  #ifdef __XEN__
>>  
>>  # include <xen/bug.h>
>> +# include <xen/init.h>
>>  # include <xen/kernel.h>
>> +# include <xen/livepatch.h>
> Are both of these really needed here, rather than just in decode-lite.c?

Yes, for the userpsace harness.

>
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>> @@ -842,4 +842,21 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
>>      ctxt->event = (struct x86_event){};
>>  }
>>  
>> +/*
>> + * x86_decode_lite().  Very minimal decoder for managing alternatives.
>> + *
>> + * @len is -1 on error, or positive on success.  If the instruction has a
>> + * relative field, REL_TYPE_* gives the size, and @rel points at the field.
>> + */
>> +typedef struct {
>> +    int8_t len;
> Can't 0 be "error", thus permitting the field to be uint8_t?

Hmm, yes I think it can.  -1 is a leftover from an older scheme.

>
>> +    uint8_t rel_type;
>> +#define REL_TYPE_NONE 0
>> +#define REL_TYPE_d8   1
>> +#define REL_TYPE_d32  2
> Why not call the field rel_size and truly pass back the size?

Ok.


>
>> +    void *rel;
> While I understand the goal of omitting const here and ...
>
>> +} x86_decode_lite_t;
>> +
>> +x86_decode_lite_t x86_decode_lite(void *ip, void *end);
> ... here, I still find this fragile / misleading (the function itself, after
> all, only ever fetches from memory). Even with the goal in mind, surely at
> least "end" can be pointer-to-const?
>
> The (struct) return type would also be easier for the compiler to deal
> with if it didn't have a pointer field (and hence needs to be 128-bit). How
> about returning an offset relative to "start"? That would then allow proper
> constifying of both function parameters as well.

Quite the contrary.

I did initially pack it all into a single GPR, but both the written C
and code generation of this form is better.

This is what the code generation looks like:

<xdl>:
55                      push   %rbp
48 89 e5                mov    %rsp,%rbp
e8 77 fd ff ff          callq  ffff82d04033c580 <x86_decode_lite>
5d                      pop    %rbp
88 05 01 77 2f 00       mov    %al,0x2f7701(%rip)        # <xdl_len>
0f b6 c4                movzbl %ah,%eax
88 05 f7 76 2f 00       mov    %al,0x2f76f7(%rip)        # <xdl_type>
48 89 15 e8 76 2f 00    mov    %rdx,0x2f76e8(%rip)       # <xdl_rel>
c3                      retq   

and keeping rel as a full pointer simplifies both sides of the function.

(Again, I have no idea why GCC is setting up a frame pointer in this
case .  It's not needed given our preferred alignment setting.)

~Andrew

