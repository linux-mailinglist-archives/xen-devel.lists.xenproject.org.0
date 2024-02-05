Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3D6849654
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 10:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675706.1051096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvAF-00038O-SM; Mon, 05 Feb 2024 09:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675706.1051096; Mon, 05 Feb 2024 09:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvAF-000356-P5; Mon, 05 Feb 2024 09:21:19 +0000
Received: by outflank-mailman (input) for mailman id 675706;
 Mon, 05 Feb 2024 09:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWvAE-00034W-FV
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 09:21:18 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e94ccb89-c407-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 10:21:15 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33adec41b55so2643538f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 01:21:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4c8b000000b0033b3d726d41sm1548046wrs.104.2024.02.05.01.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:21:14 -0800 (PST)
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
X-Inumbo-ID: e94ccb89-c407-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707124875; x=1707729675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2Q/2D/uhkEc/IQYeaxz94TrTCI22fhTLhvc0BslLEA=;
        b=ceXwaxlyCW5g5ySp8VEF9RJ+OMGAkSFe7I/P70zyGxeAt878sG3lRe9XD5hxUeP1xy
         uE2XWfWwG8UkPmURlyVxOtX6HbeVa2cDuOgDfGvAK2Ba9nLGUu++22yf/iCXRAyFJbTG
         q8XrajsJH9TDbuRBZR/hl7y6sbjOno2P/DNaZL/ysrHFEmTl0/vOyxSPI6VFpaP7Vqpy
         fbSxQaN80So4FcZ/yN39h40xMSLhqaKIYEDmBKeFfwVkHzaMBhG9g8usf/Kr8XnWTH2m
         lqd190ePS1h44hgi4O9oZemXzif8rvtDtdd+b0YVPEU5i9pq0775HwWP1w354l7S4niR
         JvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707124875; x=1707729675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2Q/2D/uhkEc/IQYeaxz94TrTCI22fhTLhvc0BslLEA=;
        b=Mr5Ddrud+7Z12N7tJmd5KpyxX+9piJ/rH3tGfvuQCVuBjhLUNqExBZPzA296HJEYZC
         8r2u8pCUowq7zifnAe6GrpIFmPna5HjYAxXEdNDAuRuE4s6Lda9xoxsjkTbWnyRZp1JV
         mHWy/yoYG1fUPtNu7Czv36DzOMHKLslJ17keMsHpiEmWs3GuWxpHYSfHfCbl3Qqx8HYw
         GhS+8LJHZBdvPcUAQCIV1h1xa0tFKbja+MxXns7zy+za3evRYWvQHt+tL60fi3mdYN6b
         FSwm/Be9SyKK41QW8YFuOlRrYSpe1/6J3Rgw/KxrVGxUfJPDGnM6Leu5Oin+eb33WPe/
         HxZA==
X-Gm-Message-State: AOJu0Yw9Q2B1iU0sUHk5ysREO/aBwVGsGHlVEDq8QUm6QD9CxwMre4rr
	VGol+abTIscSQpAgUPt8+1AVZstYXdxhWnAkHbXANFl+bBaiLF7Tli6X0tXLT1M2WptVpyDKi0s
	=
X-Google-Smtp-Source: AGHT+IFyGq0q46qH+HMAV51w/HNQwcRlTZ6iiKJ49W2J8Te4rvK82boWbnSq4dl8koxPX+FG2rwycQ==
X-Received: by 2002:adf:f009:0:b0:33b:14fa:53ea with SMTP id j9-20020adff009000000b0033b14fa53eamr7071779wro.33.1707124874844;
        Mon, 05 Feb 2024 01:21:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXL4JSi5sFMa4vvqImThemsdDuYcoSFErj2K9v8bUigUkhPoS5VM/pyFrpHFw5bW/9gl/bEYVgLBBWBXzg6stdpFPH+SbxVLHHiTOJi2TdoyID02uwzhw3L3IHy4hoV18jzIg30hw6priMcnULHc/Vdgqucxv1nmtr/KhFiwgRFBghNLJlvYpJNJTL/MjBL/AYLADBlUt2D8q023ToVq0F7iIsjFGVPUXhLUpQt6ygcX5X+QQizKmHk6kKSXU54MzVG3ywsSGQvRwQsfzdOx6r2OQ4CvUmU
