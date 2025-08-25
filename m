Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0573AB34584
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093403.1448918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYzA-0004YN-Ug; Mon, 25 Aug 2025 15:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093403.1448918; Mon, 25 Aug 2025 15:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYzA-0004VK-Rv; Mon, 25 Aug 2025 15:19:52 +0000
Received: by outflank-mailman (input) for mailman id 1093403;
 Mon, 25 Aug 2025 15:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqYz9-0004VE-D1
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:19:51 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id effd5f4a-81c6-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 17:19:48 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so719096866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:19:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe92b3dc53sm79672266b.3.2025.08.25.08.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:19:47 -0700 (PDT)
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
X-Inumbo-ID: effd5f4a-81c6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756135187; x=1756739987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YO829Vn1s4qSmitLj09kO/AyZb/4ej+AO7PNoakxPig=;
        b=VXNeruVNwgoa5iPQjQwDfisRF/FmGIgPMC1mzRY92LCNL+sE8LhKuiXFDOJLYMgfzy
         lV0tu8vnYK4+GYgMOoQViCvXklUkW0tIKOBdGpEeDbLpeXS7iUTeDE0nBKoOqeCcoTbX
         OzPjonxga/Zzhu3fwjZgBEliFa9IeWU/59X6XJvoVnZ0EPsEAXSbc/GfS38uyFtoUz5b
         x24UBiPLQuyDeuCFMRd0FRv6N0QwR393lVIyLXhlG+Ldka/22Ga6xAkvUpv4FuFehFF4
         k3tAeRHm2gvqxik+BRt1liUs+yJ2WllHZxGy1O6gIhXgu6glwEYPFB6Hs1bNbRMuh0cw
         kk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756135187; x=1756739987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO829Vn1s4qSmitLj09kO/AyZb/4ej+AO7PNoakxPig=;
        b=orx/27cyjYy9oIWzidGhhWIt2O1ztU8U9GLk5K6fFIbUCtsyJ++hLlAK6eyRuFR/4l
         Wg0kqgpCXd8lo5wwPTI4yF9oWZQLl7yMwlRz66wByYt2Ni24z7xwyHt4W9Fpnx5zOgeR
         qj8kaDLP97Wd1s4ibuVGHbDjukXsGmNRsU+/6NUszKEs2dH81JDxuMppHBJ0VZf+q0Xp
         sHlxEG6NT/zWiQYxpp0BQNfVpDanmMF5dPEGXjdUHPD1Ci2oyXBGBX7HocsNXeixYG2L
         QPxPZ1MappWL5ec3Z+kuyIWQTNz93w7WztEh2Npi05eHXI4kAPmExWmTLXIylHyuNwex
         YWAA==
X-Forwarded-Encrypted: i=1; AJvYcCX//2o5Ihv1tohSVqJNd8WrWby/ezR0HHAGbojKASvDW2lIBTcuhGl0k17R7CL5744YmpGG9YRTquk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuRsnsz7+qjrEwjMbiW7dTxzAZaqQsgGdx0TV+2C7zmPQXXn/p
	qGH1mpjzgm3V+S8rcpSVdYdZB0ZHsJE0XILHbR1So8/31TlPRpDlYNOJ20F1ei51uQ==
X-Gm-Gg: ASbGnctREAsudDh8f6qQODNOZgP5+n3v72Wwdj7a+9PSfhYIaLSDLmUIlZCIC69bNE7
	uUgzIqn3prWQVrTsoblZBAkaHYIgTTuNJDhik4pVON2NqCP9fr0ugrOALcwDyf0JC5KlpRdQlG8
	F//Wf4qut8nBEDvn+PNkQVXAH8EL6x3AplorEtsTBzJhMEsEVZRENDBRCIQwxKq/cYtru0YPFsx
	BeFBQbjtBlzyw4MJbqrZP55Z1wa9eqtbWlLYNl7mGTPTONUouNRAtjCryth79OmQbAdjvdA53G2
	LsV5+q+Skozn4rKLSjOC02jvITsbJ9BAybedthmmqHzU6Mh21hok1S/15nzLuS/ZvfgBn5UlfGD
	+HQvykwrhMy2mfvvZhh6S+fXIM/c2dSaNov2uDs7py1hD+4CMd7+cvd0I5jNBRYS/I6NjN+4BRa
	4TBaJqKX0=
X-Google-Smtp-Source: AGHT+IFagFXrYDHwjg6LkrZzaV2c6wJZbX45MZRyP16R1sOrLoTg7WDNRGu7bk3VIrf3819vEcqTWg==
X-Received: by 2002:a17:907:980b:b0:af8:fa64:917f with SMTP id a640c23a62f3a-afe29600152mr1117100966b.48.1756135187355;
        Mon, 25 Aug 2025 08:19:47 -0700 (PDT)
Message-ID: <525d61cf-2510-4990-b575-93e1f77315f0@suse.com>
Date: Mon, 25 Aug 2025 17:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/13] xen/cpufreq: implement amd-cppc-epp driver for
 CPPC in active mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> @@ -270,6 +288,10 @@ static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
>  
>      data->req.min_perf = min_perf;
>      data->req.max_perf = max_perf;
> +#ifndef NDEBUG
> +    if ( opt_active_mode )
> +        ASSERT(!des_perf);
> +#endif

Simply

    ASSERT(!opt_active_mode || !des_perf);

(without any #ifndef)? Then once again:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

