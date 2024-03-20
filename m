Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A28812B5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 14:52:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695922.1086235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwMW-00084P-J4; Wed, 20 Mar 2024 13:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695922.1086235; Wed, 20 Mar 2024 13:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwMW-00081C-Ft; Wed, 20 Mar 2024 13:52:12 +0000
Received: by outflank-mailman (input) for mailman id 695922;
 Wed, 20 Mar 2024 13:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmwMV-0007zI-Rk
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 13:52:11 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc71c52-e6c1-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 14:52:10 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso8706130a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 06:52:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a056402091200b00568b6f73491sm5557660edz.14.2024.03.20.06.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 06:52:09 -0700 (PDT)
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
X-Inumbo-ID: 0bc71c52-e6c1-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710942729; x=1711547529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=II4y1E8zMQL5MTcZbckP76UZN6K9hkpvDxtIt/wDvpQ=;
        b=FdhwOykEaZosWE1cPhMmp4sZzu88/LoRI4KXJ4FhwIZ4Jfhmvw9orslIef2+Aa5p6d
         oezP040mqMRq/KKs43qfahwlsPy20H+4bewial2pq3Tt90Hr4HAkh1/dq2fbwDnVE1zp
         zj3ZheUF8NUQ/VEz8hT7+RyNOheBNrhS0LfZ/0/NJsx3c73OZFji49ZNuZjAp9L33yYj
         geBJ0LHLux/7ulQrR3GlBlPBsR3ZC6VioYxH+jS22j4WhBqCHBuQ49pYt80pA6+M8eqE
         n+NbNXQ/AG8vLxU6MCwALQHGtJCj/fZPrTBN/9ZhiEJZOjLaEXfKu0yWMIrMinBBWul3
         oULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710942729; x=1711547529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=II4y1E8zMQL5MTcZbckP76UZN6K9hkpvDxtIt/wDvpQ=;
        b=aQoRjRYX+5kN7h0G+FUzNDqoO6vlYQU6xfhyKNwVrT1yPC44wL/JHQT7xaTai92PK8
         V4tj7EAkSmRTAbWMTUMJ2ZX3LQxoMD33kgcxJL6xsb+Nv9XPN47R7ubWd6T+qKcFE2ZH
         iZi6Ik704zcPXG+3cwbhrfjJtcg07LvEzMmw1c4Jfkp60x+UMENBFWdREy4xeQ9fZ3Ax
         8EJbVaB2Vc2HlTvZFnBx2Nd7mCeEl7wKGKvpXnRnAodqcGhmcQAqTtV3zdUjzJp+VTZy
         +fdUqfQ7zHSJPQzT11aqNn2SLrjEMm5xY/scOF2U9ulOKempkkQEmPr6H6ZpjWy6DIz5
         f4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPV7lFdx648zrwZzhJ/lRv+/7Vuoz38Gh7E2BGthCbgQbxLWRxFSQ2Cy52nyK5CF/M4fn16y+SFvzB+n30SUsFRHBqdKmbzuUqmnOWAL8=
X-Gm-Message-State: AOJu0Yyy4xo4BlpSVOVrTMxXLKfK1QeJvWQNrH0RldvMGV+MscYQoBcn
	io+5xCl+VtelunRPt6izgndWnDtZ8ik8/ym9IWCJ5qpeolhLH0sgKlmoxQvVLw==
X-Google-Smtp-Source: AGHT+IHSRRC09PlTdnLIJN9/ryDHQ2hyjK3k0+9BJMDreXQMBumLI2YfjRWSAdvFfcuA8IzFKMRKUg==
X-Received: by 2002:a05:6402:2b93:b0:568:a18:2eb3 with SMTP id fj19-20020a0564022b9300b005680a182eb3mr14129340edb.11.1710942729224;
        Wed, 20 Mar 2024 06:52:09 -0700 (PDT)
Message-ID: <961ffe23-a903-4da0-bc30-8918785101ef@suse.com>
Date: Wed, 20 Mar 2024 14:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] xen/trace: Update final {__,}trace_var() users to the
 new API
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240318163552.3808695-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 17:35, Andrew Cooper wrote:
> This logically drops the cycles parameter, as it's now encoded directly in the
> event code.

That encoding is an internal detail of the new API; for the purposes of the
callers the pattern looks to be that ...

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -67,7 +67,7 @@ static void hvmtrace_io_assist(const ioreq_t *p)
>          size *= 2;
>      }
>  
> -    trace_var(event, 0/*!cycles*/, size, buffer);
> +    trace(event, size, buffer);

... the respective parameter being 0 translates to trace(), while ...

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -135,7 +135,7 @@ static void _trace_irq_mask(uint32_t event, int irq, int vector,
>  
>      memcpy(d.mask, mask,
>             min(sizeof(d.mask), BITS_TO_LONGS(nr_cpu_ids) * sizeof(long)));
> -    trace_var(event, 1, sizeof(d), &d);
> +    trace_time(event, sizeof(d), &d);

... the parameter being 1 translates to trace_time(). Imo the description
would better express it that way. Irrespective, assuming that pattern is
what is meant to hold,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

