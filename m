Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E9AB39DC0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098728.1452715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urc5D-0003pH-0O; Thu, 28 Aug 2025 12:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098728.1452715; Thu, 28 Aug 2025 12:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urc5C-0003nT-Tl; Thu, 28 Aug 2025 12:50:26 +0000
Received: by outflank-mailman (input) for mailman id 1098728;
 Thu, 28 Aug 2025 12:50:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urc5B-0003nN-6N
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:50:25 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8faaa2d6-840d-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 14:50:22 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6188b72b7caso938058a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:50:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afef701f173sm34772766b.16.2025.08.28.05.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:50:22 -0700 (PDT)
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
X-Inumbo-ID: 8faaa2d6-840d-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756385422; x=1756990222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KzNP+ayyNRAdeVR3KvAYoBn1/S6xf/6spDFJZf4N3Vg=;
        b=I8GnTfGOijhQHaOVSKG9V5R2vSz5QKVLfhsr8I9Qcwlix+X1cw7P8U2f7Fo/YS7FDx
         22q03f4wEQQ3byPnrM59DW8r/wz9mksYPk4I6Ztom/WGjzdMk0XzPzB8UjZ1u9mJHRko
         BCdMwBnuFy/lGa5Im9V2IFKiKD4h9aBoeXmH9wq2HkcVwGdS/2JK04KEDYmb4GEw3JkO
         5cwaSzebVijSALKwjAkexMHasvhTjswS//DndDUBehZ7LDZUC96PVKrxpjnaKtb+Fgkg
         okcTXOfY2yxBonkljPIKFqTWoEMYvQW+ys+y1WCNdoUsUwemr2lvS1YMYoCmV5nkmbCV
         0ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385422; x=1756990222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzNP+ayyNRAdeVR3KvAYoBn1/S6xf/6spDFJZf4N3Vg=;
        b=e26+ZkMXTh+lv2pGVLWJ09Ky9wiFGxL/QZV7fvlYHB1wMtwpJOGx6FcJIEA9dU3nkY
         NmdkmJpmIOT7JjBayjk5fwmHWQKtH2IXmYiXgVWDw+md+2UVFwSjKNf1byyzUp2vXz6y
         UcCPZ+FNAEz1D+ECbdTP9elcwciRkF974Rp95+pZq0vPWXRhpCusI3Un4Fwl0zqoIfcQ
         hfuxlqxdPkJClT5gdz8JenjtLfsTNE/cLozYBBVWIlEVfQnDELgxPgLg2MqweyXI+e/K
         8Qnf2nBW2/DdPbnngMvcBQm9OuJAdlYKeTDFmFUQ7Qp9vMVz/EKaud4Z6Soi+rPJB7It
         6Hzw==
X-Forwarded-Encrypted: i=1; AJvYcCUYOlCl0y//4cOyaU7h7eENjSDyFx9PILMPyueBUV+Cw2hXFxzjLSMlfPz2VRubr8aPKoawZNb5Lww=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHkN0tOGsGZmwWa0s0SVOhowqIZmdd6YK7uM2ut+vM7SQGgnTb
	J9L19bYKiorBfXFEnwlmOYNcmyFucZ+JiUMmkRWUIpGYsRPaffROAZh3rVPtVPv97A==
X-Gm-Gg: ASbGncvKm5ExQNlIsaIzpGPYARROkWJJ+H1YVZpXH/PP1hmO6+VzRWfsaZDQkr/cPmY
	fVva30n0wb4PiYkRKMKm4DqqCCqw8olRsuiooFk0aLYyw05wIugK9geb+48gQLxBTFfKxUwPT7r
	VlXm5NBLfoVarBh3ykSlsrfi/eqDmA6+xlPiogdiYM6l6vwdYcuN74DklGxefJlOXdAIHiWJNvN
	f0vY5BSyPeV88/OxdhHS6MuHKsjoISV/PzHCo5Q9InbZWovyvPLNxIQ76ksV1akm7SUlpG7GnGf
	G0dVYy6Y8Rgx8hJtHFby/c09zcZPftV+xbiC5KMLu0+8I5nbQYZRKvWHVzOOQA/Vu4ZW4kiokXY
	OZTszAPTtcVOj58TkVyMpDbEtMw6NGJnxQQPERHFiJWIQzzJIOyWyRB7wCbG7bKLjxR8RQ77r8K
	eepFgUQNc7UpccXFztXw==
X-Google-Smtp-Source: AGHT+IHf7WXzdBVxWf60pg65hh/irVJV2Vh8fcfvXbcvaxUG6hCCf9zTLjRXKXWNnzpDPLfS1hqncg==
X-Received: by 2002:a17:907:c1f:b0:afe:e0f2:759 with SMTP id a640c23a62f3a-afee0f208f8mr253603066b.38.1756385422329;
        Thu, 28 Aug 2025 05:50:22 -0700 (PDT)
Message-ID: <00e4af60-6916-4a71-b797-757c1163579a@suse.com>
Date: Thu, 28 Aug 2025 14:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/8] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
 <20250828100306.1776031-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250828100306.1776031-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 12:02, Penny Zheng wrote:
> @@ -693,6 +699,120 @@ int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
>      return ret;
>  }
>  
> +static void print_CPPC(const struct xen_processor_cppc *cppc_data)
> +{
> +    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
> +           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
> +           "nominal_mhz=%uMHz, lowest_mhz=%uMHz\n",
> +           cppc_data->cpc.highest_perf, cppc_data->cpc.lowest_perf,
> +           cppc_data->cpc.nominal_perf, cppc_data->cpc.lowest_nonlinear_perf,
> +           cppc_data->cpc.nominal_mhz, cppc_data->cpc.lowest_mhz);
> +}
> +
> +int set_cppc_pminfo(unsigned int acpi_id,
> +                    const struct xen_processor_cppc *cppc_data)
> +{
> +    int ret = 0, cpuid;

Eclair doesn't like this:

Reports for service MC3A2.R5.3

service MC3A2.R5.3: (required) An identifier declared in an inner scope shall not hide an identifier declared in an outer scope (1 of 1 violation)

 violation for MC3A2.R5.3 untagged
xen/arch/x86/include/asm/processor.h:130.20-130.24:
non-compliant function `cpuid(unsigned, unsigned*, unsigned*, unsigned*, unsigned*)' (unit `xen/drivers/cpufreq/cpufreq.c' with target `xen/drivers/cpufreq/.cpufreq.o.tmp'): there is another identifier `cpuid'
xen/drivers/cpufreq/cpufreq.c:726.18-726.22:
non-compliant local variable `cpuid': there is another identifier `cpuid'

I'm fixing this up for you, but I have to admit that I'm getting tired of
doing such cleanups for supposedly-ready-to-commit patches.

Jan

