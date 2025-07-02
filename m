Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC51AF11E3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030892.1404570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWui6-00056p-2d; Wed, 02 Jul 2025 10:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030892.1404570; Wed, 02 Jul 2025 10:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWui5-00054U-W4; Wed, 02 Jul 2025 10:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1030892;
 Wed, 02 Jul 2025 10:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWui5-00054J-5A
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:29:01 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d723b4d-572f-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 12:28:59 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so39713785e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 03:28:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541e66fsm15071286b3a.69.2025.07.02.03.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 03:28:58 -0700 (PDT)
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
X-Inumbo-ID: 5d723b4d-572f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751452139; x=1752056939; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ASOzYddiRONhrQFF4e/lAK8pENt3ZRiu6arwrIHpIxU=;
        b=GUjoC9CoZhFDSI2tctsYUMdGhT8vJiSukCYs3HCZFDop8O0cB/r1Z/qD+TfEbOJZXW
         E00npOi9yKVBCa4eLQLvZ41h8Dpb6acrFIa3/8H1btx2huiLSC53xVGTyzkeTgWa5HeH
         csJFOpL2CWbp7Gh3qo5kYo3MZ76E23n8EaXm/0DxqMvp7BYHy7X7ghYXtCDJ6FqGjF3y
         QnnVlFOAxnvo0gtWO4zMCSDhUDy6qmC1DYKa1/gpTeR/bgozjvfTUXUMoGYq6+oFq57N
         j6MNMIB7y8S3dWztVETjDkhLrcWV8EF2qim2b3qOzNy2U9gWtXlDEHlTF6+2hXhC+EgY
         GnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452139; x=1752056939;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASOzYddiRONhrQFF4e/lAK8pENt3ZRiu6arwrIHpIxU=;
        b=AKt4SHtY9RCFmKycLMGv5u6HO1E1Re5iGFcbtYh9YR8LmM0x7qfTbyiyhhNHAkpwQN
         ZB9b86/cHziNttD2MeH1SiNN1DzzzLm+0ztOYH5Q2ExMwus87lBm6xkNazZvuviIk7vj
         uiFTIOefvzP01kcZkZ2njhxp5GdBgYeG4nLSOHqi63RQqNP94ZtGERfHgn8uQI7xQUZZ
         bb/kCKidZMdrcsM91e0YBpCy+pyHvURE/eB3H675MXY6YiVmucdnsm+b8n8bw2IDguwe
         v7XF/TF01to1DlnL3j/NXDnoyS+OP/ZE9HeV8ZixQpUVW5fcbWWFaJ77LcbQK+CglnGg
         0FSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrg001jQs/dtYDkHEj09ZgyEQYjGauV+i58xipS6b/P83/6elAY7cAHnfqzMj9uCrqm/qYkIKr7+o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8I1u/efKOs3APaJxnq9rh36NtW5w+opTEBEmJ2lckg5P5sA/0
	JcNjAi1r/+7Ea0S019o8DLntzuL3nF3+Fb4liWaLKoPnHFL3dn03JN4ZEXJlplyF2A==
X-Gm-Gg: ASbGncu+r/BLMGIbTkn6iERbYROrzzT8TEW6rTTCJQ3bE8vJNkBChzub7xUd1jvfKRt
	6EgH1uKMMBFcQ6/lwhqrj0TB4uMltJSdmTkuSSO1OtZqLw27jrRo6KiWTf3jEqrLQq0Q8kJsazu
	9I6ATXjE16eu47HtQV2nJ7Dn8J9ZaBKueBUVdfLeI6resvjt5DPefXPQYMmE492r1Rw5xhZtrxV
	/pRDnUJE/UI3qWTcCXH2hMmzbxX4u26clTBF2v2R0ukwIFlK5/JNDK4CwXSBWUzzV+7XbW2D193
	7S5/jbBCi5OZelivU4qsbXSk/MYgfA3YNdJ4+76miIF3zd6uCwS+YwpITr8Nb233VHw5+E1k3F/
	49a/IJVFch6gBXvpyMmKgz/r2ZonmMdYHjwKoQtUd+zFdwtc=
X-Google-Smtp-Source: AGHT+IHbG8VLZXtzxUwV6U9HiVzMctG+WGWxOiCXBlfDKa7uHRxRpTHOdyamwEJX6TbHDcJ6EgE4Bg==
X-Received: by 2002:a5d:5f81:0:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3b20095cf64mr1733733f8f.51.1751452138616;
        Wed, 02 Jul 2025 03:28:58 -0700 (PDT)
Message-ID: <831c7c26-51e1-4834-b08e-03607cd438aa@suse.com>
Date: Wed, 2 Jul 2025 12:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
From: Jan Beulich <jbeulich@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
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
In-Reply-To: <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 12:09, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>>  {
>>      return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>  }
>> +
>> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +
>> +    return 0;
>> +}
>> +
>> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
>> +                                                      unsigned long nr)
>> +{
>> +    unsigned long x, y = page->count_info;
>> +    struct domain *owner;
>> +
>> +    /* Restrict nr to avoid "double" overflow */
>> +    if ( nr >= PGC_count_mask )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        return NULL;
>> +    }
> 
> I question the validity of this, already in the Arm original: I can't spot
> how the caller guarantees to stay below that limit. Without such an
> (attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
> is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
> any limit check.
> 
>> +    do {
>> +        x = y;
>> +        /*
>> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
>> +         * Count == -1: Reference count would wrap, which is invalid.
>> +         */
> 
> May I once again ask that you look carefully at comments (as much as at code)
> you copy. Clearly this comment wasn't properly updated when the bumping by 1
> was changed to bumping by nr.
> 
>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>> +            return NULL;
>> +    }
>> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>> +
>> +    owner = page_get_owner(page);
>> +    ASSERT(owner);
>> +
>> +    return owner;
>> +}

There also looks to be a dead code concern here (towards the "nr" parameters
here and elsewhere, when STATIC_SHM=n). Just that apparently we decided to
leave out Misra rule 2.2 entirely.

Jan

