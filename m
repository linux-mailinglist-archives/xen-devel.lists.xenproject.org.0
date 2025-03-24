Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185BEA6DCF7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 15:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925688.1328562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twimy-0004c1-D7; Mon, 24 Mar 2025 14:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925688.1328562; Mon, 24 Mar 2025 14:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twimy-0004Zf-9y; Mon, 24 Mar 2025 14:28:28 +0000
Received: by outflank-mailman (input) for mailman id 925688;
 Mon, 24 Mar 2025 14:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twimx-0004ZZ-1m
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 14:28:27 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f2c0bd4-08bc-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 15:28:25 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so31989625e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 07:28:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd9eb21sm122482475e9.32.2025.03.24.07.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 07:28:24 -0700 (PDT)
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
X-Inumbo-ID: 3f2c0bd4-08bc-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742826505; x=1743431305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsazbfFqDm6VCsw6yYfOWEzzOhQuJJlYcLulmPBqH4k=;
        b=fODIr82fhGZ+UsA83gHSSaV+Xs/41Q1SVzSr4P+58Pp8/sHt/1s/+oopco+3e0VYAA
         cy7tbGI//QOp8ls5zLc6UocfjtN5ZApuMLM9gaHk76wnHubP8uK08143FO8LB2QoDZpS
         zHy1F1LZh5Ev9fwwoR5TbsAkT4vfl8T+8P942YpKzWKrPVBIXIOs7niOWepQz/f8o3qf
         Zn/4I4rNVp/mrFa6JjdNAz+60LpKyAnJBXDiFnNiHn6kC0p7SGD4gkLO1B9/76tqLB18
         9Sy0AWvc5yzMC0oSjlVYyj3HUzDg4ZMHD8my91jU32t/KSsSqHVqZJhUJ/MYHnQ1KCOi
         QfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742826505; x=1743431305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsazbfFqDm6VCsw6yYfOWEzzOhQuJJlYcLulmPBqH4k=;
        b=Vzr7p+Tm1ejAObxj2Sdck1YhVJGyen18z611MSZOTE0DEZRThonlsLmCkCLZMQPFk9
         NXKqE7B4mnjNVyGIPIx6WskJ7ip+mLWW3yioKibOgIsJ4Y6+wbrNmlKeBDWXMz0SLMKv
         GuyA2YbvUGAwUM6nv7dUHBydJjNPOw1F888vMh1IRNKYK69tkt56yZXie5RsnP6AdPnd
         i+DFFMFMKGWBIx/3xCYOdTxQ1Ri1ugyv/BcL0t2jF/cz31EIwChFRIX8kUXGuSx3lk4s
         9jV1Pdj2QLktiL2j4zqxroZ4+yH8NUxzJ+usI99xQfB4LSHWkNqWw0t0FnVHce9JHlZ3
         jZGg==
X-Forwarded-Encrypted: i=1; AJvYcCX12YqQCBe2mri+TTTKaIgaUQUbHOdWUXz3AXKEt1EfP8gw6qnCwTFEN0fer8CdfT/YEC4qeBAxTvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJNdrAUMG520VOSMq1t/FlZ1dnPAYgcQMA1vXi/xFOF8SkpTtI
	bsJuMzw3uizt7SQqHHcOSgVS4FS/lxZPtT5dtd6fab9SNHIYRGraVL5vg/E/Pg==
X-Gm-Gg: ASbGncsQ8CRkAcDwS+0YKn15BTcwlhe/HmlHT/1aYLM9lEm7aNpzE3aoDM/nzQjhQtL
	WuhSEUj26eCpzqtuLDOPso1HY5YUai4PWF5/0Xmz2iMqBl2r4hyv6Teye+9ln7LaAe4MEzlZImR
	yH7yNLjSckj6vS5e+a64m+GenTZrMC4W1GPY5YgnwtRTYGbFy1E0FVugrgWEGrDB6s/C/Fh4qP0
	3kDITilligxbGK4GK8IsBjGdBRL6X2VZ4Ho0lc/6MaZrJLz8F2N9XjqRNw6+Ndrvcwv8HHgfshj
	KFQqCzyFvYliTUcZ8B7lL6IqaP3ugy5rNHGhof5uBL7ys8Ev22T6M0RhKPGR0iTWhNoRc/ecwYI
	1W7UGLjSVDWQIwGYHXUFhPuRoCUr0r/6LzgpLGvZy
