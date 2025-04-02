Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E6A79046
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 15:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935716.1337116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyUU-0004eL-8v; Wed, 02 Apr 2025 13:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935716.1337116; Wed, 02 Apr 2025 13:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyUU-0004cc-65; Wed, 02 Apr 2025 13:50:50 +0000
Received: by outflank-mailman (input) for mailman id 935716;
 Wed, 02 Apr 2025 13:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzyUS-0004cW-WF
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 13:50:49 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a678662-0fc9-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 15:50:46 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso49437785e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 06:50:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e31csm17254292f8f.68.2025.04.02.06.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 06:50:45 -0700 (PDT)
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
X-Inumbo-ID: 7a678662-0fc9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743601846; x=1744206646; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pSW9VSD9x8+DlQyOnY1YaaClIczFQMLB3PDQAj7FsFU=;
        b=JZ84A6Iu1MUIK8z6xFrOFzi2I3pvEVUeUwvETG8zfDk3RYl/DM9rOxQc47v/eNp56j
         waBjWxNhoKJixFGVTL1W5cQOG14hE3XlNgb3oWzHldzI72H55y2m2VNrKVKa/8Asi+a/
         U9yKlUSpHJOEM0Tntz2Yo5M5oiDn7IKRGE2pea8q1LQFhxGgGrajU5vVwWYFDpem0vwS
         jY9Zb4TwbwhiL+IDH0THN5EahrM1zuLDUI+qgaBa2ou+4AfMZCSiCEm7TQDCBO2b4M6u
         gZdWej5aE1CsqRDxHZFcbaRJWVgFNKixnUtEtWRL4UbHQlLBqe1To3xYOpnZUEf1QiRG
         Nt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601846; x=1744206646;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSW9VSD9x8+DlQyOnY1YaaClIczFQMLB3PDQAj7FsFU=;
        b=EMIer5GwG/YKDMAgJ+8p+jenbCezKUH86p28hkId8CLDgk8WVWj10SCDCf+sFHDaTL
         HDuY4WfTUI8YUNmVW6RJDAAFMYKzckeJ+mAfmzcs6p6Bzkowp6SXKeYtPb0VaJXzRNcd
         6xGGeJ/8wCRolvxlYWG16HefqoUoaV3Xzl6rVknrAh2oRSOzhHnK6PJXJkhY5F3/t74f
         KFG+IHK0/6fTMSX/JKbrky2x0ATIdOs/+EWioV+TNUo7mLAjMyIclDUA9OlQ+FjKtjjz
         R8ujWzAxNuvCqo/16c4vIUgIZ5rsqxew/SOUwNZE15x0P1bv1qJy0L8Jr5BoaM4/kNVr
         o5LA==
X-Forwarded-Encrypted: i=1; AJvYcCU/MS6Cnc1bTB2H4ULshCN1kCBCl+b8lnmJE451c+eL1lmlIUS+kl7l8iQ6TZKw+fvvMVVOiv0yulc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzRNNsw9AXLXmChleIWNulU1BgWDBZckFe8E9gycTI+aCitnpb
	oUOpcXlcBSQ2i64dpROmeyTg3dCqdbZG6ox0/RRQnL/qA2/OZtKuCXgc+aVL1Q==
X-Gm-Gg: ASbGncuBwirMp0+gDLl4bUo+exMOfmxM1QCa2AaII63OM2dVSxcs++8er+UoFwokL/o
	g6rzLUSKSmYxSs4eenL/v4K/VnFDHjY64GjZp9foEIgviIewcbFkTg2S1GygDmA5h6MhleSQEnj
	uJqkcPz96nlW5qmkBqVZwjo0U16yfjG5iJBaU1HWTOfEIp4Uot7aWFN+DoIEnQOpO60CJJIiN63
	zHbBg4kBJEJTtdiqd8VMNV1JsXqPNDcRe4M0D1oJU9m2PqJjZgKsnUzRjEAHcgMD9uViSAKSdkr
	R3o303Wbfy5o6GY3pgkLn6R9NXiRUGCcIX1QVSgms44D/yJXjvYL2hI1NinAx5Ou+Wz2I/U/cWh
	9Eu/I9HYoLS0gJ2hQgI4y99jm9ipcrw==
X-Google-Smtp-Source: AGHT+IF3sBU0E2+GC4iUiNctXJzQeNCrPF47Sx+FMZpNZ8/Hk7PObVAARRxj1D2gxrW2gTYRbsb20w==
X-Received: by 2002:a05:600c:4e87:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43db61d5fd2mr139646895e9.5.1743601846063;
        Wed, 02 Apr 2025 06:50:46 -0700 (PDT)
Message-ID: <3f51a217-8f23-4c83-b431-17ae83ed395b@suse.com>
Date: Wed, 2 Apr 2025 15:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/apic: Fix function typechecking in TSC Deadline
 errata check
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220321141207.18422-1-andrew.cooper3@citrix.com>
 <f3a49994-db28-5976-579f-b94c1c6d9339@suse.com>
Content-Language: en-US
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
In-Reply-To: <f3a49994-db28-5976-579f-b94c1c6d9339@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2022 15:26, Jan Beulich wrote:
> On 21.03.2022 15:12, Andrew Cooper wrote:
>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -1092,12 +1092,17 @@ static void setup_APIC_timer(void)
>>      local_irq_restore(flags);
>>  }
>>  
>> +#define DEADLINE_MODEL_FUNCT(m, fn) \
>> +    { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
>> +      .feature = X86_FEATURE_TSC_DEADLINE, \
>> +      .driver_data = fn + (0 * sizeof(fn == ((unsigned int (*)(void))NULL))) }
> 
> Are you sure all compiler versions we support are happy about +
> of a function pointer and a constant? Even if that constant is zero,
> this is not legal as per the plain C spec.

Thanks for the pointer to
https://gcc.gnu.org/onlinedocs/gcc/Pointer-Arith.html - this is indeed
fine then, with the assumption that this is also only meaningful with
the non-upstream -fcf-check-attribute= patch in place.

Hence with ...

> Also strictly speaking you would want to parenthesize both uses of
> fn.

... this taken care of (also to please Misra)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

IOW ...

>>  #define DEADLINE_MODEL_MATCH(m, fr) \
>>      { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
>>        .feature = X86_FEATURE_TSC_DEADLINE, \
>>        .driver_data = (void *)(unsigned long)(fr) }
> 
> As long as we leave this in place, there's a (small) risk of the
> wrong macro being used again if another hook would need adding here.
> We might be safer if driver_data became "unsigned long" and the
> void * cast was dropped from here (with an "unsigned long" cast
> added in the new macro, which at the same time would address my
> other concern above).

... while I continue to be concerned here, we can as well deal with
that if and when a new such hook appeared.

Jan

