Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E794F81C8C7
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 12:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659298.1028839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGdOx-0005bH-4h; Fri, 22 Dec 2023 11:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659298.1028839; Fri, 22 Dec 2023 11:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGdOx-0005YW-1O; Fri, 22 Dec 2023 11:09:11 +0000
Received: by outflank-mailman (input) for mailman id 659298;
 Fri, 22 Dec 2023 11:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2k+=IB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGdOv-0005YQ-OD
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 11:09:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86d80767-a0ba-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 12:09:08 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c60dfa5bfso19006965e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 03:09:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c45cd00b0040d414b57e8sm4112766wmo.26.2023.12.22.03.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 03:09:07 -0800 (PST)
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
X-Inumbo-ID: 86d80767-a0ba-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703243348; x=1703848148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/aGrjOFmgNAYadH8duEIGwUiB6gIhsedbAjrMNBxQU=;
        b=RBHSRJiBo1yZmG8QlF9xBqrqCYIDFs35vrC26V2GmxRjrGRPz0RbpklUQ+8YTHEzpS
         W8UszA3GOpFbvgDiI6J5vrP1xVQyEefuq6eMHGkIOs2QD+LmcQbCxJzooY5ZqxNRogDC
         jfBzyZMTPMZJn/ml0pbiWN1EDNqxU2k3I69Vnuq2dmobVE/pEKI/Bye1iYZbGGQP0AyO
         4csyscA3shlbs+Sl8Hdx1pU/WijJwNrn6M0NXgytiY7taGpjyFjrCG6uY+kZArT9l5Q1
         xeLgv4oQQg5vlgdajUx8hv0d9vgY7XA9sb2cAPepBok3TQX3GweV1Vq8RzFAKfqnFEE7
         hAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243348; x=1703848148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/aGrjOFmgNAYadH8duEIGwUiB6gIhsedbAjrMNBxQU=;
        b=GCYABj2hYFlwzPoJgIkOdDh9JClSER8m5GA+9ZgZ14ivCSUOZWVPOz0h1K2G4K2Kh7
         BB8dQmf4R7ulqUIpsKD+miq+KF3f0mQEtp++77HGXd4zK/OHIdzmim5POgindSuAG5dt
         2n+FD635lXTSiO8+lyOlMFFRImXSfaiEiUwaIOSUegtwNvSfF7mcFM1AaseO5Ac53xcv
         seJva96X107JXnhBJyyv9OzXX/VkAdaPCkstci6mkDs9mzSRR9DapDQj14xIxo/PxB7T
         Zbj6KQ+qF3vBJrG3vVHvGe/RjHgqRxBe99/D8NZQUVMe6SgvBs6tNnOGCYZy79dB4IFz
         Xv6g==
X-Gm-Message-State: AOJu0YyurnE7wy5/5rdGihv3jb3+pw4BZUzouFJXqrd7TwCxq7nnRfz6
	8ZNgLsLlEtyjJco5cVhbRKC8bsi8f/zY
X-Google-Smtp-Source: AGHT+IG2BxgwHDvGrX/X0pcHiyyRc8vkGPwZZS3Lq/c3r3f7hAN0qeob5ncrhVV83tSPRdLnChK+wA==
X-Received: by 2002:a05:600c:44d6:b0:40c:78c:f864 with SMTP id f22-20020a05600c44d600b0040c078cf864mr637115wmo.16.1703243347739;
        Fri, 22 Dec 2023 03:09:07 -0800 (PST)
Message-ID: <64466285-35b8-497c-a12b-60fe0c998ba6@suse.com>
Date: Fri, 22 Dec 2023 12:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] move __read_mostly to xen/cache.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
 <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
 <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
 <fb627eae0deb85569d3c3044154f1588e9202ec9.camel@gmail.com>
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
In-Reply-To: <fb627eae0deb85569d3c3044154f1588e9202ec9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.12.2023 10:39, Oleksii wrote:
> On Tue, 2023-08-08 at 12:32 +0200, Jan Beulich wrote:
>> On 08.08.2023 12:18, Andrew Cooper wrote:
>>> On 08/08/2023 10:46 am, Jan Beulich wrote:
>>>> There's no need for every arch to define its own identical copy.
>>>> If down
>>>> the road an arch needs to customize it, we can add #ifndef around
>>>> the
>>>> common #define.
>>>>
>>>> To be on the safe side build-breakage-wise, change a couple of
>>>> #include
>>>> <asm/cache.h> to the xen/ equivalent.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Could we find a better place to put this?
>>>
>>> __read_mostly is just a section.  It's relationship to the cache is
>>> only
>>> microarchitectural, and is not the same kind of information as the
>>> rest
>>> of cache.h
>>>
>>> __ro_after_init is only here because __read_mostly is here, but has
>>> absolutely nothing to do with caches whatsoever.
>>>
>>> If we're cleaning them up, they ought to live elsewhere.
>>
>> I would be considering init.h (for having most other __section()
>> uses,
>> and for also needing __read_mostly), but that's not a great place to
>> put these either. In fact I see less connection there than for
>> cache.h.
>> So the primary need is a good suggestion (I'm hesitant to suggest to
>> introduce section.h just for this).
> Andrew sent some suggestions here:
> https://lore.kernel.org/xen-devel/3df1dad8-3476-458f-9022-160e0af57d39@citrix.com/
> 
> Will that work for you?

I still need to properly look at the suggested options.

Jan

