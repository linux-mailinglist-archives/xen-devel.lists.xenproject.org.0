Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE9B14868
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 08:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062080.1427693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uge5b-0004Oa-5t; Tue, 29 Jul 2025 06:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062080.1427693; Tue, 29 Jul 2025 06:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uge5b-0004LT-1e; Tue, 29 Jul 2025 06:45:31 +0000
Received: by outflank-mailman (input) for mailman id 1062080;
 Tue, 29 Jul 2025 06:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uge5Z-0004LN-Es
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 06:45:29 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c4b12fc-6c47-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 08:45:27 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so2840728f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 23:45:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76702db3843sm4962211b3a.23.2025.07.28.23.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 23:45:25 -0700 (PDT)
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
X-Inumbo-ID: 9c4b12fc-6c47-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753771526; x=1754376326; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XeqjBVzOfYz82zfqZM7GzmzxLRA6HtcM449jUSJ+hdY=;
        b=IW1xQILcF/GUXFZh8nsbYgYOpgpLFW4cxW63lBzGZVp1EApCv1r+mrL55JXilfYQGz
         b3LgRbPlwPF1B8t9i/1uoCY2IK8n0J6tbs1CucfViZVp/SQNiPR3cbF36F9D7FdS+mWV
         pMN21ta+VkqZ1rbWUguHch/DOqmlNqJWnOyUgq2A9fTG+3nnBct7C84dAxpL++J5Rae8
         Q5ZGB1H6XwuoczaT7ghaYG74bOXmgRpAbLHnDYZykKyIvHNoNX84rKCcIGNWBGFfjr+9
         XOfP5R+zZu7+QWWGF6b3KCu36el+KFTnB0kCry1Rm8SMZR6Wuy7XLUFeqPXh7/u3sco8
         RTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753771526; x=1754376326;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeqjBVzOfYz82zfqZM7GzmzxLRA6HtcM449jUSJ+hdY=;
        b=jzqvnMCwPr4n1/pHY+sXRKOjFgYpuGaz2or71et5tJNEQN4VzWRztfytRgJtA+3pMY
         ye0mMktIVmHMfGTJJnvKrYOP00yCcf2nyMoK+RgQggbpMpMaE/RLAsOjxqMZ8oaxE75p
         EAgLpg4rJhuSNu3zkMCfsPZsKI+ajtWgp28cikB6+hzL61h+ULKKYMtUYn5R5WYzAWeU
         e4/4rPWaVnN9vINxTvOw9bN51RoVdYTC3yk0OjHak6l87278EMqi1xUI2DZEgMp+YqQs
         2Gqpdm4gY2ByPGsLixSMgA5nrBYGzC2FQWuDNWNiXDT+9/60sS5OEw+AwbYiOvxPGw6w
         jdtg==
X-Gm-Message-State: AOJu0YyjyAMdyot+0jCmEUavmvtyW3lojDLvePWuwVugI/8i/08itrLG
	6ypLYrGCyuIX0dxn9QtKAtCtVaBcp0rB7DAfrG/3s1J/0PBQZsd7ZnkFxYIpn1pEUw==
X-Gm-Gg: ASbGncs2TiU2VIxkfIQ8YWZ447uc7mgfBMhQdDfNXLcgfK2GRCihF3EOzRh0fn1GfWb
	2sPY4PbtwyVlRCtFBgAWEllude3Ige92jJeBHwblsJ55t2urtSo4ghfSEPYII5tKRTzrzC9RgF+
	fFP79+/JqQcoqN85CzxLXN8t+wLYAEicxjKRz1gJ7Qwy+mNPR2ODcAD7L1/CYGrMaWWUeBtc4j6
	5yA+OQgUHYO0p/sF2c4vtOcF4C0AeXheUt9i1llIDlbMXedfxq1LNGXU2BjB/RKgnKWhySnlEbU
	THrVLzqAPXTEV7qdTjUHtzRJ/TBLJ2SIdD3tBFVqF7+bKP1jmFbSV6MWc0UfpM1A2OGIy/KEM2V
	OT05565tjLRASx51CGdmv5ajuoJH8jkjuE1XPCQlci5cFNd8hLza2pBrGkGHGQN2dioXYTA9wZQ
	o4n43nUh8=
