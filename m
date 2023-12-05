Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB5C80590E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648070.1012023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXdo-0002SV-HW; Tue, 05 Dec 2023 15:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648070.1012023; Tue, 05 Dec 2023 15:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXdo-0002Qy-Eo; Tue, 05 Dec 2023 15:47:20 +0000
Received: by outflank-mailman (input) for mailman id 648070;
 Tue, 05 Dec 2023 15:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAXdn-0002Qs-M5
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:47:19 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9187d480-9385-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:47:18 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3333a3a599fso1811344f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:47:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b0040b36ad5413sm19093937wmq.46.2023.12.05.07.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:47:17 -0800 (PST)
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
X-Inumbo-ID: 9187d480-9385-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701791237; x=1702396037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=65eTcWf9uOrFD9ZNDzI5Ko3Ji4eS0sQsuPZrLjadFZ8=;
        b=MjDEbyollXl1IIsIlG4r1PiKrqPg5H10J42/D9uVyUGzXuobMrhmNJlL2pIPVPqbEG
         UV98xRXv/nFXXOAfm+H2RP1mro+i60mMjs0Duhl4s8pP+ma06CLp5gre6uI9E50uPcqh
         zEKbSaIX6kbjmu3n2pJWchXaxsFzqOMN9gEATE99Lw0CTa+dOO0pfye73FYin4TnQJZf
         m36POp+MPCp7JGBBHSKkagY1GZc0eU27Go3iddQRNZN1GggWIhxyDK4Fi3qoVmK3dWy3
         xEQcm1f5PiTn/xmb8YbDuX0thojdnfwTtVj2t+5Yitf0rS2WSk+DIccVekklIR0Z0w88
         Au3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791237; x=1702396037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65eTcWf9uOrFD9ZNDzI5Ko3Ji4eS0sQsuPZrLjadFZ8=;
        b=Fh6cf0cuFs18eRRgmqGdr0QEyrWKquVMgQNmuVMem4LAOI+HGhmchmIAhQ/S1uz3dp
         LOM3JwgkecOGx3sD2Ol/doV+78dlKS5gsr8cXUnY0WDuY+3H02LptRpvIG8sU6g1Tcbs
         mg8T7nlCWAfYo6gqL8LEtgYqVZm7pkTyt9PJrX9RWBUYArJPkde0+lhnzkfQr98iMyix
         ijiIYElF2WAneoEcdnCKv3jZUxBqZveN34OgNTPPkUp/+IpLniYRNFQopQsk6pSWyePJ
         Ggj7jqH7ULa9Gkf5fhcb1HylrTsuNpLbLeRIsKMIi1vkMLH1GBeK5XrEKVqcRruog+Gs
         sV/w==
X-Gm-Message-State: AOJu0YybCb5Goz/pCR60s1P3/R2d8vBQ2kMJngObgrRdzX000o4GOYgt
	ZQIsC38NyqfE2bBG6SRtNOvJ
X-Google-Smtp-Source: AGHT+IGEsd53zyyugF5jJ/xSSq4kaysAmNegTfVcdhodOxwji7USVQqgIOwsQzmVRR8+K02xUwfSfA==
X-Received: by 2002:a05:600c:4d0f:b0:40b:5e56:7b66 with SMTP id u15-20020a05600c4d0f00b0040b5e567b66mr653280wmp.175.1701791237285;
        Tue, 05 Dec 2023 07:47:17 -0800 (PST)
Message-ID: <798cfd87-7c10-41e9-a427-c7177da4d063@suse.com>
Date: Tue, 5 Dec 2023 16:47:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/iommu: switch hwdom IOMMU to use a rangeset
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-6-roger.pau@citrix.com>
 <095c2f4c-9b10-4ab8-95ea-101f62096678@suse.com> <ZW9FM44pEIn4odkn@macbook>
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
In-Reply-To: <ZW9FM44pEIn4odkn@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 16:43, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 04:27:05PM +0100, Jan Beulich wrote:
>> On 04.12.2023 10:43, Roger Pau Monne wrote:
>>> @@ -476,58 +406,55 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>>>      if ( !map )
>>>          panic("IOMMU init: unable to allocate rangeset\n");
>>>  
>>> -    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
>>> -    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
>>> +    if ( iommu_hwdom_inclusive )
>>> +    {
>>> +        /* Add the whole range below 4GB, UNUSABLE regions will be removed. */
>>> +        rc = rangeset_add_range(map, 0, max_pfn);
>>> +        if ( rc )
>>> +            panic("IOMMU inclusive mappings can't be added: %d\n",
>>> +                  rc);
>>> +    }
>>>  
>>> -    for ( i = 0, start = 0, count = 0; i < top; )
>>> +    for ( i = 0; i < e820.nr_map; i++ )
>>>      {
>>> -        unsigned long pfn = pdx_to_pfn(i);
>>> -        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
>>> +        struct e820entry entry = e820.map[i];
>>>  
>>> -        if ( !perms )
>>> -            /* nothing */;
>>> -        else if ( paging_mode_translate(d) )
>>> +        switch ( entry.type )
>>>          {
>>> -            int rc;
>>> +        case E820_UNUSABLE:
>>> +            if ( !iommu_hwdom_inclusive || PFN_DOWN(entry.addr) > max_pfn )
>>> +                continue;
>>
>> The !iommu_hwdom_inclusive part isn't really needed here, is it? The ...
> 
> Nor the PFN_DOWN(entry.addr) > max_pfn.

Hmm, I couldn't convince myself that could also be dropped.

>>> -            rc = p2m_add_identity_entry(d, pfn,
>>> -                                        perms & IOMMUF_writable ? p2m_access_rw
>>> -                                                                : p2m_access_r,
>>> -                                        0);
>>> +            rc = rangeset_remove_range(map, PFN_DOWN(entry.addr),
>>> +                                       PFN_DOWN(entry.addr + entry.size - 1));
>>
>> ... call here would then simply be a no-op, as it looks. And things would
>> overall look more safe if the removal was skipped for fewer reasons.
> 
> OK, the removal can be done unconditionally if so desired.
> 
>>> @@ -605,7 +532,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>>>      rangeset_destroy(map);
>>>  
>>>      /* Use if to avoid compiler warning */
>>> -    if ( iommu_iotlb_flush_all(d, flush_flags) )
>>> +    if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
>>>          return;
>>>  }
>>
>> Ah yes, here is said change. But I think for correctness this wants
>> moving to the earlier patch.
> 
> OK, so something like:
> 
> map_data.flush_flags |= flush_flags;

Or simply drop flush_flags here right away (read: replace by map.flush_flags).

Jan

> And adjusting the iommu_iotlb_flush_all() would be fine in this patch
> context.
> 
> Thanks, Roger.


