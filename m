Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6BAB33A2A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 11:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092768.1448399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTBq-00076n-Oi; Mon, 25 Aug 2025 09:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092768.1448399; Mon, 25 Aug 2025 09:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTBq-00073k-M6; Mon, 25 Aug 2025 09:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1092768;
 Mon, 25 Aug 2025 09:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqTBp-00072Y-Gy
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 09:08:33 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1258fa35-8193-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 11:08:31 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6188b793d21so6153710a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 02:08:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe72c35ebdsm281326066b.7.2025.08.25.02.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 02:08:30 -0700 (PDT)
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
X-Inumbo-ID: 1258fa35-8193-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756112911; x=1756717711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BhqFtmBmQ5e4s5KqzcPlJhm8KmMN4kbdRk9B9qSB23c=;
        b=PGDziMr/s20NEdsQgmZNRm63BUXPiKmOy9uUn2mjWd9qaEXAN/+tNe1wLCRn6HKZrh
         kZCdDgPiGrePvRUEXc1+TNVw0ZlFF9+2pD5ZhKAkA0RzlsXl2vHWSJHiehL/zlwymQ2f
         Qkm7/dR87rdILbZWE/c8JWQZKHl/yRyxYDAgVpycQ8YhceDbTnGuB+l+B1Nk8M+9zn64
         I3DyJPTn3vPpJzxuXAe0zzZZZOQ73lUWdWcJvv0reSC2gDUiZZdyFddeOg8pgG7KSvuK
         S40BCuqYAYnzW3/zpoivEHOWqboFF+LchEcUpvvTdEojshsDPsHvHwZIjmuORs4GRdO+
         l+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756112911; x=1756717711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhqFtmBmQ5e4s5KqzcPlJhm8KmMN4kbdRk9B9qSB23c=;
        b=n1QSBDcX83A8j/q3eTAf8O/H5L1ghhnFE9bHwxExotqgd6U9+ddWTlsRFhsUsWXL0n
         7dOJ3pC+oziGuZv/JxOlUTPCOIuZy6h06XOPHfjuLRcCj0EokXHs5BbZs/rrlacgSRAb
         64nxaGr2IEirAYyv7AtvdHWWdWBJ/XQF+Ul+jiWiXNiLV02Of3vnm/y6R8s2JSijKF17
         ywAM0Fi02M4I7X1za9i5KVRvfe6AXHQRPQbwOCrb0Fmlvn2zTP0+IE36iVwhSG/5GVpW
         brZ4USoYHntmLwOKE5wHAVPfCf7NDYVDenyZVspZwiESTRnqm+444764koIayJeFMZ1+
         HqyQ==
X-Gm-Message-State: AOJu0Yy0X31DJQ/ZivEQVfSkFR0wU5ouWjmdqWu9TbS6970QbAy5bIg8
	Oqq+GcqaOXzZ5HFL1F6W7r3ibbofWxX0bYE0b5TgiTajBH4Es+P+B381pNAZitJxXg==
X-Gm-Gg: ASbGncviWqU8gZj6ysUgba+8IcS4cJobSmu1ki6I5DIgUSBQkcOFclr1BrOtsvf8uB6
	3I2nO8M+/+H1I/UASBIwHbRF4FMJ4H9GgEPCvSluN/a99zlg7T8DLys9wFbSvnaXKSjRNkBjywP
	IolqykV/BR6Z+UklBrVnF7v81V9N+rqg67hxTcweLk/AaishXNIYLdmIrx9WjviAkVBiFK2xChd
	kNgpvdFacdNXn1KxydZvZLGIm3IuTcUA7/iltK/ZnFSfrhgyJiGVWnL++p2Pzy20i2/DOJrqRkU
	jHA72urhlNRF9Yk2qNT1Eqdyarm530tJhVfmYHE45cTEfcQ5f9SSrpPO/jgf+3FVmiO/0dxsY+G
	X/sCY8K1aVok1cvKI7dR5ifm4yCPdHTjKWif5TJr3WuU6WgL+SRNE39ELJHsheS1NK0Omnzo7Lh
	VkXHTm9jo=
