Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CACFC62FF6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 09:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163509.1490605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKv2E-00034r-Bd; Mon, 17 Nov 2025 08:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163509.1490605; Mon, 17 Nov 2025 08:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKv2E-00033Q-8r; Mon, 17 Nov 2025 08:56:30 +0000
Received: by outflank-mailman (input) for mailman id 1163509;
 Mon, 17 Nov 2025 08:56:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKv2C-00033J-UK
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 08:56:28 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d59f07b-c393-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 09:56:27 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b728a43e410so661538666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 00:56:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73718fec4csm709580966b.39.2025.11.17.00.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 00:56:26 -0800 (PST)
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
X-Inumbo-ID: 4d59f07b-c393-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763369787; x=1763974587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=axwBTnzXJTF9m0khDEA0BIuhtDC6t2zEDodGkwCq+dc=;
        b=Bbrn4A0LAiDCXjIX859zR9bebJmQyvJcTXZKwuwsGfU+YKCZzR2Ozd3SjVV3Jy/GNm
         YTgUctETfcbSz/0DXihPk0lBC5EZFxskHoppT6OiRwGpWXyS3JeWirOX80B/dWWXGSsy
         Kautw3ybdRDFSf0G7PRsUiniA6xlCsZJpz0VnGTo3yzTT7aJAeUaLW3xs5A68Jt8hO9H
         u++Lm4zFzIESCCzPaQfj2fCLXA90vLhMcGNrJzgKZNJWnBNWrbv1owlEXT/BVPdsNoj2
         ku4NKJiOnOYhl8PIXLf9PbBRdR6l2EPrejzBNZFoDs5zJiUl+AvOc+ljoio0RtOnv5Ht
         F0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763369787; x=1763974587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axwBTnzXJTF9m0khDEA0BIuhtDC6t2zEDodGkwCq+dc=;
        b=icCOfrqIn/y4xPRkUz8HVgVdSF7ssB0z9uItcqNyBzkezhQa87LM+13etB1YXDDGcU
         ZmsSnpf2wf3/wonrYxuGuyGtqBVLG35dhuMJX8FUL2tpQabOiHG8GsddxNBcUv9WeKOY
         OS6o7AATXKplXTMMq7ALM3p9q9vXuSWU/QEWxQH4Fg4QXiOsoWnJXLGiscAUBkzu1xoz
         3XV1fbjjfxOB6adgr0hlT1ZkzKzFXdpkioEBrHUPKRLsLg9qFERzm37LsvhzJMAgywsV
         oJp+rbWV1bBJNLB62uBYhiWVf3CpDoR0wRipFvcJtGhFiF6AfZFoudDdHR0U81xrYYIS
         44ew==
X-Forwarded-Encrypted: i=1; AJvYcCV0owjlTMBmC6irKeO1aAbWITqfjzHeQ3rJJu3NI1/ckFAa3ZfWzPh6TXoqC9Ie6l4fahQ8/eiRLsM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzi4COGnk+Fsi5DgPk8UZlo/Puhs+4jJPj0JdkCVrzTSpImu75F
	Fch5Dbd//zup2C+c/AUZWrx9alWn+/PA746l5aiXMG8IAZQBFYeIyyUVtzA6egnWQQ==
X-Gm-Gg: ASbGnctX7EiqNhkzHKpOj8tlksgR3DkGhzt9p0K0W81zFJAoDc8wK3BU33itkcNjXNI
	ydxTdNsnvDg1eOIqPMsLw1/D1t0BgmBHtQm+0Wp6hsXvGUgAPVy1s6/W2cxC3//Sn1YaPskHF0W
	LMhe1ZmV00f+dH748HBsk10F4zqHIf/RV8j10LqTnhwefqyZbCVmYTpGYLvMt0PCH+CogIxWJe4
	WmChJbBGkh9UNaqEYgb5NFhrFGQVy9BY5IaEbwQ7bctbO6a0Z7sHNbn2Hmc55X7feWiFa+yjE6n
	640Edc8M4E0yhy38KKOmt0QtmOtxedzUqEqDpqxFCZJVR0O4ykjViEh8bWb2pi8SfMlGk1kvdqL
	+Cw2YLWXGzM+X05Swa+W+z17FklIIwuGjEWKcqhv9Xz7rMCefxAYF4h/jaX2hv9juYse/B8prPj
	N4Oo/rbPvuhiVorPt5rkKeuxjgkG0KHicck8N+bBPx92ym3rWqQW97I73ms3Sm/5lt
X-Google-Smtp-Source: AGHT+IHgMPYwBGJw/4nkNbcaoiFH1pVRnH9os8z5ozUJ8yPYfFcCVL+nd+tS75FSjbF9iUFUwQaolg==
X-Received: by 2002:a17:907:6e90:b0:b70:ae6a:5fdb with SMTP id a640c23a62f3a-b7367bc46b0mr1090580566b.45.1763369786986;
        Mon, 17 Nov 2025 00:56:26 -0800 (PST)
