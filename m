Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A1F7D8C01
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 01:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624049.972438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw9LX-00084T-2F; Thu, 26 Oct 2023 23:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624049.972438; Thu, 26 Oct 2023 23:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw9LW-00081a-V7; Thu, 26 Oct 2023 23:00:58 +0000
Received: by outflank-mailman (input) for mailman id 624049;
 Thu, 26 Oct 2023 23:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qw9LV-00081U-0N
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 23:00:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 846df501-7453-11ee-98d5-6d05b1d4d9a1;
 Fri, 27 Oct 2023 01:00:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6072E636BB;
 Thu, 26 Oct 2023 23:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15B6C433C8;
 Thu, 26 Oct 2023 23:00:52 +0000 (UTC)
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
X-Inumbo-ID: 846df501-7453-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698361254;
	bh=ZSH0xT3W0BOpnUDnOKKdjuMB59iz1rzKoGxMgf+mC0E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OFzOnJwM2xdE5eC6TBeQV1K1GWfKUfPg/0QpWBtxo/htKZj9AuDHUROrDJ1k5uvqz
	 DHF38vXQs2zTooh1Lgf4uFlws5QCABG1sIds1DjKkSY7U8ugULs0zgniB53wS55o88
	 WKJZ6nQK/xzYCzJ4Ad4kyDm7HBFQhNSISiM9FyIuVxTPkI3hOXzP1+YLcTCJoJ5syv
	 dIWo0xrl1q2OsazlYIqYazXn0tXHKodyLS5WYhDFo1ukGy+Nf/xn39dlB7dwUkTnlv
	 pA3ZNQjf9W4NfIzXCEhBdcvPftgsMTLm8Df+QlV2nim5HIkhEUvHd55PvhFpy4cPAK
	 lkmVoM9d8oujA==
Date: Thu, 26 Oct 2023 16:00:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen/set_{c,p}x_pminfo: address violations od MISRA
 C:2012 Rule 8.3
In-Reply-To: <88499ca9a61b59d13d90f6c5f77cbb2e124d850e.1698322083.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310261559470.271731@ubuntu-linux-20-04-desktop>
References: <88499ca9a61b59d13d90f6c5f77cbb2e124d850e.1698322083.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Oct 2023, Federico Serafini wrote:
> Make function definitions and declarations consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Great job at taking the opportunity to improve the code style with this
patch. Only one comment below.


