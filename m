Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3CEA467B5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 18:15:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897096.1305817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnL0U-0000qv-C6; Wed, 26 Feb 2025 17:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897096.1305817; Wed, 26 Feb 2025 17:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnL0U-0000pV-8x; Wed, 26 Feb 2025 17:15:38 +0000
Received: by outflank-mailman (input) for mailman id 897096;
 Wed, 26 Feb 2025 17:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnL0S-0000pP-90
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 17:15:36 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49e93bce-f465-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 18:15:34 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-439350f1a0bso872965e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 09:15:34 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5710f6sm29918675e9.29.2025.02.26.09.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 09:15:33 -0800 (PST)
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
X-Inumbo-ID: 49e93bce-f465-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740590134; x=1741194934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f29G2yiDLgtvDH+EVaqm2OVBUjHVsdMjGK88m0Q1skg=;
        b=GPzqs+nbQjoNVUm5sCL91ZrRMjic4lp6y26jbjjiuBehNqZsE9H5Ejc0kfmfPTvD9+
         yTrkcGL6lilE04nmtW/UK+6/N7iCxBPigxO9yh346bB/lG6DJQ8BiHxvkbUBrN0awCLQ
         yRps9d14zLLAlxSCdDbZjfUqy60hhmwLQKbUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740590134; x=1741194934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f29G2yiDLgtvDH+EVaqm2OVBUjHVsdMjGK88m0Q1skg=;
        b=RbzPErq5Jt6egdYli8iq8bdOy4EqtoATt+XegmwdBTEHcYSafOLn6wp7p0EJ3vB4Gl
         qHbvZaeGZzmW8SlKXo+dFxkeNAFHTNcoqejN4zslqdSWM34W7WKJSTVfo/CoAlzv7K/l
         Sz3/mAwRCGgPNi0fMub5/zj/siiVUh50bXEwPkhUEECn70HiByKsgJdedfs8CrLzlLet
         HYTSkbL9tbncJtiRUwzrUprxrTq4dlqk5SwOxTs+sTMR7Bv35NLboJld6tgF0cT0I0XS
         EJtlXjhJ5n+84c9sDuDLuYPbhXCNPbizoxvKNluC3RP7hX5dKLe/8fBPqbJRXoVX/CUS
         Cx+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWWvceD/n+3OIJAKuV5i41QPq4XuiavjC70GeD/EJcDfalUlW4AWwpMzCY6pykR0j5X/0hi38PSHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUAQ38sQCg9xBVZJ6fC1S3ewRNMoXBne1P8p0MqDSmpPgenpLm
	+PcPElcv1j3fc1moRKAcUnGawyH7BsaPLRDizGKlwb/yAFlX4pXuuk/Ns0vHJzQ=
X-Gm-Gg: ASbGnctcflcZoU+ZHl4CRbwUIMtZDDcqV+uHjknmHbv+tQyKNtY6GV5u3nnFLzDWH/8
	Q2y4Q78ie8GRQX5/c5hIfKNOuZS0v+f7xJ2QP/C5az2mDMHDP4fMqbdxextpiym+RsMO/aVaAps
	8no42TAK/YI2nw6vRW+EI5Elb6smFb5aLAymAmDJSkAraHX83qmyf8PVdDAOwuta5NqAFqsD8Mu
	yh9KdyrIC9PmDRZazAZO72z7gSk3NrDWDlYsk9IDSTa/2z5ODTkDIu8uavt0O0Q6XwGKsnNpT2G
	fYfdLgSidZEjpPCElNBaDaZzuybTXaIXY4JHBKWpP3ErvLYNvCCTp0xOcy9BVmniNw==
X-Google-Smtp-Source: AGHT+IGMVNe1TUEMeHWeLXonRl27DUJcqq8dRFiYGOy3D7TSc9z4S2EmphlwNfkgr4ewEiEwTkV1mQ==
X-Received: by 2002:a05:600c:4193:b0:439:9384:7d08 with SMTP id 5b1f17b1804b1-43afdd934eemr1849935e9.2.1740590133561;
        Wed, 26 Feb 2025 09:15:33 -0800 (PST)
Message-ID: <9a16c457-99a4-4adf-95c9-3f743f05963f@citrix.com>
Date: Wed, 26 Feb 2025 17:15:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] x86/IDT: Collect IDT related content idt.h
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-3-andrew.cooper3@citrix.com>
 <1180f10c-f31e-4254-91ea-ea588326f307@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <1180f10c-f31e-4254-91ea-ea588326f307@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/02/2025 8:27 am, Jan Beulich wrote:
> On 24.02.2025 17:05, Andrew Cooper wrote:
>> Logic concerning the IDT is somewhat different to the other system tables, and
>> in particular ought not to be in asm/processor.h.  Collect it together a new
>> header.
>>
>> While doing so, make a few minor adjustments:
>>
>>  * Make set_ist() use volatile rather than ACCESS_ONCE(), as
>>    _write_gate_lower() already does, removing the need for xen/lib.h.
> While I don't mind this, I'd still like to mention that one of the first things
> I was told when starting to work on Linux was to avoid volatile about everywhere.

Indeed, but that's for "using volatile variables generally".  Here we're
using it very specifically for a single store.

