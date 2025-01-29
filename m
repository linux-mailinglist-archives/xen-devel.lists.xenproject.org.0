Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC7A21E4B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 15:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879185.1289409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td8dS-0003Dv-HH; Wed, 29 Jan 2025 14:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879185.1289409; Wed, 29 Jan 2025 14:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td8dS-0003CE-Do; Wed, 29 Jan 2025 14:01:42 +0000
Received: by outflank-mailman (input) for mailman id 879185;
 Wed, 29 Jan 2025 14:01:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td8dR-0003C8-7G
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 14:01:41 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fe23039-de49-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 15:01:40 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso704098566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 06:01:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760b76acsm976540766b.113.2025.01.29.06.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 06:01:37 -0800 (PST)
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
X-Inumbo-ID: 8fe23039-de49-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738159299; x=1738764099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bWmxuIdDcUoGMoSCDd043vF/xmOKbmsmzZnKmZep0yE=;
        b=S2VXqnC4bm5k3psKG77Dpq4P8X/HeV7MKB2SVss2qAmI6yjgIe1rGJFLyFzP/rTcyF
         F7V7NF+ydWtJq8MYHa/coMdmy4YCslVNKn260tred+kPDrq5X6GCnR1Z/ivryAUszUGx
         AN2wIZuJLkFWViepn6D0IxzVgieS/6LaoOOjLLdQFKGBDULeiGasS/yjcjW0QtHjHDVk
         5DyfsYNyNIvDtdcWos2Iiv99bpcySR7Bj7JVrgUWSt8lpta5eMjtt7OTCj7LxyVD3nPd
         ZH4upO2rYoAphfhtOtzRUHoOPjCQVErHtCTCtMdZoJDit/8v8HIKILHNH+rm86Xhdry6
         Cj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738159299; x=1738764099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWmxuIdDcUoGMoSCDd043vF/xmOKbmsmzZnKmZep0yE=;
        b=COJwVNzQ16eM6oYzFGdBP18IPrCq03nlCQCvNtbU9xt1v9WNyzyAauGOncenILfMTm
         5Iw92DvL7BRvG72UDC8buXgxwzD0sB7xSRxfZLaRZxDO1NzpP/1S9Wv2ZHpW7vqvv+/5
         faV6DiQP+ZbRKSvb1F79ThrYtl3aXZnHLkFNn+o2tnygWjejXQoPtbdp42NtudsqkYAP
         /QKwz4gHGVtsmHTo/Al/y2qygSNUjyecRVnZwSH8t/sH3RZU93sPuJcTQqDOAqkZUTaA
         BfGJIlfhh4FiPlP9fPibMPbHyTgIsbjpL0yRjCMbZbP1LzpC/Qp2T0HIZl2AW8YPZF+y
         cCuw==
X-Forwarded-Encrypted: i=1; AJvYcCXR8Dkd38oymcAzlOqscftoQLp0WgL85RLZXa7QigChYB5/o351eqEvociXMK9dev77JUfcfGkucvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMXJUtghcYAAduU0L5EW9siWx3CbekNzxkO8AbHc54qeJybFfj
	T/xBbviKt7CCGtKbJKq8I03NB2SlbiSlbSUA7rmbMQZcEFZm0H7n/UW6bXI5Bw==
X-Gm-Gg: ASbGncsXgMclAU0l2eZBaNAj+s3ITbKKzgr2V9zRTS7ywzTvm5vlCRRP+OhnAVZRpQk
	m2b5L/YqbpR9jaV++/5/tuzQf98SpisrfCtOJ3llv4bSNonpoW4NNPYcAok1zU3COQ0Nar5LOzc
	CHn8cA6fv5CyFcSHtCBaTa7s7XoZnY8P5BLP9LHInfEHrtVwiFzdDfvsydDcFGIjFXaYj2nvdEU
	o3J3+6ikoRfDpygkdH0Ecb35kmzt3vQ4YHx9A+47Jv2eJWv+1qbpfqmyMcQb3eSi+06R50UILle
	75PzpRh9G5sDxeN8u8NjRGH0AQdlqoxecKZc5YvISbCLeMQkLjtzSOlQ4JiGXkPF9VV5t1glWAN
	w7ovSOyIhsrQ=
X-Google-Smtp-Source: AGHT+IFb++oHrFIUDn02dTnsu3LizHnJ8Dcflz/4Dogd8gpQS68rYNA0+sKcikF1jg7eoti8SClVsA==
X-Received: by 2002:a17:907:9719:b0:aae:85a9:e2d with SMTP id a640c23a62f3a-ab6cfdd6dccmr302769466b.45.1738159297862;
        Wed, 29 Jan 2025 06:01:37 -0800 (PST)
