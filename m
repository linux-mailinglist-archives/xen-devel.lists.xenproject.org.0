Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715EB27CE4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 11:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083107.1442760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqdW-0001gz-8w; Fri, 15 Aug 2025 09:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083107.1442760; Fri, 15 Aug 2025 09:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqdW-0001fY-6G; Fri, 15 Aug 2025 09:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1083107;
 Fri, 15 Aug 2025 09:22:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umqdV-0001fS-1j
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 09:22:09 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50043b9f-79b9-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 11:22:06 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-618adc251f0so755092a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 02:22:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b3d060dbsm759606a12.20.2025.08.15.02.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 02:22:05 -0700 (PDT)
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
X-Inumbo-ID: 50043b9f-79b9-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755249726; x=1755854526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=brLLhGRT55+VOoNIyf07zvY7oyz20C3zFD/8TMrXLGU=;
        b=fRk8ZXmtOSd0Scb5ppGHN2Xl4VforIwJRdsBlJd45l1ZBUqXaqrO3vfaRupVcEeIZK
         FyNlJ66yS9mL58r1gCeAgsOSZMkUImnW/9/xYgsVxZpm0LoDhPkR5/Cf+03IG6VAHc4j
         JtBCxZCidZd0HLDkBvVdtm3almeKtWMffegxEw6sMVhXWGvfyH/UprE89gFHhDKQHvFC
         VaWFe6/QWH/xfAWPRDThJsqxbI2aHrC3OYNKyo8yZ0lVbCsbFmJVMMbvM0ETG1uOND1q
         ZTJRS/7B0mzr23hW/V22qv7RY0k6AFGHejiJ2SCB1/72Nncgj7VU6is0hjo4uPpSOWU+
         piAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755249726; x=1755854526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brLLhGRT55+VOoNIyf07zvY7oyz20C3zFD/8TMrXLGU=;
        b=FyqyZTZKbLhfh/MtkUU8dk9HqJyaSRYEin4D7u59kS+UCMCn6FZroiT0rJeSrMIL8V
         pN/IhD2QHjslDr1jTMc+1yiOdwzdBOZjetbN9QNBx0z4K4hyDg2ZVTnvHn6mTSA3Ekhp
         fd/bkhv5EzvHwRRC4ABERiEz3y1LtLJ6Q6U9UN9S09SUpCeazdbCDwJwWfDJCzEQPCXV
         IZlAYC0tNy23vuOy96O5itdOV2EUiS6+2hvxsQ/iYbiS4uWzPZRwH755ueMuiI8+dhfa
         0/lVDJ5YobYlAUr4/xJK8xeu5U9J2TSjPvpGsz8VOamNUpvooWhd2DYexiZ3zo2M3bk7
         eEVA==
X-Forwarded-Encrypted: i=1; AJvYcCUuZzBkCWO1P1x/k1+vv/K85vdDJh2ctOCqJtjacQZvuoy16V6m8YFudlG3UPte8fNCpFBapxNrwE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfHaLdyFxfi7aL0tKJQYxOIegUCwaXAANNdGvfsLjeiLd16IrN
	1J+0eHgikr+pjes1Q/p+kfsPOQE+Hy6fOEHOlU0TjQ3mPgxrUAGhX2DHiX2kquB4Ow==
X-Gm-Gg: ASbGncvvpViNeFy5w47y4Y8g+6Nd9D19cK57xWAFO3yyzkIU8rav2o+jPhkwjLm8wGl
	LoDppl6tSwl1gz6kvf6RQkubnp9I2regyTe9tZKaaA+mZu0R1koNhJL7dI7xGYukLExwlVSirwF
	jbg8dqewIbR7pevA8vHAXdvX5U/r/K9wceCPvSXgdxWc9NlZd00EMkpFR5QBw3IgGO4cjvlM/iK
	4Npv++mhn3slBvANqS7ENXi1UHOo0c7Gm4B/gwtiENyXXOeEh0rnufTqt4+nwKhQlrAQtnYKfkR
	0oU5F65SHFgZQ7BHLDLYw3Zem1qHkPG/tghkC3Zj/wK+XCxjwex+IaPe+BTDGoP3vODu0l8mj+z
	2ZG+YQXpJVTOhSSAZH93gF6shXIjxEKsaD/oAjX3vtGlO/CG+dVV7Jw1p1FpVzdzKKXFsaEn0Na
	4ddBBj5JQ=
X-Google-Smtp-Source: AGHT+IF6mTrWtQfME2OE9P1P3//2+bVBGyVi8VVX8X0yHDRspi89E+xetHUHaVmenm/nOeqZv/K92w==
X-Received: by 2002:a05:6402:2681:b0:618:3a9d:53df with SMTP id 4fb4d7f45d1cf-618b054e95bmr963827a12.17.1755249726175;
        Fri, 15 Aug 2025 02:22:06 -0700 (PDT)
