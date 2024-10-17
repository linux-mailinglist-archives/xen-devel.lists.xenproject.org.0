Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A003A9A22B1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 14:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820564.1234075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1PtL-0000EH-J7; Thu, 17 Oct 2024 12:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820564.1234075; Thu, 17 Oct 2024 12:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1PtL-0000B6-GF; Thu, 17 Oct 2024 12:46:11 +0000
Received: by outflank-mailman (input) for mailman id 820564;
 Thu, 17 Oct 2024 12:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rwie=RN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1PtK-00009w-1H
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 12:46:10 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c55eacd6-8c85-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 14:46:04 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4314c4cb752so9502805e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 05:46:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c61ae2sm24992065e9.46.2024.10.17.05.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 05:46:03 -0700 (PDT)
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
X-Inumbo-ID: c55eacd6-8c85-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729169164; x=1729773964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=opW0I6l9rGQivJ6oAEXHsJ/Cs7Y6jrVWJEEMQxR0m3Q=;
        b=d2M95/qvx86BZVQqjj6Qr7Zv66keUdevoc2emJHVKeJvqbr9HUFlHlOGr6rMQKQi7R
         RCMBRMumsioKWkIiMCGCy4ah41VdDrdzzdy7t1EDxmIYtRyR4JLBMr1a8L16kZ1GwJSS
         MIwCt0PwJkXKdweLJhSVu7lVSb5dcTlthz6E332fK1fhhkJPzBWKSaIITSnxDKtvxmLd
         VJ7ChPHSrUAPPIQZhxfsJHxr9N9o4HtuYjuRxce1aXLYgIGHld1iMN+fhWFgPZHPlKtC
         QlH4x4vzt8OnMfnlfdUYDU0/eFDv/5RWtTc41xXNK1OKsd8WqjKYGsZoueVm/fPZZCc2
         uuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729169164; x=1729773964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opW0I6l9rGQivJ6oAEXHsJ/Cs7Y6jrVWJEEMQxR0m3Q=;
        b=mS7xQYPBZT4q7WysBiWjjVVz8mEwDXVwX4ZLh61XiHCyRY9RrmILf2hwJnriwMWn9I
         pzUBo9Qda16oOOSJObZDJAz1tk88e84l9t4pVKCidv1WY0Lb2s8/WialHk0ixfZU18r0
         Acr0/bC5gMvjkx7BOujrjfwRbJ5YW0H7e1p3kbgJl/2grDl7wvl8m+6XVoflW7PNc0uA
         KfVcJWjrL9Gxq9LiOdJw6cH6lRyVqvN/IAeu4PBSIsOWNvjYA3tKldA/4QPFwEPcspH1
         FIwi8+9oeBmgI0phs/ljJpqv1N4UQi4ZB4X8z9wRhIY++FkQvxe4IARwRQwQETLeicBH
         i1fg==
X-Gm-Message-State: AOJu0YynhZIdwhDg//GO8mjd6VmHF2ZjhXRceJ6xKVgIxpKG99B9gf0e
	Vw6mlKZiHz4sfP9S4H43K+sJ3whbXWlVAXlFMgYH8FH0cx3Zmo1Ffm8UelXx5w==
X-Google-Smtp-Source: AGHT+IHvDKar/4K2Q8i9QPIxHnNfbZ0ZWiMzI3aF/X7BCQjaOR+Kcv2zNgPv5oFwVBBFVCO1xI9YvA==
X-Received: by 2002:a05:600c:46cc:b0:431:1512:743b with SMTP id 5b1f17b1804b1-4311dee74e6mr203918175e9.21.1729169163648;
        Thu, 17 Oct 2024 05:46:03 -0700 (PDT)
