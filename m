Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5CA95E9A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 08:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961685.1353033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u77OY-0004jG-R6; Tue, 22 Apr 2025 06:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961685.1353033; Tue, 22 Apr 2025 06:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u77OY-0004h4-OK; Tue, 22 Apr 2025 06:46:14 +0000
Received: by outflank-mailman (input) for mailman id 961685;
 Tue, 22 Apr 2025 06:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u77OX-0004gy-M9
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 06:46:13 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a4a9f6c-1f45-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 08:46:11 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso35280165e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Apr 2025 23:46:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6e0364sm158292755e9.38.2025.04.21.23.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Apr 2025 23:46:10 -0700 (PDT)
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
X-Inumbo-ID: 7a4a9f6c-1f45-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745304371; x=1745909171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=goNbJTkZTQdJBFY9N6JtVlZDHZoN3LR5Kvcrw9p6VJw=;
        b=VwzPdWaGO7r7Eo+MMyphjk5PMBt1C7rbwr/ahezIWsgxai7Toz2o3oGdYLhdRSBF2a
         gOm1JwDnRu8LMKpt5+1wACHk2nL2fis+1jCL8Pp4xp8FeYhPMxg6E/qkVkSwNU60EoKD
         oQRxyn2RZsm4CZIpvG4ZxKXagsUAJUVFmwY+lcv9upegaYyTvGnaJoBT2SwdMsfQpXKE
         zg/7zk1bcRkLVtzD8c9hHPfdLUzLVbY2ZOnKkeaThZJDPVH0FiSEALnphLIP1b7JkrvS
         zt3xSrXEelmpuFynLp7cG1UUTXoyZ1v7kTbwMNsBKef2r99RQ0WwYBW5klef8elHK7a0
         yfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304371; x=1745909171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goNbJTkZTQdJBFY9N6JtVlZDHZoN3LR5Kvcrw9p6VJw=;
        b=qw5FNDxcEabu2im3POEBuSGBVggq/a0spNciezsSBob4cEcWu/pShnzd1dmmVfMsLw
         nlwwTbjoap2d17Zf6yhtZpQCSO8CwIv8CoSOx6yJrpp2cAnoOREHQJRI+WD1Nx+7qhJy
         UtAjKxGsGNKbDIP5v+g+wrVp+StP/Hb0wscE3gPOfwWa8CLSVN5GhbIR4W7XOOii8Nzl
         nf7N68aNu3Y3Y5BERYZudPwRg4v+lScHJuFrWLb4+fLRBTUpLFMhSY0lweNV5GhuXOf1
         ME6HBRoBfXzXKg8aLadiIeC6bDLAbqRF/N9tSKPOtBCC6dYBviRbSGwNmBWWgA1jnXww
         iWhA==
X-Forwarded-Encrypted: i=1; AJvYcCVBHCpXnUB0OLv5294+/1YbaDjyPzr/k8X7WjCjVoyq7vYGaekmWr7GBQmpFeNqfM5jRt+HcabfbkI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhGXVPEVxU6NUo55gdnfPBJV2kg3rqvUqMogvO0jgadFYCOy/7
	EebvFsUx9qLxAge1Iar9Xn14ugXcq4SKkxCjDUftH+7DTqCIg24x/NcbQIWndQ==
X-Gm-Gg: ASbGncu2AdEO88crEZlLU0C79vI4+hiYeISlQwSKS100LkSDz2RkmChf5MxdiTFuOJF
	QYt2BpMadbgRU6jWWKovdHGijAZysNWWQZxgtQNoZ1AILvkKOs7H46WA7pebviTyQujipTpPOZp
	iABGjr3L/NS1pGXaPpfK5mSiQKtLmurBkV3TLDabASILqv1Us7JQIsgAwNXJZ2YiA+mJPHTQHIo
	eIWrDYPdjeJX2M8oL9Mv3VgdekOh5YWDzqVim81AWjaCBxbbflyOZyMSs0Ysxf5BwKGXdrdUb9V
	3+xWsiqJdOXteRErXyuwZ0FF+2Jad01qajrvaMbMI+ZY/ViweTxRAgsOTQjWQR0exq2+LKelT8z
	ZfjgWIeEUm9Ii+7qNG/lovNPi9A==
X-Google-Smtp-Source: AGHT+IHEB9aZj6e4amFP4n2by2E+rDakfFHK6yAf5sKAFanoEDd+RGa8vnORxFULfbZ2AmfEKPl3hg==
X-Received: by 2002:a05:600c:4707:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-4406ac27536mr91096385e9.28.1745304370943;
        Mon, 21 Apr 2025 23:46:10 -0700 (PDT)
Message-ID: <32297a1f-418f-403b-9529-e9f2620e1279@suse.com>
Date: Tue, 22 Apr 2025 08:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250417152514.13702-1-roger.pau@citrix.com>
 <20250417152514.13702-3-roger.pau@citrix.com>
 <f71bc0f8-8de1-4ecd-a2c0-a420e991e429@suse.com>
 <aAErECZ1Ys-Nufon@macbook.lan>
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
In-Reply-To: <aAErECZ1Ys-Nufon@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.04.2025 18:23, Roger Pau Monné wrote:
> On Thu, Apr 17, 2025 at 05:38:54PM +0200, Jan Beulich wrote:
>> On 17.04.2025 17:25, Roger Pau Monne wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/hvm/mmio.c
>>> @@ -0,0 +1,125 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * MMIO related routines.
>>> + *
>>> + * Copyright (c) 2025 Cloud Software Group
>>> + */
>>> +
>>> +#include <xen/io.h>
>>> +#include <xen/mm.h>
>>> +
>>> +#include <asm/p2m.h>
>>> +
>>> +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
>>> +{
>>> +    p2m_type_t t;
>>> +    mfn_t mfn = get_gfn_query_unlocked(v->domain, PFN_DOWN(addr), &t);
>>> +
>>> +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
>>> +           subpage_mmio_find_page(mfn);
>>> +}
>>> +
>>> +/*
>>> + * The guest has read access to those regions, and consequently read accesses
>>> + * shouldn't fault.  However read-modify-write operations may take this path,
>>> + * so handling of reads is necessary.
>>> + */
>>> +static int cf_check subpage_mmio_read(
>>> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
>>> +{
>>> +    struct domain *d = v->domain;
>>> +    unsigned long gfn = PFN_DOWN(addr);
>>> +    p2m_type_t t;
>>> +    mfn_t mfn;
>>> +    struct subpage_ro_range *entry;
>>> +    volatile void __iomem *mem;
>>> +
>>> +    *data = ~0UL;
>>> +
>>> +    if ( !IS_ALIGNED(len | addr, len) )
>>
>> What's the point of doing the | ? len can't be misaligned with itself?
> 
> Hm, it's the same form that's used in mmio_ro_emulated_write(), I
> assumed it was to catch illegal access lengths, like 3.

Oh, I see. But that's not using IS_ALIGNED(), and imo validly so, despite the
apparent open-coding. IS_ALIGNED() requires the 2nd argument to be a power of
two. The combined check there is folding the power-of-2 one with the is-
aligned one.

Jan