>
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/idt.h
>> @@ -0,0 +1,125 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef X86_ASM_IDT_H
>> +#define X86_ASM_IDT_H
>> +
>> +#include <xen/bug.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/x86-defns.h>
>> +
>> +#define IST_NONE 0
>> +#define IST_MCE  1
>> +#define IST_NMI  2
>> +#define IST_DB   3
>> +#define IST_DF   4
>> +#define IST_MAX  4
>> +
>> +typedef union {
>> +    struct {
>> +        uint64_t a, b;
>> +    };
>> +    struct {
>> +        uint16_t addr0;
>> +        uint16_t cs;
>> +        uint8_t  ist; /* :3, 5 bits rsvd, but this yields far better code. */
>> +        uint8_t  type:4, s:1, dpl:2, p:1;
>> +        uint16_t addr1;
>> +        uint32_t addr2;
>> +        /* 32 bits rsvd. */
>> +    };
>> +} idt_entry_t;
>> +
>> +#define IDT_ENTRIES 256
>> +extern idt_entry_t idt_table[];
>> +extern idt_entry_t *idt_tables[];
>> +
>> +/*
>> + * Set the Interrupt Stack Table used by a particular IDT entry.  Typically
>> + * used on a live IDT, so volatile to disuade clever optimisations.
>> + */
>> +static inline void set_ist(volatile idt_entry_t *idt, unsigned int ist)
>> +{
>> +    /* IST is a 3 bit field, 32 bits into the IDT entry. */
>> +    ASSERT(ist <= IST_MAX);
>> +
>> +    idt->ist = ist;
>> +}
>> +
>> +static inline void enable_each_ist(idt_entry_t *idt)
>> +{
>> +    set_ist(&idt[X86_EXC_DF],  IST_DF);
>> +    set_ist(&idt[X86_EXC_NMI], IST_NMI);
>> +    set_ist(&idt[X86_EXC_MC],  IST_MCE);
>> +    set_ist(&idt[X86_EXC_DB],  IST_DB);
>> +}
>> +
>> +static inline void disable_each_ist(idt_entry_t *idt)
>> +{
>> +    set_ist(&idt[X86_EXC_DF],  IST_NONE);
>> +    set_ist(&idt[X86_EXC_NMI], IST_NONE);
>> +    set_ist(&idt[X86_EXC_MC],  IST_NONE);
>> +    set_ist(&idt[X86_EXC_DB],  IST_NONE);
>> +}
>> +
>> +/*
>> + * Write the lower 64 bits of an IDT Entry. This relies on the upper 32
>> + * bits of the address not changing, which is a safe assumption as all
>> + * functions we are likely to load will live inside the 1GB
>> + * code/data/bss address range.
>> + */
>> +static inline void _write_gate_lower(volatile idt_entry_t *gate,
>> +                                     const idt_entry_t *new)
>> +{
>> +    ASSERT(gate->b == new->b);
>> +    gate->a = new->a;
>> +}
> Would this better move down a few lines, immediately ahead of its two
> use sites?
>
>> +#define _set_gate(gate_addr,type,dpl,addr)               \
> Moving this is questionable, as gates aren't limited to the IDT (in
> principle; yes, we don't use call gates ourselves). However, as you
> move it, my minimal request would be to add the missing blanks here.

_set_gate() doesn't survive to the end of the series, which also fixes
the position of _write_gate_lower().


> Beyond that I wonder ...
>
>> +do {                                                     \
>> +    (gate_addr)->a = 0;                                  \
>> +    smp_wmb(); /* disable gate /then/ rewrite */         \
>> +    (gate_addr)->b =                                     \
>> +        ((unsigned long)(addr) >> 32);                   \
>> +    smp_wmb(); /* rewrite /then/ enable gate */          \
>> +    (gate_addr)->a =                                     \
>> +        (((unsigned long)(addr) & 0xFFFF0000UL) << 32) | \
>> +        ((unsigned long)(dpl) << 45) |                   \
>> +        ((unsigned long)(type) << 40) |                  \
>> +        ((unsigned long)(addr) & 0xFFFFUL) |             \
>> +        ((unsigned long)__HYPERVISOR_CS << 16) |         \
>> +        (1UL << 47);                                     \
>> +} while (0)
> ... whether using the other half of the union would allow this to
> become a little more readable. (Then it would also rightfully live
> here, seeing that the union is typedef-ed to idt_entry_t.) This then
> may also extend to ...
>
>> +static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
>> +                                   unsigned long dpl, void *addr)
>> +{
>> +    idt_entry_t idte;
>> +    idte.b = gate->b;
>> +    idte.a =
>> +        (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
>> +        ((unsigned long)(dpl) << 45) |
>> +        ((unsigned long)(type) << 40) |
>> +        ((unsigned long)(addr) & 0xFFFFUL) |
>> +        ((unsigned long)__HYPERVISOR_CS << 16) |
>> +        (1UL << 47);
> ... here and ...
>
>> +    _write_gate_lower(gate, &idte);
>> +}
>> +
>> +/*
>> + * Update the lower half handler of an IDT entry, without changing any other
>> + * configuration.
>> + */
>> +static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
>> +{
>> +    idt_entry_t idte;
>> +    idte.a = gate->a;
>> +
>> +    idte.b = ((unsigned long)(addr) >> 32);
>> +    idte.a &= 0x0000FFFFFFFF0000ULL;
>> +    idte.a |= (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
>> +        ((unsigned long)(addr) & 0xFFFFUL);
> ... here. Otoh you may have reasons to keep these like they are?

I need to draw the line somewhere on cleanups.  I'm already at 50
patches and I still don't have FRED setup working.

These probably can be cleaned up, but at some later point.

~Andrew

