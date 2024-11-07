Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD69C0AC6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 17:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832079.1247474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t950C-0003CQ-9P; Thu, 07 Nov 2024 16:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832079.1247474; Thu, 07 Nov 2024 16:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t950C-0003Aw-63; Thu, 07 Nov 2024 16:04:56 +0000
Received: by outflank-mailman (input) for mailman id 832079;
 Thu, 07 Nov 2024 16:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t950A-0003Aq-J8
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 16:04:54 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 050f2442-9d22-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 17:04:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so9542825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 08:04:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05c1f56sm28986245e9.34.2024.11.07.08.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 08:04:49 -0800 (PST)
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
X-Inumbo-ID: 050f2442-9d22-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA1MGYyNDQyLTlkMjItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTk1NDkxLjMwMzAxOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730995491; x=1731600291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e8Lqs45Rjv4Y2GCwHzk9T6KG8ODUgjzv1Utcdv7yxpY=;
        b=Us2nRpGmBiPSVertv/m6a6lVP6MAFoKx9NGSOlQ8XRjmjgF5/xArFKt+NZKd2JnYe4
         GgHgR57qHhfYU/xeJCauZuxGfMl5U0PErj5l4ejNcWlhLcv6Siz/+NiUV8A9MA/lSHst
         ueLNyM5waokjzpzxuXiwVMWl2IjvTms7wdfcTjw3FyF2fqNiCal/4NPopPlLoW5KOW5v
         uVpoxxKPcfwntoLSbE21u4SHeeuaMJGHutXUe3dN9wPT+tlGqINPem+c6YbgtB7LoBVm
         yB0bvuZdPqasm0u2dYAHMoTbrShUzn3iUbrUW2RqQgyeHFe7mhRiXQu9Uu7uME9BEjzp
         sIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730995491; x=1731600291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8Lqs45Rjv4Y2GCwHzk9T6KG8ODUgjzv1Utcdv7yxpY=;
        b=L+QtVrzf1pMX5ooDiePu6Y9qZLzxu7TbwaNKUHT30b77t88OqpOK99h3+wZ3aqJI4x
         QqGaJbmDITM2Nkws5PFcgkDLGMkjE11dubRhu08ujw7fKAeBJcINuGzh1GlJqgzyJSAU
         CILHMJh0te6uELoOahLWLABFdxzeDTy38x84FlD0+S4MobKZdDF2NNhHKmlCNNTjd6Zv
         pXBqkyzA2vy2OWT46ckM7yRPGpVpJR6ZUfdiyZeNXF4R97DGwyTi4EjN4o7AYI2/Lmo6
         EBlRCReCe/GQQd+3qui26xGXh8UQIQbWGj4onaeCg3Uiuk+G+TjXv+y41SqDol+tNRQx
         bbXA==
X-Forwarded-Encrypted: i=1; AJvYcCWNQix4RneA206i4GmsM7TXmFg4JIDitUcr7r1B7wovgRGUF2vmObxaP0Pu1wrt2HNE5oRBI0tAtHo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAEAt3k4879u2ZmHLVz6XDYXHnVeUuIaE9qJZ7edy79HZ33jAm
	494VbqUfnnnsFdEmxDGplxrk530bB0g6Ck+u0zO79FAJjHCJu6u0SoTK2LjiLg==
X-Google-Smtp-Source: AGHT+IF11x8gonGQ+oyxYoO7x64y7q8GEV/XWBRqcvb14wa7xp4hfXcdeAKn97atWvUxQlELAL1KBg==
X-Received: by 2002:a05:600c:45cd:b0:431:5eeb:2214 with SMTP id 5b1f17b1804b1-4319ad363eamr376946715e9.33.1730995490486;
        Thu, 07 Nov 2024 08:04:50 -0800 (PST)
Message-ID: <1e9e3475-0dc3-4344-ab78-fa5f42ae30ab@suse.com>
Date: Thu, 7 Nov 2024 17:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] create-diff-object: update default alt_instr size
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: konrad.wilk@oracle.com, ross.lagerwall@citrix.com,
 xen-devel@lists.xenproject.org
References: <20241107151509.73621-1-roger.pau@citrix.com>
 <20241107151509.73621-3-roger.pau@citrix.com>
 <28f3bcb5-ce01-48f6-b0a9-0ffa96998315@suse.com> <Zyzi17UTGMRU_7Ql@macbook>
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
In-Reply-To: <Zyzi17UTGMRU_7Ql@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2024 16:55, Roger Pau Monné wrote:
> On Thu, Nov 07, 2024 at 04:20:35PM +0100, Jan Beulich wrote:
>> On 07.11.2024 16:15, Roger Pau Monne wrote:
>>> The size of the alt_instr structure in Xen is 14 instead of 12 bytes, adjust
>>> it.
>>
>> Nowadays yes. Isn't the tool supposed to be usable with all livepatch-capable
>> Xen versions, though? As a random data point, 4.7 still had the size at 12.
> 
> Yes, livepatch-build-tools will fetch the alt_intsrt size from the
> DWARF info.
> 
> However when using create-diff-object without the env variable being
> set a default value is used, and that's currently 12.  I think it
> would be best to update that default to the value used by the current
> Xen version.

Oh, I see. Makes sense of course.

Jan

