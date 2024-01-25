Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F4E83C369
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 14:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671508.1044874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSzYB-0000yB-VP; Thu, 25 Jan 2024 13:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671508.1044874; Thu, 25 Jan 2024 13:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSzYB-0000vu-SB; Thu, 25 Jan 2024 13:13:47 +0000
Received: by outflank-mailman (input) for mailman id 671508;
 Thu, 25 Jan 2024 13:13:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSzYA-0000uZ-KW
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 13:13:46 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9194673b-bb83-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 14:13:45 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cf161b5eadso33037031fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 05:13:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s9-20020a92cb09000000b00362a58bda60sm248389ilo.47.2024.01.25.05.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 05:13:44 -0800 (PST)
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
X-Inumbo-ID: 9194673b-bb83-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706188425; x=1706793225; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Pcl2GJX5hQrx4wHwY6laCw1dF70AhMuyT56xV9wAho=;
        b=IR/v2kT/YHd7zVR+U1IA2wt825MMyJcMBqfcre9/dHkeXKRRujN0fs6hyINty4VS7r
         uG7887/l8A5dPH6Bv8unBbvrtc6viS5WiLaRjv1x1aU8j3PURbA52iPBIVgDm+7ivmWP
         hf/kigoHzrtmrP27oiDgGUdwsCMKsZWiv83dcK8PggVwbuiDW8iNtIdgsFJuqMqkMt0V
         SvCAuRkjQhE7Q0BfpBnLKQYWzepuOqNtxn7KKvaM/d2aIVz/A9OMM6kH/iKo3xvZnq//
         LUh1BTdMDbzQKeNua6uCky7AP9Rrn1wLo1wVidzBpZZOyfR0BSAKLk6IefSEZMDbKoWm
         8HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706188425; x=1706793225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Pcl2GJX5hQrx4wHwY6laCw1dF70AhMuyT56xV9wAho=;
        b=JujeNL/iPTTqdMOeXwTMLDO+4VdgpG4qLQggBEJ2zMeuVinvZA3RPyRytolEvuZ5XH
         cceS/5qT2s35VnI8D5JoX0rJ26zwL1bz0tmZoHQ6PTK8t6dw2weLT6+XWi6uRasp3QN7
         9fAwXrMAuGVDPQ2YZL8KStbDtlO0GO8OHT314dUWPemb1m74RAFmYJXQcICZyKxIz3yJ
         EhakgjVx7YwpXYtSP8L35q7TrO5pKGFEsPRUzE9R5CPLD+D7lkl/E5QToRfu5Xa6IOGe
         dbrZ2L48rhz5yCJrZsNW2LjO3m+/btFmRPU0d5otCIRfWbZ5lPk9deLfNvBDznppVE1w
         Pqew==
X-Gm-Message-State: AOJu0YyMKTm3RDg+qVbuDvDyD5zFibus6Qa8noqEbtXwcXgC2du6q1Sr
	5RLI+JR3K2OmEoHuAVZ4y1JBeMw+oiyMLKW5elnG21A6Y3Ul5QI5b6RFlOqkqA==
X-Google-Smtp-Source: AGHT+IHAx3sN+AvNIQWVuqyOuaQsZyKLxUbCSQi0o9qJ3EYTu0cyJbLPtAtjGeq/1ApLrppjrowLXQ==
X-Received: by 2002:a2e:3318:0:b0:2cc:6e38:25ef with SMTP id d24-20020a2e3318000000b002cc6e3825efmr739408ljc.55.1706188425014;
        Thu, 25 Jan 2024 05:13:45 -0800 (PST)
