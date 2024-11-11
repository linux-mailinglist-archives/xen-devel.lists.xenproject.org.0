Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D659C3EF9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833720.1248921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAU0y-0004K4-34; Mon, 11 Nov 2024 12:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833720.1248921; Mon, 11 Nov 2024 12:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAU0y-0004Ia-0K; Mon, 11 Nov 2024 12:59:32 +0000
Received: by outflank-mailman (input) for mailman id 833720;
 Mon, 11 Nov 2024 12:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAU0w-0004FH-Qd
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:59:30 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c91edede-a02c-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 13:59:28 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37f52925fc8so2878311f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 04:59:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed987d95sm12978597f8f.44.2024.11.11.04.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 04:59:27 -0800 (PST)
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
X-Inumbo-ID: c91edede-a02c-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM5MWVkZWRlLWEwMmMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI5OTY4LjcwMzMzNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731329968; x=1731934768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ra9oo1maMdABnA7rzbPPxtDMMIJc282HIGrT0UpZ89o=;
        b=YMQ8FD4xMwn5EIJWd6dOP0yS+UF6twqOlF6X6LZLeCWffzABYLQnGGJMK4IiMgqa8N
         PXTGOf97d4Tc0qU1WiNF7Dmk0kUILBJ+TH2zZf2Thjw/zzSeNDgKniGK023Wdv75ifND
         /wCZKS3FEcSVcGAUnjgeNqXq90UWetIKW9wfqObDKsK6z4FuNFzfh4HGUL2sg3xpuBYP
         8ChSiKEz6IembP98Hx9e6a0IC3mekfEp1Hqp8Ac9hv5bXsvjzWMfCQNhb2atZUXkipeB
         9KZUOKjkvrT2MgUmdngh9ZHo6rwAUdXIkqeHXM+xczJnZ0kuBpqFmXjGY8BRPAftEsr9
         h/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731329968; x=1731934768;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ra9oo1maMdABnA7rzbPPxtDMMIJc282HIGrT0UpZ89o=;
        b=vK54AluzlKt7B9RTrnlGjuKxpRow+xJHeBtvG/CnxEB6lHDDbLce0PWCBBAFQ4pVy+
         AzaFwhVMsWlsv/7cP1WzZF3ioxyBOnRtiw5ix8DuhAGHML9XpGbgltCBjBSEwMlQhozm
         GS7POlx1efrliAK+Kdey/cMFj/A81cm59YPD9qfbQJpqgC16q4w7J76uHnxMkZzYoAog
         M0/V67QBjgrMwdnqqCpBl9iPFHCdBkeFoY/3yRtSwamDR27ZBsul7PB0ulz4/Ml3ao78
         TG/SocIMjeKN0rxMfjBuSHn1rdJXN07HNZLKJeFVpdhgpkSET2Wy4rN9fjO4bDtbi/uu
         QBlg==
X-Forwarded-Encrypted: i=1; AJvYcCVDL1je/O9lRRDde7QBYWLMJhSAacpeAdaXcrc6aRz2Rc8VNdumCG77sn88/sbBq0bPjapX7bqdmjw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzzcm34ZNJkUgT372RQqut0XeRR6anDTl7ChZAwMyBCKq3z5BYz
	FO5WQTyp08PN1qOu0Wgc51JaxODvo7nCjAU0nPNMkX97OTQAXrodmHRiX+yuNA==
X-Google-Smtp-Source: AGHT+IECv/UgFVUNsEjWIzU+tRl3tIOD6DzFE9RqF8sXzIcuTamsXQHEFZWBoNwJayC/mqEfsw3uDw==
X-Received: by 2002:a05:6000:78f:b0:382:51e:3f39 with SMTP id ffacd0b85a97d-382051e41f8mr847362f8f.37.1731329968013;
        Mon, 11 Nov 2024 04:59:28 -0800 (PST)
