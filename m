Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F36AA039B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 08:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971553.1359941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eh7-0005YP-MI; Tue, 29 Apr 2025 06:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971553.1359941; Tue, 29 Apr 2025 06:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eh7-0005Vq-JP; Tue, 29 Apr 2025 06:43:53 +0000
Received: by outflank-mailman (input) for mailman id 971553;
 Tue, 29 Apr 2025 06:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9eh5-0005Vk-SL
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 06:43:51 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eae1748-24c5-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 08:43:49 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so1007341566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 23:43:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acecf27a79esm31848266b.24.2025.04.28.23.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 23:43:48 -0700 (PDT)
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
X-Inumbo-ID: 4eae1748-24c5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745909029; x=1746513829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7q4chUH5I+4nZEOXH93nWk0410fMjJNFOvlmK30f50s=;
        b=D8ny6aFGUF2RSTHiGJag3nRGRyk4/ulMIWFWXpDBIix3nZpMZU8EoAZd+FDa//uXGG
         l20BKXQAopZD5YQKf69r81Jl0YjRhIW+tszpHX081F28+4dKHCRRHVhoGH0BgCTUC8p9
         r506wRNF2kHC5DoeYYCoFvku1FZn8tJ8SpuxHwjQdizWr5wQF1wh9J3wiMwJht4czHOm
         Z8SV/QvkWXwenHmxxm2RTj3BgFDXWlyrqXWW9sVF+DxRHMf72guTGClj+uRX2fGczPWx
         IOXk3tDP66efv6A2Ti7ULDiafzGE0Jh1nfGdbf/S2NeN/HjK/n8Jr2cQKoDnEpSb3pP5
         lTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909029; x=1746513829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q4chUH5I+4nZEOXH93nWk0410fMjJNFOvlmK30f50s=;
        b=fyVXxWR2RMnHOD6B9e970Y0dY5cLg0YeKV39AoBomhyOk38KElfWoBLpNjLCwSZEBq
         Tf2yzn9gtph20fN9xhDRXXcVcvLi+wjlL8YAQIFt0RaYn2LD0fpvSJxXNYjERXwG1xAJ
         hlSbdMlsNhY1psTdnfSlXUFGBERM/cA6kDv+7hWThWp1VSFq9VJwwND/MQ+2x28MjSkf
         QNttYZEI/CdAf49+0usAFRnJb1CeIORNoG5+u4l+FNWKVIJLlwAj60NC/EN9AFmxZB52
         JuJKepcPmXwauWVRxIPQfSkcC0DI7gJRagloiV1OPrShDMU1HuL8tKWREAdYTrbK/GFY
         edFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVEF/s2ydVGfw7VUgK2SdMomYiP48fBCyCeU1Ke4Bi+S5+SfIkChv51jf8aPD4yN0z7Hk7nyVNgv4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztjFUoLjg9H0FECiZwlL7xFGOzrqClkBVyRlqgoC5VRZZNc9VH
	md/MSMj0BE6yo+mGm8+BvipfvwxMo7O5RsRy6gqOBX+dT9PrdiFm5l3afg5uqQ==
X-Gm-Gg: ASbGncs8xYmgNb7iDGgkAfi2Ll09Z4DsOiGHj48Kkaq2nJ2+ZC6S64aEwn2oj5Q3v9V
	2LbKHEs+iBAGeJi4nz3ajzmcE5VYFIXathxmYXpjCtKaSC3IWF0w2U519e7SdRFmVgPjpBRxn//
	8dAYITJfyOB/ALj2eXAANuB8GFlFyJkJFoeSJtGoPV6AmdP21EGgB+6MeoJQAORk5O6at+3RJKk
	cHUZl5puyzVXN6PnnaWeR+pMnm/LA2uAYew4QuBNabm/ZhYbKlenejWL+DJmiZXLd8RPCjYpXVo
	I0DIBS/xfZnMTrIdtUSMez2uiYhIIIP+gl1T1FRYNHZScVC9gIAbDlVdcxQ6gHycWOwMXuvMe+0
	OMfw53Z0vH2YkTYjvsNCZOrwmrQ==
X-Google-Smtp-Source: AGHT+IG4OR2kDFhOLFS2O+wHvGmX+OKfbxswYM9s9gYOQ+Sfzhg5lQStSidPC2oR8YKqRQTfJqFAYQ==
X-Received: by 2002:a17:907:72d0:b0:acb:b08c:76ae with SMTP id a640c23a62f3a-acec84d2cb7mr136739266b.16.1745909029000;
        Mon, 28 Apr 2025 23:43:49 -0700 (PDT)
