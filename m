Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE6AAE67AA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 16:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023756.1399811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4DU-0002aG-Ss; Tue, 24 Jun 2025 14:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023756.1399811; Tue, 24 Jun 2025 14:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4DU-0002Yp-Py; Tue, 24 Jun 2025 14:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1023756;
 Tue, 24 Jun 2025 14:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU4DT-0002Yj-4a
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 14:01:39 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id befec530-5103-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 16:01:38 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-553b51f5218so462140e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 07:01:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d867f8d0sm111636445ad.175.2025.06.24.07.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 07:01:34 -0700 (PDT)
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
X-Inumbo-ID: befec530-5103-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750773697; x=1751378497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vm+y1VGxVVOsdccpEdh9HYahOWLYN2AlvFui1euU3ic=;
        b=XOcLJBXDDnzgxmfrhBknsCbEmx09ModpBzBK/Bq69Hh0E/zXO/vilvtS+kLQES8/jV
         RqQR8uDHkVn+weeHjWZVqK99AM9RnF8PRwdOuWBKZbamHUnJL2ZZqKBB992JYaV/BiIJ
         SDtPVk2Sd3IwnTwVJYEjzmzxgmcdGnvAtbe8g8fZWKM+UcrYBf/UP5MAu9MmxX10xFV/
         L5J22JK5+9aBwh/3xbP07ETAPJ3Bzhzz4i3sY/MuL+ilrx5eb84rzQ6HULKQnNWTcARU
         t++yZUGzHuROIOroxAKxGON+oKHND5jmh6Y2SBIcQ+PeZXFqkYg5vMKu9/tepvRNWlp3
         nJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773697; x=1751378497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm+y1VGxVVOsdccpEdh9HYahOWLYN2AlvFui1euU3ic=;
        b=mqoUfnuncmlHEVrXHby7ljor6uEPk7vZ1yTDNqOBtfndTlUigzokE1ba+bpcQHDhJl
         P8YjOMEx0IuwfJjcPVjQgD8OiZnU7Y0L8mGsTIS3jUpJC1o1Wkm967cN1C8VOtLTs85M
         JxY0RiHnZdMleOV95G7gW69RD3l3fziB9Lw8nVBdRuS9mJB8rbg2DyJ2OfO73sp1MRvV
         3YjptHTMxO7hRhJGE2RUzwdLjH8yPpudtyDvKcik6pgUNB7nT9c9/LMZNUjar1hP4Oui
         nB2IdYYL9Oe5a0P65NEaAZ3/0IfjODod5m2vlDqmyL5eCclt9MsQ/HMlckBgZ3DjPEhO
         QGSg==
X-Forwarded-Encrypted: i=1; AJvYcCUEWZ7lv/YDPY/RKIrEo8TJ4qUqyVa5swfcr511yvyFCtOM7rp0Uwc/VtvfanoRIrZEj85AAggjuzs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlEDsUzkJCv+w8TbqbNOPV9AsFulNnk5CiFA2Rb+NA3a4je6uT
	UIAsuJaybT9XMhxMhOFS/1x5wiHawaUhUWjtM0GiwSlmrkIzc3rAsE7dddFD9vmjHg==
X-Gm-Gg: ASbGnctqyGhY2DjEh668hm8DPWCsrmY3cAye0YUmybXfvOukISda8F+dwsxX/5jIU7y
	q6ne3zTnjn6B6MAP8nHj0hEp0JajB0+5Tq6af+L9U+UnqYd/WBtOjyqknvxnPSylt4n7AjAATS4
	mYm4EpPPJlojueDBb3JDV515a58kLdLgcCQ1mC6IDK1vKMPFMeNpF2lzu7XLvgws0H9QHhnElta
	glGyaGXbQ5FiFEqf9wPakmw3tBFzJJn9KSaojkhE1hg4dDqvRNCbe81HZjYm5WePqiY1bJeUEOZ
	3JkPSbLOCY0ZmurlT6Jeh7OVXSZjIGY8eeUnTkldEPl/ZbL0AjP3y4rQTYm3UxochIOHGpL6dLL
	Hx0jxSK1A1y12Ma6Nv50By0+nwq5VjfXg9KmgatDlpTy8OTs=
