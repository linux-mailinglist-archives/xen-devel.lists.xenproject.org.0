Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA68A843A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 15:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707508.1105494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5Dd-0003w7-Ih; Wed, 17 Apr 2024 13:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707508.1105494; Wed, 17 Apr 2024 13:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5Dd-0003tY-G6; Wed, 17 Apr 2024 13:20:57 +0000
Received: by outflank-mailman (input) for mailman id 707508;
 Wed, 17 Apr 2024 13:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx5Dc-0003tO-LJ
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 13:20:56 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51aba7e5-fcbd-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 15:20:54 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-418c1920313so3735775e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 06:20:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b00417d624cffbsm2878656wmq.6.2024.04.17.06.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 06:20:53 -0700 (PDT)
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
X-Inumbo-ID: 51aba7e5-fcbd-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713360054; x=1713964854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IImrc/XTuR3S+07FouGdRYtQVAvQx5S0Ebb471S17+E=;
        b=LX/7tISZaIwrf2AqKIA1XIQohlsUWtFuXJQvntAnkeQDqMUutNxO6QxaLKIfQz8Mt1
         KUit61bWWMOd/Xdc7eO1tPbmf3s1vqUAzcEGbzqFzlGlWykksQE51TGPtShYUEX1afW3
         aTn/beyDu9Cig0iNRi3RoEUVdgS9nqEiOZv6T3iP05ZcEg1Z12qSeqU4q79yoXCTN1ow
         DUnaXrYNxXm+ov+yt7ubYMyadMACQeC9BA8oFpZeRpdL3DW1JNznfEmnquJyecYII52h
         3kHPY02zqyLD6bWGnlWXJse6L0/VUuitg0hZ5IdN1RGG9zXIOwKmeOa7dPgPFeK1LQc8
         JG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713360054; x=1713964854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IImrc/XTuR3S+07FouGdRYtQVAvQx5S0Ebb471S17+E=;
        b=UOGcrCj/xLrr/JaCwSzEl0roQj9kcdD0xDYgRGJckX2TEYfL4jIkoVBc7olDkLbb3C
         6xEj4XF8HYpnVfu5N4d84PArDxk5AghytwVTzqsuxtif6NlyoHEbbOfvy0qBjV5kmYlA
         Q/sXgrqB8V6evbdM2kapTilE8l4dlV1CkDvu+F42sQhrVCGoe4tgu+EBIP+mMUhTTKtN
         PSoru0Vl8iK7fWpofoqbEayNNe2uKqB5FoQGkPbdq28HfzGDk5dI1h8H4dFtKXeQCA1b
         5JUUgY608aJ2aSLSYgs1ZBLvm/b4ZJ0cr0XJg2gGgX0C67kWYFsarz7SaRnOKZM/mXHA
         XCaw==
X-Forwarded-Encrypted: i=1; AJvYcCUelt6j8Y/G4/MhB0Y3yFq50ritGgTg83r9r/8SrTbgF7EVVxc26h+bWafa3XNNxCEqw8c6/2tcKxalyvX0kAJw+RhrytRKl9IhIpXC3ZY=
X-Gm-Message-State: AOJu0YxrUB150XuHJefZcnoezagKnuefkSMh3idujUa0UZUDGszSau9/
	Za8J8pAUmLz+t5BGXusxhIqEo+AtSBkPEAexTjKL2ZPx84R8XvGtbjFkpt02Ow==
X-Google-Smtp-Source: AGHT+IHBdV3w/RUjMdDEfivKyfKLGOt0tQ5TT3EGT9nzikqLlgDm7Ap6j1P38u0ouijK0mbiJS7svA==
X-Received: by 2002:a05:600c:4707:b0:418:e67:2916 with SMTP id v7-20020a05600c470700b004180e672916mr10780055wmo.15.1713360053924;
        Wed, 17 Apr 2024 06:20:53 -0700 (PDT)
