Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4638BA1D64B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 13:57:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877886.1288048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOgF-0007Nb-1f; Mon, 27 Jan 2025 12:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877886.1288048; Mon, 27 Jan 2025 12:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOgE-0007LI-Tg; Mon, 27 Jan 2025 12:57:30 +0000
Received: by outflank-mailman (input) for mailman id 877886;
 Mon, 27 Jan 2025 12:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcOgD-00076M-UT
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 12:57:29 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c924ac-dcae-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 13:57:29 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5da135d3162so7147932a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 04:57:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186d8b2csm5321649a12.76.2025.01.27.04.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 04:57:28 -0800 (PST)
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
X-Inumbo-ID: 43c924ac-dcae-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737982649; x=1738587449; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=375YL9UDa11NDi6dH/k8prBNJ3z5vQKoj3LGrcRAB6I=;
        b=WqB8nWp11/IRqFXKwWyg/di67KaM7o733plNybps/+icjJgnEiPxK7Xy+i5Grf3ZH/
         udT9WVet+vwqKfMfEFj1F0mnzN1sXa5eQyVPXALY7DMFGNluUDTMFxlTxGh/pBybARib
         w6/ornuaqYXCCFT2AksvObWJQubW0tNLIRMOL1KO9yq0Q2MtWUtmvfzf5re18Ihs7c9t
         Xb9GRm1e/bwiFLAzzS68NtUUVC6JNE4boZOEnPghQRz9HBofJgeawcxPuIiYgrdvyv8a
         oSwak14itnJ8IasEK3lsKvqElPLog/AW+/EwVlcn345KQblo67IxKCrAc/rNNr5ueDLM
         FnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982649; x=1738587449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=375YL9UDa11NDi6dH/k8prBNJ3z5vQKoj3LGrcRAB6I=;
        b=Z4LiM9yw3TBm9MjU0auhVDlVAs+GILhPtsJP2gErAdLUl0HiljGCY/xXZl63jUntzZ
         RMERq+cQBgyFEGvYrg/hyj2FmELTe6jFOcIaZEojx+C3cXa+IcHFO5joErQQJAIkuIBG
         C9rGiqoURNzpVCVpFO4rBW6LvEKCAX9P2Gi78xRSJI1vij35IDty6EBrwciRe9TEC14q
         Cm/BsFDgU8U9IMAPSk/OCs+T3Wb3WKqfZvVAgJnbUkrIaqg45XxZpaQi/Sd6IojEzXRc
         TPyJkyMjH5zWVknNT5OV1kGOPnYOx5b4uALQYSIaHTP6qY+oCaxyDXhZzZSH21+UMfWc
         CKLw==
X-Forwarded-Encrypted: i=1; AJvYcCUMdtOORqsmP7sWD35slG7lr7LAH/2NSPSqsOPuayvdUmhvowxxwfdnDOmwgk8+DMPvorQ9xRVwJXc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4T5LXta0cKuz//RxiVmZ0MIXWx78KqXQpttR4ZQi9q6dFY1nj
	wF+a8tP2thzkmmq4rRbfKrNzjOrCPRXvIttYVu8OYR/vxDZLhsLrLrLOsYQaow==
X-Gm-Gg: ASbGncvV0s+uNLzGTkHtzaB5oa8JpwbjOjzX+SAZvoFr0CitG/ABeBsnb3nadlfmyiF
	4aAfpDPpNrSi2/LuZoBhp6aZ9l1Fp5qJ/I1fbZCNJA0Oljpt7Oet1eus+qqJFdrPw+n/M/50UzA
	6Bz9/lteKhGbJRkcMUrm1BXPNrbNeoq8kitsHiSYG08IGelOolzYEu1jV5k3O5D26NEH7cs0qwW
	suJ9eZxL6leHkW4I0RYyqv+YMLn9XjB5RpGGweuCeXLnWBe4zE2VDV4ohAv0jBIecwJCTTwOXQZ
	XkGClqkyIQWY+QmnRAOWecRNsiqQ4oz7y1ZfAUdQ0e5wIyp6zNUHonGIo6ktX+eZ0w==
X-Google-Smtp-Source: AGHT+IGs4WW77xrtSQWyDnSMLPTZ++Iyhpn/ApqEEdHB34tmygdbPNtiBcma3XhHS5gGF34JE1adqA==
X-Received: by 2002:a05:6402:27cc:b0:5d0:b2c8:8d04 with SMTP id 4fb4d7f45d1cf-5db7d3005b5mr41272885a12.18.1737982648562;
        Mon, 27 Jan 2025 04:57:28 -0800 (PST)
