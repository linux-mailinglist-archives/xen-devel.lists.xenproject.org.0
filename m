Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3C1B0C55F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 15:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051531.1419874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqk6-0000sV-AK; Mon, 21 Jul 2025 13:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051531.1419874; Mon, 21 Jul 2025 13:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqk6-0000pd-6x; Mon, 21 Jul 2025 13:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1051531;
 Mon, 21 Jul 2025 13:39:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udqk5-0000pX-7m
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 13:39:45 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26a9bfc7-6638-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 15:39:40 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso32837535e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 06:39:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ffbce6esm5300842a12.72.2025.07.21.06.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 06:39:39 -0700 (PDT)
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
X-Inumbo-ID: 26a9bfc7-6638-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753105180; x=1753709980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zvMBi8HMgzxmlWlnUNpYIMOIBXNVFgwLSillMGu0Nn0=;
        b=Gr2p33AOZ96aLBLO4B8enRBOF7ray88SfIFVEkSdXF/6Gzv+lH7qEacYfJ2/OhTRWh
         gXvnrmFDM9FWGLAegfu3AY5k70qRd/8CntofR1LUJd4/oce324Ef1u2dfTqoeHcPhBAK
         oBXPOCSLc+eg+40x/8GyrkECqJwPmdIVTgC+u7R7RowLRnvHuy2gEuwsrLoAgbgKbQa9
         Dt5FgbI/A2HfzivaOc6THs40w66/jgsNgH8duT/SK2eRUeRwQf/SafPIvx/yMbScQOUV
         9sJn/gBYu+OlCxGeIxfgPTI5Me7EZTWX0faZUNdR/lZYj5PEDgfMPFv3gRf+ubIxXwnH
         xOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105180; x=1753709980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvMBi8HMgzxmlWlnUNpYIMOIBXNVFgwLSillMGu0Nn0=;
        b=mV848TKE//BPA3lgfm5ar+BTrx39iAflaO0RCOBDmgBJWIOqiHzaGBtZPdlUAx7gCZ
         j7q3JA90gkOk5suEV/lKcSZoUvInsPprvOfOFVLZdQjUWnTue8xAOs5VQ3p5tL2WsFcI
         7Tyhl9q3Iu86rmx+3HE6KyKNUAAsxzvoBMzPIm/oLZdZNAovJshYhLn9qWNXxvy6HAIv
         +pIL0NJSqzshjNdHQgUeZxyNeaUIyV/GJfy9p0gTxTbgvXOaammty/dGZuvQ2tjidqAS
         +KdyzlqK8uheOfZ2d89u8axRGRz4cnBZV8QEPJjjmgI38NWynY95L6+OFmKhKG3EQ/KM
         ZiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWztF/rbBcq5SUXwrmLzeNGG4MY6Sl79TiroPZK/7+D4umtga7AHRM0VMUPeUjbljCPDCAJq3itXu8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXOwUm6ihvX/4F4DHw1id5bcNwvzn8g2YxPp4VhKJZOgeYNXzX
	xkqIdcIJvFR/LUE6MQZ76FOC2HSzS6bht3x3FmXwE7PCWMTxXzZKgd09OCqGLjhvvg==
X-Gm-Gg: ASbGncubYKruqVUSgrS3yAs5I1e4OYeGTDMlHvx7zSrA4cLUBjbNoUs1QTRxKwLUb0x
	OVfvGgA1kY8OQ2wq3IuaMEVuTgFR17KwpEtzvKqrGiqxlUThoyL4PtRbHEC6kR0fqNUh9ZcG9J/
	o2T15V8aQwH/bqWyMvu9Jet4KQQRzszMuWn04Rz+8oY+5LfGEwfaWrydQcGHqamQrSRe4+UDPgv
	Xus94ak1+EeFrehkIxKlHzY4NmHi/ugWAu4i0MUtgFexmtYxXCWGH8RCC7m+lx2V0YrPtP6yR3o
	HsWjmGl7d/rBWIyyHagTCAa3T15HQokNtGKNpKzPkV+jjqH5BZBGGZr5GmQl+Tf4uerZetMO4f5
	MyWJyUrx9mWxbbfET4eMkXgr7g6nGS+VrlsfbyJUMvv0W7gKWZiYmy6sJXufz82vo3n5WEmFnCZ
	wL1Aa2FhA=
X-Google-Smtp-Source: AGHT+IGq0etJ/me6tfvpKjJKnzXWJD2/rXres01NzehoVvVoERmqBE2l+ibnSlRjKPNqM7ec/+Uhsw==
X-Received: by 2002:adf:b64b:0:b0:3a5:3062:793a with SMTP id ffacd0b85a97d-3b60dd72f31mr14604051f8f.33.1753105179653;
        Mon, 21 Jul 2025 06:39:39 -0700 (PDT)
Message-ID: <b669f089-f0a1-4d46-a508-d8be8ea28975@suse.com>
Date: Mon, 21 Jul 2025 15:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
 <831c7c26-51e1-4834-b08e-03607cd438aa@suse.com>
 <9dfc64b3-7dda-4620-9da6-388cecc3b9ad@gmail.com>
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
In-Reply-To: <9dfc64b3-7dda-4620-9da6-388cecc3b9ad@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 16:37, Oleksii Kurochko wrote:
> 
> On 7/2/25 12:28 PM, Jan Beulich wrote:
>> On 02.07.2025 12:09, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>>>>   {
>>>>       return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>>>   }
>>>> +
>>>> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>>>> +{
>>>> +    ASSERT_UNREACHABLE();
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
>>>> +                                                      unsigned long nr)
>>>> +{
>>>> +    unsigned long x, y = page->count_info;
>>>> +    struct domain *owner;
>>>> +
>>>> +    /* Restrict nr to avoid "double" overflow */
>>>> +    if ( nr >= PGC_count_mask )
>>>> +    {
>>>> +        ASSERT_UNREACHABLE();
>>>> +        return NULL;
>>>> +    }
>>> I question the validity of this, already in the Arm original: I can't spot
>>> how the caller guarantees to stay below that limit. Without such an
>>> (attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
>>> is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
>>> any limit check.
>>>
>>>> +    do {
>>>> +        x = y;
>>>> +        /*
>>>> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
>>>> +         * Count == -1: Reference count would wrap, which is invalid.
>>>> +         */
>>> May I once again ask that you look carefully at comments (as much as at code)
>>> you copy. Clearly this comment wasn't properly updated when the bumping by 1
>>> was changed to bumping by nr.
>>>
>>>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>>>> +            return NULL;
>>>> +    }
>>>> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>>>> +
>>>> +    owner = page_get_owner(page);
>>>> +    ASSERT(owner);
>>>> +
>>>> +    return owner;
>>>> +}
>> There also looks to be a dead code concern here (towards the "nr" parameters
>> here and elsewhere, when STATIC_SHM=n). Just that apparently we decided to
>> leave out Misra rule 2.2 entirely.
> 
> I think that I didn't get what is an issue when STATIC_SHM=n, functions is still
> going to be called through page_get_owner_and_reference(), at least, in page_alloc.c .

Yes, but will "nr" ever be anything other than 1 then? IOW omitting the parameter
would be fine. And that's what "dead code" is about.

Jan