X-Google-Smtp-Source: AGHT+IFbZKbj1rsqKAp5BTFIXRV+pgpIk/SXlOOaRFb5aHcfUm/HWhde/sFyUv2Ye4AU7wvgcyJPww==
X-Received: by 2002:a05:600c:510f:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-43d509e3363mr113874255e9.3.1742826505010;
        Mon, 24 Mar 2025 07:28:25 -0700 (PDT)
Message-ID: <19cab53d-3edc-4900-95f1-6d5d81e0ecac@suse.com>
Date: Mon, 24 Mar 2025 15:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> In order to provide backward compatibility with existing governors
> that represent performance as frequencies, like ondemand, the _CPC
> table can optionally provide processor frequency range values, Lowest
> frequency and Norminal frequency, to let OS use Lowest Frequency/
> Performance and Nominal Frequency/Performance as anchor points to
> create linear mapping of CPPC abstract performance to CPU frequency.
> 
> As Xen is uncapable of parsing the ACPI dynamic table, this commit
> introduces a new sub-hypercall to propagate required CPPC data from
> dom0 kernel.

Nit: Here and ...

> If the platform supports CPPC, the _CPC object must exist under all
> processor objects. That is, Xen is not expected to support mixed mode
> (CPPC & legacy PSS, _PCT, _PPC) operation, either advanced CPPC, or legacy
> P-states.
> 
> This commit also introduces a new flag XEN_PM_CPPC to reflect processor
> initialised in CPPC mode.

... here and elsewhere: Please avoid "this commit", "this patch", or
anything alike in patch descriptions.

Apart from this I'm not sure how useful review here is going to be, as there
apparently is a dependency on the problematic aspect in patch 1. Therefore
I'll give only a few independent comments.

> @@ -606,6 +616,41 @@ int set_psd_pminfo(uint32_t acpi_id, uint32_t shared_type,
>      return ret;
>  }
>  
> +int set_cppc_pminfo(uint32_t acpi_id,
> +                    const struct xen_processor_cppc *cppc_data)
> +{
> +    int ret = 0, cpuid;
> +    struct processor_pminfo *pm_info;
> +
> +    cpuid = get_cpu_id(acpi_id);
> +    if ( cpuid < 0 || !cppc_data )
> +    {
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +    if ( cpufreq_verbose )
> +        printk("Set CPU acpi_id(%d) cpuid(%d) CPPC State info:\n",
> +               acpi_id, cpuid);

Nit: %d isn't appropriate for a variable/parameter of type uint32_t. In turn I
don't think the parameter needs to be of a fixed-width type; unsigned int will
be quite fine there, I expect. See ./CODING_STYLE.

> +    pm_info = processor_pminfo[cpuid];
> +    /* Must already allocated in set_psd_pminfo */
> +    if ( !pm_info )
> +    {
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +    pm_info->cppc_data = *cppc_data;
> +
> +    if ( cpufreq_verbose )
> +        print_CPPC(&pm_info->cppc_data);
> +
> +    pm_info->init = XEN_CPPC_INIT;

That is - whichever Dom0 invoked last will have data recorded, and the other
effectively is discarded? I think a warning (perhaps a one-time one) is minimally
needed to diagnose the case where one type of data replaces the other.

With this it also remains unclear to me how fallback to the legacy driver is
intended to be working. Both taken together are a strong suggestion that important
information on the model that is being implemented is missing from the description.

> @@ -27,8 +28,6 @@ struct processor_performance {
>      struct xen_pct_register status_register;
>      uint32_t state_count;
>      struct xen_processor_px *states;
> -
> -    uint32_t init;
>  };
>  
>  struct processor_pminfo {
> @@ -37,6 +36,9 @@ struct processor_pminfo {
>      struct xen_psd_package domain_info;
>      uint32_t shared_type;
>      struct processor_performance    perf;
> +    struct xen_processor_cppc cppc_data;
> +
> +    uint32_t init;
>  };

This moving of the "init" field and the mechanical changes coming with it
can likely be split out to a separate patch? Provided of course the movement
is still wanted/needed with patch 1 re-worked or dropped.

Jan

