Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC49A7A096
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 12:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936445.1337686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0HNN-0005Vw-2f; Thu, 03 Apr 2025 10:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936445.1337686; Thu, 03 Apr 2025 10:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0HNM-0005UE-W5; Thu, 03 Apr 2025 10:00:44 +0000
Received: by outflank-mailman (input) for mailman id 936445;
 Thu, 03 Apr 2025 10:00:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0HNL-0005U6-6i
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 10:00:43 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80912e29-1072-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 12:00:42 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so4084215e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 03:00:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30096964sm1368325f8f.15.2025.04.03.03.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 03:00:40 -0700 (PDT)
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
X-Inumbo-ID: 80912e29-1072-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743674441; x=1744279241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9XzR85yc2MgrUpoOirnROaslTphOlUH+wAFlwg/u5Rg=;
        b=Zk4K7t3Z2CHdXQV5nOhnNJwwEODJiDkTwk1emyiKpob2ydW0f8T9Lt+y7fdepuUw8Y
         RkgAiWN63iz8hq89LlSc/ON/yTeH3k3oUdoSx+96FW3Dq6ReSJd7EW/I5rTrEIT5fN9K
         iSENlxcKaI2UHtlwUgN7O/IMzDdKpCeqTGYKyLVIwl5YAa0utpE3VMKU4geUietwiAhU
         J2zGx5NHkkeFWOYR+ZhkWJBVfbOhLO7IkvVJ134I2SiXEMfd/nY4HeP4ZtjFMNjXa4fn
         Z0TwwuGYR2Fn+tWW3oRsJLQg6suJtKeMEJoKgM0arNU6Lma81fRjWgz46sWLNzyPcBNk
         YWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743674441; x=1744279241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XzR85yc2MgrUpoOirnROaslTphOlUH+wAFlwg/u5Rg=;
        b=RrB/qvI2kthUKb5Q5Prbw9ipHGf7PWPjfU32BwhlXbgjc/LkMqR3WwKkADFAdbupJW
         hQ/geyT5yPszGEd7B9cmkzXB000QCJfMdGGOU6PDQ+fa0rFlnIOcC1sn5q4QLHOIMfNV
         z842JDZxiokn/dH1D8U9HzXW0S+xNZ6d2PGyb83m7N2vjriaGWh/TD56PnkjRsId4vab
         ja20SOMEukpKx9VFEmD2C9l7zEfPnn8w5BgCxuCKoqI5fNgUOcdkPyoIj0NKyMoHOVH+
         yORg4j7vgB4QBfYeuNQTAaDawwRUtaPi4Ma1qo7Uk+eVVSpUq+5BXNUXFBhROLL+DWqS
         TcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0xZQem2DXoqw5kCOXIlinufnQTCSzhVW8DFQ+rCwAs0BanN1BH0uY2uWOmpyvxlzzGMcYWDiDyfM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeVl31m7Xtgq1/7E8Uo1Tj+f5heMi9TzuxeocHV9ljhg0SOx4i
	AkYtnRAlPvYDHVuZad4aQkOXFAzY3xk//153g38vPl7jlLu8GSrWDPMY+F0/PA==
X-Gm-Gg: ASbGncvSRIFKrgNpMs+qxH7fH8n5wGCqDvXLI7vfWcPdcJW6xB01Z+KPYLYrRsPlLr+
	TjHdW8d+eYEmYMsg6baC43T4va0yBh7y8i93OHEwlPijPgtsZcF50GLef2rB7leIfxokzgfXH1G
	dNvWYdlUgXkLZz3C7fKmZY5zGpVpIU0CcPfeq1wDvW5MIKFNVF6Sde3F+imJY0UoV+qyTFIDunj
	b5ZD8D9dqg3XBzjlRyYGKxvC8tsDszx/oWqQ48v6ymuScuwKki6mOwNfcHY5YQWNL/n8b8nZ7lB
	fwfiTq64QglC9kzOj8sMpEFh35LbM9bSaZB8cbSHm9PLrYgVZ4uzY3Hkqn9fdeF+iq5c966/gqV
	KPUlfMavkpMmclMWhxvxshYs2Hmhawg==