X-Google-Smtp-Source: AGHT+IHceBHMrl5pKs1jopgapT67NcdwWnnwr23AgDv7TBldsJZCf7V/a9BeCwBlWbj0xhyij+6o1w==
X-Received: by 2002:a05:6000:2008:b0:3a6:d5fd:4687 with SMTP id ffacd0b85a97d-3b77672cc25mr10450546f8f.18.1753771526373;
        Mon, 28 Jul 2025 23:45:26 -0700 (PDT)
Message-ID: <8f9e19b4-e29c-476d-b820-8bc9d590de0c@suse.com>
Date: Tue, 29 Jul 2025 08:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 03/10] arch-x86/pmu.h: convert ascii art drawing to
 Unicode
To: Edwin Torok <edwin.torok@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, andriy.sultanov@vates.tech,
 boris.ostrovsky@oracle.com
References: <cover.1753372928.git.edwin.torok@cloud.com>
 <99651231c4b535cdba21c852f3ec7c28c00a8088.1753372928.git.edwin.torok@cloud.com>
 <e309b129-32d9-467a-8577-c25771721e47@suse.com>
 <CAEfZLvkpj6_BhkCL0YfyTb89k=Vkb=qk7wRA3+mMhqKSQmYpBg@mail.gmail.com>
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
In-Reply-To: <CAEfZLvkpj6_BhkCL0YfyTb89k=Vkb=qk7wRA3+mMhqKSQmYpBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2025 18:07, Edwin Torok wrote:
> On Mon, Jul 28, 2025 at 11:23 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.07.2025 17:06, Edwin Török wrote:
>>> Use `aa2u` (ascii-art-to-unicode from Hackage) to convert to
>>> Unicode box drawing characters.
>>>
>>> The full list of supported drawing characters can be seen in the
>>> examples at:
>>> https://github.com/fmthoma/ascii-art-to-unicode/blob/master/src/Text/AsciiArt.hs
>>>
>>> For future maintenance: conversion can be done incrementally
>>> (mixing ascii art with already converted Unicode,
>>>  and running the conversion tool again), or by hand.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Edwin Török <edwin.torok@cloud.com>
>>> ---
>>>  xen/include/public/arch-x86/pmu.h | 120 +++++++++++++++---------------
>>>  1 file changed, 60 insertions(+), 60 deletions(-)
>>
>> I'm already unconvinced of the earlier patch: The whole construct isn't self-
>> explanatory, and it lacks a legend. There's also the question of legibility.
>> The change here has the main problem of making readability dependent upon the
>> capabilities of the editor / viewer / etc one is using. For example, the '┆'
>> character as well as the arrow ones I can't get Win10's console subsystem to
>> display properly.
>>
> 
> The original ASCII diagram could also be moved to another file that
> contains only documentation and is not used during compilation.
> There is https://ivanceras.github.io/svgbob-editor/ which can then
> create an SVG out of it if needed.
> The SVG (or its ASCII source) wouldn't be restricted to 80 chars, and
> could contain more details.
> 
> Although if it is a separate file it is more likely to go stale when
> the .h is updated.
> 
> Here is a solution that works with ASCII instead then (the diagram
> itself is not very readable in pure ASCII).
> I think my main goal was to understand what the flexible array member
> would contain, and that could actually be explained in a sort of
> pseudo-C.
> Something like:
> 
> ```
> struct ... {
>  uint32_t fixed_counters;
>  uint32_t arch_counters;
> ....
>   union {
>       uint64_t regs[];
>       struct {
>            uint64_t fixed[fixed_counters];
>            struct xen_pmu_cntr_pair arch[arch_counters];
>       }
>   }
> }
> ```
> 
> This isn't (yet?) valid C, although it follows the trend the C
> standard is evolving to, e.g. you can already refer to array
> dimensions in function arguments, where the array dimension is another
> function argument, in fact the manpages already started to get updated
> to follow this new style, and newer versions of GCC support it, e.g.
> memcpy: https://man7.org/linux/man-pages/man3/memcpy.3.html
> I don't know whether future C  standards would ever add support for
> flexible array members where the size depends on another struct field,
> but it should be fine as a comment, and perhaps easier to maintain
> than a diagram. If it ever becomes valid C it can be promoted from a
> comment to actual code.

Somewhat related (but afaict not really usable here, leaving aside that
this is a public header and hence needs to remain free of extension uses)
is gcc's relatively new counted_by attribute.

> It'd retain the main benefit: being able to see the memory layout,
> without having to read through the source code and all the
> sizeof/offset pointer calculation to figure out what is actually
> stored in regs[] and how big it could be.
> 
> What do you think?

Why not.

Jan

