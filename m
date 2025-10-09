Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBB4BC7C58
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 09:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140351.1475263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6lLJ-0001Hz-VP; Thu, 09 Oct 2025 07:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140351.1475263; Thu, 09 Oct 2025 07:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6lLJ-0001G5-SU; Thu, 09 Oct 2025 07:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1140351;
 Thu, 09 Oct 2025 07:45:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6lLI-0001Fz-E8
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 07:45:40 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2d46f7c-a4e3-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 09:45:38 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso5000935e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 00:45:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46faf111a15sm33656575e9.7.2025.10.09.00.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 00:45:37 -0700 (PDT)
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
X-Inumbo-ID: f2d46f7c-a4e3-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759995938; x=1760600738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L2N+/TIqHBj42hNIBMLZRF7/eORmxb3TeXjzn3TTWA0=;
        b=fRC8wPgv7yvKHE/9Y0KdjUwWOomnayiAoSl1H9cLJUhUKtul6ECNbyVqYQgaHok0Fn
         p88MJlMqr0Ok4pLlL5NHinh04glIFvxTgSyguFJujt8PbuzafWvtk8c8VMG8v2Dcx/WF
         JaaPNrgqdwJOq7IMdPhTDGV8Qgj25LfpNmJIQbPvbX2adRDxxQgxUMXRuPLuFpmVEYf4
         GJlsGXQREstd6OeQRmEchnFx/UH2Atpq4tQ5RX6Yrx9eC9mb35hF+YwBj/Wd40ublGz5
         XeGf0prAcykx/g8BgATzGHPDnUHsZGly7JtHU0r9s3tX1OWEFksC2l3t+N6JqvrLNxK7
         DOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759995938; x=1760600738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2N+/TIqHBj42hNIBMLZRF7/eORmxb3TeXjzn3TTWA0=;
        b=pwr/irlOYBA+TIa8k710OydM7kpCCWRr+qTF7LjCoBCYEQPrpqzkcr4S9vn8Je9uW9
         UdZRl4qJY9h8p9TPHMK5NJOboS15N+T90N+SlyO1rOzB6pEQuSuAYZh9ynZ0KTFStsUx
         FiatWTjX3IK3W0QN7T3MDoluXHGLjwyUw9c4qqShNlVCPYRuVSPJS4Az3mG4TCnO96J4
         YcLO+NHKscfpAUqZg5Jzxlm68mvT72aNRjiikPizGHGJbHZnnTKdt8yVW91H7Nfcc8z0
         V2yFASe3WtyDCEZf1mGWRgDrLyGJXh0ojX23OpdoBuQEBFluCoIWa85BcRIcQlga2Bua
         1VAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/beXo9v1HsRdTuW+UyKw5EA/kbI3l5yBKEeFAy/dGsJOSIG5qOOaZ/AQJyKPkjRGOjWqMBxRL8Yo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZGZgn9RDNfCX2XNvvPVwtrTRMbO/+T/rXG3TBZQW5ddZdxI2E
	noSnapgj6x9IPnvN1NpHg8MtfCG6zktSEgsypKOwE7VUUAqltWfjfcPiFrOkt4WdYg==
X-Gm-Gg: ASbGncsZ5LvSYNOVuSuwQH9OsRL1cGpTP52nPH+eET6vBRcclURaRRpYsF6FMA/SsDk
	v8wiokZGg8kQfOXVzhHcRy32/4jgW+41zfUSvnSsUvJbAFKbnX1cMhJRHtzNb4EkEHlqN1Yqu5f
	ebVM4AhnSakRiCdOrr5O+TQNtvtQG5nwDFuQQBFj9sZv86N9aeyiK1r+vZTKuJpqLSkhYoa95li
	Dk3yAxciMLf2FZexZhkvSso3z8VLhmcaEXif1X0TQJZYwJBd7WuC1So9tarw6MQr7+MtoXfJwBI
	GIShqIjRYGUjf5/k+eYEQ7wcyUU6ylfdHIjiCDZqiBju0mQPfggahBJXMnSt31RtxzoLL6KJUml
	IqRDaN26qaqPuzM4iLJjEuX3cJUgqgsf7rOacmMaaq4qg/lZFwLfZ/VGeujk+JyvQF9RgDwUdEb
	3lDzKTtPDc7z9KtqJ/oLQE9FVbD4/PGX1BAV4LMKHEGg==
X-Google-Smtp-Source: AGHT+IEyl3zqL3ML9iFoSZ4JEcp3q5zv8GjlN5U0EriFXDOkpRQFIiktcJTmJw1o8njVXb29V8WZew==
X-Received: by 2002:a05:600c:4ed4:b0:46d:1a9b:6d35 with SMTP id 5b1f17b1804b1-46fa9ec7718mr51707375e9.14.1759995938137;
        Thu, 09 Oct 2025 00:45:38 -0700 (PDT)
