Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70188A46448
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 16:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896845.1305593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJ7P-0001xg-Nc; Wed, 26 Feb 2025 15:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896845.1305593; Wed, 26 Feb 2025 15:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJ7P-0001wC-Ke; Wed, 26 Feb 2025 15:14:39 +0000
Received: by outflank-mailman (input) for mailman id 896845;
 Wed, 26 Feb 2025 15:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnJ7O-0001KY-1R
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 15:14:38 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63fcbef5-f454-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 16:14:36 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4399ee18a57so6877355e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 07:14:36 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8e7108sm6027212f8f.69.2025.02.26.07.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 07:14:35 -0800 (PST)
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
X-Inumbo-ID: 63fcbef5-f454-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740582876; x=1741187676; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro+XIxeDTyz/XU1jg+mRowNia4JOrt8ConDcnWLgyv4=;
        b=dWF93MoBVIHlIs4N0x72lTYjzLv42m3NiM4tiw+BaqH0D5r7obSxGmfs+Q3r6iVFQo
         88cUv/2nT9oWMdk4GXycZPsrA6BoKTHthYtxSt1lEMFevDOKEW1O50vecM6rpy4Jle3w
         GxcFdd4Lf5La6KWi4g+kCRcjPE03nAV9ZH2Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740582876; x=1741187676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro+XIxeDTyz/XU1jg+mRowNia4JOrt8ConDcnWLgyv4=;
        b=Q9u3uUzCvCSGQlAe3IoqmF7T+gwk8gohNDRkAo2KJu4UPluAdxuteESkziY6g8e8WD
         epd24NUham8+LzXzIXU3Fv9lXbU8zT+Lmo4p2n6N9IrK/Jj9meNormax2MUU9ZGKgTbb
         kLbiVXaocWG465OH42wCenl2vE11Kh9pdkrGZWSzZtGp0lvPoxLUR/5clBRSI96xoikc
         z2Z7KfcvGl/N306C5S72U5LYBRdyr633tBvs8/ZtM5u0Ggt3IILV8foV1gjDIaWddUKo
         WPdQ/K6VHftVrUbMR070MJRhHm83ZejgX02OolmjBNKBqegema/qzuxhwNkzTmrP6jFN
         G3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWoFf2GU5rIjAUAKLm+rpypY5VfWnDel8Rn1f+vQdbE/XlXfVP27vY00fcLFxBlBTk/BNihf2YuLos=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6nupC9L0mnWal0WKtIKXBxyTn6kyMoJIHNqwe1avX+KjqSCVx
	/ZqEUOQnUw3sU/fk9b3eS5FgV3w0IpWlDjr6gj7oVAPwFqH5EQRypb9fLz3vkKg=
X-Gm-Gg: ASbGnctG/HwViJFlU1og4iFCR5wTNcmcoj0DfgkczKI4hEzpOJqRGOxf7aIsIVJB6Kv
	xKrtjRRiOb4Z40N7PEFuGlQ6qAn7Cf6prm11tLXwjDe+/MzCNQlD2ABj1y6RgwzckdroHPhc+0b
	O7ZGBR7Q+dCB/giOK0G32KBHGgme9lLuzUPT5Dx5eVXTp+zXQ4mkuLsqJNLEKwLx8/OqbMQ+gdl
	HXyFQC8uyBro+k4F4CWXBfpAs9/Pn3VE3TJQcdXEMIEuqxBxJY8sJwffCoC0b9kybcxIfaLMZZG
	Jgvd51QLmumexBf9ixe5oo/1syZ3IUUHgolyDxGTP5sPEiDScavnbsAaPeXHkTMOjw==
X-Google-Smtp-Source: AGHT+IFyeSOJQamRs/IVTwZCrHYRo+gkV3NJHR0xnpd9Y2wCKEAJ/DyzpcwqeYYXjyO0ravoIr6YhA==
X-Received: by 2002:a05:600c:58d4:b0:439:9536:fa6b with SMTP id 5b1f17b1804b1-439a30e65c0mr216219565e9.13.1740582875917;
        Wed, 26 Feb 2025 07:14:35 -0800 (PST)
Message-ID: <e26cdb1a-9aa2-4ca2-94c2-c6c4afe9a46f@citrix.com>
Date: Wed, 26 Feb 2025 15:14:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] x86/IDT: Generate bsp_idt[] at build time
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-7-andrew.cooper3@citrix.com>
 <9524c92f-cc5c-480a-935c-f3b51618c03e@suse.com>
 <87289f57-8862-4300-948c-62e05e4de5ff@citrix.com>
 <dff0e60a-e56a-4092-9641-6045a2712306@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <dff0e60a-e56a-4092-9641-6045a2712306@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 2:14 pm, Jan Beulich wrote:
