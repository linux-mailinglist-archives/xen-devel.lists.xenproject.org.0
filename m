Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8036A46109
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 14:38:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896620.1305369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHbp-0007C5-62; Wed, 26 Feb 2025 13:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896620.1305369; Wed, 26 Feb 2025 13:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHbp-00078y-30; Wed, 26 Feb 2025 13:37:57 +0000
Received: by outflank-mailman (input) for mailman id 896620;
 Wed, 26 Feb 2025 13:37:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnHbn-00078s-WF
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 13:37:56 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1618ef6-f446-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 14:37:54 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3885119f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 05:37:53 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fbb5dsm5519208f8f.84.2025.02.26.05.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 05:37:52 -0800 (PST)
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
X-Inumbo-ID: e1618ef6-f446-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740577073; x=1741181873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qig81jNPpMA4uukJ4w8conunWH/GUGtJrVYJmcqli0U=;
        b=hpIYBAualsQ7p5zaMrzP0oKAYnVXk5cC3Wajbryv1iBhZx+P6G74FxL7DgeSf+CIKo
         SoNf/PxdHDuKpqxBtbobU3T553vaRd40EuefEarY8PuolNvKH4/hxJE+YMoCt1tG0PQl
         ngoFRs++xUf+P4W28QiFKgDfeKpS5hAymDd1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740577073; x=1741181873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qig81jNPpMA4uukJ4w8conunWH/GUGtJrVYJmcqli0U=;
        b=nPRpa3VM5DeN8xIvpeQ54Sx83u+Z/lkl4DenMBYQGMA93l72vI6ZuSheSS7eFwa59i
         V5PNPsu3Y3Th5whpcTzwVDa02Ba/oqGDEYj5guzJUEyUw9IrgadGZeDt99KmULmjMWd3
         39B+TP2a4bd3PBgloqoYhJtqKjt6U2RMBy1rW7kILhySBZFgCu4pdRVCNJoXpXmb5tUl
         YMSwArHc9hG7nhUVbgz+xOxy432uz8byYQiIZROY4HFmbx3kxYIok/1wyBIUd0XmFuw9
         lRoN3mRIXugHyXlQ5jAYbB2M3mgAT9h2wMblZCI9OQ8oQPacJfW/3uwsGMspjVxcMFP9
         6P3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTQtw1HgjxyeWHB4xantdVD6G9rnHBJo/xx6k7ZE/F9PkUWA5qZN/4n7qTyXeM+oQV5dEpatGnJMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw07IUNFQIVuo5Vz54TU6uVhnWwawwpRzgrVUPvs+MvkQb3jVDa
	YqjpGm7a/+0fgiim5m4NbISKTvDePJl4DhBJYhR70EIAUq3Rt9OFt3N8ZY/4o3k=
X-Gm-Gg: ASbGncvCHUfl6Uu9704MRXUcvKFoNARxRPym/ad6BXr3tt0hyGUr4fQ2D4ouQRyljB8
	GAENiwf3ki55rmGXLva4LP4rB9x6Nf01mqfgJ6yqN38dxIPVhXlpZ2+XlLLLmQeDl/frsaJgKRT
	XL+Y9TzuWrj1dDiIFV3jFRy5LJ3e21kHL0YPvCJREWYTlgHO3manpn9JkAIJY0ZILyolVoNhobx
	daib3YZ31UBAG+yuooV0Wx71cZ9fE5r/rQMKqRLVX8zrByOVASZs/2YvStg7h1UzKpzbjruB1S1
	RI5YCbueITrhCv7bYxz3x/dy/Jn8Ahu4Z+cyrjaC16xSdj8J8EaGCpzRIBYETkzSqA==
X-Google-Smtp-Source: AGHT+IHpSPYWslggRytd0aqvIMrotI7kQ3xHU04KlDYtFb/aBJJgFXKKwQiGArKZm57N5i2Gqbs6JA==
X-Received: by 2002:a5d:584c:0:b0:390:ddc5:42b2 with SMTP id ffacd0b85a97d-390ddc543dfmr1025471f8f.55.1740577073354;
        Wed, 26 Feb 2025 05:37:53 -0800 (PST)
Message-ID: <87289f57-8862-4300-948c-62e05e4de5ff@citrix.com>
Date: Wed, 26 Feb 2025 13:37:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] x86/IDT: Generate bsp_idt[] at build time
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-7-andrew.cooper3@citrix.com>
 <9524c92f-cc5c-480a-935c-f3b51618c03e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9524c92f-cc5c-480a-935c-f3b51618c03e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 12:39 pm, Jan Beulich wrote:
> On 24.02.2025 17:05, Andrew Cooper wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/gen-idt.h
>> @@ -0,0 +1,121 @@
>> +/*
>> + * Generator for IDT entries.
>> + *
>> + * Caller to provide GEN(vector, symbol, dpl, autogen) macro
>> + *
>> + * Symbols are 'entry_0xYY' if there is no better name available.  Regular
>> + * handlers set autogen=1, while manual (autogen=0) require the symbol to be
>> + * implemented somewhere else.
>> + */
> Doesn't this need something for Eclair to spot the deliberate absence of a
> header guard?

Eclair doesn't complain, although I'm not entirely sure why.

>> +#define DPL0 0
>> +#define DPL1 1
>> +#define DPL3 3
>> +
>> +#define manual 0
>> +#define autogen 1
>> +
>> +#define GEN16(i) \
>> +    GEN(0x ## i ## 0, entry_0x ## i ## 0, DPL0, autogen) \
>> +    GEN(0x ## i ## 1, entry_0x ## i ## 1, DPL0, autogen) \
>> +    GEN(0x ## i ## 2, entry_0x ## i ## 2, DPL0, autogen) \
>> +    GEN(0x ## i ## 3, entry_0x ## i ## 3, DPL0, autogen) \
>> +    GEN(0x ## i ## 4, entry_0x ## i ## 4, DPL0, autogen) \
>> +    GEN(0x ## i ## 5, entry_0x ## i ## 5, DPL0, autogen) \
>> +    GEN(0x ## i ## 6, entry_0x ## i ## 6, DPL0, autogen) \
>> +    GEN(0x ## i ## 7, entry_0x ## i ## 7, DPL0, autogen) \
>> +    GEN(0x ## i ## 8, entry_0x ## i ## 8, DPL0, autogen) \
>> +    GEN(0x ## i ## 9, entry_0x ## i ## 9, DPL0, autogen) \
>> +    GEN(0x ## i ## a, entry_0x ## i ## a, DPL0, autogen) \
>> +    GEN(0x ## i ## b, entry_0x ## i ## b, DPL0, autogen) \
>> +    GEN(0x ## i ## c, entry_0x ## i ## c, DPL0, autogen) \
>> +    GEN(0x ## i ## d, entry_0x ## i ## d, DPL0, autogen) \
>> +    GEN(0x ## i ## e, entry_0x ## i ## e, DPL0, autogen) \
>> +    GEN(0x ## i ## f, entry_0x ## i ## f, DPL0, autogen)
>> +
>> +
>> +GEN(0x00, entry_DE,         DPL0, manual)
>> +GEN(0x01, entry_DB,         DPL0, manual)
>> +GEN(0x02, entry_NMI,        DPL0, manual)
>> +GEN(0x03, entry_BP,         DPL3, manual)
>> +GEN(0x04, entry_OF,         DPL3, manual)
> Would this better be
>
> #ifdef CONFIG_PV32
> GEN(0x04, entry_OF,         DPL3, manual)
> #else
> GEN(0x04, entry_0x04,       DPL0, autogen)
> #endif
>
> ? (Not necessarily in this patch, but in principle.)

No.  INTO can still be used in compatibility mode segment.

Furthermore, for any exception we know about, we want a manual one to
avoid the error-code realignment logic where possible.

>
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/gen-idt.lds.h
>> @@ -0,0 +1,27 @@
>> +/*
>> + * Linker file fragment to help format the IDT correctly
>> + *
>> + * The IDT, having grown compatibly since the 16 bit days, has the entrypoint
>> + * address field split into 3.  x86 ELF lacks the @lo/@hi/etc relocation forms
>> + * commonly found in other architectures for accessing a part of a resolved
>> + * symbol address.
>> + *
>> + * However, the linker can perform the necessary calculations and provide them
>> + * under new symbol names.  We use this to generate the low and next 16 bits
>> + * of the address for each handler.
>> + *
>> + * The upper 32 bits are always a constant as Xen's .text/data/rodata sits in
>> + * a single aligned 1G range, so do not need calculating in this manner.
>> + */
>> +#ifndef X86_IDT_GEN_LDS_H
>> +#define X86_IDT_GEN_LDS_H
>> +
>> +#define GEN(vec, sym, dpl, auto)                                        \
>> +    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR1 = ABSOLUTE(((sym) & 0xffff))); \
>> +    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR2 = ABSOLUTE(((sym >> 16) & 0xffff)));
> Not sure if Eclair gets to see this at all, but maybe better parenthesize
> sym also in the latter instance?

Oh, yes.

> As to the final semicolon - ideally this would be on the use sites of GEN(),
> for things to look more C-ish. Yet I won't insist, as gen-idt.h ends up
> looking sufficiently uniform for this to not be a major concern.

I'm afraid it's necessary (and too in entry stubs).

It's the GEN16() macro, which expands 16x GEN() on the same line.

I could drop the GEN16() macro and do everything longhand, but I suspect
you'd like that even less.

~Andrew