Message-ID: <60f4c0b0-de20-40ce-bf61-e8ec6fa54460@suse.com>
Date: Thu, 9 Oct 2025 09:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: guard synthetic feature and bug enumerators
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
 <3601abf2-c556-4126-9e42-1c08803e2613@citrix.com>
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
In-Reply-To: <3601abf2-c556-4126-9e42-1c08803e2613@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2025 19:19, Andrew Cooper wrote:
> On 25/09/2025 11:48 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/alternative.h
>> +++ b/xen/arch/x86/include/asm/alternative.h
>> @@ -70,12 +70,12 @@ extern void alternative_instructions(voi
>>                      alt_repl_len(n2)) "-" alt_orig_len)
>>  
>>  #define ALTINSTR_ENTRY(feature, num)                                    \
>> -        " .if (" STR(feature & ~ALT_FLAG_NOT) ") >= " STR(NCAPINTS * 32) "\n" \
>> +        " .if (%c" #feature " & " STR(~ALT_FLAG_NOT) ") >= " STR(NCAPINTS * 32) "\n" \
>>          " .error \"alternative feature outside of featureset range\"\n" \
>>          " .endif\n"                                                     \
>>          " .long .LXEN%=_orig_s - .\n"             /* label           */ \
>>          " .long " alt_repl_s(num)" - .\n"         /* new instruction */ \
>> -        " .word " STR(feature) "\n"               /* feature bit     */ \
>> +        " .word %c" #feature "\n"                 /* feature bit     */ \
>>          " .byte " alt_orig_len "\n"               /* source len      */ \
>>          " .byte " alt_repl_len(num) "\n"          /* replacement len */ \
>>          " .byte " alt_pad_len "\n"                /* padding len     */ \
>> @@ -127,14 +127,14 @@ extern void alternative_instructions(voi
>>   */
>>  #define alternative(oldinstr, newinstr, feature)                        \
>>      asm_inline volatile (                                               \
>> -        ALTERNATIVE(oldinstr, newinstr, feature)                        \
>> -        ::: "memory" )
>> +        ALTERNATIVE(oldinstr, newinstr, [feat])                         \
>> +        :: [feat] "i" (feature) : "memory" )
> 
> I don't understand.  How is this related to putting the guard in place?

The change here is needed to fit the change to ALTINSTR_ENTRY() above. That
change in turn is needed because

#define X86_SYNTH(x) (FSCAPINTS * 32 + (x) + X86_CHECK_FEAT_NR(x, SYNTH))

with

#define X86_CHECK_FEAT_NR(x, n) BUILD_BUG_ON_ZERO((x) / 32 >= X86_NR_ ## n)

now needs to be evaluated by the compiler. If we used stringification as
before, the assembler would get to see BUILD_BUG_ON_ZERO().

>> --- a/xen/arch/x86/include/asm/cpufeatureset.h
>> +++ b/xen/arch/x86/include/asm/cpufeatureset.h
>> @@ -12,8 +12,13 @@ enum {
>>  };
>>  #undef XEN_CPUFEATURE
>>  
>> +#if __GNUC__ >= 15
>> +#define XEN_CPUFEATURE(name, value) asm (".equ X86_FEATURE_" #name ", %c0" \
>> +                                         :: "i" (X86_FEATURE_##name));
>> +#else
>>  #define XEN_CPUFEATURE(name, value) asm (".equ X86_FEATURE_" #name ", " \
>>                                           __stringify(value));
>> +#endif
> 
> Again - why are we making a no-op change for the sake of it?

See above.

>> --- a/xen/arch/x86/include/asm/pdx.h
>> +++ b/xen/arch/x86/include/asm/pdx.h
>> @@ -13,9 +13,9 @@
>>      asm_inline goto (                               \
>>          ALTERNATIVE(                                \
>>              "",                                     \
>> -            "jmp %l0",                              \
>> -            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
>> -        : : : : label )
>> +            "jmp %l1",                              \
>> +            [feat])                                 \
>> +        : : [feat] "i" (ALT_NOT(X86_FEATURE_PDX_COMPRESSION)) : : label )
> 
> Not a bug in this change, but the pre-existing use of positional labels
> is something I was expecting not to introduce at all seeing as we
> started cleanly with named labels.
> 
> The jmp wants to be:
> 
>   "jmp %l" #label
> 
> to cope with the fact it's a macro parameter too.

Unrelated change? I can of course do the adjustment in a separate prereq
patch, but then it would have been nice if you had commented along these
lines before that code actually had gone in.

That said, isn't it at least bad practice to not expose the label use to
the compiler? To avoid using positional operands, shouldn't we rather
name the operand, and then use "jmp %l[whatever_the_name]"? That's a
change I could see as being justified to do right here, rather than in a
separate patch.

>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>>  
>>      /* (ab)use alternative_input() to specify clobbers. */
>>      alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
>> -                      : "rax", "rcx");
>> +                      "i" (0) : "rax", "rcx");
>>  }
> 
> As the comment says, this is already an abuse of the macro for a purpose
> it wasn't intended for.
> 
> Now requiring an extra "nop" parameter to get the abuse to compile is
> too far.  It can turn into a plain ALTERNATIVE(), and then both disappear.

Except that, for the reasons explained further up, I'd rather not see new
explicit uses of ALTERNATIVE() appear. In the end it's not clear which
one is the lesser evil. Maybe we should gain alternative_clobber()?

Jan

