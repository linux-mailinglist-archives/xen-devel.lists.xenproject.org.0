Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A28DA37E45
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 10:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889884.1298918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxGT-0002Nb-0f; Mon, 17 Feb 2025 09:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889884.1298918; Mon, 17 Feb 2025 09:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxGS-0002LR-UI; Mon, 17 Feb 2025 09:18:08 +0000
Received: by outflank-mailman (input) for mailman id 889884;
 Mon, 17 Feb 2025 09:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjxGR-0002LL-HU
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 09:18:07 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1811a716-ed10-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 10:18:05 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e0373c7f55so3028964a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 01:18:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e02ebeaaa1sm4085335a12.5.2025.02.17.01.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:18:03 -0800 (PST)
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
X-Inumbo-ID: 1811a716-ed10-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739783885; x=1740388685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vSPXwcIzhK+NcSfudJnXSMNHK03Wd8hAcEOOekprhXQ=;
        b=XB5ceHxYTPGsof6cS6euNLzkQ9uihfe7tzkvCwgPtQg0GLxMX7IBj/kJI3yz381l7o
         v9XYPLsKXZrrDX8WMafKoMprm838gXsdo4WUUyoxOuKytYNZnfNXoJQSJx+mGDalANKK
         ayUepIL2X42NfoahlfvroqXP25mheupXWv7+mTxNckuFchawrzbNMvnbLNnsjZH5pasp
         EQ4ROf3c1iEXQ3Hfj6NCmTwRyxROiOCDYyQ/++RQsyKM92Khs3txFSTX8JRbcnXmJn35
         ebFFnzOdzHtYez+v6uJDjqGS3SwBoB/qvvzpxhHH3Uk0taIVBkBDvlBLmCE7JBmOs8o5
         Ry8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783885; x=1740388685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSPXwcIzhK+NcSfudJnXSMNHK03Wd8hAcEOOekprhXQ=;
        b=lNd/jDQUmF/AmRrX+9uQsemufwAai5PF1vC37PM4/SoQ+CzEKPjSj+lecUMyJPb0bR
         7ZhZYzAhPfJq2eXuUggtuV7RwQIeKhZcuvFZzehQXgRPvkAGyHQWh03lbt0Um6wjOwgB
         xEcbo0gCHcTCZPFIC6aqt48a/1Qw3ktnp06/nj4vKXCITOFoKZr68cYnEF/VrSluzOD6
         dpku4tT+uEBdVJ1O/tR+LC74VqjGP35Wk0yJwWgU2FD31iL+ugUxMEg4onv6+uZx4Y8z
         3TllUmIWzOWLp3NJqJ3I0x7FNxJGt40xUO0KLZn6VAzskvLkTofIhntjNgn+vT7/cunK
         SwVg==
X-Forwarded-Encrypted: i=1; AJvYcCW+g1PnvNnlcgOrpXeLRu/YsLx7P2n0woG4EA5JBYTcj5Vr72vgU7lwHdm4M6AhAUm9aU35E6qiU8k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6FK3a8emkYv3568WDzCEFmwG02Zn+Y8KVCa2u6h6IPn2m1IwH
	rKPr+P2V3fpW1Zt+3ZXJMbqqRenTRkqz9YH5FJjSeySdJijoKJL5eCE2T3H2Yg==
X-Gm-Gg: ASbGnctJ5MSRGxDIrP5tfXbjZ35BcLtYcx29XqdF7Jjc4Y3rRN6BjGQ3yDNXsZMPbEX
	us7T4+v2Yyp7ustBE78Nj6YuGluD0+s7jUA/STvnTgFYjSNZ79nVCPiTicbjbfnWtVxEQRGpo0o
	12PDZT1cr54eUj96qkzojCpzI+zLcWtLBS2j1XLd88U9cK1mLXolIFsAy5Bxmt3KIMviUJF8yf8
	UwwkBpIsuLSmT/qZvMsNBj3LwrmKmO7PT9YTPC6JxshJ1PdewZntAMN8ASrqQU0aE6+H2w8/QUr
	68MdPTL5jwXIoSLjUPpxEtV300sDZeapTnxxa8bEEetvcNa57rcRPq9GzVccsCpy9xSwJZfc14S
	Z
X-Google-Smtp-Source: AGHT+IGKrbvRj8AQJAef33r767igMJc3Y7obIMqBWaWJWv7QLA+e0OIojPcAXLR6v/a1K3QS3KOjAg==
X-Received: by 2002:a05:6402:2393:b0:5e0:4c04:4186 with SMTP id 4fb4d7f45d1cf-5e04c04428emr3795459a12.24.1739783884658;
        Mon, 17 Feb 2025 01:18:04 -0800 (PST)
Message-ID: <95d6fcfd-6ff2-4b88-973a-1bfb29c8d5e4@suse.com>
Date: Mon, 17 Feb 2025 10:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/memory: Make resource_max_frames() to return 0 on
 unknown type
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250216211915.3891185-1-olekstysh@gmail.com>
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
In-Reply-To: <20250216211915.3891185-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2025 22:19, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This is actually what the caller acquire_resource() expects on any kind
> of error (the comment on top of resource_max_frames() also suggests that).
> Otherwise, the caller will treat -errno as a valid value and propagate incorrect
> nr_frames to the VM. As a possible consequence, a VM trying to query a resource
> size of an unknown type will get the success result from the hypercall and obtain
> nr_frames 4294967201.
> 
> Fixes: 9244528955de ("xen/memory: Fix acquire_resource size semantics")
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with an addition:

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1157,7 +1157,7 @@ static unsigned int resource_max_frames(const struct domain *d,
>          return d->vmtrace_size >> PAGE_SHIFT;
>  
>      default:
> -        return -EOPNOTSUPP;
> +        return 0;
>      }
>  }

Wouldn't we better accompany this by an ASSERT_UNREACHABLE() in the default
case of _acquire_resource()?

Jan