Message-ID: <010ef264-4ee9-46a4-bfee-5c8da36d1b2a@suse.com>
Date: Thu, 17 Oct 2024 14:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lib32 followup (visibility issue and/or toolchain bug?)
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
 <821ac8cc-a0ac-412b-8069-73c52541b70b@citrix.com>
 <CACHz=Zj9m2tkPPbtJuCT5g_NtDRA3iMPBzxM8R5Jxp1ofVc8oQ@mail.gmail.com>
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
In-Reply-To: <CACHz=Zj9m2tkPPbtJuCT5g_NtDRA3iMPBzxM8R5Jxp1ofVc8oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2024 16:53, Frediano Ziglio wrote:
> On Wed, Oct 16, 2024 at 2:30 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> Hello,
>>
>> Preempting some future work I'm expecting to arrive, I had a go at using
>> __builtin_*() in obj32.
>>
>> This is formed of 2 patches on top of this series:
>> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-lib32
>>
> 
> You are confident we'll have a lot of shared code to need an
> additional "lib32" in the Makefile!
> I would personally stick with obj32.
> Note that file should be strlen.c, not strlen.32.c, otherwise you are
> possibly going to pick up the general rule and not the one in the
> Makefile (but maybe is what you wanted).
> 
>> Patch 1 introduces lib32 beside obj32, with strlen() being the first
>> broken-out function, and patch 2 swaps to __builtin_strlen().
>>
>> Both compile, but the difference that patch 2 introduces was unexpected.
>>
>> With just lib32, and taking strsubcmp() as an example, we get:
>>
>> 00000000 <strsubcmp>:
>>    0:        83 ec 0c                 sub    $0xc,%esp
>>    3:        89 5c 24 04              mov    %ebx,0x4(%esp)
>>    7:        89 74 24 08              mov    %esi,0x8(%esp)
>>    b:        89 c6                    mov    %eax,%esi
>>    d:        89 d3                    mov    %edx,%ebx
>>    f:        89 d0                    mov    %edx,%eax
>>   11:    /-- e8 fc ff ff ff           call   12 <strsubcmp+0x12>
>>             12: R_386_PC32    strlen
>>   16:        89 c1                    mov    %eax,%ecx
>>   18:        89 da                    mov    %ebx,%edx
>>   1a:        89 f0                    mov    %esi,%eax
>>   1c:    /-- e8 fc ff ff ff           call   1d <strsubcmp+0x1d>
>>             1d: R_386_PC32    .text.strncmp
>>   21:        8b 5c 24 04              mov    0x4(%esp),%ebx
>>   25:        8b 74 24 08              mov    0x8(%esp),%esi
>>   29:        83 c4 0c                 add    $0xc,%esp
>>   2c:        c3                       ret
>>
>> which all seems fine.  We get a plain PC32 relocation to strlen (which
>> is now in the separate library).
>>
>> However, with patch 2 in place (simply swapping the plain extern for
>> __builtin_strlen(), we now get:
>>
>> 00000000 <strsubcmp>:
>>    0:        83 ec 0c                 sub    $0xc,%esp
>>    3:        89 1c 24                 mov    %ebx,(%esp)
>>    6:        89 74 24 04              mov    %esi,0x4(%esp)
>>    a:        89 7c 24 08              mov    %edi,0x8(%esp)
>>    e:    /-- e8 fc ff ff ff           call   f <strsubcmp+0xf>
>>             f: R_386_PC32    __x86.get_pc_thunk.bx
>>   13:        81 c3 02 00 00 00        add    $0x2,%ebx
>>             15: R_386_GOTPC    _GLOBAL_OFFSET_TABLE_
>>   19:        89 c7                    mov    %eax,%edi
>>   1b:        89 d6                    mov    %edx,%esi
>>   1d:        89 d0                    mov    %edx,%eax
>>   1f:    /-- e8 fc ff ff ff           call   20 <strsubcmp+0x20>
>>             20: R_386_PLT32    strlen
> 
> PLT means it not declared hidden, otherwise it would have used the
> relative relocation.
> Maybe
> 
> size_t strlen(const char *s);
> #define strlen(s) __builtin_strlen(s)
> 
> xen/compiler.h is included, so all declaration should get the hidden
> by default ? Or add __attribute__((visibility("hidden"))) explicitly.
> 
>>   24:        89 c1                    mov    %eax,%ecx
>>   26:        89 f2                    mov    %esi,%edx
>>   28:        89 f8                    mov    %edi,%eax
>>   2a:    /-- e8 fc ff ff ff           call   2b <strsubcmp+0x2b>
>>             2b: R_386_PC32    .text.strncmp
>>   2f:        8b 1c 24                 mov    (%esp),%ebx
>>   32:        8b 74 24 04              mov    0x4(%esp),%esi
>>   36:        8b 7c 24 08              mov    0x8(%esp),%edi
>>   3a:        83 c4 0c                 add    $0xc,%esp
>>   3d:        c3                       ret
>>
>>
>> The builtin hasn't managed to optimise away the call to strlen (that's
>> fine).  But, we've ended up spilling %ebx to the stack, calculating the
>> location of the GOT and not using it.
> 
> Maybe the ABI for PLT is to have %ebx set to the GOT ? Not sure about it.

Yes, PIC PLT entries use %ebx.

>> So, as it stands, trying to use __builtin_strlen() results in worse code
>> generation.  One thing I noticed was that we're not passing
>> -fvisibility=hidden into CFLAGS_x86_32, but fixing that doesn't help
>> either.  We do have the pragma from compiler.h, so I'm out of visibility
>> ideas.
> 
> The -fvisibility=hidden should be overridden by the xen/compiler.h;
> but should be overridden with hidden!
> Maybe strlen is defined by default with another visibility?
> If you generate the assembly, you should see if the strlen symbol gets
> the .hidden bless or not.

Only defined symbols have .hidden emitted for them, afaics. But that also
doesn't matter much, as it's the emission of the @plt on the calls which
requires the setting up of %ebx prior to those calls. (Arguably in 32-bit
code, where all addresses are reachable, "hidden" could serve as a hint
that calls don't need to go through the PLT. This maybe considered a
missed optimization opportunity.) There's no difference there between
calling strlen() or e.g. a custom (extern) StrLen().

And btw, reloc.c and cmdline.c currently also compile to code using
__x86.get_pc_thunk.* (and @gotoff relocations for data references).

Jan

