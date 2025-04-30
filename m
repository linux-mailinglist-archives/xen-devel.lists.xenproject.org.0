Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738FAA5049
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973729.1361787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9Px-0002jL-EG; Wed, 30 Apr 2025 15:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973729.1361787; Wed, 30 Apr 2025 15:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9Px-0002ge-BX; Wed, 30 Apr 2025 15:32:13 +0000
Received: by outflank-mailman (input) for mailman id 973729;
 Wed, 30 Apr 2025 15:32:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9Pw-0002gY-2g
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:32:12 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48501700-25d8-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 17:32:10 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5f4d28d9fd8so9366051a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:32:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed6fe65sm947986566b.142.2025.04.30.08.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:32:09 -0700 (PDT)
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
X-Inumbo-ID: 48501700-25d8-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746027130; x=1746631930; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CkUHHEEf73XKyHxLupW24gr+zIFT+2sOflzFWZmPAKM=;
        b=SddaWXzFANqjt2R5tao3J5GPAkzCzquP9fa4VccPDg7Za02BaKzlJyUZvz+qWu+SkZ
         xss3it/+hZeTOuljDOuoCmCpVPQjzdjdF3jJr9KMfI30CAWiQxZj9388xDw57AhVhH1E
         ufrm+zbJESn5QmEhFSoBrJA7BGXkUH7yIfPlVT0HhLKpImOCGjdao1ZfgFcLt59QW7+x
         rCgZgeNE0MkqPUIKHsoNMk9WYUQSMsnzhg179ez+4Z9tNABBlhcETrr74LYKzCYXhze6
         RkX7PmE8KyAP56QCbqSa/pe3EIdJ/DXcnFDWmj6qS8D49BrOyuJKT+bbEttHkLpdc2+y
         NZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027130; x=1746631930;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkUHHEEf73XKyHxLupW24gr+zIFT+2sOflzFWZmPAKM=;
        b=whfJnpOpzFwH5KEUK8sKTm8lH7Mb3uhicdtWS3FNZWbMBWB2tFQ0Ra8nMDkZyNvPej
         6ueDcVP9flHazJbIlSZ5yo92J03BqOXORLN72IV3QHnBvNKSN/JpjDSSXc902rYlNZ2M
         bVwkygc+4XVviAY+dOPePmlT/ZGxxkEwDlNUOvxXNzZpLd3J2tBd6LQg5WEz7PHMrPYE
         hFLN3IVOFYLQGs6Yf6p802CfT9CwSHnl2olIjKkZn/+5Ob3vSL9WyYKLk7FMpLfjHsVa
         WK/vBz1IHjvFDoEaLv57bHVXo+paByvgaEaeKgwqQ+cwO9BitxpwGWSL/kO1ytyGbRSo
         oRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFOdnifNICgy0LrUjvSn+77LDusGhzJRoGHI1pnpUpteHwc3T7vXNoZAP7edfckdnXJiID0TX/CM0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE2J7cf/PnQvgoIykzDzyjRQBFmpVpX/pcW1w0viczokPv8XMC
	TYisUtHl+cdgwaHEMuPT7951KkkUXJwEBQtvwejV8CXFVoXB2s0lj/ZZ9ICWSA==
X-Gm-Gg: ASbGnctzRiDj1bnbvQJ8yKGxioLUZLZduN4sKGvhlvZATsDXLy+ME5L7UnZsRowP1B3
	C0Fk1LlAzXWYzPtgIk3FB8QySKJgl1EXHUJ51Geg/6L6ZOXS4tBaf7c5VrGW+UmoNttuWDdkurK
	4n+M4YT4GnDzhQn1RZtStMqiTH+nGyGF1Jmr7ZT7QKfQgZEYFctE0bdriyYZUQE4tnGHV0E6Fwj
	rgCaYIDBaCjC5r07f8zW9u8QeIN8ED28ZaVH2qCB/U2T1Wa1jvYBAX5eUdSIoIrEzzv6dVWOSkI
	Fcuu38/Csk/PflnpMB3RYtkPHwW9zKHbmsu/F33VhDyECtfcjoxbyrB2yNoRJU2YHxiO9Az5Nmt
	UJ1ZpyiuC+tmFm6hqYF7CoQfpdg==
X-Google-Smtp-Source: AGHT+IHVR93GWWnlBpaaJ8sh+UaEmO43bwyXFZD4sp8jCzjAwUpTO1yv4AT7rBArkrsvR8y9OcTn5A==
X-Received: by 2002:a17:906:4fcd:b0:ace:68ad:b4d8 with SMTP id a640c23a62f3a-acee25c7624mr341669966b.38.1746027130005;
        Wed, 30 Apr 2025 08:32:10 -0700 (PDT)
