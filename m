Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75ABA0477B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 18:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866705.1278046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCxk-0000j4-Gn; Tue, 07 Jan 2025 17:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866705.1278046; Tue, 07 Jan 2025 17:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCxk-0000gR-E4; Tue, 07 Jan 2025 17:01:52 +0000
Received: by outflank-mailman (input) for mailman id 866705;
 Tue, 07 Jan 2025 17:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVCxi-0000gG-U8
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 17:01:50 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 153f0ecb-cd19-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 18:01:48 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361c705434so114366105e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 09:01:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828cc8sm50784301f8f.17.2025.01.07.09.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 09:01:47 -0800 (PST)
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
X-Inumbo-ID: 153f0ecb-cd19-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736269308; x=1736874108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9Raw7Do+gupPmbHumzSkDywp+redY4zIMpdNkF5IBKE=;
        b=LPQdMa/yzciacziwjZEAzdKQtdF7UawazJ8icQeFJsKo8H7nUCr8CaAwt5sqsWAKs6
         1UsWR2R/EvdUveLk7nMLfJgElolVMxmHi+zw4uvtCTiU5IIicguk4u6ZggDvtC4Saqb2
         ENjJwhAHv8bweaSq3yFT+bP81XoMzfEWjgV40YiS/elnvYfyUvq04zBudFOsxTvyXNUI
         F3Mpy/H+Yx4lebGHkNBLcaP3Fa9Mxv2XC4Vn60PHtdhiZIh1UfP6ZV3S/m0/akuHUy/W
         m0bYWlrO343hpSbPYEIfAkoA/YgKUOixPt50mCaCRlfBtBV96u6EFSO/mdUVwd0CtfK4
         hwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269308; x=1736874108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Raw7Do+gupPmbHumzSkDywp+redY4zIMpdNkF5IBKE=;
        b=wKrvC+iTgwbwIWoWB9/3GjkR8WYgnNNawgbB2UU9lVQia88hm0Rxx0QhGogiqf94rw
         p4l28wuYLOG7qmC6RiYXj0PLKpaIFLBjgj4BNzxSaL6tjGvDkBDSPS2U4n/67JfNTYTC
         u0nbpB//JTq1si9s1IdLQVe9Li0DDptu5+8lkiyJndww33dSL4B8KDbkCyg+wgYSU1NB
         XLyAtiYIDIBd2LYPHvln+VaCEuqtd12GFHTMwlH249afGoLFYwNxNXfPgHwonO5xIIpo
         VELOK0E58+uwzWou6gARyQahiaba+w5b5y3A/RHE4NKsTK1nJdVClcnufe6FWBzxKOpY
         D2bA==
X-Gm-Message-State: AOJu0YzLxoO9MSuU52tFZCyY/APYsuJLhREJvtuwE+22Iw8B/vXOYung
	Uny5R5OjotknKOtDE+CRJQH/kONaCwXHonSObx5GQtoekp8ZsbhvABjSGVweAg==
X-Gm-Gg: ASbGncvrvEwqjOy/TAGhMpj2z4IY/K8lYFhokthf1YPstUze/z/bMtk46yUjPnFh9oC
	hilt3RxT9mah/RcaV2nPglvhvrUd3o+wYYbUSubPFH2uz0+qJb4gduvMYjwVNffHCTiQmwUVgeg
	p3dC6MGUBdjcTj0CQ7Ni0fuElSlQjrEW5Kf5iDJhkoMeBV3BxLZX5nmkaoXZQumrvsLM/xyxy3D
	4MOTbQGt1nNTp/6T8Elyv++QFkn+pWJbjbh3piJQYv3Bww1F9FFmOEkw9t1zZBz8OBJoOJgAJCu
	bGuq7dgAYWzpvnfOxLQKLR/spy0YAW2J8WmmNU1B7Q==
X-Google-Smtp-Source: AGHT+IHDvZudkWN3cUncN9bg4uCSEHekI96ClsEMZ8HJBeEaCNSWYlpzYEAGMdzLkaIjxhmkzFvV4Q==
X-Received: by 2002:a5d:584b:0:b0:386:373f:47c4 with SMTP id ffacd0b85a97d-38a224053d8mr54994968f8f.49.1736269307839;
        Tue, 07 Jan 2025 09:01:47 -0800 (PST)
