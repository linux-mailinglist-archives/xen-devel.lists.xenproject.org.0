Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD59B7CD7
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 15:29:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828760.1243772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WAN-0007SK-V3; Thu, 31 Oct 2024 14:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828760.1243772; Thu, 31 Oct 2024 14:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WAN-0007PA-SB; Thu, 31 Oct 2024 14:28:51 +0000
Received: by outflank-mailman (input) for mailman id 828760;
 Thu, 31 Oct 2024 14:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6WAM-0007P0-FW
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 14:28:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 701fbadf-9794-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 15:28:46 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so8921125e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 07:28:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7449sm2255349f8f.49.2024.10.31.07.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 07:28:44 -0700 (PDT)
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
X-Inumbo-ID: 701fbadf-9794-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcwMWZiYWRmLTk3OTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzg0OTI2LjYwNTI4MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730384926; x=1730989726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7HhDJdsRUZ7MkrObfIta2eHYhMvisiT4vdzG/csGb0Q=;
        b=WQcMpD1Sifxm1fuqkzPOydFFCRZ9iAv706xoGHBGcAqvEEOwfVmJw/O5O25zE4htP0
         VNiQBZDfiF3FDTboVxsApbKJKvYKGFgCZOfOL8HOqrwg9VA0j/bqYO7BxWS+dexjgCcm
         IuxS+q/5HmRrzpz9Z4C4PHZpykXO3huxD+caSQGKdj8NCw2z/OBipY6vUfLkHdwVge5q
         9f8GODpCC2y1e1zR8GiL4t4BCKZw/GnUo5BiLs1OqljjIrWwRcWMqqp2OUozI/W3k8RR
         Ab+w3sPKAS2/NX2eUUUQwxazrjAnr3Nq9actJ92HWqwXaHFGbr5A313YROjmgZ6Jd3/l
         2xTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730384926; x=1730989726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HhDJdsRUZ7MkrObfIta2eHYhMvisiT4vdzG/csGb0Q=;
        b=gJMTLj9trGsdYyZ1/fIX70aM3SHG/j2/ytEnxbiB2qum/2mnU4t8H31me/2eR1xs+j
         MSE7jJRwIcegK6bsfNHvdY3v15HdHduqym3zLvrd+TegAZdaEoFno786U7QCxPoLIQ2Q
         SGgoQZW4fUcp+fTR5VuBXevRcqO401h9XZt44MwrJQDfGo9fhQDrJzixfPmQlJ68WDTL
         hC2f5cBZLieYuCyXx2t2In5tlHQFP9yt3tNtpfLt7Ipjfw5rtdp3Y62y3j2PihB3Xbus
         kuZtIHIJMUBI+tFqZB8Z0hRjYcfumvL0FZkycxK6grXPQxHMCoKBQ8Jz/WjKJVZ4IMDG
         Y4AA==
X-Forwarded-Encrypted: i=1; AJvYcCXfW9jov+o1Zk0nS1MWuRgvH+ZgrITeRkP33o0LSPhurKVbgEzlIRADJnwzdYL36xzB00oweU80ySw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcCEqrbxIjtioRHAXIaQqIW05izCf/Zva4Dm8JREoaZUoYrJlq
	4iIfNPAfGpMzbCO0W/uaPiHOSj/IaNm0R2ENTAuDXDxYKgUDN9jAku98jQPaiA==
X-Google-Smtp-Source: AGHT+IG22g8mwwtOWhVSZHdSzdfhXylDaoZlO4VJsrAj1/kqYxU6tcFWWxx/ozDoZtsbZm5mv3o5RQ==
X-Received: by 2002:a5d:47ab:0:b0:381:b1b4:8ba1 with SMTP id ffacd0b85a97d-381bea1c104mr2843239f8f.39.1730384924415;
        Thu, 31 Oct 2024 07:28:44 -0700 (PDT)
Message-ID: <4fc6dd84-a0cd-4369-9e58-2871bbe1088c@suse.com>
Date: Thu, 31 Oct 2024 15:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_mm()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729697111.git.oleksii.kurochko@gmail.com>
 <28240dcfc04a11237db553c4e0ecb372aa0fe9ac.1729697111.git.oleksii.kurochko@gmail.com>
 <8ec6463e-40a8-4d60-b4c2-ea964a06c572@suse.com>
 <76fc4999eded2ce74fe73bc81998e92147cf802a.camel@gmail.com>
 <e067e169-3e63-4d01-963f-9dde3bb8e3b7@suse.com>
 <878409fe69f7af07120f53ec7d2a58bf348b179c.camel@gmail.com>
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
In-Reply-To: <878409fe69f7af07120f53ec7d2a58bf348b179c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2024 14:19, oleksii.kurochko@gmail.com wrote:
>>>>> +void __init setup_mm(void)
>>>>> +{
>>>>> +    const struct membanks *banks = bootinfo_get_mem();
>>>>> +    paddr_t ram_start = INVALID_PADDR;
>>>>> +    paddr_t ram_end = 0;
>>>>> +    paddr_t ram_size = 0;
>>>>> +    unsigned int i;
>>>>> +
>>>>> +    /*
>>>>> +     * We need some memory to allocate the page-tables used
>>>>> for
>>>>> the directmap
>>>>> +     * mappings. But some regions may contain memory already
>>>>> allocated
>>>>> +     * for other uses (e.g. modules, reserved-memory...).
>>>>> +     *
>>>>> +     * For simplicity, add all the free regions in the boot
>>>>> allocator.
>>>>> +     */
>>>>> +    populate_boot_allocator();
>>>>> +
>>>>> +    total_pages = 0;
>>>>> +
>>>>> +    for ( i = 0; i < banks->nr_banks; i++ )
>>>>> +    {
>>>>> +        const struct membank *bank = &banks->bank[i];
>>>>> +        paddr_t bank_end = bank->start + bank->size;
>>>>> +
>>>>> +        ram_size += ROUNDDOWN(bank->size, PAGE_SIZE);
>>>>
>>>> As before - if a bank doesn't cover full pages, this may give the
>>>> impression
>>>> of there being more "total pages" than there are.
>>> Since it rounds down to PAGE_SIZE, if ram_start is 2K and the total
>>> size of a bank is 11K, ram_size will end up being 8K, so the "total
>>> pages" will cover less RAM than the actual size of the RAM bank.
>>
>> ram_start at 2k but bank size being 13k would yield 2 usable pages
>> (first partial page of 2k unusable and last partial page of 3k
>> unusable), yet ram_size of 12k (3 pages). You need to consider the
>> common case; checking things work for a randomly chosen example isn't
>> enough.
> Then I have to check separately the start and end of bank and check if
> ram_size should be reduced in case if the start or end isn't properly
> aligned.

All I think you need to do is align bank start up to a page boundary and
align bank end down to a page boundary.

Jan