Message-ID: <4b8f5b3e-456d-4bc5-94a4-d7a0c77563a2@suse.com>
Date: Thu, 25 Jan 2024 14:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] x86/iommu: remove regions not to be mapped
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240124172953.29814-1-roger.pau@citrix.com>
 <20240124172953.29814-2-roger.pau@citrix.com>
 <ad178469-15c3-4ae5-8538-e927f1116a42@suse.com> <ZbIgE8exXDVicN8D@macbook>
 <ed221b62-0151-45ce-a88d-d7e2a9946136@suse.com> <ZbJWE2HhCo_IHBpF@macbook>
 <be2ccc2e-f311-4368-86b3-bdf5edd0c2b6@citrix.com>
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
In-Reply-To: <be2ccc2e-f311-4368-86b3-bdf5edd0c2b6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.01.2024 13:55, Andrew Cooper wrote:
> On 25/01/2024 12:37 pm, Roger Pau Monné wrote:
>> On Thu, Jan 25, 2024 at 12:13:01PM +0100, Jan Beulich wrote:
>>> On 25.01.2024 09:47, Roger Pau Monné wrote:
>>>> On Thu, Jan 25, 2024 at 09:34:40AM +0100, Jan Beulich wrote:
>>>>> On 24.01.2024 18:29, Roger Pau Monne wrote:
>>>>>> --- a/xen/arch/x86/hvm/io.c
>>>>>> +++ b/xen/arch/x86/hvm/io.c
>>>>>> @@ -369,6 +369,22 @@ bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
>>>>>>      return vpci_mmcfg_find(d, addr);
>>>>>>  }
>>>>>>  
>>>>>> +int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
>>>>>> +{
>>>>>> +    const struct hvm_mmcfg *mmcfg;
>>>>>> +
>>>>>> +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
>>>>>> +    {
>>>>>> +        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
>>>>>> +                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
>>>>> Along the lines of this, ...
>>>>>
>>>>>> --- a/xen/arch/x86/setup.c
>>>>>> +++ b/xen/arch/x86/setup.c
>>>>>> @@ -2138,6 +2138,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
>>>>>>      return 0;
>>>>>>  }
>>>>>>  
>>>>>> +int __hwdom_init remove_xen_ranges(struct rangeset *r)
>>>>>> +{
>>>>>> +    paddr_t start, end;
>>>>>> +    int rc;
>>>>>> +
>>>>>> +    /* S3 resume code (and other real mode trampoline code) */
>>>>>> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
>>>>>> +                               PFN_DOWN(bootsym_phys(trampoline_end)) - 1);
>>>>> ... did you perhaps mean
>>>>>
>>>>>                                PFN_DOWN(bootsym_phys(trampoline_end) - 1));
>>>>>
>>>>> here (and then similarly below, except there the difference is benign I
>>>>> think, for the labels being page-aligned)?
>>>> They are all page aligned, so I didn't care much,  but now that you
>>>> point it might be safer to do the subtraction from the address instead
>>>> of the frame number, just in case.
>>> Hmm, no, for me neither trampoline_end nor trampoline_start are page
>>> aligned. While bootsym_phys(trampoline_start) is, I don't think
>>> bootsym_phys(trampoline_end) normally would be (it might only be by
>>> coincidence).
>> Oh, so it had been a coincidence of the build I was using I guess then.
> 
> trampoline_start has to be page aligned because of constraints from SIPI
> and S3 (cant remember which one is the 4k constraint, but it's in the
> comments).

What you're talking about is the copy of the trampoline code/data in
low memory. trampoline_{start,end} themselves point into the Xen image.

> On APs (and indeed, in Xen's pagetables), the trampoline is only a
> single 4k page.
> 
> However, trampoline_end is quite a lot longer because there's various
> things that get done on the BSP only, including recovering the E820 map,
> EDID/etc in 16bit mode.

And this BSP-only part really wouldn't need removing here, I think.
The issue is that the BSP-only and also-AP plus S3-wakeup parts aren't
properly delimited (hmm, maybe wakeup_stack can be used for this
purpose). But if, as you say, we map only a single page, we could as
well limit logic here to just that.

Jan

> That said, we don't edit the trampoline very often, so if it happened to
> work for you first time around, it probably hasn't changed since.
> 
> ~Andrew