> On 26.02.2025 14:37, Andrew Cooper wrote:
>> On 26/02/2025 12:39 pm, Jan Beulich wrote:
>>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/x86/include/asm/gen-idt.h
>>>> @@ -0,0 +1,121 @@
>>>> +/*
>>>> + * Generator for IDT entries.
>>>> + *
>>>> + * Caller to provide GEN(vector, symbol, dpl, autogen) macro
>>>> + *
>>>> + * Symbols are 'entry_0xYY' if there is no better name available.  Regular
>>>> + * handlers set autogen=1, while manual (autogen=0) require the symbol to be
>>>> + * implemented somewhere else.
>>>> + */
>>> Doesn't this need something for Eclair to spot the deliberate absence of a
>>> header guard?
>> Eclair doesn't complain, although I'm not entirely sure why.
>>
>>>> +#define DPL0 0
>>>> +#define DPL1 1
>>>> +#define DPL3 3
>>>> +
>>>> +#define manual 0
>>>> +#define autogen 1
>>>> +
>>>> +#define GEN16(i) \
>>>> +    GEN(0x ## i ## 0, entry_0x ## i ## 0, DPL0, autogen) \
>>>> +    GEN(0x ## i ## 1, entry_0x ## i ## 1, DPL0, autogen) \
>>>> +    GEN(0x ## i ## 2, entry_0x ## i ## 2, DPL0, autogen) \
>>>> +    GEN(0x ## i ## 3, entry_0x ## i ## 3, DPL0, autogen) \
>>>> +    GEN(0x ## i ## 4, entry_0x ## i ## 4, DPL0, autogen) \
>>>> +    GEN(0x ## i ## 5, entry_0x ## i ## 5, DPL0, autogen) \
>>>> +    GEN(0x ## i ## 6, entry_0x ## i ## 6, DPL0, autogen) \
>>>> +    GEN(0x ## i ## 7, entry_0x ## i ## 7, DPL0, autogen) \
>>>> +    GEN(0x ## i ## 8, entry_0x ## i ## 8, DPL0, autogen) \
>>>> +    GEN(0x ## i ## 9, entry_0x ## i ## 9, DPL0, autogen) \
>>>> +    GEN(0x ## i ## a, entry_0x ## i ## a, DPL0, autogen) \
>>>> +    GEN(0x ## i ## b, entry_0x ## i ## b, DPL0, autogen) \
>>>> +    GEN(0x ## i ## c, entry_0x ## i ## c, DPL0, autogen) \
>>>> +    GEN(0x ## i ## d, entry_0x ## i ## d, DPL0, autogen) \
>>>> +    GEN(0x ## i ## e, entry_0x ## i ## e, DPL0, autogen) \
>>>> +    GEN(0x ## i ## f, entry_0x ## i ## f, DPL0, autogen)
>>>> +
>>>> +
>>>> +GEN(0x00, entry_DE,         DPL0, manual)
>>>> +GEN(0x01, entry_DB,         DPL0, manual)
>>>> +GEN(0x02, entry_NMI,        DPL0, manual)
>>>> +GEN(0x03, entry_BP,         DPL3, manual)
>>>> +GEN(0x04, entry_OF,         DPL3, manual)
>>> Would this better be
>>>
>>> #ifdef CONFIG_PV32
>>> GEN(0x04, entry_OF,         DPL3, manual)
>>> #else
>>> GEN(0x04, entry_0x04,       DPL0, autogen)
>>> #endif
>>>
>>> ? (Not necessarily in this patch, but in principle.)
>> No.  INTO can still be used in compatibility mode segment.
> Oh, of course.
>
>> Furthermore, for any exception we know about, we want a manual one to
>> avoid the error-code realignment logic where possible.
> Why would that not apply to Co-processor Segment Overrun then?

It kinda does apply.

We've never ever had CSO handler (hence why it was autogen'd the first
time I tried making this more robust), and you didn't like my patch to
autogen the exception entries.
The CSO handler (and SPV) are the only two we can be pretty confident
will never trigger on today's hardware, yet you also didn't like my
suggestion of having them Not Present.
>>>> --- /dev/null
>>>> +++ b/xen/arch/x86/include/asm/gen-idt.lds.h
>>>> @@ -0,0 +1,27 @@
>>>> +/*
>>>> + * Linker file fragment to help format the IDT correctly
>>>> + *
>>>> + * The IDT, having grown compatibly since the 16 bit days, has the entrypoint
>>>> + * address field split into 3.  x86 ELF lacks the @lo/@hi/etc relocation forms
>>>> + * commonly found in other architectures for accessing a part of a resolved
>>>> + * symbol address.
>>>> + *
>>>> + * However, the linker can perform the necessary calculations and provide them
>>>> + * under new symbol names.  We use this to generate the low and next 16 bits
>>>> + * of the address for each handler.
>>>> + *
>>>> + * The upper 32 bits are always a constant as Xen's .text/data/rodata sits in
>>>> + * a single aligned 1G range, so do not need calculating in this manner.
>>>> + */
>>>> +#ifndef X86_IDT_GEN_LDS_H
>>>> +#define X86_IDT_GEN_LDS_H
>>>> +
>>>> +#define GEN(vec, sym, dpl, auto)                                        \
>>>> +    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR1 = ABSOLUTE(((sym) & 0xffff))); \
>>>> +    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR2 = ABSOLUTE(((sym >> 16) & 0xffff)));
>>> Not sure if Eclair gets to see this at all, but maybe better parenthesize
>>> sym also in the latter instance?
>> Oh, yes.
>>
>>> As to the final semicolon - ideally this would be on the use sites of GEN(),
>>> for things to look more C-ish. Yet I won't insist, as gen-idt.h ends up
>>> looking sufficiently uniform for this to not be a major concern.
>> I'm afraid it's necessary (and too in entry stubs).
>>
>> It's the GEN16() macro, which expands 16x GEN() on the same line.
> Right, as said - the semicolons would need putting after every GEN() invocation,
> including in GEN16() (with the final one likely excluded, for the semicolon then
> to appear on its use site).

Ah, I see what you mean.  I'll see if I can make it work.

~Andrew

