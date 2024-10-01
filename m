Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE48498C1F3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808312.1220218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svf51-0001jL-GJ; Tue, 01 Oct 2024 15:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808312.1220218; Tue, 01 Oct 2024 15:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svf51-0001gb-Dc; Tue, 01 Oct 2024 15:46:27 +0000
Received: by outflank-mailman (input) for mailman id 808312;
 Tue, 01 Oct 2024 15:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svf4z-0001gT-Hz
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:46:25 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f97237c-800c-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 17:46:23 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c87c7d6ad4so5833167a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:46:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8831c9055sm6231060a12.31.2024.10.01.08.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:46:22 -0700 (PDT)
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
X-Inumbo-ID: 4f97237c-800c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727797583; x=1728402383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pt4WxeG269rjnvpGpYIsW0dDJqXjk2pp6L+bUkiEgBs=;
        b=CZfM1IR4EcF2bB5/NRxXGkr94iE0zmlv+PXcWl+hlLnpmNxmI3xFk5NbarWEYP2g/a
         /qNu8UJ4zrKjUy6k/wVhXhHQBvb/MYc37ELXdJkq7GlzlMRR7nnQxUPyFA2FFQcyPlO+
         U8Niz9CFLgbzYKW5aYAKNLPgZu+iTCOECSgLGY+i3m+zykIwrdfTvZjmXr6EdwHHkIFq
         AJVk0VRDr5SQFhHaoAUWCJ7R0j+wSXvO116uWHIgcMDsD71il0dJ1im0XeMJXUiHqSgZ
         BlpvA4xxJ/OJYy20lfYUCzETv3rZ7Ew4zW4g4Own5l97XPzNRyVG4EWtWajFEqrd6QeN
         qTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727797583; x=1728402383;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pt4WxeG269rjnvpGpYIsW0dDJqXjk2pp6L+bUkiEgBs=;
        b=P1V20PJR0/yUc3szypRq8z9c8TeazQpsAdyMyFxjY7Jc5MwO1AAUi7A4W4ZVKK1WJa
         4WhjD1crW54aDeoVaqIGkx8y3ARfxPEj63EuAQRvun3kJO1NrPjOaJt7DOsvDYks9DfP
         /PZ5thsX4a/oa2RXk9FB5//BCvvQSftCpG/vQVpWVQPtgelkLtyT0xuLEfmfgxV9rjtr
         4+gms8H0iVjMxqeuyr1ePwzcD05fNFEG7kxEGpSY9NHip6Ql71uYOTvK8NGGGwU/z8gM
         y6rh5mQQCWLAwRPl5ZpIpXx9/fom6W4FX8PCbn8tbP6tGWpEgSz6CEgQmoR1XVFCSaae
         tsXg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+ZLAKazR4IfZo1CREEr0YoXiJj9wKc/mneuXcGc5pPFPsRe6VCgAKFKu6jTDzxfDHVrIDbQnhK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXRDXl8QuQXtEGXulD9R6krXYf6KvZxKFO03q79aHM9oJ8P252
	qqEYJ1f1fBtgG+z0LCfuO6mU677qu0vEon8AvTxFNcqecrIwvTQNOVM+ho2NZw==
X-Google-Smtp-Source: AGHT+IF/qjxCsLRSFPJlDjrF8qxfmVNh1sz8Z6idB2Y4OgyvQrnv9O8ZlY52erpNvuYFecBTAkYxtg==
X-Received: by 2002:a05:6402:1947:b0:5bf:50:266b with SMTP id 4fb4d7f45d1cf-5c8824e7f04mr14748391a12.19.1727797583016;
        Tue, 01 Oct 2024 08:46:23 -0700 (PDT)
Message-ID: <e210faa2-ffb3-4572-afc6-62fd622fba68@suse.com>
Date: Tue, 1 Oct 2024 17:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: implement virt_to_maddr()
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
 <1d4270af6469af2f95ede34abd8e9f98f775c1f1.1727708665.git.oleksii.kurochko@gmail.com>
 <61347488-6b4b-442d-9058-cafd65b0834d@suse.com>
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
In-Reply-To: <61347488-6b4b-442d-9058-cafd65b0834d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 17:41, Jan Beulich wrote:
> On 30.09.2024 17:08, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/mm.h
>> +++ b/xen/arch/riscv/include/asm/mm.h
>> @@ -28,7 +28,20 @@ static inline void *maddr_to_virt(paddr_t ma)
>>      return NULL;
>>  }
>>  
>> -#define virt_to_maddr(va) ({ BUG_ON("unimplemented"); 0; })
>> +static inline unsigned long virt_to_maddr(unsigned long va)
>> +{
>> +    ASSERT(va >= (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE));
>> +    if ((va >= DIRECTMAP_VIRT_START) &&
>> +        (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
>> +        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
> 
> While the cover letter states a dependency on another series, I'm unable
> to spot directmapoff_to_maddr() in the tree or in that other series.
> 
>> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>> +    ASSERT(((long)va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>> +           ((long)XEN_VIRT_START >> (PAGETABLE_ORDER + PAGE_SHIFT)));
> 
> What's the point of the casts here? va is unsigned long and XEN_VIRT_START
> is a literal number (which probably ought to have a UL suffix).
> 
>> +    return phys_offset + va;
> 
> Don't you need to subtract XEN_VIRT_START here?

Oh, that subtraction is part of the calculation of phys_offset. The variable's
name then doesn't really reflect its purpose, imo.

Jan