Message-ID: <47fb2f0f-fb75-4343-8f7c-cf8b27857d67@suse.com>
Date: Wed, 29 Jan 2025 15:01:36 +0100
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
 <a304e4f0-709f-4fcd-9847-01fe6ab4b98c@suse.com>
 <d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com>
 <dfe0c6c5-db4a-4e27-9963-fe1b0c2bf629@suse.com>
 <c602d580-8d62-4fa9-9aa4-37fbd6201fa3@gmail.com>
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
In-Reply-To: <c602d580-8d62-4fa9-9aa4-37fbd6201fa3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2025 14:12, Oleksii Kurochko wrote:
> 
> On 1/28/25 9:14 AM, Jan Beulich wrote:
>> On 27.01.2025 18:22, Oleksii Kurochko wrote:
>>> On 1/27/25 1:57 PM, Jan Beulich wrote:
>>>> On 27.01.2025 13:29, Oleksii Kurochko wrote:
>>>>> On 1/27/25 11:06 AM, Jan Beulich wrote:
>>>>>> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>>>>>>> RISC-V doesn't have hardware feature to ask MMU to translate
>>>>>>> virtual address to physical address ( like Arm has, for example ),
>>>>>>> so software page table walking in implemented.
>>>>>>>
>>>>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>>>> ---
>>>>>>>     xen/arch/riscv/include/asm/mm.h |  2 ++
>>>>>>>     xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>>>>>>>     2 files changed, 58 insertions(+)
>>>>>>>
>>>>>>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>>>>>>> index 292aa48fc1..d46018c132 100644
>>>>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>>>>> @@ -15,6 +15,8 @@
>>>>>>>     
>>>>>>>     extern vaddr_t directmap_virt_start;
>>>>>>>     
>>>>>>> +paddr_t pt_walk(vaddr_t va);
>>>>>> In the longer run, is returning just the PA really going to be sufficient?
>>>>>> If not, perhaps say a word on the limitation in the description.
>>>>> In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
>>>>> as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
>>>>> as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
>>>>> Anyway, yes, it is still returning a physical address, and that seems enough to me.
>>>>>
>>>>> Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?
>>>> Often you care about the permissions as well. Sometimes it may even be relevant
>>>> to know the (super-)page size of the mapping.
>>> Perhaps it would be better to change the prototype to:
>>>     bool pt_walk(vaddr_t va, mfn_t *ret_pa);
>>> or even
>>>     void pt_walk(vaddr_t va, mfn_t *ret_pa);
>>>     In this case,|ret_pa = INVALID_MFN| could serve as a signal that|pt_walk()| failed.
>>> If there's a need to return permissions or (super-)page size in the future, another argument could be added.
>>>
>>> What do you think? Would this approach be better?
>>>
>>> I am also considering returning a structure containing the|mfn| (or|paddr_t|) and adding other properties (such as permissions or
>>> page size) as needed in the future. Both solutions seem more or less equivalent.
>> Imo the most natural thing for a page walking function would be to return the
>> leaf PTE (or the leaf-most not-present [or otherwise "no-access"] one). That
>> would provide (almost) all possible information to the caller. "Almost"
>> because depending on how page walk works, permissions may combine across page
>> table levels. Yet then (see also the "no-access" above) this would also
>> require further input, to specify the context for which the translation is
>> being seeked. For example, the intention to write may want to yield no valid
>> PTE when there are present ones down to the leaf, but effective permissions
>> say "read-only".
> 
> Perhaps returning the leaf PTE could be a really good option.
> 
> I'm not entirely sure I understand what you mean by "leaf-most not-present". Could you please try to explain this moment one more time?
> My expectation was that the function should return an existing leaf PTE (from which "access" rights could be determined)
> or|NULL| to indicate that no leaf PTE was found.

"no leaf PTE" may be for a variety of reasons. Hence why I think returning
the PTE at which the walk stopped (leaf or leaf-most not-present) is likely
best. Such a not-present PTE may, after all, still contain valuable
information; it's not like it has to be all zero.

> Another thing I'm curious about is whether this would be sufficient for determining the level.
> It seems clear that, given a PTE and a virtual address, we could compute:
> |mask = VA | paddr_from_pte(pte)|

What would this value represent? No, from holding a PTE in your hands you
can't determine the level it came from. So yes, ...

> Then, iterating through each level, we could apply and understand on which one level it was mapped:
> |mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)|.
> 
> If I haven't overlooked any other way to calculate the page table level, would it be better to simply add another argument
> to|pt_walk()| to return the level.

... for callers who care doing this might then be necessary (this would be
a pointer parameter, and since I expect many callers wouldn't care about
the level, it likely wants to be permissible to pass in NULL).

Question then is whether it's better to hand back the level or the page
order of the mapping. On x86 we return the latter from P2M lookups, for
example.

Jan

