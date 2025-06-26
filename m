Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4680AE9D50
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 14:17:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026255.1401457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlX1-0002Sd-VC; Thu, 26 Jun 2025 12:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026255.1401457; Thu, 26 Jun 2025 12:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlX1-0002Pz-SH; Thu, 26 Jun 2025 12:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1026255;
 Thu, 26 Jun 2025 12:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUlX0-0002Pr-Gf
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 12:16:42 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a36632b-5287-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 14:16:40 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so668200f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 05:16:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f54417f7sm4496103a91.45.2025.06.26.05.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 05:16:39 -0700 (PDT)
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
X-Inumbo-ID: 6a36632b-5287-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750940200; x=1751545000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HGEsWebFUXiN/3IEv6Xxi8z7pzk1iGYRvyBnFPVTlno=;
        b=N8mGjhRQFhxZeiypDgWN1M8m1/GtAHwd99RC62lbJ7F54NSnrafXE/zUupjdPUF8qA
         5qxcpqDEJixYykYeZRQmtuOFFuwifPAZsT7jMZpG7H1rckhdkGC2lnKDr3/0xlTtM+iw
         EqrCRA0Go8WnzvvY4e3fr0hUH2nJgXkur5WUaYgvJl5dKNLuELImiB6vHEXfinZ7tXc4
         qkMl/FOs8yXbzIgVhQ60l89q/IOgcSKUJzJvIi+3Lhg+faMUyDIGYzmwD3XU4SMSr4Do
         gsUB4d68xyexCdi7CS8Sl51Hzkj37nj6bxYu+m6GlnfjpWPc2YsYCqZpvI6hoHvQ7/HE
         YLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750940200; x=1751545000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGEsWebFUXiN/3IEv6Xxi8z7pzk1iGYRvyBnFPVTlno=;
        b=e3/R4ZP7v3Z8ULGOX/Jv8KfpxizR7mLODtIk8N0YXA7XEqBKaesTbol95WvILHym4m
         +OWFH9XyUxL5GI9/m5MlevV3/K9bnhflLAq1YUTosLYBhwVBaj+svknTiYu5oFDBZ/39
         g666iOf1fXWKOoIeIsA5ktkJSwhUxqDcvkLVxmuMMcKrbDqUW4snHk7maalyxakpenh8
         HHl1slrqRXryEGKIC4x9GMf6BSxCXZkq/xd+IXHSCow2Og/cQsrhMqb/Xj+JCMFnj2eD
         gbKNKC+q9/1y9/yIlPaO6T2NAmJeWBil2O+LlBXAqDqg4iC5rzHIB3VZ3wjia+eJCgjz
         LPKg==
X-Forwarded-Encrypted: i=1; AJvYcCWAdrjQwbMdxR+JQnugEtBKJGblSHhdwkU6DSRjNydZ6eWuXdw54hc0xo6NRDfaqt2woGw+Okju5Kc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxywxsGgyJJlAZ3rERX6TfRl6kqQQHjj6PGrbbwkiwYXIHE1VwQ
	4DIR/+eK8uh2pKwQ14WYWNVKc+cOJM/IdJaKCG9M2zONgz+/jHAPD2zAugZcbQMA5g==
X-Gm-Gg: ASbGncsWreGk7BCT3EFJ9QGRFbs6D8I5FA6if4zxNk+9bmNSl/ovwlcDvI54lt3cCV+
	k+XdlU5WpCPahW5e9khvhk9YkM5K5yl1IQ0HVglZbdEvl2B/18eJQNpwqOFS/eZ6vapt1+0/yVM
	rv7t08unwPJPnCi8D1h0k9Bt0Y0OkvJvyZPOOVgSp7Jh9XFhUhfXuPilucwo5vdFNVyFy68hIwP
	qss+p8RmswfcJp4gKfNY6uqNLi0/TSwpcc3KbIeNy+VKAQYtePKObKAyrRsspHiP1YsmxXAyqHF
	qX9Uxy1oc3vIsyoGw8NkGgqkCu5pOlkPAwTeVKcf57/qxPRFNsH+upfcSx482+y9kGHCI/d+Lqo
	orHEZ8eHE6Q59oYx0XTf89z3uOIunpdA5c+AzOvav5WpZYpJHkV8EMTy3kQ==
