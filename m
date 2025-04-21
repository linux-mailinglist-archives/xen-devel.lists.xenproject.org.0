Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08549A957BE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 23:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961493.1352895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yOL-0003pl-R7; Mon, 21 Apr 2025 21:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961493.1352895; Mon, 21 Apr 2025 21:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yOL-0003n1-Nm; Mon, 21 Apr 2025 21:09:25 +0000
Received: by outflank-mailman (input) for mailman id 961493;
 Mon, 21 Apr 2025 21:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u6yOJ-0003mv-T6
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 21:09:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4a3482b-1ef4-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 23:09:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2A5E5C4A70;
 Mon, 21 Apr 2025 21:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1AEC4CEE4;
 Mon, 21 Apr 2025 21:09:17 +0000 (UTC)
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
X-Inumbo-ID: e4a3482b-1ef4-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745269759;
	bh=9/XThAiTYoti++2Gk3GjxkMBDXGF5LVzbsq2x18tZEA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=edPlcV+z4gPKbJiHmzGl1JWm6xlO22M+Zx+MEylmc11IGNUevyQU6vrFaub950BIY
	 /NayPrG9dnn+nKrc+Gy0EJ5IrqmTlPMkuarnEUNq5Rj0RRWELtHQSETZOOWkpz/b0P
	 bZn5ExZGHO+Tf/vKckGHencRCWGtAj5vnqxlT67u7Eyg5/jSR7dCDScl2XVR66wklW
	 HBANgguRHlUE2brDlhl4J4gkby9PJSIeJPmhnIgMYhLHEQNAw9p7qDq1G1tznnkiZc
	 ywUd7l1yIU11eaLGoY5vhv9DYx3kiqKLC21/jnZ7kTiT+HEaHvpM5KXbBEIWQtM3Mo
	 m8zemT9nuUbXQ==
Date: Mon, 21 Apr 2025 14:09:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 10/20] xen/pmstat: introduce CONFIG_PM_OP
In-Reply-To: <20250421073723.3863060-11-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504211408590.785180@ubuntu-linux-20-04-desktop>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com> <20250421073723.3863060-11-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Apr 2025, Penny Zheng wrote:
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

