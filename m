Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49CA46211
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896691.1305449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIBP-0008SH-Bl; Wed, 26 Feb 2025 14:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896691.1305449; Wed, 26 Feb 2025 14:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIBP-0008Pa-8w; Wed, 26 Feb 2025 14:14:43 +0000
Received: by outflank-mailman (input) for mailman id 896691;
 Wed, 26 Feb 2025 14:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnIBO-0008PU-0H
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:14:42 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04c333e7-f44c-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 15:14:40 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso44116745e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:14:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fcd03sm5825097f8f.99.2025.02.26.06.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:14:39 -0800 (PST)
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
X-Inumbo-ID: 04c333e7-f44c-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740579280; x=1741184080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=12wc+V/NXib8qwElCxfa6bN+nXrNTDkV5voLSbPzWwU=;
        b=FAAIACJX62VfDg7bFPB4sr82rn4E4TIfHeAYBEzQDcbc+UzXbK7Ek3u8V6s1C0vYkI
         j9zgFz/Lr4QXkKe8SdI0ZfRPTn7ezk4Ema4L0oGtHS6nt+Cwc71o9oEljjJMWRKNWrm9
         8BOa369IW1EYAhJ2eGLukoZvrzVM2RHPBnLK544OL7srmulEg0vQh/76g9AlsTpsdoqd
         oPNVuBXLW4fhtGDZg7LzrJJtpP9OwY3ibMr+OlJFQPjBf7uQpxCNREH22BW9ipaN/uEs
         c69bNGKsf/ug+Cx9Q0lLx4thWGo0qpMGHM+mRVpdRNN+cfm0hiEeESUtP4DfB0Dzjxra
         /wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579280; x=1741184080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12wc+V/NXib8qwElCxfa6bN+nXrNTDkV5voLSbPzWwU=;
        b=TpvRyKp0LFcopi2qD7atE2PsfvAl0G1AfMNpBFfk6BHn00a3CKAcApG2896cxrtW0/
         mWgsJy7ehHJh7Y9MYbC3otxNDwo+w9ASLklhyKeUid0yXAanC8sBkqC7beprZs0lbLd/
         3U0NdUO4y03BfJCFROhVcnIw7n83I4pnwOnwJf7ePMbAzI1MZvJ9AbIsn7G46dE2tKOD
         cN7DW4AIzi1+V+ju6nk6fPpN14+0z+KPkN6d2KP7loWHNHlXslWk6x0jjxZ67cCDaviQ
         Dl4NaS9rfH/g7574/UhfpgeNueTigVid4XfS2qpN1QFJeLHCnr+yFbvhPQVTtsT0q7j5
         9nRg==
X-Forwarded-Encrypted: i=1; AJvYcCVyc7tIgr7HJgQwa+qsgsxRDaikL/5h4WstV5x3nXN9P3N+nnxz0E6QJZE4vkw5cwC/5wVMyK96GYo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7YFFRfskbYpuvLsS1F7gOOcw5vNeH8wVnM/lZhyxMoISNXR9W
	j38hG8aiXIzuS1Aoof1sF3LTAANcWg0S55pDQi9oJPpRWi3jxnDjW34Kd61Cl7x2sUFGtGWBqsk
	=
X-Gm-Gg: ASbGnctdO2TPPRwvimZrMM3oefgcMWaSw3XOMP5RTyIcCl9inJ92Y6pdez3g92JVDxg
	fECBYWSXy2vgA8H+fxEwZry12xv6uV0ux9clbwr1giCbFMopeOAPdJsZxWRGUrSIwN0dhFxFKt/
	Y2/11ZhhWrhQSO+SVgP4EyttpxHM2jOvuqeBDJY1WS3KKVj0RetMWiuxA3qkmiG82LT20hLPeNL
	Z63z0otcJ5mVwzaXfZJN02t9nb7wshjxcERELMUweW32yylB7PeScsYyxNJDG2uPsko/OIOEEpB
	TOPuCcgwAxF5WNnjmAnleAZV573/Me+kZTE53Q7Tx+dKQ6Sgd3SqPAilz3pXJ5YgVvowCZLxYAX
	C1j7BaRX8FNw=
X-Google-Smtp-Source: AGHT+IFqQ0Wvx5RJq5LzNhO+P08iFENOEDfKI/dxoFr32fPE1ckfwBgNOD6eCWC3gIMzFp+fuPMm1A==
X-Received: by 2002:a05:6000:2a5:b0:38c:617c:ee2f with SMTP id ffacd0b85a97d-390d4f3ba5cmr2487333f8f.13.1740579280100;
        Wed, 26 Feb 2025 06:14:40 -0800 (PST)
