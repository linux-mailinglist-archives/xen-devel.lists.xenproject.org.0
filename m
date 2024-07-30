Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDC6940A34
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 09:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767312.1177919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhbt-00056u-Jk; Tue, 30 Jul 2024 07:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767312.1177919; Tue, 30 Jul 2024 07:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhbt-00054c-Gg; Tue, 30 Jul 2024 07:49:29 +0000
Received: by outflank-mailman (input) for mailman id 767312;
 Tue, 30 Jul 2024 07:49:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYhbr-00054U-NB
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 07:49:27 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e3c6734-4e48-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 09:49:26 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a167b9df7eso6989271a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 00:49:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de90sm605107266b.62.2024.07.30.00.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:49:25 -0700 (PDT)
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
X-Inumbo-ID: 3e3c6734-4e48-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722325766; x=1722930566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rOQgbSmCjqlR4rFbd5QNe0Gi/KMbK02sW2z1r2xQ7+w=;
        b=PSLesPNNmPuWWqfPNEZVU2WEId+8plSTG28XiWiBAjf8yehVaMzqEOnKjG8P/K6NDh
         F2PKYjKhUhqyKgdfoUhdgm+dsnUZDEj/jBPEabixdPxVILgNp68piQK8No022zuPTjgg
         xLTHvRXyxoFmxupBcIY1SLcE8XrZu5cfOlE6hsK3UBbnzR0ee/ChV81m0T64ZnGNHh62
         A2SGOxHPsz05T+t3HkoKYl/GfJpfzFww6w3ToV/BPV09qegj6SuQGvoZSL8UfVFw7Emw
         UFx2kKcML6CTp8EeXTVoFAh63hs4VtzVSFdzUxYH3plNLq05IbgeJd3hs/fvCsfJkbiO
         rlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722325766; x=1722930566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOQgbSmCjqlR4rFbd5QNe0Gi/KMbK02sW2z1r2xQ7+w=;
        b=Rt0The9yxK6Es6NNZwa5s7Hv6Q4XAsLXj8snNllwNQVsMbpiy1t6le28WrzHh2Zmjx
         xspCnRtuYNQ1XWfcX7S3vJwGIAykf3baFRH7AXSer5wCQ17vfC9PBMzkwRQU3fihrcK4
         8BgA3llSO/aosKwIxY7FQzrzSAlmVRrPQb2c2YyshPx/IUZbyXa9oVLKjkUQ5RJV5Bb4
         o03+Fg4nNLPH2Fgz7Bu+WecD0KqUPYreyeOt307Xtrj6RJlTZIl3aWP+Yh0HECpNhwz4
         +7oynPQO211gmPdD0RJKc3b0tgtfFX5P8rLjITpMYBbvlxxiiqLiMC+RzU+EGRlTPWq8
         pPXg==
X-Forwarded-Encrypted: i=1; AJvYcCVsXtB6UX6a+M2P0W7oEGRqFmNpLZr8JddGvTCHQBIjKPU1JuTcsPnLoS4frcWXjhqMe9AqZt+IJXx/SYgBB2E1D2pXZT3ZBM0b0F/w5nM=
X-Gm-Message-State: AOJu0Yx9vmk973o9YpwdxOkWArF2q5wPoYpHDNT2L24rJzinCQ0bHM/M
	/QftZH6dwjHNPtXu+WUt8XZEArZObKPa40Pc6ktzrTLlBVxE/WWGnA15arB0Ug==
X-Google-Smtp-Source: AGHT+IFtLwiD5yKQ/bhFVXkVhMCFbrlFXpRb5RLVBcCn8vK4veuBtXYmZUFy1yPFYBZ9zQDgFZXbGg==
X-Received: by 2002:a17:907:d17:b0:a7a:c256:3cb with SMTP id a640c23a62f3a-a7d400e1442mr680327766b.39.1722325765546;
        Tue, 30 Jul 2024 00:49:25 -0700 (PDT)