Message-ID: <31c69c86-46ba-4670-b265-10baa0001f85@suse.com>
Date: Mon, 17 Nov 2025 09:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 10/18] xen/riscv: implement p2m_set_range()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d689c48582505b0dab6896b414d01d844d834bd5.1760974017.git.oleksii.kurochko@gmail.com>
 <cfe9da20-5680-4f42-92f6-f46350811380@suse.com>
 <3fc28006-4a03-4d95-8db3-71a7b3131f82@gmail.com>
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
In-Reply-To: <3fc28006-4a03-4d95-8db3-71a7b3131f82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.11.2025 18:04, Oleksii Kurochko wrote:
> On 11/10/25 3:53 PM, Jan Beulich wrote:
>> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>>> +#define GFN_MASK(lvl) (P2M_PAGETABLE_ENTRIES(lvl) - 1UL)
>> If I'm not mistaken, this is a mask with the low 10 or 12 bits set.
> 
> I'm not sure I fully understand you here. With the current implementation,
> it returns a bitmask that corresponds to the number of index bits used
> at each level. So, if|P2M_ROOT_LEVEL = 2|, then:
>    |G||FN_MASK(0) = 0x1ff| (9-bit GFN for the level 0)
>    |GFN_MASK(1) = 0x1ff| (9-bit GFN width for level 1)
>    |GFN_MASK(2) = 0x7ff| (11-bit GFN width for level 2)

Oh, sorry, 9 and 11 bits is what I meant.

> Or do you mean that GFN_MASK(lvl) should return something like this:
>    |G||FN_MASK_(0) = 0x1FF000 (0x1ff << 0xc) GFN_MASK_(1) = 0x3FE00000 
> (GFN_MASK_(0)<<9) GFN_MASK_(2) = 0x1FFC0000000 (GFN_MASK_(1)<<9 + extra 
> 2 bits)

Yes.

> And then here ...|
> 
>> That's not really something you can apply to a GFN, unlike the name
>> suggests.
> 
> That is why virtual address should be properly shifted before, something
> like it is done in calc_offset():

Please can we stop calling guest physical addresses "virtual address"?

>    (va >> P2M_LEVEL_SHIFT(lvl)) & GFN_MASK(lvl);
> 
> ...
>   (va & GFN_MASK_(lvl)) >> P2M_LEVEL_SHIFT(lvl) ?
> In this option more shifts will be needed.

It's okay to try to limit the number of shifts needed, but the macros need
naming accordingly.

> Would it be better to just rename GFN_MASK() to P2M_PT_INDEX_MASK()? Or,
> maybe, even just P2M_INDEX_MASK().

Perhaps. I would recommend though that you take a looks at other ports'
naming. In x86, for example, we have l<N>_table_offset().

>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -9,6 +9,7 @@
>>>   #include <xen/rwlock.h>
>>>   #include <xen/sched.h>
>>>   #include <xen/sections.h>
>>> +#include <xen/xvmalloc.h>
>>>   
>>>   #include <asm/csr.h>
>>>   #include <asm/flushtlb.h>
>>> @@ -17,6 +18,43 @@
>>>   #include <asm/vmid.h>
>>>   
>>>   unsigned char __ro_after_init gstage_mode;
>>> +unsigned int __ro_after_init gstage_root_level;
>> Like for mode, I'm unconvinced of this being a global (and not per-P2M /
>> per-domain).
> 
> The question is then if we really will (or want to) have cases when gstage
> mode will be different per-domain/per-p2m?

Can you explain to me why you think we wouldn't want that, sooner or later?

>>> +/*
>>> + * The P2M root page table is extended by 2 bits, making its size 16KB
>>> + * (instead of 4KB for non-root page tables). Therefore, P2M root page
>>> + * is allocated as four consecutive 4KB pages (since alloc_domheap_pages()
>>> + * only allocates 4KB pages).
>>> + */
>>> +#define ENTRIES_PER_ROOT_PAGE \
>>> +    (P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL) / P2M_ROOT_ORDER)
>>> +
>>> +static inline unsigned int calc_offset(unsigned int lvl, vaddr_t va)
>> Where would a vaddr_t come from here? Your input are guest-physical addresses,
>> if I'm not mistaken.
> 
> You are right. Would it be right to 'paddr_t gpa' here? Or paddr_t is supposed to use
> only with machine physical address?

In x86 we use paddr_t in such cases. Arm iirc additionally has gaddr_t.

>>> +#define P2M_MAX_ROOT_LEVEL 4
>>> +
>>> +#define P2M_DECLARE_OFFSETS(var, addr) \
>>> +    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1};\
>>> +    for ( unsigned int i = 0; i <= gstage_root_level; i++ ) \
>>> +        var[i] = calc_offset(i, addr);
>> This surely is more than just "declare", and it's dealing with all levels no
>> matter whether you actually will use all offsets.
> 
> I will rename|P2M_DECLARE_OFFSETS| to|P2M_BUILD_LEVEL_OFFSETS()|.
> 
> But how can I know which offset I will actually need to use?
> If we take the following loop as an example:
>    |for( level = P2M_ROOT_LEVEL; level > target; level-- ) { ||/* ||* Don't try to allocate intermediate page tables if the mapping ||* is about to be removed. ||*/ ||rc = p2m_next_level(p2m, !removing_mapping, ||level, &table, offsets[level]); ||... ||} |It walks from|P2M_ROOT_LEVEL| down to|target|, where|target| is determined at runtime.
> 
> If you mean that, for example, when the G-stage mode is Sv39, there is no need to allocate
> an array with 4 entries (or 5 entries if we consider Sv57, so P2M_MAX_ROOT_LEVEL should be
> updated), because Sv39 only uses 3 page table levels — then yes, in theory it could be
> smaller. But I don't think it is a real issue if the|offsets[]| array on the stack has a
> few extra unused entries.
> 
> If preferred, Icould allocate the array dynamically based on|gstage_root_level|.
> Would that be better?

Having a few unused entries isn't a big deal imo. What I'm not happy with here is
that you may _initialize_ more entries than actually needed. I have no good
suggestion within the conceptual framework you use for page walking (the same
issue iirc exists in host page table walks, just that the calculations there are
cheaper).

Jan

