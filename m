Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A389B793
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 08:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701723.1096089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtiMD-0001fv-A8; Mon, 08 Apr 2024 06:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701723.1096089; Mon, 08 Apr 2024 06:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtiMD-0001dk-7W; Mon, 08 Apr 2024 06:19:53 +0000
Received: by outflank-mailman (input) for mailman id 701723;
 Mon, 08 Apr 2024 06:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtiMC-0001dd-0A
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 06:19:52 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0100e387-f570-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 08:19:49 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-416507ea0adso3825485e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 23:19:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o32-20020a05600c512000b004163321790esm9375243wms.19.2024.04.07.23.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 23:19:48 -0700 (PDT)
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
X-Inumbo-ID: 0100e387-f570-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712557189; x=1713161989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EZwtVUJGuETZGIvDrXiFHI3wIMKojgYvy+/b+6DJj/I=;
        b=TD78ojoqrejrzfmxxipo9noMsLkZSYsLz02kPkg5mIz4NvArcU0gvmSAb4hzLqGsWB
         Iy/cuuHcABm9NB1829pax9FjqjWn9/SQAjuXIV/EmnePT6nrGDT7pY9j3cBLfha23yGO
         E5xtVEVZMEkU0iEOW9j/9S8J2w3DA+j5vKkp0rB8KmGnRwJDsCnS7ZAGU3sX281R35dZ
         FYVVtVWsl8ldsshQHtXvgQn9nsnp8WhvP0SxWoW3DB2zDIs4qeRpRLaA3RbuhWF4gZI8
         /gYnyNku8k+zPFrejOvPYOhpzvmZmm8yYLR1IXedSvnI4jOmKPdZmvAPaB9p0j0NHF9F
         Y7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712557189; x=1713161989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZwtVUJGuETZGIvDrXiFHI3wIMKojgYvy+/b+6DJj/I=;
        b=kK60QUta7ymJqmPi83FOn5vHVQsLMwzVLtPzFY5juRLZSWWxU2mUOkJx5438/udHJr
         O68Yc1ZEsorqCg0dcvoGnWde83Wh9gnt8YNoerdm4Cmmwjqyd/yVFdGsWvxLRl6Rk+9D
         R51O/ifIuBPqi6rEjqezSBEy3ii+vJvD4Creukic5+L46HpPKVQ+EXmbogYodRJHCTDI
         6ccCVbasqOkoWrmnr7fuvThc8/SJOhde37iKYCavUBPnAIDRoHGrdkpFHab9prujGULP
         bLcfOMnCWuRMBzDGe/+hGWnO0sFVkFNZmLspfslCs6cwKBSy4sAKPS5CJKOHKlvz+AHC
         EWlw==
X-Forwarded-Encrypted: i=1; AJvYcCWdkqS/MSSRaz+TG1macE+H/w7L6byKHZlSwJBEmGYTXkm+kgryCqz39InJBTE7f+G9JyAJbaIXrPhWmoe+dvg1i901bKn8UvUPz/aYCwQ=
X-Gm-Message-State: AOJu0YzJSsxMoMNQ0/D/ClPwd6/QF0zB0n3PylAqvUOrToIoY2+Ogy8o
	KwGNwJ01Kc8Wp/9d8ELhF7tRtkJBG1VnrFeqaUj0RSc1Gt+cMbAvV3eNXKA8yg==
X-Google-Smtp-Source: AGHT+IEzdzeXMrBnoJJrbJzPIKi5pFClu7srH50iVvwdU2Iu1vhOjcIVzoc98hTP/XZ2GU6glBz74g==
X-Received: by 2002:a05:600c:154b:b0:416:2b81:259a with SMTP id f11-20020a05600c154b00b004162b81259amr6076261wmg.17.1712557189205;
        Sun, 07 Apr 2024 23:19:49 -0700 (PDT)
