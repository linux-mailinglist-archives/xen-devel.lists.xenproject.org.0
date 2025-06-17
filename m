Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE39ADC88B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 12:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018097.1395017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTjN-00086k-2C; Tue, 17 Jun 2025 10:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018097.1395017; Tue, 17 Jun 2025 10:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTjM-00085J-VR; Tue, 17 Jun 2025 10:39:52 +0000
Received: by outflank-mailman (input) for mailman id 1018097;
 Tue, 17 Jun 2025 10:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRTjL-000859-NG
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 10:39:51 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65abccca-4b67-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 12:39:51 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso5373908f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 03:39:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31421af1575sm2302169a91.39.2025.06.17.03.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 03:39:49 -0700 (PDT)
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
X-Inumbo-ID: 65abccca-4b67-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750156790; x=1750761590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PyQnQYz5V1+8Q8y/82lgC6LaO5G1+AGy3gkP0xeWvS0=;
        b=Yd6zZDLPTz49nLCBT7PQD1qExNTB/fxrApnJW+Ct+h0GYqyULaxKKpKSEQZ8UZ6zrN
         +K1XLEWO2HCxZct78vS9NkYc/Hf+S3jcdxxmhKXZqQhNNaHEgzITcSomPZ6ryiK1kh/Z
         NTqOxi0EhqNmsLXe5cD+y8tGYEca+CqRe0ItnJCp2NtRt+EBgDjppoWPrmk4Uy6ddtjX
         IUFTEsMT7Gt/9vZJ3ci7Bz1zAb1z9oQtIiesrLZ/+nmR26fhkBLxcgcPyXQ30bWAM5br
         2F7Lgcz4zR7kCJdGwVJlKl88xkFqxmqTDoTkdJvWsQBg+FqfGmXKG1oG1TS1SnhbLudK
         gvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156790; x=1750761590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyQnQYz5V1+8Q8y/82lgC6LaO5G1+AGy3gkP0xeWvS0=;
        b=Cl3vYgdKTBGouuT6miWoJ+xKHddLpgtgFvZIV6Dk7uyemzpC7kb4GNSQH/00MYg+II
         buntY1wVh+71cDg/8jrmugH2JZYxp0erEU5R+KBZkmPTmwNv0QMZjaPeAFtbDMxrBpuh
         m8oIJvWlMt7mkrNl/9Tv3JV+prl+jQAY1G/G/2J0ACHJdKcj6H7COqjC8HvFgT/coHRR
         q+7N8BwEuRkgVYHSe7SHhnPQeLfulGMDbBsYhBznZbDgA//vDybvrCrzNh/0Hadm5AU5
         hnEF5A86DJleuNMnoqE2oawWNNY2QyJrSQPUjFQmqVtXTUSdNlsADr4CYAgEAs/MGckY
         FCAw==
X-Forwarded-Encrypted: i=1; AJvYcCUwn2VkPhXSWkOGNJExTQ9CL2fIGuseNzQqct7K/xMOv359ZVG8sENYQJKaqBXFRezDxbg9M5mCoT4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+NPrDKXlG98I1bZaOXy6c27juf6A9l9TBq5gvz4nOcgyK78hr
	3fpBkAIvDzVxnftFQrjl/5gzQXF7yljYX3tGVB7ywZ8gp7jFCl2twfM+HdDnb7BaRg==
X-Gm-Gg: ASbGncu3q8YB02gxc1SWgaAI+0PxBsfGsTDyPDoQaBHEUg+sK04fJHZrSLA3DI3iqNF
	qsLMJBoMamdJXeTA+OPeRoKgrxe4W/mqTuUFnS7JoJr2ONnhcXhWCUhG+CSoIlLtocmU1bRMjg8
	QyVvOoWKOFnI2MLepu5oe8jrZd6cllknjGah458KjQgwX8GaVCVvbVATravwFa2fS4VmoHEGON0
	tIuNpdN/LtnFwLWRdCchgBj6/+fwEEjtKdDV7M6RozAhl41b56j3CNd7zSEQE+dR1TVwvr2IG9X
	VlEF3Mv1McpHuX4QNmnOwK95aIPOJbfv85eW4Y13oxlzSJJ9kyMupQjz57H9q7sYLXUT7+92CO9
	gprcaqERSQtDaX6puhbJSVIq9JYgQmbOYP5OhqcJgC6W3+24=
X-Google-Smtp-Source: AGHT+IFtEERDLhNIDdLOqPOqdiIEs9M9cQZqK+kxkeUyBlK7Tip+o5YfPkrhl1bxJpQDAx+ftsTGVg==
X-Received: by 2002:a05:6000:2dc3:b0:3a5:1240:6802 with SMTP id ffacd0b85a97d-3a572e58463mr10583089f8f.57.1750156790031;
        Tue, 17 Jun 2025 03:39:50 -0700 (PDT)
Message-ID: <73d66cbf-9b0c-475a-9e5e-0e5cd456c09e@suse.com>
Date: Tue, 17 Jun 2025 12:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/18] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-19-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-19-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> +int set_amd_cppc_para(struct cpufreq_policy *policy,
> +                      const struct xen_set_cppc_para *set_cppc)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
> +    uint8_t max_perf, min_perf, des_perf = 0, epp;
> +
> +    if ( data == NULL )
> +        return -ENOENT;
> +
> +    /* Validate all parameters */
> +    if ( set_cppc->minimum > UINT8_MAX || set_cppc->maximum > UINT8_MAX ||
> +         set_cppc->desired > UINT8_MAX || set_cppc->energy_perf > UINT8_MAX )
> +        return -EINVAL;
> +
> +    /* Only allow values if params bit is set. */
> +    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
> +          set_cppc->desired) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
> +          set_cppc->minimum) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
> +          set_cppc->maximum) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
> +          set_cppc->energy_perf) )
> +        return -EINVAL;
> +
> +    /* Activity window not supported in MSR */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
> +        return -EOPNOTSUPP;
> +
> +    /* Return if there is nothing to do. */
> +    if ( set_cppc->set_params == 0 )
> +        return 0;
> +
> +    epp = per_cpu(epp_init, cpu);
> +    /*
> +     * Apply presets:
> +     * XEN_SYSCTL_CPPC_SET_DESIRED reflects whether desired perf is set, which
> +     * is also the flag to distinguish between passive mode and active mode.
> +     * When it is set, CPPC in passive mode, only
> +     * XEN_SYSCTL_CPPC_SET_PRESET_NONE could be chosen.
> +     * when it is not set, CPPC in active mode, three different profile
> +     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/BALANCE are provided,
> +     */
> +    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
> +    {
> +    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_POWERSAVE;
> +        min_perf = data->caps.lowest_perf;
> +        /* Lower max frequency to lowest */
> +        max_perf = data->caps.lowest_perf;
> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        /* Increase idle frequency to highest */
> +        policy->policy = CPUFREQ_POLICY_PERFORMANCE;
> +        min_perf = data->caps.highest_perf;
> +        max_perf = data->caps.highest_perf;
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_BALANCE;
> +        min_perf = data->caps.lowest_perf;
> +        max_perf = data->caps.highest_perf;
> +        epp = CPPC_ENERGY_PERF_BALANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
> +        /*
> +         * In paasive mode, Xen governor is responsible for perfomance tuning.
> +         * we shall set lowest_perf with "lowest_nonlinear_perf" to ensure
> +         * governoring performance in P-states range.
> +         */
> +        min_perf = data->caps.lowest_nonlinear_perf;
> +        max_perf = data->caps.highest_perf;
> +        break;

Oh, also - can you really leave policy->policy unaltered here?

Jan

