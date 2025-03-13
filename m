Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2764A5EE4D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911494.1317904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseBW-0003be-R7; Thu, 13 Mar 2025 08:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911494.1317904; Thu, 13 Mar 2025 08:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseBW-0003ZE-O3; Thu, 13 Mar 2025 08:44:58 +0000
Received: by outflank-mailman (input) for mailman id 911494;
 Thu, 13 Mar 2025 08:44:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tseBV-0003Z8-6q
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:44:57 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7021518c-ffe7-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 09:44:55 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso3748385e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:44:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6e92sm1371621f8f.38.2025.03.13.01.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:44:54 -0700 (PDT)
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
X-Inumbo-ID: 7021518c-ffe7-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741855495; x=1742460295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k/Vv0m7e8TP/eZ8pg1BZ8/WgIdEBJH+8JRXCFcnzxO4=;
        b=WmfmCg81BwihSh6vXrc/TOofIn4OOBJfPaZx+bWXJnjWo6Wxh5YSjx+R1de/Lly10z
         9oL59B/Nmf4WoUnrIdlYEETgtT8lJYibpwuLZryW9USpN8YNu7HzUbVQJXCZFu7cBKpv
         fPl7NMGwy54T2fMhzwSNhSdbcHZFcnfFL9dTVfpuJwQXzynYsBXZTs1qr0cwE6epKByg
         RFbjCjkyHhb3kRI0wQ594YhKEuP6gqq/5OP9zFFoyHA7XTKPKfvIn4sJEgBU0s1d9IcQ
         e2aU1WOd1IaDFLZUKepCnzhgPtHOVa7OVgVJ2ACPpttN52vrGQJh5wJCp5T9g7oTifmK
         smug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855495; x=1742460295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/Vv0m7e8TP/eZ8pg1BZ8/WgIdEBJH+8JRXCFcnzxO4=;
        b=dVp6qGX3cC3Qi2BV3rRDjsPdSirLg13B5QqmcXRpKMn+qTxd3BXkpTwC7Bjp51Ger2
         1zBf0EaKOQIA2w+r1i43cumE93dopQrHg9vZpSb4b3Ho9lHRWuxCVyeRzQsvPqDiraU3
         aqjJucXQ3Q7YovmTzqHsN0jnrXxi7X92sSMZTLAvk6x76L+ZUP3mf7ESMC3kUrkRvEe1
         8aQ9jySX17AO717h2KIZsHUJi+DJkP3HJFa0Pv8IQFNIw/p8ThfWCg22A+jKc35Zg6x6
         wn33B0t5PZWIJtJtXMse9Smdsem5I4b2A5gXUUyfYXw+NThjHQ9PNslUzrW1k2A0VQyJ
         L3EA==
X-Forwarded-Encrypted: i=1; AJvYcCXewP1yGTrEizHFy5rDD9rQIvArnsICZFp3UkmMnBeFO3aUucNuQJ0cGgzQbL81H4ux8W67tbMNcTE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxx4bH1IE6eyJjZtYr+FX+OQn6TkUYNx4f1xyxgre8RyY1mlDfD
	CRwDgiZTsqz5j3yjHtJMVL9jbsR+uXLkw4rX8MdY7M1DPCACeXnMMDuP0fELvQ==
X-Gm-Gg: ASbGncuotwblHh+PtbEgKe/JyuO7sf5vWFdyCanyZbs6zP3i+T1mU2GiZYxTwG3t/if
	R6ylLbpiMdhptOMucnJj6W+y4lLwHu3XDb92DYvUVcQqkGlDvNjqPtZn/IyLGxMQTjWB9U12qRJ
	sHtHiJH0/p7fkS6G/73orKin1IN+J5ftHveRCGCJRbzviWvUb7buIAHDIDBivXaXq5+4jpMTWfI
	2vem7sWeHldv6tlzcI8Du3q5SCINiSGovcxkzzudeBpsHq3AMv6tVBMiyNnPNoyjizYkvtdoIIi
	Wiw3WYmfenUtTZrdjSjjr+TQ1goHPh/3dDOkyK/yLn8rggWRinWOE63swBKryW3Wr4mWfEpf2Jh
	xeJYMkGckbMk7l8MjtfMazNfpr1RnplSorNTnsRj9
X-Google-Smtp-Source: AGHT+IGwudAk6PHJLz0mv+sSKtoGbAlgJZKIUmRPQKMpVnooQDvhFpWUqxnTmzJsdbkii5USwZKRaQ==
X-Received: by 2002:a05:6000:1867:b0:391:253b:405d with SMTP id ffacd0b85a97d-39132d98a1emr20175944f8f.41.1741855495091;
        Thu, 13 Mar 2025 01:44:55 -0700 (PDT)
