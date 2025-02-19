Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A1AA3B39E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 09:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892446.1301416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfPl-00058O-Ip; Wed, 19 Feb 2025 08:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892446.1301416; Wed, 19 Feb 2025 08:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfPl-00056m-G3; Wed, 19 Feb 2025 08:26:41 +0000
Received: by outflank-mailman (input) for mailman id 892446;
 Wed, 19 Feb 2025 08:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkfPj-00056g-J1
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 08:26:39 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c6e1a6b-ee9b-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 09:26:37 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so1283466066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 00:26:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbd9f936cdsm68142566b.67.2025.02.19.00.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 00:26:36 -0800 (PST)
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
X-Inumbo-ID: 3c6e1a6b-ee9b-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739953597; x=1740558397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=stexiPhE4y7ihEqmOvX5FVdqey+eCnKx8KQabH0N6Sc=;
        b=IVTigXNg9l2Za1q9eiAw+pF/JcxvchiFld1uht2FKd8PN08iiyX+8+m0DROic4nIvJ
         fjiSSp6P9nORQfnXIqbGaTGr50jw6VlYShvGx7+qcsfLAm9Fkt52oFCkK7FhN1sgNsZS
         z1AZO0tfwSmsN+TjBd4iyIskz/N9YU3+/ibiAFwQ4PB86+ErllWmFyO2AWOAg+Nyuc3v
         lm/YqOyCiTp4FQQHvSaaTf5ZhXVqX+YSF/F4HkfNuAtQnhjZYMPcFZfNHViRQSCDHN3h
         uxT6KgyesOlIODu/JSpXUnES+fQwg1mqo2haMjMg0OQFy2sCSaNUEJORCRUyVrkwXTyV
         aEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739953597; x=1740558397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stexiPhE4y7ihEqmOvX5FVdqey+eCnKx8KQabH0N6Sc=;
        b=Of0p2A/+Y0KSTjRLnXf1zoSwRq+7WXpgtdVXDp2usXZ1rKBMOJ4PVK75sK1VsMd6C5
         pvpETKH8P9KJUcaOq1xqNKn0SsDmwcO14BoJmJR4EWupC6SVkiTBpUo5YrGiAY26TjBT
         CEElgLwvM1apE4FE61sDn8LCXetxVQA3V3mfQuRFiu9FyWJqDfF9180BOh925JdYdQiy
         ulK64bjJrbVwSXXodKbaPUbxoj+DDYw0kwxa6T22NPW5Iu4f2fkzrO5TlQyWUAFixCJD
         22NBA3aheit7W9TRhUc6r9Cn75Iw4aa+Ri+uy7ErfFzDgqSTezkkRDnaxrRTj5ec6fgG
         iDQw==
X-Forwarded-Encrypted: i=1; AJvYcCXIsiDs4plWu6Mxhbg8OQxMRuWVIR1hX83qQxDUduOEjiMAZ55GYFRP2DB83T3UJmJfjGa2v2l4/Xc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8VWTzhyzHSdg+Zaau7GfOXRYPU2kBXgSgluYwCZU6o73GRJwK
	HW6Y7Zy/wlqNjH5/TambEZqlVdASOtLko+gAHJjwUArujsxfIr/khThXMdX3xg==
X-Gm-Gg: ASbGncteiem0MoERAwACbqI+jHkZr0K+kM7g5ecRg809c8sThIDej58d9Zx9aa59Qpo
	nn4+ZSQLqGkeofZYDd6iiiSYuMSxLYhiZ1HlIFerJfi2jd1or+Y21aqsDa0Dpim9447KGoC8/pj
	9gwuQc1SUtq4h0HQuQiCMBrs2JS0q+G7wxY/hffHrryXqdHh3SxfIl5ZodwlgdWuPK8ZEZ2H3eO
	6JzXeCoxbuHEwOLozl0pLrK4t5wb5j3XfHmG7dgpaZnGxHAm+sYcE9+Kp9AJDAYocyw8GqNRK5q
	+Yveez4QCpxCt9TmcY1F6vTP4I0FzWY0927wGwNdGrGGL3Nk2kO/R1iL40ECegP9sA5CIiNA1mR
	M
X-Google-Smtp-Source: AGHT+IEi1FF1JuCJ3H//j/mb5iGLSldiIEFH0SLOoOMtLqQwFEBVOikuJ8nx0iwAFvmp+9W83NXWyQ==
X-Received: by 2002:a17:906:dc90:b0:abb:b247:fc69 with SMTP id a640c23a62f3a-abbcd062789mr294529566b.46.1739953596858;
        Wed, 19 Feb 2025 00:26:36 -0800 (PST)
Message-ID: <4e084d1c-93c0-4148-b12c-27f56f678a74@suse.com>
Date: Wed, 19 Feb 2025 09:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen/x86: resolve the last 3 MISRA R16.6 violations
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2502141811180.3858257@ubuntu-linux-20-04-desktop>
 <daaf4284-102c-4fc4-819c-2231705ab572@suse.com>
 <alpine.DEB.2.22.394.2502171509330.1085376@ubuntu-linux-20-04-desktop>
 <c24f9d41-1cf4-4cfc-ba11-6ad1d1223e9f@suse.com>
 <alpine.DEB.2.22.394.2502181338150.1085376@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502181338150.1085376@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 22:42, Stefano Stabellini wrote:
> On Tue, 18 Feb 2025, Jan Beulich wrote:
>> On 18.02.2025 00:12, Stefano Stabellini wrote:
>>> On Mon, 17 Feb 2025, Jan Beulich wrote:
>>>> On 15.02.2025 03:16, Stefano Stabellini wrote:
>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>> @@ -3797,22 +3797,14 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
>>>>>  {
>>>>>      ASSERT(v == current || !vcpu_runnable(v));
>>>>>  
>>>>> -    switch ( reg )
>>>>> -    {
>>>>> -    default:
>>>>> -        return alternative_call(hvm_funcs.get_reg, v, reg);
>>>>> -    }
>>>>> +    return alternative_call(hvm_funcs.get_reg, v, reg);
>>>>>  }
>>>>>  
>>>>>  void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>>>>>  {
>>>>>      ASSERT(v == current || !vcpu_runnable(v));
>>>>>  
>>>>> -    switch ( reg )
>>>>> -    {
>>>>> -    default:
>>>>> -        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
>>>>> -    }
>>>>> +    return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
>>>>>  }
>>>>
>>>> Both of these were, iirc, deliberately written using switch(), to ease
>>>> possible future changes.
>>>
>>> To be honest, I do not see any value in the way they are currently
>>> written. However, if you prefer, I can add a deviation for this, with
>>> one SAF comment for each of these two. The reason for the deviation
>>> would be "deliberate to ease possible future change". Please let me know
>>> how you would like to proceed.
>>
>> Well, best next thing you can do is seek input from the person who has
>> written that code, i.e. Andrew.
> 
> Andrew wrote in chat that he is OK with a deviation and he can live with
> a SAF deviation. Here is the patch.
> 
> 
> ---
> xen/x86: resolve the last 3 MISRA R16.6 violations
> 
> MISRA R16.6 states that "Every switch statement shall have at least two
> switch-clauses". There are only 3 violations left on x86 (zero on ARM).
> 
> One of them is only a violation depending on the kconfig configuration.
> So deviate it instead with a SAF comment.
> 
> Two of them are deliberate to enable future additions. Deviate them as
> such.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



