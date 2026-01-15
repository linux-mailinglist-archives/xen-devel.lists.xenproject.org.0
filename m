Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93649D2569F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205387.1519675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPRN-00073g-Fi; Thu, 15 Jan 2026 15:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205387.1519675; Thu, 15 Jan 2026 15:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPRN-00070y-C2; Thu, 15 Jan 2026 15:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1205387;
 Thu, 15 Jan 2026 15:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgPRL-00070s-MK
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:39:15 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 580f6593-f228-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 16:39:14 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so3899485e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 07:39:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6e1b7bsm6546085f8f.34.2026.01.15.07.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 07:39:13 -0800 (PST)
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
X-Inumbo-ID: 580f6593-f228-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768491553; x=1769096353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JidgEfI3Auog5+NvBHtFBi7soVJjFhRg70GZ295ltJY=;
        b=VYRUgIokBSiG0pl2iJzeeb5pJRyVKZsITbkL1Diy7bpczlkG/gpesCAA7HLpIIirvb
         +9QQNF1NEj/5cfWZcL1XR9cujnegsOpIK8Jk9euT/H4AmvXlz+wFN4LTFNsd4wEinL2r
         qlg6OLSXSPFlWczWdqLXtbq3hwtXNYa4aOFedYooE4imMeFPPnc0oX6Md1XDiRjmFPUR
         pSbqZ4sSuwgM7MCbFxqYMgItwLMf8k8SGvCke3WdTOJFMSzLQjwmVRDFMMn0dJhfK/pn
         jSDP/U8Tp71RWuxUWYpHm6ue16lLyyfQ2fpqq2jnf++d6GGpNarFjVl+tIGoRjA1wvFk
         7/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768491553; x=1769096353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JidgEfI3Auog5+NvBHtFBi7soVJjFhRg70GZ295ltJY=;
        b=rawSHCwwnXm7vxi7qdvxtdhQXrM9dNcjWAb2ttJnT4J66+ub5IC0dKrb306LDfC+0I
         AYZev6mit5OSaV6pXRMJvvMb0bUd96gZvG6YBP3LGIcNeY90UeByJIB6oFel5Aw8I8Ac
         7XvSJCfPO5ICUvgnigimM/MPBk9cCMD11WDzlX6rw5nKg3OsUHYpwaiB0DFbYW8OSF8z
         Yz9zj0SGTJiPd8sGEZ3/FpMtE6l/US5wkPaWEiic9bCRoW2u5BxrTAYbvZDOd8daJM6R
         Nv/kHn3rWFdoyF3/WoxI5t0XUVJCXY2QizoxzPP4D05n4FgsYx/CVR3O389oNFjdnE2j
         adxg==
X-Forwarded-Encrypted: i=1; AJvYcCWeJHYws5mXRpu3C+BKz/DptVDujL6guK4BXPQ87xcJoao/5uNgZFpi8bTXOAAx+a9stULofJUhBfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWLICrhCRaNPQuStcSlDhWJ+ssJVfZM5zlLMsBPrdaO4py1YpQ
	n4/PMQFP5baJeTNscDn3qea0q3bk/zWsPLctrT3au0YyU5vHcnqRjJhEyo/fFSS3cQ==
X-Gm-Gg: AY/fxX5ibRTwSXEs2wKLMWjGMXNTRhSKi9vQVULU8BNbr7UWOv6Gj6nkjOj7BXHjsGi
	pkY/a8OMxo5oOeereGzY5wQCP/Y0ZvWzLhK1FuUzvOxaEDKboCJtR4eT7Pm6OApqeMpHzft48vy
	aTixaT3XR7Qelbt9s+LD/cJNe1ojakB6dL6jm0dmjBjOToW4TH9020qCqfxpyh1B0byIlxjYFoU
	McvqtzDWXLidJ8iF407rwTm3GctL3/Sgqj/YRSb8joiMUZ+yCDbuvsF8PoO/wxJaDASOockeH+W
	JotsvuG+smJqt9RtcvvskJn3n8LxtnZMuweDFDz9A2frwFXQOp8JtpA0F2cWwKFrxfEiq5EzKW8
	RhP14b+Z/qsFwBA/fRnm0gANF5qVIIgGgQaNRkZi9D46bYadKuGcRWuBiNW4TZH9C7UUPqpoWRQ
	poPSJjVObEiuBYySTDPAcMqa/xz/bIdbOMP3hqc2PWSzEmT/6rRdtMQ+djjazWVjqIv039TruyH
	cvCGgCBIdOfJQ==
