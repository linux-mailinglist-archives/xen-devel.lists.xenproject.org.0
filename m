Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A4808C02
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 16:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650007.1015187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGRR-0003qx-9V; Thu, 07 Dec 2023 15:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650007.1015187; Thu, 07 Dec 2023 15:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGRR-0003pF-6r; Thu, 07 Dec 2023 15:37:33 +0000
Received: by outflank-mailman (input) for mailman id 650007;
 Thu, 07 Dec 2023 15:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBGRQ-0003p7-3w
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 15:37:32 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 887e603c-9516-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 16:37:30 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso11213715e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 07:37:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b004090798d29csm37973wmo.15.2023.12.07.07.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 07:37:30 -0800 (PST)
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
X-Inumbo-ID: 887e603c-9516-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701963450; x=1702568250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aU18r7pJhdouh6dLMlGHN3SET1Bd8uMHRetUqhiyRTE=;
        b=Z72HzBKuDtYzMJpx1mOCUEH+Cu1gCtM7dQZxyGyshwS6LO18OGnJ4xIpW2BFhx3qHg
         JK791hF/NAEV2+FCiVnJGdmtMwexIodX0OjrAfT1yfMKWMAwx1iKXe2qvzyjfNjpqDCj
         WRLHFFWzQHtvgoc7kKBWc542baFU7UddxoPlrKKuW/cPWSRNHZQuBqRDSmuSUgqb33m+
         i1cBjZ/LQBfAAAX4zRlLNfrANvpquQDt1j0qk4xRo3FiWHPzSyI9xa9u5aav5npUVPC8
         a5VsA2hbWFyfH960YEUBGjUcvAEjI1RKpFq6V3nTv2u6TVeiORBfd2585K6OlTOYvryT
         YC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701963450; x=1702568250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aU18r7pJhdouh6dLMlGHN3SET1Bd8uMHRetUqhiyRTE=;
        b=qoto9KuWWs/Eksg7kDz7nyfiON8dpsi8vyPrnKqAb6lndHjzOfOamo02jw4imQjU3i
         InaUfZ0iLZEndmrbrBQmvqobOCsmS4jPh+7hboTKnqqS2gOAb3JO5+7S0eHzXsUuDhkv
         bRk1dTugd3CYn6dJxdbW9YByimgW5FAMwdRhKPmmuasqgauXXYbozylS5AuhqgCiUOym
         6r7Vzgpm7HJGbPw3RlPzVlN8BTx+PRkrUIhLcfcGOp7wknIpiTAC+kyM/ke4pasJ+3Ws
         zzXW19hc0KOXF7uBCHCB5cnZCrNF8tJ/GQzhbU4PkikEFw+W/FucCdCSUlX0ZLNNR/yX
         DPpQ==
X-Gm-Message-State: AOJu0Yx7CgnWuWiDXXSjsVdLKCt2BBlmhQnxEJPKqFb4WFHpKaUjw7cp
	uko/XKr0UFqjJAzh0eQLiI9i
X-Google-Smtp-Source: AGHT+IHY3c4IDdWOk5rdJAAB6ZOEYrN4UPK5yorsSXLmTfN6W2maRoiU0ODA+a1xbX4+C5SvkEs14w==
X-Received: by 2002:a1c:7214:0:b0:40b:5e21:d369 with SMTP id n20-20020a1c7214000000b0040b5e21d369mr1683310wmc.114.1701963450224;
        Thu, 07 Dec 2023 07:37:30 -0800 (PST)
Message-ID: <fff80a7f-75f7-4e91-be1a-bc7fd683b94d@suse.com>
Date: Thu, 7 Dec 2023 16:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/39] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <a9c69e17fe073551e7007242d00b74b6333ce98d.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a9c69e17fe073551e7007242d00b74b6333ce98d.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

So this looks to have been taken from Linux, which could do with saying
(including which version or most recent commit). It may e.g. justify you
using tab indentation here, albeit ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -0,0 +1,288 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2012 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_BITOPS_H
> +#define _ASM_RISCV_BITOPS_H
> +
> +#include <asm/system.h>
> +
> +#define BITOP_BITS_PER_WORD     32
> +#define BITOP_MASK(nr)	        (1UL << ((nr) % BITOP_BITS_PER_WORD))
> +#define BITOP_WORD(nr)	        ((nr) / BITOP_BITS_PER_WORD)
> +#define BITS_PER_BYTE	        8
> +
> +#define __set_bit(n,p)          set_bit(n,p)
> +#define __clear_bit(n,p)        clear_bit(n,p)

... then please consistently. Other style related remarks made on the
system.h patch apply here as well (unless again there's a goal of
keeping the diff to the Linux original small; yet then I guess the
delta to the Linux file is already pretty large).

> +/* Based on linux/include/asm-generic/bitops/find.h */
> +
> +#ifndef find_next_bit
> +/**
> + * find_next_bit - find the next set bit in a memory region
> + * @addr: The address to base the search on
> + * @offset: The bitnumber to start searching at
> + * @size: The bitmap size in bits
> + */
> +extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
> +		size, unsigned long offset);
> +#endif
> +
> +#ifndef find_next_zero_bit
> +/**
> + * find_next_zero_bit - find the next cleared bit in a memory region
> + * @addr: The address to base the search on
> + * @offset: The bitnumber to start searching at
> + * @size: The bitmap size in bits
> + */
> +extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
> +		long size, unsigned long offset);
> +#endif
> +
> +/**
> + * find_first_bit - find the first set bit in a memory region
> + * @addr: The address to start the search at
> + * @size: The maximum size to search
> + *
> + * Returns the bit number of the first set bit.
> + */
> +extern unsigned long find_first_bit(const unsigned long *addr,
> +				    unsigned long size);
> +
> +/**
> + * find_first_zero_bit - find the first cleared bit in a memory region
> + * @addr: The address to start the search at
> + * @size: The maximum size to search
> + *
> + * Returns the bit number of the first cleared bit.
> + */
> +extern unsigned long find_first_zero_bit(const unsigned long *addr,
> +					 unsigned long size);

Looking over the titles of the rest of the series, I can't spot where
these are going to be implemented. The again maybe you indeed can get
away without those, at least initially.

> +#define ffs(x) ({ unsigned int __t = (x); fls(__t & -__t); })

This wants to use ISOLATE_LSB() now.

Jan