Message-ID: <6ddc980c-f526-4e01-9294-1b60aa3c843a@suse.com>
Date: Fri, 15 Aug 2025 11:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] x86/traps: Introduce FRED entrypoints
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-22-andrew.cooper3@citrix.com>
 <53028a31-e07d-43f1-b320-2775c5560a09@suse.com>
 <37cb95df-520e-45b3-9003-b638296d1001@citrix.com>
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
In-Reply-To: <37cb95df-520e-45b3-9003-b638296d1001@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 22:40, Andrew Cooper wrote:
> On 14/08/2025 4:57 pm, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/msr.h
>>> +++ b/xen/arch/x86/include/asm/msr.h
>>> @@ -202,9 +202,9 @@ static inline unsigned long read_gs_base(void)
>>>  
>>>  static inline unsigned long read_gs_shadow(void)
>>>  {
>>> -    unsigned long base;
>>> +    unsigned long base, cr4 = read_cr4();
>>>  
>>> -    if ( read_cr4() & X86_CR4_FSGSBASE )
>>> +    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
>>>      {
>>>          asm volatile ( "swapgs" );
>>>          base = __rdgsbase();
>>> @@ -234,7 +234,9 @@ static inline void write_gs_base(unsigned long base)
>>>  
>>>  static inline void write_gs_shadow(unsigned long base)
>>>  {
>>> -    if ( read_cr4() & X86_CR4_FSGSBASE )
>>> +    unsigned long cr4 = read_cr4();
>>> +
>>> +    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
>>>      {
>>>          asm volatile ( "swapgs\n\t"
>>>                         "wrgsbase %0\n\t"
>> I don't quite get how these changes fit into this patch.
> 
> Without the change, read_registers() suffers #UD because of the SWAPGS.
> 
> This recurses until hitting the guard page, then repeats the same on the
> #DF stack.  And because stacks work nicely under FRED, you eventually
> hit #DF's guard page.
> 
> Strictly speaking it's only read_gs_shadow() which we need to change to
> make exception handling work, but I fixed both at the same time.
> 
> That said, I have actually cleaned this codepath up with the MSR work
> because the code gen in read_registers() is terrible.  Due to
> no-strict-aliasing, every store into state-> forces a recalculation of
> get_cpu_info(), meaning that read_cr4() cannot be hoisted, and there's a
> branch in every helper.
> 
> I'm still not sure how best to fit it into this series.

Could these two hunks move to another prereq patch, then coming with its
own description?

>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -1013,6 +1013,32 @@ void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
>>>          printk("Non-responding CPUs: {%*pbl}\n", CPUMASK_PR(&show_state_mask));
>>>  }
>>>  
>>> +static const char *x86_et_name(unsigned int type)
>>> +{
>>> +    static const char *const names[] = {
>>> +        [X86_ET_EXT_INTR]    = "EXT_INTR",
>>> +        [X86_ET_NMI]         = "NMI",
>>> +        [X86_ET_HW_EXC]      = "HW_EXC",
>>> +        [X86_ET_SW_INT]      = "SW_INT",
>>> +        [X86_ET_PRIV_SW_EXC] = "PRIV_SW_EXEC",
>>> +        [X86_ET_SW_EXC]      = "SW_EXEC",
>>> +        [X86_ET_OTHER]       = "OTHER",
>>> +    };
>>> +
>>> +    return (type < ARRAY_SIZE(names) && names[type]) ? names[type] : "???";
>>> +}
>>> +
>>> +static const char *x86_et_other_name(unsigned int vec)
>> This isn't really a vector, is it?
> 
> Well - you are decoding the field name regs->fred_ss.vector.

Hmm, yes, the field is re-used, but I'm in trouble viewing these as vectors.
Anyway - I would prefer a rename, but I won't insist.

>>> --- a/xen/arch/x86/x86_64/Makefile
>>> +++ b/xen/arch/x86/x86_64/Makefile
>>> @@ -1,6 +1,7 @@
>>>  obj-$(CONFIG_PV32) += compat/
>>>  
>>>  obj-bin-y += entry.o
>>> +obj-bin-y += entry-fred.o
>> For the ordering here, ...
>>
>>> --- /dev/null
>>> +++ b/xen/arch/x86/x86_64/entry-fred.S
>>> @@ -0,0 +1,35 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +        .file "x86_64/entry-fred.S"
>>> +
>>> +#include <asm/asm_defns.h>
>>> +#include <asm/page.h>
>>> +
>>> +        .section .text.entry, "ax", @progbits
>>> +
>>> +        /* The Ring3 entry point is required to be 4k aligned. */
>>> +
>>> +FUNC(entry_FRED_R3, 4096)
>> ... doesn't this 4k-alignment requirement suggest we want to put
>> entry-fred.o first?
> 
> Perhaps, but that is quite subtle.  I did also consider a
> .text.entry.page_aligned section, but .text.entry only matters for XPTI
> which (as agreed), I'm not intending to implement in FRED mode unless it
> proves to be necessary.
> 
> Also IIRC there's still a symbol bug where _sentrytext takes priority
> over entry_FRED_R3, so the backtrace is effectively wrong.
> 
> (These are all bad excuses, but some parts of this series are rather old.)

Are you sure this is still the case with entry_FRED_R<n> properly typed as
functions (while _stextentry has no type)? When choosing which symbol to
display, objdump prefers typed over type-less symbols:

  /* Sort function and object symbols before global symbols before
     local symbols before section symbols before debugging symbols.  */

>>  Also, might it be more natural to use PAGE_SIZE
>> here?
> 
> I did debate that, but the spec uses 0xfff, not pages, even if the
> pipline surely does have an optimisation for chopping 12 metadata bits
> off the bottom of a pointer.

Plus pretty certainly a page boundary is meant here, no matter how things
are worded.

Jan

