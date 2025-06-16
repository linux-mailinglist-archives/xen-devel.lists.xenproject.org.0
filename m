Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C4ADA9DD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 09:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016808.1393741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4bc-0004HE-1a; Mon, 16 Jun 2025 07:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016808.1393741; Mon, 16 Jun 2025 07:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4bb-0004ES-US; Mon, 16 Jun 2025 07:50:11 +0000
Received: by outflank-mailman (input) for mailman id 1016808;
 Mon, 16 Jun 2025 07:50:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR4ba-0004EM-SE
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 07:50:10 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85dd8adc-4a86-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 09:50:08 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6086502e750so8056884a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 00:50:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4a5e6dbsm5659778a12.51.2025.06.16.00.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 00:50:07 -0700 (PDT)
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
X-Inumbo-ID: 85dd8adc-4a86-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750060207; x=1750665007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6kIqImNNLiwwjb6q/5i63GH9z5wMs+JvGmTmcsIbFDY=;
        b=bA6PRGU54sSbPveP4DkfTI0Xf/qip15WVFka2bMZNN8z5DO6ACCkyzRMMHCZtbnBBM
         gAYl4CZr7DFB49Fh9/yLFhSuAJaAwIXmIHuCjB8hY0c9K63MPOwvk8zc45BO1UC/3tjE
         jxYOkFeYaw6XsW5cfNyP4iQKTpp2g9sr3ld7g217Qu42InSxpk5l6QFA00HdDCN2ucAw
         fl53XCjZf7eF7u1zqunQ6ZCU1vgP46sR0/LHROCRHVMdc1MgAnLsuUxv+0WjVpCaJ1NF
         1aS7tx9UVPtY18w4Ibu3m8XqEujv2CgddaNBMclytwLj/00g9rA/X5UXUjDuutCO5h49
         skow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750060207; x=1750665007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kIqImNNLiwwjb6q/5i63GH9z5wMs+JvGmTmcsIbFDY=;
        b=Cv9sWDeEf/v7enlI06G3Tg7Wh6T2ub4Ga064uaDO2t2auaSsGzc+zslfhFgXcP0WCw
         hygOhLmfsUuCVN0ZXCxjUkAy2zbLMnwKEvBEXA/iC+CgQWuQqYjeqZc5g23xWUTjt4x5
         yDG4ZDvbtOlRCf73gPe/Cd/ar67mRDECx21VrS2eKwKbJjK9+WU5+Mxm/53rUwy8rbvl
         mytg9XtbXHw8jsEzpLpyO+rlEucsvPG2pHINYnu1X8Cd+joiWCwfT3DWhr2tIKFvkn3B
         C7coOF5CLbSEEgP6AL/q0BY/SvGGFwyAdBQT1eIPUGOLnxsw9a+qz9VbL6l7SFxhviYL
         oBfg==
X-Forwarded-Encrypted: i=1; AJvYcCVKCUYDO71mazFWIupHSXvx9mZPUUr89U6GdR8gXDY8vKwbM3GzdSIFuMGwFzzrEr/YoH5CqrLQyWQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzR7iSX9IP9X/ZGrVxNTH9S4LqWXkwvwTOPskd69M20QC+da9tW
	7F/miiJzLBbklsY96KnfJZAE6/FlgiZYNLynzRcgbDQIxT7Hn7IFseg8mO7yc4iPxA==
X-Gm-Gg: ASbGncuCyysnD+l+5IMtEPNebvcic0c/lc1DiJ5v18KGTM90KBcXkEkm3TthgQYhYfZ
	qvmsA5jAV+NnJnu2U/rfobmSr3WH3w6aU5Do8/p3Nf3ryJ5rI6941tryQYFwr6MOyczesT3mrRI
	vL4+VgJpk22Kafv6dOehOyKGYMX9ZRVvhBcuwGBNeNNg63gN2UYAQlZOGaCuVpTwCQ4l5xg69gw
	zoi9meWaqvy1HBNxR/+0HHkRXXQ/lTVxIkbUDS9tAizruUXtM6lEi3kWhXOpclaVy/DxVl/XX6O
	ulGFf5PKPN4FGK2Ob6GFEjQB/UxJyWPiUb73qik6Kv3rIAe4Gtvr+kFFpyX1Q9Nnngqw5Qwsr0m
	r8XUuNsxl54UisW/Mo5b3F8kIntfP/a9QsS/aboRKU6ps4R4=
X-Google-Smtp-Source: AGHT+IHnm7ai6HUDdqsIVS3g0Gus5Ugui0QCT4/6sE+UE6ajE0UNX5U/Ri/qUMEqmr0fpL4E7mSYvw==
X-Received: by 2002:a05:6402:5245:b0:606:c5f9:8aea with SMTP id 4fb4d7f45d1cf-608d09aafdcmr7487746a12.16.1750060207557;
        Mon, 16 Jun 2025 00:50:07 -0700 (PDT)
