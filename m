Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D66B9C00CB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831530.1246844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ySS-0001Jg-Qv; Thu, 07 Nov 2024 09:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831530.1246844; Thu, 07 Nov 2024 09:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ySS-0001HF-Mz; Thu, 07 Nov 2024 09:05:40 +0000
Received: by outflank-mailman (input) for mailman id 831530;
 Thu, 07 Nov 2024 09:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8ySR-0001H7-Eg
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:05:39 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72f3c2e0-9ce7-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 10:05:35 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9ed49edd41so118109466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 01:05:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4b5cesm64716566b.72.2024.11.07.01.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 01:05:34 -0800 (PST)
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
X-Inumbo-ID: 72f3c2e0-9ce7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcyZjNjMmUwLTljZTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTcwMzM1LjM0OTQwNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730970335; x=1731575135; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tRyRQ6ac7W6xsATqWq4b0tTA709f6tGCsC14IhqOfIg=;
        b=FbK5yxQYfUwgBuA6NmyDmaNT8zVXwLicTks4mtXDHkgmBlRBCKHgWYR6spcjwPiC6/
         awWWB+77birjBV2vXrzsMnTxQ5Rt8g5W3g+ia9R9g87qxoInhh1cRKtvGuo3JvmxjCY9
         qbCBuLS0PeSfqL6+JV5AM/ItkRtLiFVTZNDmWm3MLldzGTJDmcT8Z755a15Mkx4VkqBU
         nB7HLNDDtNSYW3gd9+3E7IOVpTn6v1/WvSwK5s0UAnfoSyh4qGakfQ9gK/ZK4OIioWuk
         dQyRQC/dH3a5n58el0KyPyV8uOn0PB97FyKHj6osaBCUQgq3MKh1pAr51Eedyvnmx3Va
         6cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730970335; x=1731575135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRyRQ6ac7W6xsATqWq4b0tTA709f6tGCsC14IhqOfIg=;
        b=uoRWqyVzAvX+jfWb+IL0/QDNzlmlcipK788+l4AHMKSUIdO3ooM3FaLAB+iXPoO8OD
         VYf0SYslXU/ofmBolHqHrUeCZuVwACH6inVNmmMVA9pl6DzI5Rmzp3Vtp2QbsExIv8c+
         0LjdB3cTscveBfRL3L6+qT3jwT+g+rq8DjoJIUECr1qLEB7HYBOsh9fJgAZ1lcZe7cse
         4Zarsb+VWkICQCqdQvf2phhrZzs5w1ws6DqY/Sg1XncLWM0KmQLaAHNs59qI7RjVyotN
         aBuRArDCr07OEqZcIA7ccAu92Pya1fibD8yfmCFGvKZv0XaB3171GVL1Gug48DrWedlw
         j+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAQ6jOTfQkuEgS0RA8Pv51GGfd64Oaewk7vc8UMYbm/r/DyWoyonUNvv4+CyLk8KmIXlU1ilBAdFc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMJvBYWKoRUVn0ldMrrDd6oY+7VI6iu2sD1/9jA1J4k6FkPg4M
	CdO4q3h0UndmfvlluHcQTX/U71UAhb3FH2GKDIX3hBm7Z6cP0wUD49M+u/uj3w==
X-Google-Smtp-Source: AGHT+IFxRgnh5TFkVbFh1KqWaVZ4vB+b8rpPTnXsBkM79Vx9dIR/x3VfuolKk0oUUzoWNbhzlWyzTw==
X-Received: by 2002:a17:906:f5a1:b0:a99:42e7:21f with SMTP id a640c23a62f3a-a9de5ff9e6fmr4051501366b.37.1730970334637;
        Thu, 07 Nov 2024 01:05:34 -0800 (PST)
