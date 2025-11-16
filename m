Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2CC61376
	for <lists+xen-devel@lfdr.de>; Sun, 16 Nov 2025 12:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163231.1490417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKb1k-0002LW-52; Sun, 16 Nov 2025 11:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163231.1490417; Sun, 16 Nov 2025 11:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKb1k-0002Io-2N; Sun, 16 Nov 2025 11:34:40 +0000
Received: by outflank-mailman (input) for mailman id 1163231;
 Sun, 16 Nov 2025 11:34:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vKb1i-0002Ii-Gq
 for xen-devel@lists.xenproject.org; Sun, 16 Nov 2025 11:34:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKb1h-00A6bW-2s;
 Sun, 16 Nov 2025 11:34:37 +0000
Received: from [2a02:8012:3a1:0:850b:33c3:9f1f:5f9a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKb1h-000aEu-1s;
 Sun, 16 Nov 2025 11:34:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=MXtETNSY9doQbFirrawzKsx3HEd7bIav1Of06vFXCDY=; b=l13dhB5+eoj93ZPPa5WvCK7nfc
	QvDo2Rwu7Jikcg6J/mgGLPZV1DmDz26NKxQfscqRqpIdL1uFI6JXZEM/1OEUlt+TKQxc19BbEF/Us
	UOJuvdsJSXm2vsjpYHDa4yNe6Q+B0R6xEdEz2WOvetAKV5IhYBg/m03akKJZk44cd6H0=;
Message-ID: <c648a729-4256-48ac-aa03-3cdee316d5d6@xen.org>
Date: Sun, 16 Nov 2025 11:34:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] arm/sysctl: Implement cpu hotplug ops
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <656cb01061f2ec726eb23784d01517a94117618e.1762939773.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <656cb01061f2ec726eb23784d01517a94117618e.1762939773.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2025 10:51, Mykyta Poturai wrote:
> Implement XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} calls to allow for
> enabling/disabling CPU cores in runtime.
> 
> For now this operations only support Arm64. For proper Arm32 support,
> there needs to be a mechanism to free per-cpu page tables, allocated in
> init_domheap_mappings.
> Also, hotplug is not supported if ITS, FFA, or TEE is enabled, as they
> use non-static IRQ actions.
> 
> Create a Kconfig option RUNTIME_CPU_CONTROL that reflects this
> constraints.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> v3->v4:
> * don't reimplement cpu_up/down helpers
> * add Kconfig option
> * fixup formatting
> 
> v2->v3:
> * no changes
> 
> v1->v2:
> * remove SMT ops
> * remove cpu == 0 checks
> * add XSM hooks
> * only implement for 64bit Arm
> ---
>   xen/arch/arm/Kconfig  |  4 ++++
>   xen/arch/arm/sysctl.c | 32 ++++++++++++++++++++++++++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index cf6af68299..931ae51575 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -274,6 +274,10 @@ config PCI_PASSTHROUGH
>   	help
>   	  This option enables PCI device passthrough
>   
> +config RUNTIME_CPU_CONTROL
> +    def_bool y
> +    depends on ARM_64 && !TEE && !FFA && !HAS_ITS
> +
>   endmenu
>   
>   menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..3c4e29d82c 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -12,6 +12,7 @@
>   #include <xen/dt-overlay.h>
>   #include <xen/errno.h>
>   #include <xen/hypercall.h>
> +#include <xsm/xsm.h>
>   #include <asm/arm64/sve.h>
>   #include <public/sysctl.h>
>   
> @@ -23,6 +24,33 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>                                          XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>   }
>   
> +static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)

As you moved the helper in common code. I was expecting the logic to 
handle CPU_HOTPLUG_ONLINE and CPU_HOTPLUG_OFFLINE to also move in 
common. Can you explain why this wasn't done?

> +{
> +#ifdef CONFIG_RUNTIME_CPU_CONTROL
> +    int ret;
> +
> +    switch ( hotplug->op )
> +    {
> +    case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> +        ret = xsm_resource_plug_core(XSM_HOOK);
> +        if ( ret )
> +            return ret;
> +        return continue_hypercall_on_cpu(0, cpu_up_helper, _p(hotplug->cpu));
> +
> +    case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> +        ret = xsm_resource_unplug_core(XSM_HOOK);
> +        if ( ret )
> +            return ret;
> +        return continue_hypercall_on_cpu(0, cpu_down_helper, _p(hotplug->cpu));
> +
> +    default:
> +        return -EOPNOTSUPP;
> +    }
> +#else
> +    return -EOPNOTSUPP;
> +#endif
> +}
> +
>   long arch_do_sysctl(struct xen_sysctl *sysctl,
>                       XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>   {
> @@ -34,6 +62,10 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
>           ret = dt_overlay_sysctl(&sysctl->u.dt_overlay);
>           break;
>   
> +    case XEN_SYSCTL_cpu_hotplug:
> +        ret = cpu_hotplug_sysctl(&sysctl->u.cpu_hotplug);
> +        break;
> +
>       default:
>           ret = -ENOSYS;
>           break;

Cheers,

-- 
Julien Grall


