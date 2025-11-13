Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE2FC57604
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161199.1489205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWMx-0002k9-Uj; Thu, 13 Nov 2025 12:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161199.1489205; Thu, 13 Nov 2025 12:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWMx-0002ig-Ru; Thu, 13 Nov 2025 12:24:07 +0000
Received: by outflank-mailman (input) for mailman id 1161199;
 Thu, 13 Nov 2025 12:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJWMw-0002cq-8O
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:24:06 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a53b71f1-c08b-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 13:24:05 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-640b06fa959so1392542a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 04:24:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d6f5bsm1377123a12.6.2025.11.13.04.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 04:24:04 -0800 (PST)
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
X-Inumbo-ID: a53b71f1-c08b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763036645; x=1763641445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c8nFr9p8UFhmCXS76o6qsModOGM3KrazWlgBjqrbB38=;
        b=JE8ZEUfHaROWFDfDzK0ltnAVLqVzh3lIhD5zheQnavJKXEUdR+6jujY0+d904/NM0e
         lIZfeQzDm+DIXsUNlMLolCUZnJ+EjBp4ldAJHADHeij8UPHNTEWXCrA0OR5HASg5XbIM
         vkfXhj72lJhc1jV6Cm7jQ6uktKe5D3gNEXp8WrPZCu9tkDYqiko3RGbRbLRjYWkIfNcA
         W0GMIp2KyD8r2sx2yTLZAptqMPMhiq5e5PDjfYkXCnR6+5CrmZEOcoxav6i9aewlVA0e
         Lmh4XFGnANFrKJ70vSE7MWCQrH3o1mxqmLwDAQym8hBiObAgG63TZlIMBmgAT/LRsaLj
         zauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763036645; x=1763641445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8nFr9p8UFhmCXS76o6qsModOGM3KrazWlgBjqrbB38=;
        b=I0VL6VGojtlxL5/PZ1/a1ubRNF/axHM6Apl+7TTJ/jjI8PSwL8wohoSrzFvjCTQmN1
         19lERf0RP+NPhsp56pWuJtuwbP/jWiPvuRbx7BWMdTEC8wuT/h6+FWBAFXtTkjzumrjq
         C3RuoqggV6fOLj1ay1Cynv0jR94h4uOCdWfQEjMTjOCbOtqOjYh4sTKm9YpaxwHYqG5V
         7rE7sSSJafs+8G86c7kBUailBNGZtObJXrqecK96MAFQRteSq6KZCJHHsMofyoyM23Tu
         iZO9DyhEhtcWoouyKzt7pM+4NKIgo3DA7eg3t3u73lL3NEbNW//CO52FdUI5gV1gHJnD
         UOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSK7g7uNNthLwtIi8XJAhjFXni7QCwbhC8fnL4slQKdHFckvU5gI93J6RS/W9f9fGWSmaDGV1RDNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydQ8cxqxW/5itIMUopZeZ4MFgOxHgCTNcVsTdbtqnQkFrpAUl1
	jzOSXkIqMGQ+1xQvSn5bKkXDGEIRVepRwHVtcjTc0GmBBzozCEicaybydHH3EiBqqRM8biNFbxq
	bctc=
X-Gm-Gg: ASbGnctraYbTeZRp5gtZOxi1xmHgHxvKAoZS5H5LboqzNM4o6qsLYRnqeQvkcnDAHDW
	LMdUpLIVIszmUNGUpvvdP1SmyrByEKUOk9PSKQIOZOofHdfT8Vo8W7mMYl5dLSNQztucNf3AS0N
	AsK2RgKzytissnk0m5+D2VG11w1lZI/gmSJylYKl9T4+s5PhbjGLny5dvCcL7ZaU1hSRBqMH+Fr
	QNrqDFFHRUHiiXNxBb8Y4FX6pJk86fO+bvxGnJSLl7/y8xokhh/DZOAZZNIhQpsZfX9Nk9gMtxw
	gXsE0J7kveBz8QiIQGRIJwNn+WCXEMoPqSVN3x6XaXTnUEnrTOfvtBZkarBdaRf+utTgYsHV7yR
	WNwNDIQ3sr7jNMZiYJoftcNovN3XZekLFLhB8mn+ABKAAHepTxn8St80GXwCoaexNm3vPFVFmvr
	ftMH25PVZ9eoqXl2mSTLEwvvSlm+kokjc+cJnPPoGntat46TkFQb9rlyOrMittDqjxD9xE8yhcj
	Q0=
X-Google-Smtp-Source: AGHT+IGnOCjbzoJQF2LfxVXZCWjBvx3+Mi8iUeMDAmZ3GIaQP7MW+U0zXNRkPa5ltdxUzb4FAt1jCA==
X-Received: by 2002:a05:6402:1449:b0:640:b8a0:1aad with SMTP id 4fb4d7f45d1cf-6431a39287emr6430856a12.6.1763036644938;
        Thu, 13 Nov 2025 04:24:04 -0800 (PST)
Message-ID: <457733d4-65bc-41f6-ad1b-5afb17303517@suse.com>
Date: Thu, 13 Nov 2025 13:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86: Conditionalise PV-only fallback branches on
 CONFIG_PV
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
 <20251112152235.224001-2-alejandro.garciavallejo@amd.com>
 <730c6001-58a2-46db-95fa-c8ec2081d3b0@suse.com>
 <DE7K9G9FS7ZL.2JVRCUHFJFH6W@amd.com>
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
In-Reply-To: <DE7K9G9FS7ZL.2JVRCUHFJFH6W@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 13:20, Alejandro Vallejo wrote:
> On Thu Nov 13, 2025 at 12:42 PM CET, Jan Beulich wrote:
>> On 12.11.2025 16:22, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/cpuid.c
>>> +++ b/xen/arch/x86/cpuid.c
>>> @@ -297,7 +297,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>>>              if ( v->arch.hvm.guest_cr[4] & X86_CR4_OSXSAVE )
>>>                  res->c |= cpufeat_mask(X86_FEATURE_OSXSAVE);
>>>          }
>>> -        else /* PV domain */
>>> +        else if ( IS_ENABLED(CONFIG_PV) )
>>>          {
>>>              regs = guest_cpu_user_regs();
>>>  
>>> @@ -509,7 +509,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>>>              if ( !hap_enabled(d) && !hvm_pae_enabled(v) )
>>>                  res->d &= ~cpufeat_mask(X86_FEATURE_PSE36);
>>>          }
>>> -        else /* PV domain */
>>> +        else if ( IS_ENABLED(CONFIG_PV) )
>>
>> Maybe better leave the "else"-s as is and, ahead of them, insert
>>
>>         else if ( !IS_ENABLED(CONFIG_PV) )
>>             ASSERT_UNREACHABLE();
>>
>> Happy to make the adjustment while committing, provided you'd be happy with me
>> doing so.
> 
> Should I understand that as an Acked-by?

You may, yes (implicitly).

Jan

> I think it'd be marginally clearer with the assert added to my code as an else
> branch at the end, but either form works. I'm fine with it being committed
> in the form I originally sent, what you proposed, or the ASSERT as an else
> branch.
> 
> They all have the same effect, after all.
> 
> Cheers,
> Alejandro


