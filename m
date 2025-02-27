Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EAA476D4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 08:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897866.1306502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYdq-0005xO-Oo; Thu, 27 Feb 2025 07:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897866.1306502; Thu, 27 Feb 2025 07:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYdq-0005wb-KM; Thu, 27 Feb 2025 07:49:10 +0000
Received: by outflank-mailman (input) for mailman id 897866;
 Thu, 27 Feb 2025 07:49:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnYdp-0005eR-1H
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 07:49:09 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52b0966c-f4df-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 08:49:07 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f31f7732dso368794f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 23:49:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b7a28b6fbsm13379825e9.35.2025.02.26.23.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 23:49:06 -0800 (PST)
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
X-Inumbo-ID: 52b0966c-f4df-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740642547; x=1741247347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vDzEmOVEB5a7Gjbp+MBnC3SRxmd56kyPxbHYT3gQcoY=;
        b=OKE8H+7YXJ/eadxGTF5OYvg4RqJ18MP/AKJeCpNLTFPtMypf08nLDC+ECq+4egx80c
         AeU6mEOsFyGJlDl92iV4rnmVWfMzVJc4FGqeW9vfWVJjmHDHKyz+I8X2kGmc6kVJSJ8n
         I03F3y3NHyd+Oj/doOYCMT9CcLAosd99HcJsJaCqMfP+AGlZGy9sth9YZZjE7d86rC9y
         QT2F/TLsrengZlJTbIf50ScVMEQBkBzNUe4DBqQHB9fJAlNKOgUUymv9Is9wXl83i1kK
         PgLPYDgPf7P5z5vFRoxgVXVnIhVuxoT81wLsxC8seoKGlB2her4SA7cMLVA+HjAL6FSB
         va+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740642547; x=1741247347;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDzEmOVEB5a7Gjbp+MBnC3SRxmd56kyPxbHYT3gQcoY=;
        b=uAn81BpFKrCuPpbvTRyx7ngDJyU0QLCMsUdo3ak4zO7n6ZjLG3cMqN8xXnLXn2mPFt
         qqljZFliuov5puwDGY4rApQknLVa4f/h94ZT7+TVphqqdbX9i+HkhdpLK5a6+hqrcpad
         CXUAbgAgsbYEFF8QhyVYdqDIkR2eJi8bzQ/F3Itzfdpn4wJo6rgDJPJU9uDHs8cqrREG
         A6Wj+ynnoCJY/+ZhAcz3zVzTTaDjT2g/ktRGIHhcIhxmQ3DxBwyxw76uMvW0DnRLBhGl
         +VYDAeu0cVNFVmNH+BFHD30BdnO9AqxntloLEmHxVqVnJEhFeapx56yIYFC9ZqmLBBsT
         fLsw==
X-Forwarded-Encrypted: i=1; AJvYcCVMAd7Vs7Xu/qqzX4q/3OpC+LHeejSTSmMsTFdto43ATN3Yc+eutLbgSlF6IRQjhd6yIBve7pfqt4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0kxkfldjv6XWM4IEnUBlrFJsZx/BuuIbydVHv7egtFRFiAEqo
	kvzu6yuctmIjpFccdFlSz45w9LRViMG7Zbxc677WBGmyLu4KxeXuDLDgmFdDUw==
X-Gm-Gg: ASbGncsJXSoYhGUKPWh3tbrJ36WuPkirlrTU2DdFI8Bn1TLpbxMROmx8jM0rFpqXXYv
	3IkPRhbzibN8vUPJh4T90GU/0eCbwgZJ/Q/Ta/16YMAANcMMmz+YSRJwj7SgVgBqMTYtN9bk1UT
	mj0hYUFcE3iYmLFCAdK9sBrUecGVqBbrnZc30Xyk6dRF16mBtdxm2bUWvxWeoEIC6uoR/Ede9wr
	g0dYfdhXE7sG02zUgLwCpI+fQzzAIwEvOaaIpKkw/0rg6EKDHv6FoTK0rlLcgBbBxddLDtddS0u
	9Btf+J77IJmBvz86ZRP7mTY0ow/XKmMzWlMf2Ln33dQX4hQ+9lQxGU/2jvZDPj5zLbBPD8bbOkz
	/VKk39Bdf+zI=
X-Google-Smtp-Source: AGHT+IFIelOE09zj0/0caxLXx35oxHC+iAXwSQhjSPaDVw4Joz0S34YWrbl2e7tK2cfG+LiIdeI7Cw==
X-Received: by 2002:a5d:47a1:0:b0:38d:d59c:c9d6 with SMTP id ffacd0b85a97d-390e18c957emr1960818f8f.21.1740642546998;
        Wed, 26 Feb 2025 23:49:06 -0800 (PST)
