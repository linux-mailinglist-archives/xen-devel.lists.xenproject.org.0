Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F20BB0C591
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 15:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051547.1419904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqxa-0004Ug-UE; Mon, 21 Jul 2025 13:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051547.1419904; Mon, 21 Jul 2025 13:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqxa-0004SV-R2; Mon, 21 Jul 2025 13:53:42 +0000
Received: by outflank-mailman (input) for mailman id 1051547;
 Mon, 21 Jul 2025 13:53:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udqxZ-0004HC-UX
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 13:53:41 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1afd55c9-663a-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 15:53:39 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so4105508f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 06:53:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb778178sm5555914b3a.129.2025.07.21.06.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 06:53:38 -0700 (PDT)
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
X-Inumbo-ID: 1afd55c9-663a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753106019; x=1753710819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=znFi8pvenUTkwDXZaL/NTqvBHsiMWKght0+jgnoq8UI=;
        b=Bv2zIvxIaUv+efy9F8U/scLBjc7w7aHK6P3h3HmTiA8EfOZXiYl08uApK69WUqmbLB
         Qbe5QtNejxfIiryvWBINyP6SaQ3+uJezOvG7aD7hmMAzB++gcZx/i2xS+Z2v0kxCfro9
         tUa4nNxvdzAa53OWmlWq/F6bmBwQ14d7OvBQT1hsnuKbApAnwnwh5dJ0x/eRmj4/ZYgP
         GbDicriUbn38KxzjRtoi01O1RqV5YICSrwe+PyVVzLd1Bg4tJBmXOoTuEiEmixe2Nbxp
         jCtuhYjVOYnvNbpLT+FOV3XjgcXK3UDHPgSSUhwMACXeWplx3NvXRCqbuBtGKZpnIaRa
         BxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753106019; x=1753710819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znFi8pvenUTkwDXZaL/NTqvBHsiMWKght0+jgnoq8UI=;
        b=YIXuUAgCHdq9OHK+mFp52abNQPbggozNsCIwTg1ghed8pxPGvwraD9dS/pHc1k2QEq
         j0Er37+h8N9LYwCo46/AcrUUhDcmGQyUEtq2bZ7yX+vv+GxQYhAunH8azoipcE4Q8ji1
         9T7pebJLM7AP6y1BZ+wge/I4uMAnXf2CV/6/gUEYWApcLxNjWmLIQDwfhJSE5t3YDnCH
         WHdTuC0DitW0jc65sk+WukgRMO3P2A4vrEm9r0Xp84mwNv/OzPcT/qTsmy5i8OYEEUi/
         s3Vn9yIC3CG3qUjkj+z6h896F1NTHDdYA4fSPZ6cQFxdL7Z2l6WIWUNmb6l0R7H/XArv
         di/w==
X-Forwarded-Encrypted: i=1; AJvYcCXO/GFyEHIATr3jWGDbtc3l+nR3sPuIwtFuN19zYHVUjRMqFtfaQW+HpKrP/2xWNa9+I15NbNT1iHw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpDxH9WprXa/SRFGxEj/EAE4OiSrmkRk2nd6XPWkmUOpGKi3pa
	kIpo2zxb80vGJJLAOM7NG/IGzUUAO0sE76y49+h6drEMXwMir+OX7q/1mhttNIG3sA==
X-Gm-Gg: ASbGncsCQ83PNHJy9CGySYU1VuBnmNtrRzyp9mRf/cMjzMzDNfOMOtQM/wel4VmvK0V
	7kzfiyFpZh7eQf82WzNJSyWIyq5AhdjVC9nbUl+JCL8ZI+9BHhwmhMap1hphuBiCsnLV2ltrFkq
	YNau+Q8MAED+S5JVdvvkwWFG0QY5/cZCMDW2G0zacGlcxEBr1icWL5QOGmHq0BsmrlHfqq5jrOQ
	PcdEe79/KdFE4KYvW0uc1FiMLNP2nnkfSdK6Y2qJTHmyzpL+Wn3Nll+kDKRDOrnE81AWoJdklFg
	N5tsmJLlZra49BD8G5T60suiIqVVdAlSHGKvIjaBx+Zise51biev2GHZ3fcDyxlTjoq6FB5YIyW
	XMyKk+zlf1IYr1K1mRRfd6A8HC6J3q/WJGa7G5kRpTInEpx93AV8+7CAlCHpgNVewLnLWNaF0y1
	AAgSh9z0U=
X-Google-Smtp-Source: AGHT+IHZaTRidOhr6CoxxGLtsvbu53RGMTAYidAbtc7Eyozwq3q5xWJwuYSDRr/1+/owdk8VK1+r9w==
X-Received: by 2002:a5d:5f84:0:b0:3b6:8acb:a9d2 with SMTP id ffacd0b85a97d-3b68acbaa1bmr7613085f8f.7.1753106018932;
        Mon, 21 Jul 2025 06:53:38 -0700 (PDT)
Message-ID: <03212046-e60d-4c8d-9d9e-897666e95f91@suse.com>
Date: Mon, 21 Jul 2025 15:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
 <133e13bc-39a9-4691-b383-8c62c2775c01@gmail.com>
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
In-Reply-To: <133e13bc-39a9-4691-b383-8c62c2775c01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 16:49, Oleksii Kurochko wrote:
> On 7/2/25 12:09 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> Implement the mfn_valid() macro to verify whether a given MFN is valid by
>>> checking that it falls within the range [start_page, max_page).
>>> These bounds are initialized based on the start and end addresses of RAM.
>>>
>>> As part of this patch, start_page is introduced and initialized with the
>>> PFN of the first RAM page.
>>>
>>> Also, after providing a non-stub implementation of the mfn_valid() macro,
>>> the following compilation errors started to occur:
>>>    riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
>>>    /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
>>>    riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
>>>    /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
>>>    riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
>>>    /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
>>>    riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
>>>    riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
>>>    /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
>>>    riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
>>>    riscv64-linux-gnu-ld: final link failed: bad value
>>>    make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
>>> To resolve these errors, the following functions have also been introduced,
>>> based on their Arm counterparts:
>>> - page_get_owner_and_reference() and its variant to safely acquire a
>>>    reference to a page and retrieve its owner.
>>> - put_page() and put_page_nr() to release page references and free the page
>>>    when the count drops to zero.
>>>    For put_page_nr(), code related to static memory configuration is wrapped
>>>    with CONFIG_STATIC_MEMORY, as this configuration has not yet been moved to
>>>    common code. Therefore, PGC_static and free_domstatic_page() are not
>>>    introduced for RISC-V. However, since this configuration could be useful
>>>    in the future, the relevant code is retained and conditionally compiled.
>>> - A stub for page_is_ram_type() that currently always returns 0 and asserts
>>>    unreachable, as RAM type checking is not yet implemented.
>> How does this end up working when common code references the function?
> 
> Based on the following commit message:
>      Callers are VT-d (so x86 specific) and various bits of page offlining
>      support, which although it looks generic (and is in xen/common) does
>      things like diving into page_info->count_info which is not generic.
>      
>      In any case on this is only reachable via XEN_SYSCTL_page_offline_op,
>      which clearly shouldn't be called on ARM just yet.

Assuming this is from an old commit, then I have to question this justification.
I see nothing preventing XEN_SYSCTL_page_offline_op to be invoked on an Arm
system. Hence (unless I'm overlooking somthing) ASSERT_UNREACHABLE() is simply
inappropriate (and wants fixing). Luckily it being sysctl-s only, there's no
need for an XSA. In no case should known flawed code be copied into another
port.

Jan

