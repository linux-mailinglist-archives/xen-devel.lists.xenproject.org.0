Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE88AB32D1
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981031.1367420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPEd-0002sT-9p; Mon, 12 May 2025 09:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981031.1367420; Mon, 12 May 2025 09:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPEd-0002qa-77; Mon, 12 May 2025 09:14:07 +0000
Received: by outflank-mailman (input) for mailman id 981031;
 Mon, 12 May 2025 09:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEPEb-0002qU-J4
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:14:05 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 730f128c-2f11-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 11:14:04 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5f7ec0e4978so94407a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:14:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe943484e6sm876934a12.24.2025.05.12.02.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 02:14:03 -0700 (PDT)
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
X-Inumbo-ID: 730f128c-2f11-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747041243; x=1747646043; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4c1GrDbSXgB72qeN8UrJP66xKQdIF/Qr+phQ+gqlv0k=;
        b=ctVenXGvL4/B2i2voFpbdBJPk+oHtczgBwRHEtUNFAgagGiRKhJQGtxCGmrR/TcGDz
         pNcfkFQ4oE/dDpgqwidsD7tDqctcQ1XQ3kLe2bwMkzXxtb1AUiElXIZnZozRoMXAQOdZ
         k5W3H8p2HGwy2LofbflkvB2ngsupZSLDHQ2pvc5J9adjKOt8UHNMMrTmqysjr1x7ZJHx
         3gGG3yIr2RMZCxjtcQARopm2Ekh1fkFoY0mZpFg5P33FkkIdFLiJzekyEfidP1/DEGz/
         v3fkrij1ItAFdKfZhsSrunDRonu6AdvoqMWoCh8T0IewLk0lPr14t/nNYeRGPuPuuh1i
         ydPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747041243; x=1747646043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4c1GrDbSXgB72qeN8UrJP66xKQdIF/Qr+phQ+gqlv0k=;
        b=qfOevqlwiN9T2XSqayy/uue2sQya8679aLIDjEBzvmH97uo9Cm8x3nMK4uv/HLXQjP
         QMFb4bY5E+9e/FLnwBCeEnUnrgUWKgFxucHjnV+gMqVOtSXF34CLi8Obv7OBO+O/KtFl
         NZ5b9wjIgzQZQHyssZ+YI8TAcsBjQ8NwsyTDFxrwElhpqpkv1XuccBM7yZAx7Cl22aX2
         WBx+AjGFIWJFiTxtpd7/5sqq/AFxhES48OQ6ultStrJCS4G+a73AUFrTHWDVl8VCMTQ8
         hpgoRtD+m/CIFYRuDqujUd85qaMyhDgW/2XUwU1LkCn3UaGu9MLc6UDbCptUS675Lw35
         KFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLNEF+MJVjBI/pwjSKEhrW9YuDrW/iYPKoGraSOodPxl8U+znFdGylaRWOegdIFXxVk23k2ClnFvA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu2BO0JiHtU2o5G5+OZBfr7o2J06Wkqn3A2N8G58G6EjCsqOB/
	EqiBiS6lJW09FP/ulTHYH4aVnhxfyQvuizr/94h9dnS2NDsDMvuEHibigNUJGQ==
X-Gm-Gg: ASbGncuSfqOMAAs0BEBr5lW1ajkqJTs3Qt+p8GCdOLhgpAMtBU2rQ+fO8dePXyt9mNL
	V6UEfX44kNfvE/zJhIsMl3gvY8lIs+XKGT0JgOm5CTl7tH6eGH7AqlYzt7GShjjXAhC7U4Ww0vG
	R0yJCZ3FK3BbsfRZgc0U2U9yoeI9ECq4EaqVgrA3KE+YVDgILPUdoUbxMP/y/LKbOT6Z/lobHTj
	MFNHNuEZsT2BVmmB+VdaUuIqW02b8YCD4V96+380p7kfLmErBLHLUNK5ago8pMZhC/a4IA3g2p7
	bYyJhtfsGqM9Ch4E/44LomC3KyElK0e3GyQCeLJbMBW0kwCgzWELhj/xOZEuT/rgXdIR437CmuX
	GdKW/iQe+Tg8s8cv5TlgrI2ZyTQHDWmxoYrjA
X-Google-Smtp-Source: AGHT+IE18TZshNNsvq9zIZfNo173KX3nov+MisGnA1oe3hqD8symAjmY/JBNqVw84E/3ucMouB6TzA==
X-Received: by 2002:a05:6402:2b91:b0:5fc:6f12:b5db with SMTP id 4fb4d7f45d1cf-5fca0759ae1mr9307543a12.11.1747041243507;
        Mon, 12 May 2025 02:14:03 -0700 (PDT)
Message-ID: <f5074258-6520-4549-a639-ba483099b3f8@suse.com>
Date: Mon, 12 May 2025 11:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, agarciav@amd.com,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
 <alpine.DEB.2.22.394.2504291425320.3879245@ubuntu-linux-20-04-desktop>
 <59bfc389-66c8-4d0f-92e3-c0079a807374@suse.com>
 <aBHUJjQk248aLi68@macbook.lan>
 <alpine.DEB.2.22.394.2504301715300.3879245@ubuntu-linux-20-04-desktop>
 <3e7b4b20-0127-4db2-806d-f142547f275a@amd.com>
 <773170d1-d8ba-4ba7-90b0-df0d160d8ba8@suse.com>
 <alpine.DEB.2.22.394.2505020948380.3879245@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2505020948380.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.05.2025 18:49, Stefano Stabellini wrote:
