Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E5DCF456A
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 16:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195504.1513439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmJV-0001MO-Em; Mon, 05 Jan 2026 15:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195504.1513439; Mon, 05 Jan 2026 15:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmJV-0001Km-BO; Mon, 05 Jan 2026 15:16:09 +0000
Received: by outflank-mailman (input) for mailman id 1195504;
 Mon, 05 Jan 2026 15:16:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcmJT-0001Kc-CI
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 15:16:07 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 743a29c9-ea49-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 16:16:05 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso97615e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 07:16:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bca2fbfdsm98065f8f.17.2026.01.05.07.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 07:16:04 -0800 (PST)
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
X-Inumbo-ID: 743a29c9-ea49-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767626165; x=1768230965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d0ZvIJsgBJSFFLwejM+snzgNBAfb6u9D3qK9/6a/auo=;
        b=Mfs21TKmAMAHfJsy25OMilOM1p+k5GWvTtoCo5hc/wGeG4Jg+WRD7u7/vF5q0bAeDH
         OXsWCyQrwGEXUV7cXLzOhecy25ncKIKt+xNLqjBzCY1I5QwctadSTph29f5tOvb30IEk
         j7NixxaNqyGgiO0jr3sqoNBXpE72SnWffU6rEee+jyKtUfyfzyzQdbzVzeRtliHY1G7L
         aAQvPyDLu5m+XkkwoPqN4W/BiT8S7ZRLt4BwRrbRCys0dq5ryLr6vFoOGjd5y5Lp7PKI
         5tIoL00qRJXVgGu7vPy0QlYdP9VmtCjNEE2YGq+vKR4+c6NkyhyXFyGW57DUTt/wcJDo
         R6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626165; x=1768230965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0ZvIJsgBJSFFLwejM+snzgNBAfb6u9D3qK9/6a/auo=;
        b=MDFZmKLfTdm7NOHKqk8z19iZ9IouJsynkrfkNh4HczSz/9rpHKXxgXcyqbl+knoDNR
         sGCpBNoxQcezCHskr9Ub0tlSQyfLRfQ8AQdNl/QcBsjLNy4gn7fZ+OFH6YM4bjbX6pKv
         DP4M9HEMiDoaBmBYAZSaSC/1ypj6mr42J55LPWeJKCEW+CIHxk7GLGaEyMJ263oxhRc4
         PaQVbwUmZcmq/sjEVQ/nXF3UCY68sUyQC1i+/3xKQ4xMdxQkhlU6cPLkN3sFg5ulpG1d
         cnOfWsxGikXafL0aDcugS96higbIlu4+jY8WLGyexAGjU4XfrKNZNlA9X5qx+GNbu8tA
         pe5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbRkPRT8RUU0R112vJh4XzDH5yKpDamjBZ4SYTOAHFnOGDcHpwIEA7QPRWTpwYN0/cmMZ757WcI+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza5eu8EEkqdzrTR5+lYKrd/Q1UVyYSkK8uP/DpHeCpfRAcI9+p
	evagBhBziSMCQkYyKrZqnPZVkAoLUK6ssLJbIZtwhAzbEN1hKJ/3uJWzM307tHkjbw==
X-Gm-Gg: AY/fxX4ENpyu5K/gfM2G6Pq71s4/hQGi9znMEfODtIhr/gE/RT4NLOjojTE0pbEjMJO
	5nQ39ZwKixLfBW8/HWE836DFbCa9FtAZFSbhxkgmDKObdPoNQHq3RPwwGksMiUTBe53FoThAi5Z
	ID4pATQWW181Yh6l83uJpqdDD9I9kQ6jXvzY2SnyWWY/HlcSZB5qSiCKU6Gb/bMTLRBtFuzaL/3
	4rXsSJ0JSPs/8rw1qLMtHjFJ6Z3tKMDIoMylfi7ZLYoUAEw2GhZRmf+5qYaZASnfblfLfUycABT
	MrrIqfv0o/EMFdXVEUTMVlO76WKJ9zNcJHuKgYXqi4fa5AKmSaxVAX/glj2EN6L0PmGPahc2D6g
	06X/yglICzrv0lL+e+FtojfXdFh1twvH0I3eU9XRAWCNlo4LRLmmWpxoTHVpwN/Ny9+Uh9/rJWD
	QdM7XuQ/u16Vl9UchT1eXSLLD/Kv6K9q3pv4keUQpQpp8rEe+okL67WfCQihDT7NsdB7BazP10p
	8FprzjFWaHNwA==
X-Google-Smtp-Source: AGHT+IHvUgte7wULTj3XTxiQKEJLLoloXRcQ2p/6mAU+wT8Ak6K5k71/9n7c2m9Rg3FtlPmT5F93Gg==
X-Received: by 2002:a05:600c:35cb:b0:479:3a88:de60 with SMTP id 5b1f17b1804b1-47d1959e061mr604262115e9.37.1767626164690;
        Mon, 05 Jan 2026 07:16:04 -0800 (PST)
Message-ID: <7bd2372a-6687-47c5-94df-2366866f53ea@suse.com>
Date: Mon, 5 Jan 2026 16:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer
 toolchain baseline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-3-andrew.cooper3@citrix.com>
 <5b49e965-7e1a-4b04-baa9-c14e2de2e247@citrix.com>
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
In-Reply-To: <5b49e965-7e1a-4b04-baa9-c14e2de2e247@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.01.2026 17:01, Andrew Cooper wrote:
> On 30/12/2025 1:54 pm, Andrew Cooper wrote:
>> --- a/xen/arch/x86/xstate.c
>> +++ b/xen/arch/x86/xstate.c
>> @@ -310,21 +310,21 @@ void xsave(struct vcpu *v, uint64_t mask)
>>      uint32_t hmask = mask >> 32;
>>      uint32_t lmask = mask;
>>      unsigned int fip_width = v->domain->arch.x87_fip_width;
>> -#define XSAVE(pfx) \
>> -        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
>> -            asm volatile ( ".byte " pfx "0x0f,0xc7,0x2f\n" /* xsaves */ \
>> -                           : "=m" (*ptr) \
>> -                           : "a" (lmask), "d" (hmask), "D" (ptr) ); \
>> -        else \
>> -            alternative_io(".byte " pfx "0x0f,0xae,0x27\n", /* xsave */ \
>> -                           ".byte " pfx "0x0f,0xae,0x37\n", /* xsaveopt */ \
>> -                           X86_FEATURE_XSAVEOPT, \
>> -                           "=m" (*ptr), \
>> -                           "a" (lmask), "d" (hmask), "D" (ptr))
>> +
>> +#define XSAVE(pfx)                                                      \
>> +    if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )                      \
>> +        asm volatile ( "xsaves %0"                                      \
>> +                       : "=m" (*ptr)                                    \
>> +                       : "a" (lmask), "d" (hmask) );                    \
>> +    else                                                                \
>> +        alternative_io("xsave %0",                                      \
>> +                       "xsaveopt %0", X86_FEATURE_XSAVEOPT,             \
>> +                       "=m" (*ptr),                                     \
>> +                       "a" (lmask), "d" (hmask))
> 
> This loses the pfx.  I've fixed up locally and double checked the
> disassembly.

Question being: Do we want to stick to using the prefix form, when gas
specifically has been offering a kind-of-suffix form instead from the
very beginning (xsaves and xsaves64)?

If we wanted to stick to the prefixes, I'd favor a form where the use
sites don't need to supply the separating blank (i.e. the macro itself
would insert it, as doing do with an empty prefix results in merely
an indentation "issue" in the generated assembly). Thoughts?

Jan

