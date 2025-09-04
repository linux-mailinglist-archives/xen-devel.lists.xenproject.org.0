Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD209B43AF9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 14:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109919.1459294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8hV-0002WO-J4; Thu, 04 Sep 2025 12:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109919.1459294; Thu, 04 Sep 2025 12:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8hV-0002TW-Fk; Thu, 04 Sep 2025 12:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1109919;
 Thu, 04 Sep 2025 12:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu8hT-0002TQ-Jm
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 12:04:23 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a5fa8eb-8987-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 14:04:21 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b043a33b060so148467466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 05:04:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046d420e02sm352793066b.39.2025.09.04.05.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 05:04:20 -0700 (PDT)
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
X-Inumbo-ID: 4a5fa8eb-8987-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756987461; x=1757592261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QXF2UONQ4ZIDiDV0wjlL23WDx+zGfbFqE9iBllcFLg4=;
        b=UEn5pxi8+eP8ifrFlRDeEBs1LU1oCt3zHobwj6fh/9YuwTDzE1K+QP1L9Q2TqRNmsf
         dHL5kmHAmN++A+yDMsYHTc/KcWBjfkW/qHbir2ffs0e0LTDL9hCGawZy0r3l3qDZ0jyD
         gvLYVYdl0jc9tkFfiWeV6uFgt+smfTrSDP83O4q9HdWak6Cxqi/XUblSmzSJ3INIR8i3
         YQZj2PbNp/ocrV1jlkECa06ectNupzNdXnZgaHgO0xPik0L1qSGQ5JBr3BwH4OxPZ5Nk
         Y5KBPcjZBCMCyGmRHp7VXsoAAlrX7kRJAk+/x+xBp+pc3NpFCXyNckRfBxDo12GfJXaZ
         vL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756987461; x=1757592261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXF2UONQ4ZIDiDV0wjlL23WDx+zGfbFqE9iBllcFLg4=;
        b=kMTvZ6wUuLtK42eDabna5ggV77SoBtPXa5ByFEtfaTSMLEJu+AIj9NaRa28lDdt/oX
         aeshWZ2jVmsKbvCpNQQhkbjHIA/EGqMe4b55Mmfv727ili7DC5qK7mjAWWDAJarkAgAw
         iFrAnRZ48P56xed767/XNmLxIF96Ju31K0EVXUBbWrTUYxY4QenDezq2ZGG7Au4zeCvC
         9MnT98Q39zv03OFK3nZIhCc32azBHPnF+Ki6fQkUwekykwkN4lMxJZx/eP0uwBAqIN94
         C6h6EUFXfDAnENURCEFR1gE5huvwj1dUDo4SzsS6m+avduRIEBtxNy0mXnloqE01LMLG
         H4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGyA5TsgxmP2FTrYqlUYPRWUCVsHdCOAqB9mehG/yG3n2fD2z1zRIS+ZWM2qqGduHZYNUVCMnyaOA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyA07NGNyvxEpAR7fU+RPk0oC5qcUH6xSOnzNb5jSrO3r6a+JuC
	YShCObMCNDykWWcCl7vybLZr/I/l00jQ6opfzipa9lf3QO4ybRi2I1FlU+HDNbJ5uA==
X-Gm-Gg: ASbGncu2EAL4GL1mYKdkWmHZCFjEJcGNCu4s1wgE0b5bzxEyzTUQ9gU+B1MEAMAtS3T
	hR4aIjbsCFkLu7hrFvx8G6n7DLXUkJSfhtuxDxucZnO13r0FV2Qnsfh7XKoaZ+tJzGXJvwWO6Aj
	4TSHKnyouHyG9CUlz+WNw3O9ChXNJhHAVSwqX9YesuO5UtrO8jMEG2QpQgTn+6LGcyRn3dHL7h9
	UihjYBwZTsqpxb3e7VzNqThvQonPOyDJCbdbrYPc7fl8E/YTPvK2MiI9IfNoMsRxLls5FbglinP
	8YyZVwmfvPsOWvLZEBGhECtXo5t39axWgBZhwmfEQZnAIeBfYAL+FHffJQ2DAzAJqzWn4GwKDtD
	v2xjmtN5RtxvytTmiUtZCQ/1tkb55bzJbYsL6KCPH4oAebNBIsrf2VUUAmwAJAvZtMb/nkrHHqg
	ojt2MHzYG4HGhS3gL/Y1UHIgtM1pGG