Message-ID: <d4a4b8ff-161f-47c3-a2bc-dd7e1ba3ce1a@suse.com>
Date: Thu, 13 Mar 2025 09:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/19] xen/sysctl: introduce CONFIG_PM_STATISTIC
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250312040632.2853485-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:06, Penny Zheng wrote:
> This commit introduces CONFIG_PM_STATISTIC for wrapping all operations
> regarding performance management statistic operations.

Please can descriptions not use "This patch ..." or "This commit ..." or
anyhting like these?

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -107,6 +107,11 @@ config NEEDS_LIBELF
>  config NUMA
>  	bool
>  
> +config PM_STATISTIC

I think this wants to use plural, i.e. PM_STATISTICS or PM_STATS.

> +        bool "Enable Performance Management Statistic Operations"

"Enable Performance Management Statistics" ?

> +        depends on ACPI && HAS_CPUFREQ
> +        default y

Nit: Indentation.

> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -170,7 +170,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          op->u.availheap.avail_bytes <<= PAGE_SHIFT;
>          break;
>  
> -#if defined (CONFIG_ACPI) && defined (CONFIG_HAS_CPUFREQ)
> +#ifdef CONFIG_PM_STATISTIC
>      case XEN_SYSCTL_get_pmstat:
>          ret = do_get_pm_info(&op->u.get_pmstat);
>          break;
> @@ -180,7 +180,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          if ( ret == -EAGAIN )
>              copyback = 1;
>          break;
> -#endif
> +#endif /* CONFIG_PM_STATISTIC */
>  
>      case XEN_SYSCTL_page_offline_op:
>      {
> diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
> index 2fc5230253..70156ee0a4 100644
> --- a/xen/drivers/acpi/Makefile
> +++ b/xen/drivers/acpi/Makefile
> @@ -5,7 +5,7 @@ obj-$(CONFIG_X86) += apei/
>  obj-bin-y += tables.init.o
>  obj-$(CONFIG_ACPI_NUMA) += numa.o
>  obj-y += osl.o
> -obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
> +obj-$(CONFIG_PM_STATISTIC) += pmstat.o
>  
>  obj-$(CONFIG_X86) += hwregs.o
>  obj-$(CONFIG_X86) += reboot.o
> diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
> index df309e27b4..58cccd589b 100644
> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -43,6 +43,167 @@
>  
>  DEFINE_PER_CPU_READ_MOSTLY(struct pm_px *, cpufreq_statistic_data);
>  
> +DEFINE_PER_CPU(spinlock_t, cpufreq_statistic_lock);
> +
> +/*********************************************************************
> + *                    Px STATISTIC INFO                              *
> + *********************************************************************/
> +
> +static void cpufreq_residency_update(unsigned int cpu, uint8_t state)
> +{
> +    uint64_t now, total_idle_ns;
> +    int64_t delta;
> +    struct pm_px *pxpt = per_cpu(cpufreq_statistic_data, cpu);
> +
> +    total_idle_ns = get_cpu_idle_time(cpu);
> +    now = NOW();
> +
> +    delta = (now - pxpt->prev_state_wall) -
> +            (total_idle_ns - pxpt->prev_idle_wall);
> +
> +    if ( likely(delta >= 0) )
> +        pxpt->u.pt[state].residency += delta;
> +
> +    pxpt->prev_state_wall = now;
> +    pxpt->prev_idle_wall = total_idle_ns;
> +}
> +
> +void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to)
> +{
> +    struct pm_px *pxpt;
> +    struct processor_pminfo *pmpt = processor_pminfo[cpu];
> +    spinlock_t *cpufreq_statistic_lock =
> +               &per_cpu(cpufreq_statistic_lock, cpu);
> +
> +    spin_lock(cpufreq_statistic_lock);
> +
> +    pxpt = per_cpu(cpufreq_statistic_data, cpu);
> +    if ( !pxpt || !pmpt ) {
> +        spin_unlock(cpufreq_statistic_lock);
> +        return;
> +    }
> +
> +    pxpt->u.last = from;
> +    pxpt->u.cur = to;
> +    pxpt->u.pt[to].count++;
> +
> +    cpufreq_residency_update(cpu, from);
> +
> +    (*(pxpt->u.trans_pt + from * pmpt->perf.state_count + to))++;
> +
> +    spin_unlock(cpufreq_statistic_lock);
> +}
> +
> +int cpufreq_statistic_init(unsigned int cpu)
> +{
> +    uint32_t i, count;
> +    struct pm_px *pxpt;
> +    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
> +    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
> +
> +    spin_lock_init(cpufreq_statistic_lock);
> +
> +    if ( !pmpt )
> +        return -EINVAL;
> +
> +    spin_lock(cpufreq_statistic_lock);
> +
> +    pxpt = per_cpu(cpufreq_statistic_data, cpu);
> +    if ( pxpt ) {
> +        spin_unlock(cpufreq_statistic_lock);
> +        return 0;
> +    }
> +
> +    count = pmpt->perf.state_count;
> +
> +    pxpt = xzalloc(struct pm_px);
> +    if ( !pxpt ) {
> +        spin_unlock(cpufreq_statistic_lock);
> +        return -ENOMEM;
> +    }
> +    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
> +
> +    pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
> +    if (!pxpt->u.trans_pt) {
> +        xfree(pxpt);
> +        spin_unlock(cpufreq_statistic_lock);
> +        return -ENOMEM;
> +    }
> +
> +    pxpt->u.pt = xzalloc_array(struct pm_px_val, count);
> +    if (!pxpt->u.pt) {
> +        xfree(pxpt->u.trans_pt);
> +        xfree(pxpt);
> +        spin_unlock(cpufreq_statistic_lock);
> +        return -ENOMEM;
> +    }
> +
> +    pxpt->u.total = pmpt->perf.state_count;
> +    pxpt->u.usable = pmpt->perf.state_count - pmpt->perf.platform_limit;
> +
> +    for (i=0; i < pmpt->perf.state_count; i++)
> +        pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
> +
> +    pxpt->prev_state_wall = NOW();
> +    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
> +
> +    spin_unlock(cpufreq_statistic_lock);
> +
> +    return 0;
> +}
> +
> +void cpufreq_statistic_exit(unsigned int cpu)
> +{
> +    struct pm_px *pxpt;
> +    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
> +
> +    spin_lock(cpufreq_statistic_lock);
> +
> +    pxpt = per_cpu(cpufreq_statistic_data, cpu);
> +    if (!pxpt) {
> +        spin_unlock(cpufreq_statistic_lock);
> +        return;
> +    }
> +
> +    xfree(pxpt->u.trans_pt);
> +    xfree(pxpt->u.pt);
> +    xfree(pxpt);
> +    per_cpu(cpufreq_statistic_data, cpu) = NULL;
> +
> +    spin_unlock(cpufreq_statistic_lock);
> +}
> +
> +static void cpufreq_statistic_reset(unsigned int cpu)
> +{
> +    uint32_t i, j, count;
> +    struct pm_px *pxpt;
> +    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
> +    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
> +
> +    spin_lock(cpufreq_statistic_lock);
> +
> +    pxpt = per_cpu(cpufreq_statistic_data, cpu);
> +    if ( !pmpt || !pxpt || !pxpt->u.pt || !pxpt->u.trans_pt ) {
> +        spin_unlock(cpufreq_statistic_lock);
> +        return;
> +    }
> +
> +    count = pmpt->perf.state_count;
> +
> +    for (i=0; i < count; i++) {
> +        pxpt->u.pt[i].residency = 0;
> +        pxpt->u.pt[i].count = 0;
> +
> +        for (j=0; j < count; j++)
> +            *(pxpt->u.trans_pt + i*count + j) = 0;
> +    }
> +
> +    pxpt->prev_state_wall = NOW();
> +    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
> +
> +    spin_unlock(cpufreq_statistic_lock);
> +}

