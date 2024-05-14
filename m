Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA98D8C4EBB
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 12:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721361.1124744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6p4d-0002oX-M8; Tue, 14 May 2024 10:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721361.1124744; Tue, 14 May 2024 10:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6p4d-0002mv-JS; Tue, 14 May 2024 10:07:55 +0000
Received: by outflank-mailman (input) for mailman id 721361;
 Tue, 14 May 2024 10:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6p4c-0002mp-L0
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 10:07:54 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4159e9c-11d9-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 12:07:53 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a5a5cb0e6b7so571168666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 03:07:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea65c0sm7214879a12.10.2024.05.14.03.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 03:07:52 -0700 (PDT)
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
X-Inumbo-ID: d4159e9c-11d9-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715681273; x=1716286073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ko3+Cad/ujOuVIZA7Ewbl9fV2GOO1z2XD5xu5aGCeXQ=;
        b=Yx1sBizinAZuU1QROeFO/S09iCOMy8l1bWytDrRhmDi7sOq+6Y2+oZio0BhtZn1GaT
         9MEC5Pn8w72qI6gUeUztVoSKOMdO3Uz0WT2xJiaTGmPfUy+tMaYc5TWWt9xo1Y/mBg/N
         iKLG/9Tfl3nzAMhlnVOTwgy+dVtWscXrFHpEvN3rEYUd6krXcHp+mTZv44K/VM17nlNc
         lSTWSNjwXu46NBQA4x7xln9F8TpF7j/P9J6oX5rm4v3B8k8UhCGgZMrKnaHj2Lq2j1QO
         niTBch0rJnBQRF1HwCy6mywx+R4nUycfKyyeZU11+787134rfL9BVdqEuE/s4WqD78OR
         CSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715681273; x=1716286073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ko3+Cad/ujOuVIZA7Ewbl9fV2GOO1z2XD5xu5aGCeXQ=;
        b=CpJIDWxGKbtGuqXtfz5BcGSUKTBEQSy5QH9XGiGzdgwMmkOWBTl/WGCFD5sA579H2p
         7SMVqGaer2Bu9ThevUdcsu3x6ygTo+8TYQaJkVtcREJxTaJgzxRxRNSIOMGOQ+folWfA
         UXtfo6RCrrnKbrCMRk7xWvP0flJkrVPjZbz957vv/rMLKBE8yTywVVajYD411r7OCOuv
         aNcC9iJdElK87Zb0JH0iYNmjRE7EjxRCtvQGEd4GPhQX8J0iN100HEPkbz5zKJ8DUonS
         dIW7NlHzdBlsVIUxLUtK2Y9QjILN1ji9ULhq2ZNwqI5DpILloVSdF9iIrYhCbwuXlSTq
         VafQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPAAd3HonzvVJhD364OZr3fXI57kAygbCmwp7MWFXBfzFWRcyL4vV121s2T3AFZTPqw5oXTjSW//NePqgMPCJNdqrFcOUnRXM56JuoNgg=
X-Gm-Message-State: AOJu0YyZu2WdeBf8LvIzgTn9KosepXooGWI4Z/iiML5pDIyMveRCkinT
	DWnRs+IABLZiMybfn1e6XjrW6CGwu4fhhvcW7gAYSZ/i4rCJ6d64WSmPCwy5FA==
X-Google-Smtp-Source: AGHT+IEOOFZEoLHbriJz1HUEhj59g4q54KQ7u9ejgIDYv2ogwPLvq30o/IG7xH80RzX4FN9RDHD7/Q==
X-Received: by 2002:a50:8711:0:b0:572:7015:f303 with SMTP id 4fb4d7f45d1cf-5734d6f00d7mr10489266a12.35.1715681273176;
        Tue, 14 May 2024 03:07:53 -0700 (PDT)
Message-ID: <d84642c4-d578-4629-ac66-7461f5d143f1@suse.com>
Date: Tue, 14 May 2024 12:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 12/27] x86/mapcache: Initialise the mapcache
 for the idle domain
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Wei Wang <wawei@amazon.de>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-13-eliasely@amazon.com>
 <d6f3993e-5e96-4e3d-9334-9b44152f9f81@suse.com>
 <a74001e4-7ae1-48f7-854d-2a8aeb2ff8da@amazon.com>
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
In-Reply-To: <a74001e4-7ae1-48f7-854d-2a8aeb2ff8da@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 11:35, Elias El Yandouzi wrote:
> On 20/02/2024 10:51, Jan Beulich wrote:
>> On 16.01.2024 20:25, Elias El Yandouzi wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -750,9 +750,16 @@ int arch_domain_create(struct domain *d,
>>>   
>>>       spin_lock_init(&d->arch.e820_lock);
>>>   
>>> +    if ( (rc = mapcache_domain_init(d)) != 0)
>>> +    {
>>> +        free_perdomain_mappings(d);
>>> +        return rc;
>>> +    }
>>> +
>>>       /* Minimal initialisation for the idle domain. */
>>>       if ( unlikely(is_idle_domain(d)) )
>>>       {
>>> +        struct page_info *pg = d->arch.perdomain_l3_pg;
>>>           static const struct arch_csw idle_csw = {
>>>               .from = paravirt_ctxt_switch_from,
>>>               .to   = paravirt_ctxt_switch_to,
>>> @@ -763,6 +770,9 @@ int arch_domain_create(struct domain *d,
>>>   
>>>           d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
>>>   
>>> +        idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
>>> +            l4e_from_page(pg, __PAGE_HYPERVISOR_RW);
>>> +
>>>           return 0;
>>>       }
>>
>> Why not add another call to mapcache_domain_init() right here, allowing
>> a more specific panic() to be invoked in case of failure (compared to
>> the BUG_ON() upon failure of creation of the idle domain as a whole)?
>> Then the other mapcache_domain_init() call doesn't need moving a 2nd
>> time in close succession.
> 
> To be honest, I don't really like the idea of having twice the same call 
> just for the benefit of having a panic() call in case of failure for the 
> idle domain.

Resulting in the problem Roger has now validly pointed out in reply to v3.
IOW the (more specific) panic() isn't the only reason; it would merely be
an imo desirable side effect.

Jan

