Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A904A60CE0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914157.1319952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt16P-0002q3-AN; Fri, 14 Mar 2025 09:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914157.1319952; Fri, 14 Mar 2025 09:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt16P-0002mj-7H; Fri, 14 Mar 2025 09:13:13 +0000
Received: by outflank-mailman (input) for mailman id 914157;
 Fri, 14 Mar 2025 09:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt16N-0002jf-5q
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:13:11 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bca0e66-00b4-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 10:13:08 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3912baafc58so1626890f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:13:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe292dbsm11071075e9.19.2025.03.14.02.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 02:13:08 -0700 (PDT)
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
X-Inumbo-ID: 8bca0e66-00b4-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741943588; x=1742548388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tbyOs88czW4LhE2Z8aOvaxuKXJ8dCDwqD6he+2VUkec=;
        b=S/R5Q4mEFADiXB/06KMsDq4ju8C9MyRqU22OheVK3m1hliIGwhktl2qv9Qb1dmyZSw
         qGAT0PfdbmKC2JfX2tyBgcGWcs7fof9Zny2TIe8VNjoX5vY95NnCSMEc6XoscDXiO8P8
         +MA+R95HjhKLEswROIOCWj6nU6nPtoP1usBJEKvzaBY7wiR5VU9EFTCA3MlYxyMH7m/r
         6h3UbCjjmcUQj9KfHZV72m4N/tg86nbT3uDfGwj7M+2kB7WGsg6n0oLxjnSN+vKvhUtV
         GRHUroj4RS8GlgWXmWjKX0Iz5FQ60dfYseUksF29Oy1UJlA5//1z7Rb5IpSnAYjeouNx
         cJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943588; x=1742548388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbyOs88czW4LhE2Z8aOvaxuKXJ8dCDwqD6he+2VUkec=;
        b=YaA7kCAPllmuMpf8+zY+B3tHE9t+xwrQ6ZvpfCmrPz7NYjFdh7VTD2rvtClvC3jReq
         N9/nnIrIIsZWAUCor09X9wWXTKlcDxMOHSicJz8ydIbn0HzcZenZu9gyBEevbXAv4O1e
         xnjSnweQ9ukSTz0SAPltmUu2LNPP8aYAvuG94o8x11vysZfdYOvQSNxDFdpnaZKAiC32
         TmWGd0qu+ynTbdpbGGYWuqicP/+K2g1u23dZJsUPe6PwHS/D94NROnnJ119INIXqOLf/
         ERtxxbpWX4xhQJorW0s93ETfrNQRL5nZmqyXmJVG3oInUMTKGntwVL0cbGXBXrfQhY/o
         4G1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeXqnVIFxVp2iFDbRGoEylkmUg5LHT54rrTX/OFequ9FVrPa4yRB4AdEKiYK/ASmKRJ6Cg60eJE4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEyhDyLoQFuCKj2oB2u1/zB5Vuo8ehqCZzxM0k800LbkjYCb0d
	PZnpHwJFtHRiiz5fCaa78vrXOszAduKS91QaJzarndVyD09CtXmyP74De9ZwqQ==
X-Gm-Gg: ASbGncswwPz/cE9qT3BoaTQTZnnIfpoYAk7KLLyqDjWvYh4n47Q4Ek8930uvEhFy2FH
	NtsuNrCS7nrzwplTb88G/wNrzs+rV/ZyRK3TiuIab8k0DAcjo7ncN3/DQFyGlVrbqkeQuUq+e+g
	RQoqWOvz2y5ZVq4i70rLwto/tOSjOUgmNJwzOTXXmc/NMu6ZXH7lW4T0n4QflPGstTGtBHKBP6e
	YZljtPUA2F8O+3DG+49R0x0RTtsnyqIQ8RuXPIqfS6UXoHEfDL1bju8d2k2rx+EEAeRw4LH4+c9
	nuYClFWI9dnSoEBwAz7qPV8BSygaonNDd3MxGObGJWoldW/Qz+r360rSWr1LHdnynvD895QIhjF
	NFyk3iThWeZHue1otqC1VeSz4RXXYMA==
X-Google-Smtp-Source: AGHT+IEVv22i1lsMMan8/HQ9X9VZ3glAKMZmZZbF6t9PsvoYg8x42Hy1Zv9xCI3KeFh9TB0HdttMOA==
X-Received: by 2002:a5d:5f94:0:b0:391:4914:3c6a with SMTP id ffacd0b85a97d-3971e1b49ccmr2345838f8f.29.1741943588304;
        Fri, 14 Mar 2025 02:13:08 -0700 (PDT)
