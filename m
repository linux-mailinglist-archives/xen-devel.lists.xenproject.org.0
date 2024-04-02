Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4453894E00
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 10:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700048.1092601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrZrn-0007Di-5f; Tue, 02 Apr 2024 08:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700048.1092601; Tue, 02 Apr 2024 08:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrZrn-0007BP-2K; Tue, 02 Apr 2024 08:51:39 +0000
Received: by outflank-mailman (input) for mailman id 700048;
 Tue, 02 Apr 2024 08:51:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrZrl-0007BJ-Ez
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 08:51:37 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35c03a34-f0ce-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 10:51:35 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34339f01cd2so2895581f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 01:51:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h4-20020a056000000400b00343668bc492sm1026721wrx.71.2024.04.02.01.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 01:51:34 -0700 (PDT)
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
X-Inumbo-ID: 35c03a34-f0ce-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712047895; x=1712652695; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nkJEBE/iU3VKRjQkdbXvmTTQMKiGU5keS54ity9dM3A=;
        b=QD/VjH8pakwt8m4B+ld6adk2pAVwILxHSVytVm1KRJ835+QZ1U/OFGBlxa393AuSjo
         FDNQ5xgCekirJVAWAcf+gDDX2EQI5eGnTorZZ6tNq8nGBhltSQkJky81Lsb3qG0aCfyr
         mePVoru0/G1W8OD8/qmkspxceQnoyzgVOYEFU2SJWZ74pEGaMMv2aiJmU98geYknkirl
         tYUBg7XHaxOM7elK+XwiaxUnQW5IIITn6H73xxRQqxVSCMoaFOQQQ2Egxwy4pU4OuSbf
         QmcCAWTqftvCwrVoxp/SdORDgONYcJhthasvihdw+Q5vXMox0j16CtVtRuPr4D1gCobS
         F5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712047895; x=1712652695;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nkJEBE/iU3VKRjQkdbXvmTTQMKiGU5keS54ity9dM3A=;
        b=GEJq2KiSoTPmCMLbW5uCVOJchx6GxkUBieomyXAxW4h4lUdBRcgaiAMQhRS1UIvoNL
         wLAHr8d3geTlXvSf1HnF3kgrtjkWPj4RR45k0LyitURDV286sZXM9t8ui7yh/yti1/MP
         FVF5PLnYXKusavR0L+5FaPtUn9hkSYy28BWgGwWBrefOeBQhpo8ZenRDFC7dfi744EAG
         Tlfeem0z6CLSJZO5l/ts+Uwe20WZaKPAq8C9/OkKDnuymFp17J2NCla1syP+G98+obGU
         3j2kXFZna3illvtqoX+0aw5Oetl71cmTHm7OfP+ykJ3m7QmKyKaoUSCAhhK64XjM6Uce
         hemA==
X-Forwarded-Encrypted: i=1; AJvYcCXS9XdLEVmJKFK3eDc4KGO6fx9XFQHKCLDX4eATLW1+ifFd04vKp4n/7pdm9iWLIoOZoIAeYaj2Gt8P7i5jaCRwaVp9b4eK6wrGH++Oyvc=
X-Gm-Message-State: AOJu0Yzcan5R5e/vkZ1v+byi2lOPy0+9Ush+KuHuh2zxvLXOWPieQK5f
	RMrGyRHSKRoWNHir+GjBDxeuDbpQYmVILcsyax2Ua/81kJRE+L6qz5zCNIHViA==
X-Google-Smtp-Source: AGHT+IHa1YfZa8R5mmV5aqPqDiHy7Y+3mnPA+bIfroBhzF1kWe4Xw6Mz2yuRqJ/wexSRl+Jge+kvnA==
X-Received: by 2002:a05:6000:256:b0:343:6c4b:3d8d with SMTP id m22-20020a056000025600b003436c4b3d8dmr491463wrz.12.1712047894666;
        Tue, 02 Apr 2024 01:51:34 -0700 (PDT)
