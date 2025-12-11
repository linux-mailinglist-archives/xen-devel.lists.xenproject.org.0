Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC264CB51A7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 09:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183660.1506278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTc36-0003gF-9H; Thu, 11 Dec 2025 08:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183660.1506278; Thu, 11 Dec 2025 08:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTc36-0003dU-6g; Thu, 11 Dec 2025 08:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1183660;
 Thu, 11 Dec 2025 08:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTc35-0003dO-16
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 08:29:19 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b567a73-d66b-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 09:29:16 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so5652565e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 00:29:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89f8c145sm21211475e9.14.2025.12.11.00.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 00:29:15 -0800 (PST)
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
X-Inumbo-ID: 7b567a73-d66b-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765441756; x=1766046556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1V7G1jCTSBTpI3Cu3Bvy+huNe6UFlhveKmCz4bf/14I=;
        b=GGKgEbbdxG9JD5o+AXwJnysolUDBFxYuL6C5EXdLX8/0Ub0mfyqpKbvdJ82/IdcRAd
         rlL79Ok+RC6EBmby6zN3e2G125yH+WLUuNG7uSYqdcNH15uV47IF4T8C/oUXv5lk9Mxd
         YA8bPtVcij/R4CHNu/ZmfDDMLO854xC1tFoLPpL67+xj+8r5JT3oS+PtrFr5pBy8t5ro
         b06b9A1W6cve5aqsxzAW8tEyc7kVzcJ9jsC8iCGMezLCy+q3gJ41fZtLb1fY6pwP++/i
         8+CLmCvHhcyL/uIh1qYsDkhouAPEzI7plRpOWh6tU4LcI4RI5aOc87q7NfWoDE/dLn7p
         dIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765441756; x=1766046556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V7G1jCTSBTpI3Cu3Bvy+huNe6UFlhveKmCz4bf/14I=;
        b=TQqU/fZqhbV93df8lW1WeElVAevzdFMRpILC2xUkCKsQZEVVfvPF6GOiSvhTKYAN/Z
         kl5ofO5aBh02wkBQybrOHX9BYpMBlNOvs8uthLPW3tMSgUmrKfS2/gwEaAMjdrvSaN4l
         cqtyvOGFF7rscIXt6Dma6/SrKEPxAyrbO6zb1LLpwX42c9v1vuqTmw11/Ij9Nz2Ubkbc
         d+DmKS6Ss/X3WnRU6noUGpdNGOhDY7lh3mPiz4AecqkmFo9ZsrshmK/HBYql4+BpcDk6
         aNzsni/CKFEQH/RwlXxvt3tKyaqoNPC/E+wASPigevo8XiD21y3ZzYS6zPmnOshpQQly
         79Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWYpn+4n+LNXE7o5yuz5EVa40sQHaGgQ9onzJ+3+9WR6GyacmwfMTZMH82nc0QVPIN3EI0vPo/zP8w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaBSV2jrUsKougGIrH2TqHcl/5Nk+02qKlIlOLc4H0mgInEMs/
	1+tDFLSTaA5t8vwmVl3Z9OYjUTaZ8w0nzvXcEJfaRVVROqXhsJIE3iOLB5GpQWo5RQ==
X-Gm-Gg: AY/fxX4fIqq73hWmxNZi8PW9BK3KoMTPqm2MmdSksj8dSOQWurxKaAV8C5E2vQpehTk
	dKvWbHtHPQ10AkPn07oei89ks9iWsDa97G2L9JFzpuZ8jf+dqjFvacYTBLK09QzXP1AnDDEJt6W
	Zirm3YN3ZIGRrpKnOGVzMksdJdfUsQA8ZO66UdZ5gcfqkPwB7sZzuCWP9COTdD4iC61suC5w+5u
	FELGJag+KABID8K9J6Gfh9rAJVm/za+y6jgpfrcICSb3N/Gh7NU2Zoa4v4mlSY6YWz2kwvtqbsa
	cjWU2hhk5kVCgLeS10Xb49g9PylPAG99XoW6FsizIvuf3ppNM5YMEXAI4tsfues93MN9KiMJJ6I
	MVfiNdDYGoIhWr05ATCKpNJxvuqejP2Ti2eW07U5QTdAmSIieCnBg3x153fhAdC/B1z8Qq5w9OI
	+BwHDNxCgbcWxlCxUO58DNDCVgEAFxV0JGZzxagjEUWMIKhC279tnyNTRrS2j/b/eE+q0mgiXdW
	bw=
