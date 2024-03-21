Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC8885A3F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 15:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696423.1087347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnJ0P-0002b7-L6; Thu, 21 Mar 2024 14:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696423.1087347; Thu, 21 Mar 2024 14:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnJ0P-0002ZH-Hd; Thu, 21 Mar 2024 14:02:53 +0000
Received: by outflank-mailman (input) for mailman id 696423;
 Thu, 21 Mar 2024 14:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnJ0N-0002Z8-Jr
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 14:02:51 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3fa83d2-e78b-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 15:02:50 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-568a53d2ce0so1376754a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 07:02:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q28-20020a056402249c00b0056baacff45csm2042320eda.69.2024.03.21.07.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 07:02:49 -0700 (PDT)
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
X-Inumbo-ID: b3fa83d2-e78b-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711029770; x=1711634570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qcs5T/9UKcSTJBFSOupU6oSe7Jnfu4QXEixl/YHj7I=;
        b=SqmP3RkNZXIAJBNQOeCeX+9BWGicdePIgDoo3qVA8+Dqp3S3v03YVmam/1mY5QRChJ
         JDK/OSzMpzeYAthv1MTCaTONwXydSOSMY3dIpicTUs8qic9YMFwaBknSjzQbT9Mi7JQu
         XeyER4lMJN+c+CUo0XkzbLHfYnsmK4fb3mrq1wL0KFzWIIGCcbsXU2hTIoYv3QCuKxdn
         kdbtLZ9oxIokvHf2VNmNzijIPVRHGlDpo9AKUBV+ihIw+I6Y6ra1NjV4Lctg9Dt7lgIH
         HuMuFOoaut4QtZ2J/uZgMsggNE76aBkyAG/IWgGuFdcqCokvLsp4nlPPh7KYH57z16Q3
         wMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711029770; x=1711634570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qcs5T/9UKcSTJBFSOupU6oSe7Jnfu4QXEixl/YHj7I=;
        b=g4axyFbQ03J69wanUyv+epWuTE2INNQToK5URfsyIFROyoSDAwgy33fW5syK2M5mRt
         zOARlf2yVMadnCnQvh4+ObYt8cNp0VEXRQ20+MdDp2YmioTldbNOLopSFzhsiI5jfgb7
         Og/jxyAZp8aXZUoAbfVI/z3Q9bEdLH10pvPMhwH+S+CpqsAsPLslrXrTwfZ5Nd7KPGaD
         HpPpP3U2v8E7tQYaheXtFqQOYcMN/7HAcrrDr4Rmm2P7qx6E7wIdmZatK8HW0SwLBf12
         pYRo0EDvWrnTfdH1Lyx1C582hbg2N7gimPadmkBPdJeXVCDASx79sx9aB6MLbGwl8jgw
         NM7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnv3mRxRwD86FzSq5gkYLJNI/ZqyuDV/OJvdXOMqg1sARmAv+L3VkE91oQNXirM3xCIuBUjuVrvW1vVFdHQXGalm527qPK6Byhi1p7zUs=
X-Gm-Message-State: AOJu0YwPDzZZDxnPo65KGOvC6dWg3XYQyh6nJqZjW0BxbF3WixAVj1Kd
	2dwlJUHEnJzfqcZ4wNSO5YbyFdEr7z5Cq6KlDDyWJ1k4u4eSnNT4vfO5W0oHUQ==
X-Google-Smtp-Source: AGHT+IGebYP2ro9M5wdS0aBYF+zCCi+ghkOH/c/mz5l31m6VZxaTAbK6WV8BWazh9uJ248uUHTnNzg==
X-Received: by 2002:a50:d653:0:b0:568:13f5:81eb with SMTP id c19-20020a50d653000000b0056813f581ebmr1558745edj.38.1711029769677;
        Thu, 21 Mar 2024 07:02:49 -0700 (PDT)
