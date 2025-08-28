Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F13B39AB0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098341.1452415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraEd-00052C-Vk; Thu, 28 Aug 2025 10:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098341.1452415; Thu, 28 Aug 2025 10:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraEd-00050D-S0; Thu, 28 Aug 2025 10:52:03 +0000
Received: by outflank-mailman (input) for mailman id 1098341;
 Thu, 28 Aug 2025 10:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uraEc-0004fh-Lk
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:52:02 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 067bbb5d-83fd-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 12:52:00 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso137073266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 03:52:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe90c8f85fsm722647266b.8.2025.08.28.03.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 03:51:59 -0700 (PDT)
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
X-Inumbo-ID: 067bbb5d-83fd-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756378320; x=1756983120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KeWcAesFxLhz0BEXlg3cbbcQKqFYzdCTHZlccJodaT8=;
        b=a3H9i+tEW2OPFn26M04gHIoqoCtXaczpPV0Zz3RQ6eTKYQpPvl27hcbZmIWpmrnhQ+
         zvetXp8jKuuEYwqjRQ+2IJo2AX6TSBfq1Ghnf0KuO9dIJXdou3kQAwd0rX1Ht/nOiSOr
         W+cOVCVxzZ5i+pxe/hpMxIE4VAGdA/fHN7Xd6mdE5SZDpBb/k4ZbuVK52kuBTsT+9OzW
         NlT7eel7w/5PZY1Q5Ee8iGe1tgSfmRAoEecbpYO8te5mm5Imu1yD3JkdmpQpcFHa6Mzy
         z1w2A50q6nY3iKHxs0lHtfzg5VjzkbIdccsnXKrsYceTSI0A7q7lpgGCLenA4eyAWjog
         qZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756378320; x=1756983120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeWcAesFxLhz0BEXlg3cbbcQKqFYzdCTHZlccJodaT8=;
        b=pmJbJOGtsySE5fr5PYzKkqOP2eOjnHisfLtJM/21clcnWdcCh3l+Bdbr5iVMUyik3f
         RTsgImne1N62D3casdJ8rEPm0mOGro7G7JJpgzNA465vneHuUuE/7dBjfZVJOcI+pP5x
         jw9MtrpBe60fx2ierXKEGFSiVOGnTJ19NiX4LcTXVvGX4TPcmNA/iYFRfmucSTZCWoSF
         tsNsDD7Ae9MR2gWztKsnyPvo2naU1YDo9FxQJJonE1wgoMawNFnvRw0wPcdoOpJHPGRt
         TR5Uu84wpBKYKITeMpFfdLcirlB2NQMM+2U5IMzKnIStvg/XTHIjElYWfYQWkb9cJhi+
         toPg==
X-Forwarded-Encrypted: i=1; AJvYcCUJT/jE50SDZbdj1gbSPT1SlDSySm0M4gw0qypsRAXmg1KIMz+p+rlSsns/oqMmo539cUjn1sZrhtA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIEnEg6prBirgSwekqTvfFXjpoSOaO9JvbacEZgwl8jLBvT/UC
	JdjD4zHNaxwOHSzt3WpqZwdhg+1KHw42xvn1uk82RjZI7iPEqhqtAqQFiD2yMVzq6A==
X-Gm-Gg: ASbGncvjCq7Z5/jOi5WXPAGqXTqfnTIaBeiGC2LaDS4cgOUL1/6KCbO0uYV1EZT13Rz
	H2FPzufArPBR/BcuRdwGb4gln5sroYyZndYa0juP/lNO6nEwQ9GGglwWbNs7K7b3CLz57ablqzU
	4USeqO/S2lgWOEkgRyeKGcbJhFb9R+HiF40YxbqvEJ36uKd26ON3zpVm84BhiukyWHeZf2++kyE
	RnUgSdZQ2kCUlaxtXIoM75/inKn5lWhtM1Bf9O4PbajagutVqNX1mp7aeStja21KJltNLNCmVVz
	ydOixnOKEWE/Njulem5sN6QY8YYhBiHVfIY8DWdlYP5z1/Ra3Me1hXSZeRdXvNHrMsruMfnInhM
	vj1oMAxmC2xLPoBa5go1xbsUywOKLwvLQ6+FHsBYCV8x3X8kLbT5NHuDx6L7iCkd5/r33fruULG
	5QLPrD4E4=