Message-ID: <3d905488-b3ec-452f-afca-9a7d85484fe9@suse.com>
Date: Fri, 14 Mar 2025 10:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
 <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>
 <Z9PpI8KQnA_gHy9e@macbook.local>
 <729fe31f-69d2-4b4f-8f2b-ac507a65fa27@suse.com>
 <dd147c79-055e-4a94-bb23-4c59821d520a@citrix.com>
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
In-Reply-To: <dd147c79-055e-4a94-bb23-4c59821d520a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2025 10:05, Andrew Cooper wrote:
> On 14/03/2025 8:44 am, Jan Beulich wrote:
>> On 14.03.2025 09:30, Roger Pau Monné wrote:
>>> On Fri, Mar 14, 2025 at 09:24:09AM +0100, Jan Beulich wrote:
>>>> On 13.03.2025 16:30, Roger Pau Monne wrote:
>>>>> When enabling UBSAN with clang, the following error is triggered during the
>>>>> build:
>>>>>
>>>>> common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
>>>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>>>>>       |         ^
>>>>> <inline asm>:1:121: note: instantiated into assembly here
>>>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>>>>>       |                                                                                                                                ^
>>>>> common/wait.c:154:9: error: symbol '.L_skip' is already defined
>>>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>>>>>       |         ^
>>>>> <inline asm>:1:159: note: instantiated into assembly here
>>>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>>>>>       |                                                                                                                                                                      ^
>>>>> 2 errors generated.
>>>>>
>>>>> The inline assembly block in __prepare_to_wait() is duplicated, thus
>>>>> leading to multiple definitions of the otherwise unique labels inside the
>>>>> assembly block.  GCC extended-asm documentation notes the possibility of
>>>>> duplicating asm blocks:
>>>>>
>>>>>> Under certain circumstances, GCC may duplicate (or remove duplicates of)
>>>>>> your assembly code when optimizing. This can lead to unexpected duplicate
>>>>>> symbol errors during compilation if your asm code defines symbols or
>>>>>> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.
>>>>> Move the assembly blocks that deal with saving and restoring the current
>>>>> CPU context into it's own explicitly non-inline functions.  This prevents
>>>>> clang from duplicating the assembly blocks.  Just using noinline attribute
>>>>> seems to be enough to prevent assembly duplication, in the future noclone
>>>>> might also be required if asm block duplication issues arise again.
>>>> Wouldn't it be a far easier / less intrusive change to simply append %= to
>>>> the label names?
>>> That won't work AFAICT, as the inline asm in check_wakeup_from_wait()
>>> won't be able to make a jump to the .L_wq_resume label defined in the
>>> __prepare_to_wait() assembly block if the label is declared as
>>> .L_wq_resume%=.
>>>
>>> Also we want to make sure there's a single .L_wq_resume seeing how
>>> check_wakeup_from_wait() uses it as the restore entry point?
>> Hmm, yes on both points; the %= would only work for .Lskip. Have you gained
>> understanding why there is this duplication? The breaking out of the asm()
>> that you do isn't going to be reliable, as in principle the compiler is
>> still permitted to duplicate stuff. Afaict the only reliable way is to move
>> the code to a separate assembly file (with the asm() merely JMPing there,
>> providing a pseudo-return-address by some custom means). Or to a file-scope
>> asm(), as those can't be duplicated.
> 
> See the simplified example in
> https://github.com/llvm/llvm-project/issues/92161
> 
> When I debugged this a while back, The multiple uses of wqv->esp (one
> explicit after the asm, one as an asm parameter) gain pointer
> sanitisation, so the structure looks like:
> 
>     ...
>     if ( bad pointer )
>         __ubsan_report();
>     asm volatile (...);
>     if ( bad pointer )
>         __ubsan_report();
>     ...
> 
> which then got transformed to:
> 
>     if ( bad pointer )
>     {
>         __ubsan_report();
>         asm volatile (...);
>         __ubsan_report();
>     }
>     else
>         asm volatile (...);

But isn't it then going to be enough to latch &wqv->esp into a local variable,
and use that in the asm() and in the subsequent if()?

Jan