X-Google-Smtp-Source: AGHT+IE9vR2mOufoW5dEWF5p7stxol9hpASE4+Ky+04nHLfeIPOginWYpLh05m7KeVuBDJpaiAFZpg==
X-Received: by 2002:a17:907:3e11:b0:b04:65b4:711 with SMTP id a640c23a62f3a-b0465b40a87mr715730166b.57.1756987460553;
        Thu, 04 Sep 2025 05:04:20 -0700 (PDT)
Message-ID: <7e769952-a906-4a3e-af27-26faa76f6dd4@suse.com>
Date: Thu, 4 Sep 2025 14:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250904063518.2097629-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2025 08:35, Penny Zheng wrote:
> amd-cppc is the AMD CPU performance scaling driver that introduces a
> new CPU frequency control mechanism. The new mechanism is based on
> Collaborative Processor Performance Control (CPPC) which is a finer grain
> frequency management than legacy ACPI hardware P-States.
> Current AMD CPU platforms are using the ACPI P-states driver to
> manage CPU frequency and clocks with switching only in 3 P-states, while the
> new amd-cppc allows a more flexible, low-latency interface for Xen
> to directly communicate the performance hints to hardware.
> 
> "amd-cppc" driver is responsible for implementing CPPC in passive mode, which
> still leverages Xen governors such as *ondemand*, *performance*, etc, to
> calculate the performance hints. In the future, we will introduce an advanced
> active mode to enable autonomous performence level selection.
> 
> Field epp, energy performance preference, which only has meaning when active
> mode is enabled and will be introduced later in details, so we read
> pre-defined BIOS value for it in passive mode.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

With the issue I had pointed out, leading to ...

> ---
> v8 -> v9
> - embed struct amd_cppc_drv_data{} into struct cpufreq_policy{}

... this change, I think the tag would have needed to be dropped.

> +static void cf_check amd_cppc_write_request_msrs(void *info)
> +{
> +    const struct amd_cppc_drv_data *data = info;
> +
> +    wrmsrl(MSR_AMD_CPPC_REQ, data->req.raw);
> +}
> +
> +static void amd_cppc_write_request(unsigned int cpu,
> +                                   struct amd_cppc_drv_data *data,
> +                                   uint8_t min_perf, uint8_t des_perf,
> +                                   uint8_t max_perf, uint8_t epp)
> +{
> +    uint64_t prev = data->req.raw;
> +
> +    data->req.min_perf = min_perf;
> +    data->req.max_perf = max_perf;
> +    data->req.des_perf = des_perf;
> +    data->req.epp = epp;
> +
> +    if ( prev == data->req.raw )
> +        return;
> +
> +    on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);

With "cpu" coming from ...

> +}
> +
> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
> +                                            unsigned int target_freq,
> +                                            unsigned int relation)
> +{
> +    struct amd_cppc_drv_data *data = policy->u.amd_cppc;
> +    uint8_t des_perf;
> +    int res;
> +
> +    if ( unlikely(!target_freq) )
> +        return 0;
> +
> +    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
> +    if ( res )
> +        return res;
> +
> +    /*
> +     * Having a performance level lower than the lowest nonlinear
> +     * performance level, such as, lowest_perf <= perf <= lowest_nonliner_perf,
> +     * may actually cause an efficiency penalty, So when deciding the min_perf
> +     * value, we prefer lowest nonlinear performance over lowest performance.
> +     */
> +    amd_cppc_write_request(policy->cpu, data, data->caps.lowest_nonlinear_perf,

... here, how can this work when this particular CPU isn't online anymore?

> +                           des_perf, data->caps.highest_perf,
> +                           /* Pre-defined BIOS value for passive mode */
> +                           per_cpu(epp_init, policy->cpu));
> +    return 0;
> +}
> +
> +static void cf_check amd_cppc_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct amd_cppc_drv_data *data = policy->u.amd_cppc;
> +    uint64_t val;
> +    unsigned int min_freq = 0, nominal_freq = 0, max_freq;
> +
> +    /* Package level MSR */
> +    rdmsrl(MSR_AMD_CPPC_ENABLE, val);

Here you clarify the scope, yet what about ...

> +    /*
> +     * Only when Enable bit is on, the hardware will calculate the processor’s
> +     * performance capabilities and initialize the performance level fields in
> +     * the CPPC capability registers.
> +     */
> +    if ( !(val & AMD_CPPC_ENABLE) )
> +    {
> +        val |= AMD_CPPC_ENABLE;
> +        wrmsrl(MSR_AMD_CPPC_ENABLE, val);
> +    }
> +
> +    rdmsrl(MSR_AMD_CPPC_CAP1, data->caps.raw);

