Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F49B0D8A0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052372.1421000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBaL-0001ao-Nm; Tue, 22 Jul 2025 11:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052372.1421000; Tue, 22 Jul 2025 11:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBaL-0001YR-Kq; Tue, 22 Jul 2025 11:55:05 +0000
Received: by outflank-mailman (input) for mailman id 1052372;
 Tue, 22 Jul 2025 11:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueBaK-0001YL-Al
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:55:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b35ae4c6-66f2-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 13:55:02 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so2487934f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 04:55:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6efb69sm74494855ad.195.2025.07.22.04.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 04:55:01 -0700 (PDT)
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
X-Inumbo-ID: b35ae4c6-66f2-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753185302; x=1753790102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T9PvsqFX5Qbc6Fq3ES7zxjqxjTgWifyoI2ZYj9+qJU8=;
        b=aCLGcvTU6S7PsXnFWICa5spl7nYgT2yP/g6L6KEjr9GJtm7gGX7lwWFxh2X/IFQLpV
         OlyNBblU+LeCQU67alQfrNTVqar1/dT65bjBg2l84MKbaD04Fm/RlWvb330lkKML0ONU
         WZ+A2YhVBFiTXARABibL58yj+JQoIGOpD1UVg7rqZ2mfsCY+vool5Cezhu8WnwQnKXDH
         xHfWqQgKHB+7ecNUNEA05sRCA+NkImR8PJXrTO5TKU+uZXkvHpWc9yMRj5CXUA7NPVBZ
         XcUh+5mMMfp7boFdWSsovbGPN2E2cxUN5RswTQ24maEnfri77eQbD3eUd5eIJBXoi+Lv
         jNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753185302; x=1753790102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9PvsqFX5Qbc6Fq3ES7zxjqxjTgWifyoI2ZYj9+qJU8=;
        b=LOn8lMfIO+Qs1GxugQoxTcRFBPBAuLYLfsJ2aRpc/5m41FZ0EsUY5VThB3WiZ5Uz+g
         Hb0A2CazbzhE8XUvCmdwVx0Ml3nnrXahB5Y6j6mwBeo77G3iuiTsK+UScLkuggTXredn
         g9mVetDvUkZEFklsOfDI9upYymRXclU9Uw8gmACfD3fzmz8+LB7U6uoVzzgdYWpy+l6t
         1SANp8W5i7WdvSoRTY9Wl8lR1evLAJQ4EeBHpJ9bpHVTf1GNFiLZWrk6/vS9rr7Ek8ue
         hSD5UD3OEAzyqPv2HnLlDtxffJZOtRs4420Q+rTI2qfE1t1O7IV6YuK/aMijT6b+xbTJ
         Qang==
X-Forwarded-Encrypted: i=1; AJvYcCUAbtxo5RO1R8tqI/+j2k6OuAviTUBtm3tbJOkIOJE9/rbyUPxUo3iVWpvP/cogDeWNdMMvzB1a0s4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi4ofJst3WM7EqZBK1VUaLPBo5TCngeyv/4aulFhq+7QQ/OaxE
	q7v03dhR56EAAilgvuqPo7V4aAK6DyZ/SSeLHXHWMzquyVdZJ+vTTM2U+MdiZipLdg==
X-Gm-Gg: ASbGncuUT4I5C/xdoiDND0k8s3/RIFbQiLCcZMB6QskwXjn7fulk46uU3EAcaKQhK2S
	DffmAlImypTYaAvIr8ERgL1uK2CRAKWcAm1IzBfiyOFcNM887gU8ZNKPeAxzQSKWm0HvhQ9nJpX
	UBy5khQdhiVqPiTvDbsgkhJ6mlGf5lG7ZZwcTusqlkMinfZXEfEwa70ieeC0DR34xIErWTwkR55
	WumZJy4UcAXweYc0gO/GS/6DwIDmzh7uCx9MSgtC0HA4SvFVnzmhuCHzkP5loL6qJ6dKM351DfS
	1CrZEAOJ8CiEOcZNi8bGnax4Pg8NN3P3FHtGvwe53OkBCQDNmC08WwbCwhxWYTfCay9R0GlxLD/
	pLWqpCAZcU83fE8micC/FAYPmy5zBqGl5ksg5pqaA2kjs46c+ZfeekgPL28BsYj/ERIpyKjISd7
	zJlAkvz8s=
X-Google-Smtp-Source: AGHT+IEzLokeNcWmhEZvujvHbS6EmqwUmkpY1A7wT3RRZDD83phPqOJoyaYLEqIhA7lUGw4hJvGcMQ==
X-Received: by 2002:a5d:64ee:0:b0:3aa:c9a8:a387 with SMTP id ffacd0b85a97d-3b60e446e70mr17992266f8f.0.1753185302025;
        Tue, 22 Jul 2025 04:55:02 -0700 (PDT)
