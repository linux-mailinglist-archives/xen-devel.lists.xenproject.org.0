Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B18F9F461B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 09:33:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858595.1270846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNT0h-0006m1-BT; Tue, 17 Dec 2024 08:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858595.1270846; Tue, 17 Dec 2024 08:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNT0h-0006je-8F; Tue, 17 Dec 2024 08:32:55 +0000
Received: by outflank-mailman (input) for mailman id 858595;
 Tue, 17 Dec 2024 08:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNT0g-0006j7-JM
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 08:32:54 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8193da50-bc51-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 09:32:52 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436249df846so34662655e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 00:32:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559ec08sm165685205e9.22.2024.12.17.00.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 00:32:51 -0800 (PST)
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
X-Inumbo-ID: 8193da50-bc51-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734424372; x=1735029172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jgjrEz0GJGTtRorLSyVu4NgoYGiJYSxNCbuun1M4fwg=;
        b=T7l/rP8iAmubzeLgA+N7d2VnDudcZXaIsAPs2VyXie2b8E0TG/MSvhomiU/jliXoZT
         Cpunhln3ZKosLvP2sAEJPsJeWUiDYsaWcKG2NPLnKg6St68p+uHmXzoHKVUnuU9F0BGM
         bsvR0Ub0xcDjfen2kANktN0U6ezzEgGPSB5Ev3mg7PCIp+CzBPq9HnBGeGUSzlE00E7/
         OM4/LRaArDxwHePr7XWodGeMGpDRlqz2Z7HtramKaH3hBEFxoEsbOV2dAJ3vIzURTI1d
         tGT9t9tzU4vhNKiacZe2BZ8VnJJZPU6h3kfZTATBcyUpzFS351AJy0M7hOlOJENl7C85
         lkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734424372; x=1735029172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgjrEz0GJGTtRorLSyVu4NgoYGiJYSxNCbuun1M4fwg=;
        b=L3wZULlpZ7px8/vNfrH2KddGGo/cIcNH3Dz9gusGzhPDtItM8jAWLfuQ2NUSGeytgC
         KTYkTx5EDSwWet6Bs4APNEmRB6C2shtUV9kONB/yBczsZuZFgFNV4LshRZSjDrS/zNPG
         icUfHxkV3J+2lq1BW8Mf1qCdhkTDQhFFFszwwjk5OwBab6BEwWnns1kVnw+/GgkwK6q+
         CUS2kGQ1prSCI4X40elGjvedlMsc9o8ucM7orUBJG9zkGpZVU4BMp5POnixADT1DLF/o
         uy0gw9foXwSn9mXRAKObrKpLtarhOU4qcaNSAeXJEyo4QciutciFNNFuP6AViSNh3gdr
         oqaw==
X-Forwarded-Encrypted: i=1; AJvYcCUpQ6pdRGyE1/+leqDQ+MK9OenN0VppJvD8aQ8zobzCXdACxVYk8WMAk3RTEoEaUwxTYsLY76/V32U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfhLFA/v3+hQbEqaUBlZN+V0Xl6x9KSQzL7GhbgKPJ5L6Dcv+u
	z6/STSjQbi/t0hfFa3hFpBvua28H0aFy/XnVAOUjh1NpWtW2bhMHo5gxy9jW0g==
X-Gm-Gg: ASbGnctyAxx9ijJJ3NMlFltVI2dWN34u1W18bnEJAzFVUG+LihfHkML5SVQ90Fhgy70
	CfoeKG5tYF8WSOAlklV59IT5CWvh5Fajeti7GCIXU2Oyr5UGebPtncUFS9RyuTdM9/8mv9EONQZ
	42A4eqnx4B7vUBrXYWrNmFU4Fv8eGqFGz9iZvjy+Gn5SuCcOYiRY7RFbWUVIIeg3eOky4P5tjdE
	GzwdwqTh+RkPTIE+vezAKzP22jm7Aq51iNs9+5OYmx4x0NCfgBqld8uJfk9hbvcocw8BDuC5d65
	ntET4U6XqTUE+2VuZFHo6k4UqX3ncxKruYZ0EIP+CA==
X-Google-Smtp-Source: AGHT+IH+eJHD7vVJvh0gGMfIhSRRAjRRzj7Txc7159wZttQD6+LSV6nkxJcRI48ZPtxLk+FOQpPEIw==
X-Received: by 2002:a05:600c:c89:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-4362aa6fd6bmr124111605e9.19.1734424371981;
        Tue, 17 Dec 2024 00:32:51 -0800 (PST)