The want/need for this code movement wants mentioning in the description imo.
It may even be desirable to split this out. The more that while you move it,
it would be quite nice if various style corrections could be applied.

> @@ -522,34 +683,3 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
>  
>      return ret;
>  }
> -
> -int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
> -{
> -    u32 bits[3];
> -    int ret;
> -
> -    if ( copy_from_guest(bits, pdc, 2) )
> -        ret = -EFAULT;
> -    else if ( bits[0] != ACPI_PDC_REVISION_ID || !bits[1] )
> -        ret = -EINVAL;
> -    else if ( copy_from_guest_offset(bits + 2, pdc, 2, 1) )
> -        ret = -EFAULT;
> -    else
> -    {
> -        u32 mask = 0;
> -
> -        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
> -            mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
> -        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
> -            mask |= ACPI_PDC_P_MASK | ACPI_PDC_SMP_C1PT;
> -        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_TX )
> -            mask |= ACPI_PDC_T_MASK | ACPI_PDC_SMP_C1PT;
> -        bits[2] &= (ACPI_PDC_C_MASK | ACPI_PDC_P_MASK | ACPI_PDC_T_MASK |
> -                    ACPI_PDC_SMP_C1PT) & ~mask;
> -        ret = arch_acpi_set_pdc_bits(acpi_id, bits, mask);
> -    }
> -    if ( !ret && __copy_to_guest_offset(pdc, 2, bits + 2, 1) )
> -        ret = -EFAULT;
> -
> -    return ret;
> -}
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -582,6 +582,37 @@ out:
>      return ret;
>  }
>  
> +int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
> +{
> +    u32 bits[3];
> +    int ret;
> +
> +    if ( copy_from_guest(bits, pdc, 2) )
> +        ret = -EFAULT;
> +    else if ( bits[0] != ACPI_PDC_REVISION_ID || !bits[1] )
> +        ret = -EINVAL;
> +    else if ( copy_from_guest_offset(bits + 2, pdc, 2, 1) )
> +        ret = -EFAULT;
> +    else
> +    {
> +        u32 mask = 0;
> +
> +        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
> +            mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
> +        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
> +            mask |= ACPI_PDC_P_MASK | ACPI_PDC_SMP_C1PT;
> +        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_TX )
> +            mask |= ACPI_PDC_T_MASK | ACPI_PDC_SMP_C1PT;
> +        bits[2] &= (ACPI_PDC_C_MASK | ACPI_PDC_P_MASK | ACPI_PDC_T_MASK |
> +                    ACPI_PDC_SMP_C1PT) & ~mask;
> +        ret = arch_acpi_set_pdc_bits(acpi_id, bits, mask);
> +    }
> +    if ( !ret && __copy_to_guest_offset(pdc, 2, bits + 2, 1) )
> +        ret = -EFAULT;
> +
> +    return ret;
> +}