Message-ID: <531cc2c1-a2ac-4700-9f50-8c2e5c8680c7@suse.com>
Date: Mon, 8 Apr 2024 08:19:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/domctl, tools: Introduce a new domctl to get
 guest memory map
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-2-xin.wang2@amd.com>
 <3ba13bce-d301-49bb-9028-6d48a05fd077@suse.com>
 <d2685464-65ae-4b88-b458-8873599027ff@amd.com>
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
In-Reply-To: <d2685464-65ae-4b88-b458-8873599027ff@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2024 05:08, Henry Wang wrote:
> On 4/4/2024 5:28 PM, Jan Beulich wrote:
>> On 03.04.2024 10:16, Henry Wang wrote:
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
>>>   {
>>>       unsigned int count = 0;
>>>       int rc;
>>> +    struct mem_map_domain *mem_map = &d->arch.mem_map;
>>>   
>>>       BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>>>   
>>> @@ -785,6 +786,20 @@ int arch_domain_create(struct domain *d,
>>>       d->arch.sve_vl = config->arch.sve_vl;
>>>   #endif
>>>   
>>> +    if ( mem_map->nr_mem_regions < XEN_MAX_MEM_REGIONS )
>>> +    {
>>> +        mem_map->regions[mem_map->nr_mem_regions].start = GUEST_MAGIC_BASE;
>>> +        mem_map->regions[mem_map->nr_mem_regions].size = GUEST_MAGIC_SIZE;
>>> +        mem_map->regions[mem_map->nr_mem_regions].type = GUEST_MEM_REGION_MAGIC;
>>> +        mem_map->nr_mem_regions++;
>>> +    }
>>> +    else
>>> +    {
>>> +        printk("Exceed max number of supported memory map regions\n");
>> Debugging leftover?
> 
> Well, not really, I did this on purpose to print some info before exit. 
> But now I realize other error paths in arch_domain_create() do not do 
> that. I will drop this printk in v4.
> 
>>> @@ -176,6 +175,37 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>>   
>>>           return rc;
>>>       }
>>> +    case XEN_DOMCTL_get_mem_map:
>> ... separating blank line above this line and ...
>>
>>> +    {
>>> +        int rc = 0;
>>> +        uint32_t nr_regions, i;
>>> +
>>> +        if ( domctl->u.mem_map.pad )
>>> +            return -EINVAL;
>>> +
>>> +        /*
>>> +         * Cap the number of regions to the minimum value between toolstack and
>>> +         * hypervisor to avoid overflowing the buffer.
>>> +         */
>>> +        nr_regions = min(d->arch.mem_map.nr_mem_regions,
>>> +                         domctl->u.mem_map.nr_mem_regions);
>>> +
>>> +        domctl->u.mem_map.nr_mem_regions = nr_regions;
>>> +
>>> +        for ( i = 0; i < nr_regions; i++ )
>>> +        {
>>> +            if ( d->arch.mem_map.regions[i].pad )
>>> +                return -EINVAL;
>>> +        }
>>> +
>>> +        if ( copy_to_guest(domctl->u.mem_map.buffer,
>>> +                           d->arch.mem_map.regions,
>>> +                           nr_regions) ||
>>> +             __copy_to_guest(u_domctl, domctl, 1) )
>>> +            rc = -EFAULT;
>>> +
>>> +        return rc;
>>> +    }
>>>       default:
>> ... this one.
> 
> ...personally I don't have strong opinions on the style as long as we 
> keep consistent. I can switch the Arm one following the x86 style or 
> just leave it as is.
> 
>> Further with the way you use min() above, how is the caller going to know
>> whether it simply specified too small an array?
> 
> I am a bit unsure if we need to forbid caller to specify a smaller value 
> than the max number of regions supported by the hypervisor, technically 
> it is legal, although I agree it will lead to some issues in the 
> toolstack side. It looks like the similar hypercall of e820 also does 
> not forbid this (see get_mem_mapping_layout() and related 
> XENMEM_memory_map). Do you have any suggestions?

Fill only as much of the array as there is space for, but return the full
count to the caller. Another option (less desirable imo) would be to return
-ENOBUFS. If to be written anew now, I'd likely code XENMEM_memory_map
handling that way, too. But that's too late now.

>> And then you check d->arch.mem_map.regions[i].pad. Why's that? And even
>> if needed here for some reason, that's surely not EINVAL, but an internal
>> error in Xen.
> 
> I did that under the impression that we need to check the value of 
> padding field being 0. Also you mentioned in one of the comments below 
> that Xen should guarantee that the padding field should be 0 before 
> return. Apologize if I misunderstand your comment. The -EINVAL is taken 
> from the same way of checking the padding field in XEN_DOMCTL_vuart_op 
> above. Personally I would keep some consistency, but I am open to 
> suggestions to make it better.

In XEN_DOMCTL_vuart_op it is caller input which is being checked (and
needs checking). You're checking internal Xen state here instead.
Considering the nature of the issue arising if the assumption was broken,
ASSERT() would seem to be the construct to use for the internal state
check.

>> Finally instead of __copy_to_guest() can't you use __copy_field_to_guest(),
>> for just nr_regions?
> 
> You mean replacing __copy_to_guest(u_domctl, domctl, 1) with only the 
> __copy_field_to_guest(u_domctl, domctl, u.mem_map.nr_mem_regions)? Ok I 
> can do that in v4.

Yes (unless there are technical reasons not to, of course).

Jan