Message-ID: <8b8b0304-9f6f-4ded-a451-edc8fdd0e52a@suse.com>
Date: Tue, 30 Jul 2024 09:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
 <28d646ba3d95da2eaf40869e1c07d950a0f3f203.camel@gmail.com>
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
In-Reply-To: <28d646ba3d95da2eaf40869e1c07d950a0f3f203.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2024 18:11, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
>> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>>> @@ -81,6 +82,14 @@ static inline void flush_page_to_ram(unsigned
>>> long mfn, bool sync_icache)
>>>      BUG_ON("unimplemented");
>>>  }
>>>  
>>> +/* Write a pagetable entry. */
>>> +static inline void write_pte(pte_t *p, pte_t pte)
>>> +{
>>> +    RISCV_FENCE(rw, rw);
>>> +    *p = pte;
>>> +    RISCV_FENCE(rw, rw);
>>> +}
>>
>> Why the first of the two fences? 
> To ensure that writes have completed with the old mapping.

Wait: There can certainly be uncompleted writes, but those must have
walked the page tables already, or else a (synchronous) fault could
not be delivered on the originating store instruction. Or am I
misunderstanding how paging (and associated faults) work on RISC-V?

>> And isn't having the 2nd here going
>> to badly affect batch updates of page tables?
> By batch you mean update more then one pte?
> It yes, then it will definitely affect. It could be dropped here but
> could we do something to be sure that someone won't miss to add
> fence/barrier?

Well, imo you first want to spell out where the responsibilities for
fencing lies. Then follow the spelled out rules in all new code you
add.

>>> +     * x is the highest page table level for currect  MMU mode (
>>> for example,
>>> +     * for Sv39 has 3 page tables so the x = 2 (L2 -> L1 -> L0) ).
>>> +     *
>>> +     * In this cycle we want to find L1 page table because as L0
>>> page table
>>> +     * xen_fixmap[] will be used.
>>> +     *
>>> +     * i is defined ( HYP_PT_ROOT_LEVEL - 1 ) becuase pte for L2 (
>>> in
>>> +     * case of Sv39 ) has been recieved above.
>>> +     */
>>> +    for ( i = HYP_PT_ROOT_LEVEL - 1; i != 0; i-- )
>>
>> I think the subtracting of 1 is unhelpful here. Think of another 
>> case where
>> you want to walk down to L0. How would you express that with a
>> similar for()
>> construct. It would imo be more natural to use
>>
>>     for ( i = HYP_PT_ROOT_LEVEL; i > 1; i-- )
> Then the first one _i_ will be initialized as L2, not L1. As an option
> we then have to use ...
>>
>> here (and then in that hypothetical other case
>>
>>     for ( i = HYP_PT_ROOT_LEVEL; i > 0; i-- )
>>
>> ), and then the last part of the comment likely wouldn't be needed
>> either.
>> However, considering ...
>>
>>> +    {
>>> +        BUG_ON(!pte_is_valid(*pte));
>>> +
>>> +        pte = (pte_t *)LOAD_TO_LINK(pte_to_paddr(*pte));
>>> +        pte = &pte[pt_index(i, FIXMAP_ADDR(0))];
>>
>> ... the use of i here, it may instead want to be
> ... should be ( i - 1 ).
> I am okay with such refactoring.

Well, because of this use of i I specifically suggested ...

>>     for ( i = HYP_PT_ROOT_LEVEL; i-- > 1; )

... this.

>>> +    }
>>> +
>>> +    BUG_ON(pte_is_valid(*pte));
>>> +
>>> +    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap),
>>> PTE_TABLE);
>>
>> I'm a little puzzled by the use of LINK_TO_LOAD() (and LOAD_TO_LINK()
>> a
>> little further up) here. Don't you have functioning __pa() and
>> __va()?
> No, they haven't been introduced yet.

So you're building up more technical debt, as the use of said two
constructs really should be limited to very early setup. Aiui once
you have functioning __va() / __pa() the code here would want
changing?

Jan

