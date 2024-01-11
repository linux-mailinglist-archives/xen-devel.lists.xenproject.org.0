Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E582A892
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665983.1036357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpsL-000052-OK; Thu, 11 Jan 2024 07:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665983.1036357; Thu, 11 Jan 2024 07:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpsL-0008U3-KH; Thu, 11 Jan 2024 07:53:17 +0000
Received: by outflank-mailman (input) for mailman id 665983;
 Thu, 11 Jan 2024 07:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpsJ-0008Tx-Li
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:53:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 796e4008-b056-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:53:14 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3374eb61cbcso4532126f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:53:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c28-20020adfa31c000000b0033775980d26sm500759wrb.2.2024.01.10.23.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:53:14 -0800 (PST)
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
X-Inumbo-ID: 796e4008-b056-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704959594; x=1705564394; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Jo74aMqjG6F5Mno+cxU3pwLqXDLTAUwkJrVylM525s=;
        b=CIe7jfNV2I1SSly+56G6sN8xf8PLw2DjYo93J+iZM4iNjt69NJ+nhE0maNugISJImE
         HIpHiCXXZ/8bm5DE31wXykGIY7tBHn2T12xWw6byt2Mq87wB0BPlvg6wMPqbO13YfTyC
         0fmu/pNmwMuupW6zCT1sbOl1xI5eAjDdChybnBJHMRoX6cg4bdqc98ry4vg+CYBb+nM0
         mfFS3EHyVjajXIgZ9Z6lKf901/zdQv1UmYovlnL/KuVzgW7CYGqCcPGe/FMqpTGsHQL7
         rTeyZYoLmKlhRQbDGb9vremLfyW0shl3bjvMtKVggHiAeOmA5TEB2P+AaiT6mi5ATY96
         fQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704959594; x=1705564394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Jo74aMqjG6F5Mno+cxU3pwLqXDLTAUwkJrVylM525s=;
        b=mw4ayfenAkEuOOdazDQiCQui/Y73s7UwA4HtiLuGdEIybEZtLoBOKcxe+WH0QDAK+e
         15/aHUcKETbYHrhPbihr08nqcf8e5zC8nNf3S1u9H4TbUW7TBLJk4UkfZuKH5jFAG5tO
         m4tY33c6yc8Q5Upfu9U3gHWBOTe+t0WSimu1UlsLlU84D4btOzJKHLc7PAtMv+LeWcwV
         Y62CTdEbgSb0qhZ7/SH59Bq7uI0rQok6224T4Hinid/36TNObMuVTfiKDSMClJw5YU8v
         vpaPK8ZxRf7sPayTCKQCr87CPiZstRx+Mzphy2u3jf+P7Q6DvTLGE3QMfUzNx5QFB/ch
         8Ftw==
X-Gm-Message-State: AOJu0Yy+VQZnhk/SIqKbVcDHi0SY2ZIL7ejI2jIWmcjlEPt5/brnW7YY
	bs3l2eJUTY34FJouaLRNSC2aIzwZwl7L
X-Google-Smtp-Source: AGHT+IHS8iJEsP0zEPsgCcSyYY7klcQRM6mh9JtkTKtu5ECwx+81rZWmNq/6uEiSTV1FT1m/bCY+Rw==
X-Received: by 2002:a5d:6644:0:b0:334:ada5:3835 with SMTP id f4-20020a5d6644000000b00334ada53835mr386369wrw.4.1704959594213;
        Wed, 10 Jan 2024 23:53:14 -0800 (PST)
Message-ID: <88d4cb45-f2e6-4acd-8ec4-060f90a444fc@suse.com>
Date: Thu, 11 Jan 2024 08:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/22] x86/mapcache: initialise the mapcache for the idle
 domain
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Wei Wang <wawei@amazon.de>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-11-julien@xen.org>
 <751ffdb3-651c-b8e6-dc33-5a6857e3c88d@suse.com>
 <88024314-245f-404e-a6b7-7ea859bae309@amazon.com>
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
In-Reply-To: <88024314-245f-404e-a6b7-7ea859bae309@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2024 17:24, Elias El Yandouzi wrote:
> On 22/12/2022 13:06, Jan Beulich wrote:
>> On 16.12.2022 12:48, Julien Grall wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -5963,6 +5963,9 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
>>>           l3tab = __map_domain_page(pg);
>>>           clear_page(l3tab);
>>>           d->arch.perdomain_l3_pg = pg;
>>> +        if ( is_idle_domain(d) )
>>> +            idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
>>> +                l4e_from_page(pg, __PAGE_HYPERVISOR_RW);
>>
>> Hmm, having an idle domain check here isn't very nice. I agree putting
>> it in arch_domain_create()'s respective conditional isn't very neat
>> either, but personally I'd consider this at least a little less bad.
>> And the layering violation aspect isn't much worse than that of setting
>> d->arch.ctxt_switch there as well.
> 
> Why do you think it would be less bad to move it in 
> arch_domain_create()? To me, it would make things worse as it would 
> spread the mapping stuff across different functions.

Not sure what to add to what I said: create_perdomain_mapping() gaining
such a check is a layering violation to me. arch_domain_create() otoh
special cases the idle domain already.

Jan