X-Google-Smtp-Source: AGHT+IE7M2lpksZJsGvCMlis+EDtuTpFTG0bDAkbeziXEFn9O7H6FOB4f646ZbdiraFWwvSSN0QCvQ==
X-Received: by 2002:a05:6000:230f:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a6f30fc1admr2940608f8f.3.1750940199691;
        Thu, 26 Jun 2025 05:16:39 -0700 (PDT)
Message-ID: <b521ef1a-03fb-4225-8d4d-5cffa65c0e93@suse.com>
Date: Thu, 26 Jun 2025 14:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID
 allocation and manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
 <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com>
 <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com>
 <80223fe3-7403-4026-9505-8826c318fabb@suse.com>
 <a692d449-4101-498e-a460-33e4b2fb7176@gmail.com>
 <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com>
 <1a570c32-e207-47f5-9702-a752246328a9@gmail.com>
 <f4a20826-0949-4bf0-a8e8-eecd1428f739@suse.com>
 <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com>
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
In-Reply-To: <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2025 13:34, Oleksii Kurochko wrote:
> 
> On 6/26/25 12:41 PM, Jan Beulich wrote:
>> On 26.06.2025 12:05, Oleksii Kurochko wrote:
>>> On 6/24/25 4:01 PM, Jan Beulich wrote:
>>>> On 24.06.2025 15:47, Oleksii Kurochko wrote:
>>>>> On 6/24/25 12:44 PM, Jan Beulich wrote:
>>>>>> On 24.06.2025 11:46, Oleksii Kurochko wrote:
>>>>>>> On 6/18/25 5:46 PM, Jan Beulich wrote:
>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>>> @@ -0,0 +1,115 @@
>>>>>>>>> +#include <xen/bitops.h>
>>>>>>>>> +#include <xen/lib.h>
>>>>>>>>> +#include <xen/sched.h>
>>>>>>>>> +#include <xen/spinlock.h>
>>>>>>>>> +#include <xen/xvmalloc.h>
>>>>>>>>> +
>>>>>>>>> +#include <asm/p2m.h>
>>>>>>>>> +#include <asm/sbi.h>
>>>>>>>>> +
>>>>>>>>> +static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>>>>>>>> +
>>>>>>>>> +/*
>>>>>>>>> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
>>>>>>>>> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
>>>>>>>>> + * concurrent domains.
>>>>>>>> Which is pretty limiting especially in the RV32 case. Hence why we don't
>>>>>>>> assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
>>>>>>>> not per-vCPU).
>>>>>>> Good point.
>>>>>>>
>>>>>>> I don't believe anyone will use RV32.
>>>>>>> For RV64, the available ID space seems sufficiently large.
>>>>>>>
>>>>>>> However, if it turns out that the value isn't large enough even for RV64,
>>>>>>> I can rework it to manage IDs per physical CPU.
>>>>>>> Wouldn't that approach result in more TLB entries being flushed compared
>>>>>>> to per-vCPU allocation, potentially leading to slightly worse performance?
>>>>>> Depends on the condition for when to flush. Of course performance is
>>>>>> unavoidably going to suffer if you have only very few VMIDs to use.
>>>>>> Nevertheless, as indicated before, the model used on x86 may be a
>>>>>> candidate to use here, too. See hvm_asid_handle_vmenter() for the
>>>>>> core (and vendor-independent) part of it.
>>>>> IIUC, so basically it is just a round-robin and when VMIDs are ran out
>>>>> then just do full guest TLB flush and start to re-use VMIDs from the start.
>>>>> It makes sense to me, I'll implement something similar. (as I'm not really
>>>>> sure that we needdata->core_asid_generation, probably, I will understand it better when
>>>>> start to implement it)
>>>> Well. The fewer VMID bits you have the more quickly you will need a new
>>>> generation. And keep track of the generation you're at you also need to
>>>> track the present number somewhere.
>>>>
>>>>>>> What about then to allocate VMID per-domain?
>>>>>> That's what you're doing right now, isn't it? And that gets problematic when
>>>>>> you have only very few bits in hgatp.VMID, as mentioned below.
>>>>> Right, I just phrased my question poorly—sorry about that.
>>>>>
>>>>> What I meant to ask is: does the approach described above actually depend on whether
>>>>> VMIDs are allocated per-domain or per-pCPU? It seems that the main advantage of
>>>>> allocating VMIDs per-pCPU is potentially reducing the number of TLB flushes,
>>>>> since it's more likely that a platform will have more than|VMID_MAX| domains than
>>>>> |VMID_MAX| physical CPUs—am I right?
>>>> Seeing that there can be systems with hundreds or even thousands of CPUs,
>>>> I don't think I can agree here. Plus per-pCPU allocation would similarly
>>>> get you in trouble when you have only very few VMID bits.
>>> But not so fast as in case of per-domain allocation, right?
>>>
>>> I mean that if we have only 4 bits, then in case of per-domain allocation we will
>>> need to do TLB flush + VMID re-assigning when we have more then 16 domains.
>>>
>>> But in case of per-pCPU allocation we could run 16 domains on 1 pCPU and at the same
>>> time in multiprocessor systems we have more pCPUs, which will allow us to run more
>>> domains and avoid TLB flushes.
>>> On other hand, it is needed to consider that it's unlikely that a domain will have
>>> only one vCPU. And it is likely that amount of vCPUs will be bigger then an amount
>>> of domains, so to have a round-robin approach (as x86) without permanent ID allocation
>>> for each domain will work better then per-pCPU allocation.
>> Here you (appear to) say one thing, ...
>>
>>> In other words, I'm not 100% sure that I get a point why x86 chose per-pCPU allocation
>>> instead of per-domain allocation with having the same VMID for all vCPUs of domains.
>> ... and then here the opposite. Overall I'm in severe trouble understanding this
>> reply of yours as a whole, so I fear I can't really respond to it (or even just
>> parts thereof).
> 
> IIUC, x86 allocates VMIDs per physical CPU (pCPU) "dynamically" — these are just
> sequential numbers, and once VMIDs run out on a given pCPU, there's no guarantee
> that a vCPU will receive the same VMID again.
> 
> On the other hand, RISC-V currently allocates a single VMID per domain, and that
> VMID is considered "permanent" until the domain is destroyed. This means we are
> limited to at most VMID_MAX domains. To avoid this limitation, I plan to implement
> a round-robin reuse approach: when no free VMIDs remain, we start a new generation
> and begin reusing old VMIDs.
> 
> The only remaining design question is whether we want RISC-V to follow a global
> VMID allocation policy (i.e., one VMID per domain, shared across all of its vCPUs),
> or adopt a policy similar to x86 with per-CPU VMID allocation (each vCPU gets its
> own VMID, local to the CPU it's running on).

Besides what Jürgen has said, what would this mean if you have 16 VMIDs and a 17th
domain appears? You can't "take away" the VMID from any domain, unless you fully
suspended it first (that is, all of its vCPU-s).

> Each policy has its own trade-offs. But in the case where the number of available
> VMIDs is small (i.e., low VMIDLEN), a global allocation policy may be more suitable,
> as it requires fewer VMIDs overall.
> 
> So my main question was:
> What are the advantages of per-pCPU VMID allocation in scenarios with limited VMID
> space, and why did x86 choose that design?
> 
>  From what I can tell, the benefits of per-pCPU VMID allocation include:
> - Minimized inter-CPU TLB flushes — since VMIDs are local, TLB entries don’t need
>    to be invalidated on other CPUs when reused.
> - Better scalability — this approach works better on systems with a large number
>    of CPUs.
> - Frequent VM switches don’t require global TLB flushes — reducing the overhead
>    of context switching.
> However, the downside is that this model consumes more VMIDs. For example,
> if a single domain runs on 4 vCPUs across 4 CPUs, it will consume 4 VMIDs instead
> of just one.

I don't understand this, nor why it's a downside. Looking at a domain as a whole
simply doesn't make sense in this model. Or if you do, then you need to consider
the system-wide number of VMIDs you have available:
(1 << VMIDLEN) * num_online_cpus(). That is, in your calculation a domain with
4 vCPU-s may indeed use up to 4 VMIDs at a time, but out of a pool at least 4
times the size of that of an individual pCPU.

Jan

