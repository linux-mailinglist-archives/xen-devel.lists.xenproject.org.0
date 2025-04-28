Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25DBA9E836
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 08:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970045.1358830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9I1N-0000aW-1x; Mon, 28 Apr 2025 06:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970045.1358830; Mon, 28 Apr 2025 06:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9I1M-0000YJ-Uk; Mon, 28 Apr 2025 06:31:16 +0000
Received: by outflank-mailman (input) for mailman id 970045;
 Mon, 28 Apr 2025 06:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9I1L-0000XR-K4
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 06:31:15 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61f53f1a-23fa-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 08:31:14 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso2830923f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 27 Apr 2025 23:31:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5310ad2sm112610985e9.21.2025.04.27.23.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 23:31:13 -0700 (PDT)
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
X-Inumbo-ID: 61f53f1a-23fa-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745821873; x=1746426673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NmgTjCOMV7hXYMdO8AQvqhvP2h2pc8+EkMkEAv8tAi0=;
        b=IgnMAF3SPI+oi+MZC5pKBy9WbvX3bVAx5wgRvCR3Kz31E0pUfzUBLcVcLwyaSwqPvd
         nxh3bQZ+tdX2MJft/jGxLG66rLQmYNz8Lvjn9AKhJkohAQIFj2JZBrscOt/hL4sYOV9d
         VCHBjCTLQale9/5XYkZwboXW+d5W5YDNJ1rKTaccY4xQ6uojzeqtbbdTTxFTCMXxLJLU
         Skj+ssRlc64YNbnO8tQMgI1oa2kuIIXbh3jSw5m43eUWKNk835dkIXAf3sPIC7dMzYHv
         vN7r/Cnh6nLHutY4TwkgpqpXi+Ld6VfGDxnz9950OS2OsMf6IgV5VlvyMhj5cPEFEoSc
         5B/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745821873; x=1746426673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmgTjCOMV7hXYMdO8AQvqhvP2h2pc8+EkMkEAv8tAi0=;
        b=Cq1hPsIQj8DivWHWxgxGLECnAh5bV0SR6mQ3HlbCdJ3CMed1fcM0fnnI59jVvz+WZL
         MoL6wALuQ5kcgym/Mjw8d/bONk/qVUK+X02butdO1MPIigX3CKjua03AWWvf9nhi9/WS
         7/GTzS8blr13E+kN+afjEmMVShtXtkkA5x8NrrBj7l/Jfdmv6DQ78Ml4G69S8xmQdXQ5
         bQLFX5ReMy42xKMnWWqhGJ36Ce7pCFdSb32GijAGfC6aW2TlTjTOaBbDAXLRwojV3kcY
         icHQgn86ah1XuDPqZzjStIvsXCXgQEcLfaFR5grlS8+4v68NUaot4SkjakKOQZyim+WC
         hAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT58kLXGX4IBKD3WyWtoeGbxchrpvksrgNf04IRRgvtM4Z8YA3rUttMi8Ns4UfHUWUs6d1Ct+rfKQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzsq74G5zHWzBwrWhC2ZscPJSI/v0intLq7zYR0N+xVSqiqBtyG
	yaZZ9/2h9GkM+KgfPDws8yvO8vOQTEFaWybgto5sIczWngpN78wiCHcCXdyRFw==
X-Gm-Gg: ASbGncvkTET4Q6xATr6bu58xAHMaay/8wZF4GtJWo6c14dHhwIc+t+t+acYVGF9PDtw
	qZFfIn+y1jMJRWyd44MtttvPksOQg1XE9XxzUbq7DyX3y/6/8PCHhDUP1n9e/MQe4zCo+FBXh31
	FEciP2n1Np5ZwuXwutGNmPcKvNcLWVgYiTTBgPjEMGZUrhPkP9PoVnB8+gGSjkIFUDAuYeP77cF
	sfPxOfJ3wWW+njx+2VV+dEO8tXajgUYv6jfd8j+IsPP8Vna+02ZDLqL1SQxIIl/PED831JeJZXw
	JAYzw4iTRvuSM0vdUKAICqnJ1N0YcLfDCnufk351V30xD7D5LIGYZeoEhzLDmZgcOnHnzFHPoq7
	M2knlxtImb5yN5DCo7iV0FqAv4A==
