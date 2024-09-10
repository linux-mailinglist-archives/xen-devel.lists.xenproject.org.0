Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775AD972CB3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795141.1204304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwjg-0005Ye-Mg; Tue, 10 Sep 2024 09:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795141.1204304; Tue, 10 Sep 2024 09:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwjg-0005W4-Ix; Tue, 10 Sep 2024 09:00:32 +0000
Received: by outflank-mailman (input) for mailman id 795141;
 Tue, 10 Sep 2024 09:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snwjf-0005Vy-0i
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:00:31 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 204237cf-6f53-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 11:00:28 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso304762566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:00:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d547e5sm452091766b.201.2024.09.10.02.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 02:00:27 -0700 (PDT)
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
X-Inumbo-ID: 204237cf-6f53-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725958828; x=1726563628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LBeOB+g1IkdYQyntaluXs4j/+SsPCg3DECYrEC7DXpY=;
        b=RkIOG4PO8FTRqDLSvSSh4zWj8p77U9csVbnWjpG0QpN0Pnp61GCr66LSBaFlr/Xepa
         rH3Xh55vMtuP0WaqsgcfROYfm5NSOlHksmRlFeCCtxdQrG1UO4bqb0UdBevQ9NelQNiF
         uQi07xJAoCoN3WPjFX5d7BZu/2TBHUw+YtfgVB/hcigUtaT7jCgk+9fUYrw7k/XxjChV
         GJOiPMWiJ6JG0Ys0NVt5J6LG7A9ERS4x6cpEJINzvzENx1EDoXofNjzVY3iLKLyjNxxk
         5mT0qSeLDUeo3mDa/j/GXzlylu3BEyQfo4bF/McXyg4p+WTKIgjhcGpMdMJiZakACeA6
         C+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725958828; x=1726563628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBeOB+g1IkdYQyntaluXs4j/+SsPCg3DECYrEC7DXpY=;
        b=KOvbxNMImLHRfWqoRhKpfjjPKSq4Lm9ylLbuQO+irKOEBo+gByoiKhBWBIWDz45MkF
         sBSbV/TzgKIsrx9ClFXkqLjxzg+n8WllyPht0nK492pjDQ3CB4JyigRkeN1z4cAT+cHT
         iM0dUNWwCs83v6RbO8Yj/IDOPzqSkZ1WEHYMjQ9vTqZWOAkvyeRWYwdpSwgy+8xFw2n9
         62olyxLyMS0ppfdujk86nu6vRxtsLC3W/7oIBNSOxhgt/8xzBRKDtblU6xdlXhrH93NF
         JYIyKk2PO0zxxDm0OZwgcxFN9y+7snvVnn+pDNAS20FjwXd9BLlHp3fXbpPQTiwaFzAC
         SzpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmeUP2rMYc1trGWytio5LMcjhhEcESMg+YRJG4sArYpJZAgedcMBIla/2ltijQtJQvfyzvbMR1ch4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf7goXspo8Tg9WDduzL/eOzKtC5irRzViyuvynF5CIvHjjLr6b
	Zrr99vUfzPnHJ9up0gq2XKj+wGu7aORqi3iBfa7aiqMCum02yBgVKKgHxneXVg==
X-Google-Smtp-Source: AGHT+IGEi4LYMa4dAXsbyDXsacQZg8o1KgZ1lBI/eRtvo+C+UTEGZ547G5qrkOHSNM6kSqGSXVqZxQ==
X-Received: by 2002:a17:907:7245:b0:a86:ac05:2112 with SMTP id a640c23a62f3a-a8ffad989b4mr4041366b.51.1725958827968;
        Tue, 10 Sep 2024 02:00:27 -0700 (PDT)
Message-ID: <47beeb90-5e90-4997-a49b-1f245a09d013@suse.com>
Date: Tue, 10 Sep 2024 11:00:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] x86/mm: ensure L4 idle_pg_table is not modified
 past boot
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-5-roger.pau@citrix.com>
 <550c6f14-228d-45b4-9146-8d950082b574@suse.com>
 <ZuAJU4ODitZ8VEJV@macbook.local>
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
In-Reply-To: <ZuAJU4ODitZ8VEJV@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 10:54, Roger Pau Monné wrote:
> On Tue, Aug 13, 2024 at 05:54:54PM +0200, Jan Beulich wrote:
>> On 26.07.2024 17:21, Roger Pau Monne wrote:
>>> The idle_pg_table L4 is cloned to create all the other L4 Xen uses, and hence
>>> it shouldn't be modified once further L4 are created.
>>
>> Yes, but the window between moving into SYS_STATE_smp_boot and Dom0 having
>> its initial page tables created is quite large. If the justification was
>> relative to AP bringup, that may be all fine. But when related to cloning,
>> I think that would then truly want keying to there being any non-system
>> domain(s).
> 
> Further changes in this series will add a per-CPU idle page table, and
> hence we need to ensure that by the time APs are started the BSP L4 idle
> page directory is not changed, as otherwise the copies in the APs
> would get out of sync.
> 
> The idle system domain is indeed tied to the idle page talbes, but the
> idle vCPU0 (the BSP) directly uses idle_pg_table (no copying), and
> hence it's fine to allow modifications of the L4 idle page table
> directory up to when APs are started (those will indeed make copies of
> the idle L4.

Which may want at least mentioning in the description then. I take it
that ...

>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -5023,6 +5023,12 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
>>>          mfn_t l3mfn;
>>>          l3_pgentry_t *l3t = alloc_mapped_pagetable(&l3mfn);
>>>  
>>> +        /*
>>> +         * dom0 is build at smp_boot, at which point we already create new L4s
>>> +         * based on idle_pg_table.
>>> +         */

... this comment is then refined by the later patches you refer to?

>>> +        BUG_ON(system_state >= SYS_STATE_smp_boot);
>>
>> Which effectively means most of this function could become __init (e.g. by
>> moving into a helper). We'd then hit the BUG_ON() prior to init_done()
>> destroying the .init.* mappings, and we'd simply #PF afterwards. That's
>> not so much for the space savings in .text, but to document the limited
>> lifetime of the (helper) function directly in its function head.
> 
> IMO the BUG_ON() is clearer to debug,

Fair point - it's indeed a balance between two possible goals. I guess ...

> but I won't mind splitting the
> logic inside the if body into a separate helper.

... simply keep it as you have it.

Jan

