Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96581B3DC13
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 10:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104122.1455261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszgA-0003U4-6a; Mon, 01 Sep 2025 08:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104122.1455261; Mon, 01 Sep 2025 08:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszgA-0003Rq-3g; Mon, 01 Sep 2025 08:14:18 +0000
Received: by outflank-mailman (input) for mailman id 1104122;
 Mon, 01 Sep 2025 08:14:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uszg8-0003Ri-U9
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 08:14:16 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a12eb794-870b-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 10:14:06 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61cb9e039d9so7977709a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 01:14:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7ed1sm6740456a12.1.2025.09.01.01.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 01:14:05 -0700 (PDT)
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
X-Inumbo-ID: a12eb794-870b-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756714446; x=1757319246; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LnTjTlkxSTo+O8IMNavi+odu+EOnDJITVeZaSR4UGi0=;
        b=DFaqBW0gDzUBbx8GjSMRt0w+v/sYKt1sVl1uzTpTocK/NKGYEuj0QyiQ5sBPbp4a9R
         rKSGSYRgNdODz++gwaOkhBL8mJqWHgI2kNjsJXYZjBqXT1etM8OtTcbiUkXeHwm3VSd6
         Mp3A+mbKkL1tjQgaXIjNMITZEUViT3jXu7J7I6cuHKBAVkXcYld3UQjfnSH2p/pOiXUK
         qJQMnqOGPidb3JLt/yx26r5VTbSoIyppvaiHJSBAta6fTUiAc4RfnmdNmjN0BsBTQkva
         EuZGysg1XMGZyU6ryIUlZwZsNvb4PPQPe95AP+9nNc/HbY0VewXv1J4dmlzD6BGMrpw6
         latQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714446; x=1757319246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnTjTlkxSTo+O8IMNavi+odu+EOnDJITVeZaSR4UGi0=;
        b=XRsnYf+FjgbUouW4qTAsLNzigAYqQ+nKW8lMo519kU9n6vTw4koVVW/LmcNqtZJK94
         81nrj1vAwqPylqy2Xe3jfDnReC09DPOzZZhGTef+HYOBORbaX3D2oS4pfBGbNk07nQMO
         kBEVofMhLxSWZEv3unYGvWuYDsUpgM3fU30FfVeYBfxI/NjnXw3eXlzunPbwe3vUhSmI
         KqhOnuig2tlV1brPBv+wbbq1DZ81nr32j40cwcWpOYBEAZePFX1mF1xFkRpBBOSqTajx
         s++ETz95pJFaAJ5si3VMSvp59XkTaL9ufrf0l9Ia/kBS88PLIAIWI2OgrO6KdDKSKcgE
         4hPw==
X-Gm-Message-State: AOJu0Yw3E7OJqqGJMmSTTyrpu57KPBYbqaGzsspM3B+rSrt/HJ22o2pd
	zwyrXS3sDAdfiIbOeoDLIMSlX25GDt/seX9t8wZ5OfZmfsVbUpVyFMH/nX07ArrSjA==
X-Gm-Gg: ASbGncusKvpvt4VzK+fWyTy5T0y/8vEo4Sge6UXiIbxrkBKiVxQtWcSkMEXKN98xXLQ
	wy4h03Dqd0wJt5/qeurHav8uj3UHTo4fimFGd2VTY/JcwVQUlz4OalzstM82v5mYmLsq5J20c6j
	xqEqBEXGVngAcY5DNPNSkjhRccl0iBGyfx9xFuCeSdZr06TaBxApg8SSqdGcHaZdeLVHBGRCRJj
	cgESCIEC8API5z7UWvAyPYFVGjZBnyE9Y0r/RUEsIG0QH5AKkZW/avIcsiNiMoRUuHNXz5Ua4dP
	fbQ5aS2RI4+8LTHNyRrSwI3Szb7Vpt6kNEmsmUIdXr9MCtv+jaDT/NnaXISTI+jICX+pAOR3lGt
	0dXfF+GT84g+VMXUxC662hqqAosDw+HzJImO9c5jWF+/bzXQ1SNcuKNxikHzulMcGDcHLZ7JW9S
	zltTM7F4g=
X-Google-Smtp-Source: AGHT+IFiEgu6xSz7DpSTXM0ahWBr1zkYJU4a358sdzlU7a2z8pbLSb6JNQ8LYYzE34Bshe3eMauFqg==
X-Received: by 2002:a05:6402:304f:b0:61c:5756:c2b8 with SMTP id 4fb4d7f45d1cf-61d269a7bc7mr5345308a12.9.1756714446261;
        Mon, 01 Sep 2025 01:14:06 -0700 (PDT)
Message-ID: <37f4c1af-29e3-44eb-a238-a3e2e4641f10@suse.com>
Date: Mon, 1 Sep 2025 10:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/15] emul/vuart: introduce framework for UART
 emulators
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 dmukhin@xen.org
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-2-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291217110.341243@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2508291217110.341243@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 21:27, Stefano Stabellini wrote:
> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
>> --- /dev/null
>> +++ b/xen/common/emul/vuart/vuart.c
>> @@ -0,0 +1,156 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * UART emulator framework.
>> + *
>> + * Copyright 2025 Ford Motor Company
>> + */
>> +
>> +#include <xen/err.h>
>> +#include <xen/sched.h>
>> +#include <xen/vuart.h>
>> +#include <xen/xvmalloc.h>
>> +
>> +#define for_each_emulator(e) \
>> +    for ( e = vuart_array_start; e < vuart_array_end; e++ )
>> +
>> +extern const struct vuart_emulator vuart_array_start[];
>> +extern const struct vuart_emulator vuart_array_end[];
>> +
>> +static const struct vuart_emulator *
>> +vuart_match_by_compatible(struct domain *d, const char *compat)
>> +{
>> +    const struct vuart_emulator *emulator;
>> +
>> +    if ( d->console.vuart )
>> +        return NULL;
>> +
>> +    for_each_emulator(emulator)
>> +        if ( emulator->compatible &&
>> +             !strncmp(emulator->compatible, compat,
>> +                      strlen(emulator->compatible)) )
> 
> strncmp will continue until the given count even if compat is shorter

Not really, one string having a nul char and the other not having one is a
difference, at which point comparison will stop. There would be a problem
if "compat" didn't point to a nul-terminated string, though (and I didn't
check that aspect, not the least because then "shorter" doesn't really
make much sense without a length passed in).

Jan

