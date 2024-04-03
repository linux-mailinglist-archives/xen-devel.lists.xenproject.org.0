Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E641B896E82
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 13:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700492.1093748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzAz-0003Kl-TG; Wed, 03 Apr 2024 11:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700492.1093748; Wed, 03 Apr 2024 11:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzAz-0003Ie-PM; Wed, 03 Apr 2024 11:53:09 +0000
Received: by outflank-mailman (input) for mailman id 700492;
 Wed, 03 Apr 2024 11:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrzAy-0003IU-Dy
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 11:53:08 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbc024d7-f1b0-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 13:53:06 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4156a2aeb43so23132175e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 04:53:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b00413eb5aa694sm21401196wmo.38.2024.04.03.04.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 04:53:05 -0700 (PDT)
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
X-Inumbo-ID: bbc024d7-f1b0-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712145186; x=1712749986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FhSjVM4LwpP0o1bn5OoO/DKBjeb23w4eSCSeXB0r4v8=;
        b=TzHnT1kUDWzUB0g29IInwcjs9vk1AKaTNJYOJQ5UZ1RDQq0lvnzjOepCM6QGKUfB/N
         yNgB35PfUOHDL0rWx02Rwg1f1GuZ5AxLksU3KkeffH038LCGXCFZp7EAiTBgWVXkths2
         oOdFgozcUkCWutRHALAd2muXqJBA9Q3SbyPI+MWBKMcasiL/1Xxc5exFJ/weYqRolaVX
         StwDwHNXxVp2LvVqZg2DZTR2L2bxd77ehqhRTq/R+XpdE6bypU5S2yj2uqM06iCP50Ls
         ZcDA0Q+gHFfBsHx9QN6A0TH5Uifm9S2AKrkRwUpG6JMWlgyEb9IxnjLGxnKZaqz4+HG+
         m5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712145186; x=1712749986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FhSjVM4LwpP0o1bn5OoO/DKBjeb23w4eSCSeXB0r4v8=;
        b=KjTgom7aPa9KW03XQebqFoxhGJPMHY1o0O/XQhdGByzAinxD6yeW8+LuO/rGdeOf+9
         1T3OhwrsE0qeNPaIq7TJ6wOAx9HFsT4GT3oedN/UR5vGyGatievzHF4rnQYhyb2pL2zv
         hXFyTyGNA6f/t+wnJAarIWKn0+NryK8QnYPzqKQbI/V7lqtKlxTf6iDZVwDbJMc7dYrZ
         mZoJeKaUmlYgtm2Lyi2Tx1U2VT35K3pfAzWgi636ApweVB2ekkzZdmVeE5ev1qpKUBXQ
         USyBvGwWZFUcpGzME61+H/m03JPHDrcl/W77m/CdmYW3OSxHmroKYHOGoYLMDDp1epqn
         tEUg==
X-Forwarded-Encrypted: i=1; AJvYcCU9G0GOsSEL55/9FMAwMAMIb3cW4668ZwxJQRUrLj4AHKIvXp7TocDurUUpgC0SMb2d8M90O7riywR5w/ayrgeG48GPlKtEqD0X5AJjP0w=
X-Gm-Message-State: AOJu0Yzjs1qCpFv/1SGWwOPJphEcBZkWJBPMD65FOFPTVjC6n+tJZd7X
	EPJ29R9aiO7YollTS69+2LBq5vM4LusONwfQx8/dz2SM0S0Y/M1aVecS9+soFQ==
X-Google-Smtp-Source: AGHT+IFDWN6/KDbUbiGtdA8KfmxGk6uMQABmm9AXcty+aTYgTqoEb9MbJS55tUDPdFUwu2ar64r5bw==
X-Received: by 2002:a05:600c:5606:b0:415:52df:4db1 with SMTP id jr6-20020a05600c560600b0041552df4db1mr12170950wmb.7.1712145185717;
        Wed, 03 Apr 2024 04:53:05 -0700 (PDT)
Message-ID: <7593c2e7-57ee-42eb-8d38-a3aa177d3420@suse.com>
Date: Wed, 3 Apr 2024 13:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/19] xen/riscv: disable unnecessary configs
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <c2ba247adce76c69ecd6400d791db36495b85b75.1712137031.git.oleksii.kurochko@gmail.com>
 <e3da3546-f2a7-4eab-b157-51b6570dcbf9@suse.com>
 <77d63eccd4906ebbb3a5add624490cc25b2cba0c.camel@gmail.com>
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
In-Reply-To: <77d63eccd4906ebbb3a5add624490cc25b2cba0c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2024 12:54, Oleksii wrote:
> On Wed, 2024-04-03 at 12:28 +0200, Jan Beulich wrote:
>> On 03.04.2024 12:19, Oleksii Kurochko wrote:
>>> This patch disables unnecessary configs for two cases:
>>> 1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds
>>> (GitLab CI jobs).
>>> 2. By using tiny64_defconfig for non-randconfig builds.
>>>
>>> Only configs which lead to compilation issues were disabled.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V7:
>>>  - Disable only configs which cause compilation issues.
>>
>> Since the description doesn't go into details: While I can see that
>> PERF_COUNTERS and LIVEPATCH may require (a little / some more) extra
>> work, are HYPFS, ARGO, and XSM really causing issues?
> For Argo, I recieved the following compilation errors:
>    common/argo.c:1416:5: error: unknown type name 'p2m_type_t'; did you
>    mean 'hvmmem_type_t'?
>     1416 |     p2m_type_t p2mt;
>          |     ^~~~~~~~~~
>          |     hvmmem_type_t
>    common/argo.c:1419:11: error: implicit declaration of function
>    'check_get_page_from_gfn' [-Werror=implicit-function-declaration]
>     1419 |     ret = check_get_page_from_gfn(d, gfn, false, &p2mt, &page);
>          |           ^~~~~~~~~~~~~~~~~~~~~~~
>    common/argo.c:1427:10: error: 'p2m_ram_rw' undeclared (first use in
>    this function)
>     1427 |     case p2m_ram_rw:
>    
> It seems it should be included xen/p2m-common.h and asm/p2m.h in
> common/argo.c.
> 
> For CONFIG_HYPFS_CONFIG ( there is no issue with CONFIG_HYPFS,
> overlooked that ):
>    common/config_data.S:1:10: fatal error: asm/asm_defns.h: No such file
>    or directory
>        1 | #include <asm/asm_defns.h>
>    
> 
> For XSM, I recieved the following error:
> 
>    xsm/xsm_core.c:79:19: error: 'xsm_core_init' defined but not used [-
>    Werror=unused-function]
>       79 | static int __init xsm_core_init(const void *policy_buffer,
>    size_t policy_size)
> 
> I'll add an information with compilation errors to the commit message.

No need to quote full compiler diagnostics, but a hint at the problems
at least. That said, perhaps we want to rather sort the issues than
disable building stuff that sooner or later you will want to build
anyway. For hypfs we look to have an approach already. For Argo what
you suggest makes sense to me; it might be nice to understand where
the P2M headers needed are coming from on x86 and Arm. Ideally common
code .c files wouldn't include asm/*.h.

For XSM I'm a little puzzled: Shouldn't RISC-V have HAS_DEVICE_TREE=y?
Then xsm_core_init() would have a caller.

Jan