Message-ID: <1a6f2023-1022-4c22-9a61-4006d94d3c24@suse.com>
Date: Wed, 30 Apr 2025 17:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] xen/pmstat: introduce CONFIG_PM_OP
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
 <20250421073723.3863060-11-Penny.Zheng@amd.com>
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
In-Reply-To: <20250421073723.3863060-11-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 09:37, Penny Zheng wrote:
> We move the following functions into a new file drivers/acpi/pm_op.c, as
> they are all more fitting in performance controling and only called by
> do_pm_op():
>  - get_cpufreq_para()
>  - set_cpufreq_para()
>  - set_cpufreq_gov()
>  - set_cpufreq_cppc()
>  - cpufreq_driver_getavg()
>  - cpufreq_update_turbo()
>  - cpufreq_get_turbo_status()
> We introduce a new Kconfig CONFIG_PM_OP to wrap the new file.
> 
> Also, although the following helpers are only called by do_pm_op(), they have
> dependency on local variable, we wrap them with CONFIG_PM_OP in place:
>  - write_userspace_scaling_setspeed()
>  - write_ondemand_sampling_rate()
>  - write_ondemand_up_threshold()
>  - get_cpufreq_ondemand_para()
>  - cpufreq_driver.update()
>  - get_hwp_para()
> Various style corrections shall be applied at the same time while moving these
> functions, including:
>  - add extra space before and after bracket of if() and switch()
>  - fix indentation
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v2 -> v3
> - new commit
> ---
>  xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
>  xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
>  xen/common/Kconfig                           |   7 +
>  xen/common/sysctl.c                          |   4 +-
>  xen/drivers/acpi/Makefile                    |   1 +
>  xen/drivers/acpi/pm_op.c                     | 409 +++++++++++++++++++
>  xen/drivers/acpi/pmstat.c                    | 357 ----------------
>  xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
>  xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
>  xen/drivers/cpufreq/utility.c                |  41 --
>  xen/include/acpi/cpufreq/cpufreq.h           |   3 -
>  11 files changed, 434 insertions(+), 402 deletions(-)
>  create mode 100644 xen/drivers/acpi/pm_op.c

I'm pretty sure I said "pm-op.c" in replies, maybe even moret than once. Now
you still used an underscore instead of the dash that's preferred.

> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -181,13 +181,15 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>      case XEN_SYSCTL_get_pmstat:
>          ret = do_get_pm_info(&op->u.get_pmstat);
>          break;
> +#endif
>  
> +#ifdef CONFIG_PM_OP
>      case XEN_SYSCTL_pm_op:
>          ret = do_pm_op(&op->u.pm_op);
>          if ( ret == -EAGAIN )
>              copyback = 1;
>          break;
> -#endif
> +#endif /* CONFIG_PM_OP */

Please can you be consistent here with the comment (or not) on the #endif?

> +int do_pm_op(struct xen_sysctl_pm_op *op)
> +{
> +    int ret = 0;
> +    const struct processor_pminfo *pmpt;
> +
> +    switch ( op->cmd )
> +    {
> +    case XEN_SYSCTL_pm_op_set_sched_opt_smt:
> +    {
> +        uint32_t saved_value = sched_smt_power_savings;
> +
> +        if ( op->cpuid != 0 )
> +            return -EINVAL;
> +        sched_smt_power_savings = !!op->u.set_sched_opt_smt;
> +        op->u.set_sched_opt_smt = saved_value;
> +        return 0;
> +    }
> +
> +    case XEN_SYSCTL_pm_op_get_max_cstate:
> +        BUILD_BUG_ON(XEN_SYSCTL_CX_UNLIMITED != UINT_MAX);
> +        if ( op->cpuid == 0 )
> +            op->u.get_max_cstate = acpi_get_cstate_limit();
> +        else if ( op->cpuid == 1 )
> +            op->u.get_max_cstate = acpi_get_csubstate_limit();
> +        else
> +            ret = -EINVAL;
> +        return ret;
> +
> +    case XEN_SYSCTL_pm_op_set_max_cstate:
> +        if ( op->cpuid == 0 )
> +            acpi_set_cstate_limit(op->u.set_max_cstate);
> +        else if ( op->cpuid == 1 )
> +            acpi_set_csubstate_limit(op->u.set_max_cstate);
> +        else
> +            ret = -EINVAL;
> +        return ret;
> +    }
> +
> +    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
> +        return -EINVAL;
> +    pmpt = processor_pminfo[op->cpuid];
> +
> +    switch ( op->cmd & PM_PARA_CATEGORY_MASK )
> +    {
> +    case CPUFREQ_PARA:
> +        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
> +            return -ENODEV;
> +        if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
> +            return -EINVAL;
> +        break;
> +    }
> +
> +    switch ( op->cmd )
> +    {
> +    case GET_CPUFREQ_PARA:
> +    {
> +        ret = get_cpufreq_para(op);
> +        break;
> +    }
> +
> +    case SET_CPUFREQ_GOV:
> +    {
> +        ret = set_cpufreq_gov(op);
> +        break;
> +    }
> +
> +    case SET_CPUFREQ_PARA:
> +    {
> +        ret = set_cpufreq_para(op);
> +        break;
> +    }
> +
> +    case SET_CPUFREQ_CPPC:
> +        ret = set_cpufreq_cppc(op);
> +        break;
> +
> +    case GET_CPUFREQ_AVGFREQ:
> +    {
> +        op->u.get_avgfreq = cpufreq_driver_getavg(op->cpuid, USR_GETAVG);
> +        break;
> +    }
> +
> +    case XEN_SYSCTL_pm_op_enable_turbo:
> +    {
> +        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_ENABLED);
> +        break;
> +    }
> +
> +    case XEN_SYSCTL_pm_op_disable_turbo:
> +    {
> +        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_DISABLED);
> +        break;
> +    }

Please can you drop all the unnecessary inner figure braces here? They hamper
readability without - imo - providing any gain at all.

With all of the adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