Message-ID: <58d33b2a-c486-4186-9181-1362da25c844@suse.com>
Date: Mon, 11 Nov 2024 13:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/riscv: introduce setup_mm()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1731069334.git.oleksii.kurochko@gmail.com>
 <2a9262165c71733792974f5e27795625013bc656.1731069334.git.oleksii.kurochko@gmail.com>
 <9eeb11a3-df72-4a77-9235-6a872b365ecd@suse.com>
 <8af72f722c96bae029ee8278c9164e3bc5474272.camel@gmail.com>
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
In-Reply-To: <8af72f722c96bae029ee8278c9164e3bc5474272.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.11.2024 13:51, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-11-11 at 11:29 +0100, Jan Beulich wrote:
>> On 08.11.2024 13:51, Oleksii Kurochko wrote:
>>> @@ -37,9 +42,9 @@ static inline void *maddr_to_virt(paddr_t ma)
>>>   */
>>>  static inline unsigned long virt_to_maddr(unsigned long va)
>>>  {
>>> -    if ((va >= DIRECTMAP_VIRT_START) &&
>>> +    if ((va >= directmap_virt_start) &&
>>
>> Is this a valid / necessary change to make?
> You are right, this not valid change, va value is DIRECTMAP_VIRT_START-
> relative.
> 
>>  Right now there looks to be
>> nothing immediately below the directmap, yet that would need
>> guaranteeing
>> (e.g. by some BUILD_BIG_ON() or whatever else) if code builds upon
>> that.
> It is not really clear how to check that nothing below the directmap is
> present/used. But IIUC there is no need for this check if properly
> correct the condition above.

Right.

>>>          (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
>>> -        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
>>> +        return directmapoff_to_maddr(va - directmap_virt_start);
>>
>> FTAOD - no question about this part of the change.
>>
>>> @@ -423,3 +429,140 @@ void * __init early_fdt_map(paddr_t
>>> fdt_paddr)
>>>  
>>>      return fdt_virt;
>>>  }
>>> +
>>> +vaddr_t __ro_after_init directmap_virt_start =
>>> DIRECTMAP_VIRT_START;
>>> +
>>> +struct page_info *__ro_after_init frametable_virt_start;
>>
>> As for directmap_virt_start - perhaps better with initializer?
> Do you mean to initialized by NULL or frame_table?

The latter.

> If to initialize by frame_table then the if-condition won't work
> properly in setup_frametable_mappings() ( but I think that this
> condition could be dropped as setup_frametable_mappings() is supposed
> to be called only once ?! ). And you mentioned about this condition
> here ...
> 
>>
>>> +#ifndef CONFIG_RISCV_32
>>> +
>>> +/* Map a frame table to cover physical addresses ps through pe */
>>> +static void __init setup_frametable_mappings(paddr_t ps, paddr_t
>>> pe)
>>> +{
>>> +    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
>>> +    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
>>> +    unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
>>> +    unsigned long frametable_size = nr_mfns *
>>> sizeof(*frame_table);
>>> +    mfn_t base_mfn;
>>> +
>>> +    if ( !frametable_virt_start )
>>> +        frametable_virt_start = frame_table -
>>> paddr_to_pfn(aligned_ps);
>>
>> If you make this conditional, then you need an "else" (or something
>> that's
>> effectively one) just like you have in setup_directmap_mappings().
>> Like
>> for the earlier assumption on ps being zero: Assumptions you make on
>> how
>> a function is used want to at least be self-consistent. I.e. here
>> either
>> you assume the function may be called more than once, or you don't.
> ...
> 
> Do we have in Xen something to be sure that the function is called only
> once or I have to come up with static variable inside the function?

There's no checking needed. All I'm asking for is that the function
either be indeed callable multiple times, or that it not wrongly give
the impression that it can be called more than once when it really can't
be.

>>> +    if ( base_mfn < mfn_x(directmap_mfn_start) )
>>> +        panic("can't add directmap mapping at %#lx below directmap
>>> start %#lx\n",
>>> +              base_mfn, mfn_x(directmap_mfn_start));
>>> +
>>> +    if ( map_pages_to_xen((vaddr_t)mfn_to_virt(base_mfn),
>>> +                          _mfn(base_mfn), nr_mfns,
>>> +                          PAGE_HYPERVISOR_RW) )
>>> +        panic("Directmap mappings for [%#"PRIpaddr", %#"PRIpaddr")
>>> failed\n",
>>> +              mfn_to_maddr(_mfn(base_mfn)),
>>> +              mfn_to_maddr(_mfn(base_mfn + nr_mfns)));
>>
>> Maybe worth also logging the error code?
> I am not really understand why do we need that as the use will see what
> is the issue in the message inside panic().

If the panic() triggers, the user will see that something went wrong with
the given range. The error code may give a hint at _what_ went wrong.

Jan

