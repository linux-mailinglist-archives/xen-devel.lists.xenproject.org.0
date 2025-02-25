Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519CFA4379C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 09:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895488.1304115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmqIK-0002Zy-GP; Tue, 25 Feb 2025 08:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895488.1304115; Tue, 25 Feb 2025 08:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmqIK-0002Xo-Dc; Tue, 25 Feb 2025 08:28:00 +0000
Received: by outflank-mailman (input) for mailman id 895488;
 Tue, 25 Feb 2025 08:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmqIJ-0002Xf-EB
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 08:27:59 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a6bb5e4-f352-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 09:27:57 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso32839275e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 00:27:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd883c68sm1497862f8f.60.2025.02.25.00.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 00:27:56 -0800 (PST)
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
X-Inumbo-ID: 6a6bb5e4-f352-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740472076; x=1741076876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MYYAnogiF9Pi5jGv/Ozu7SaeHXhXjmUZPo1k9kYoUDk=;
        b=AgmLwYYbz0HvmIyB2iWrMJuZsjZXnj0mt+YgbwiurtTbfoVJnHHaplmV2TuLzgjU4t
         VeKQyC/GaHQX93/+nnqKn97XvyKjINX0V90VYfzE18K/i87d3uBPkVFq9Gfnc+WsnNvI
         8AgfxM9KZDrQavSZl9TJ9SIlpWoHCNbEjDt2QaI29e7XebNtOU9Ji5HhS9SF12BIQicY
         lv51107+QVZUS+eiWxpAye9Ahn8hzaP9ceSKSNFRIyz17W9MM6njbDK+7KLXd8nYQ3rL
         IQe6JvLs5jRAD7exH6czkqQUbucRP76tiCPaTRFSHiXjB+cJdWP9rB9Qyx2F6OL1alzD
         3rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740472076; x=1741076876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYYAnogiF9Pi5jGv/Ozu7SaeHXhXjmUZPo1k9kYoUDk=;
        b=jrSafVyWUygwz7Fq/0cWNlIeKMBVmkUd39JHKx93qRupPT+xRLWnETTp33smZqy1Vk
         IHhGAIKz2C8Sd5LezhLfy91muZ+GZF0kjtpBRjhx43ccAQH35Jp56JzOKXJGpGwDvoRC
         oKoqPKOjaLt/MvTlIChyOn05Z2kY6gBtG8i+n6s6KP6P2DN/sTEkq1id7j9qOfbQdL0b
         8v4qAfKNQmmsdyJV3uTLP1VY9uIITU6KHdoNlkDNN3UVbYHXo4qgRTex/dp3lujo8c2B
         dJVpDTJNm4yvVSXKNHRle1C/asgfH1b7JtLo00BU52ef+A+s8ZeAE/Qz4BgEm0MyGTHk
         WAlw==
X-Forwarded-Encrypted: i=1; AJvYcCVJfPVIPZdYvuei0nR1KPS3W57dh00WR1C2vA5+pUQOsbBIMboaaRF6ky7nm6j1GoS/kf5QFyrI+OQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvygBl3hvt+mshYkkg+0ePQSdw1iDSQF7guijOd9b8iEr2z4PM
	Oji/eIIKyVOhgckVMtzjEi7P8I/Hmwxt5nPOTi8DsWFqCSLJToVNJsvTM4aBOw==
X-Gm-Gg: ASbGnctZSo9QN+6Mo0DdBbfST3wK5TFMkeQmw8SpJ2CSe4x6xXJ2aSisuYk+gg+CIsN
	2fCTqFXh5B8UaNs+dnE8jNnUJO+kfHQqM4XrU6ZG9bNP5xXCUy92p+W/fxPca8yKTCHShtbeNN5
	+I4c8zXC2YLt6EgqD8RcpJa46+mhBfaX0f6uGM9Xy7vfbj7cuTKsehM5D9lop1bC7ycqV/Vsvkn
	qHEar1rVp8flFfHAuKQ41QCXkRVVAsbgp+WCb7sbdwTf8NiMJ+P+kSVmtm8XDboSLZIKlTXKbh5
	bSLciKqlRRvALDQH9H6XKNi+u4glcq06E443fFHALfzpMtG0sP4SpFS8AqosAMs3O0OYD8k0y0U
	+Zr2keywCxFY=
X-Google-Smtp-Source: AGHT+IEjKtaRy7w4SFC/iaeFEK07fOUM7xTRzx3oWtc11Z4g7uFsFqIs11n2RRLYL6moe7bhnuSp4Q==
X-Received: by 2002:a5d:47a3:0:b0:38d:d8fb:e90f with SMTP id ffacd0b85a97d-38f6e975ca7mr12996505f8f.24.1740472076455;
        Tue, 25 Feb 2025 00:27:56 -0800 (PST)
Message-ID: <1180f10c-f31e-4254-91ea-ea588326f307@suse.com>
Date: Tue, 25 Feb 2025 09:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] x86/IDT: Collect IDT related content idt.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250224160509.1117847-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 17:05, Andrew Cooper wrote:
> Logic concerning the IDT is somewhat different to the other system tables, and
> in particular ought not to be in asm/processor.h.  Collect it together a new
> header.
> 
> While doing so, make a few minor adjustments:
> 
>  * Make set_ist() use volatile rather than ACCESS_ONCE(), as
>    _write_gate_lower() already does, removing the need for xen/lib.h.

