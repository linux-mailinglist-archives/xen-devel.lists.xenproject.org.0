Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94DB960B03
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 14:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783954.1193289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siveT-00071P-VU; Tue, 27 Aug 2024 12:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783954.1193289; Tue, 27 Aug 2024 12:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siveT-0006ye-Sp; Tue, 27 Aug 2024 12:50:25 +0000
Received: by outflank-mailman (input) for mailman id 783954;
 Tue, 27 Aug 2024 12:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siveS-0006yY-Nb
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 12:50:24 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec5f79ea-6472-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 14:50:22 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so527838966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 05:50:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e548620asm107721966b.8.2024.08.27.05.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 05:50:21 -0700 (PDT)
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
X-Inumbo-ID: ec5f79ea-6472-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724763022; x=1725367822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2I9sb0rWyJjhiIrLbYmJiWJD2a3sWd93WXXkQtRBqDA=;
        b=B9mX8ZG1bmVHwsg8EFJ/mJT4DZNVBydvfjfMpFw6uWUvR6TPhWDbl7XengzK/As1ji
         alwqHQTIzQOL8eRtGmdid/+keLCl0HZObhwVzOX8wHecmPdgocuPBFJMwE7+hVfzpG1I
         vZw9TqA/onP03bvIhJp1NIXjLWefxsp42vo2GkPOM+ZDND6IBqkLyLWKQg/+I1W6Y3Ej
         ZHpZxr38ba/DZ7YqpZYmqIin/v1JAdaBaX6P+Z5cSMt+DdOwq5MO3etg69WmPqLu4W+/
         qnrCQ2V60ENnxShiGMLnkVOWJfVMpsXRfDQo90iNteXoKuyEYBJe+UOTfnG9imWRijrE
         FSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763022; x=1725367822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I9sb0rWyJjhiIrLbYmJiWJD2a3sWd93WXXkQtRBqDA=;
        b=aLJUY/8LNxAH+MkQh47AJZbeZQbSRZeyqCdI8yWvYox6ZKwDZyN3GbMC5LR2nAr13V
         2znYzPsEKRa/V7N61IFQZ5Qam7TznnLlgfij2kHJ+fMBiZqi/FRPDwABjIz/NHa+S2s2
         sF6Epz8Jqq7pa/udbj5l1Bet7b4I72mv22EEEegPTim1TpGolFZZKleooelP5UXhhVWB
         cOpGNBJgrbS4U551DS6W+aZmmwqqy0+joVNuQgXfQAUIseXthpQtQ3+dX/TPcR/lnU2q
         ZtvmDi+ZhLW3EA8thWUz60ao9jP8mvvLz0Ycyid+j/zyzbJdPs9k1j/BCuDI0tjG5LBH
         7VwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbv7DOfvd8YA0tvbTxK1qo4srvhD/alQOcqfMUUKv42lL2L5+vkTDeYO32jElKJoAd4vv48nSziAU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsMK9ohlNH38DeI+kCWGSlcl946hjgYFhhT2XJZLzxsQzsGzJb
	naKazwXg9gyJ1JsvttVMSk+14+bbsGCtkBd27ZNc+un+5tAkeNV0Hh0gFVJEQQ==
X-Google-Smtp-Source: AGHT+IFc9+ZBM+KJFWYygc+PxUFmZcQk3XJRFYZhmFEDgOOymzP57rPhWip4FrlRfr2C+lOmNe7Jaw==
X-Received: by 2002:a17:907:6d07:b0:a86:7514:e646 with SMTP id a640c23a62f3a-a86a54d1473mr944738066b.42.1724763022117;
        Tue, 27 Aug 2024 05:50:22 -0700 (PDT)
Message-ID: <5521cd0f-6baf-4929-a2bd-9ebe67c99268@suse.com>
Date: Tue, 27 Aug 2024 14:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] xen/bitops: Introduce a multiple_bits_set() helper
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-3-andrew.cooper3@citrix.com>
 <841e2cde-6fc2-49d9-b947-534bd53bc00e@suse.com>
 <239165e3-6f96-452f-9c81-05f29012269f@citrix.com>
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
In-Reply-To: <239165e3-6f96-452f-9c81-05f29012269f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 14:01, Andrew Cooper wrote:
> On 26/08/2024 11:30 am, Jan Beulich wrote:
>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>> --- a/xen/common/bitops.c
>>> +++ b/xen/common/bitops.c
>>> @@ -84,8 +84,32 @@ static void __init test_fls(void)
>>>      CHECK(fls64, 0x8000000000000001ULL, 64);
>>>  }
>>>  
>>> +static void __init test_multiple_bits_set(void)
>>> +{
>>> +    /*
>>> +     * multiple_bits_set() is generic on the type of it's parameter, as the
>>> +     * internal expression is so simple.
>>> +     */
>>> +
>>> +    CHECK(multiple_bits_set, 0, false);
>>> +    CHECK(multiple_bits_set, 1, false);
>>> +    CHECK(multiple_bits_set, 2, false);
>>> +    CHECK(multiple_bits_set, 3, true);
>>> +
>>> +    CHECK(multiple_bits_set, 1 | (1UL << (BITS_PER_LONG - 1)), true);
>> This is really the same as ...
>>
>>> +#if BITS_PER_LONG > 32
>>> +    CHECK(multiple_bits_set, 1 | (1UL << 32), true);
>>> +    CHECK(multiple_bits_set, 1 | (1UL << 63), true);
>> ... this, at least as long as BITS_PER_LONG > 32 in practice means
>> BITS_PER_LONG == 64. Perhaps not really worth keeping that line?
> 
> I suppose not.  I'll drop it.
> 
> However, It occurs to me that I do need a test of 0x8000000000000001ULL
> mostly for 32bit builds to check that even when the argument is split,
> the answer is still accurate.

IOW you'll insert an #else in the middle. Fine with me; keep the R-b.

Jan