X-Google-Smtp-Source: AGHT+IEjRbK3ddf9QUR70nFZF6I8681/DRl4c8fbtidnVDhp6WpSS7ITaIaboLCrNertSTjtbsiKiQ==
X-Received: by 2002:a05:6000:188f:b0:39c:1258:d12c with SMTP id ffacd0b85a97d-3a06d6ffd55mr10513190f8f.28.1745821873566;
        Sun, 27 Apr 2025 23:31:13 -0700 (PDT)
Message-ID: <39f0a475-6eea-4c08-abb1-f3de25c5a549@suse.com>
Date: Mon, 28 Apr 2025 08:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/14] xen/riscv: riscv_of_processor_hartid()
 implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ab592d50ad161ffed3950bdf58ade49ae90a3c0e.1744126720.git.oleksii.kurochko@gmail.com>
 <65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com>
 <d10323b7-d95d-4b96-9bf1-7ae8edda153e@gmail.com>
 <859d0c87-dc90-44c2-ab30-5164eec0705c@suse.com>
 <83fc1566-ad4f-489d-a432-01ec638cbc21@gmail.com>
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
In-Reply-To: <83fc1566-ad4f-489d-a432-01ec638cbc21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.04.2025 19:07, Oleksii Kurochko wrote:
> 
> On 4/15/25 3:45 PM, Jan Beulich wrote:
>> On 15.04.2025 15:39, Oleksii Kurochko wrote:
>>> On 4/10/25 5:53 PM, Jan Beulich wrote:
>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>> +{
>>>>> +    const __be32 *cell;
>>>>> +    int ac;
>>>>> +    uint32_t len;
>>>>> +
>>>>> +    ac = dt_n_addr_cells(cpun);
>>>>> +    cell = dt_get_property(cpun, "reg", &len);
>>>>> +    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len) )
>>>>> +        return ~0ULL;
>>>> I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
>>>> You only pass in 0 below, so it's unclear whether it's what one might expect
>>>> (the thread number on a multi-threaded core).
>>> Based on the DT specification alone, the|`reg`| value could refer to either a CPU or a thread ID:
>>> ```
>>> The value of reg is a <prop-encoded-array> that defines a unique CPU/thread id for
>>> the CPU/threads represented by the CPU node. If a CPU supports more than one thread
>>> (i.e. multiple streams of execution) the reg prop-erty is an array with 1 element
>>> per thread.
>>> ```
>>>
>>> My understanding is that the term/thread/ was used in the Linux kernel to cover both
>>> cases.
>>> When SMT isn't supported, the CPU can be considered to have a single thread.
>>> For example, RISC-V uses the term/hardware thread/ to describe a hart (i.e., a CPU).

Note the terminology ("CPU") you used here.

>>> Interestingly, the Linux kernel always uses|thread = 0|.
>>>
>>> We could potentially drop this ambiguity and introduce an|ASSERT()| to check that
>>> the|`reg`| property contains only one entry, representing the HART (CPU) ID:
>>> ```
>>>     Software can determine the number of threads by dividing the size of reg by the parent
>>>     node’s #address-cells. If `|reg`| has more than one entry, it would simply SMT support
>>>     is required.
>>> ```
>>>
>>> Does that approach make sense, or should we stick with the current implementation?
>> If extra enabling is required to make multi-thread CPUs work, then panic()ing
>> (not so much ASSERT()ing) may make sense, for the time being. Better would be
>> if we could use all threads in a system right away.
> 
> Actually, this function is ready to be used for multi-thread CPUs. A caller can request hardware id
> by passing `thread` argument (`thread` -> the local thread number to get the hardware ID for).
> So by calling:
>   dt_get_cpu_hwid(cpu0, 0) -> it will return hardware id of thread 0 of cpu0
>   dt_get_cpu_hwid(cpu0, 1) -> it will return hardware id of thread 1 of cpu0
>   ...
> 
> In our case we assume that SMP isn't supported so that is why it is used only dt_get_cpu_hwid(cpu0, 0).
> 
> If one day, SMP will be enabled then it will be needed to change a callers of dt_get_cpu_hwid().

I assume you meant SMT in both places you wrote SMP? But my main point here is:
If enumeration gives you "thread <N> of core <M>" (using x86 terminology), you
need to be quite careful with what you call "CPU". Things need to be entirely
unambiguous, taking into account what internally in (common code) Xen we call a
"CPU". You certainly may call "CPU" what is a collection of threads / harts,
but you then need to clarify this in a prominent comment somewhere, and you
need to be entirely consistent throughout the RISC-V sub-tree.

Jan

