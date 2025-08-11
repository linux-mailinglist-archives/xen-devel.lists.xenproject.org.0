Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6852B20724
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077368.1438425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQUR-0003nr-4i; Mon, 11 Aug 2025 11:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077368.1438425; Mon, 11 Aug 2025 11:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQUR-0003kv-1o; Mon, 11 Aug 2025 11:14:55 +0000
Received: by outflank-mailman (input) for mailman id 1077368;
 Mon, 11 Aug 2025 11:14:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulQUP-0003kp-OZ
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:14:53 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6674cf61-76a4-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:14:51 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af949bdf36cso668994466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:14:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a078bcbsm2017405666b.13.2025.08.11.04.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:14:50 -0700 (PDT)
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
X-Inumbo-ID: 6674cf61-76a4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754910891; x=1755515691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KkCzwSV/g866fK3s1DnmfYgGH7Z2U9nOnZh0BEhlf/0=;
        b=aw0zjIUy6e4as/zmZO8PMjrv7WFRbwENhYbnf9zgPtH67tYE7r+v7QZHUGpw7xL+Kl
         RjsI0IGNvhIZwO8YRgkgvKr624cRjWATfiYkAYPWDpcYtR9g2MWp/y70abFwuEuYX1PO
         9P01MGz8lkMSRbQ5npKxBese2a3A1z5gm+/0wX6gdIySFrnb7alP4GpQWF+ItjNdBHSS
         YJjjKbw6pRbo27Pfx24VMcXNjCeORV2rfZDEo61LLpRyBo5zZ6y/YBO56Y0wg9WcOIOJ
         9q78Z6A0H/rnLShmd+ehZyXvLzdZj+R22sWCAi5xwpJVtYaxWW1LcXNQmtFzAinhvZRt
         wfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910891; x=1755515691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkCzwSV/g866fK3s1DnmfYgGH7Z2U9nOnZh0BEhlf/0=;
        b=ef4iRCqSGpqJW3jbaHBDKN+fhS+9LkOUxtNG1N14n18XdOb2yRrscU3wiI03V3CJNW
         K35qaKxmAHWayXctj8JVCdG50jaif3+zUiIC373o05Iigz0iET6JnWLoOPmdjM/GXYxW
         SeO5+8knUNrNstVjSKOOKQjyxLV/WYBB0tR6zgQuSI3A2i1SJilajSVLk2+3rIi+zudc
         zK89aIHpP2NVuZkbj/3A/sdw/VC/3MOfTWCah+pml4r9oKWjQP3pZcT4X1cFt1GF+H8M
         YCP9zT361oS5NgvDlwPfwMA0Nz6P7H7w7mOH3AQ4R/DhzliR91rgQeJcDJgkwV7dSPha
         ohYA==
X-Forwarded-Encrypted: i=1; AJvYcCVO9x6+ppzKwJt0doIant5P5E8AJgm6a1KfwB/Wn/CpEnWJqxvMTl2EZ2uSkU3C5gaw/aHXDgKBiD8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw737RU/kMlbTmAQi7n1AOeDizBXmVlUs8Y2D11qPdQclFI14Uo
	+TiGkhbAoi4Ep3ezVtzUkGTgo3XcHycP4ELGaBZ95CsJK41ckYPt920tKfiD+YFPGA==
X-Gm-Gg: ASbGnctc5YHe3QRowfPAEH4OwjyC45LlfbwVL2CzhD2e3q+gCecTPBN/zPZBIDi5G7U
	3/iMTEN5JVRE/nBaQqqm/VkHdfqBNbCWTFO8s2c+NJsiENB78NEvhBqE4YiQZ0IrNpWSpZ/ApnI
	7TDcE8TspcmXk4YzyIAr5flKxjhrvLX/M6tB3WZedheEXUtRuhLOPuPzoWkNyg7YRJ/GDfFIVS4
	dTOpp2b4qWGNV26Jg1AVjUxfgH2w4qYzJwndmkGQhnd1SrP3LdF80TwTY858wkcz0/rdq5Rzn7A
	1IkWLBCmlxBp7kvUeyZgi+2qhLhaNAzColNn0yX1iQjZpILIbFX1COXxWybWicLT0Qkd//zYLUw
	1R/i8AZ9j9osI5On+ywmWjp7UtzGHG2M5BRojSp5lMgofRTSESYtczB0iWbYmUXz48fBTgax+8/
	lZtFiFPsQ=
X-Google-Smtp-Source: AGHT+IGmhjF8w+DtfcJEiqASmVeiH3t77PaOIxhG48piG1AY/D5XEzAjpXj6cte47n0yV4eKQnCvfw==
X-Received: by 2002:a17:906:c114:b0:af9:add3:6bbb with SMTP id a640c23a62f3a-af9c64f2202mr1194435566b.29.1754910890888;
        Mon, 11 Aug 2025 04:14:50 -0700 (PDT)
Message-ID: <db85bafd-c2f8-4aa0-9cf4-0529b0a39bcd@suse.com>
Date: Mon, 11 Aug 2025 13:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/4] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20250809170747.1836880-1-dmukhin@ford.com>
 <20250809170747.1836880-2-dmukhin@ford.com>
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
In-Reply-To: <20250809170747.1836880-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2025 19:08, dmkhn@proton.me wrote:
> --- /dev/null
> +++ b/xen/common/domid.c
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Domain ID allocator.
> + *
> + * Covers dom0 or late hwdom, predefined domains, post-boot domains.
> + * Excludes system domains (ID >= DOMID_FIRST_RESERVED).
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#include <xen/domain.h>
> +
> +static DEFINE_SPINLOCK(domid_lock);
> +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> +
> +/*
> + * Allocate domain ID.
> + *
> + * @param domid Domain ID hint:
> + * - If an explicit domain ID is provided, verify its availability and use it
> + *   if ID is not used;
> + * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
> + *   starting from the last used ID. Implementation guarantees that two
> + *   consecutive calls will never return the same ID. ID#0 is reserved for
> + *   the first boot domain (currently, dom0) and excluded from the allocation
> + *   range.
> + * @return Valid domain ID in case of successful allocation,
> + *         DOMID_INVALID - otherwise.
> + */
> +domid_t domid_alloc(domid_t domid)
> +{
> +    static domid_t domid_last;
> +
> +    spin_lock(&domid_lock);
> +
> +    /* Exact match. */
> +    if ( domid < DOMID_FIRST_RESERVED )
> +    {
> +        if ( __test_and_set_bit(domid, domid_bitmap) )
> +            domid = DOMID_INVALID;
> +    }
> +    /*
> +     * Exhaustive search.
> +     *
> +     * Domain ID#0 is reserved for the first boot domain (e.g. control domain)
> +     * and excluded from allocation.
> +     */
> +    else
> +    {
> +        domid_t num = DOMID_FIRST_RESERVED;
> +
> +        domid = find_next_zero_bit(domid_bitmap, num, domid_last + 1);
> +        if ( domid == num && domid_last != 0 )

I'm pretty sure I commented on this before, yet then maybe it was in the context
of another patch: Using == here isn't sufficient; it needs to be >=. See e.g.
cpumask_next().

Jan