Message-ID: <f63d8ec0-6ff4-4276-a9d6-631dde1dda0f@suse.com>
Date: Tue, 22 Jul 2025 13:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
 <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>
 <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
 <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>
 <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
 <15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com>
 <958ae1b0-d139-41e8-b965-43ce640569c5@gmail.com>
 <007654f3-e26b-43b1-bc81-40ba25c9d787@suse.com>
 <ca3467a2-c795-4709-ad92-1744b138a148@gmail.com>
 <9e9c1943-b2af-471f-b8c9-f7179073ef99@suse.com>
 <fb7176a2-740e-4773-b1cb-3cd430d6f838@gmail.com>
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
In-Reply-To: <fb7176a2-740e-4773-b1cb-3cd430d6f838@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2025 12:41, Oleksii Kurochko wrote:
> On 7/21/25 2:18 PM, Jan Beulich wrote:
>> On 18.07.2025 11:52, Oleksii Kurochko wrote:
>>> On 7/17/25 12:25 PM, Jan Beulich wrote:
>>>> On 17.07.2025 10:56, Oleksii Kurochko wrote:
>>>>> On 7/16/25 6:18 PM, Jan Beulich wrote:
>>>>>> On 16.07.2025 18:07, Oleksii Kurochko wrote:
>>>>>>> On 7/16/25 1:31 PM, Jan Beulich wrote:
>>>>>>>> On 15.07.2025 16:47, Oleksii Kurochko wrote:
>>>>>>>>> On 7/1/25 5:08 PM, Jan Beulich wrote:
>>>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>>>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>>>>>>>>>           return __map_domain_page(p2m->root + root_table_indx);
>>>>>>>>>>>       }
>>>>>>>>>>>       
>>>>>>>>>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>>>>>>>>>> See comments on the earlier patch regarding naming.
>>>>>>>>>>
>>>>>>>>>>> +{
>>>>>>>>>>> +    int rc;
>>>>>>>>>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>>>>>>>>>> How does this work, when you record GFNs only for Xenheap pages?
>>>>>>>>> I think I don't understand what is an issue. Could you please provide
>>>>>>>>> some extra details?
>>>>>>>> Counter question: The mfn_to_gfn() you currently have is only a stub. It only
>>>>>>>> works for 1:1 mapped domains. Can you show me the eventual final implementation
>>>>>>>> of the function, making it possible to use it here?
>>>>>>> At the moment, I planned to support only 1:1 mapped domains, so it is final
>>>>>>> implementation.
>>>>>> Isn't that on overly severe limitation?
>>>>> I wouldn't say that it's a severe limitation, as it's just a matter of how
>>>>> |mfn_to_gfn()| is implemented. When non-1:1 mapped domains are supported,
>>>>> |mfn_to_gfn()| can be implemented differently, while the code where it’s called
>>>>> will likely remain unchanged.
>>>>>
>>>>> What I meant in my reply is that, for the current state and current limitations,
>>>>> this is the final implementation of|mfn_to_gfn()|. But that doesn't mean I don't
>>>>> see the value in, or the need for, non-1:1 mapped domains—it's just that this
>>>>> limitation simplifies development at the current stage of the RISC-V port.
>>>> Simplification is fine in some cases, but not supporting the "normal" way of
>>>> domain construction looks like a pretty odd restriction. I'm also curious
>>>> how you envision to implement mfn_to_gfn() then, suitable for generic use like
>>>> the one here. Imo, current limitation or not, you simply want to avoid use of
>>>> that function outside of the special gnttab case.
>>>>
>>>>>>>>>> In this context (not sure if I asked before): With this use of a radix tree,
>>>>>>>>>> how do you intend to bound the amount of memory that a domain can use, by
>>>>>>>>>> making Xen insert very many entries?
>>>>>>>>> I didn’t think about that. I assumed it would be enough to set the amount of
>>>>>>>>> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
>>>>>>>>> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
>>>>>>>> Which would require these allocations to come from that pool.
>>>>>>> Yes, and it is true only for non-hardware domains with the current implementation.
>>>>>> ???
>>>>> I meant that pool is used now only for non-hardware domains at the moment.
>>>> And how does this matter here? The memory required for the radix tree doesn't
>>>> come from that pool anyway.
>>> I thought that is possible to do that somehow, but looking at a code of
>>> radix-tree.c it seems like the only one way to allocate memroy for the radix
>>> tree isradix_tree_node_alloc() -> xzalloc(struct rcu_node).
>>>
>>> Then it is needed to introduce radix_tree_node_allocate(domain)
>> That would be a possibility, but you may have seen that less than half a
>> year ago we got rid of something along these lines. So it would require
>> some pretty good justification to re-introduce.
>>
>>> or radix tree
>>> can't be used at all for mentioned in the previous replies security reason, no?
>> (Very) careful use may still be possible. But the downside of using this
>> (potentially long lookup times) would always remain.
> 
> Could you please clarify what do you mean here by "(Very) careful"?
> I thought about an introduction of an amount of possible keys in radix tree and if this amount
> is 0 then stop domain. And it is also unclear what should be a value for this amount.
> Probably, you have better idea.

I had no particular idea in mind. I said "(very) careful" merely to clarify
that whatever model is chosen, it would need to satisfy certain needs.

Jan

