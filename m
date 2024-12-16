Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353B9F2EB4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857740.1269955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8qr-0005Jn-O2; Mon, 16 Dec 2024 11:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857740.1269955; Mon, 16 Dec 2024 11:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8qr-0005HE-KR; Mon, 16 Dec 2024 11:01:25 +0000
Received: by outflank-mailman (input) for mailman id 857740;
 Mon, 16 Dec 2024 11:01:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN8qq-0004aC-Qe
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:01:24 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16549c61-bb9d-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 12:01:23 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso43447875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 03:01:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801643fsm7838793f8f.41.2024.12.16.03.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:01:22 -0800 (PST)
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
X-Inumbo-ID: 16549c61-bb9d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734346882; x=1734951682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wmMnM5aGjix9vBrOfafxI9AVJbKWvJGHNFYyDLBTHqM=;
        b=XUt33e2SWw0oLBklDU2AoRr33SoqUGACC/7snEI/fdL7uYfwtNLK7cyDDBB3S/VpKo
         41HbQ5VX0KlXOP5ylVt5Y24ImLh6Dzaa+kyf/3glWi5WeiRR/3p1V4vN/uqZ0BOFV2GH
         Bu3CCm5GFNqn06VVnLR+3jBsV16/UiC6cs40SI9B2E8T93J4NM1wkzcnka9Q5fVXLS8Y
         Le7NzEvZR2H153LFuvn8GNi+CYlTMpXxGGOhDA2HwX8nS0pqWzIu/wvY8yTNvKExT+lZ
         /d4DIHaQF7U5Xnkv7VBxR30t42AH8/87wqBqrB2dXuelVHAzgRp6Czji+bkC3G/ccYDQ
         xaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346882; x=1734951682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmMnM5aGjix9vBrOfafxI9AVJbKWvJGHNFYyDLBTHqM=;
        b=tSDqvXkVzxRredtqHe0dCcpsmoVNLl2ef0b6T3osF8BLX7Z/Q6BfYcXyV1TOFXB9zy
         tfb860talELPoLvbittOmlXV+Yn58yhNGLLYBd+6TTtBLkZrW8owNWWo+FJedXsv2vwQ
         giagCdX2j2xC60KYfe7Hs3grrYJtI4VLTPd7fL/rp6lUk7GFwhLOKam/qARIHHDWc57A
         z4MIFLxBjtDv6s5sXK78PQCD2ictOYYwb8B8Ex0hzYFgJsxSInbOIaYbi20yOg86Gblt
         PmH4MvXduMzUE7M/N6buA9B5n+C4uJNNw3ra2X/ZXRZHBcmq7jg4dJEXWI8h1chAqXkv
         p4ag==
X-Gm-Message-State: AOJu0YyILkKhjjZErqPd5FNWgb076xfdIHoTBMfnQBg1KEJjMqhAO7zY
	LvRA3khbz7XvRmcaIGhLP+UdO5k2TIduZSkBmy41SB949CZyDZasd7tFKNAeCA==
X-Gm-Gg: ASbGncu9BLIvu1SMB7QWR080WZxaDZlrdeeP0N2ieGq2zHiw8/yIWEvK8AKQFlp24AI
	tSOdxUxULQ5Rsspu6PJslS4ZsDboInvwCoCNZ2p29q8XvokZ+6MDfUIqZxwr3zhldgk3GU4pbdh
	8bqSsOUq41jTMpm73CpdmdRl0M8dIwBtL+fKO3cIivKDpHfTgUVA+KEZQXyJdCaeeQDpVa/WdoI
	sfDuIOc0rUFmyaN7LJXkMkd/IM/qOiy32gK6Rd96WL1wleN6YpInsvFUE+EqvhZ/6fZh7TqNXKs
	RV4Auy34Bij7qI6DXFnwUxwiPBSAkDbuvNh8juHJnQ==
X-Google-Smtp-Source: AGHT+IFH2cwFZQdo7uDTy5YcWGEB198X3OXW5Yityferi3NMqsjpmwrwEPKrtfo8idQBskWGTneVXg==
X-Received: by 2002:a5d:6c68:0:b0:386:1cd3:8a00 with SMTP id ffacd0b85a97d-3888e0ac341mr10164650f8f.40.1734346882662;
        Mon, 16 Dec 2024 03:01:22 -0800 (PST)
Message-ID: <c484d9e6-62a4-4575-8cf1-93603533fd49@suse.com>
Date: Mon, 16 Dec 2024 12:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tools/libacpi: clear ASL warning about PCI0
To: Ariel Otilibili-Anieli <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241215154659.151158-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <5599dc89-0fa4-4255-b4a1-5b81e151d8c7@suse.com>
 <2f7a85-67600280-e411-38ee5c40@258420856>
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
In-Reply-To: <2f7a85-67600280-e411-38ee5c40@258420856>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 11:36, Ariel Otilibili-Anieli wrote:
> On Monday, December 16, 2024 10:53 CET, Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 15.12.2024 16:40, Ariel Otilibili wrote:
>>> * iasl complains _HID and _ADR cannot be used at the same time
>>>
>>> ```
>>> /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt_anycpu.tmp -tc tools/firmware/hvmloader/dsdt_anycpu.asl 2>&1 | grep -B10 HID
>>> tools/firmware/hvmloader/dsdt_anycpu.asl     40:        Device (PCI0)
>>> Warning  3073 -                                    Multiple types ^  (Device object requires either a _HID or _ADR, but not both)
>>> ```
>>>
>>> * generally _HID devices are enumerated and have their drivers loaded by ACPI
>>> * this is from "ASL 2.0 Introduction and Overview" (page 4).
>>> * removing _ADR, the warning is cleared out.
>>
>> Okay, that's the positive aspect. Yet what about the potential fallout thereof?
>> Can you confirm that there's no risk of regressions with older guest OSes, for
>> example?
> 
> OSes that were released after ACPI 2.0 should work [1]; including WinXP: 
> The 2.0 specs says either _HID or _ADR should be included [2], not both (Section 6.1, page 146).

We must be looking at two different variants of the spec then. My copy says
"device object must contain either an _HID object or an _ADR object, but can
contain both." Also still in 2.0c. I agree that in e.g. 6.5 the wording has
changed. I also agree that the use of "either" doesn't help clarity.

> I chose WinXP because, on another patch, it came up in the discussion [3].

And indeed appropriately so.

Jan