I manually checked the code movement for correctness

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



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
> 
> diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
> index d5fa3d47ca..e4c09244ab 100644
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -466,6 +466,7 @@ static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
>      return 0;
>  }
>  
> +#ifdef CONFIG_PM_OP
>  /*
>   * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
>   * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
> @@ -508,6 +509,7 @@ static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *
>  
>      return per_cpu(hwp_drv_data, cpu)->ret;
>  }
> +#endif /* CONFIG_PM_OP */
>  
>  static const struct cpufreq_driver __initconst_cf_clobber
>  hwp_cpufreq_driver = {
> @@ -516,9 +518,12 @@ hwp_cpufreq_driver = {
>      .target = hwp_cpufreq_target,
>      .init   = hwp_cpufreq_cpu_init,
>      .exit   = hwp_cpufreq_cpu_exit,
> +#ifdef CONFIG_PM_OP
>      .update = hwp_cpufreq_update,
> +#endif
>  };
>  
> +#ifdef CONFIG_PM_OP
>  int get_hwp_para(unsigned int cpu,
>                   struct xen_cppc_para *cppc_para)
>  {
> @@ -639,6 +644,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
>  
>      return hwp_cpufreq_target(policy, 0, 0);
>  }
> +#endif /* CONFIG_PM_OP */
>  
>  int __init hwp_register_driver(void)
>  {
> diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
> index 69364e1855..12fca45b45 100644
> --- a/xen/arch/x86/acpi/cpufreq/powernow.c
> +++ b/xen/arch/x86/acpi/cpufreq/powernow.c
> @@ -49,6 +49,7 @@ static void cf_check transition_pstate(void *pstate)
>      wrmsrl(MSR_PSTATE_CTRL, *(unsigned int *)pstate);
>  }
>  
> +#ifdef CONFIG_PM_OP
>  static void cf_check update_cpb(void *data)
>  {
>      struct cpufreq_policy *policy = data;
> @@ -77,6 +78,7 @@ static int cf_check powernow_cpufreq_update(
>  
>      return 0;
>  }
> +#endif /* CONFIG_PM_OP */
>  
>  static int cf_check powernow_cpufreq_target(
>      struct cpufreq_policy *policy,
> @@ -324,7 +326,9 @@ powernow_cpufreq_driver = {
>      .target = powernow_cpufreq_target,
>      .init   = powernow_cpufreq_cpu_init,
>      .exit   = powernow_cpufreq_cpu_exit,
> +#ifdef CONFIG_PM_OP
>      .update = powernow_cpufreq_update
> +#endif
>  };
>  
>  unsigned int __init powernow_register_driver(void)
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 9cccc37232..ca1f692487 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -593,4 +593,11 @@ config SYSCTL
>  	  to reduce Xen footprint.
>  endmenu
>  
> +config PM_OP
> +	bool "Enable Performance Management Operation"
> +	depends on ACPI && HAS_CPUFREQ && SYSCTL
> +	default y
> +	help
> +	  This option shall enable userspace performance management control
> +	  to do power/performance analyzing and tuning.
>  endmenu
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 2fe76362b1..4ab827b694 100644
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
>  
>      case XEN_SYSCTL_page_offline_op:
>      {
> diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
> index 2fc5230253..e1f84a4468 100644
> --- a/xen/drivers/acpi/Makefile
> +++ b/xen/drivers/acpi/Makefile
> @@ -6,6 +6,7 @@ obj-bin-y += tables.init.o
>  obj-$(CONFIG_ACPI_NUMA) += numa.o
>  obj-y += osl.o
>  obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
> +obj-$(CONFIG_PM_OP) += pm_op.o
>  
>  obj-$(CONFIG_X86) += hwregs.o
>  obj-$(CONFIG_X86) += reboot.o
> diff --git a/xen/drivers/acpi/pm_op.c b/xen/drivers/acpi/pm_op.c
> new file mode 100644
> index 0000000000..3123cb9556
> --- /dev/null
> +++ b/xen/drivers/acpi/pm_op.c
> @@ -0,0 +1,409 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/acpi.h>
> +#include <xen/domain.h>
> +#include <xen/errno.h>
> +#include <xen/guest_access.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +
> +#include <acpi/cpufreq/cpufreq.h>
> +#include <public/platform.h>
> +#include <public/sysctl.h>
> +
> +/*
> + * 1. Get PM parameter
> + * 2. Provide user PM control
> + */
> +static int cpufreq_update_turbo(unsigned int cpu, int new_state)
> +{
> +    struct cpufreq_policy *policy;
> +    int curr_state;
> +    int ret = 0;
> +
> +    if ( new_state != CPUFREQ_TURBO_ENABLED &&
> +         new_state != CPUFREQ_TURBO_DISABLED )
> +        return -EINVAL;
> +
> +    policy = per_cpu(cpufreq_cpu_policy, cpu);
> +    if ( !policy )
> +        return -EACCES;
> +
> +    if ( policy->turbo == CPUFREQ_TURBO_UNSUPPORTED )
> +        return -EOPNOTSUPP;
> +
> +    curr_state = policy->turbo;
> +    if ( curr_state == new_state )
> +        return 0;
> +
> +    policy->turbo = new_state;
> +    if ( cpufreq_driver.update )
> +    {
> +        ret = alternative_call(cpufreq_driver.update, cpu, policy);
> +        if ( ret )
> +            policy->turbo = curr_state;
> +    }
> +
> +    return ret;
> +}
> +
> +static int cpufreq_get_turbo_status(unsigned int cpu)
> +{
> +    struct cpufreq_policy *policy;
> +
> +    policy = per_cpu(cpufreq_cpu_policy, cpu);
> +    return policy && policy->turbo == CPUFREQ_TURBO_ENABLED;
> +}
> +
> +static int read_scaling_available_governors(char *scaling_available_governors,
> +                                            unsigned int size)
> +{
> +    unsigned int i = 0;
> +    struct cpufreq_governor *t;
> +
> +    if ( !scaling_available_governors )
> +        return -EINVAL;
> +
> +    list_for_each_entry(t, &cpufreq_governor_list, governor_list)
> +    {
> +        i += scnprintf(&scaling_available_governors[i],
> +                       CPUFREQ_NAME_LEN, "%s ", t->name);
> +        if ( i > size )
> +            return -EINVAL;
> +    }
> +    scaling_available_governors[i-1] = '\0';
> +
> +    return 0;
> +}
> +
> +static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
> +{
> +    uint32_t ret = 0;
> +    const struct processor_pminfo *pmpt;
> +    struct cpufreq_policy *policy;
> +    uint32_t gov_num = 0;
> +    uint32_t *data;
> +    char     *scaling_available_governors;
> +    struct list_head *pos;
> +    unsigned int cpu, i = 0;
> +
> +    pmpt = processor_pminfo[op->cpuid];
> +    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> +
> +    if ( !pmpt || !pmpt->perf.states ||
> +         !policy || !policy->governor )
> +        return -EINVAL;
> +
> +    list_for_each(pos, &cpufreq_governor_list)
> +        gov_num++;
> +
> +    if ( (op->u.get_para.cpu_num  != cpumask_weight(policy->cpus)) ||
> +         (op->u.get_para.freq_num != pmpt->perf.state_count)    ||
> +         (op->u.get_para.gov_num  != gov_num) )
> +    {
> +        op->u.get_para.cpu_num =  cpumask_weight(policy->cpus);
> +        op->u.get_para.freq_num = pmpt->perf.state_count;
> +        op->u.get_para.gov_num  = gov_num;
> +        return -EAGAIN;
> +    }
> +
> +    if ( !(data = xzalloc_array(uint32_t,
> +                                max(op->u.get_para.cpu_num,
> +                                    op->u.get_para.freq_num))) )
> +        return -ENOMEM;
> +
> +    for_each_cpu(cpu, policy->cpus)
> +        data[i++] = cpu;
> +    ret = copy_to_guest(op->u.get_para.affected_cpus,
> +                        data, op->u.get_para.cpu_num);
> +
> +    for ( i = 0; i < op->u.get_para.freq_num; i++ )
> +        data[i] = pmpt->perf.states[i].core_frequency * 1000;
> +    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
> +                         data, op->u.get_para.freq_num);
> +
> +    xfree(data);
> +    if ( ret )
> +        return -EFAULT;
> +
> +    op->u.get_para.cpuinfo_cur_freq =
> +        cpufreq_driver.get ? alternative_call(cpufreq_driver.get, op->cpuid)
> +                           : policy->cur;
> +    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
> +    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
> +    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
> +
> +    if ( cpufreq_driver.name[0] )
> +        strlcpy(op->u.get_para.scaling_driver,
> +                cpufreq_driver.name, CPUFREQ_NAME_LEN);
> +    else
> +        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
> +
> +    if ( IS_ENABLED(CONFIG_INTEL) &&
> +         !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
> +                  CPUFREQ_NAME_LEN) )
> +        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
> +    else
> +    {
> +        if ( !(scaling_available_governors =
> +               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> +            return -ENOMEM;
> +        if ( (ret = read_scaling_available_governors(
> +                        scaling_available_governors,
> +                        (gov_num * CPUFREQ_NAME_LEN *
> +                         sizeof(*scaling_available_governors)))) )
> +        {
> +            xfree(scaling_available_governors);
> +            return ret;
> +        }
> +        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
> +                            scaling_available_governors,
> +                            gov_num * CPUFREQ_NAME_LEN);
> +        xfree(scaling_available_governors);
> +        if ( ret )
> +            return -EFAULT;
> +
> +        op->u.get_para.u.s.scaling_cur_freq = policy->cur;
> +        op->u.get_para.u.s.scaling_max_freq = policy->max;
> +        op->u.get_para.u.s.scaling_min_freq = policy->min;
> +
> +        if ( policy->governor->name[0] )
> +            strlcpy(op->u.get_para.u.s.scaling_governor,
> +                    policy->governor->name, CPUFREQ_NAME_LEN);
> +        else
> +            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> +                    CPUFREQ_NAME_LEN);
> +
> +        /* governor specific para */
> +        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> +                          "userspace", CPUFREQ_NAME_LEN) )
> +            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
> +
> +        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> +                          "ondemand", CPUFREQ_NAME_LEN) )
> +            ret = get_cpufreq_ondemand_para(
> +                &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
> +                &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
> +                &op->u.get_para.u.s.u.ondemand.sampling_rate,
> +                &op->u.get_para.u.s.u.ondemand.up_threshold);
> +    }
> +
> +    return ret;
> +}
> +
> +static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
> +{
> +    struct cpufreq_policy new_policy, *old_policy;
> +
> +    old_policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> +    if ( !old_policy )
> +        return -EINVAL;
> +
> +    memcpy(&new_policy, old_policy, sizeof(struct cpufreq_policy));
> +
> +    new_policy.governor = __find_governor(op->u.set_gov.scaling_governor);
> +    if ( new_policy.governor == NULL )
> +        return -EINVAL;
> +
> +    return __cpufreq_set_policy(old_policy, &new_policy);
> +}
> +
> +static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
> +{
> +    int ret = 0;
> +    struct cpufreq_policy *policy;
> +
> +    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> +
> +    if ( !policy || !policy->governor )
> +        return -EINVAL;
> +
> +    if ( hwp_active() )
> +        return -EOPNOTSUPP;
> +
> +    switch( op->u.set_para.ctrl_type )
> +    {
> +    case SCALING_MAX_FREQ:
> +    {
> +        struct cpufreq_policy new_policy;
> +
> +        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
> +        new_policy.max = op->u.set_para.ctrl_value;
> +        ret = __cpufreq_set_policy(policy, &new_policy);
> +
> +        break;
> +    }
> +
> +    case SCALING_MIN_FREQ:
> +    {
> +        struct cpufreq_policy new_policy;
> +
> +        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
> +        new_policy.min = op->u.set_para.ctrl_value;
> +        ret = __cpufreq_set_policy(policy, &new_policy);
> +
> +        break;
> +    }
> +
> +    case SCALING_SETSPEED:
> +    {
> +        unsigned int freq =op->u.set_para.ctrl_value;
> +
> +        if ( !strncasecmp(policy->governor->name,
> +                          "userspace", CPUFREQ_NAME_LEN) )
> +            ret = write_userspace_scaling_setspeed(op->cpuid, freq);
> +        else
> +            ret = -EINVAL;
> +
> +        break;
> +    }
> +
> +    case SAMPLING_RATE:
> +    {
> +        unsigned int sampling_rate = op->u.set_para.ctrl_value;
> +
> +        if ( !strncasecmp(policy->governor->name,
> +                          "ondemand", CPUFREQ_NAME_LEN) )
> +            ret = write_ondemand_sampling_rate(sampling_rate);
> +        else
> +            ret = -EINVAL;
> +
> +        break;
> +    }
> +
> +    case UP_THRESHOLD:
> +    {
> +        unsigned int up_threshold = op->u.set_para.ctrl_value;
> +
> +        if ( !strncasecmp(policy->governor->name,
> +                          "ondemand", CPUFREQ_NAME_LEN) )
> +            ret = write_ondemand_up_threshold(up_threshold);
> +        else
> +            ret = -EINVAL;
> +
> +        break;
> +    }
> +
> +    default:
> +        ret = -EINVAL;
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
> +{
> +    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> +
> +    if ( !policy || !policy->governor )
> +        return -ENOENT;
> +
> +    if ( !hwp_active() )
> +        return -EOPNOTSUPP;
> +
> +    return set_hwp_para(policy, &op->u.set_cppc);
> +}
> +
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
> +
> +    default:
> +        printk("not defined sub-hypercall @ do_pm_op\n");
> +        ret = -ENOSYS;
> +        break;
> +    }
> +
> +    return ret;
> +}
> diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
> index abfdc45cc2..61b60e59a2 100644
> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -330,360 +330,3 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
>  
>      return ret;
>  }
> -
> -/*
> - * 1. Get PM parameter
> - * 2. Provide user PM control
> - */
> -static int read_scaling_available_governors(char *scaling_available_governors,
> -                                            unsigned int size)
> -{
> -    unsigned int i = 0;
> -    struct cpufreq_governor *t;
> -
> -    if ( !scaling_available_governors )
> -        return -EINVAL;
> -
> -    list_for_each_entry(t, &cpufreq_governor_list, governor_list)
> -    {
> -        i += scnprintf(&scaling_available_governors[i],
> -                       CPUFREQ_NAME_LEN, "%s ", t->name);
> -        if ( i > size )
> -            return -EINVAL;
> -    }
> -    scaling_available_governors[i-1] = '\0';
> -
> -    return 0;
> -}
> -
> -static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
> -{
> -    uint32_t ret = 0;
> -    const struct processor_pminfo *pmpt;
> -    struct cpufreq_policy *policy;
> -    uint32_t gov_num = 0;
> -    uint32_t *data;
> -    char     *scaling_available_governors;
> -    struct list_head *pos;
> -    unsigned int cpu, i = 0;
> -
> -    pmpt = processor_pminfo[op->cpuid];
> -    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> -
> -    if ( !pmpt || !pmpt->perf.states ||
> -         !policy || !policy->governor )
> -        return -EINVAL;
> -
> -    list_for_each(pos, &cpufreq_governor_list)
> -        gov_num++;
> -
> -    if ( (op->u.get_para.cpu_num  != cpumask_weight(policy->cpus)) ||
> -         (op->u.get_para.freq_num != pmpt->perf.state_count)    ||
> -         (op->u.get_para.gov_num  != gov_num) )
> -    {
> -        op->u.get_para.cpu_num =  cpumask_weight(policy->cpus);
> -        op->u.get_para.freq_num = pmpt->perf.state_count;
> -        op->u.get_para.gov_num  = gov_num;
> -        return -EAGAIN;
> -    }
> -
> -    if ( !(data = xzalloc_array(uint32_t,
> -                                max(op->u.get_para.cpu_num,
> -                                    op->u.get_para.freq_num))) )
> -        return -ENOMEM;
> -
> -    for_each_cpu(cpu, policy->cpus)
> -        data[i++] = cpu;
> -    ret = copy_to_guest(op->u.get_para.affected_cpus,
> -                        data, op->u.get_para.cpu_num);
> -
> -    for ( i = 0; i < op->u.get_para.freq_num; i++ )
> -        data[i] = pmpt->perf.states[i].core_frequency * 1000;
> -    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
> -                         data, op->u.get_para.freq_num);
> -
> -    xfree(data);
> -    if ( ret )
> -        return -EFAULT;
> -
> -    op->u.get_para.cpuinfo_cur_freq =
> -        cpufreq_driver.get ? alternative_call(cpufreq_driver.get, op->cpuid)
> -                           : policy->cur;
> -    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
> -    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
> -    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
> -
> -    if ( cpufreq_driver.name[0] )
> -        strlcpy(op->u.get_para.scaling_driver,
> -            cpufreq_driver.name, CPUFREQ_NAME_LEN);
> -    else
> -        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
> -
> -    if ( IS_ENABLED(CONFIG_INTEL) &&
> -         !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
> -                  CPUFREQ_NAME_LEN) )
> -        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
> -    else
> -    {
> -        if ( !(scaling_available_governors =
> -               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> -            return -ENOMEM;
> -        if ( (ret = read_scaling_available_governors(
> -                        scaling_available_governors,
> -                        (gov_num * CPUFREQ_NAME_LEN *
> -                         sizeof(*scaling_available_governors)))) )
> -        {
> -            xfree(scaling_available_governors);
> -            return ret;
> -        }
> -        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
> -                            scaling_available_governors,
> -                            gov_num * CPUFREQ_NAME_LEN);
> -        xfree(scaling_available_governors);
> -        if ( ret )
> -            return -EFAULT;
> -
> -        op->u.get_para.u.s.scaling_cur_freq = policy->cur;
> -        op->u.get_para.u.s.scaling_max_freq = policy->max;
> -        op->u.get_para.u.s.scaling_min_freq = policy->min;
> -
> -        if ( policy->governor->name[0] )
> -            strlcpy(op->u.get_para.u.s.scaling_governor,
> -                policy->governor->name, CPUFREQ_NAME_LEN);
> -        else
> -            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> -                    CPUFREQ_NAME_LEN);
> -
> -        /* governor specific para */
> -        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> -                          "userspace", CPUFREQ_NAME_LEN) )
> -            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
> -
> -        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> -                          "ondemand", CPUFREQ_NAME_LEN) )
> -            ret = get_cpufreq_ondemand_para(
> -                &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
> -                &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
> -                &op->u.get_para.u.s.u.ondemand.sampling_rate,
> -                &op->u.get_para.u.s.u.ondemand.up_threshold);
> -    }
> -
> -    return ret;
> -}
> -
> -static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
> -{
> -    struct cpufreq_policy new_policy, *old_policy;
> -
> -    old_policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> -    if ( !old_policy )
> -        return -EINVAL;
> -
> -    memcpy(&new_policy, old_policy, sizeof(struct cpufreq_policy));
> -
> -    new_policy.governor = __find_governor(op->u.set_gov.scaling_governor);
> -    if (new_policy.governor == NULL)
> -        return -EINVAL;
> -
> -    return __cpufreq_set_policy(old_policy, &new_policy);
> -}
> -
> -static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
> -{
> -    int ret = 0;
> -    struct cpufreq_policy *policy;
> -
> -    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> -
> -    if ( !policy || !policy->governor )
> -        return -EINVAL;
> -
> -    if ( hwp_active() )
> -        return -EOPNOTSUPP;
> -
> -    switch(op->u.set_para.ctrl_type)
> -    {
> -    case SCALING_MAX_FREQ:
> -    {
> -        struct cpufreq_policy new_policy;
> -
> -        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
> -        new_policy.max = op->u.set_para.ctrl_value;
> -        ret = __cpufreq_set_policy(policy, &new_policy);
> -
> -        break;
> -    }
> -
> -    case SCALING_MIN_FREQ:
> -    {
> -        struct cpufreq_policy new_policy;
> -
> -        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
> -        new_policy.min = op->u.set_para.ctrl_value;
> -        ret = __cpufreq_set_policy(policy, &new_policy);
> -
> -        break;
> -    }
> -
> -    case SCALING_SETSPEED:
> -    {
> -        unsigned int freq =op->u.set_para.ctrl_value;
> -
> -        if ( !strncasecmp(policy->governor->name,
> -                          "userspace", CPUFREQ_NAME_LEN) )
> -            ret = write_userspace_scaling_setspeed(op->cpuid, freq);
> -        else
> -            ret = -EINVAL;
> -
> -        break;
> -    }
> -
> -    case SAMPLING_RATE:
> -    {
> -        unsigned int sampling_rate = op->u.set_para.ctrl_value;
> -
> -        if ( !strncasecmp(policy->governor->name,
> -                          "ondemand", CPUFREQ_NAME_LEN) )
> -            ret = write_ondemand_sampling_rate(sampling_rate);
> -        else
> -            ret = -EINVAL;
> -
> -        break;
> -    }
> -
> -    case UP_THRESHOLD:
> -    {
> -        unsigned int up_threshold = op->u.set_para.ctrl_value;
> -
> -        if ( !strncasecmp(policy->governor->name,
> -                          "ondemand", CPUFREQ_NAME_LEN) )
> -            ret = write_ondemand_up_threshold(up_threshold);
> -        else
> -            ret = -EINVAL;
> -
> -        break;
> -    }
> -
> -    default:
> -        ret = -EINVAL;
> -        break;
> -    }
> -
> -    return ret;
> -}
> -
> -static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
> -{
> -    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> -
> -    if ( !policy || !policy->governor )
> -        return -ENOENT;
> -
> -    if ( !hwp_active() )
> -        return -EOPNOTSUPP;
> -
> -    return set_hwp_para(policy, &op->u.set_cppc);
> -}
> -
> -int do_pm_op(struct xen_sysctl_pm_op *op)
> -{
> -    int ret = 0;
> -    const struct processor_pminfo *pmpt;
> -
> -    switch ( op->cmd )
> -    {
> -    case XEN_SYSCTL_pm_op_set_sched_opt_smt:
> -    {
> -        uint32_t saved_value = sched_smt_power_savings;
> -
> -        if ( op->cpuid != 0 )
> -            return -EINVAL;
> -        sched_smt_power_savings = !!op->u.set_sched_opt_smt;
> -        op->u.set_sched_opt_smt = saved_value;
> -        return 0;
> -    }
> -
> -    case XEN_SYSCTL_pm_op_get_max_cstate:
> -        BUILD_BUG_ON(XEN_SYSCTL_CX_UNLIMITED != UINT_MAX);
> -        if ( op->cpuid == 0 )
> -            op->u.get_max_cstate = acpi_get_cstate_limit();
> -        else if ( op->cpuid == 1 )
> -            op->u.get_max_cstate = acpi_get_csubstate_limit();
> -        else
> -            ret = -EINVAL;
> -        return ret;
> -
> -    case XEN_SYSCTL_pm_op_set_max_cstate:
> -        if ( op->cpuid == 0 )
> -            acpi_set_cstate_limit(op->u.set_max_cstate);
> -        else if ( op->cpuid == 1 )
> -            acpi_set_csubstate_limit(op->u.set_max_cstate);
> -        else
> -            ret = -EINVAL;
> -        return ret;
> -    }
> -
> -    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
> -        return -EINVAL;
> -    pmpt = processor_pminfo[op->cpuid];
> -
> -    switch ( op->cmd & PM_PARA_CATEGORY_MASK )
> -    {
> -    case CPUFREQ_PARA:
> -        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
> -            return -ENODEV;
> -        if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
> -            return -EINVAL;
> -        break;
> -    }
> -
> -    switch ( op->cmd )
> -    {
> -    case GET_CPUFREQ_PARA:
> -    {
> -        ret = get_cpufreq_para(op);
> -        break;
> -    }
> -
> -    case SET_CPUFREQ_GOV:
> -    {
> -        ret = set_cpufreq_gov(op);
> -        break;
> -    }
> -
> -    case SET_CPUFREQ_PARA:
> -    {
> -        ret = set_cpufreq_para(op);
> -        break;
> -    }
> -
> -    case SET_CPUFREQ_CPPC:
> -        ret = set_cpufreq_cppc(op);
> -        break;
> -
> -    case GET_CPUFREQ_AVGFREQ:
> -    {
> -        op->u.get_avgfreq = cpufreq_driver_getavg(op->cpuid, USR_GETAVG);
> -        break;
> -    }
> -
> -    case XEN_SYSCTL_pm_op_enable_turbo:
> -    {
> -        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_ENABLED);
> -        break;
> -    }
> -
> -    case XEN_SYSCTL_pm_op_disable_turbo:
> -    {
> -        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_DISABLED);
> -        break;
> -    }
> -
> -    default:
> -        printk("not defined sub-hypercall @ do_pm_op\n");
> -        ret = -ENOSYS;
> -        break;
> -    }
> -
> -    return ret;
> -}
> diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
> index 0327fad23b..e5cb9ab02f 100644
> --- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
> +++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
> @@ -64,6 +64,7 @@ static int cf_check cpufreq_governor_userspace(
>      return ret;
>  }
>  
> +#ifdef CONFIG_PM_OP
>  int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
>  {
>      struct cpufreq_policy *policy;
> @@ -80,6 +81,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
>  
>      return __cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
>  }
> +#endif /* CONFIG_PM_OP */
>  
>  static bool __init cf_check
>  cpufreq_userspace_handle_option(const char *name, const char *val)
> diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
> index 06cfc88d30..0126a3f5d9 100644
> --- a/xen/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
> @@ -57,6 +57,7 @@ static struct dbs_tuners {
>  
>  static DEFINE_PER_CPU(struct timer, dbs_timer);
>  
> +#ifdef CONFIG_PM_OP
>  int write_ondemand_sampling_rate(unsigned int sampling_rate)
>  {
>      if ( (sampling_rate > MAX_SAMPLING_RATE / MICROSECS(1)) ||
> @@ -93,6 +94,7 @@ int get_cpufreq_ondemand_para(uint32_t *sampling_rate_max,
>  
>      return 0;
>  }
> +#endif /* CONFIG_PM_OP */
>  
>  static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
>  {
> diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
> index 723045b240..987c3b5929 100644
> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -224,47 +224,6 @@ int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag)
>      return policy->cur;
>  }
>  
> -int cpufreq_update_turbo(unsigned int cpu, int new_state)
> -{
> -    struct cpufreq_policy *policy;
> -    int curr_state;
> -    int ret = 0;
> -
> -    if (new_state != CPUFREQ_TURBO_ENABLED &&
> -        new_state != CPUFREQ_TURBO_DISABLED)
> -        return -EINVAL;
> -
> -    policy = per_cpu(cpufreq_cpu_policy, cpu);
> -    if (!policy)
> -        return -EACCES;
> -
> -    if (policy->turbo == CPUFREQ_TURBO_UNSUPPORTED)
> -        return -EOPNOTSUPP;
> -
> -    curr_state = policy->turbo;
> -    if (curr_state == new_state)
> -        return 0;
> -
> -    policy->turbo = new_state;
> -    if (cpufreq_driver.update)
> -    {
> -        ret = alternative_call(cpufreq_driver.update, cpu, policy);
> -        if (ret)
> -            policy->turbo = curr_state;
> -    }
> -
> -    return ret;
> -}
> -
> -
> -int cpufreq_get_turbo_status(unsigned int cpu)
> -{
> -    struct cpufreq_policy *policy;
> -
> -    policy = per_cpu(cpufreq_cpu_policy, cpu);
> -    return policy && policy->turbo == CPUFREQ_TURBO_ENABLED;
> -}
> -
>  /*********************************************************************
>   *                 POLICY                                            *
>   *********************************************************************/
> diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
> index 241117a9af..0742aa9f44 100644
> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -143,9 +143,6 @@ extern int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag);
>  #define CPUFREQ_TURBO_UNSUPPORTED   0
>  #define CPUFREQ_TURBO_ENABLED       1
>  
> -int cpufreq_update_turbo(unsigned int cpu, int new_state);
> -int cpufreq_get_turbo_status(unsigned int cpu);
> -
>  static inline int
>  __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event)
>  {
> -- 
> 2.34.1
> 

