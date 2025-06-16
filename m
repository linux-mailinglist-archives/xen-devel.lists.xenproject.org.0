Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12964ADB662
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 18:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017480.1394470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCSe-0003q8-Ot; Mon, 16 Jun 2025 16:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017480.1394470; Mon, 16 Jun 2025 16:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCSe-0003nb-Lb; Mon, 16 Jun 2025 16:13:28 +0000
Received: by outflank-mailman (input) for mailman id 1017480;
 Mon, 16 Jun 2025 16:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRCSd-0003nV-Ag
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 16:13:27 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5529c92-4acc-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 18:13:26 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4824107f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 09:13:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea7db9sm63270755ad.144.2025.06.16.09.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 09:13:25 -0700 (PDT)
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
X-Inumbo-ID: d5529c92-4acc-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750090406; x=1750695206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AT51K1kyBLdfvjQr1IzBZ+xONHOeI1IdmdICRpv83DE=;
        b=T3GGJG7t4CIwj2HbZNiwnoWC2iHnKYqHF2I7zDonTbuzr81E1bi50TPHezm1pujfWp
         j31vEj7Af7NXoSdQ73acUpc2ZT6snsPN/D3z89OqTk6Oq5hOegCUCogbyFj/TtxgSWDu
         8T29+TKZyAA5p76rS+cP4acUQssAlYyAhSjauQ8mQbaJbfVU6AyRKwrIrMLFtA07H7jV
         jbTyIJKrLPYb0o7g2ewvYyUAVGEP/Z3M2MfDdrf+bBim5VEpX87+MpSyAliSUAUsiFhw
         YPfsaxefVelOPHAzoQjAK+8ixRTm1MqQs3LshpZahQXF0hNgJNXXnCv6F6FIdgkvttfx
         obOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090406; x=1750695206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT51K1kyBLdfvjQr1IzBZ+xONHOeI1IdmdICRpv83DE=;
        b=hXg963hODj1yHvMnqSVkQMdSDl63aHx3vfkwcnzXbddjQt9RI+EbH8q//ijKa/e9JY
         RoWc7M+gZ0c5FdL2DgYw8USNmlbDUtdjTmbpTr+kRFKpN2DGS5GmXxDDYv6bAHyDi2Yg
         7P/GJtlBKY7pqMbFAI2CZC6SrgA4a83JmRd9iwV/Zd9F7j+hLZoJueNL4qxLvzF/8ig4
         T2kLfmGFWctfTjIdb7VfnKaLh1+JKGKXkBurT6R8ltwYe95DordIGc0VYnHs26V9pUw0
         KoFd5iPhJp1t0fVAoRqn+1KV2AV5RGd4EnN34SJQO19MeAsbNZhrQz/jk9fBOQl+BGDM
         fqug==
X-Forwarded-Encrypted: i=1; AJvYcCWH1hPMsM6E2Oq9YC+gsX+XwtJuL8Pt+O5JFeY4QIVQz6OkVHP5R0n3rKPTvvbXFd/lIKJ2HLIEWW8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdrTHF4KvgQjRT+LgoMHokL2zugi/Y5SzhWthSiBnr+beR6obJ
	HfY+kYRGBEO2TzqoJbhvQ+S0QHgisSqR+6x1c3xsTMl0zXgVLvPGBunCgSSxKSAiCg==
X-Gm-Gg: ASbGncvVXnioRfQfDwJFcLUEmOJ6XPQA/6/orTX9qzygn2vQWZtglGYLCYWXBfyDP3L
	WGHjfzIfodoDNCK5+/pn1jRLYpO4f8rIBb3YCiw2xijVjFoR1Fs16zC/KGEqiEbIRRBgUAX5gq5
	R/Vo5+NinHmMoff/Rm0780Ctxw8lkR5+is5C0/oW58L5FvyHO92QGoB2CWO23sHXx9nFYV2/Y/1
	1vXcmBpkjnZWM/A6Q5kV+wD+UK65BcNFRNvABMoCPYjIuGL/C9X6+bfLKi2sbh46PcBCnpY4NxD
	CHHO0eCzwykWnYOGxwWKapN+e7DMazGtawiITFHbZZo0mllYam8nZYG5oRX4NZ9LTrz6Hctet8g
	h3gYPjWo9h6ZqoXKd7oF/oY2QxX4c3k2cSIji6/zZkpPNMfaSFAXjJw7Uow==
X-Google-Smtp-Source: AGHT+IECM5JbJHOEvARDYqQudLpqHeJ5FkvDyxpxWr+fKcS9dglKfkigvj2PJ/j7ZCKHH0kAeMBcbw==
X-Received: by 2002:a05:6000:71a:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3a572e2df96mr7586058f8f.48.1750090405604;
        Mon, 16 Jun 2025 09:13:25 -0700 (PDT)
Message-ID: <a1a7bbe6-eb9e-4396-b4dd-b672905fdd93@suse.com>
Date: Mon, 16 Jun 2025 18:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/18] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-12-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-12-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> @@ -537,6 +537,14 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>  * `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
>    on supported AMD hardware to provide finer grained frequency control
>    mechanism. The default is disabled.
> +* `active` is a boolean to enable amd-cppc driver in active(autonomous) mode.
> +  In this mode, users could write to energy performance preference
> +  register(epp) to tell hardware if they want to bias toward performance or
> +  energy efficiency.

Who or what is "users" here? Certainly not the person reading the doc, trying
to determine whether to use this command line sub-option. That person can't
write to the EPP register. (Or really they maybe can, but they shouldn't.)
It's the driver which is supposed to be carrying out such writes, isn't it?

> +static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
> +{
> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
> +                                                   policy->cpu);
> +    uint8_t max_perf, min_perf, epp;
> +
> +    /*
> +     * min_perf represents the idle frequency, while max_perf represents
> +     * the maximum frequency
> +     */
> +    max_perf = data->caps.highest_perf;
> +    min_perf = data->caps.lowest_perf;
> +
> +    /*
> +     * We set min_perf with highest_perf in performance mode
> +     * and max_perf with lowest_perf in powersave mode, to achieve
> +     * ultmost performance and power savings.
> +     */
> +    switch ( policy->policy )
> +    {
> +    case CPUFREQ_POLICY_PERFORMANCE:
> +        /* Force the epp value to be zero for performance policy */
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        min_perf = data->caps.highest_perf;
> +        break;
> +    case CPUFREQ_POLICY_POWERSAVE:
> +        /* Force the epp value to be 0xff for powersave policy */
> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +        max_perf = data->caps.lowest_perf;
> +        break;
> +    default:
> +        epp = per_cpu(epp_init, policy->cpu);
> +        break;
> +    }

Blank lines please between non-fall-through case blocks.

Jan

