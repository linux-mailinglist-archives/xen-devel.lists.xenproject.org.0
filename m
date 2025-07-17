Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274CCB08A73
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 12:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046513.1416860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucLoA-0002It-NJ; Thu, 17 Jul 2025 10:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046513.1416860; Thu, 17 Jul 2025 10:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucLoA-0002HS-KZ; Thu, 17 Jul 2025 10:25:46 +0000
Received: by outflank-mailman (input) for mailman id 1046513;
 Thu, 17 Jul 2025 10:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucLo9-0002HL-9G
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 10:25:45 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 649e8558-62f8-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 12:25:43 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b45edf2303so694552f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 03:25:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f2b5221sm3044297a91.44.2025.07.17.03.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 03:25:41 -0700 (PDT)
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
X-Inumbo-ID: 649e8558-62f8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752747942; x=1753352742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ynIVlEc1we2Dot9WmVCeSuG01rhvnYHJMlhhMjjNppE=;
        b=cUDRd0ktM1REIHY7aWItdTPhqEyK2lTGb2lMr9swdkuRxfyv754k+YAJVXRHpZFLqS
         HHuy6c67DgTGyVeIfUmqYUTB+hHLnaN9pdzHYQvriJyV3CLgzHvaMZ+J42CRG8Z9pye3
         4SQ3W1kv2+fSrAvOK7JCuEPpzSBE568Ho1Qa6Seq9LPFUsovlzaSa/2h1PC1o+f4/7Y5
         huFysVNkfF1GyconoUkGk0ZEmnJv9F5qNuf//qIivrgHdNrVdZR/9s/hODk2mM3EZTlX
         L1UxofT4rhHNy9ITeJqM6EAdcwNratxmVltdN1YG8qFilXehZG/aXh5sFbeqtbJn1MJK
         1jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752747942; x=1753352742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynIVlEc1we2Dot9WmVCeSuG01rhvnYHJMlhhMjjNppE=;
        b=EvQ6iKih0I2CZ+s5hgNKHGbvzP2cG42b9PyybPg9+At3Z2g+cf5HiS9RHa2SKndg8/
         IyipH7sYiaXfO9mXiK8TnMIpzrocR79jjijxZjlbZs3NY1f/y02RxXe7nroSOWfCqkKc
         nSjXR6sXOMHE5lGAqIma+4SzKJHikYSdtO/lI/qgs3NUZucikxh+yjrwqr9C65a+1EUI
         r3A+P7CGyqW+vbIO0Gnh2JegEjQ7Kut0zpwGlmEF9jLOiGXQnZc9g26BI0ICos9eI6kt
         gtzI+54t2cw/cwmxhXmkfMflZ+XWO6eaqah5s0HnQ8fGRCoE/GGX87qzI1dWP1bY8LTJ
         l/ng==
X-Forwarded-Encrypted: i=1; AJvYcCUk1t9fvAdVmTFx8tivAhvAhDV9kzG8OuhNv3InYl7cjdW8Dcmyo72YqO+9DKBctsVfhiLHXcgbDn4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yypw84py2ZYgy9InAzzQFVFuXSpXAwYPkR+AD/bfBi9737YFdZ0
	8QVpcDEOTbPKUfYb42rcdYmXAjUwPaq+hh6Z2//bqcrnqhSZXHVSXpIrC2YuGjlf/Q==
X-Gm-Gg: ASbGncsLKF4pie/vAX7NkNHh+1wO3OEDjX0hkwKIo9ccvAVOk9wEoCVoXkK5Af+bD/p
	HOsAVgrYXkvHcs9+Il+gZ9mBTwQ0ps/d2rGAqBEuGCZdmwM+JSgz6YD6bcpLpytKm+kwloQ8R6i
	+qPtILWT3dZQN10BhLkLRTN9Q0AYQRGhbAdEBL+LOWtCbY8eOOfYIboDVggC2Nz+sA9sg5H0CAx
	4vJwaL/gEJmDDbHijaRTBXTn4wcH0PQHS7qWjFjFHhSg6hh9Et9WiWyUCJaCn90DRHlvVreOhAy
	XbpCtkIBcCsS+K753fK7i7QW7tWeYoEHrRNkqBKL76oaBUZ6GDrgp1P7aj5OzyoQXDEHb8dhWC+
	IzDIvVBvPgFA2V8ycyHPYlcko9Un+KRIYvc+sgIsFnD9669DRURS79hDScaayoXUeP7u3ys3/An
	G3y6En5jw=
