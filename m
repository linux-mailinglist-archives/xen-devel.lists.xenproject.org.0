Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21922849D12
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676140.1052036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzzD-0003nA-Te; Mon, 05 Feb 2024 14:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676140.1052036; Mon, 05 Feb 2024 14:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzzD-0003l8-Qf; Mon, 05 Feb 2024 14:30:15 +0000
Received: by outflank-mailman (input) for mailman id 676140;
 Mon, 05 Feb 2024 14:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzzD-0003ky-0Y
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:30:15 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11cadc41-c433-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 15:30:11 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40fd55c7f93so13886085e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 06:30:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b0040fcaec04b8sm32498wmp.22.2024.02.05.06.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 06:30:10 -0800 (PST)
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
X-Inumbo-ID: 11cadc41-c433-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707143411; x=1707748211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKHQD7J0KrjI4QYeHCYKNTmsHSzza/9OcMlhsFtXRr0=;
        b=LG9OV58lYRFKA4T2BAS1QpWFEK5uyXjq7ftB1uqXUymhuTb/uOZ+zIhpv2a8RgXXal
         2hIZWK/yl7/K5ojCnx6CWfVfMIuJ7c34LIBraQjaLlKNoB3ahmMzDeHeNWAicJMQf2ns
         7zfHou98irNLHZQsTiAqM2jlrCeaqfrBnlRJg18w0RMukLQVknk8dYZaGyEAEn3EO8Gy
         B+TecxUz2kURiTM8uJA+GemUFETowJnsqiPMsPh7U/WabZH57xu+KYhUHZjXRXW4Cqa4
         lh83Wd/fGpwcFil4/4zelpq18n/VRpT7CvaPPVuhi5I1qjNw8sEJUuYlD6DkBHuXUBf7
         aEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707143411; x=1707748211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKHQD7J0KrjI4QYeHCYKNTmsHSzza/9OcMlhsFtXRr0=;
        b=jqWdpd4Zu2YFDreVOwPd7wXlswhw0yfMR5Qfc3XvUlH3Mx5EtEw+I3wSyTK3xxII3r
         /nB/FnyxNCkWUxiEbnnmwCuEkcjuG9PlhBCnbyyatY6KSFvzfviwwjTHdU+Z4VEE8oeW
         JRUCOK/TPSQFY5oBbnlEWgE7z2mKHLY8LGL/Pa+47xfeROVvJhLpwh2y/fUAsnK93e6/
         AUSRVLwA+4MC4sOtIXP6zO8gdbMBNBDGX59MtgGNLfH4zZF22tJmWmNYi+L3aWC6l1eC
         QIbwZc49tAck6IkWh2MClodHQv+Fh2GXQKnuOz9UL1kgaZtr+ej0AhLFtUSLTgiOUNU1
         o+Uw==
X-Gm-Message-State: AOJu0YxHf8pxr1cd873CBgQwlaLDv8rwAu/kHZyAGdfuLLSdtPZsRHTm
	iJl2kwybMLgx/bSBj08+mo2dTfptSApTX9AOpHeRWdndxurHC4DMr2B3AJKQbA==
X-Google-Smtp-Source: AGHT+IH5jAhmzYd8DjRNLQOdzebHVnH6igLRPb8eZcOOfUC9cm6wQBScAQ5yXoVvXk0A2yp8DaILDw==
X-Received: by 2002:a5d:5f46:0:b0:33b:2856:5188 with SMTP id cm6-20020a5d5f46000000b0033b28565188mr8502022wrb.44.1707143411118;
        Mon, 05 Feb 2024 06:30:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWXVlDLlODcFbYoddE/1EVCOlGIw7wGf4OAdTkoONe9rjPg83HO/6iH7vDCiPtg874Nq+S5y9m7rhvLWDglrUruNDn6TvZmAIL35Jny2NTx9DJiMXZce4pzyMCYj/QQj7Zf3fOQCx8rpClZolDjM3S9VTrxWXKnxlMxTAd8oWpBMXBtuIyYlzmakd5qK2HSIFfS4F1pADB0Jayt08tU6XIkKJlQRqhGrq3Tgdep2DwjozYg/GhYBzNLMsJBRejQrvFTpU7BdOg+0e3e0cNcgwaZYeamCGDTaVLsxumT/taPTrUJGI85M3I5pWR/YUNBO/Di0Z62CqpAIwctYAd1jFajZSwB79U10P2A9/ejnr4iTCY3YXmyZXefUp4TrXil8sfVeA==
Message-ID: <805b91bd-e341-4dd4-aa69-867c86bc4eb1@suse.com>
Date: Mon, 5 Feb 2024 15:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/15] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-11-carlo.nonato@minervasys.tech>
 <1739dbb4-5d7e-4d84-8d4b-bfb13c4041d8@suse.com>
 <CAG+AhRUJysNCrUXLiu8tvh2d7oL2hNAtkM3A2-Hy73f=+PxkTA@mail.gmail.com>
 <0ef140da-77d3-411f-8f19-eee0aaf1fa9d@suse.com>
 <CAG+AhRVTpcEHpWVY1qUNt3Uc-cDPqV2ZRe8rwfvY4YZUPUP7Ew@mail.gmail.com>
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
In-Reply-To: <CAG+AhRVTpcEHpWVY1qUNt3Uc-cDPqV2ZRe8rwfvY4YZUPUP7Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2024 15:10, Carlo Nonato wrote:
> On Mon, Feb 5, 2024 at 1:38 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.02.2024 12:59, Carlo Nonato wrote:
>>> On Thu, Feb 1, 2024 at 4:53 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>>>> @@ -2458,7 +2626,14 @@ struct page_info *alloc_domheap_pages(
>>>>>      if ( memflags & MEMF_no_owner )
>>>>>          memflags |= MEMF_no_refcount;
>>>>>
>>>>> -    if ( !dma_bitsize )
>>>>> +    /* Only domains are supported for coloring */
>>>>> +    if ( d && llc_coloring_enabled )
>>>>> +    {
>>>>> +        /* Colored allocation must be done on 0 order */
>>>>> +        if ( order || (pg = alloc_color_heap_page(memflags, d)) == NULL )
>>>>> +            return NULL;
>>>>> +    }
>>>>
>>>> I think I had asked before: What about MEMF_node() or MEMF_bits()
>>>> having been used by the caller?
>>>
>>> MEMF_node() is used for NUMA, right? I think that for the moment, since cache
>>> coloring is supported only on arm64 and NUMA is not yet supported, it's safe
>>> to ignore it.
>>
>> NUMA or not, I'm wary of silent ignoring of inputs. I'd rather request
>> that, just like with staticmem, precautions are then taken to avoid
>> coloring and NUMA to be used together. Recall that much like your work,
>> work to support NUMA is also in progress (unless it was canceled, but
>> not so announced).
> 
> Ok.
> 
>>> I'm not sure I understood what MEMF_bits() is for. It restricts the allocator
>>> to return pages in some range, right?
>>
>> Correct.
> 
> So I need to think about this, since I see no easy way of supporting such a
> thing with the current colored allocator implementation.
> Do you have any suggestions?

Well, at least properly fail requests you can't fulfill.

Jan

