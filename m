Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E9A56764
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 13:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904960.1312738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWOc-0005hf-04; Fri, 07 Mar 2025 12:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904960.1312738; Fri, 07 Mar 2025 12:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWOb-0005eX-T5; Fri, 07 Mar 2025 12:01:41 +0000
Received: by outflank-mailman (input) for mailman id 904960;
 Fri, 07 Mar 2025 12:01:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqWOa-00055Y-7y
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 12:01:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ead42bb2-fb4b-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 13:01:35 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43bccfa7b89so14626845e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 04:01:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42c55e6sm78758855e9.23.2025.03.07.04.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 04:01:34 -0800 (PST)
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
X-Inumbo-ID: ead42bb2-fb4b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741348895; x=1741953695; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p95YJeBeMnMCmGNX6XRZSUU5pl9cPMp9s3eKMC3J3/w=;
        b=RjnHB/snNrCvxcw0izffhVTPNJDJ0dzvGbIXPMgtockQR1jnS8YhzlzfbVJKkJlfaM
         yUE83uKDTNwgdvW9Gqgq04z2dLfdB8vLos0hfw3DdxPusSYa7EqcPHKXIFJ34iNIchEd
         dzaNpYWv/QYO9U5fQHyEN+BLLc5aUJOkDP4Izweqo8SKgVpfec96H2QgzBwG+6rxpagM
         /DDB1QiU63uFa+t0AnUAshLU0ViHISV/tdgE8T3ZfreGSUDPlpJ1E2qxE/RZ2kOEvTcU
         mOAxB60wwUseVaZ3PR7uOIfsRgYGwvZOUeARCWdVJ7PY4I6DTsswOcoi0vkirVj3jDEv
         av3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741348895; x=1741953695;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p95YJeBeMnMCmGNX6XRZSUU5pl9cPMp9s3eKMC3J3/w=;
        b=dvYR6s+pfuS8CoaUdFiBVY9hvNc6vw6wJpjC+e320nn4ppoFmCvhic2mRcjpwRobjo
         a2FpmbUEBoQtNu2L1CP+j83wY5A+bXT4AZnQAyCbTD4GDet7NZWFxE2b2Z7MK9n8eB83
         RtmT3ZjPSYn9MGpF1hPLOu2un8rwYiKIkuTVZ14YIQvqWEKm4rlrTqaP3v2LPaJrPS/7
         yy6oixR0Y3gFEbGCSHTAAa5dqK0r1OX+JHl8yTSArGk20ABRmUK4J4fOi6eEBDTYRt32
         1WrE/RvkTR8ZziYWMgX8L6MiaQ7OqTZ6rn58712OuoAsIiIrH0a3sbsd4zNsy7NI51XA
         0RDw==
X-Gm-Message-State: AOJu0YxBMEsak+Obfd827PyaQe7KZQ1zvZeboVxDtTshw+awvh3ykTr1
	ZATECQTOJAQcaotkD9DhEi3gRmm1PrjN+NgSz+EBvqft00h/o2ZUYi2zZDdI0Q==
X-Gm-Gg: ASbGncsnDWCxJ3XkwzuVPhJgkd8Nr9aL0U3ECOc+Kop6QzD7ahENBiSqlyIiinzdV5c
	PAu9yeNgSSX9arq6l2XIctOb5UUeMRWztQvCiUxm8lNagxfQN/WyysfpBLR/Hi6SxTJfA5C7Cxr
	OqIeSoDtzP/QKTSfr/9TYU+8x/f1PsAv6fWAQxvIKs5hHyXvRhDfB8gxN4eOl9pQapDkJ7r1MQl
	tc4JRo0a7bZ/h3qaAOmEpiNzVy3rNYedY2B0pMvSpq2zTKSgUXSHnrINB8A0RluAssZV6aXxkdw
	09zuJhlrx7dD4mkaxKeKehQiCVHCSuarcPyuIK+/tM8QmvwCOTA43XFCOE+b/I6+snyX+efcay+
	GMf2Ci3ZJ+EOp7arjLcQIj9XGI2cn2g==
X-Google-Smtp-Source: AGHT+IEppgYU8oDCm+jUYaZT/3e9zeFvX7uSGBL0YpEarIxWnywGK5Qe3JAhO5wHjZO8nyKiHMQpdw==
X-Received: by 2002:a05:600c:4f91:b0:439:a1b8:a246 with SMTP id 5b1f17b1804b1-43c5cb68df2mr20980845e9.8.1741348894765;
        Fri, 07 Mar 2025 04:01:34 -0800 (PST)
Message-ID: <927264c2-0b99-4d60-97f8-31bcd0d64aa6@suse.com>
Date: Fri, 7 Mar 2025 13:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
 <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
 <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
 <295f59af-ebb8-4ad5-bf27-ec0ea5a2c2fe@gmail.com>
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
In-Reply-To: <295f59af-ebb8-4ad5-bf27-ec0ea5a2c2fe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2025 12:50, Oleksii Kurochko wrote:
> On 3/6/25 9:19 PM, Andrew Cooper wrote:
>> On 05/03/2025 7:34 am, Jan Beulich wrote:
>>> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
>>> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
>>> retain a shorthand of that name, if so desired, but I see no reason why
>>> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
>> The concern is legibility and clarity.
>>
>> This:
>>
>>      ((x) ? 32 - __builtin_clz(x) : 0)
>>
>> is a clear expression in a way that this:
>>
>>      ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)
>>
>> is not.  The problem is the extra binary expression, and this:
>>
>>      ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
>>
>> is still clear, because the reader doesn't have to perform a multiply to
>> just to figure out what's going on.
>>
>>
>> It is definitely stupid to have each architecture provide their own
>> BITS_PER_*.  The compiler is in a superior position to provide those
>> details, and it should be in a common location.
>>
>> I don't particularly mind how those constants are derived, but one key
>> thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.
> 
> What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)
> 
> #define BYTES_PER_INT  (1 << INT_BYTEORDER)
> #define BITS_PER_INT  (BYTES_PER_INT << 3)
> 
> #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
> #define BITS_PER_LONG (BYTES_PER_LONG << 3)
> #define BITS_PER_BYTE 8
> 
> Also, it seems like the follwoing could be moved there too:
> 
> #define POINTER_ALIGN  BYTES_PER_LONG

This one is likely fine to move.

> #define BITS_PER_LLONG 64

This one is only fine to move imo when converted to

#define BITS_PER_LONG (BYTES_PER_LLONG << 3)

> #define BITS_PER_BYTE 8

Personally I'd rather leave this per-arch. The others can truly be derived;
this one can't be. If we centralize, imo we should also convert the " << 3"
to " * BITS_PER_BYTE".

Jan