Message-ID: <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
Date: Tue, 29 Apr 2025 08:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 jason.andryuk@amd.com, agarciav@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.04.2025 22:00, Stefano Stabellini wrote:
> On Mon, 28 Apr 2025, Jan Beulich wrote:
>> On 25.04.2025 22:19, Stefano Stabellini wrote:
>>> From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
>>>
>>> Dom0 PVH might need XENMEM_exchange when passing contiguous memory
>>> addresses to firmware or co-processors not behind an IOMMU.
>>
>> I definitely don't understand the firmware part: It's subject to the
>> same transparent P2M translations as the rest of the VM; it's just
>> another piece of software running there.
>>
>> "Co-processors not behind an IOMMU" is also interesting; a more
>> concrete scenario might be nice, yet I realize you may be limited in
>> what you're allowed to say.
> 
> Sure. On AMD x86 platforms there is a co-processor called PSP running
> TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> pass addresses to it.  See drivers/tee/amdtee/ and
> include/linux/psp-tee.h in Linux.
> 
> This is not a new problem. On ARM we have been dealing with this kind of
> issues for more than a decade and it is the reason why originally the
> decision was to run Dom0 1:1 mapped on ARM. I am not suggesting to map
> Dom0 PVH 1:1; I am only providing context and highlighting that we
> have been lucky on x86 :-)
> 
> 
>>> XENMEM_exchange was blocked for HVM/PVH DomUs, and accidentally it
>>> impacted Dom0 PVH as well.
>>
>> This wasn't accidental at all, I don't think.
> 
> You as the original author of the patch (fae7d5be8bb) in question would
> surely know better. But the way the commit message was written was
> pointing toward a Dom0/DeviceModel problem:
> 
> "The operation's success can't be controlled by the guest, as the device
> model may have an active mapping of the page."

It's the problem mentioned at the bottom: MFNs (in principle) are entirely
meaningless to HVM and PVH domains. With, as you point out there, an
apparently important exception.

>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -4401,7 +4401,7 @@ int steal_page(
>>>      const struct domain *owner;
>>>      int rc;
>>>  
>>> -    if ( paging_mode_external(d) )
>>> +    if ( paging_mode_external(d) && !is_hardware_domain(d) )
>>>          return -EOPNOTSUPP;
>>>  
>>>      /* Grab a reference to make sure the page doesn't change under our feet */
>>
>> Is this (in particular the code following below here) a safe thing to do
>> when we don't properly refcount page references from the P2M, yet? It's
>> Dom0, yes, but even there I might see potential security implications (as
>> top violating privacy of a guest).
> 
> I don't think I am following, could you please elaborate more? The
> change I am proposing is to allow Dom0 to share its own pages to the
> co-processor. DomUs are not in the picture. I would be happy to add
> further restriction to that effect. Is there something else you have in
> mind?

Once "shared" with the PSP, how would Xen know that this sharing has stopped?
Without knowing, how could it safely give the same page to a DomU later on?
("Safely" in both directions: Without compromising privacy of the DomU and
without compromising host safety / security.)

>> Furthermore cleanup_page_mappings() (called later in the function) has a
>> PV-only aspect which would apparently need widening to PVH Dom0 then,
>> too.
> 
> You are referring to:
> 
>         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
>             rc = iommu_legacy_unmap(d, _dfn(mfn), 1u << PAGE_ORDER_4K);
> 
> is that correct?

Yes, that's what immediately caught my eye. I didn't look carefully whether
there might be more.

>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>>              rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
>>>                                          exch.out.extent_order) ?: rc;
>>>  
>>> -            if ( !paging_mode_translate(d) &&
>>> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
>>>                   __copy_mfn_to_guest_offset(exch.out.extent_start,
>>>                                              (i << out_chunk_order) + j,
>>>                                              mfn) )
>>
>> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
>> it?
> 
> One way or another Dom0 PVH needs to know the MFN to pass it to the
> co-processor.

I see. That's pretty odd, though. I'm then further concerned of the order of
the chunks. At present we're rather lax, in permitting PVH and PV Dom0 the
same upper bound. With both CPU and I/O side translation there is, in
principle, no reason to permit any kind of contiguity. Of course there's a
performance aspect, but that hardly matters in the specific case here. Yet at
the same time, once we expose MFNs, contiguity will start mattering as soon
as any piece of memory needs to be larger than PAGE_SIZE. Which means it will
make tightening of the presently lax handling prone to regressions in this
new behavior you're introducing. What chunk size does the PSP driver require?

One further thought here: Is it really the hardware domain which is most
logical to drive the PSP? Interaction is (just guessing) perhaps needed
primarily when creating / managing guests? Then having the control domain
talk to a driver in the hardware domain would make the overall picture more
complicated.

Jan