Same here - looks pretty independent.

> --- a/xen/include/acpi/cpufreq/processor_perf.h
> +++ b/xen/include/acpi/cpufreq/processor_perf.h
> @@ -9,11 +9,19 @@
>  
>  unsigned int powernow_register_driver(void);
>  unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
> -void cpufreq_residency_update(unsigned int cpu, uint8_t state);
> +#ifdef CONFIG_PM_STATISTIC
>  void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to);
>  int  cpufreq_statistic_init(unsigned int cpu);
>  void cpufreq_statistic_exit(unsigned int cpu);
> -void cpufreq_statistic_reset(unsigned int cpu);
> +#else
> +static inline  void cpufreq_statistic_update(unsigned int cpu, uint8_t from,
> +                                             uint8_t to) {};

Nit: Stray semicolon. I'm also uncertain whether we like this kind of
formatting (i.e. if already things don't fit on a single line, I'm unsure
whether we like then having the braces not on their own line).

> +static inline int cpufreq_statistic_init(unsigned int cpu)
> +{
> +    return 0;
> +}
> +static inline void cpufreq_statistic_exit(unsigned int cpu) {};

Stray semicolon again.

> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -158,6 +158,7 @@ int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
>  extern unsigned int max_cstate;
>  extern unsigned int max_csubstate;
>  
> +#ifdef CONFIG_PM_STATISTIC
>  static inline unsigned int acpi_get_cstate_limit(void)
>  {
>  	return max_cstate;
> @@ -177,6 +178,7 @@ static inline void acpi_set_csubstate_limit(unsigned int new_limit)
>  {
>  	max_csubstate = new_limit;
>  }
> +#endif /* CONFIG_PM_STATISTIC */

Is this really necessary? Afaict these inline functions would still
compile fine; they'd merely end up without any user for now. (Not sure
what Misra's take is on unused inline functions.)

> --- a/xen/include/xen/pmstat.h
> +++ b/xen/include/xen/pmstat.h
> @@ -15,11 +15,13 @@ struct compat_processor_power;
>  long compat_set_cx_pminfo(uint32_t acpi_id, struct compat_processor_power *power);
>  #endif
>  
> +#ifdef CONFIG_PM_STATISTIC
>  uint32_t pmstat_get_cx_nr(unsigned int cpu);
>  int pmstat_get_cx_stat(unsigned int cpu, struct pm_cx_stat *stat);
>  int pmstat_reset_cx_stat(unsigned int cpu);
>  
>  int do_get_pm_info(struct xen_sysctl_get_pmstat *op);
>  int do_pm_op(struct xen_sysctl_pm_op *op);
> +#endif /* CONFIG_PM_STATISTIC */

Similarly leaving these declarations visible isn't going to be a problem.
We do so quite frequently elsewhere.

Jan

