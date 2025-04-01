Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B626A77BC9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934178.1335980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPM-0006S6-PX; Tue, 01 Apr 2025 13:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934178.1335980; Tue, 01 Apr 2025 13:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPM-0006RY-JW; Tue, 01 Apr 2025 13:12:00 +0000
Received: by outflank-mailman (input) for mailman id 934178;
 Tue, 01 Apr 2025 13:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzbNP-0000Od-Pu
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:09:59 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c2e7e94-0efa-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:09:57 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3996af42857so4372495f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:09:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0afsm14258344f8f.65.2025.04.01.06.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 06:09:56 -0700 (PDT)
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
X-Inumbo-ID: 9c2e7e94-0efa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743512997; x=1744117797; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/gF64dXv6sBhyC1t7NW0BRm8NXvB4SI7N9Oj+yapuNo=;
        b=LaIE4ji5lkq80PgRs3P1ytIcvWkd4pJADf+h0PpVM64OgPy7MnGC0T13lGdIvqnQNo
         33cgGG/6VJfENGzFYJdlPnxqrWMfDpgvGqeZUujB9coAAWINbllUZYb33HFDO/vyppod
         tA4cjHTUIZD+VX4pelLtc1XLBCTipVCaUzaHnZUHpSFd8xU5/usvDoKYPP/kJNH6FPb+
         K4xHHhPA+lZQUXir0ypW74YseFWbXuMAM12jONAOHF8n24XMTMhGer6N06d9PqS2YY/o
         Pm7aRKboNuPwJvFScOfS/vHK/Kj2qQ8aZlx7Uq9oxI39UgtghAw/EDQcDeoimZB1kfw9
         xk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512997; x=1744117797;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gF64dXv6sBhyC1t7NW0BRm8NXvB4SI7N9Oj+yapuNo=;
        b=oUnVtdEoOD8rw53pMakH9jXCP4167KWNC7CbgyotWzcP3X3UeuRwli3kzGVHYC+jR1
         XM2+YjY624ZliXGJ9IZLuLk7uPc7IeNM4pypMtu5kJ4+KaptpwRt45ymO6D9l92CvUwy
         v8Rw9Aq4rrdOaaPKt6Zx/Ipb+1J5Z5AWrxYD8lUWdZNbDVZrEwkayIVKEhIi/5j6OTLy
         cjfcflyK2NBFWBmrvkdJQ3Vhps6ZlMXEkfJF9pQa9gQSlxA/5eYxVnthL3STiv5WayiR
         4d2RocP8Xh2uZxr8E2lhi3jHM7A7e6CsIfiayvtXsu0b828d0S1lWnCvmLM4cDCVgRBK
         26zw==
X-Forwarded-Encrypted: i=1; AJvYcCUtGRvPmOnOFTRqMsFUN0H7+IpilpFw9dcNHzcxk7b1WX7CRi94y7FCW1Jur97aVzZqldAinHCJlao=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlGCddC2ClwGZ6t3I1kvQL7Zqb5z7sVuiQIcCENmykfVIt7/bj
	EiGdYZL1OTylD0DJOozFNiHZ5FgT0/fe10YRW/1wn4nwIknC6GCkd0unxAhABw==
X-Gm-Gg: ASbGncskRbjSG8G42AGdb+1+S3Fk2pTHvYv3hE8FMet1aEww5NnSJ6lvr7d6DcQC6er
	HRO8ueKYFQ9vDLHoVt8xX7Zogr46wLq+3HCKBMv4i1ilKI8lS8G4wRIgdfKszucrAyWXfTrQHqO
	07SmrgT8+uqpMRQjPaCOENZTEc515pRhsq7gbibu/k/jYN8GU+1/Q2cqomdTYzNvX6sPyPlFpU3
	ns4pcMI12rrF/WAOKyPmIe+QydYrawZ94lTeoSv9pFcNgPNfTcnnF7wsBYSEJQc25mh2k/jFIzu
	0BOf7NmRgxcI+IUWta+pXC4eJGOHGuRHiL+gLwEToEUGD7HBhyZw//lQ+MLSt/TVTDx+iE3o7pk
	UWafJhdshD3I949/MBWXtTzAP/9sIuw==
X-Google-Smtp-Source: AGHT+IGB034m70MBls2U3Pja2dYHRJF+7crijUZKoqlMUqCVPQU4IxCdb0GNPKC5whvDbFdv7wkpPg==
X-Received: by 2002:a05:6000:40cb:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39c1efbfcaemr4998679f8f.25.1743512996798;
        Tue, 01 Apr 2025 06:09:56 -0700 (PDT)
