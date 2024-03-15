Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D005687CADA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 10:48:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693722.1082149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl4Ac-0003eI-Ie; Fri, 15 Mar 2024 09:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693722.1082149; Fri, 15 Mar 2024 09:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl4Ac-0003bl-Fw; Fri, 15 Mar 2024 09:48:10 +0000
Received: by outflank-mailman (input) for mailman id 693722;
 Fri, 15 Mar 2024 09:48:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl4Ab-0003bf-BL
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 09:48:09 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2022290b-e2b1-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 10:48:07 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-568a5e15ae8so1500394a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 02:48:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a13-20020a170906684d00b00a4646051f25sm1514861ejs.203.2024.03.15.02.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 02:48:06 -0700 (PDT)
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
X-Inumbo-ID: 2022290b-e2b1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710496087; x=1711100887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gD/Pc9X6PfFxpUAKaLZpaRNJBs5DNUIe8R8bnxvxUvQ=;
        b=PSV4eXLl68BtB0O5u68QV48K9kVlRTjMzAtvXE+aRoo1I1kNOcMd+L7Zk20M1HhuSg
         rYBG58yo2zl/zC0XGPbF5O1JtTmZpwJz37BZ8UZfJOQ8SMISq0TQ0mmKhkOqwO9MCROD
         mFcktLoRm9yCReLI7bhvVL4x0dz+9VI5h3aHMmKObGF5uCN0V5pPZxbOTGI8xLoE7kT/
         41+EnyiCv8TFOaA5Vj4GKVG7KfO7DropTk16EFuMfp4goY+UbkMhXHsUSyPzV6htpnqu
         BuNkYNKXnkEFIAqlpkQIWXg/V8L7xYDgOz+cVjaAUCyXnpepwlXF+ZJI979/ubyo9xzY
         12Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710496087; x=1711100887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gD/Pc9X6PfFxpUAKaLZpaRNJBs5DNUIe8R8bnxvxUvQ=;
        b=Y82Jo0N44jX53OeLes4ty++kVNlppFceghDEShUxPP1tef7Lx2YmHCcc05e+ixhYK2
         5Z00x6PDrLh5sdw8a7t54UobmuZimgYNao2GisCQ9v5azKvKtGqNL9sjZrWgLdlyqiRf
         GKPjE5JwQ4amZopULVwaJKMxOVgopC3eo72za9TTKLVKOZlMlYcU9TNwRAp7qTxcXZs8
         4qPw3C4gJvGpXQu9O/9QIMpV044PZQTm330oF3UeZjH4W+T72a2UlnJQhgRVEyC/+eZb
         +kb9gB5hNzx3MTzIIVVfkVwEofPXS14gsKxQzTbtIRE/m0ZFrTrwjRjXnrI7OxnyKvBc
         yZug==
X-Forwarded-Encrypted: i=1; AJvYcCX+sbhgy4/a5TAdoyfok3KnxWytLDMr7AZkSRtmf7BSwOP/dhrdjLMiUeFFt7SbKrRajAkOysGA4pU50xbPCwdQqAv/X9XeZ2PdhCiULns=
X-Gm-Message-State: AOJu0YzMqQgyBVQ1UbjzJQOb+FAoI19Wj+11lOCUJqEWvIoDKW4zDzEj
	zyXylqGzrriDnsyJMCq3yNebIxO4Xl4c2L+8TypAUI9rqojI8wPQrlVvx1UPYA==
X-Google-Smtp-Source: AGHT+IG5niJGd+BSRLD+GT/59wfmkytP2ffo86hUx8JjVzkbnCD8HTSA73eERwn9f4rK7BjTStTxNw==
X-Received: by 2002:a17:906:874d:b0:a46:11a9:430 with SMTP id hj13-20020a170906874d00b00a4611a90430mr2812879ejb.76.1710496086797;
        Fri, 15 Mar 2024 02:48:06 -0700 (PDT)
Message-ID: <88bd8577-42e6-4087-9888-00cd73e7f0bc@suse.com>
Date: Fri, 15 Mar 2024 10:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <12fe48a6-6957-49d7-adf5-1a3ac8b1bfaa@suse.com>
 <7506abe0-e3d4-44f7-b54d-592ae2e3fd3e@amd.com>
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
In-Reply-To: <7506abe0-e3d4-44f7-b54d-592ae2e3fd3e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 20:19, Jason Andryuk wrote:
> On 2024-03-14 09:31, Jan Beulich wrote:
>> On 13.03.2024 20:30, Jason Andryuk wrote:
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -537,6 +537,108 @@ static paddr_t __init find_memory(
>>>       return INVALID_PADDR;
>>>   }
>>>   
>>> +static bool __init check_load_address(
>>> +    const struct domain *d, const struct elf_binary *elf)
>>> +{
>>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>>> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
>>
>> Both casts act on a pointer value. Such cannot legitimately be converted
>> to paddr_t; it only so happens that paddr_t is effectively the same as
>> uintptr_t right now. (Same issue again further down.) That said, I notice
>> we have pre-existing examples of this ...
> 
> Yes, I followed existing code.  Do you want dest_base to be switched to 
> a uintptr_t?

I think it was deliberately switched to being a pointer at some point,
maybe even in a security fix.

>>> +/* Check the kernel load address, and adjust if necessary and possible. */
>>> +static bool __init check_and_adjust_load_address(
>>> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
>>> +{
>>> +    paddr_t reloc_base;
>>> +
>>> +    if ( check_load_address(d, elf) )
>>> +        return true;
>>> +
>>> +    if ( parms->phys_align == UNSET_ADDR )
>>> +    {
>>> +        printk("Address conflict and %pd kernel is not relocatable\n", d);
>>> +        return false;
>>> +    }
>>> +
>>> +    reloc_base = find_kernel_memory(d, elf, parms);
>>> +    if ( reloc_base == 0 )
>>> +    {
>>> +        printk("Failed find a load address for the kernel\n");
>>> +        return false;
>>> +    }
>>> +
>>> +    if ( opt_dom0_verbose )
>>> +        printk("Relocating kernel from [%lx, %lx] -> [%lx, %lx]\n",
>>> +               (paddr_t)elf->dest_base,
>>> +               (paddr_t)elf->dest_base + elf->dest_size,
>>
>> By using %p you clearly can avoid the casts here.
> 
> Ok.
> 
>>> +               reloc_base, reloc_base + elf->dest_size);
>>
>> I'm not convinced %lx is really appropriate for paddr_t.
> 
> PRIpaddr exists.  It's "016lx" for x86.  Using that and %p add lots of 0s:
> (XEN) Relocating kernel from [0000000001000000, 000000000202ffff] -> 
> [0000000002200000, 000000000322ffff]

That's to be accepted, I guess.

Looking at it again, is "Relocating" in the log message perhaps misleading?
We don't relocate it, that's something the kernel itself has to do. We only
put it at other than the default position. Maybe "Moving" instead?

Jan

