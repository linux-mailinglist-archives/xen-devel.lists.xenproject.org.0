Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2F8494C1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 08:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675675.1051025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWtgY-0004XJ-81; Mon, 05 Feb 2024 07:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675675.1051025; Mon, 05 Feb 2024 07:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWtgY-0004Un-59; Mon, 05 Feb 2024 07:46:34 +0000
Received: by outflank-mailman (input) for mailman id 675675;
 Mon, 05 Feb 2024 07:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWtgX-0004Uh-8g
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 07:46:33 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac4a7774-c3fa-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 08:46:29 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so3156192f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 04 Feb 2024 23:46:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n8-20020a5d4208000000b0033b1b01e4fcsm7449521wrq.96.2024.02.04.23.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Feb 2024 23:46:28 -0800 (PST)
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
X-Inumbo-ID: ac4a7774-c3fa-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707119189; x=1707723989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjSQo4C+RU730aORSF5XUTZ6KLXBn/fJU6t9RU4V5Dk=;
        b=fylLfL4Wd6U/u9EYnU2oX6tVbvCKYmvTp7mqMp5TVsCUzqPFTay5BpY8/gLZN7lJ8Z
         99JGveU1p10O6oWBWDJvYzPus3F5Xdfy1EDqZrBXGXkRy2Jey2tOwiMXPbLkZjQTVyJr
         DloxquIXguQHAwwE2BoLDZS7uNfMmOex3Ok9aQfCmUATxCntyPhsJuoqvvP0MAq46lB1
         nPLkPxBK28z2aOxMVagtlG4T1CkeNnue/5VMux5371PC1lUiP5rgDBrp9aqWi+MW/Qhz
         3KTBhy1D5K8iDoYLCDTXoDBuog76DUd9pJbRGTUcdPyycTJpayICAQVEGaADrYd7Drg+
         NMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707119189; x=1707723989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjSQo4C+RU730aORSF5XUTZ6KLXBn/fJU6t9RU4V5Dk=;
        b=Oq6DvEDhZ8pZ/2OJ9UF8tAKbG92bl5+w4QaYaKbJs7+PiHnySVyRn/CCJShQ8StpXa
         JRWCNr3ylVoDHIepi0fz81pELT401gBqSd06FwgN6iiaJKYwKJj6HFWTo8z+2l95r+vO
         MO0kfqZjjGxj1dlLPSAHk36EDfB3y0flpNputBySbzNC7dcoAujDOAqZnqCUlWmqbO7j
         Ero9g6Mmoz3FubHLxglmDV//NgA1xIig4YUGe19a0vvoborMiK2JuukY9g87t/E0qnwm
         dLNO8TWOh1wtb3usQiAxTa9Y8HZnlmMjolo+19mDsM5SW50DevTo72fmX4Xc89rRaMe5
         AqyA==
X-Gm-Message-State: AOJu0Yy1Ir2J64LXPcY/edL4X789CU18Po1/VtsbQ6NX+Z9N8F4vr8aO
	gPxEvaVK6z1R8dT4cKhKzMk8VHXmMkRuA1wXO0WBMhlBqGcXQoE3Obpi7oLeHA==
X-Google-Smtp-Source: AGHT+IHMUJDoE9LhZEEGDpkNIsLx6rWaY8eVjKhBLBY4RrCN4WH70whjLLrvSammXfUjJwv84gFiZQ==
X-Received: by 2002:a5d:47aa:0:b0:33b:3dcb:9564 with SMTP id 10-20020a5d47aa000000b0033b3dcb9564mr1405884wrb.2.1707119189008;
        Sun, 04 Feb 2024 23:46:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUwnzG7qvOUK/2VXOP17tUvEric+bBn0h+1DvnTlL83ESI0wWf3NOd7cypwG0zz4ukKjimSeOjn1b0iWlf25R/sa/ffh3qD6liBvKQ33qxWwqq85H5hY8j4aJlV9zq6ZiI8J44pJl8+7SPjPow0yn4CT/t1s3zykUNaaWwYcnQCf1CyMWQrlx68NxoE4e67HCLIELgkxAFeXDUlv8sxkHGkV3PwcpkTJa5ph5XDSMZmEyMo4BzVOf+OTeq2CtT17sxW9zP1d8WPeHfYL0EBiIdjOQkoK2PR7muLYVm0u+pOBOdTLHpVhyY=
Message-ID: <44a9a92c-ac4c-43d0-bc1e-685818e4331d@suse.com>
Date: Mon, 5 Feb 2024 08:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build
 full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
 <d347c4d9-e93b-4937-8e33-e5fbbdcd6bfb@suse.com>
 <f3858360fba14a2c5b794bdd0400cd7ab8e66f73.camel@gmail.com>
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
In-Reply-To: <f3858360fba14a2c5b794bdd0400cd7ab8e66f73.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.02.2024 18:30, Oleksii wrote:
> On Tue, 2024-01-23 at 14:03 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>> +/* Convert between Xen-heap virtual addresses and machine frame
>>> numbers. */
>>> +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
>>> +#define __mfn_to_virt(mfn) maddr_to_virt((paddr_t)(mfn) <<
>>> PAGE_SHIFT)
>>
>> These would imo better use maddr_to_mfn() and mfn_to_maddr(), rather
>> than
>> kind of open-coding them. The former could also use PFN_DOWN() as an
>> alternative.
> We can't to as __virt_to_mfn() when is used it is usually wrapped by
> _mfn() which expect to have unsigned long as an argument.

#define __virt_to_mfn(va)  mfn_x(maddr_to_mfn(virt_to_maddr(va))
#define __mfn_to_virt(mfn) maddr_to_virt(mfn_to_maddr(_mfn(mfn)))

?

>>> +/* Convert between Xen-heap virtual addresses and page-info
>>> structures. */
>>> +static inline struct page_info *virt_to_page(const void *v)
>>> +{
>>> +    BUG();
>>> +    return NULL;
>>> +}
>>> +
>>> +/*
>>> + * We define non-underscored wrappers for above conversion
>>> functions.
>>> + * These are overriden in various source files while underscored
>>> version
>>> + * remain intact.
>>> + */
>>> +#define virt_to_mfn(va)     __virt_to_mfn(va)
>>> +#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>>
>> Is this really still needed? Would be pretty nice if in a new port we
>> could get to start cleanly right away (i.e. by not needing per-file
>> overrides, but using type-safe expansions here right away).
> We still need __virt_to_mfn and __mfn_to_virt as common code use them:
>  * xen/common/xenoprof.c:24:#define virt_to_mfn(va)
> mfn(__virt_to_mfn(va))

Are you meaning to enable this code on RISC-V.

>  * xen/include/xen/domain_page.h:59:#define domain_page_map_to_mfn(ptr)
> _mfn(__virt_to_mfn((unsigned long)(ptr)))

Hmm, yes, we should finally get this sorted. But yeah, not something I want
to ask you to do.

Jan