Message-ID: <78b52558-b684-4197-899e-9359e44b1a50@suse.com>
Date: Thu, 21 Mar 2024 15:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240319205849.115884-1-jason.andryuk@amd.com>
 <20240319205849.115884-4-jason.andryuk@amd.com>
 <ad5ef9ee-d509-435d-943c-8d7005c823d2@suse.com>
 <183f17a2-cc7b-46c6-81b5-ac1f5daacb7b@amd.com>
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
In-Reply-To: <183f17a2-cc7b-46c6-81b5-ac1f5daacb7b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 14:45, Jason Andryuk wrote:
> On 2024-03-20 10:39, Jan Beulich wrote:
>> On 19.03.2024 21:58, Jason Andryuk wrote:
>>> +/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
>>> +static paddr_t __init find_kernel_memory(
>>> +    const struct domain *d, struct elf_binary *elf,
>>> +    const struct elf_dom_parms *parms)
>>> +{
>>> +    paddr_t kernel_size = elf->dest_size;
>>> +    unsigned int i;
>>> +
>>> +    for ( i = 0; i < d->arch.nr_e820; i++ )
>>> +    {
>>> +        paddr_t start = d->arch.e820[i].addr;
>>> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
>>> +        paddr_t kstart, kend;
>>> +
>>> +        if ( d->arch.e820[i].type != E820_RAM ||
>>> +             d->arch.e820[i].size < kernel_size )
>>> +            continue;
>>> +
>>> +        kstart = ROUNDUP(start, parms->phys_align);
>>> +        kstart = max_t(paddr_t, kstart, parms->phys_min);
>>
>> I'd generally try to avoid max_t(), but I cannot think of any good way
>> of expressing this without using it.
>>
>>> +        kend = kstart + kernel_size;
>>> +
>>> +        if ( kend > parms->phys_max )
>>
>> So despite its default phys_max is exclusive aiui. Otherwise with
>> kend being exclusive too, this would look to be off by one.
> 
> Yes, I'll fix the off-by-one.  Hmmm, phys_max being 32bit, we want it to 
> be inclusive to represent the maximum range.

I specifically didn't ask for that, as I think it would end up a little
awkward. But I also don't mind you adjusting things to that effect.

>>> +            return 0;
>>> +
>>> +        if ( kend <= end )
>>> +            return kstart;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/* Check the kernel load address, and adjust if necessary and possible. */
>>> +static bool __init check_and_adjust_load_address(
>>> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
>>> +{
>>> +    paddr_t reloc_base;
>>> +
>>> +    if ( check_load_address(d, elf) )
>>> +        return true;
>>> +
>>> +    if ( !parms->phys_reloc )
>>> +    {
>>> +        printk("%pd kernel: Address conflict and not relocatable\n", d);
>>> +        return false;
>>
>> This better wouldn't result in -ENOMEM in the caller. Then again reasons
>> are logged, so the specific error code perhaos doesn't matter that much.
> 
> Failure here is turned into -ENOMEM by pvh_load_kernel().   -ENOMEM is 
> already returned for later failure with find_memory(), so I thought it 
> was acceptable.  Without this code, elf_load_binary() would failed with 
> -1 and that would be returned.  I'll change it to whatever you prefer.

ENOSPC would likely make it easily distinguishable from anything else.

>>> +    }
>>> +
>>> +    reloc_base = find_kernel_memory(d, elf, parms);
>>> +    if ( reloc_base == 0 )
>>
>> With ! used above please be consistent and do so here, too.
> 
> phys_reloc is a bool, and reloc_base is a paddr_t.

Hmm, I see. But still - we generally prefer ! over "== 0" (or even "== NULL").

>>> +    {
>>> +        printk("%pd kernel: Failed find a load address\n", d);
>>> +        return false;
>>> +    }
>>> +
>>> +    if ( opt_dom0_verbose )
>>> +        printk("%pd kernel: Moving [%p, %p] -> [%"PRIpaddr", %"PRIpaddr"]\n", d,
>>> +               elf->dest_base, elf->dest_base + elf->dest_size - 1,
>>> +               reloc_base, reloc_base + elf->dest_size - 1);
>>> +
>>> +    parms->phys_entry = reloc_base +
>>> +                            (parms->phys_entry - (paddr_t)elf->dest_base);
>>> +    elf->dest_base = (char *)reloc_base;
>>
>> Just as a remark, no request to change anything: We're not dealing with
>> strings here. Hence char * isn't quite right, just that "dest_base" is
>> of that type (for whatever reason).
> 
> I think the reason is just to be byte addressable.

Sure, but that would call for void *, unsigned char *, or uint8_t *.

Jan

