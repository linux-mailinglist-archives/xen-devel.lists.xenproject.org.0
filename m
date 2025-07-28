Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDECB13B6A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:24:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061502.1427097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNpQ-0005BT-4a; Mon, 28 Jul 2025 13:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061502.1427097; Mon, 28 Jul 2025 13:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNpQ-00059C-1x; Mon, 28 Jul 2025 13:23:44 +0000
Received: by outflank-mailman (input) for mailman id 1061502;
 Mon, 28 Jul 2025 13:23:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugNpP-000596-Ao
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:23:43 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 147f25bb-6bb6-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 15:23:42 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so2148843f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:23:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f67c2d7sm4955144a12.43.2025.07.28.06.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:23:40 -0700 (PDT)
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
X-Inumbo-ID: 147f25bb-6bb6-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753709021; x=1754313821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y3ZqL6KwEPTNujPVHj55JbEayN+jX1lpoxnnyt0mcTE=;
        b=FHOSbR7dw2uSzhA8SR4Qsiq2Hi+pYQv665uaDr+JqmFdLMucwuHCrhOc9zPEmxQ5Wb
         iYiGqEijt/q7L1je8sjwVncPXouzbu/xrEoZpLT11WvCJUje5VatBZKraASUNng8PJVB
         YchFc8UhtkxGeJ6+Ug14yJDGWLljMf7BpswsmtAAQYOsX4T6btQGmPUoMjUkUZoeoGH7
         9Y5IVnA0Fbs1mTx2BOJHyFQ47G1t2NgJW+MWrYEFViuvebWKdIwaUWMkMhAPKTEBLFm6
         5iC+yx+3M3mYlhBGOUPXUmb7L8lZfCPG6EDa1lRS1AhwzkqtVtdh+1rk9dIkVAxSDjWk
         tr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753709021; x=1754313821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3ZqL6KwEPTNujPVHj55JbEayN+jX1lpoxnnyt0mcTE=;
        b=iRkYS1i39jRBLZEGnjpAOTePMK3VmXgpKUOXWi0vFeZIrTmHDgJqy2M/kznNs2scEr
         HrKfdGyhklzvGQlO5c2K5jMLtZ2Yz8QXUJvtJxasylDchfiBYmxnfrBwbEhxi/xGKN8V
         Phy/6iE0K/+yVLddiNY4dvkxbr36Ir6OqR8bhdRjVW0hxpfFEkjXrOY+ryCLcLLRJeTX
         kwaFXOOoEuGk4YvhHcku15X+wNZ0exFH7i/Gg2L2LHpk4ux+mDgfXJgVxFRTkbzjLuYc
         omI0GtBFd8CGanhTWkfkiwNRt4kz7lCklq31T4eBHCbXCOuSnqQQvSDO1ptUIAdKxDEc
         juYA==
X-Forwarded-Encrypted: i=1; AJvYcCUomLdEX+4FdJ3qU4s9q08ty6HFJ2x9EfaGEd2rRvLPwzC9TZkF+OEovpUGE8Fi6ElUToYdUXWs/Yg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yysa84NT1/GmuW+meh2yDCyxg+OIKolCBLRT5O8plqrk/JzFYNt
	cTZnq+AcFfU3s5213gYvpqk4ZLAOPwCmLpZHVuDMyfgR98TAsBs3yG1YFUWvihPv9w==
X-Gm-Gg: ASbGncvtp3jA9OyyeeeLFU6xz1gmbl21DRw1Ao3ILLY4lXxyT60DFBMfUQSvDpGBCvG
	oHIdvUya9KlP06CIyhlTpb2FnUCTli9jkfPD8SeDPaI70TW8q2DrtkKs6c0rRSG77aJflMqhF/i
	7jX+iQwCJIzlgwWx847GHL9LtLAPBIhd3GVUERR9XlzuBqPoFQ1Jp2kLftr8Mfnf7vJT7CK/TkE
	uSlN6Wfqevt9XaDgd5OxF6S/h7FNW8nEZvpqfSb+voEBYKh0igZiAH7CMJqM6tfIvcCGpIlAFKA
	n9WOn/8hIVadO8ANXoQhEqPellXUlgLDU3b3kfYBTWLYPFYNBvlAGI5RwVbX7zN8g4vABI8gG8F
	EYRdYndp3eH7IkTsxQv9eno/q46HVUwJ3s59zb+wRIbAmeF1I3g6U+JdPVcVjz9GZANr+0y3mL5
	HynF2WRbE30tT1CwS4lQ==