> On Fri, 2 May 2025, Jan Beulich wrote:
>> On 01.05.2025 15:44, Jason Andryuk wrote:
>>> On 2025-04-30 20:19, Stefano Stabellini wrote:
>>>> On Wed, 30 Apr 2025, Roger Pau Monné wrote:
>>>>> On Wed, Apr 30, 2025 at 08:27:55AM +0200, Jan Beulich wrote:
>>>>>> On 29.04.2025 23:52, Stefano Stabellini wrote:
>>>>>>> On Tue, 29 Apr 2025, Jan Beulich wrote:
>>>>>>>> On 28.04.2025 22:00, Stefano Stabellini wrote:
>>>>>>>>> On Mon, 28 Apr 2025, Jan Beulich wrote:
>>>>>>>>>> On 25.04.2025 22:19, Stefano Stabellini wrote:
>>>
>>>>>>>>>>> --- a/xen/common/memory.c
>>>>>>>>>>> +++ b/xen/common/memory.c
>>>>>>>>>>> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>>>>>>>>>>               rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
>>>>>>>>>>>                                           exch.out.extent_order) ?: rc;
>>>>>>>>>>>   
>>>>>>>>>>> -            if ( !paging_mode_translate(d) &&
>>>>>>>>>>> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
>>>>>>>>>>>                    __copy_mfn_to_guest_offset(exch.out.extent_start,
>>>>>>>>>>>                                               (i << out_chunk_order) + j,
>>>>>>>>>>>                                               mfn) )
>>>>>>>>>>
>>>>>>>>>> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
>>>>>>>>>> it?
>>>>>>>>>
>>>>>>>>> One way or another Dom0 PVH needs to know the MFN to pass it to the
>>>>>>>>> co-processor.
>>>>>>>>
>>>>>>>> I see. That's pretty odd, though. I'm then further concerned of the order of
>>>>>>>> the chunks. At present we're rather lax, in permitting PVH and PV Dom0 the
>>>>>>>> same upper bound. With both CPU and I/O side translation there is, in
>>>>>>>> principle, no reason to permit any kind of contiguity. Of course there's a
>>>>>>>> performance aspect, but that hardly matters in the specific case here. Yet at
>>>>>>>> the same time, once we expose MFNs, contiguity will start mattering as soon
>>>>>>>> as any piece of memory needs to be larger than PAGE_SIZE. Which means it will
>>>>>>>> make tightening of the presently lax handling prone to regressions in this
>>>>>>>> new behavior you're introducing. What chunk size does the PSP driver require?
>>>>>>>
>>>>>>> I don't know. The memory returned by XENMEM_exchange is contiguous,
>>>>>>> right? Are you worried that Xen cannot allocate the requested amount of
>>>>>>> memory contiguously?
>>>
>>> In the case I looked at, it is 8 pages.  The driver defines a ring of 32 
>>> * 1k entries.  I'm not sure if there are other paths or device versions 
>>> where it might differ.
>>
>> As per this ...
>>
>>>>>> That would be Dom0's problem then. But really for a translated guest the
>>>>>> exchanged chunks being contiguous shouldn't matter, correctness-wise. That is,
>>>>>> within Xen, rather than failing a request, we could choose to retry using
>>>>>> discontiguous chunks (contiguous only in GFN space). Such an (afaict)
>>>>>> otherwise correct change would break your use case, as it would invalidate the
>>>>>> MFN information passed back. (This fallback approach would similarly apply to
>>>>>> other related mem-ops. It's just that during domain creation the tool stack
>>>>>> has its own fallback, so it may not be of much use right now.)
>>>>>
>>>>> I think the description in the public header needs to be expanded to
>>>>> specify what the XENMEM_exchange does for translated guests, and
>>>>> clearly write down that the underlying MFNs for the exchanged region
>>>>> will be contiguous.  Possibly a new XENMEMF_ flag needs to be added to
>>>>> request contiguous physical memory for the new range.
>>>>>
>>>>> Sadly this also has the side effect of quite likely shattering
>>>>> superpages for dom0 EPT/NPT, which will result in decreased dom0
>>>>> performance.
>>>
>>> Yes, this appears to happen as memory_exchange seems to always replace 
>>> the pages.  I tested returning the existing MFNs if they are already 
>>> contiguous since that was sufficient for this driver.  It worked, but it 
>>> was messy.  A big loop to copy in the GFN array and check contiguity 
>>> which duplicated much of the real loop.
>>
>> ... there may not be a need for the output range to be contiguous? In which
>> case - wouldn't a simple "give me the MFN for this GFN" hypercall do? I seem
>> to vaguely recall that we even had one, long ago; it was purged because of
>> it violating the "no MFNs exposed" principle (and because it not having had
>> any use [anymore]). XENMEM_translate_gpfn_list looks like is what I mean;
>> see commit 2d2f7977a052.
> 
> Unfortunately I don't think that would work because I am pretty sure
> that the PSP needs a consecutive range. In other words, I think the
> output needs to be contiguous.

Hmm, higher up (context) you said "ring of 32 * 1k entries". That reads like
independent 1k areas, and hence no need for contiguity.

Jan

