Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49859399D2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 08:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762620.1172829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW96M-0000Uz-Bd; Tue, 23 Jul 2024 06:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762620.1172829; Tue, 23 Jul 2024 06:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW96M-0000Ry-8M; Tue, 23 Jul 2024 06:34:22 +0000
Received: by outflank-mailman (input) for mailman id 762620;
 Tue, 23 Jul 2024 06:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rd17=OX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sW96K-0000Rs-Nb
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 06:34:20 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96dbab25-48bd-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 08:34:19 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7a8caef11fso57462966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 23:34:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785e8csm500246466b.23.2024.07.22.23.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 23:34:10 -0700 (PDT)
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
X-Inumbo-ID: 96dbab25-48bd-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721716458; x=1722321258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hgqIION40vD3WRKYEZWCwDKvotJThWB8PNCLWvnUZ44=;
        b=K+HvLXEpjtB7knbpPcCtbSg1ssZKjXzFUtikjwP01Dq7fpTrdMxUPwWGT1fkhJhnc6
         xAlkWg96Viw5i/A0scoz+0fSOS0GOLMp2lyKSBGUX8TaKA6ETZd5Ofcy/6ZZshl+lt4w
         UBulspeBestGf6CVQ+z7XK+wHoQt+afQwn4gmUgqZCNjXrKd3ytBrtvHS0ZUpCFgXMF1
         uiqHtiMOfd9auGImZAaB3Zp+E9TZEglT0Hz9tUE6cqTfPDZOfEmL3H7X8tbv766tQnmO
         apTGUJaJ6r9yF0nN+fa9nnEDR0WjizWqUEj8sQ1bftGfyktuqkaX1UDHknt8Xj9gfkaf
         hyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721716458; x=1722321258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgqIION40vD3WRKYEZWCwDKvotJThWB8PNCLWvnUZ44=;
        b=EDqfuHR/zG7ABKhITt9+3rHgaF8ywzF7+53acQu/Ez1wONZWIRSnczse5Cg3i9OdXf
         +2J40dLp8JhlIFL2hcuRrm0M96FZJjR+1jos1ZckJgwtk8f3OvKZ2epP/F/lfqFMCrL3
         jil49qsmHeey6UzgGZwhMG8pOVHverMDc/vspvA2q+VgWujMEsB2mkOxWerNzF30GZZ7
         CwTPp3roHqExqNsHMNRNAKpY1P5vnPrib0ki7egpCfuJRnGE/ntEm4g+gp6LL8isA0zN
         vnds1Zn4su+VRYz/OZF7z3RBKq/dSvH7P3GqYgFtcc+/zyAtvAhma8HR6embW2yCWh9L
         hGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUg0P162tyF/5g8ymcxoc3I84chFa8NrhfMUfuOeGll7vzJMHhmt1qkPWkifhLfu8o3LSkRxm7xAVbTV5/gpnE6EcTQYPEsmXIRTr5t8o=
X-Gm-Message-State: AOJu0Yzfpj4kvvjl51PSEbWo/UHkJS7PLa+j6U6lmJlZzGTlrMCdJbVk
	2DwU+cONhSpy30XcgAvkUijwXT3HIfCLoWX9hmUo8l/h1Ocl8aKAwHVkK0MVkEeHLDtztLbX+6w
	=
X-Google-Smtp-Source: AGHT+IFiJmWq4KS1WI6gjSn/7KuYqIMvbgC9VAHqbTsOd1kHarRLfjki1LTjOb+kds23WuYPd9MFQA==
X-Received: by 2002:a17:906:6a19:b0:a7a:8e0f:aaf0 with SMTP id a640c23a62f3a-a7a8e1136bamr103292566b.36.1721716450751;
        Mon, 22 Jul 2024 23:34:10 -0700 (PDT)
Message-ID: <196197bb-3ab0-4af1-b9c8-41d1008caa19@suse.com>
Date: Tue, 23 Jul 2024 08:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/efi: Unlock NX if necessary
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Gene Bright <gene@cyberlight.us>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-3-andrew.cooper3@citrix.com>
 <9123e966-1ec6-4853-b6a2-f92e21dc784c@suse.com>
 <f53e8b5b-1a89-4190-a6bc-495e8487384f@citrix.com>
 <243d89c1-4e23-4ecb-be4a-0ab1e09e0938@citrix.com>
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
In-Reply-To: <243d89c1-4e23-4ecb-be4a-0ab1e09e0938@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2024 19:38, Andrew Cooper wrote:
> On 22/07/2024 6:04 pm, Andrew Cooper wrote:
>> On 22/07/2024 11:43 am, Jan Beulich wrote:
>>> On 22.07.2024 12:18, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/efi/efi-boot.h
>>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>>> @@ -736,13 +736,33 @@ static void __init efi_arch_handle_module(const struct file *file,
>>>>      efi_bs->FreePool(ptr);
>>>>  }
>>>>  
>>>> +static bool __init intel_unlock_nx(void)
>>>> +{
>>>> +    uint64_t val, disable;
>>>> +
>>>> +    rdmsrl(MSR_IA32_MISC_ENABLE, val);
>>>> +
>>>> +    disable = val & MSR_IA32_MISC_ENABLE_XD_DISABLE;
>>>> +
>>>> +    if ( !disable )
>>>> +        return false;
>>>> +
>>>> +    wrmsrl(MSR_IA32_MISC_ENABLE, val & ~disable);
>>> The base ISA not having ANDN or NAND (and a prereq to my patch to add
>>> minimum-ABI-level control to the build machinery still sitting there
>>> unreviewed), using "val ^ disable" here would likely produce slightly
>>> better code for the time being.
>> While that might technically be true, you're assuming that everyone
>> reading the code can de-obfuscate ^ back into &~, and that the compiler
>> hasn't made its own alternative arrangements.
> 
> In fact, the compiler sees through this "clever" trick and undoes the XOR.
> 
> Swapping &~ for ^ makes no change in the compiled binary, because in
> both cases GCC chooses a BTR instruction instead.

Oh, okay.

> While BTR might be a poor choice of instruction for this purpose, it
> reinforces my opinion that trickery such as this is not something we
> want to do.

Just to mention it: I wouldn't have considered this to be "trickery".

> If you want a more useful optimisation task, we should figure out how to
> write rdmsrl()/wrmsrl() better so GCC is happy working on %edx in
> isolation, rather than always merging it into %rax to be operated on. 
> The rdmsr()/wrmsr() helpers taking a split hi and lo generate far better
> code, even if they are much more awkward to use at a C level.

That may end up quite challenging without actually fiddling with the
compiler itself. Plus rdmsrl()/wrmsrl() themselves won't know how the
values are used in surrounding code, so improving one set of cases
may make things worse for another set. Introducing yet another variant
of them may also not be very desirable.

Jan

