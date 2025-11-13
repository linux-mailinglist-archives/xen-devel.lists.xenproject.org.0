Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA026C56979
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 10:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160804.1488858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTdb-0001oZ-EV; Thu, 13 Nov 2025 09:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160804.1488858; Thu, 13 Nov 2025 09:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTdb-0001mB-Bs; Thu, 13 Nov 2025 09:29:07 +0000
Received: by outflank-mailman (input) for mailman id 1160804;
 Thu, 13 Nov 2025 09:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJTda-0001m5-4T
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 09:29:06 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31eb2930-c073-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 10:29:04 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso112522666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 01:29:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8bc8sm123519066b.49.2025.11.13.01.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:29:03 -0800 (PST)
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
X-Inumbo-ID: 31eb2930-c073-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763026143; x=1763630943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V9aOP1Dp/9mYbtTrsKqHJZ6AvRGu7n4rjcFCoLOgIQg=;
        b=ZqHsrZ5J2uE4BiwCmFhTbqIEOHA8DSLnH4I1LWnG9d4sEVwgnc7yHl3O6ufrEQCUE/
         UMJegcqnWpw4XK31jX/ID3ejqkM5j0gwTWaDzusI6cS4dIklpkmyCqBJ9mpOlpLYt3I9
         D1WlBL1pmsgzgUA0SQn+0H5OYKItty61Ya/FSdD6qGH3ytzEgo0b2TwjrHX1vJlT69Jm
         NeoXYLjL5v+/qZXhFbmZHFlWnCxUIZhLGcr52KULwgS1NVfn2eCV3U3/VokPsUpkMhGz
         c9Fyf267TxKJrewSR74qODpZ8x2laZR5S0F1Vl+WgY7OHKJUVbiVXMi5ihO40Ty/g5nv
         KAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026143; x=1763630943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9aOP1Dp/9mYbtTrsKqHJZ6AvRGu7n4rjcFCoLOgIQg=;
        b=D+4N6RYSRavVdjVy03sv6AJ722KqbNAmTwnpY3VZ4JOVQXVovx+Yc++CQNM9m8G5fU
         vYaPBlq00uB51QXredWPJIHwJIUdnNtt8U/q5vijVJNRfMC9dfGCe/vLbeFUExrNBRxv
         VZMeKnlWw1RrxF91O+wtJdP4sfToZAl8/IhBkK3q6AsPhDfdXq5p4aEKDF95I9M8dVGQ
         Dijmf9GPp2xIA3a/p4nIZjCXqmCZAb0AEesByMOvkNWhZmR6ZwKnBG8n+O+gU5Irx7bL
         c8s93ucgVAtl/RUe95O5CPK3ROMhV3fo1KJiOfeAHdfoj08wemEg/T+jZp6p54stzOCW
         mo9w==
X-Forwarded-Encrypted: i=1; AJvYcCU5c/WcSsZslGcDxf7KAOzXqKpA8mbdGiKRmxnS2sywsQ/JPxzBPSvY1mOgfheG2Jl5547fos82q0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxyk1t/yjJ6GOWKRIF/5stbmFjd3mGmQBJlxqlfc9DOoQ03Ikik
	LTrev3BKWkPNhnaK5Bqvw2GDiLw9KJcTwgu7XC3C2ug+GUA1YXe8FwtKYH7PrDVYaw==
X-Gm-Gg: ASbGncvvh40NTNVePyCjkwNXCRiSkscHDHcvD0gavOZM3XxBgNatTBOJJOYPnXBHPb8
	NRBc86DNvxpsekYeHIkJ6icAyl6J15T9LGt3u+ultbp7vLPeEd+h+ceUXt8Oo2+KsJOgTk+8nji
	eL7HV3JZWaYGuWNsZe+9pfIJC7zHlx3XCRocqrgzkwJ6Cl0yP8su5l5XqHp4OmHa7s1XybVXuku
	RGzYEu9VcXAgp0bLa/L7fVfFNfkFXlFFI0luFo2EDO3x2Im9yIbBPul4K9LbJlYQ4zNEAAEPMl/
	eR5dM6Ihx/P8pxoimjDBi+FC/euPTcr1tQNo2S3h05BumyknEtVocHhsqEjIgpwKfUo5rdTwoCI
	YxxIJyPobdtKf+mcMa0eZEwU4dZBfeo1hPsWYieAMYa2RHGy6U5rVq/XNC+7KHSbItcXDqJdvyo
	ekOAoKfvj/p2UHekf/BZPdVavqOA4d7zaAUusbXMJ/6xOciy8Mxo0mEi7ptLsc1biAJ4h+1Fb3U
	Fg=
X-Google-Smtp-Source: AGHT+IFPTJQtZGMbR58PZXPBJDG/lu5Sjjtha3ebGNAGhrw94sPMlWKoAb0Ja8LzM6pe42BVokuZNg==
X-Received: by 2002:a17:907:7f87:b0:b71:2145:dfc8 with SMTP id a640c23a62f3a-b7331a7031fmr666717666b.39.1763026143476;
        Thu, 13 Nov 2025 01:29:03 -0800 (PST)
Message-ID: <dd96b628-a4e2-42a9-b8ba-4ea597f9ded6@suse.com>
Date: Thu, 13 Nov 2025 10:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/7] xen/p2m: move xenmem_access_to_p2m_access() to
 common p2m.c
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20251113031630.1465599-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 04:16, Penny Zheng wrote:
> Memory access and ALTP2M are two seperate features, while both depending on
> helper xenmem_access_to_p2m_access(). So it betters lives in common p2m.c,
> other than mem_access.c which will be compiled out when VM_EVENT=n && ALTP2M=y.

Yet when both are off, the function becomes unreachable? I.e. doesn't there need
to be #ifdef around it, to please Misra?

> Coding style has been corrected at the same time.

That is, blank lines were inserted and nothing else, afaics. Could have been said
explicitly.

> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v3 -> v4:
> - new commit
> ---
>  xen/arch/x86/mm/mem_access.c | 36 ----------------------------------
>  xen/arch/x86/mm/p2m.c        | 38 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 36 deletions(-)

Imo with this movement, the declaration wants to move out of mem_access.h as well.

Jan

