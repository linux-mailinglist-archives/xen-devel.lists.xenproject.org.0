Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C560F8C4A6E
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 02:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721100.1124245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6fxn-0001gj-Dh; Tue, 14 May 2024 00:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721100.1124245; Tue, 14 May 2024 00:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6fxn-0001eD-9u; Tue, 14 May 2024 00:24:15 +0000
Received: by outflank-mailman (input) for mailman id 721100;
 Tue, 14 May 2024 00:24:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5lq=MR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s6fxm-0001e7-JW
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 00:24:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4949fa2a-1188-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 02:24:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C618A610A2;
 Tue, 14 May 2024 00:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86509C113CC;
 Tue, 14 May 2024 00:24:09 +0000 (UTC)
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
X-Inumbo-ID: 4949fa2a-1188-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715646250;
	bh=GTyUx+S4XjZAH9bQEvATf+/466qA4dwSdokCELs0Y1E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ECyGqjk1yxXFD/EtC1w/pC3lmpCR2YNqoKk4/8yTeNIa5XKn5a2a4/JYwzl4pQ0GI
	 DZ58V0lOvSOoAxVR1LkDitzfc5qXwXq3TH0V8YtgE9PXSmD3zkq7SHgCBLXeTD7NfH
	 /1Z8roVBSY2JkPqnohPeFmtR/cnywis7IaP22URgpurZj/SeFa0H8SLNcwuaB/JiWI
	 f9+ZQHEyjkrArtpWn4xuNqzdTViTSE3PGQk8MYsO4i1KBfTHKRRVGY3qt2A7Ai7zF2
	 EHo6jgIpvKrT0Yz/itRz622KtI4AoGBdJEVroGshIyqQ+Yt5RGAXmvrT7IgTBmM2jw
	 q2skhsNUDTw+g==
