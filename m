Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F0A4461E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 17:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895924.1304607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxsJ-0000yC-UM; Tue, 25 Feb 2025 16:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895924.1304607; Tue, 25 Feb 2025 16:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxsJ-0000wY-Rf; Tue, 25 Feb 2025 16:33:39 +0000
Received: by outflank-mailman (input) for mailman id 895924;
 Tue, 25 Feb 2025 16:33:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmxsI-0000wS-8e
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 16:33:38 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 435b6bcf-f396-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 17:33:37 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f378498c9so5764014f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 08:33:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86c93bsm2820356f8f.26.2025.02.25.08.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 08:33:36 -0800 (PST)
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
X-Inumbo-ID: 435b6bcf-f396-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740501217; x=1741106017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VgXAL9yCAZAhtf5KHT4vLNlpy5MO1dgA+8sDSM4/E3I=;
        b=gBrWdjZqgFOToB+6Tquj9DtoNBtP/9zlMqeu0dViRaOKjTVgYQXKsf2gZF1OxmPNE9
         kMJDAoIGdSUmZGSTkdBEac5X4a45p8Ml3XGh/i21RVdhUsNlMLZCkn5VFf0TwCe7r326
         JUo/OA2EmmA2+kG4ONJkNibaI6mJa71MLy9YEvyUjYHFExofZpGi9OmJCe6526DjsxR+
         FoU9TwPHNABXV2MM+/oBiJToiksr9Jn/FUFkWLt7x3OzyBS3Fr/w+YhLwiZ+enHtHiK1
         N0MZwzKO/hvyrkjKurKOA/xdAQz0VLL7d1FQ3ja+r43F8/hTXYiAq4PLuw8GL0gauI2a
         dIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501217; x=1741106017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgXAL9yCAZAhtf5KHT4vLNlpy5MO1dgA+8sDSM4/E3I=;
        b=P9HIkEYe0FNxLucVPmZTgFvpPmX/wj4Tf0Wd6R0J/iijyEOXD7eY6DAM9jmIuLx+jp
         QCHDbefhWnUk2fuTk1S27LRcQROF35+IrSxsRu5fzu07akBcIFXPIlzOZ52ICXD8jNC1
         Ko+dJQ+vjrvcabZzy1MMr5arW2ikNrWipgYqy8wSUIXbCfrBGaeS5Hx6VLgBdSaD38VU
         A4f+yYGcgQzIOWDFO6hx3IhiApesbW7VySW09hVq7rGuF2LG4ZLCJKfllKVYGvHePt+J
         5fqEvx+EBFTh1fgYMbgZEb0UYBrUUTYbNYvCzvO1SDJyDswoPEa2XEsCZKp9M2cJgNP9
         sXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7e8OpCB7GfzLrtgTD5SXXF1sWjGPGKUVD2Xq40lVpDMse8d4Bh/J1ITMdjxJV1m9ci1+bFVj0pyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu1gcfQebaGquTMbHAxd2QhUrgTeXjHIplZO7ztiKzEpMmINOZ
	FzscfXs0DX2y/79018CkDmcR4SZd8k0CIBsUjcw5m6usxiVpoHBf7k9k0oIEfQ==
X-Gm-Gg: ASbGncvWp+ijGGnoidKmuP2WmBdMgu7NbC7h+TiNR0tpaL10zLk/gu4tzQ8PoP7/27f
	kMxCaYc0YA9n+pJYnuFj3fKYBu3qZv5TPfiY7yVxqsgS4TqmNqjW/45Z8Ce5IObIMnfMjSiYicX
	V4xcfy4u3/ST4WzAUmO2+USGQ1LiruqIPt8eqDwQfxiMgLaBdtz8P9moyJPl1lCldY1vjyWle1d
	aev7zSGpPKEc68sFLsnDbr0La0/V2qzFnRobi6IkRTKbCWIJaDOocH0GXfhmZuTZfcV2aZKmNAP
	yXr6Gv6vtAsAFRNEw+t8SVN8Sq+rwq6IXrV/Vp4smI6v/g9QnnLSsaRm1zTFE8IMm+jgSjOp/0J
	NVsQLPVgPz2I=
X-Google-Smtp-Source: AGHT+IHMzB4V2TlkJfzyD1nYxqCs3FzKmBwiauRM/dYoe4l4OJ+qaLdF0CCCgor3tQe2YBX0puottg==
X-Received: by 2002:a5d:44c6:0:b0:38d:d6ef:f8 with SMTP id ffacd0b85a97d-390cc60ab83mr3052109f8f.30.1740501216830;
        Tue, 25 Feb 2025 08:33:36 -0800 (PST)
Message-ID: <1d4aa263-3a9b-4968-9b16-3dc3dcdc4b0c@suse.com>
Date: Tue, 25 Feb 2025 17:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/IDT: Make idt_tables[] be per_cpu(idt)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-6-andrew.cooper3@citrix.com>
 <59e8952f-d49b-46de-ab57-07536a1028c0@suse.com>
 <6d81b7b7-5317-4e49-8b39-1e3810d244d7@citrix.com>
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
In-Reply-To: <6d81b7b7-5317-4e49-8b39-1e3810d244d7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.02.2025 16:40, Andrew Cooper wrote:
> On 25/02/2025 9:07 am, Jan Beulich wrote:
>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -819,6 +819,7 @@ void load_system_tables(void)
>>>  	 * support using ARRAY_SIZE against per-cpu variables.
>>>  	 */
>>>  	struct tss_page *tss_page = &this_cpu(tss_page);
>>> +        idt_entry_t *idt = this_cpu(idt);
>> Nit: Tab indentation here.
> 
> Yeah, I noticed that only after sending the email.  Other parts of the
> FRED series vastly changes this function.
> 
>>
>>> @@ -830,7 +831,7 @@ void load_system_tables(void)
>>>  		.limit = LAST_RESERVED_GDT_BYTE,
>>>  	};
>>>  	const struct desc_ptr idtr = {
>>> -		.base = (unsigned long)idt_tables[cpu],
>>> +		.base = (unsigned long)idt,
>>>  		.limit = sizeof(bsp_idt) - 1,
>>>  	};
>> Coming back to the comment on the earlier patch: Now that you touch all
>> of the idt_tables[] uses anyway, ...
>>
>>> @@ -30,7 +31,7 @@ typedef union {
>>>  } idt_entry_t;
>>>  
>>>  extern idt_entry_t bsp_idt[X86_IDT_VECTORS];
>>> -extern idt_entry_t *idt_tables[];
>>> +DECLARE_PER_CPU(idt_entry_t *, idt);
>> ... this probably really ought to become
>>
>> DECLARE_PER_CPU(idt_entry_t (*)[X86_IDT_VECTORS], idt);
>>
>> ?
> 
> I'm afraid this doesn't compile.
> 
> arch/x86/crash.c:66:17: error: passing argument 1 of ‘set_ist’ from
> incompatible pointer type [-Werror=incompatible-pointer-types]
> ...
> note: expected ‘volatile idt_entry_t *’ but argument is of type
> ‘idt_entry_t (*)[256]’
> 
> Similarly {en,dis}able_each_ist() and _set_gate_lower().

Well, did you adjust the use sites? As said in the respective comment on
patch 4, that'll be necessary (to account for the abstract extra level of
indirection; generated code ought to not change).

Jan

