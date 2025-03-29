Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1DA753BC
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931389.1333752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyKB8-0005fq-Px; Sat, 29 Mar 2025 00:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931389.1333752; Sat, 29 Mar 2025 00:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyKB8-0005eI-N9; Sat, 29 Mar 2025 00:36:02 +0000
Received: by outflank-mailman (input) for mailman id 931389;
 Sat, 29 Mar 2025 00:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyKB7-0005eC-En
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:36:01 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8a2457b-0c35-11f0-9ea4-5ba50f476ded;
 Sat, 29 Mar 2025 01:35:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75993A4305F;
 Sat, 29 Mar 2025 00:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13CEC4CEE4;
 Sat, 29 Mar 2025 00:35:56 +0000 (UTC)
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
X-Inumbo-ID: c8a2457b-0c35-11f0-9ea4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743208557;
	bh=Uq3LELn23WlkWAiGQjEVpzLGWJDOktDlK4ERsLfafDY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J2gfrfBXgBcnu/MDp73A8Fy2J0olq2BRu5q5S3nG86bTsCggllh8Rh7/zPiczNBkr
	 hb6wH34pumKPYhRlj5upuRPlAIPTuIXsTj0cuBiOrqrfm5LfR4Nx5YbFxhMtRR5pdG
	 AvmQkwZjHBml7wusrTz0fq+eXcyeFmLSnw0cvGSw7UwtzQrPfmwXkUSCJCs+IdiUN3
	 XKeOTnaPZ+2b7CNS4xtHRkyMQPo5xx4RrtamP2QgtgD8gC42IwDUCBVCXgKpivQ7n/
	 TnIVhrPzNmQmNoYB7DrtA+6toLZWIa/QL6qctWmlmHXrVOsufYR6q1j0Akq7eCwCCE
	 NhM2Msgo7s4CA==
Date: Fri, 28 Mar 2025 17:35:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
In-Reply-To: <20250326055053.3313146-11-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281734020.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-11-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
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
>  
> +#ifdef CONFIG_PM_STATS
>  int get_hwp_para(unsigned int cpu,
>                   struct xen_cppc_para *cppc_para)
>  {
> @@ -639,6 +644,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
>  
>      return hwp_cpufreq_target(policy, 0, 0);
>  }
> +#endif /* CONFIG_PM_STATS */
>  
>  int __init hwp_register_driver(void)
>  {
> diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
> index 69364e1855..08494d0902 100644
> --- a/xen/arch/x86/acpi/cpufreq/powernow.c
> +++ b/xen/arch/x86/acpi/cpufreq/powernow.c
> @@ -49,6 +49,7 @@ static void cf_check transition_pstate(void *pstate)
>      wrmsrl(MSR_PSTATE_CTRL, *(unsigned int *)pstate);
>  }
>  
> +#ifdef CONFIG_PM_STATS
>  static void cf_check update_cpb(void *data)
>  {
>      struct cpufreq_policy *policy = data;
> @@ -77,6 +78,7 @@ static int cf_check powernow_cpufreq_update(
>  
>      return 0;
>  }
> +#endif /* CONFIG_PM_STATS */
>  
>  static int cf_check powernow_cpufreq_target(
>      struct cpufreq_policy *policy,
> @@ -324,7 +326,9 @@ powernow_cpufreq_driver = {
>      .target = powernow_cpufreq_target,
>      .init   = powernow_cpufreq_cpu_init,
>      .exit   = powernow_cpufreq_cpu_exit,
> +#ifdef CONFIG_PM_STATS
>      .update = powernow_cpufreq_update
> +#endif
>  };
>  
>  unsigned int __init powernow_register_driver(void)
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 5b55ca6eaa..426fa8fcc2 100644
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

This is visible so it would need a description, such as:

 Enable collection of performance management statistics to aid in
 analyzing and tuning power/performance characteristics of the system.

 This option may introduce slight overhead due to additional tracking.