Message-ID: <9f2f6cbc-8597-4893-874d-35d76b3c9ce2@suse.com>
Date: Wed, 17 Apr 2024 15:20:53 +0200
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
 <7593c2e7-57ee-42eb-8d38-a3aa177d3420@suse.com>
 <1192836601da5f50db4ea9bb6ab818586e2f6872.camel@gmail.com>
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
In-Reply-To: <1192836601da5f50db4ea9bb6ab818586e2f6872.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.04.2024 16:39, Oleksii wrote:
> On Wed, 2024-04-03 at 13:53 +0200, Jan Beulich wrote:
>> On 03.04.2024 12:54, Oleksii wrote:
>>> On Wed, 2024-04-03 at 12:28 +0200, Jan Beulich wrote:
>>>> On 03.04.2024 12:19, Oleksii Kurochko wrote:
>>>>> This patch disables unnecessary configs for two cases:
>>>>> 1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds
>>>>> (GitLab CI jobs).
>>>>> 2. By using tiny64_defconfig for non-randconfig builds.
>>>>>
>>>>> Only configs which lead to compilation issues were disabled.
>>>>>
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> ---
>>>>> Changes in V7:
>>>>>  - Disable only configs which cause compilation issues.
>>>>
>>>> Since the description doesn't go into details: While I can see
>>>> that
>>>> PERF_COUNTERS and LIVEPATCH may require (a little / some more)
>>>> extra
>>>> work, are HYPFS, ARGO, and XSM really causing issues?
>>> For Argo, I recieved the following compilation errors:
>>>    common/argo.c:1416:5: error: unknown type name 'p2m_type_t'; did
>>> you
>>>    mean 'hvmmem_type_t'?
>>>     1416 |     p2m_type_t p2mt;
>>>          |     ^~~~~~~~~~
>>>          |     hvmmem_type_t
>>>    common/argo.c:1419:11: error: implicit declaration of function
>>>    'check_get_page_from_gfn' [-Werror=implicit-function-
>>> declaration]
>>>     1419 |     ret = check_get_page_from_gfn(d, gfn, false, &p2mt,
>>> &page);
>>>          |           ^~~~~~~~~~~~~~~~~~~~~~~
>>>    common/argo.c:1427:10: error: 'p2m_ram_rw' undeclared (first use
>>> in
>>>    this function)
>>>     1427 |     case p2m_ram_rw:
>>>    
>>> It seems it should be included xen/p2m-common.h and asm/p2m.h in
>>> common/argo.c.
>>>
>>> For CONFIG_HYPFS_CONFIG ( there is no issue with CONFIG_HYPFS,
>>> overlooked that ):
>>>    common/config_data.S:1:10: fatal error: asm/asm_defns.h: No such
>>> file
>>>    or directory
>>>        1 | #include <asm/asm_defns.h>
>>>    
>>>
>>> For XSM, I recieved the following error:
>>>
>>>    xsm/xsm_core.c:79:19: error: 'xsm_core_init' defined but not
>>> used [-
>>>    Werror=unused-function]
>>>       79 | static int __init xsm_core_init(const void
>>> *policy_buffer,
>>>    size_t policy_size)
>>>
>>> I'll add an information with compilation errors to the commit
>>> message.
>>
>> No need to quote full compiler diagnostics, but a hint at the
>> problems
>> at least. That said, perhaps we want to rather sort the issues than
>> disable building stuff that sooner or later you will want to build
>> anyway. For hypfs we look to have an approach already. For Argo what
>> you suggest makes sense to me; it might be nice to understand where
>> the P2M headers needed are coming from on x86 and Arm. Ideally common
>> code .c files wouldn't include asm/*.h.
> It seems to me that p2m.h comes for Arm from argo.c -> xen/domain.h ->
> asm/domain.h and for x86 from argo.c -> xen/guest_access.h -> #include
> <asm/hvm/support.h> -> asm/p2m.h.
> 
> So I can include asm/p2m.h to asm/domain.h as p2m will be used anyway
> in asm/domain.h header and drop disablement of ARGO config from
> *_defconfig and build.yaml for CI. Does it make sense?

Looks okay to ma, at a glance.

Jan