Message-ID: <6a0a096b-47c2-4568-be9f-9f230bc6df23@suse.com>
Date: Tue, 7 Jan 2025 18:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20] Re: [PATCH v12 12/12] xen/arm: add cache coloring
 support for Xen image
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech,
 marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
 <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
 <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
 <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
 <0062e0cf-0830-4d16-942d-348e6d33a2c4@xen.org>
 <5c153764-4a1d-4233-a9d2-fa5ec0aff6ac@amd.com>
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
In-Reply-To: <5c153764-4a1d-4233-a9d2-fa5ec0aff6ac@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2025 17:51, Michal Orzel wrote:
> 
> 
> On 07/01/2025 17:42, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> On 16/12/2024 14:36, Jan Beulich wrote:
>>> On 16.12.2024 15:28, Carlo Nonato wrote:
>>>> On Mon, Dec 16, 2024 at 2:56 PM Michal Orzel <michal.orzel@amd.com> wrote:
>>>>> On 13/12/2024 17:28, Carlo Nonato wrote:
>>>>>> --- a/xen/arch/arm/arm64/mmu/mm.c
>>>>>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>>>>>> @@ -1,6 +1,7 @@
>>>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>
>>>>>>   #include <xen/init.h>
>>>>>> +#include <xen/llc-coloring.h>
>>>>>>   #include <xen/mm.h>
>>>>>>   #include <xen/pfn.h>
>>>>>>
>>>>>> @@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
>>>>>>   }
>>>>>>
>>>>>>   extern void switch_ttbr_id(uint64_t ttbr);
>>>>>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>>>
>>>>>>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
>>>>>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>>> +
>>>>>> +void __init relocate_and_switch_ttbr(uint64_t ttbr) {
>>>>> CODING_STYLE: { needs to be on its own line
>>>>>
>>>>> Also, this function is only executed in case of LLC coloring, so shouldn't it
>>>>> be #ifdef protected.
>>>>
>>>> Here and in other places (patch #8) I'm relying on DCE to remove functions
>>>> that are not called. This was a suggestion from Jan in that patch. Can we
>>>> adopt the same here?
>>>
>>> Yet how would the compiler spot that the function is unused? That would only
>>> work with LTO / WPO. DCE (as I did suggest elsewhere) requires the functions
>>> in question to be static (allowing the compiler to see enough of the whole
>>> picture).
>>
>> Sorry for the late answer. I was away with limited e-mail access. While
>> looking what was committing recently, I noticed that a dummy function
>> was introduced:
>>
>> void __init relocate_and_switch_ttbr(uint64_t ttbr) {}
>>
>> If a function is not supposed to be called, then it should contain a
>> BUG_ON() to catch any misusage. Otherwise, this is a recipe for
>> disaster. In this case, it would not be trivial to notice the TTBR was
>> not switched...
>>
>> That said I would have actually considered to remove the empty stub. I
>> am a bit surprised that DCE wouldn't work in this case because the call
>> is protected with "if ( llc_coloring_enabled )". When cache coloring is
>> not enabled, this would turn to an "if ( false )" and therefore all the
>> code should be removed. What did I miss?
>>
>> Note that this is what we already rely on for arm32 because there is no
>> stub... So if this is problem then we definitely need to fix it on arm32
>> as well...
>>
>> IOW, we either introduce a stub (including the BUG_ON) for both arm32
>> and arm64 in the header or we remove the stub completely.
>>
>> Marco, Michal, can you have a look? Ideally, this should be fixed for 4.20.
> I did a test with GCC 13.2 and I can compile it fine with stub removed. That said,
> I'm not a compiler expert and I'm not sure if this behavior stays the same with different
> compiler options/optimizations. So it's more like a question to Jan. I'm happy either way.

We use the same (if(...) func();) in various places, relying on said DCEing
of the call when the condition is compile-time-false. I see no reason why
it couldn't be used here as well.

Jan

