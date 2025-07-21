Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7A7B0C4F2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 15:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051506.1419844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqLS-00058r-RJ; Mon, 21 Jul 2025 13:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051506.1419844; Mon, 21 Jul 2025 13:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqLS-00056B-OK; Mon, 21 Jul 2025 13:14:18 +0000
Received: by outflank-mailman (input) for mailman id 1051506;
 Mon, 21 Jul 2025 13:14:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udqLQ-000565-Oh
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 13:14:16 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99260166-6634-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 15:14:14 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so3051455f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 06:14:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c84e22bdsm5691417b3a.3.2025.07.21.06.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 06:14:13 -0700 (PDT)
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
X-Inumbo-ID: 99260166-6634-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753103654; x=1753708454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0ihsFw8P+uBdCnibAjm6HN2J6u9kNvnwBysh5CCvQrk=;
        b=IeTr1yJipX9WyV2WPCzGzngU35pvSy7O66OvoSJ9NEtLWFGCb4M1YrAfOIUKvRinkr
         neXDvbzoQo1zLI25l8CvBXMvOLJ7BFwtxPuYk4dAMx12698TNEJlH9Z7KfPU/M5l5ucS
         Ss/tUpq2T1FsTPI0+svW2wqbNrJsUh+CNfmmCA7ejOO+aKNCJxS/BQikRMwa21RMm7iu
         Q7Hunb4BNlDotz3DU2UMjNRnKK1bDX3IPLcWDzkH7oqMqmlohg9oe6CHU7SZ0E6+dzGh
         kLp92CXUiCnqC7/ZI8x8Al3oN5khSbxHdU0yT4OJEPVw04ly/iT21dnqk5+ozy3TxEHP
         1Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103654; x=1753708454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ihsFw8P+uBdCnibAjm6HN2J6u9kNvnwBysh5CCvQrk=;
        b=BD9x8fpomSQyficDQ95JkKEFp94B5lTv6UTctG0Bww6Nqk4A92GbXJ00+p7UmhyrDy
         /G46u4U+JDeQl3kJHDBxn6EvEQLeSFspndoQjrN9j2e953vDubc/SA53Oy4hKPRdFiee
         FUmz/yjfYp3yz0UP/+qW5g0jmKJPzjMc1v7HUnAcn9gd2OBeItcbcBN7JaVi4OIb7oK/
         VFp9DEi2f928dtSev2IcuFd8jhJ1G1JmrMnv0/Cp2QIend82YEGUQLYwrbLbZ1ePV9AD
         avk9sJrW7FOqiHpGSObGLCKdHc9piUY89/NmyYG4mukuDcJncvZC0i2lRurLkgRA/nQV
         6iqg==
X-Forwarded-Encrypted: i=1; AJvYcCU2wSwQOKjOJ2EV54yMVNYA6pXnToFldQAnHncjdIYA0eCjXzm8ML/nsvNklQMnzGE6Mh9rBP9VEj4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzt2RnNW6qf1dBcFwQbkq1iAuUd0mcAz192kOUr8OBTQmAv/Eda
	Le3qJum+zEG1KSJ5WV/ndMxiM/BphPq+hjCi6LWE7EI/eO+kkAykyUk7Xqh61IRmbQ==
X-Gm-Gg: ASbGnctIi7BBF+Sg1QDJsyuSOlBik2LlhXuidwvi8/GJbPzU/Cu2lwaU4Z+dtV5E0As
	0b6CXKJ7tpLp4LnCI890rmIadjuhYrJNPUTCiEva8oyWTJWhrRet/JOm62saSYdhZPYweNgDJ6w
	Rr4H/1X2ZT8HFpWnjF44EV84JS5awwRLPEa48ylrazjuTdESMYO4lm94VyzYpuLqJWSL/20FWdy
	siJK0eixxqMwltVhmpGU3BhFEA0FUyfpu655hmWbrJqEjC/rPD3urShJ39mB7puashkqBI/32OP
	u5TX3Q73snL/wRLtZgTTSyiNbTHetAVLFiysCWIGGHirEtV52BiekXrBXeQs1SBo2XTI9WUxWBr
	sxL47W6psfZrP1TK8K2a5yJntQ/4Uf52JgM8EP2P44zWM3G31HI86FIRYHJddiQBV/YGmaRodoe
	HfOf3DsxE=
X-Google-Smtp-Source: AGHT+IENXi5mgRwA8qPPXmAKuy57kf6/HF0GuDCZ4wLWPPbnKUzvYba1WapFouF7CePzHQFVCuHC9Q==
X-Received: by 2002:a5d:588f:0:b0:3a4:e7d3:bd9c with SMTP id ffacd0b85a97d-3b60e4c9102mr14694036f8f.17.1753103653654;
        Mon, 21 Jul 2025 06:14:13 -0700 (PDT)
