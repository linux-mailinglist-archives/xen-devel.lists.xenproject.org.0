Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2C88797D3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:41:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691919.1078513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4FS-0001nw-Ka; Tue, 12 Mar 2024 15:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691919.1078513; Tue, 12 Mar 2024 15:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4FS-0001mQ-Hh; Tue, 12 Mar 2024 15:41:02 +0000
Received: by outflank-mailman (input) for mailman id 691919;
 Tue, 12 Mar 2024 15:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk4FQ-0001mK-NU
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:41:00 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eca16ec0-e086-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 16:40:59 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56840d872aeso4257625a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 08:40:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cq15-20020a056402220f00b0056761c83bdesm4068487edb.93.2024.03.12.08.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 08:40:58 -0700 (PDT)
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
X-Inumbo-ID: eca16ec0-e086-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710258059; x=1710862859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSMa9ltAFpDnZugHD70b4ResjpouQ80j9uB/02gDj7A=;
        b=QklFcbuXEwbXCTK074qsKE8T1fw7yUbgMYzpFGgBA7cXcU/Zz2mvB+oKJQIdoU2TqI
         UHIGJy7n7WVl8i2r707vObySgc+9Er6Ot6UmbMV2FgcEvog/WlBeUi78Mpy/WaCihRvT
         fhcHYNH8q9zIfaP8GPjdW4Ov/68fqxOE7s7OzLV6v+g4LfSj/TXWnoUkyxV5Vb0ZI2SV
         QY8b1gbzkZXKTy/m+lBHUbsGpvVfMrYful5wT56KFKiytnmDXz+W83/CPfusv724IxbS
         oGQgHBkvn7O2GYX9kpnzr4etMNw1ig1WYu2ZflYLFpwkDn/cFiGcwK1Q3NU+KcSuG9W4
         g5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710258059; x=1710862859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSMa9ltAFpDnZugHD70b4ResjpouQ80j9uB/02gDj7A=;
        b=CQ0cAPqLDgjRU72UVymPtnWkWd9Kpzkhtk+2bSMuMOKP7bAO46/7BOvGFIFYqoWAGt
         hd7Zu2TF83332L/+19jjwyKx6uyimw2LtKmYI+Vt6wfVlAN0yMbEuJ0ngEvublC3hCAJ
         oefD5fx4ksZUOVAw6nnWX7UVyBQ/FqnCQ6AdpgC+u0VwGFTk1P0c08PoAdo9bnwu8e+7
         GlUQwo5bQ57W2VBZo+vQ3sjoOIGYZpI7sH+D/g/UBQ6J7zstoADpLEmsiL4M/M66RKvK
         Wp4lgaWEh957HxxZ6uEfvqUD2f4yRpdXIwe/gQ3ZjVlaY6tfkpK9TElwbNoffkbYrWLI
         rxOw==
X-Forwarded-Encrypted: i=1; AJvYcCXjvTHLo23q96mPMUW4lGZc5Zc+GOdskhvbEZubC/wHE4BNlxit0Q8+UWy1KgaJ7uK3aUQDH5XaDqhWUC+HcqqA1Z3Ozjp6iAq/iIyRHlI=
X-Gm-Message-State: AOJu0YyXrTIxJUZyW/iX4rA5dsLcJo1ptxqV7peZ5RBpcKMCPb3oaFFU
	8gJtGNeqptVPlPgF6B7uduy1yC0eygK9bTY6/ebjZyH6HNsbO736ufpiLyJt/w==
X-Google-Smtp-Source: AGHT+IGZ0d4/PgOIuxE27huHUmCLVBB9WAt7XpYvfWjxXmkX6H6yB7t/aKGxo24CAhQNRwG4GN8D4A==
X-Received: by 2002:a50:999e:0:b0:567:737f:e91f with SMTP id m30-20020a50999e000000b00567737fe91fmr6808805edb.27.1710258059161;
        Tue, 12 Mar 2024 08:40:59 -0700 (PDT)
Message-ID: <d8156a8f-d905-4e6a-b1cf-e9676cb3e8f3@suse.com>
Date: Tue, 12 Mar 2024 16:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/9] x86/boot: choose AP stack based on APIC ID
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <0e7dd957b6f26fa7b752bdce1ef6ebe97c825903.1699982111.git.krystian.hebel@3mdeb.com>
 <d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com>
 <ddf79696-e32e-49ca-bfe7-073c63b21e09@3mdeb.com>
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
In-Reply-To: <ddf79696-e32e-49ca-bfe7-073c63b21e09@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 16:11, Krystian Hebel wrote:
> On 7.02.2024 17:11, Jan Beulich wrote:
>> On 14.11.2023 18:49, Krystian Hebel wrote:
>>> --- a/xen/arch/x86/boot/trampoline.S
>>> +++ b/xen/arch/x86/boot/trampoline.S
>>> +        /* Not x2APIC, read from MMIO */
>>> +        mov     0xfee00020, %esp
>> Please don't open-code existing constants (APIC_ID here and below,
>> APIC_DEFAULT_PHYS_BASE just here, and ...
>>
>>> +        shr     $24, %esp
>> ... a to-be-introduced constant here (for {G,S}ET_xAPIC_ID() to use as
>> well then). This is the only way of being able to easily identify all
>> pieces of code accessing the same piece of hardware.
> 
> Yes, this was also caught in review done by Qubes OS team.
> 
> New constant and {G,S}ET_xAPIC_ID() should be in separate patch, I presume?

Preferably, yes.

>>> --- a/xen/arch/x86/boot/x86_64.S
>>> +++ b/xen/arch/x86/boot/x86_64.S
>>> @@ -15,7 +15,33 @@ ENTRY(__high_start)
>>>           mov     $XEN_MINIMAL_CR4,%rcx
>>>           mov     %rcx,%cr4
>>>   
>>> -        mov     stack_start(%rip),%rsp
>>> +        test    %ebx,%ebx
>> Nit (style): Elsewhere you have blanks after the commas, just here
>> (and once again near the end of the hunk) you don't.
> Is either style preferred?This file has both.

Conversion takes time, so in new code we aim at having those blanks.
Over time we hope to have them nearly everywhere, at which point it
may make sense to to a final cleanup sweep.

>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1951,6 +1951,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>>        */
>>>       if ( !pv_shim )
>>>       {
>>> +        /* Separate loop to make parallel AP bringup possible. */
>>>           for_each_present_cpu ( i )
>>>           {
>>>               /* Set up cpu_to_node[]. */
>>> @@ -1958,6 +1959,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>>               /* Set up node_to_cpumask based on cpu_to_node[]. */
>>>               numa_add_cpu(i);
>>>   
>>> +            if ( stack_base[i] == NULL )
>>> +                stack_base[i] = cpu_alloc_stack(i);
>>> +        }
>> Imo this wants accompanying by removal of the allocation in
>> cpu_smpboot_alloc(). Which would then make more visible that there's
>> error checking there, but not here (I realize there effectively is
>> error checking in assembly code, but that'll end in HLT with no
>> useful indication of what the problem is). Provided, as Julien has
>> pointed out, that the change is necessary in the first place.
> 
> The allocation in cpu_smpboot_alloc() was left for hot-plug. This loops
> over present CPUs, not possible ones.

Ah, right. Yet better error checking / reporting is going to be needed
anyway.

Jan