Message-ID: <df30d9fa-15dd-4923-bdaf-04f9476529d1@suse.com>
Date: Tue, 1 Apr 2025 15:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-11-Penny.Zheng@amd.com>
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
In-Reply-To: <20250326055053.3313146-11-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 06:50, Penny Zheng wrote:
> We intend to introduce CONFIG_PM_STATS for wrapping all operations
> regarding performance management statistics.
> The major codes reside in xen/drivers/acpi/pmstat.c, including two main
> pm-related sysctl op: do_get_pm_info() and do_pm_op().
> So This commit also makes CONFIG_PM_STATS depend on CONFIG_SYSCTL
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - rename to CONFIG_PM_STATS
> - fix indention and stray semicolon
> - make code movements into a new commit
> - No need to wrap inline functions and declarations
> ---
>  xen/arch/x86/acpi/cpu_idle.c                 |  2 ++
>  xen/arch/x86/acpi/cpufreq/hwp.c              |  6 ++++++
>  xen/arch/x86/acpi/cpufreq/powernow.c         |  4 ++++
>  xen/common/Kconfig                           |  5 +++++
>  xen/common/sysctl.c                          |  4 ++--
>  xen/drivers/acpi/Makefile                    |  2 +-
>  xen/drivers/cpufreq/cpufreq_misc_governors.c |  2 ++
>  xen/drivers/cpufreq/cpufreq_ondemand.c       |  2 ++
>  xen/include/acpi/cpufreq/processor_perf.h    | 14 ++++++++++++++
>  9 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index 420198406d..b537ac4cd6 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -1487,6 +1487,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
>          vendor_override = -1;
>  }
>  
> +#ifdef CONFIG_PM_STATS
>  uint32_t pmstat_get_cx_nr(unsigned int cpu)
>  {
>      return processor_powers[cpu] ? processor_powers[cpu]->count : 0;
> @@ -1606,6 +1607,7 @@ int pmstat_reset_cx_stat(unsigned int cpu)
>  {
>      return 0;
>  }
> +#endif /* CONFIG_PM_STATS */
>  
>  void cpuidle_disable_deep_cstate(void)
>  {
> diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
> index d5fa3d47ca..98e9d46890 100644
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -466,6 +466,7 @@ static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
>      return 0;
>  }
>  
> +#ifdef CONFIG_PM_STATS
>  /*
>   * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
>   * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
> @@ -508,6 +509,7 @@ static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *
>  
>      return per_cpu(hwp_drv_data, cpu)->ret;
>  }
> +#endif /* CONFIG_PM_STATS */
>  
>  static const struct cpufreq_driver __initconst_cf_clobber
>  hwp_cpufreq_driver = {
> @@ -516,9 +518,12 @@ hwp_cpufreq_driver = {
>      .target = hwp_cpufreq_target,
>      .init   = hwp_cpufreq_cpu_init,
>      .exit   = hwp_cpufreq_cpu_exit,
> +#ifdef CONFIG_PM_STATS
>      .update = hwp_cpufreq_update,
> +#endif
>  };

Something's wrong here: The .update hook is actually making changes, so is
definitely not (only) about statistics. Same for the powernow driver.

> +#ifdef CONFIG_PM_STATS
>  int get_hwp_para(unsigned int cpu,
>                   struct xen_cppc_para *cppc_para)
>  {
> @@ -639,6 +644,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
>  
>      return hwp_cpufreq_target(policy, 0, 0);
>  }
> +#endif /* CONFIG_PM_STATS */

This also isn't about statistics, but about getting / setting parameters.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -557,4 +557,9 @@ config SYSCTL
>  	  to reduce Xen footprint.
>  endmenu
>  
> +config PM_STATS
> +	bool "Enable Performance Management Statistics"
> +	depends on ACPI && HAS_CPUFREQ && SYSCTL
> +	default y

As per above - either name, prompt and the description that Stefano suggested
are wrong, or it is too much that is being covered by this new control.

> --- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
> +++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
> @@ -64,6 +64,7 @@ static int cf_check cpufreq_governor_userspace(
>      return ret;
>  }
>  
> +#ifdef CONFIG_PM_STATS
>  int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
>  {
>      struct cpufreq_policy *policy;
> @@ -80,6 +81,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
>  
>      return __cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
>  }
> +#endif /* CONFIG_PM_STATS */

Here the name of the function also makes pretty clear that it isn't about
statistics.

> --- a/xen/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
> @@ -57,6 +57,7 @@ static struct dbs_tuners {
>  
>  static DEFINE_PER_CPU(struct timer, dbs_timer);
>  
> +#ifdef CONFIG_PM_STATS
>  int write_ondemand_sampling_rate(unsigned int sampling_rate)
>  {
>      if ( (sampling_rate > MAX_SAMPLING_RATE / MICROSECS(1)) ||
> @@ -93,6 +94,7 @@ int get_cpufreq_ondemand_para(uint32_t *sampling_rate_max,
>  
>      return 0;
>  }
> +#endif /* CONFIG_PM_STATS */

Same for the ones here.

> --- a/xen/include/acpi/cpufreq/processor_perf.h
> +++ b/xen/include/acpi/cpufreq/processor_perf.h
> @@ -9,9 +9,23 @@
>  
>  unsigned int powernow_register_driver(void);
>  unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
> +#ifdef CONFIG_PM_STATS
>  void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to);
>  int  cpufreq_statistic_init(unsigned int cpu);
>  void cpufreq_statistic_exit(unsigned int cpu);
> +#else
> +static inline void cpufreq_statistic_update(unsigned int cpu, uint8_t from,
> +                                            uint8_t to)
> +{
> +}

This could do with both braces moved to the line with the closing parenthesis.

> +static inline int cpufreq_statistic_init(unsigned int cpu)
> +{
> +    return 0;
> +}
> +static inline void cpufreq_statistic_exit(unsigned int cpu)
> +{
> +}

Same here.

Jan