> ---
>  xen/arch/x86/x86_64/cpu_idle.c |  5 ++--
>  xen/arch/x86/x86_64/cpufreq.c  |  6 ++--
>  xen/drivers/cpufreq/cpufreq.c  | 52 ++++++++++++++++------------------
>  xen/include/xen/pmstat.h       |  4 +--
>  4 files changed, 33 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_64/cpu_idle.c b/xen/arch/x86/x86_64/cpu_idle.c
> index e2195d57be..fcd6fc0fc2 100644
> --- a/xen/arch/x86/x86_64/cpu_idle.c
> +++ b/xen/arch/x86/x86_64/cpu_idle.c
> @@ -62,7 +62,8 @@ static int copy_from_compat_state(xen_processor_cx_t *xen_state,
>      return 0;
>  }
>  
> -long compat_set_cx_pminfo(uint32_t cpu, struct compat_processor_power *power)
> +long compat_set_cx_pminfo(uint32_t acpi_id,
> +                          struct compat_processor_power *power)
>  {
>      struct xen_processor_power *xen_power;
>      unsigned long xlat_page_current;
> @@ -106,5 +107,5 @@ long compat_set_cx_pminfo(uint32_t cpu, struct compat_processor_power *power)
>      XLAT_processor_power(xen_power, power);
>  #undef XLAT_processor_power_HNDL_states
>  
> -    return set_cx_pminfo(cpu, xen_power);
> +    return set_cx_pminfo(acpi_id, xen_power);
>  }
> diff --git a/xen/arch/x86/x86_64/cpufreq.c b/xen/arch/x86/x86_64/cpufreq.c
> index 9e1e2050da..e4f3d5b436 100644
> --- a/xen/arch/x86/x86_64/cpufreq.c
> +++ b/xen/arch/x86/x86_64/cpufreq.c
> @@ -30,8 +30,8 @@ CHECK_processor_px;
>  
>  DEFINE_XEN_GUEST_HANDLE(compat_processor_px_t);
>  
> -int 
> -compat_set_px_pminfo(uint32_t cpu, struct compat_processor_performance *perf)
> +int compat_set_px_pminfo(uint32_t acpi_id,
> +                         struct compat_processor_performance *perf)
>  {
>      struct xen_processor_performance *xen_perf;
>      unsigned long xlat_page_current;
> @@ -52,5 +52,5 @@ compat_set_px_pminfo(uint32_t cpu, struct compat_processor_performance *perf)
>      XLAT_processor_performance(xen_perf, perf);
>  #undef XLAT_processor_performance_HNDL_states
>  
> -    return set_px_pminfo(cpu, xen_perf);
> +    return set_px_pminfo(acpi_id, xen_perf);
>  }
> diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
> index 6e5c400849..6fc1aadb9f 100644
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -457,14 +457,14 @@ static void print_PPC(unsigned int platform_limit)
>      printk("\t_PPC: %d\n", platform_limit);
>  }
>  
> -int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_info)
> +int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
>  {
>      int ret=0, cpuid;
>      struct processor_pminfo *pmpt;
>      struct processor_performance *pxpt;
>  
>      cpuid = get_cpu_id(acpi_id);
> -    if ( cpuid < 0 || !dom0_px_info)
> +    if ( ( cpuid < 0 ) || !perf)
>      {
>          ret = -EINVAL;
>          goto out;
> @@ -488,21 +488,21 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_in
>      pmpt->acpi_id = acpi_id;
>      pmpt->id = cpuid;
>  
> -    if ( dom0_px_info->flags & XEN_PX_PCT )
> +    if ( perf->flags & XEN_PX_PCT )
>      {
>          /* space_id check */
> -        if (dom0_px_info->control_register.space_id != 
> -            dom0_px_info->status_register.space_id)
> +        if ( perf->control_register.space_id !=
> +             perf->status_register.space_id )
>          {
>              ret = -EINVAL;
>              goto out;
>          }
>  
>          memcpy ((void *)&pxpt->control_register,
> -                (void *)&dom0_px_info->control_register,
> +                (void *)&perf->control_register,
>                  sizeof(struct xen_pct_register));
>          memcpy ((void *)&pxpt->status_register,
> -                (void *)&dom0_px_info->status_register,
> +                (void *)&perf->status_register,
>                  sizeof(struct xen_pct_register));
>  
>          if ( cpufreq_verbose )
> @@ -512,69 +512,67 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_in
>          }
>      }
>  
> -    if ( dom0_px_info->flags & XEN_PX_PSS ) 
> +    if ( perf->flags & XEN_PX_PSS )
>      {
>          /* capability check */
> -        if (dom0_px_info->state_count <= 1)
> +        if (perf->state_count <= 1)
>          {
>              ret = -EINVAL;
>              goto out;
>          }
>  
>          if ( !(pxpt->states = xmalloc_array(struct xen_processor_px,
> -                        dom0_px_info->state_count)) )
> +                                            perf->state_count)) )
>          {
>              ret = -ENOMEM;
>              goto out;
>          }
> -        if ( copy_from_guest(pxpt->states, dom0_px_info->states,
> -                             dom0_px_info->state_count) )
> +        if ( copy_from_guest(pxpt->states, perf->states, perf->state_count) )
>          {
>              ret = -EFAULT;
>              goto out;
>          }
> -        pxpt->state_count = dom0_px_info->state_count;
> +        pxpt->state_count = perf->state_count;
>  
>          if ( cpufreq_verbose )
>              print_PSS(pxpt->states,pxpt->state_count);
>      }
>  
> -    if ( dom0_px_info->flags & XEN_PX_PSD )
> +    if ( perf->flags & XEN_PX_PSD )
>      {
>          /* check domain coordination */
> -        if (dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
> -            dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
> -            dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_HW)
> +        if (perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
> +            perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
> +            perf->shared_type != CPUFREQ_SHARED_TYPE_HW)
>          {
>              ret = -EINVAL;
>              goto out;
>          }
>  
> -        pxpt->shared_type = dom0_px_info->shared_type;
> +        pxpt->shared_type = perf->shared_type;
>          memcpy ((void *)&pxpt->domain_info,
> -                (void *)&dom0_px_info->domain_info,
> +                (void *)&perf->domain_info,
>                  sizeof(struct xen_psd_package));
>  
>          if ( cpufreq_verbose )
>              print_PSD(&pxpt->domain_info);
>      }
>  
> -    if ( dom0_px_info->flags & XEN_PX_PPC )
> +    if ( perf->flags & XEN_PX_PPC )
>      {
> -        pxpt->platform_limit = dom0_px_info->platform_limit;
> +        pxpt->platform_limit = perf->platform_limit;
>  
>          if ( cpufreq_verbose )
>              print_PPC(pxpt->platform_limit);
>  
>          if ( pxpt->init == XEN_PX_INIT )
>          {
> -            ret = cpufreq_limit_change(cpuid); 
> +            ret = cpufreq_limit_change(cpuid);
>              goto out;
>          }
>      }
>  
> -    if ( dom0_px_info->flags == ( XEN_PX_PCT | XEN_PX_PSS |
> -                XEN_PX_PSD | XEN_PX_PPC ) )
> +    if ( perf->flags == ( XEN_PX_PCT | XEN_PX_PSS | XEN_PX_PSD | XEN_PX_PPC ) )
>      {
>          pxpt->init = XEN_PX_INIT;
>  
> @@ -675,16 +673,16 @@ static int __init cpufreq_cmdline_parse(const char *s, const char *e)
>  static int cf_check cpu_callback(
>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>  {
> -    unsigned int cpu = (unsigned long)hcpu;
> +    unsigned int acpi_id = (unsigned long)hcpu;
>  
>      switch ( action )
>      {
>      case CPU_DOWN_FAILED:
>      case CPU_ONLINE:
> -        (void)cpufreq_add_cpu(cpu);
> +        (void)cpufreq_add_cpu(acpi_id);
>          break;
>      case CPU_DOWN_PREPARE:
> -        (void)cpufreq_del_cpu(cpu);
> +        (void)cpufreq_del_cpu(acpi_id);
>          break;
>      default:
>          break;

I take you made these changes to cpu_callback for consistency, not
because they are required? Everything else makes sense so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