While I don't mind this, I'd still like to mention that one of the first things
I was told when starting to work on Linux was to avoid volatile about everywhere.

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/idt.h
> @@ -0,0 +1,125 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef X86_ASM_IDT_H
> +#define X86_ASM_IDT_H
> +
> +#include <xen/bug.h>
> +#include <xen/types.h>
> +
> +#include <asm/x86-defns.h>
> +
> +#define IST_NONE 0
> +#define IST_MCE  1
> +#define IST_NMI  2
> +#define IST_DB   3
> +#define IST_DF   4
> +#define IST_MAX  4
> +
> +typedef union {
> +    struct {
> +        uint64_t a, b;
> +    };
> +    struct {
> +        uint16_t addr0;
> +        uint16_t cs;
> +        uint8_t  ist; /* :3, 5 bits rsvd, but this yields far better code. */
> +        uint8_t  type:4, s:1, dpl:2, p:1;
> +        uint16_t addr1;
> +        uint32_t addr2;
> +        /* 32 bits rsvd. */
> +    };
> +} idt_entry_t;
> +
> +#define IDT_ENTRIES 256
> +extern idt_entry_t idt_table[];
> +extern idt_entry_t *idt_tables[];
> +
> +/*
> + * Set the Interrupt Stack Table used by a particular IDT entry.  Typically
> + * used on a live IDT, so volatile to disuade clever optimisations.
> + */
> +static inline void set_ist(volatile idt_entry_t *idt, unsigned int ist)
> +{
> +    /* IST is a 3 bit field, 32 bits into the IDT entry. */
> +    ASSERT(ist <= IST_MAX);
> +
> +    idt->ist = ist;
> +}
> +
> +static inline void enable_each_ist(idt_entry_t *idt)
> +{
> +    set_ist(&idt[X86_EXC_DF],  IST_DF);
> +    set_ist(&idt[X86_EXC_NMI], IST_NMI);
> +    set_ist(&idt[X86_EXC_MC],  IST_MCE);
> +    set_ist(&idt[X86_EXC_DB],  IST_DB);
> +}
> +
> +static inline void disable_each_ist(idt_entry_t *idt)
> +{
> +    set_ist(&idt[X86_EXC_DF],  IST_NONE);
> +    set_ist(&idt[X86_EXC_NMI], IST_NONE);
> +    set_ist(&idt[X86_EXC_MC],  IST_NONE);
> +    set_ist(&idt[X86_EXC_DB],  IST_NONE);
> +}
> +
> +/*
> + * Write the lower 64 bits of an IDT Entry. This relies on the upper 32
> + * bits of the address not changing, which is a safe assumption as all
> + * functions we are likely to load will live inside the 1GB
> + * code/data/bss address range.
> + */
> +static inline void _write_gate_lower(volatile idt_entry_t *gate,
> +                                     const idt_entry_t *new)
> +{
> +    ASSERT(gate->b == new->b);
> +    gate->a = new->a;
> +}

Would this better move down a few lines, immediately ahead of its two
use sites?

> +#define _set_gate(gate_addr,type,dpl,addr)               \

Moving this is questionable, as gates aren't limited to the IDT (in
principle; yes, we don't use call gates ourselves). However, as you
move it, my minimal request would be to add the missing blanks here.
Beyond that I wonder ...

> +do {                                                     \
> +    (gate_addr)->a = 0;                                  \
> +    smp_wmb(); /* disable gate /then/ rewrite */         \
> +    (gate_addr)->b =                                     \
> +        ((unsigned long)(addr) >> 32);                   \
> +    smp_wmb(); /* rewrite /then/ enable gate */          \
> +    (gate_addr)->a =                                     \
> +        (((unsigned long)(addr) & 0xFFFF0000UL) << 32) | \
> +        ((unsigned long)(dpl) << 45) |                   \
> +        ((unsigned long)(type) << 40) |                  \
> +        ((unsigned long)(addr) & 0xFFFFUL) |             \
> +        ((unsigned long)__HYPERVISOR_CS << 16) |         \
> +        (1UL << 47);                                     \
> +} while (0)

... whether using the other half of the union would allow this to
become a little more readable. (Then it would also rightfully live
here, seeing that the union is typedef-ed to idt_entry_t.) This then
may also extend to ...

> +static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
> +                                   unsigned long dpl, void *addr)
> +{
> +    idt_entry_t idte;
> +    idte.b = gate->b;
> +    idte.a =
> +        (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
> +        ((unsigned long)(dpl) << 45) |
> +        ((unsigned long)(type) << 40) |
> +        ((unsigned long)(addr) & 0xFFFFUL) |
> +        ((unsigned long)__HYPERVISOR_CS << 16) |
> +        (1UL << 47);

... here and ...

> +    _write_gate_lower(gate, &idte);
> +}
> +
> +/*
> + * Update the lower half handler of an IDT entry, without changing any other
> + * configuration.
> + */
> +static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
> +{
> +    idt_entry_t idte;
> +    idte.a = gate->a;
> +
> +    idte.b = ((unsigned long)(addr) >> 32);
> +    idte.a &= 0x0000FFFFFFFF0000ULL;
> +    idte.a |= (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
> +        ((unsigned long)(addr) & 0xFFFFUL);

... here. Otoh you may have reasons to keep these like they are?

Could both _set_gate_lower() and _update_gate_addr_lower() have their
last parameters each be switched to pointer-to-const (they supposedly point
into .text after all)?

Jan