Message-ID: <7acb14ac-07ed-4f7f-8f8a-c38e04ddc06e@suse.com>
Date: Thu, 27 Feb 2025 08:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] x86/IDT: Collect IDT related content idt.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-3-andrew.cooper3@citrix.com>
 <1180f10c-f31e-4254-91ea-ea588326f307@suse.com>
 <9a16c457-99a4-4adf-95c9-3f743f05963f@citrix.com>
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
In-Reply-To: <9a16c457-99a4-4adf-95c9-3f743f05963f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 18:15, Andrew Cooper wrote:
> On 25/02/2025 8:27 am, Jan Beulich wrote:
>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/idt.h
>>> @@ -0,0 +1,125 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef X86_ASM_IDT_H
>>> +#define X86_ASM_IDT_H
>>> +
>>> +#include <xen/bug.h>
>>> +#include <xen/types.h>
>>> +
>>> +#include <asm/x86-defns.h>
>>> +
>>> +#define IST_NONE 0
>>> +#define IST_MCE  1
>>> +#define IST_NMI  2
>>> +#define IST_DB   3
>>> +#define IST_DF   4
>>> +#define IST_MAX  4
>>> +
>>> +typedef union {
>>> +    struct {
>>> +        uint64_t a, b;
>>> +    };
>>> +    struct {
>>> +        uint16_t addr0;
>>> +        uint16_t cs;
>>> +        uint8_t  ist; /* :3, 5 bits rsvd, but this yields far better code. */
>>> +        uint8_t  type:4, s:1, dpl:2, p:1;
>>> +        uint16_t addr1;
>>> +        uint32_t addr2;
>>> +        /* 32 bits rsvd. */
>>> +    };
>>> +} idt_entry_t;
>>> +
>>> +#define IDT_ENTRIES 256
>>> +extern idt_entry_t idt_table[];
>>> +extern idt_entry_t *idt_tables[];
>>> +
>>> +/*
>>> + * Set the Interrupt Stack Table used by a particular IDT entry.  Typically
>>> + * used on a live IDT, so volatile to disuade clever optimisations.
>>> + */
>>> +static inline void set_ist(volatile idt_entry_t *idt, unsigned int ist)
>>> +{
>>> +    /* IST is a 3 bit field, 32 bits into the IDT entry. */
>>> +    ASSERT(ist <= IST_MAX);
>>> +
>>> +    idt->ist = ist;
>>> +}
>>> +
>>> +static inline void enable_each_ist(idt_entry_t *idt)
>>> +{
>>> +    set_ist(&idt[X86_EXC_DF],  IST_DF);
>>> +    set_ist(&idt[X86_EXC_NMI], IST_NMI);
>>> +    set_ist(&idt[X86_EXC_MC],  IST_MCE);
>>> +    set_ist(&idt[X86_EXC_DB],  IST_DB);
>>> +}
>>> +
>>> +static inline void disable_each_ist(idt_entry_t *idt)
>>> +{
>>> +    set_ist(&idt[X86_EXC_DF],  IST_NONE);
>>> +    set_ist(&idt[X86_EXC_NMI], IST_NONE);
>>> +    set_ist(&idt[X86_EXC_MC],  IST_NONE);
>>> +    set_ist(&idt[X86_EXC_DB],  IST_NONE);
>>> +}
>>> +
>>> +/*
>>> + * Write the lower 64 bits of an IDT Entry. This relies on the upper 32
>>> + * bits of the address not changing, which is a safe assumption as all
>>> + * functions we are likely to load will live inside the 1GB
>>> + * code/data/bss address range.
>>> + */
>>> +static inline void _write_gate_lower(volatile idt_entry_t *gate,
>>> +                                     const idt_entry_t *new)
>>> +{
>>> +    ASSERT(gate->b == new->b);
>>> +    gate->a = new->a;
>>> +}
>> Would this better move down a few lines, immediately ahead of its two
>> use sites?
>>
>>> +#define _set_gate(gate_addr,type,dpl,addr)               \
>> Moving this is questionable, as gates aren't limited to the IDT (in
>> principle; yes, we don't use call gates ourselves). However, as you
>> move it, my minimal request would be to add the missing blanks here.
> 
> _set_gate() doesn't survive to the end of the series, which also fixes
> the position of _write_gate_lower().

Hmm, okay:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