X-Google-Smtp-Source: AGHT+IHhJQjuGdL3GXQlS5Tu9h/oD82eebizfFXVWSCKWJWNm2bm4RmYoSaHuAytef3kqjG4ahOzzA==
X-Received: by 2002:a05:6000:2505:b0:3b7:888d:8d9a with SMTP id ffacd0b85a97d-3b7888d90d8mr2361151f8f.29.1753709021454;
        Mon, 28 Jul 2025 06:23:41 -0700 (PDT)
Message-ID: <c412c163-e076-4513-8eca-6607534a8b1e@suse.com>
Date: Mon, 28 Jul 2025 15:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
 <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
 <c112f144-6f75-4f19-ac14-57d538ccc7ab@epam.com>
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
In-Reply-To: <c112f144-6f75-4f19-ac14-57d538ccc7ab@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 15:09, Dmytro Prokopchuk1 wrote:
> 
> 
> On 7/28/25 12:56, Jan Beulich wrote:
>> On 27.07.2025 22:27, Dmytro Prokopchuk1 wrote:
>>> Explicitly cast 'halt_this_cpu' when passing it
>>> to 'smp_call_function' to match the required
>>> function pointer type '(void (*)(void *info))'.
>>>
>>> Document and justify a MISRA C R11.1 deviation
>>> (explicit cast).
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>
>> All you talk about is the rule that you violate by adding a cast. But what is
>> the problem you're actually trying to resolve by adding a cast?
>>
>>> --- a/xen/arch/arm/shutdown.c
>>> +++ b/xen/arch/arm/shutdown.c
>>> @@ -25,7 +25,8 @@ void machine_halt(void)
>>>       watchdog_disable();
>>>       console_start_sync();
>>>       local_irq_enable();
>>> -    smp_call_function(halt_this_cpu, NULL, 0);
>>> +    /* SAF-15-safe */
>>> +    smp_call_function((void (*)(void *))halt_this_cpu, NULL, 0);
>>
>> Now this is the kind of cast that is very dangerous. The function's signature
>> changing will go entirely unnoticed (by the compiler) with such a cast in place.
>>
>> If Misra / Eclair are unhappy about such an extra (benign here) attribute, I'd
>> be interested to know what their suggestion is to deal with the situation
>> without making the code worse (as in: more risky). I first thought about having
>> a new helper function that then simply chains to halt_this_cpu(), yet that
>> would result in a function which can't return, but has no noreturn attribute.
>>
>> Jan
> 
> Yes, Misra doesn't like cast.
> 
> Initially Misra reported about non-compliant implicit cast due to 
> 'noreturn' attribute:
> smp_call_function(halt_this_cpu, NULL, 0);
> 
> I thought that in this case explicit cast is better, telling compiler 
> exact type.
> But, Misra reported about non-compliant c-style (explicit) cast.
> So, I decided to deviate explicit cast.
> 
> I tried to write wrapper function to resolve this.
> Example:
> static void halt_this_cpu_2(void *arg)
> {
>      halt_this_cpu(arg);
> }
> void machine_halt(void)
> {
>      ...
>      smp_call_function(halt_this_cpu_2, NULL, 0);
>      ...
> 
> Unfortunately new R2.1 violation was observed.
> "function definition `halt_this_cpu_2(void*)' (unit 
> `xen/arch/arm/shutdown.c' with target `xen/arch/arm/shutdown.o') will 
> never return"
> 
> Maybe it's better to have such violation....instead of R11.1 
> "non-compliant cast"
> 
> 
> I can remove cast and re-write deviation justification.
> Are you OK with that, Jan?

I expect so, as a temporary measure. In the longer run I would hope Eclair
can be adjusted to accept such cases without complaint.

Jan