X-Google-Smtp-Source: AGHT+IGSvaUzRqLUk790lBLgFqUFBAmItnySMBPneME13IZLqGOFjyj9ImxanBM9fMbG3N08DzPe2g==
X-Received: by 2002:a05:600c:1392:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47a8378cdafmr47120025e9.22.1765441756277;
        Thu, 11 Dec 2025 00:29:16 -0800 (PST)
Message-ID: <7514a67c-d140-43b6-bed0-3467530a086d@suse.com>
Date: Thu, 11 Dec 2025 09:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Victor Lira <victorm.lira@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
 <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
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
In-Reply-To: <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 03:47, Andrew Cooper wrote:
> On 11/12/2025 1:28 am, Jason Andryuk wrote:
>> On 2025-12-10 11:55, Andrew Cooper wrote:
>>> On 09/12/2025 9:47 pm, Jason Andryuk wrote:
>>>>          . = ALIGN(4);
>>>>          __alt_instructions = .;
>>>> -       *(.altinstructions)
>>>> +       KEEP(*(.altinstructions))
>>>>          __alt_instructions_end = .;
>>>
>>> Thinking about this, what we need is for there to be a reference tied to
>>> the source location, referencing the replacement metadata and
>>> replacement instructions.
>>>
>>> Looking at https://maskray.me/blog/2021-02-28-linker-garbage-collection
>>> might be able to do this with .reloc of type none.  In fact,
>>> BFD_RELOC_NONE seems to have been invented for precisely this purpose.
>>>
>>> This means that if and only if the source function gets included, so
>>> does the metadata and replacement.
>>
>> With Jan's -Wa,--sectname-subst changes added to CFLAGS, this seems to
>> work somewhat.  I'm trying to make the ALTERNATIVE place relocations
>> against the .altinstructions.%%S and .altinstr_replacement sections:
>>
>> diff --git c/xen/arch/x86/include/asm/alternative.h
>> w/xen/arch/x86/include/asm/alternative.h
>> index 18109e3dc5..e871bfc04c 100644
>> --- c/xen/arch/x86/include/asm/alternative.h
>> +++ w/xen/arch/x86/include/asm/alternative.h
>> @@ -90,18 +90,25 @@ extern void alternative_instructions(void);
>>  /* alternative assembly primitive: */
>>  #define ALTERNATIVE(oldinstr, newinstr, feature)                      \
>>          OLDINSTR_1(oldinstr, 1)                                       \
>> -        ".pushsection .altinstructions, \"a\", @progbits\n"           \
>> +        ".reloc ., BFD_RELOC_NONE, 567f\n"                            \
>> +        ".reloc ., BFD_RELOC_NONE, 568f\n"                            \
>> +        ".pushsection .altinstructions.%%S, \"a\", @progbits\n"       \
>> +        "567:\n"                                                      \
>>          ALTINSTR_ENTRY(feature, 1)                                    \
>>          ".section .discard, \"a\", @progbits\n"                       \
>>          ".byte " alt_total_len "\n" /* total_len <= 255 */            \
>>          DISCARD_ENTRY(1)                                              \
>>          ".section .altinstr_replacement, \"ax\", @progbits\n"         \
>> +        "568:\n"                                                      \
>>          ALTINSTR_REPLACEMENT(newinstr, 1)                             \
>>          ".popsection\n"
>>
> 
> There's already a symbol for the start of the replacement.  We only need
> to introduce a symbol for the metadata.  Try something like this:
> 
> diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
> index 18109e3dc594..a1295ed816f5 100644
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -55,6 +55,10 @@ extern void alternative_instructions(void);
>  
>  #define as_max(a, b) "(("a") ^ ((("a") ^ ("b")) & -("AS_TRUE("("a") < ("b")")")))"
>  
> +#define REF(num)                                        \
> +    ".reloc ., BFD_RELOC_NONE, .LXEN%=_alt" #num "\n\t" \
> +    ".reloc ., BFD_RELOC_NONE, "alt_repl_s(num)  "\n\t"

Is it even worthwhile trying to further pursue this route if xen.efi can't
be built with it?

Jan