X-Google-Smtp-Source: AGHT+IHPWAuiB8iGxNoY20RSQ32nKsOEpOkS2xTYLU6Mjr6CJnU9dclfP7mr9y1/jhNm4gUe122T7g==
X-Received: by 2002:a05:6000:24c5:b0:3a5:2ef8:34f9 with SMTP id ffacd0b85a97d-3b60dd73204mr5400155f8f.27.1752747942420;
        Thu, 17 Jul 2025 03:25:42 -0700 (PDT)
Message-ID: <007654f3-e26b-43b1-bc81-40ba25c9d787@suse.com>
Date: Thu, 17 Jul 2025 12:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
 <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>
 <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
 <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>
 <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
 <15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com>
 <958ae1b0-d139-41e8-b965-43ce640569c5@gmail.com>
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
In-Reply-To: <958ae1b0-d139-41e8-b965-43ce640569c5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2025 10:56, Oleksii Kurochko wrote:
> On 7/16/25 6:18 PM, Jan Beulich wrote:
>> On 16.07.2025 18:07, Oleksii Kurochko wrote:
>>> On 7/16/25 1:31 PM, Jan Beulich wrote:
>>>> On 15.07.2025 16:47, Oleksii Kurochko wrote:
>>>>> On 7/1/25 5:08 PM, Jan Beulich wrote:
>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>>>>>         return __map_domain_page(p2m->root + root_table_indx);
>>>>>>>     }
>>>>>>>     
>>>>>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>>>>>> See comments on the earlier patch regarding naming.
>>>>>>
>>>>>>> +{
>>>>>>> +    int rc;
>>>>>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>>>>>> How does this work, when you record GFNs only for Xenheap pages?
>>>
>>>>> I think I don't understand what is an issue. Could you please provide
>>>>> some extra details?
>>>> Counter question: The mfn_to_gfn() you currently have is only a stub. It only
>>>> works for 1:1 mapped domains. Can you show me the eventual final implementation
>>>> of the function, making it possible to use it here?
>>> At the moment, I planned to support only 1:1 mapped domains, so it is final
>>> implementation.
>> Isn't that on overly severe limitation?
> 
> I wouldn't say that it's a severe limitation, as it's just a matter of how
> |mfn_to_gfn()| is implemented. When non-1:1 mapped domains are supported,
> |mfn_to_gfn()| can be implemented differently, while the code where it’s called
> will likely remain unchanged.
> 
> What I meant in my reply is that, for the current state and current limitations,
> this is the final implementation of|mfn_to_gfn()|. But that doesn't mean I don't
> see the value in, or the need for, non-1:1 mapped domains—it's just that this
> limitation simplifies development at the current stage of the RISC-V port.

Simplification is fine in some cases, but not supporting the "normal" way of
domain construction looks like a pretty odd restriction. I'm also curious
how you envision to implement mfn_to_gfn() then, suitable for generic use like
the one here. Imo, current limitation or not, you simply want to avoid use of
that function outside of the special gnttab case.

>>>>>> In this context (not sure if I asked before): With this use of a radix tree,
>>>>>> how do you intend to bound the amount of memory that a domain can use, by
>>>>>> making Xen insert very many entries?
>>>>> I didn’t think about that. I assumed it would be enough to set the amount of
>>>>> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
>>>>> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
>>>> Which would require these allocations to come from that pool.
>>> Yes, and it is true only for non-hardware domains with the current implementation.
>> ???
> 
> I meant that pool is used now only for non-hardware domains at the moment.

And how does this matter here? The memory required for the radix tree doesn't
come from that pool anyway.

>>>>> Also, it seems this would just lead to the issue you mentioned earlier: when
>>>>> the memory runs out,|domain_crash()| will be called or PTE will be zapped.
>>>> Or one domain exhausting memory would cause another domain to fail. A domain
>>>> impacting just itself may be tolerable. But a domain affecting other domains
>>>> isn't.
>>> But it seems like this issue could happen in any implementation. It won't happen only
>>> if we will have only pre-populated pool for any domain type (hardware, control, guest
>>> domain) without ability to extend them or allocate extra pages from domheap in runtime.
>>> Otherwise, if extra pages allocation is allowed then we can't really do something
>>> with this issue.
>> But that's why I brought this up: You simply have to. Or, as indicated, the
>> moment you mark Xen security-supported on RISC-V, there will be an XSA needed.
> 
> Why it isn't XSA for other architectures? At least, Arm then should have such
> XSA.

Does Arm use a radix tree for storing types? It uses one for mem-access, but
it's not clear to me whether that's actually a supported feature.

> I don't understand why x86 won't have the same issue. Memory is the limited
> and shared resource, so if one of the domain will use to much memory then it could
> happen that other domains won't have enough memory for its purpose...

The question is whether allocations are bounded. With this use of a radix tree,
you give domains a way to have Xen allocate pretty much arbitrary amounts of
memory to populate that tree. That unbounded-ness is the problem, not memory
allocations in general.

Jan

