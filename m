Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7C198B7AD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807854.1219559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYg7-0001QR-V5; Tue, 01 Oct 2024 08:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807854.1219559; Tue, 01 Oct 2024 08:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYg7-0001Nn-ST; Tue, 01 Oct 2024 08:56:19 +0000
Received: by outflank-mailman (input) for mailman id 807854;
 Tue, 01 Oct 2024 08:56:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svYg6-0001NX-QC
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:56:18 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0595ce4e-7fd3-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 10:56:18 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so672954266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:56:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2946bddsm666771266b.123.2024.10.01.01.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 01:56:17 -0700 (PDT)
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
X-Inumbo-ID: 0595ce4e-7fd3-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727772977; x=1728377777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GwsTVlUE+WfxHpR9ah13NBsnzeAKuqVnUxQdij3tlUk=;
        b=d3neXUEe4lGwtdZJ5Pa9dn7u3bzOVkNDWk5ZnZPqYgwVm4OKm3OEoJebPdwTusEYlC
         6E6hMKZVaT/Yj1LRDPdFPvH2fMwlR7DG0hOKL3ZlDkqPQlk8uB2/lJ1AeMzS8Hmf7P+y
         sgVX8uaBmOAa+XkA3hKgeXVV1CfIWVIsKl+SuC7RwppORbts1Y7pieYurDdUS64zJQOd
         sxSZ+3slAurzj0NRJJmUEvY8kakis9R1BvTUY5G71sOs5X+2DlAP5LiuGjKDPCny9KkX
         6U0XPK40QuI2mAynr07z1m5+/l6ASjLaD1rpvPcH6SBuykZBxK1IqS/utJjX/8ZBtBdN
         GuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772977; x=1728377777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwsTVlUE+WfxHpR9ah13NBsnzeAKuqVnUxQdij3tlUk=;
        b=lfaFSELK0qEHoqh5/J+i6mY6/vOWQtuE2aQj9XXby9ysPSy4wxTu2OPoyYWoU5NoaW
         Gz5D0C6V7JzQuxLT0yGkYn3EJ6rVvEOFrhuck52rKR9OjGhQS2kvBUNnDvhFHCHWEdJY
         VaSBVNGuftlii3N1Gzy6ZsG9YCpMg/TI0ppbhS10HZPtoAUqoZKJN7wQ9fwZR10ocT8k
         e4ScxefFHSgZURCvy1FPCErgXg7h+V8Ziz/WajSgbS4XsY3/Gcrmo1gmSFJdAeNmsxx+
         EMzroQURY84wAeFLOkQTMMeD0h5uy9UwqXN+DiUePvVZUr79akf6/OVhrJnb+1EJGO3V
         LO9w==
X-Forwarded-Encrypted: i=1; AJvYcCUSJxSeKxjWNPyEMMcL1teGK3vXzMxTblqvQv58LbES/yR9O6yW2vIWfiieOsCt4fCN5QsYRweFo1I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwY3r+FHSMPSoUI24xWI2c+T/qHT5iZ3mDzdwZjgp75CpZ5UeOG
	BWhcwF+qZCXkiUrMINyW8hhqGDyyYlzHleIuE7PQX5qLkNRFoZtCCVv9mXxiaGMcZN7ZwR/yVfY
	=
X-Google-Smtp-Source: AGHT+IFiL2jTMxYrsdRgTjUW2kw9ONVv/pD4tP0Tr/z2o/g5b1TUqYe1+mCZNcQA/aEs+lNoFwYf0Q==
X-Received: by 2002:a17:907:d14:b0:a8a:83e9:43e2 with SMTP id a640c23a62f3a-a93c48f926amr1330412266b.12.1727772977561;
        Tue, 01 Oct 2024 01:56:17 -0700 (PDT)
Message-ID: <ad7f22ad-0373-45d7-943e-816d385e6750@suse.com>
Date: Tue, 1 Oct 2024 10:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] x86/boot: Improve MBI2 structure check
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
 <20240926092109.475271-4-frediano.ziglio@cloud.com>
 <b68528a0-0e0b-4b8c-bd9d-b7d845905711@suse.com>
 <CACHz=ZjwTJRwaSXf5GB5WPByxHy0unjZw0ysUNWFEkpm3VAwKg@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjwTJRwaSXf5GB5WPByxHy0unjZw0ysUNWFEkpm3VAwKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.10.2024 10:41, Frediano Ziglio wrote:
> On Mon, Sep 30, 2024 at 4:55 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 26.09.2024 11:21, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/efi/parse-mbi2.c
>>> +++ b/xen/arch/x86/efi/parse-mbi2.c
>>> @@ -13,6 +13,7 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
>>>      EFI_HANDLE ImageHandle = NULL;
>>>      EFI_SYSTEM_TABLE *SystemTable = NULL;
>>>      const char *cmdline = NULL;
>>> +    const void *const mbi_end = (const void *)mbi + mbi->total_size;
>>>      bool have_bs = false;
>>>
>>>      if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
>>> @@ -21,7 +22,9 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
>>>      /* Skip Multiboot2 information fixed part. */
>>>      tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
>>>
>>> -    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size &&
>>> +    for ( ; (const void *)(tag + 1) <= mbi_end &&
>>
>> It may be possible to argue away overflow concerns here. I'm not so sure though
>> for the case ...
> 
> Do you mean tag + 1 ?

Yes.

> For the same reason, computing tag above could have an overflow.
> If the caller pass invalid data range, we will have overflows in either case.

Indeed. Yet as said, for these "+ 1" it may be okay to keep them like
that; the check below is certainly more risky.

>>> +            tag->size >= sizeof(*tag) &&
>>> +            (const void *)tag + tag->size <= mbi_end &&
>>
>> ... here. The earlier logic subtracting pointers wasn't susceptible to such.
> 
> Can you suggest a change ?

Keep comparing (pointer differences) against mbi->total_size.

Jan