X-Google-Smtp-Source: AGHT+IHBwjBRT9z/DZTIqLQYbJsyeg74EDwrFouTnuxVlapPFGG+NdG6n8A+r3CTZA1jfiBKL4TLKg==
X-Received: by 2002:a05:6512:3b9d:b0:553:65bc:4232 with SMTP id 2adb3069b0e04-553e3beb474mr5984699e87.31.1750773694994;
        Tue, 24 Jun 2025 07:01:34 -0700 (PDT)
Message-ID: <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com>
Date: Tue, 24 Jun 2025 16:01:24 +0200
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
In-Reply-To: <a692d449-4101-498e-a460-33e4b2fb7176@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2025 15:47, Oleksii Kurochko wrote:
> On 6/24/25 12:44 PM, Jan Beulich wrote:
>> On 24.06.2025 11:46, Oleksii Kurochko wrote:
>>> On 6/18/25 5:46 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>> @@ -0,0 +1,115 @@
>>>>> +#include <xen/bitops.h>
>>>>> +#include <xen/lib.h>
>>>>> +#include <xen/sched.h>
>>>>> +#include <xen/spinlock.h>
>>>>> +#include <xen/xvmalloc.h>
>>>>> +
>>>>> +#include <asm/p2m.h>
>>>>> +#include <asm/sbi.h>
>>>>> +
>>>>> +static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>>>> +
>>>>> +/*
>>>>> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
>>>>> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
>>>>> + * concurrent domains.
>>>> Which is pretty limiting especially in the RV32 case. Hence why we don't
>>>> assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
>>>> not per-vCPU).
>>> Good point.
>>>
>>> I don't believe anyone will use RV32.
>>> For RV64, the available ID space seems sufficiently large.
>>>
>>> However, if it turns out that the value isn't large enough even for RV64,
>>> I can rework it to manage IDs per physical CPU.
>>> Wouldn't that approach result in more TLB entries being flushed compared
>>> to per-vCPU allocation, potentially leading to slightly worse performance?
>> Depends on the condition for when to flush. Of course performance is
>> unavoidably going to suffer if you have only very few VMIDs to use.
>> Nevertheless, as indicated before, the model used on x86 may be a
>> candidate to use here, too. See hvm_asid_handle_vmenter() for the
>> core (and vendor-independent) part of it.
> 
> IIUC, so basically it is just a round-robin and when VMIDs are ran out
> then just do full guest TLB flush and start to re-use VMIDs from the start.
> It makes sense to me, I'll implement something similar. (as I'm not really
> sure that we needdata->core_asid_generation, probably, I will understand it better when 
> start to implement it)

Well. The fewer VMID bits you have the more quickly you will need a new
generation. And keep track of the generation you're at you also need to
track the present number somewhere.

>>> What about then to allocate VMID per-domain?
>> That's what you're doing right now, isn't it? And that gets problematic when
>> you have only very few bits in hgatp.VMID, as mentioned below.
> 
> Right, I just phrased my question poorly—sorry about that.
> 
> What I meant to ask is: does the approach described above actually depend on whether
> VMIDs are allocated per-domain or per-pCPU? It seems that the main advantage of
> allocating VMIDs per-pCPU is potentially reducing the number of TLB flushes,
> since it's more likely that a platform will have more than|VMID_MAX| domains than
> |VMID_MAX| physical CPUs—am I right?

Seeing that there can be systems with hundreds or even thousands of CPUs,
I don't think I can agree here. Plus per-pCPU allocation would similarly
get you in trouble when you have only very few VMID bits.

>>>>> +        sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
>>>> You're creating d; it cannot possibly have run on any CPU yet. IOW
>>>> d->dirty_cpumask will be reliably empty here. I think it would be hard to
>>>> avoid issuing the flush to all CPUs here in this scheme.
>>> I didn't double check, but I was sure that in case d->dirty_cpumask is empty then
>>> rfence for all CPUs will be send. But I was wrong about that.
>>>
>>> What about just update a code of sbi_rfence_v02()?
>> I don't know, but dealing with the issue there feels wrong. However,
>> before deciding where to do something, it needs to be clear what you
>> actually want to achieve. To me at least, that's not clear at all.
> 
> I want to achieve the following behavior: if a mask is empty
> (specifically, in our case|d->dirty_cpumask|), then perform the flush
> on all CPUs.

That's still too far into the "how". The "why" here is still unclear: Why
do you need any flushing here at all? (With the scheme you now mean to
implement I expect it'll become yet more clear that no flush is needed
during domain construction.)

Jan