... this and ...

> +    if ( data->caps.highest_perf == 0 || data->caps.lowest_perf == 0 ||
> +         data->caps.nominal_perf == 0 || data->caps.lowest_nonlinear_perf == 0 ||
> +         data->caps.lowest_perf > data->caps.lowest_nonlinear_perf ||
> +         data->caps.lowest_nonlinear_perf > data->caps.nominal_perf ||
> +         data->caps.nominal_perf > data->caps.highest_perf )
> +    {
> +        amd_cppc_err(policy->cpu,
> +                     "Out of range values: highest(%u), lowest(%u), nominal(%u), lowest_nonlinear(%u)\n",
> +                     data->caps.highest_perf, data->caps.lowest_perf,
> +                     data->caps.nominal_perf, data->caps.lowest_nonlinear_perf);
> +        goto err;
> +    }
> +
> +    amd_process_freq(&cpu_data[policy->cpu],
> +                     NULL, NULL, &this_cpu(pxfreq_mhz));
> +
> +    data->err = amd_get_cpc_freq(data, data->cppc_data->cpc.lowest_mhz,
> +                                 data->caps.lowest_perf, &min_freq);
> +    if ( data->err )
> +        return;
> +
> +    data->err = amd_get_cpc_freq(data, data->cppc_data->cpc.nominal_mhz,
> +                                 data->caps.nominal_perf, &nominal_freq);
> +    if ( data->err )
> +        return;
> +
> +    data->err = amd_get_max_freq(data, &max_freq);
> +    if ( data->err )
> +        return;
> +
> +    if ( min_freq > nominal_freq || nominal_freq > max_freq )
> +    {
> +        amd_cppc_err(policy->cpu,
> +                     "min(%u), or max(%u), or nominal(%u) freq value is incorrect\n",
> +                     min_freq, max_freq, nominal_freq);
> +        goto err;
> +    }
> +
> +    policy->min = min_freq;
> +    policy->max = max_freq;
> +
> +    policy->cpuinfo.min_freq = min_freq;
> +    policy->cpuinfo.max_freq = max_freq;
> +    policy->cpuinfo.perf_freq = nominal_freq;
> +    /*
> +     * Set after policy->cpuinfo.perf_freq, as we are taking
> +     * APERF/MPERF average frequency as current frequency.
> +     */
> +    policy->cur = cpufreq_driver_getavg(policy->cpu, GOV_GETAVG);
> +
> +    /* Store pre-defined BIOS value for passive mode */
> +    rdmsrl(MSR_AMD_CPPC_REQ, val);

... this?

> +static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_cppc_drv_data *data;
> +
> +    data = xvzalloc(struct amd_cppc_drv_data);
> +    if ( !data )
> +        return -ENOMEM;
> +    policy->u.amd_cppc = data;
> +
> +    data->cppc_data = &processor_pminfo[cpu]->cppc_data;
> +
> +    on_selected_cpus(cpumask_of(cpu), amd_cppc_init_msrs, policy, 1);
> +
> +    /*
> +     * The enable bit is sticky, as we need to enable it at the very first
> +     * begining, before CPPC capability values sanity check.
> +     * If error path is taken effective, not only amd-cppc cpufreq core fails
> +     * to initialize, but also we could not fall back to legacy P-states
> +     * driver, irrespective of the command line specifying a fallback option.
> +     */
> +    if ( data->err )
> +    {
> +        amd_cppc_err(cpu, "Could not initialize cpufreq core in CPPC mode\n");
> +        amd_cppc_cpufreq_cpu_exit(policy);
> +        return data->err;

amd_cppc_cpufreq_cpu_exit() has already freed what data points to.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -63,6 +63,7 @@ struct perf_limits {
>  };
>  
>  struct hwp_drv_data;
> +struct amd_cppc_drv_data;
>  struct cpufreq_policy {
>      cpumask_var_t       cpus;          /* affected CPUs */
>      unsigned int        shared_type;   /* ANY or ALL affected CPUs
> @@ -85,6 +86,9 @@ struct cpufreq_policy {
>      union {
>  #ifdef CONFIG_INTEL
>          struct hwp_drv_data *hwp; /* Driver data for Intel HWP */
> +#endif
> +#ifdef CONFIG_AMD
> +        struct amd_cppc_drv_data *amd_cppc; /* Driver data for AMD CPPC */
>  #endif
>      } u;
>  };

Same comments here as for the HWP patch.

Jan