Message-ID: <133d81d2-9ab1-446b-918f-d86e86833cd5@suse.com>
Date: Tue, 2 Apr 2024 10:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
 <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
 <b1393dbe-42c2-4839-8ca3-7dc71fe72969@amd.com>
 <d9e3b7c4-d8be-4642-9212-b48ae885b46a@suse.com>
 <4a0e4c60-9401-4031-bf80-66033ad068e3@amd.com>
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
In-Reply-To: <4a0e4c60-9401-4031-bf80-66033ad068e3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2024 10:43, Henry Wang wrote:
> On 4/2/2024 3:05 PM, Jan Beulich wrote:
>> On 29.03.2024 06:11, Henry Wang wrote:
>>> On 3/12/2024 1:07 AM, Jan Beulich wrote:
>>>>> +/*
>>>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>>>> + * or static allocation.
>>>>> + */
>>>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>>>>    #endif
>>>> If this is for populate_physmap only, then other sub-ops need to reject
>>>> its use.
>>>>
>>>> I have to admit I'm a little wary of allocating another flag here and ...
>>>>
>>>>> --- a/xen/include/xen/mm.h
>>>>> +++ b/xen/include/xen/mm.h
>>>>> @@ -205,6 +205,8 @@ struct npfec {
>>>>>    #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
>>>>>    #define _MEMF_no_scrub    8
>>>>>    #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
>>>>> +#define _MEMF_force_heap_alloc 9
>>>>> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
>>>>>    #define _MEMF_node        16
>>>>>    #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
>>>>>    #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)
>>>> ... here - we don't have that many left. Since other sub-ops aren't
>>>> intended to support this flag, did you consider adding another (perhaps
>>>> even arch-specific) sub-op instead?
>>> While revisiting this comment when trying to come up with a V3, I
>>> realized adding a sub-op here in the same level as
>>> XENMEM_populate_physmap will basically duplicate the function
>>> populate_physmap() with just the "else" (the non-1:1 allocation) part,
>>> also a similar xc_domain_populate_physmap_exact() & co will be needed
>>> from the toolstack side to call the new sub-op. So I am having the
>>> concern of the duplication of code and not sure if I understand you
>>> correctly. Would you please elaborate a bit more or clarify if I
>>> understand you correctly? Thanks!
>> Well, the goal is to avoid both code duplication and introduction of a new,
>> single-use flag. The new sub-op suggestion, I realize now, would mainly have
>> helped with avoiding the new flag in the public interface. That's still
>> desirable imo. Internally, have you checked which MEMF_* are actually used
>> by populate_physmap()? Briefly looking, e.g. MEMF_no_dma and MEMF_no_refcount
>> aren't. It therefore would be possible to consider re-purposing one that
>> isn't (likely to be) used there. Of course doing so requires care to avoid
>> passing that flag down to other code (page_alloc.c functions in particular),
>> where the meaning would be the original one.
> 
> I think you made a good point, however, to be honest I am not sure about 
> the repurposing flags such as MEMF_no_dma and MEMF_no_refcount, because 
> I think the name and the purpose of the flag should be clear and 
> less-misleading. Reusing either one for another meaning, namely forcing 
> a non-heap allocation in populate_physmap() would be confusing in the 
> future. Also if one day these flags will be needed in 
> populate_physmap(), current repurposing approach will lead to a even 
> confusing code base.

For the latter - hence "(likely to be)" in my earlier reply.

For the naming - of course an aliasing #define ought to be used then, to
make the purpose clear at the use sites.

Jan

> I also do agree very much that we need to also avoid the code 
> duplication, so compared to other two suggested approach, adding a new 
> MEMF would be the cleanest solution IMHO, as it is just one bit and MEMF 
> flags are not added very often.
> 
> I would also curious what the other common code maintainers will say on 
> this issue: @Andrew, @Stefano, @Julien, any ideas? Thanks!
> 
> Kind regards,
> Henry