Message-ID: <3579b3ca-3634-4537-8981-fd68c60d5c6a@suse.com>
Date: Tue, 17 Dec 2024 09:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/riscv: implement data and instruction cache
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
 <bb6191b21bd387f265e0e25322a30f4ade6e8b3b.1733937787.git.oleksii.kurochko@gmail.com>
 <19c9ef65-a5bd-4d81-89dc-c780d3ead8b8@suse.com>
 <1c8c888e-bf59-4b4d-a3a5-cd2c0c7b6565@gmail.com>
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
In-Reply-To: <1c8c888e-bf59-4b4d-a3a5-cd2c0c7b6565@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.12.2024 18:40, Oleksii Kurochko wrote:
> On 12/16/24 3:23 PM, Jan Beulich wrote:
>> On 11.12.2024 18:27, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/page.h
>>> +++ b/xen/arch/riscv/include/asm/page.h
>>> @@ -7,6 +7,7 @@
>>>   
>>>   #include <xen/bug.h>
>>>   #include <xen/const.h>
>>> +#include <xen/errno.h>
>>>   #include <xen/types.h>
>>>   
>>>   #include <asm/atomic.h>
>>> @@ -148,9 +149,27 @@ static inline bool pte_is_mapping(pte_t p)
>>>       return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>>>   }
>>>   
>>> +static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
>>> +{
>>> +#ifdef CONFIG_QEMU
>>> +    return 0;
>>> +#else
>>> +    return -EOPNOTSUPP;
>>> +#endif
>>> +}
>>> +
>>> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
>>> +{
>>> +#ifdef CONFIG_QEMU
>>> +    return 0;
>>> +#else
>>> +    return -EOPNOTSUPP;
>>> +#endif
>>> +}
>> So testing on real hardware will then effectively become impossible, until
>> someone goes and implements these?
> 
> Yes...
> 
> I am not sure what better we can do. It seems like it will be the best one to check if CMO
> extensions is supported and use instructions for this extensions to implement these functions as they
> are in the specification and not expected to be changed.

Yes, using CMO when available is certainly the route to go. The main
question there is what the behavior ought to be when CMO is unavailable.

> But I want to back a little bit later to this implemntation as this not issue for QEMU as it doesn't model cache and
> h/w on which I can ask to run Xen has IO cache coherency so for it will be needed just to add a new config
> and implementation will still be 'return 0'. ( I thought to introduce instead of CONFIG_QEMU something like
> CONFIG_HAS_CACHE_COHERENCY )
> 
> And also in the spec it is mentioned:
> ```
> This suggests that RISC-V platforms prefer to support full 
> cache-coherent I/O, but it isn't actually mandatory.
> As a result, the PMBT and CMO extensions aren't mandatory either, 
> meaning that some platforms might not
> have instructions to properly flush, clean, or invalidate the cache.
> ``` Based on that I also think to implement that in the following way:
> ```
>      #ifdef CONFIG_QEMU
>      static inline int plat_clean_and_invalidate_dcache_va_range() { return 0; }
>    static inline int plat_clean_dcache_va_range() { return 0; }
>    #else /* !CONFIG_QEMU */
>      static inline void plat_clean_and_invalidate_dcache_va_range()
>    {
>      printk_once("%s: should it be implemented for your platform?\n", __func__);
>      return 0;
>    }
> 
>    static inline void plat_clean_dcache_va_range()
>    {
>      printk_once("%s: should it be implemented for your platform?\n", __func__);
>      return 0;
>    }
>    #endif
> 
>    static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
>    {
>        return plat_clean_and_invalidate_dcache_va_range();
>    }
> ....
> ```
> So we will have a notification for others none-QEMU platforms notification that probably some
> changes are required.

Yet failing to get cache management right can easily result in data corruption.
I don't think a on-time printk() is appropriate to handle the lack of respective
implementation. At least not anymore once RISC-V leaves "experimental" status.

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/platforms/Kconfig
>>> @@ -0,0 +1,5 @@
>>> +config QEMU
>>> +	bool "QEMU aarch virt machine support"
>>> +	depends on RISCV_64
>> I understand Arm has it like this, but: Is QEMU really a sufficiently non-
>> ambiguous name to use?
> 
> Yes, it sounds good to me to have such naming for the platform which are running on top of QEMU.
> 
> The other option I thought about it is to use CONFIG_VIRT_PLATFORM.

I don't think QEMU should be fully omitted from the name. Nor do I think that
you can generally infer from "virtual platform" that caches aren't modeled.
What I was rather getting at is to perhaps add some qualifier to QEMU, e.g.
QEMU_PLATFORM.

Jan

