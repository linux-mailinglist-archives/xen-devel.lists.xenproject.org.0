Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF53DB84DE7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 15:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126107.1467785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzEnl-0005eg-Q8; Thu, 18 Sep 2025 13:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126107.1467785; Thu, 18 Sep 2025 13:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzEnl-0005cB-NL; Thu, 18 Sep 2025 13:35:57 +0000
Received: by outflank-mailman (input) for mailman id 1126107;
 Thu, 18 Sep 2025 13:35:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uzEnk-0005c5-ME
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 13:35:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uzEnk-00FyFa-0k;
 Thu, 18 Sep 2025 13:35:56 +0000
Received: from [15.248.2.235] (helo=[10.24.67.203])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uzEnk-00GKVy-0p;
 Thu, 18 Sep 2025 13:35:56 +0000
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
	bh=l3czIp3hSCM+jgKutsn+9ltPY+cNP43JxGW/OkrSBzk=; b=330WumM/FodOXMLJ3zk4w66dx/
	VHDUNRghBIg2WM4OEB8XvpDKar1S6BHM7PyhVEjUIDQngzNAb0eaW/MAgUd8VCBU1KuaidvzdMETq
	hp6DtIKr/YGvr1Ji9dmITu3VAs5+LlKbNYfJWeesdMIqZGVpDuvBlGe0ENzGOp+q2Mpg=;
Message-ID: <ddce2b69-3ba3-4c04-ab82-092ce2c98cf3@xen.org>
Date: Thu, 18 Sep 2025 14:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm/sysctl: Implement cpu hotplug ops
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <34c9b488ad949cbcd93bd8578dd5bc180fab8738.1758197507.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <34c9b488ad949cbcd93bd8578dd5bc180fab8738.1758197507.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 18/09/2025 13:16, Mykyta Poturai wrote:
> Implement XEN_SYSCTL_CPU_HOTPLUG_* calls to allow for enabling/disabling
> CPU cores in runtime.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/sysctl.c | 67 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..ca8fb550fd 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -12,6 +12,7 @@
>   #include <xen/dt-overlay.h>
>   #include <xen/errno.h>
>   #include <xen/hypercall.h>
> +#include <xen/cpu.h>
>   #include <asm/arm64/sve.h>
>   #include <public/sysctl.h>
>   
> @@ -23,6 +24,68 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>                                          XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>   }
>   
> +static long cpu_up_helper(void *data)
> +{
> +    unsigned long cpu = (unsigned long) data;
> +    return cpu_up(cpu);
> +}
> +
> +static long cpu_down_helper(void *data)
> +{
> +    unsigned long cpu = (unsigned long) data;
> +    return cpu_down(cpu);
> +}
> +
> +static long smt_up_down_helper(void *data)

Looking at the code, you will effectively disable all the CPUs but CPU0. 
But I don't understand why. From the name is goal seems to be disable 
SMT threading.

> +{
> +    bool up = (bool) data;
> +    unsigned int cpu;
> +    int ret;
> +
> +    for_each_present_cpu ( cpu )
> +    {
> +        if ( cpu == 0 )
> +            continue;
> +
> +        if ( up )
> +            ret = cpu_up(cpu);
> +        else
> +            ret = cpu_down(cpu);
> +

Regardless what I wrote above, you likely want to handle preemption.

> +        if ( ret )
> +            return ret;
 > +    }
> +
> +    return 0;
> +}
> +
> +static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
> +{
> +    bool up;
> +
> +    switch (hotplug->op) {
> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> +            if ( hotplug->cpu == 0 )

I can't find a similar check on x86. Do you have any pointer?

> +                return -EINVAL;

On x86, they seem to check for XSM permission before continuing. Can you 
explain why this is not necessary? Same questions applies below.

> +            return continue_hypercall_on_cpu(0, cpu_up_helper, _p(hotplug->cpu));
> +
> +        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> +            if ( hotplug->cpu == 0 )
> +                return -EINVAL;
> +            return continue_hypercall_on_cpu(0, cpu_down_helper, _p(hotplug->cpu));
> +
> +        case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
> +        case XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE:

Why are we implementing those helpers on Arm?

> +            if ( CONFIG_NR_CPUS <= 1 )
> +                return 0;
> +            up = hotplug->op == XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE;
> +            return continue_hypercall_on_cpu(0, smt_up_down_helper, _p(up));
> +
> +        default:
> +            return -EINVAL;
> +    }
> +}
> +
>   long arch_do_sysctl(struct xen_sysctl *sysctl,
>                       XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>   {
> @@ -34,6 +97,10 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
>           ret = dt_overlay_sysctl(&sysctl->u.dt_overlay);
>           break;
>   
> +    case XEN_SYSCTL_cpu_hotplug:

This will also enable CPU hotplug on 32-bit Arm. Is this what you 
intended? (I see patch #4 only mention 64-bit Arm).

> +        ret = cpu_hotplug_sysctl(&sysctl->u.cpu_hotplug);
> +        break;
> +
>       default:
>           ret = -ENOSYS;
>           break;

Cheers,

-- 
Julien Grall