X-Google-Smtp-Source: AGHT+IFWYlR6gIBAf66Y9X/eQfyhN8u6WXkgkM4hZmzNIZUPvDEI7OZJnZsqgf8I3wyc6PlGEpivZw==
X-Received: by 2002:a05:600c:35ca:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-43ebef75b5dmr23629495e9.14.1743674441314;
        Thu, 03 Apr 2025 03:00:41 -0700 (PDT)
Message-ID: <921c6250-9485-4d66-a568-15045ecc17bb@suse.com>
Date: Thu, 3 Apr 2025 12:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: Add Arm64 MPU build job
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250403081916.6834-1-michal.orzel@amd.com>
 <20ac780b-f5ac-4531-997e-362d72adddd2@suse.com>
 <2a8ab261-480f-4bfe-b2b7-7fdff4516078@amd.com>
 <a67d260e-fe1a-44bb-8b49-fa0509716da2@suse.com>
 <44500161-1346-4c9e-bcb3-a4301c197913@amd.com>
 <235cb577-b28f-49ab-b0a3-94ab35572d83@suse.com>
 <65d12272-0ceb-4570-bade-5a0901264e16@amd.com>
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
In-Reply-To: <65d12272-0ceb-4570-bade-5a0901264e16@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 11:35, Orzel, Michal wrote:
> 
> 
> On 03/04/2025 11:28, Jan Beulich wrote:
>>
>>
>> On 03.04.2025 11:17, Orzel, Michal wrote:
>>> On 03/04/2025 10:58, Jan Beulich wrote:
>>>> On 03.04.2025 10:44, Orzel, Michal wrote:
>>>>> On 03/04/2025 10:43, Jan Beulich wrote:
>>>>>> On 03.04.2025 10:19, Michal Orzel wrote:
>>>>>>> Just like for RISCV and PPC, the earlier we enable the CI build the
>>>>>>> better.
>>>>>>
>>>>>> What about Arm32?
>>>>> The series to enable compilation of Arm32 with MPU is still under review on the ML.
>>>>
>>>> Oh. Is MPU in Kconfig then missing a dependency on 64BIT?
>>> Well, yes you're right although when I think about it, it's been like that (for
>>> both 64 and 32) since the introduction of CONFIG_MPU by commit (in October last
>>> year):
>>> 0388a5979b21 ("xen/arm: mpu: Introduce choice between MMU and MPU")
>>>
>>> If you're saying that all the Kconfig combinations + targets like allyes/allno
>>> need to build successfully also for new ports (MPU on Arm is kind of like a new
>>> port), then I agree (I did not think about it and clearly others too seeing the
>>> MPU patch above) although I'd prefer to avoid sending a patch adding dependency
>>> just to be removed in 1-2 weeks. But I can do whatever you think needs to be done.
>>
>> I'm far from insisting on a change here; you're a maintainer of that code while
>> I am not. Yet I indeed think Kconfig needs to have the dependencies right, or
>> else randconfig CI jobs may randomly fail.
> Sure, thanks for showing understanding.
> 
> A different question (also to other people who knows this stuff).
> MPU requires to specify Xen start address using CONFIG_XEN_START_ADDRESS that is
> set to invalid default value to catch user attention. Provided that randconfig
> can select UNSUPPORTED and MPU, we should somehow set CONFIG_XEN_START_ADDRESS
> to e.g. 0 to be able to build successfully. Is this where we need to add
> EXTRA_FIXED_RANDCONFIG to existing arm64 and arm32 randconfig jobs?

In principle some override like this will be needed, I think, yet that undermines
the randomness of the build. From what I can tell the sole constraint on
XEN_START_ADDRESS is that it needs to be page aligned (for whatever reason; I
didn't think there was the concept of "pages" without an MMU [1]). Arbitrary
values satisfying this constraint ought to be selectable by random configurations.
Which would then - hopefully - also trigger the case where XEN_START_ADDRESS is
e.g. so large that Xen can't fit in the remaining address space anymore. Plus
perhaps any other constraints presently not enforced.

How to deal with all of this, i.e. how to leave as much flexibility as possible
to randconfig, I simply don't know. Extending the Cc list in the hope for someone
to provide some insight.

Jan

[1] Perhaps PAGE_SIZE there is purely a software construct, used as allocation
granularity. Yet then it's not clear why XEN_START_ADDRESS would need to be
PAGE_SIZE-aligned. Maybe that's merely simplifying some code ...

