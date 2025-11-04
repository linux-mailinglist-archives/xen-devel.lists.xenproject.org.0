Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D3CC30BB6
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 12:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155690.1485132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFCM-00061X-D6; Tue, 04 Nov 2025 11:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155690.1485132; Tue, 04 Nov 2025 11:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFCM-0005yo-AK; Tue, 04 Nov 2025 11:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1155690;
 Tue, 04 Nov 2025 11:27:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vGFCL-0005yi-KW
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 11:27:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGFCK-000my3-2b;
 Tue, 04 Nov 2025 11:27:37 +0000
Received: from [2a02:8012:3a1:0:2858:32e7:18b8:3bf]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGFCK-00B9gR-2e;
 Tue, 04 Nov 2025 11:27:36 +0000
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
	bh=wb0BLB75HCUP59tThBssTD0jcy87um7ce8sT+eTJ+Hs=; b=T3KwFfEJImf5d3oN/EuNo4CvWN
	R47IZz+1FU+wGckIkWDfadacqpJhhCYvczCeI21A2MZyLCshkqC/9e7kDNFyChAVfzDxOFmON9LUI
	7KBzMvZLu//ss2LxQ1yqcGD9UNGs8vYrU7toC74bztbzvVTQjJr3a9NjqngNymvDzj7s=;
Message-ID: <ad2e0fd6-a742-497c-88db-5d7c5704ec68@xen.org>
Date: Tue, 4 Nov 2025 11:27:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm/sysctl: Implement cpu hotplug ops
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1760083684.git.mykyta_poturai@epam.com>
 <bbd7ebd07d80ead78106c160e4368116dae1e548.1760083684.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bbd7ebd07d80ead78106c160e4368116dae1e548.1760083684.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/10/2025 10:21, Mykyta Poturai wrote:
> Implement XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} calls to allow for
> enabling/disabling CPU cores in runtime.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> v2->v3:
> * no changes
> 
> v1->v2:
> * remove SMT ops
> * remove cpu == 0 checks
> * add XSM hooks
> * only implement for 64bit Arm

Can you add some details in the commit message explaining why the 
feature is only enabled for 32-bit Arm?

> ---
>   xen/arch/arm/sysctl.c | 45 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..fecd649db1 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -12,6 +12,8 @@
>   #include <xen/dt-overlay.h>
>   #include <xen/errno.h>
>   #include <xen/hypercall.h>
> +#include <xen/cpu.h>
> +#include <xsm/xsm.h>
>   #include <asm/arm64/sve.h>
>   #include <public/sysctl.h>
>   
> @@ -23,6 +25,42 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>                                          XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>   }
>   
> +#ifdef CONFIG_ARM_64
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
> +static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
> +{
> +    int ret;
> +
> +    switch (hotplug->op) {
> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> +            ret = xsm_resource_plug_core(XSM_HOOK);
> +            if ( ret )
> +                return ret;
> +            return continue_hypercall_on_cpu(0, cpu_up_helper, _p(hotplug->cpu));
> +
> +        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> +            ret = xsm_resource_unplug_core(XSM_HOOK);
> +            if ( ret )
> +                return ret;
> +            return continue_hypercall_on_cpu(0, cpu_down_helper, _p(hotplug->cpu));
> +
> +        default:
> +            return -EOPNOTSUPP;
> +    }
> +}
> +#endif

The logic seems to be very similar to the x86 code. There are some 
slight differences in cpu_up_helper() and cpu_down_helper() but:

* For cpu_up_helper(), we could create an arch specific helper for the 
second if check.
* For cpu_down_helper(), it would be ok to call cpu_down() a second time 
on Arm.

Can you look at consolidating the code?

Cheers,

-- 
Julien Grall