Date: Mon, 13 May 2024 17:24:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] x86/cpufreq: Rename cpuid variable/parameters to cpu
In-Reply-To: <20240511194237.2596271-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405131723240.2544314@ubuntu-linux-20-04-desktop>
References: <20240511194237.2596271-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1955509460-1715646250=:2544314"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1955509460-1715646250=:2544314
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 11 May 2024, Andrew Cooper wrote:
> Various functions have a parameter or local variable called cpuid, but this
> triggers a MISRA R5.3 violation because we also have a function called cpuid()
> which wraps the real CPUID instruction.
> 
> In all these cases, it's a Xen cpu index, which is far more commonly named
> just cpu in our code.
> 
> While adjusting these, fix a couple of other issues:
> 
>  * cpufreq_cpu_init() is on the end of a hypercall (with in-memory parameters,
>    even), making EFAULT the wrong error to use.  Use EOPNOTSUPP instead.
> 
>  * check_est_cpu() is wrong to tie EIST to just Intel, and nowhere else using
>    EIST makes this restriction.  Just check the feature itself, which is more
>    succinctly done after being folded into its single caller.
> 
>  * In powernow_cpufreq_update(), replace an opencoded cpu_online().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> 
> cpu needs to stay signed for now in set_px_pminfo(), because of get_cpu_id().
> This can be cleaned up by making better use of BAD_APICID, but that's a much
> more involved change.
> ---
>  xen/arch/x86/acpi/cpu_idle.c              | 14 ++++----
>  xen/arch/x86/acpi/cpufreq/cpufreq.c       | 24 +++----------
>  xen/arch/x86/acpi/cpufreq/hwp.c           |  6 ++--
>  xen/arch/x86/acpi/cpufreq/powernow.c      |  6 ++--
>  xen/drivers/cpufreq/cpufreq.c             | 18 +++++-----
>  xen/drivers/cpufreq/utility.c             | 43 +++++++++++------------
>  xen/include/acpi/cpufreq/cpufreq.h        |  6 ++--
>  xen/include/acpi/cpufreq/processor_perf.h |  8 ++---
>  xen/include/xen/pmstat.h                  |  6 ++--
>  9 files changed, 57 insertions(+), 74 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index cfce4cc0408f..c8db1aa9913a 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -1498,14 +1498,14 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
>          vendor_override = -1;
>  }
>  
> -uint32_t pmstat_get_cx_nr(uint32_t cpuid)
> +uint32_t pmstat_get_cx_nr(unsigned int cpu)
>  {
> -    return processor_powers[cpuid] ? processor_powers[cpuid]->count : 0;
> +    return processor_powers[cpu] ? processor_powers[cpu]->count : 0;
>  }
>  
> -int pmstat_get_cx_stat(uint32_t cpuid, struct pm_cx_stat *stat)
> +int pmstat_get_cx_stat(unsigned int cpu, struct pm_cx_stat *stat)
>  {
> -    struct acpi_processor_power *power = processor_powers[cpuid];
> +    struct acpi_processor_power *power = processor_powers[cpu];
>      uint64_t idle_usage = 0, idle_res = 0;
>      uint64_t last_state_update_tick, current_stime, current_tick;
>      uint64_t usage[ACPI_PROCESSOR_MAX_POWER] = { 0 };
> @@ -1522,7 +1522,7 @@ int pmstat_get_cx_stat(uint32_t cpuid, struct pm_cx_stat *stat)
>          return 0;
>      }
>  
> -    stat->idle_time = get_cpu_idle_time(cpuid);
> +    stat->idle_time = get_cpu_idle_time(cpu);
>      nr = min(stat->nr, power->count);
>  
>      /* mimic the stat when detail info hasn't been registered by dom0 */
> @@ -1572,7 +1572,7 @@ int pmstat_get_cx_stat(uint32_t cpuid, struct pm_cx_stat *stat)
>              idle_res += res[i];
>          }
>  
> -        get_hw_residencies(cpuid, &hw_res);
> +        get_hw_residencies(cpu, &hw_res);
>  
>  #define PUT_xC(what, n) do { \
>          if ( stat->nr_##what >= n && \
> @@ -1613,7 +1613,7 @@ int pmstat_get_cx_stat(uint32_t cpuid, struct pm_cx_stat *stat)
>      return 0;
>  }
>  
> -int pmstat_reset_cx_stat(uint32_t cpuid)
> +int pmstat_reset_cx_stat(unsigned int cpu)
>  {
>      return 0;
>  }
> diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> index 2b6ef99678ae..a341f2f02063 100644
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -55,17 +55,6 @@ struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
>  static bool __read_mostly acpi_pstate_strict;
>  boolean_param("acpi_pstate_strict", acpi_pstate_strict);
>  
> -static int check_est_cpu(unsigned int cpuid)
> -{
> -    struct cpuinfo_x86 *cpu = &cpu_data[cpuid];
> -
> -    if (cpu->x86_vendor != X86_VENDOR_INTEL ||
> -        !cpu_has(cpu, X86_FEATURE_EIST))
> -        return 0;
> -
> -    return 1;
> -}
> -
>  static unsigned extract_io(u32 value, struct acpi_cpufreq_data *data)
>  {
>      struct processor_performance *perf;
> @@ -530,7 +519,7 @@ static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
>          if (cpufreq_verbose)
>              printk("xen_pminfo: @acpi_cpufreq_cpu_init,"
>                     "HARDWARE addr space\n");
> -        if (!check_est_cpu(cpu)) {
> +        if (!cpu_has(c, X86_FEATURE_EIST)) {
>              result = -ENODEV;
>              goto err_unreg;
>          }
> @@ -690,15 +679,12 @@ static int __init cf_check cpufreq_driver_late_init(void)
>  }
>  __initcall(cpufreq_driver_late_init);
>  
> -int cpufreq_cpu_init(unsigned int cpuid)
> +int cpufreq_cpu_init(unsigned int cpu)
>  {
> -    int ret;
> -
>      /* Currently we only handle Intel, AMD and Hygon processor */
>      if ( boot_cpu_data.x86_vendor &
>           (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
> -        ret = cpufreq_add_cpu(cpuid);
> -    else
> -        ret = -EFAULT;
> -    return ret;
> +        return cpufreq_add_cpu(cpu);
> +
> +    return -EOPNOTSUPP;
>  }
> diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
> index e61212803e71..59b57a4cef86 100644
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -506,11 +506,11 @@ static void cf_check hwp_set_misc_turbo(void *info)
>      }
>  }
>  
> -static int cf_check hwp_cpufreq_update(int cpuid, struct cpufreq_policy *policy)
> +static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *policy)
>  {
> -    on_selected_cpus(cpumask_of(cpuid), hwp_set_misc_turbo, policy, 1);
> +    on_selected_cpus(cpumask_of(cpu), hwp_set_misc_turbo, policy, 1);
>  
> -    return per_cpu(hwp_drv_data, cpuid)->ret;
> +    return per_cpu(hwp_drv_data, cpu)->ret;
>  }
>  
>  static const struct cpufreq_driver __initconst_cf_clobber
> diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
> index 8a27ee82a5b0..69364e185562 100644
> --- a/xen/arch/x86/acpi/cpufreq/powernow.c
> +++ b/xen/arch/x86/acpi/cpufreq/powernow.c
> @@ -68,12 +68,12 @@ static void cf_check update_cpb(void *data)
>  }
>  
>  static int cf_check powernow_cpufreq_update(
> -    int cpuid, struct cpufreq_policy *policy)
> +    unsigned int cpu, struct cpufreq_policy *policy)
>  {
> -    if (!cpumask_test_cpu(cpuid, &cpu_online_map))
> +    if ( !cpu_online(cpu) )
>          return -EINVAL;
>  
> -    on_selected_cpus(cpumask_of(cpuid), update_cpb, policy, 1);
> +    on_selected_cpus(cpumask_of(cpu), update_cpb, policy, 1);
>  
>      return 0;
>  }
> diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
> index 36c800f4fa39..a74593b70577 100644
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -459,21 +459,21 @@ static void print_PPC(unsigned int platform_limit)
>  
>  int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
>  {
> -    int ret=0, cpuid;
> +    int ret=0, cpu;
>      struct processor_pminfo *pmpt;
>      struct processor_performance *pxpt;
>  
> -    cpuid = get_cpu_id(acpi_id);
> -    if ( cpuid < 0 || !perf )
> +    cpu = get_cpu_id(acpi_id);
> +    if ( cpu < 0 || !perf )
>      {
>          ret = -EINVAL;
>          goto out;
>      }
>      if ( cpufreq_verbose )
> -        printk("Set CPU acpi_id(%d) cpuid(%d) Px State info:\n",
> +        printk("Set CPU acpi_id(%d) cpu(%d) Px State info:\n",
>                 acpi_id, cpuid);

This cpuid should be changed as well?

Everything else looks OK to me. You can fix on commit.
--8323329-1955509460-1715646250=:2544314--