X-Received: by 2002:a05:600c:8b8c:b0:480:1c10:5633 with SMTP id 5b1f17b1804b1-4801e341a87mr2178615e9.26.1768491553475;
        Thu, 15 Jan 2026 07:39:13 -0800 (PST)
Message-ID: <2703684c-4ad5-44e2-a8fc-4d5b40de2d3d@suse.com>
Date: Thu, 15 Jan 2026 16:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] lib/arm: Add I/O memory copy helpers
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
 <d166348530b9229673e1a6e3b29ff4ee9123ab2f.1768415200.git.oleksii_moisieiev@epam.com>
 <bf3e38f1-d88a-445a-b55b-a13d401dba80@suse.com>
 <8539bed5-280f-4dcc-a63d-4c0ee3b7cff7@suse.com>
 <c1f9885a-3e0a-4964-acfc-95f4c86aef06@epam.com>
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
In-Reply-To: <c1f9885a-3e0a-4964-acfc-95f4c86aef06@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 16:34, Oleksii Moisieiev wrote:
> On 15/01/2026 13:59, Jan Beulich wrote:
>> On 15.01.2026 10:26, Jan Beulich wrote:
>>> On 14.01.2026 19:29, Oleksii Moisieiev wrote:
>>>> --- /dev/null
>>>> +++ b/xen/lib/arm/memcpy_fromio.c
>>>> @@ -0,0 +1,48 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +#include <asm/io.h>
>>>> +#include <xen/lib/io.h>
>>>> +
>>>> +/*
>>>> + * Use 32-bit raw IO operations for portability across ARM32/ARM64 where
>>>> + * 64-bit accessors may not be atomic and some devices only support 32-bit
>>>> + * aligned accesses.
>>>> + */
>>>> +
>>>> +void memcpy_fromio(void *to, const volatile void __iomem *from,
>>>> +		   size_t count)
>>>> +{
>>>> +	while ( count && (!IS_ALIGNED((unsigned long)from, 4) ||
>>>> +			  !IS_ALIGNED((unsigned long)to, 4)) )
>>> Nit: Xen style indentation (no hard tabs) please throughout.
>>>
>>>> +	{
>>>> +		*(uint8_t *)to = __raw_readb(from);
>>>> +		from++;
>>>> +		to++;
>>>> +		count--;
>>>> +	}
>>>> +
>>>> +	while ( count >= 4 )
>>>> +	{
>>>> +		*(uint32_t *)to = __raw_readl(from);
>>>> +		from += 4;
>>>> +		to += 4;
>>>> +		count -= 4;
>>>> +	}
>>>> +
>>>> +	while ( count )
>>>> +	{
>>>> +		*(uint8_t *)to = __raw_readb(from);
>>>> +		from++;
>>>> +		to++;
>>>> +		count--;
>>>> +	}
>>>> +}
>>> Barrier requirements on Arm aren't quite clear to me here: Is it really correct
>>> to use __raw_read{b,w,l}() here, rather than read{b,w,l}()? If it was, wouldn't
>>> a barrier then be needed at the end of the function?
>> Thinking about it, as the order of MMIO accesses needs to be guaranteed
>> (unless you have extra information about the area's properties, like it
>> being a video frame buffer), I'm pretty sure now that read{b,w,l}() needs
>> using here. In fact the comment in the header says that it would handle
>> "Memory ordering and barriers" when it doesn't look as if it did.
>>
>> Note how Linux looks to have grown multiple flavors: Besides
>> memcpy_fromio() I can also spot at least fb_memcpy_fromio() and
>> sdio_memcpy_fromio().
>>
>>> And then, if it was read{b,w,l}() that is to be used here, what about all of
>>> this would then still be Arm-specific? Hmm, I guess the IS_ALIGNED() on "to" is,
>>> but that's Arm32-specific, with Arm64 not needing it? Plus then it's again not
>>> exactly Arm-specific, but specific to all architectures where misaligned
>>> accesses may fault.
>> There's a bigger issue here, with access granularity (despite the header
>> claiming "Implement alignment handling for devices requiring specific
>> access sizes"). MMIO can behave in interesting ways. The header comment
>> says nothing as to restrictions, i.e. when these functions may not be
>> used. Yet consider a device registers of which must be accessed in 32-bit
>> chunks. As long as the other pointer is suitably aligned, all would be
>> fine. But you handle the case where it isn't, and hence that case then
>> also needs to function correctly. At the same time accesses to a devices
>> requiring 16- or 64bit granularity wouldn't work at all, which for
>> required 8-bit granularity it would again only work partly.
>>
>> How much of the above requires code adjustments and how much should be
>> dealt with by updating commentary I don't know, as I know nothing about
>> your particular use case, nor about possible future ones.
>>
>> Also note that the header comment still references the ..._relaxed()
>> functions, when then implementation doesn't use those anymore.
>>
>> Jan
> Hi Jan,
> 
> Thank you very much for your valuable input and involvement.
> 
> After further research and reconsidering all the points you raised, I 
> have decided
> to switch to using the ordered MMIO accessors (readb/readl and 
> writeb/writel).
> 
> Here is my reasoning:
> 
> The concern you mentioned was valid: the use of __raw_read*/__raw_write* 
> in the
> helpers did not provide the ordering guarantees expected for MMIO 
> copies, and the
> header still referenced *_relaxed, even though the implementation no 
> longer used
> them. This could allow reordering around the copy and misrepresent the 
> intended
> semantics.
> 
> A few additional thoughts regarding your other questions:
> 
> Is it still Arm-specific?
> Functionally, the logic could work on any architecture that supports 
> 8/32-bit MMIO
> accesses and uses the same accessor semantics. However, this implementation
> relies on Arm’s read*/write* ordering guarantees, as well as the 
> Arm-specific
> IS_ALIGNED check to avoid misaligned faults. Therefore, it remains 
> Arm-specific
> as written; other architectures would need their own implementations if they
> have different alignment or granularity requirements.
> 
> Ordered accessors vs. raw accessors + trailing barrier:
> I chose to use ordered accessors instead of raw accessors with a 
> trailing barrier
> because readb/readl and writeb/writel already provide the required 
> device ordering
> and barrier semantics, making an additional barrier unnecessary and 
> solving potential
> ordering issues.
> 
> Use for register access:
> These helpers are suitable for MMIO buffers, shared memory, and 
> registers that
> tolerate 8-/32-bit accesses. They are not appropriate for registers that
> require 16- or 64-bit accesses, or where side effects depend on the exact
> access width. I'll update the header to document this limitation; 
> drivers needing strict
> register semantics should continue to use readl/writel
> (or readw/writew/readq/writeq) directly, rather than memcpy_*io().
> 
> Summary:
> 
> I have made the following changes to the helper functions:
> 
> - switched to ordered accessors to address the ordering and barrier 
> concerns.
> - updated the documentation to match the implementation and explicitly state
> the supported access sizes and granularity.
> 
> If this approach sounds good to you, I will proceed with the fix and 
> submit a new version.

At the first glance it looks okay, but please allow Arm folks to give their
opinion. And of course my final take will be available only once I see the
next version.

Jan