Message-ID: <3ee6d76d-25ee-4c14-a71a-e93d06812320@suse.com>
Date: Thu, 7 Nov 2024 10:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/13] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-2-carlo.nonato@minervasys.tech>
 <6e6f8e2a-ea16-4b48-ac70-23e72ade2b1a@suse.com>
 <CAG+AhRUtmpB1uSd5kW7zNjyDdmBcVCta9t5Qdu6ND+RYx3VUfQ@mail.gmail.com>
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
In-Reply-To: <CAG+AhRUtmpB1uSd5kW7zNjyDdmBcVCta9t5Qdu6ND+RYx3VUfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 17:09, Carlo Nonato wrote:
> On Tue, Nov 5, 2024 at 4:46 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.10.2024 11:50, Carlo Nonato wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -71,6 +71,9 @@ config HAS_IOPORTS
>>>  config HAS_KEXEC
>>>       bool
>>>
>>> +config HAS_LLC_COLORING
>>> +     bool
>>> +
>>>  config HAS_PIRQ
>>>       bool
>>>
>>> @@ -516,4 +519,23 @@ config TRACEBUFFER
>>>         to be collected at run time for debugging or performance analysis.
>>>         Memory and execution overhead when not active is minimal.
>>>
>>> +config LLC_COLORING
>>> +     bool "Last Level Cache (LLC) coloring" if EXPERT
>>> +     depends on HAS_LLC_COLORING
>>> +     depends on !NUMA
>>
>> Instead of this dependency, wouldn't it be more natural to suppress the
>> setting of HAS_LLC_COLORING by an arch when NUMA is on?
> 
> So moving the "depends on" in the HAS_LLC_COLORING definition? Yes I believe
> it would be better.

No. Putting it on an option without prompt will, iirc, only cause a warning
when violated, but will otherwise have no real effect. The "select" of
HAS_LLC_COLORING wants to become dependent upon !NUMA, until that combination
was made work.

>>> --- /dev/null
>>> +++ b/xen/common/llc-coloring.c
>>> @@ -0,0 +1,111 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Last Level Cache (LLC) coloring common code
>>> + *
>>> + * Copyright (C) 2022 Xilinx Inc.
>>
>> Does this need updating (if it can't be dropped)?
> 
> I don't remember what's the current policy for these copyright lines.
> Do you still use them? If they are used, should they reflect the history
> of the revisions of the patch series? I mean, in v1 it was "2019 Xilinx Inc."
> 2023-2024 would then be MinervaSys.

I don't know what the policy is either. I think it can be there or it can
be omitted. Yet if it's there, I think it wants to be accurate at least at
the time a new file is being added. (These lines usually aren't updated
when later changes are made to the files.)

>>> +void __init llc_coloring_init(void)
>>> +{
>>> +    unsigned int way_size;
>>> +
>>> +    if ( llc_size && llc_nr_ways )
>>> +    {
>>> +        llc_coloring_enabled = true;
>>> +        way_size = llc_size / llc_nr_ways;
>>> +    }
>>> +    else if ( !llc_coloring_enabled )
>>> +        return;
>>> +    else
>>> +    {
>>> +        way_size = get_llc_way_size();
>>> +        if ( !way_size )
>>> +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' missing\n");
>>> +    }
>>> +
>>> +    /*
>>> +     * The maximum number of colors must be a power of 2 in order to correctly
>>> +     * map them to bits of an address.
>>> +     */
>>> +    max_nr_colors = way_size >> PAGE_SHIFT;
>>
>> This discards low bits of the quotient calculated above, bearing a certain
>> risk that ...
>>
>>> +    if ( max_nr_colors & (max_nr_colors - 1) )
>>> +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr_colors);
>>
>> ... this panic() wrongly doesn't trigger.
> 
> Yes, but I don't care if way_size isn't a power of 2.

Well, you may not care, but imo the resulting configuration ought to reflect
what was requested on the command line (maybe unless e.g. documentation
explicitly says otherwise). If way_size has low bits set, that wouldn't be
the case.

Jan

