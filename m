Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DD2898BDE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 18:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700964.1094864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPhs-00017u-IN; Thu, 04 Apr 2024 16:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700964.1094864; Thu, 04 Apr 2024 16:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPhs-00014k-FB; Thu, 04 Apr 2024 16:12:52 +0000
Received: by outflank-mailman (input) for mailman id 700964;
 Thu, 04 Apr 2024 16:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsPhr-00014Z-VU
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 16:12:51 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d99fead-f29e-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 18:12:48 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4155819f710so8713185e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 09:12:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u5-20020a056000038500b00343491b9cbesm13342992wrf.41.2024.04.04.09.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 09:12:47 -0700 (PDT)
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
X-Inumbo-ID: 2d99fead-f29e-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712247167; x=1712851967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qM4cYW0T0tiSmDwMVOp/f0RwbJ5oUl5ykaGD8mxSEXc=;
        b=RwcMjaAwZniVU7iW+DpbwV6ta6PRjjwklUZdfVvvDjbHkCYJTCIOGM45kmVa8dbq7a
         tc57V3LY314aU8uRSJpdEhWz6lwteBR9nxZgJd6vfHP6+KqqerxNR7dU5iCtDxNTPkdE
         kBomR+d4OhHzEETO2GHtd31ywS0m9UNO2R1yq8zu5sGAySKaW8XzhYt0FtIgcHKIq8xQ
         szlbKQ+7QBXhhWVKIJLf+Aoe46fHM2DVqUtrfqfRKekE/yavBU8BNmsdYkZIeXzb0gNz
         mcI3f2NuGDHbN3YDW76Qnq5WnVnjmxBRFO8CuqZZHqh9JDaZFwmQAP1yh9van38blgGw
         v7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712247167; x=1712851967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qM4cYW0T0tiSmDwMVOp/f0RwbJ5oUl5ykaGD8mxSEXc=;
        b=IGjQnX+P9SZCLNtoLwX4tyAqq6DI9vZ1z0oeLX+GDXncMNOrrswSQmeoBEb+Ku2T5K
         0NE4k5brbV9wW4yVV/2qP7Q+9yQrXx/RPnX6PZbBhfFbivBlCP2egf5JTJOSMYpGUjGx
         recI7Dt/4rUPtz5UAkCmKk5Qj2cg6aXoflh3K6nHDAEtfXijwS+k0CTioq1PqEREykIp
         QNFkqFYD+XwpXF9mRwJXPSwpKThVzKDNYT10sr3U2Z1a+0NGLmSKb6foJ7MtfeOQhH/u
         PFnyVYFJBfB5RGJHtsHEvRqsewfXSFSIYETZ8jM0TgOE9rNi8TgUxvFqJMNtP0rpFvcm
         f0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW/U21+ORKjJS9JufP5w0sP7YsKKwvW/5xzLNENh+DtXI4If7laeV2HcG8IK+KeRQ+keis/L5FsD+V5ff2aDVHhSuNn/FFSE7t3OH1znNY=
X-Gm-Message-State: AOJu0YxRk2aenu+vINIuzzM+jfnfXgIsyA2Jrx3RdQXPlOa3DMx2wpgU
	oDFs0A/DYkYFm2ejEtaanLlrut/nXhe8TVDRzFxBow3XMdDwp4U7rDANaIMaDQ==
X-Google-Smtp-Source: AGHT+IErJHtDOLeKYnk38PI1Q7aMguR2PGYAuRH8gFU4ddRGyNpuo0qOT4mCLLqOLEThD2Jz2OjA3w==
X-Received: by 2002:a05:600c:4f48:b0:414:868d:1cbe with SMTP id m8-20020a05600c4f4800b00414868d1cbemr194277wmq.9.1712247167504;
        Thu, 04 Apr 2024 09:12:47 -0700 (PDT)
Message-ID: <4ba7c962-a635-4a7d-8e03-093361cc6353@suse.com>
Date: Thu, 4 Apr 2024 18:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/19] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
 <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
 <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
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
In-Reply-To: <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.04.2024 17:45, Oleksii wrote:
> On Thu, 2024-04-04 at 15:22 +0200, Jan Beulich wrote:
>> On 03.04.2024 12:19, Oleksii Kurochko wrote:
>>> --- a/xen/include/xen/bitops.h
>>> +++ b/xen/include/xen/bitops.h
>>> @@ -65,10 +65,164 @@ static inline int generic_flsl(unsigned long
>>> x)
>>>   * scope
>>>   */
>>>  
>>> +#define BITOP_BITS_PER_WORD 32
>>> +/* typedef uint32_t bitop_uint_t; */
>>> +#define bitop_uint_t uint32_t
>>
>> So no arch overrides permitted anymore at all?
> Not really, I agree that it is ugly, but I expected that arch will use
> undef to override.

Which would be fine in principle, just that Misra wants us to avoid #undef-s
(iirc).

>>>  /*
>>>   * Find First Set bit.  Bits are labelled from 1.
>>>   */
>>
>> This context suggests there's a dependency on an uncommitted patch.
>> Nothing
>> above says so. I guess you have a remark in the cover letter, yet imo
>> that's
>> only partly helpful.
> Is it really a hard dependency?
> The current patch series really depends on ffs{l}() and that was
> mentioned in the cover letter ( I'll reword the cover letter to explain
> why exactly this dependency is needed ), but this patch isn't really
> depends on Andrew's patch series, where ffs{l}() are introduced.

If anyone acked this patch, and if it otherwise looked independent, it would
be a candidate for committing. Just that it won't apply for a non-obvious
reason.

Jan