X-Google-Smtp-Source: AGHT+IGsAuUgfq8H4BBu9ocOrlDCJeFQlZv8TYwuNRLX7dfIWI6wL1r+JxqtQu5g5dL734L3n1G7qQ==
X-Received: by 2002:a17:907:da5:b0:afe:87df:b94 with SMTP id a640c23a62f3a-afe87df18famr116143266b.6.1756112911058;
        Mon, 25 Aug 2025 02:08:31 -0700 (PDT)
Message-ID: <b40bb16e-d709-4f6c-8e64-b39adb4a4fe4@suse.com>
Date: Mon, 25 Aug 2025 11:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/22] x86/traps: Introduce opt_fred
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-16-andrew.cooper3@citrix.com>
 <0a6b6fce-2cc8-4933-8703-399e4a4fdad6@suse.com>
 <8adbd032-9da2-481d-8d98-30c9a605ec46@citrix.com>
 <5c608ebc-e9c2-47ea-a98f-246f7a3d4c30@suse.com>
 <56532672-d28e-4c3c-9b4b-e038c9a5e341@citrix.com>
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
In-Reply-To: <56532672-d28e-4c3c-9b4b-e038c9a5e341@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2025 23:52, Andrew Cooper wrote:
> On 15/08/2025 9:37 am, Jan Beulich wrote:
>> On 14.08.2025 21:16, Andrew Cooper wrote:
>>> On 14/08/2025 2:30 pm, Jan Beulich wrote:
>>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>>> ... disabled by default.  There is a lot of work before FRED can be enabled by
>>>>> default.
>>>>>
>>>>> One part of FRED, the LKGS (Load Kernel GS) instruction, is enumerated
>>>>> separately but is mandatory as FRED disallows the SWAPGS instruction.
>>>>> Therefore, both CPUID bits must be checked.
>>>> See my (further) reply to patch 13 - I think FRED simply ought to depend on
>>>> LKGS.
>>>>
>>>>> @@ -20,6 +22,9 @@ unsigned int __ro_after_init ler_msr;
>>>>>  static bool __initdata opt_ler;
>>>>>  boolean_param("ler", opt_ler);
>>>>>  
>>>>> +int8_t __ro_after_init opt_fred = 0; /* -1 when supported. */
>>>> I'm a little puzzled by the comment? DYM "once default-enabled"?
>>> Well, I have this temporary patch
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/commit/70ef6a1178a411a29b7b1745a1112e267ffb6245
>>> that will turn into a real patch when we enable FRED by default.
>>>
>>> As much as anything else, it was just a TODO.
>>>
>>>
>>>>  Then ...
>>>>
>>>>> @@ -305,6 +310,32 @@ void __init traps_init(void)
>>>>>      /* Replace early pagefault with real pagefault handler. */
>>>>>      _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
>>>>>  
>>>>> +    if ( !cpu_has_fred || !cpu_has_lkgs )
>>>>> +    {
>>>>> +        if ( opt_fred )
>>>> ... this won't work anymore once the initializer is changed.
>>> Hmm yes.  That wants to be an == 1 check.  Fixed.
>>>
>>>>> +            printk(XENLOG_WARNING "FRED not available, ignoring\n");
>>>>> +        opt_fred = false;
>>>> Better use 0 here?
>>>>
>>>>> +    }
>>>>> +
>>>>> +    if ( opt_fred == -1 )
>>>>> +        opt_fred = !pv_shim;
>>>> Imo it would be better to have the initializer be -1 right away, and comment
>>>> out the "!pv_shim" here, until we mean it to be default-enabled.
>>> It cannot be -1, or Xen will fail spectacularly on any FRED capable
>>> hardware.  Setting to -1 is the point at which FRED becomes security
>>> supported.
>> I guess I'm not following: If it was -1, and if the code here was
>>
>>     if ( opt_fred < 0 )
>>         opt_fred = 0 /* !pv_shim */;
>>
>> why would things "fail spectacularly" unless someone passed "fred" on
>> the command line?
> 
> Oh, that would work, but why bother?  It's simply a less readable form
> of mine, and if we're going to nitpick, it's commented out code.

Indeed, I was aware of Misra's dislike when writing the reply.

In any event - I'm okay with about any approach as long as the adjustment
to make (once FRED becomes supported) is both clear upfront and simple to
make (read: preferably a single line change). Readability is, as we know
from other recent instances, subjective. In the case here I think it
follows from my original comment that things weren't quite clear according
to my reading.

Jan

