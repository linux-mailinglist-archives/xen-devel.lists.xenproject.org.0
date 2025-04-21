Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C860A957CE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 23:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961508.1352906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yRi-0005ko-EB; Mon, 21 Apr 2025 21:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961508.1352906; Mon, 21 Apr 2025 21:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yRi-0005jM-AJ; Mon, 21 Apr 2025 21:12:54 +0000
Received: by outflank-mailman (input) for mailman id 961508;
 Mon, 21 Apr 2025 21:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u6yRg-0005jG-7n
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 21:12:52 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61981bca-1ef5-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 23:12:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6203A6115F;
 Mon, 21 Apr 2025 21:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C48C4CEE4;
 Mon, 21 Apr 2025 21:12:47 +0000 (UTC)
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
X-Inumbo-ID: 61981bca-1ef5-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745269969;
	bh=x4Ry+yAMLjZjX6wy72FRDXG21CUUF3lvgFzBcYje9IE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Aiih96HbRAfbAREfVZ06fr3pAyWcb9lEbsScvw08zkvmJtcNNXM2HDlKNxeFfoDFR
	 aBX+6fdA+LDKAqC1vklTotXeW1lasUEJKd8E1iBxepfPeHigMjOap9NN7MOS3ihSeU
	 p+EBW0LAsyNSfWYxQUTEEPRetJ48mc/mod5EUDtAAMVLXJ89ABGEGSMgOp7sEFnPWe
	 qtYEvpFo18DJIfAZv/pGe2vHKiNWnBa9COdAv51hrxQUzAei61aOab6yttdc1ug9GA
	 imoPfFsA+xMyjyAmj6skHiwF40hT0syzHGFVHDwREy4YGtYFif4HA6Ez+yWXN3Wgrf
	 yTCAv6zKnCGJg==
Date: Mon, 21 Apr 2025 14:12:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 11/20] xen/sysctl: introduce CONFIG_PM_STATS
In-Reply-To: <20250421073723.3863060-12-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504211412370.785180@ubuntu-linux-20-04-desktop>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com> <20250421073723.3863060-12-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Apr 2025, Penny Zheng wrote:
> We introduce a new Kconfig CONFIG_PM_STATS for wrapping all operations
> regarding performance management statistics.
> The major codes reside in xen/drivers/acpi/pmstat.c, including the
> pm-statistic-related sysctl op: do_get_pm_info().
> CONFIG_PM_STATS also shall depend on CONFIG_SYSCTL
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v1 -> v2:
> - rename to CONFIG_PM_STATS
> - fix indention and stray semicolon
> - make code movements into a new commit
> - No need to wrap inline functions and declarations
> ---
> v2 -> v3:
> - sepearte functions related to do_pm_op() into a new commit
> - both braces shall be moved to the line with the closing parenthesis
> ---
>  xen/arch/x86/acpi/cpu_idle.c              |  2 ++
>  xen/common/Kconfig                        |  8 ++++++++
>  xen/common/sysctl.c                       |  4 ++--
>  xen/drivers/acpi/Makefile                 |  2 +-
>  xen/include/acpi/cpufreq/processor_perf.h | 10 ++++++++++
>  5 files changed, 23 insertions(+), 3 deletions(-)
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
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index ca1f692487..d8e242eebc 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -600,4 +600,12 @@ config PM_OP
>  	help
>  	  This option shall enable userspace performance management control
>  	  to do power/performance analyzing and tuning.
> +
> +config PM_STATS
> +	bool "Enable Performance Management Statistics"
> +	depends on ACPI && HAS_CPUFREQ && SYSCTL
> +	default y
> +	help
> +	  Enable collection of performance management statistics to aid in
> +	  analyzing and tuning power/performance characteristics of the system
>  endmenu
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 4ab827b694..baaad3bd42 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -177,11 +177,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          op->u.availheap.avail_bytes <<= PAGE_SHIFT;
>          break;
>  
> -#if defined (CONFIG_ACPI) && defined (CONFIG_HAS_CPUFREQ)
> +#ifdef CONFIG_PM_STATS
>      case XEN_SYSCTL_get_pmstat:
>          ret = do_get_pm_info(&op->u.get_pmstat);
>          break;
> -#endif
> +#endif /* CONFIG_PM_STATS */
>  
>  #ifdef CONFIG_PM_OP
>      case XEN_SYSCTL_pm_op:
> diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
> index e1f84a4468..b52b006100 100644
> --- a/xen/drivers/acpi/Makefile
> +++ b/xen/drivers/acpi/Makefile
> @@ -5,7 +5,7 @@ obj-$(CONFIG_X86) += apei/
>  obj-bin-y += tables.init.o
>  obj-$(CONFIG_ACPI_NUMA) += numa.o
>  obj-y += osl.o
> -obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
> +obj-$(CONFIG_PM_STATS) += pmstat.o
>  obj-$(CONFIG_PM_OP) += pm_op.o
>  
>  obj-$(CONFIG_X86) += hwregs.o
> diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
> index 6de43f8602..a9a3b7a372 100644
> --- a/xen/include/acpi/cpufreq/processor_perf.h
> +++ b/xen/include/acpi/cpufreq/processor_perf.h
> @@ -9,9 +9,19 @@
>  
>  unsigned int powernow_register_driver(void);
>  unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
> +#ifdef CONFIG_PM_STATS
>  void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to);
>  int  cpufreq_statistic_init(unsigned int cpu);
>  void cpufreq_statistic_exit(unsigned int cpu);
> +#else
> +static inline void cpufreq_statistic_update(unsigned int cpu, uint8_t from,
> +                                            uint8_t to) {}
> +static inline int cpufreq_statistic_init(unsigned int cpu)
> +{
> +    return 0;
> +}
> +static inline void cpufreq_statistic_exit(unsigned int cpu) {}
> +#endif /* CONFIG_PM_STATS */
>  
>  int  cpufreq_limit_change(unsigned int cpu);
>  
> -- 
> 2.34.1
> 