Message-ID: <65183375-e9ce-4bbb-8f32-1ea9b3a53a60@suse.com>
Date: Mon, 16 Jun 2025 09:50:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] pdx: introduce a new compression algorithm based on
 offsets between regions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-7-roger.pau@citrix.com>
 <f7c9bb4a-4006-4be6-955a-cc3b2c4934a1@suse.com>
 <aEreQgl_0Ma6S3_a@macbook.local>
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
In-Reply-To: <aEreQgl_0Ma6S3_a@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2025 16:03, Roger Pau Monné wrote:
> On Thu, Jun 12, 2025 at 10:27:03AM +0200, Jan Beulich wrote:
>> On 11.06.2025 19:16, Roger Pau Monne wrote:
>>> With the appearance of Intel Sierra Forest and Granite Rapids it's not
>>> possible to get a production x86 host wit the following memory map:
>>>
>>> SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
>>> SRAT: Node 0 PXM 0 [0000000100000000, 000000407fffffff]
>>> SRAT: Node 1 PXM 1 [0000061e80000000, 0000065e7fffffff]
>>> SRAT: Node 2 PXM 2 [00000c3e80000000, 00000c7e7fffffff]
>>> SRAT: Node 3 PXM 3 [0000125e80000000, 0000129e7fffffff]
>>>
>>> This is from a four socket system, with each node having 256GB of memory.
>>> The total amount of RAM on the system is 1TB, but without enabling
>>> CONFIG_BIGMEM the last range is not accessible, as it's above the 16TB
>>> boundary covered by the frame table.
>>>
>>> Note that while the memory map is very sparse, it won't be compressible
>>> using the current algorithm that relies on all ranges having a shared
>>> zeroed region of bits that can be removed.
>>>
>>> The memory map presented above has the property of all regions being
>>> similarly spaced between each other, and all having also a similar size.
>>> This allows to compress them using the following formula:
>>>
>>>  pdx = (pfn % offset) + ((pfn / offset) * size)
>>>
>>> Where offset and size are two static coefficients calculated at
>>> initialization.
>>
>> What I would find useful here in addition would be offset and size values
>> resulting from the example memory map above. In particular, without looking
>> at the code in detail, it doesn't become quite clear how the two ranges on
>> node 0 are being dealt with. For what follows I'll assume they'd be folded
>> into a single range covering all of node 0.
> 
> Indeed, they are folded into a single range, that's why the function
> to register ranges takes an ID, so that for this algorithm ranges with
> the same ID are folded together.
> 
> For the above example the offset (pfn based) is 0x63e80000 and the
> size 0x8300000.  You can see those (and for all the other examples) on
> the test-pdx-offset.c file.

Oh, okay; didn't think of looking at the numbers in the test.

>> Along the lines of Andrew's concern regarding the division (and modulo)
>> involved, I wonder whether there might be an alternative with a lookup
>> array, holding bias values (e.g.) for each node. Main question there would
>> be how to quickly determine the array index to use, both from an incoming
>> MFN and an incoming PDX. If such an array wouldn't have too many entries,
>> such a lookup may end up being faster (on average) than a division.
>>
>> Taking the example above, such an array could be:
>>
>> [0x00] = 0,
>> [0x06] = 0x061e80000 - 1 * 0x5000000,
>> [0x0c] = 0x0c3e80000 - 2 * 0x5000000,
>> [0x12] = 0x125e80000 - 3 * 0x5000000,
>>
>> indexed by the top-so-many bits of the MFN. For the reverse array some
>> gap would need to be left between ranges (i.e. the 0x5000000 above would
>> perhaps need doubling; maybe a little less than that would suffice), such
>> that the array slot to use could be determined easily there as well.
> 
> I've assumed that any kind of lookups like this would end up being
> slower than arithmetic transformations.  I had the (maybe wrong)
> impression that having to fetch the adjustment from an array based on
> a calculated index would result in slower code that using constant
> coefficients.

Latency and throughput of DIV are quite a bit higher than those of memory
reads, assuming such reads come from a relatively hot cacheline. Then
again comparing such merely from spelled out numbers in some docs usually
doesn't work overly well.

> I was also worried about the extra memory consumption of this
> approach, but overall we can use a full page for the lookup table,
> which would allow up to 512 entries and that should be more than
> enough.

In the example above far less than a page should be needed. In general I'd
expect one array slot per (contiguous chunk on a) node.

> I can try to code this suggestion.  However it's hard to benchmark
> those algorithms, as the cost of rdtsc shadows the cost of the
> operation.  Then running the translation in a tight loop and averaging
> the result also doesn't seem very realistic, as the cache is hot in
> that case.

Except that, the fewer entries such an array would have, the hotter the
cacheline(s) can be expected to be anyway. But yes, gaining a clear
picture may be difficult. Then again please recall that my earlier
patching attempt (using BMI2 insns) was also rejected mainly on the
basis that the insns chosen are known to not perform well on some
hardware, without having taken any actual numbers (which again would
have been difficult to obtain in a representable way) into account.

Overall I'm not sure this alternative if worth trying out. I merely
wanted to point out there possibly is such an alternative, given the
concern Andrew had voiced. In the end there may be similar concerns
here ...

Jan