Message-ID: <dff0e60a-e56a-4092-9641-6045a2712306@suse.com>
Date: Wed, 26 Feb 2025 15:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] x86/IDT: Generate bsp_idt[] at build time
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-7-andrew.cooper3@citrix.com>
 <9524c92f-cc5c-480a-935c-f3b51618c03e@suse.com>
 <87289f57-8862-4300-948c-62e05e4de5ff@citrix.com>
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
In-Reply-To: <87289f57-8862-4300-948c-62e05e4de5ff@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 14:37, Andrew Cooper wrote:
> On 26/02/2025 12:39 pm, Jan Beulich wrote:
>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/gen-idt.h
>>> @@ -0,0 +1,121 @@
>>> +/*
>>> + * Generator for IDT entries.
>>> + *
>>> + * Caller to provide GEN(vector, symbol, dpl, autogen) macro
>>> + *
>>> + * Symbols are 'entry_0xYY' if there is no better name available.  Regular
>>> + * handlers set autogen=1, while manual (autogen=0) require the symbol to be
>>> + * implemented somewhere else.
>>> + */
>> Doesn't this need something for Eclair to spot the deliberate absence of a
>> header guard?
> 
> Eclair doesn't complain, although I'm not entirely sure why.
> 
>>> +#define DPL0 0
>>> +#define DPL1 1
>>> +#define DPL3 3
>>> +
>>> +#define manual 0
>>> +#define autogen 1
>>> +
>>> +#define GEN16(i) \
>>> +    GEN(0x ## i ## 0, entry_0x ## i ## 0, DPL0, autogen) \
>>> +    GEN(0x ## i ## 1, entry_0x ## i ## 1, DPL0, autogen) \
>>> +    GEN(0x ## i ## 2, entry_0x ## i ## 2, DPL0, autogen) \
>>> +    GEN(0x ## i ## 3, entry_0x ## i ## 3, DPL0, autogen) \
>>> +    GEN(0x ## i ## 4, entry_0x ## i ## 4, DPL0, autogen) \
>>> +    GEN(0x ## i ## 5, entry_0x ## i ## 5, DPL0, autogen) \
>>> +    GEN(0x ## i ## 6, entry_0x ## i ## 6, DPL0, autogen) \
>>> +    GEN(0x ## i ## 7, entry_0x ## i ## 7, DPL0, autogen) \
>>> +    GEN(0x ## i ## 8, entry_0x ## i ## 8, DPL0, autogen) \
>>> +    GEN(0x ## i ## 9, entry_0x ## i ## 9, DPL0, autogen) \
>>> +    GEN(0x ## i ## a, entry_0x ## i ## a, DPL0, autogen) \
>>> +    GEN(0x ## i ## b, entry_0x ## i ## b, DPL0, autogen) \
>>> +    GEN(0x ## i ## c, entry_0x ## i ## c, DPL0, autogen) \
>>> +    GEN(0x ## i ## d, entry_0x ## i ## d, DPL0, autogen) \
>>> +    GEN(0x ## i ## e, entry_0x ## i ## e, DPL0, autogen) \
>>> +    GEN(0x ## i ## f, entry_0x ## i ## f, DPL0, autogen)
>>> +
>>> +
>>> +GEN(0x00, entry_DE,         DPL0, manual)
>>> +GEN(0x01, entry_DB,         DPL0, manual)
>>> +GEN(0x02, entry_NMI,        DPL0, manual)
>>> +GEN(0x03, entry_BP,         DPL3, manual)
>>> +GEN(0x04, entry_OF,         DPL3, manual)
>> Would this better be
>>
>> #ifdef CONFIG_PV32
>> GEN(0x04, entry_OF,         DPL3, manual)
>> #else
>> GEN(0x04, entry_0x04,       DPL0, autogen)
>> #endif
>>
>> ? (Not necessarily in this patch, but in principle.)
> 
> No.  INTO can still be used in compatibility mode segment.

Oh, of course.

> Furthermore, for any exception we know about, we want a manual one to
> avoid the error-code realignment logic where possible.

Why would that not apply to Co-processor Segment Overrun then?

>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/gen-idt.lds.h
>>> @@ -0,0 +1,27 @@
>>> +/*
>>> + * Linker file fragment to help format the IDT correctly
>>> + *
>>> + * The IDT, having grown compatibly since the 16 bit days, has the entrypoint
>>> + * address field split into 3.  x86 ELF lacks the @lo/@hi/etc relocation forms
>>> + * commonly found in other architectures for accessing a part of a resolved
>>> + * symbol address.
>>> + *
>>> + * However, the linker can perform the necessary calculations and provide them
>>> + * under new symbol names.  We use this to generate the low and next 16 bits
>>> + * of the address for each handler.
>>> + *
>>> + * The upper 32 bits are always a constant as Xen's .text/data/rodata sits in
>>> + * a single aligned 1G range, so do not need calculating in this manner.
>>> + */
>>> +#ifndef X86_IDT_GEN_LDS_H
>>> +#define X86_IDT_GEN_LDS_H
>>> +
>>> +#define GEN(vec, sym, dpl, auto)                                        \
>>> +    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR1 = ABSOLUTE(((sym) & 0xffff))); \
>>> +    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR2 = ABSOLUTE(((sym >> 16) & 0xffff)));
>> Not sure if Eclair gets to see this at all, but maybe better parenthesize
>> sym also in the latter instance?
> 
> Oh, yes.
> 
>> As to the final semicolon - ideally this would be on the use sites of GEN(),
>> for things to look more C-ish. Yet I won't insist, as gen-idt.h ends up
>> looking sufficiently uniform for this to not be a major concern.
> 
> I'm afraid it's necessary (and too in entry stubs).
> 
> It's the GEN16() macro, which expands 16x GEN() on the same line.

Right, as said - the semicolons would need putting after every GEN() invocation,
including in GEN16() (with the final one likely excluded, for the semicolon then
to appear on its use site).

> I could drop the GEN16() macro and do everything longhand, but I suspect
> you'd like that even less.

Indeed.

Jan