X-Google-Smtp-Source: AGHT+IErYtjBzS3Vdo7NSSFjcHlzjNDmXdUMuGDNkS9dc3gyA9OE64/lln18l1tn3+dThnsmkvW9dQ==
X-Received: by 2002:a17:906:7308:b0:afe:e1e3:36a2 with SMTP id a640c23a62f3a-afee1e33b4cmr228329466b.31.1756378320242;
        Thu, 28 Aug 2025 03:52:00 -0700 (PDT)
Message-ID: <c3d5b257-e9fc-476b-a025-67b2f7e70c9e@suse.com>
Date: Thu, 28 Aug 2025 12:51:58 +0200
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
> In order to provide backward compatibility with existing governors
> that represent performance as frequency, like ondemand, the _CPC
> table can optionally provide processor frequency range values, Lowest
> frequency and Nominal frequency, to let OS use Lowest Frequency/
> Performance and Nominal Frequency/Performance as anchor points to
> create linear mapping of CPPC performance to CPU frequency.
> 
> As Xen is uncapable of parsing the ACPI dynamic table, we'd like to
> introduce a new sub-hypercall "XEN_PM_CPPC" to propagate required CPPC
> data from dom0 kernel to Xen.
> In the according handler set_cppc_pminfo(), we do _CPC and _PSD
> sanitization check, as both _PSD and _CPC info are necessary for correctly
> initializing cpufreq cores in CPPC mode.
> Users shall be warned that if we failed at this point,
> no fallback scheme, like legacy P-state could be switched to.
> 
> A new flag "XEN_CPPC_INIT" is also introduced for cpufreq core initialised in
> CPPC mode. Then all .init flag checking shall be updated to
> consider "XEN_CPPC_INIT" too.
> 
> We want to bypass construction of px statistic info in cpufreq_statistic_init()
> for CPPC mode, while not bypassing cpufreq_statistic_lock initialization for a
> good reason. The same check is unnecessary for cpufreq_statistic_exit(),
> since it has already been covered by px statistic variable
> "cpufreq_statistic_data" check
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with two cosmetic issues taken care of (which I'll do while committing):

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
> +    struct processor_pminfo *pm_info;
> +
> +    cpuid = get_cpu_id(acpi_id);
> +    if ( cpuid < 0 )
> +    {
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +
> +    if ( cppc_data->pad[0] || cppc_data->pad[1] || cppc_data->pad[2] )
> +    {
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +
> +    if ( cpufreq_verbose )
> +        printk("Set CPU%d (ACPI ID %u) CPPC state info:\n",
> +               cpuid, acpi_id);
> +
> +    pm_info = processor_pminfo[cpuid];
> +    if ( !pm_info )
> +    {
> +        pm_info = xvzalloc(struct processor_pminfo);
> +        if ( !pm_info )
> +        {
> +            ret = -ENOMEM;
> +            goto out;
> +        }
> +        processor_pminfo[cpuid] = pm_info;
> +    }
> +    pm_info->acpi_id = acpi_id;
> +    pm_info->id = cpuid;
> +    pm_info->cppc_data = *cppc_data;
> +
> +    if ( (cppc_data->flags & XEN_CPPC_PSD) &&
> +          !check_psd_pminfo(cppc_data->shared_type) )

Nit: Indentation is off by 1.

> +    {
> +            ret = -EINVAL;
> +            goto out;

Indentation is still wrong here.

Jan