Message-ID: <a304e4f0-709f-4fcd-9847-01fe6ab4b98c@suse.com>
Date: Mon, 27 Jan 2025 13:57:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: implement software page table walking
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <00dfc71569bc9971b53e29b36a80e9e020ac61ac.1737391102.git.oleksii.kurochko@gmail.com>
 <21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com>
 <e2290a2a-a3c0-4cfe-b9e9-8cfec0b194a8@gmail.com>
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
In-Reply-To: <e2290a2a-a3c0-4cfe-b9e9-8cfec0b194a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.01.2025 13:29, Oleksii Kurochko wrote:
> On 1/27/25 11:06 AM, Jan Beulich wrote:
>> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>>> RISC-V doesn't have hardware feature to ask MMU to translate
>>> virtual address to physical address ( like Arm has, for example ),
>>> so software page table walking in implemented.
>>>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> ---
>>>   xen/arch/riscv/include/asm/mm.h |  2 ++
>>>   xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>>>   2 files changed, 58 insertions(+)
>>>
>>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>>> index 292aa48fc1..d46018c132 100644
>>> --- a/xen/arch/riscv/include/asm/mm.h
>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>> @@ -15,6 +15,8 @@
>>>   
>>>   extern vaddr_t directmap_virt_start;
>>>   
>>> +paddr_t pt_walk(vaddr_t va);
>> In the longer run, is returning just the PA really going to be sufficient?
>> If not, perhaps say a word on the limitation in the description.
> 
> In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
> as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
> as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
> Anyway, yes, it is still returning a physical address, and that seems enough to me.
> 
> Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?

Often you care about the permissions as well. Sometimes it may even be relevant
to know the (super-)page size of the mapping.

> |[1] 
> https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/mm.c#L820|
> 
>>> +     * initialize `ret` with "impossible" XEN_TABLE_MAP_NOMEM.
>>> +    */
>>> +    int ret = XEN_TABLE_MAP_NOMEM;
>>> +    unsigned int level = HYP_PT_ROOT_LEVEL;
>>> +    paddr_t pa = 0;
>> Seeing 0 as initializer here, just to double check: You do prevent MFN 0
>> to be handed to the page allocator, and you also don't use it "manually"
>> anywhere?
> 
> MFN 0 could be used when removing the page:https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/pt.c?ref_type=heads#L251 <https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/pt.c?ref_type=heads#L251>.
> 
> In that case, it would be better to initialize|pa| with|(paddr_t)(-1)|, as this value couldn't be mapped and is safe to use as an invalid value.
> 
>>
>>> +    pte_t *table;
>>> +
>>> +    DECLARE_OFFSETS(offsets, va);
>>> +
>>> +    table = map_table(root);
>>> +
>>> +    /*
>>> +     * Find `pa` of an entry which corresponds to `va` by iterating for each
>>> +     * page level and checking if the entry points to a next page table or
>>> +     * to a page.
>>> +     *
>>> +     * Two cases are possible:
>>> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was find;
>>> +     *   (Despite of the name) XEN_TABLE_SUPER_PAGE covers 4k mapping too.
>>> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
>>> +     *   mapped.
>>> +     */
>>> +    while ( (ret != XEN_TABLE_MAP_NONE) && (ret != XEN_TABLE_SUPER_PAGE) )
>>> +    {
>>> +        /*
>>> +         * This case shouldn't really occur as it will mean that for table
>>> +         * level 0 a pointer to next page table has been written, but at
>>> +         * level 0 it could be only a pointer to 4k page.
>>> +         */
>>> +        ASSERT(level <= HYP_PT_ROOT_LEVEL);
>>> +
>>> +        ret = pt_next_level(false, &table, offsets[level]);
>>> +        level--;
>>> +    }
>>> +
>>> +    if ( ret == XEN_TABLE_MAP_NONE )
>>> +        dprintk(XENLOG_WARNING, "Is va(%#lx) really mapped?\n", va);
>> Even if it's a dprintk(), I'd recommend against adding such.
>>
>>> +    else if ( ret == XEN_TABLE_SUPER_PAGE )
>>> +        pa = pte_to_paddr(*(table + offsets[level + 1]));
>> Missing "else if ( ret == XEN_TABLE_NORMAL )" (or maybe simply "else")?
> 
> If I am not missing something, we can't be here with ret == XEN_TABLE_NORMAL because we iterating
> in the while loop above until we don't find a leaf or until reach level = 0.

I'll admit that I didn't specifically check whether XEN_TABLE_NORMAL could
be observed here; my point was that non-super-page mappings aren't handled,
as you ...

> If we find a leaf then
> XEN_TABLE_SUPER_PAGE is returned; otherwise sooner or later we should face a case when next table
> (in case when `level`=0 and someone put at this level a pointer to next level, what is a bug) should
> be allocated in pt_next_level(), but it will fail because `alloc_tbl`=false is passed to pt_next_level()
> and thereby ret=XEN_TABLE_MAP_NONE() will be returned.
> 
> Based on your previous comment about dprintk this could could be re-written in the following way:
> -    if ( ret == XEN_TABLE_MAP_NONE )
> -        dprintk(XENLOG_WARNING, "Is va(%#lx) really mapped?\n", va);
> -    else if ( ret == XEN_TABLE_SUPER_PAGE )
> +    if ( ret != XEN_TABLE_MAP_NONE )
>           pa = pte_to_paddr(*(table + offsets[level + 1]));

... appear to confirm here.

Jan