Message-ID: <9253e5cd-53ac-4b45-bcfd-e344d3b52e1d@suse.com>
Date: Mon, 21 Jul 2025 15:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] xen/riscv: implement p2m_next_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <cc696a9e4e74233c81f0cbcfd303cee91b8271af.1749555949.git.oleksii.kurochko@gmail.com>
 <1496586d-484c-4e99-aea7-974be335150f@suse.com>
 <b0013513-2646-4de4-a172-0d2ea571a3e8@gmail.com>
 <aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com>
 <d63ab4e1-d98b-4251-a5c7-87bf4688d5bb@gmail.com>
 <b57e5145-8112-4e86-9d0d-fd836039bd26@suse.com>
 <a3beabba-b320-4401-861e-b528309b786d@gmail.com>
 <106fb5b5-937f-480b-82ad-12a0fb972caf@suse.com>
 <cf7ffaba-0a75-41e7-adc9-55613bc311d2@gmail.com>
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
In-Reply-To: <cf7ffaba-0a75-41e7-adc9-55613bc311d2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 13:19, Oleksii Kurochko wrote:
> On 7/17/25 12:37 PM, Jan Beulich wrote:
>> On 17.07.2025 11:42, Oleksii Kurochko wrote:
>>> On 7/16/25 6:12 PM, Jan Beulich wrote:
>>>> On 16.07.2025 17:53, Oleksii Kurochko wrote:
>>>>> In this case, the P2M PTE valid bit will be set to 0, but the P2M PTE type bits
>>>>> will be set to something other than|p2m_invalid| (even for a table entries),
>>>>> so when an MMU fault occurs, we can properly resolve it.
>>>>>
>>>>> So, if the P2M PTE type (what|p2m_is_valid()| checks) is set to|p2m_invalid|, it
>>>>> means that the valid bit (what|pte_is_valid()| checks) should be set to 0, so
>>>>> the P2M PTE is genuinely invalid.
>>>>>
>>>>> It could also be the case that the P2M PTE type isn't|p2m_invalid (and P2M PTE valid will be intentionally set to 0 to have
>>>>> ability to track which pages were accessed for the reason I wrote above)|, and when MMU fault occurs we could
>>>>> properly handle it and set to 1 P2M PTE valid bit to 1...
>>>>>
>>>>>> An intermediate page table entry is something Xen controls entirely. Hence
>>>>>> it has no (guest induced) type.
>>>>> ... And actually it is a reason why it is needed to set a type even for an
>>>>> intermediate page table entry.
>>>>>
>>>>> I hope now it is a lit bit clearer what and why was done.
>>>> Sadly not. I still don't see what use the P2M type in of an intermediate page
>>>> table is going to be. It surely can't reliably describe all of the entries that
>>>> page table holds. Intermediate page tables and leaf pages are just too different
>>>> to share a concept like this, I think. That said, I'll be happy to be shown code
>>>> demonstrating the contrary.
>>> Then it is needed to introduce new p2m_type_t - p2m_table and use it.
>>> Would it be better?
>>>
>>> I still need some type to have ability to distinguish if p2m is valid or not from
>>> p2m management and hardware point of view.
>>> If there is no need for such distinguish why all archs introduce p2m_invalid?
>>> Isn't enough just to use P2M PTE valid bit?
>> At least on x86 we don't tag intermediate page tables with P2M types. For
>> ordinary leaf entries the situation is different, as there may be varying
>> reasons why a PTE has its valid (on x86: present) bit cleared. Hence the
>> type is relevant there, just to know what to do when a page is accessed
>> through such a not-present PTE.
> 
> I think that I got your idea now.
> 
> Does it make sense to have such optimization when we have 2Mb memory range and
> it was mapped using 4k pages instead of 1 super-page, could it be useful to
> invalidate just just page table entry of L1 which corresponds to the start of
> this 2mb memory range, instead of invalidating each entry on L0?
> If it could useful then intermediate page tables should be tagged too. Arm has
> such use cases:
>    https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1286

I don't currently see how that's related to the topic at hand.

Furthermore range-constrained TLB flushing is never at just an address, i.e.
"L1 which corresponds to the start of this 2mb memory range" isn't meaningful
here. It's always a range (typically expressed by address and size), and it
always needs to be the full range that is invalidated. This can be a solitary
low-level flush operation when you know a large page mapping would _not_ be
split. When splitting is done in software or when hardware may split behind
your back, you always need to invalidate the entire range. Or else, in your
example, 4k TLB entries may remain for any but the first page of the 2M
super-page. (Whether such a range can still be done in a single invalidation
operation is a separate question. But I don't see how maintaining the type
at the L1 level would help there.)

Jan