Message-ID: <101c9449-8eab-477b-8f41-fb6c2c70c97a@suse.com>
Date: Mon, 5 Feb 2024 10:21:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech>
 <42eabd87-b245-44e3-9945-40b1a5c5eaf5@suse.com>
 <CAG+AhRVjiqjae+Lwdk71OkF=X93m+CNLFYpK65h+O1kozOgtew@mail.gmail.com>
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
In-Reply-To: <CAG+AhRVjiqjae+Lwdk71OkF=X93m+CNLFYpK65h+O1kozOgtew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2024 11:57, Carlo Nonato wrote:
> On Wed, Jan 31, 2024 at 4:57 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.01.2024 18:17, Carlo Nonato wrote:
>>> +Background
>>> +**********
>>> +
>>> +Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
>>> +to each core (hence using multiple cache units), while the last level is shared
>>> +among all of them. Such configuration implies that memory operations on one
>>> +core (e.g. running a DomU) are able to generate interference on another core
>>> +(e.g .hosting another DomU). Cache coloring allows eliminating this
>>> +mutual interference, and thus guaranteeing higher and more predictable
>>> +performances for memory accesses.
>>> +The key concept underlying cache coloring is a fragmentation of the memory
>>> +space into a set of sub-spaces called colors that are mapped to disjoint cache
>>> +partitions. Technically, the whole memory space is first divided into a number
>>> +of subsequent regions. Then each region is in turn divided into a number of
>>> +subsequent sub-colors. The generic i-th color is then obtained by all the
>>> +i-th sub-colors in each region.
>>> +
>>> +::
>>> +
>>> +                            Region j            Region j+1
>>> +                .....................   ............
>>> +                .                     . .
>>> +                .                       .
>>> +            _ _ _______________ _ _____________________ _ _
>>> +                |     |     |     |     |     |     |
>>> +                | c_0 | c_1 |     | c_n | c_0 | c_1 |
>>> +           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
>>> +                    :                       :
>>> +                    :                       :...         ... .
>>> +                    :                            color 0
>>> +                    :...........................         ... .
>>> +                                                :
>>> +          . . ..................................:
>>> +
>>> +There are two pragmatic lesson to be learnt.
>>> +
>>> +1. If one wants to avoid cache interference between two domains, different
>>> +   colors needs to be used for their memory.
>>> +
>>> +2. Color assignment must privilege contiguity in the partitioning. E.g.,
>>> +   assigning colors (0,1) to domain I  and (2,3) to domain  J is better than
>>> +   assigning colors (0,2) to I and (1,3) to J.
>>
>> I can't connect this 2nd point with any of what was said above.
> 
> If colors are contiguous then a greater spatial locality is achievable. You
> mean we should better explain this?

Yes, but not just that. See how you using "must" in the text contradicts you
now suggesting this is merely an optimization.

>>> +How to compute the number of colors
>>> +***********************************
>>> +
>>> +To compute the number of available colors for a specific platform, the size of
>>> +an LLC way and the page size used by Xen must be known. The first parameter can
>>> +be found in the processor manual or can be also computed dividing the total
>>> +cache size by the number of its ways. The second parameter is the minimum
>>> +amount of memory that can be mapped by the hypervisor,
>>
>> I find "amount of memory that can be mapped" quite confusing here. Don't you
>> really mean the granularity at which memory can be mapped?
> 
> Yes that's what I wanted to describe. I'll change it.
> 
>>> thus dividing the way
>>> +size by the page size, the number of total cache partitions is found. So for
>>> +example, an Arm Cortex-A53 with a 16-ways associative 1 MiB LLC, can isolate up
>>> +to 16 colors when pages are 4 KiB in size.
>>
>> I guess it's a matter of what one's use to, but to me talking of "way size"
>> and how the calculation is described is, well, unusual. What I would start
>> from is the smallest entity, i.e. a cache line. Then it would be relevant
>> to describe how, after removing the low so many bits to cover for cache line
>> size, the remaining address bits are used to map to a particular set. It
>> looks to me as if you're assuming that this mapping is linear, using the
>> next so many bits from the address. Afaik this isn't true on various modern
>> CPUs; instead hash functions are used. Without knowing at least certain
>> properties of such a hash function, I'm afraid your mapping from address to
>> color isn't necessarily guaranteeing the promised isolation. The guarantee
>> may hold for processors you specifically target, but then I think in this
>> description it would help if you would fully spell out any assumptions you
>> make on how hardware maps addresses to elements of the cache.
> 
> You're right, we are assuming a linear mapping. We are going to review and
> extend the documentation in order to fully specify when coloring can be
> applied.
> 
> About the "way size" it's a way of summarizing all the parameters into one.
> We could ask for different cache parameters as you said, but in the end what
> we are interested in is how many partitions is the cache capable of isolate
> and how big they are. The answer is, in theory, as many partitions as the
> number of sets, each one as big as a cache line, bacause we can't have
> isolation inside a set.
> Then memory mapping comes into place and the minimum granularity at which
> mapping can happen actually lowers the number of partitions.
> To recap we can isolate:
>     nr_sets * line_size / page_size
> Then we simply named:
>     way_size = nr_sets * line_size
> Another way of computing it:
>     way_size = cache_size / nr_ways
> 
> We are ok with having two parameters: cache_size and nr_ways which are even
> easier and intuitive to find for a normal user.

Right, that's the aspect I was actually after.

Jan

