Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20BB26A31
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 16:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081859.1441820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZO0-0001Q4-Dt; Thu, 14 Aug 2025 14:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081859.1441820; Thu, 14 Aug 2025 14:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZO0-0001Nb-BG; Thu, 14 Aug 2025 14:57:00 +0000
Received: by outflank-mailman (input) for mailman id 1081859;
 Thu, 14 Aug 2025 14:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umZNy-0001NV-Dt
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 14:56:58 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec51acce-791e-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 16:56:57 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb73394b4so161173266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 07:56:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6186bfee29csm3585929a12.15.2025.08.14.07.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:56:56 -0700 (PDT)
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
X-Inumbo-ID: ec51acce-791e-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755183416; x=1755788216; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SFMWPIq33IJFQo2G4W2Ln17Ppbie1swlU3g+evqZSEM=;
        b=NFEBxRtTUf31ZNfMNQDIfKYqy6omseE8ooXjlzPiKod+NTl06+YNq68iPMLW/UkVej
         BaAIF/tuQrDxkMJcQi8hyVpxbhDT3K3bJYZXlVN8x510W1W0V8Xg/4TqdeXQ5Uw/7jhk
         PmCYXL0nqNr23pxxIi1WCWwhdSVK79n+LC643TJAJCr5WR9hT5S1JX3+zpDNX++qqKVn
         HC1Dsl+59Dm/tg3cgq+82v0KERkI9gYmBPtJA/l/5+b7mdkzMzZPBMTMdoiWvyPTI1g8
         GiVk5yvUQZRcwCHlR4J8XZtnWqwQ/n0quARDFw+CyqQLRA4g25+Y8fIJi+knQjR7qgM5
         K2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183416; x=1755788216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFMWPIq33IJFQo2G4W2Ln17Ppbie1swlU3g+evqZSEM=;
        b=NQSZfTJhuLrGfOfku9hvOg9Qth0yw9J4gAaWeYX198Yz7rFNzM6mbefF408IlU7s3O
         9lPDSGlDzAYnN7aJArB6a9fmS/BIBvw6DrQ68ZMVtOtL82Ra/8FRz6zpjeswNOeDtrIM
         NY3RC4yXD1vbhbqrFIV7c8eNtYj5vRrqMOnxABqXdQ2g1242U4/hmjdjLjWawEpUzUgH
         +Mx45m0LFCZZI/CreTe2SIwvHgTXee3snAZKnwDuiXCoUKB6P1K0DPI60gnE0Ne8N0Ve
         Bb9PBcIcva2ks/JUj/tj/Sw8RXv5TNCaR+UvdU8cxP/ROsuf0nzjXsrDT+H0HJwWbOt5
         3/dw==
X-Forwarded-Encrypted: i=1; AJvYcCUHJJrqP1VoBVub+jPNA1uar25ouibtg73xCItz25D6nR8gcb0+5EW+2UZI/e4SZgQiaC0z7BY78c4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0JeNsUtxpKeMCzjtsAvGCLPIurKUGfG1xvejepC0xqtWKuySd
	d0CheC4B7czS66KHDmXO5Qt9OpNGFZ0KEWXNqPsbgZhXEPqpQW8MZhMq04qN3wMrCg==
X-Gm-Gg: ASbGnct4T/AJlFKv+w5NZQbwbthMv/fxkEPdpbtCzZMPjJW8eMhpWRGDaesAhTi2FMw
	Rz3Tykl0PmLrwQhVbSqWmjYUiFxq0pFAZvT/AsztoG17CSg2kSD19RIOi7rQoNG99OFDCgIb5wo
	ArRugw2ZjIn0jaTycmEThYU01E2Mt+p9Pof6hveRyVGFXB3gEz+AWDzzrnnj6xsCC1qEJpblh3S
	e+Ip4mV/yjMhCiBX8dFyYQe7d+KH7837Rk9l7D3hAf7L/vt6Wm/G2q3VDfUMbDM3PZS5vrCL+Dz
	kS14OqruIqcEr+mgZkG7+LUw5gra+qcRm+BWhEc16Y+0Sr0GaaKCWK6fIYAEdF8DJcjVAJiGPBd
	K/2teDc3xYhDo/topW6NUbyIydi0w56/lCZPaVA6Nwo9g9HunPvWcukpAk/TXrz4XDK/9MstWF+
	vqsHhJxzA9e87j39eA4g==
X-Google-Smtp-Source: AGHT+IG77hDj9tT7Q8JU8O+pnimKqfobWfOHAhYuisvLU9jLxjWgrRTlVpAtzJZVQpvkUWyDISqhFA==
X-Received: by 2002:a17:907:9814:b0:ae0:de30:8569 with SMTP id a640c23a62f3a-afcb93a26b3mr291816266b.1.1755183416399;
        Thu, 14 Aug 2025 07:56:56 -0700 (PDT)
Message-ID: <b4315516-289f-4495-a0c7-f504f92ec5cd@suse.com>
Date: Thu, 14 Aug 2025 16:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/22] x86/boot: Adjust CR4 handling around
 ap_early_traps_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-17-andrew.cooper3@citrix.com>
 <270b2ad1-fb8a-4a0a-8733-a8f3f8f25a94@suse.com>
 <64dc9f62-b48e-400b-8840-feff2f688913@citrix.com>
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
In-Reply-To: <64dc9f62-b48e-400b-8840-feff2f688913@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 16:54, Andrew Cooper wrote:
> On 14/08/2025 3:47 pm, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>>> @@ -63,6 +63,14 @@ LABEL(s3_resume)
>>>          pushq   %rax
>>>          lretq
>>>  1:
>>> +
>>> +        GET_STACK_END(15)
>>> +
>>> +        /* Enable minimal CR4 features. */
>>> +        mov     $XEN_MINIMAL_CR4, %eax
>>> +        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)
>> Strictly speaking this and ...
>>
>>> --- a/xen/arch/x86/boot/x86_64.S
>>> +++ b/xen/arch/x86/boot/x86_64.S
>>> @@ -11,16 +11,19 @@ ENTRY(__high_start)
>>>          mov     %ecx,%gs
>>>          mov     %ecx,%ss
>>>  
>>> -        /* Enable minimal CR4 features. */
>>> -        mov     $XEN_MINIMAL_CR4,%rcx
>>> -        mov     %rcx,%cr4
>>> -
>>>          mov     stack_start(%rip),%rsp
>>>  
>>>          /* Reset EFLAGS (subsumes CLI and CLD). */
>>>          pushq   $0
>>>          popf
>>>  
>>> +        GET_STACK_END(15)
>>> +
>>> +        /* Enable minimal CR4 features. */
>>> +        mov     $XEN_MINIMAL_CR4, %eax
>>> +        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)
>> ... this could be 32-bit stores, even in the longer run.
> 
> ... no, they can't.
> 
> The store also serves to clear out stale X86_CR4_FRED, prior to FRED
> getting reconfigured again.
> 
> fatal_trap() uses info->cr4 to decide whether it's safe to look at the
> extended FRED metadata.  Strictly speaking I probably ought to read the
> real CR4 (in read_registers too), but using a 32bit store here would
> extend a 1-instruction window into quite a larger window where exception
> handling would not work quite right.

Oh, I see. Mind me asking to add brief comments there to this effect?

Jan

