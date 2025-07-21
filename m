Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67670B0C56F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 15:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051538.1419884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqmy-0002a1-NQ; Mon, 21 Jul 2025 13:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051538.1419884; Mon, 21 Jul 2025 13:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqmy-0002Wx-Jp; Mon, 21 Jul 2025 13:42:44 +0000
Received: by outflank-mailman (input) for mailman id 1051538;
 Mon, 21 Jul 2025 13:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udqmx-0002Wr-Ei
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 13:42:43 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92b76e30-6638-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 15:42:41 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso3528699f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 06:42:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb678cdbsm5910329b3a.108.2025.07.21.06.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 06:42:40 -0700 (PDT)
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
X-Inumbo-ID: 92b76e30-6638-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753105361; x=1753710161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EELOZ3g6AGEXrBqOqkGzHTQFf6J/gkEuwO7GD5ZXUV8=;
        b=Hd1UuO015NfizbKJFfArwWqQlM5zRK2k0X0ITCbiL05EdSYP4ftCxx/+BrPPNuBEyC
         PdZEPV+kOv7zjjdSzSPGmGdFO8opLY3vnnppiBEz2oq6cCz4YbyAjbCMREDS1yRkQBD9
         /Hamh+tncoPbjkSXRAVam7X8ow5Q7oG3TeyPhjQxDQkFHOOCk+9WMYeY8GW1X7N6jPQk
         EWahCFovdUBaDQkOSWaHXf2rRm2UrBeZXp+FeSeFc0KB7XljxBAcXGz/I7GuwXB9dHeZ
         StNIKBStO/NnsQ+1n/BxaC9Ps1YzsDuv343NEm3yIeocFOJeV/zibASDpt6bPYEqJlFz
         X2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105361; x=1753710161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EELOZ3g6AGEXrBqOqkGzHTQFf6J/gkEuwO7GD5ZXUV8=;
        b=HZvRDXgdNhVSbDqIpDcf+cfix3eksH5jaM9m7O7vy2SfArlAHkYiJVuoIfje+ICfx6
         QL1EHqYSgg7TdkoGcjlQi7+VCzLhXadqgN7jZV/95wSFH7MT2xiHnoOQhk3KH4+ROxJx
         4RRTs3ek3IWfsktQHv7DNMRCaxapn7BXNaVzi5DI845EXE6JucjMrl5yzMXj3LCxRcf/
         Nx23QCYSHou46nj6X6Ir3RndFOejcuU340S0BUMSr4uQQftb0Gant14FUZ6dhrlnupCh
         gD2vfkYumlZYqcW7EypRYvrqVDAv178GY+1PyIrHBQPO+e7yWC9KC8pjMwvfhs3ZBlVU
         InEg==
X-Forwarded-Encrypted: i=1; AJvYcCUMlqJgKRALAUzhpFgo6YRItz3f77+F2JJSgstogTmOiZP6tIlM6PKVeVSOBMnJrmwL0XVHr5Z2tfo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhMIMMKxRmNWOf+MG3E2jGgeLV8jP3uQ0+hnNbuceqDxNzy7Nh
	M1Efuxz+mmLUhZNF426jp8XWgNTzWSD3uXw+S1bppjwbrRL3Z1DqLhWAp61NdwrM6w==
X-Gm-Gg: ASbGnctmzpkQINPK60AsbOdm2H+aSM0iIXcskURw8Pxcoffe+1i7fQN4bnntqNF1MQ5
	hqEX3xgd91C+vW/t3opEZfJj9UX4eJgslfC4xGxPSgvFslEKMlSFuSbsxonwF2ZkAry9T+OaMse
	rq+hdEVt38ewIw1SALdPshuuxK5RRJA9etQtCASQq/Vfx4OlvPXkCnisyDePW9mUqbHeuESA1ph
	c3u+IXGp+TX9m8lvEWBS/tMuU7wJ/FtLY+IOp3tkDCWKz5PMTngii0NiqWVz8bWkBpSqTax25Ly
	dnMkcT/L5jonXYzXNyMubqB9OFLCCcx2Y5lorz/TdFZovVsQHKUEjmAxV2rZz7dsdfoPgSltcZz
	Z6tJoOCfUK/cyhxe7OFgOGizNctIVz3nZQ+WiVw607eGZr+lkwfIgLT4iFFP31eueAe+N6ibL+9
	q0iYzDHog=
X-Google-Smtp-Source: AGHT+IE6HPzq5gF2TDIcNoJKkkkfztFVof6Q0h/9aCyRyy0CgujaocihXRutrk86QdpCVYVvB87hvw==
X-Received: by 2002:a05:6000:1a85:b0:3a4:ef36:1f4d with SMTP id ffacd0b85a97d-3b60e4f2c6amr15442453f8f.38.1753105360788;
        Mon, 21 Jul 2025 06:42:40 -0700 (PDT)
Message-ID: <cd9c57e9-55e8-4663-8e15-b22619a3abf5@suse.com>
Date: Mon, 21 Jul 2025 15:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
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

What commit message are you talking about? Nothing like the above is anywhere
in this patch.

> There is no callers for page_is_ram_type() for Arm now, and I expect something similar
> for RISC-V. As we don't even introduce hypercalls for RISC-V, we can just live
> without it.

If there's no caller, why the stub?

Jan

