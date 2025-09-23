Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260A9B973B1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 20:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128672.1468956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v181J-00016D-5E; Tue, 23 Sep 2025 18:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128672.1468956; Tue, 23 Sep 2025 18:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v181J-00014W-2W; Tue, 23 Sep 2025 18:45:45 +0000
Received: by outflank-mailman (input) for mailman id 1128672;
 Tue, 23 Sep 2025 18:45:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v181H-00014Q-NL
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 18:45:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v181H-006RTL-0n;
 Tue, 23 Sep 2025 18:45:43 +0000
Received: from [2a02:8012:3a1:0:5196:5816:243d:dc7b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v181H-009rfR-0u;
 Tue, 23 Sep 2025 18:45:43 +0000
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
	bh=cN8YcMWZlMZh5DbUFDu5aozwqjqXd2migigsxSiVLGY=; b=hgTLsJQ4b9PeEeUmJ9Cb19/X96
	1XjElB+/gO9kmS3qEQO05ggt11XW3W+CVP1C2EMTv+/GUIrTf7iq7v9FlBErCJx6LoH9V6fbIe15F
	rEuncnLsR6yuSeC3+KT4uZpKIKPiEBHdlZ+UBo6GW8YsuPqzvKTR8s0W2JXkhxa5WCaE=;
Message-ID: <81a1de69-0c42-450b-a97d-8d30cfe247de@xen.org>
Date: Tue, 23 Sep 2025 19:45:41 +0100
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
 <ddce2b69-3ba3-4c04-ab82-092ce2c98cf3@xen.org>
 <721b5d6a-257e-447d-bac6-675ccedc3928@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <721b5d6a-257e-447d-bac6-675ccedc3928@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 23/09/2025 14:37, Mykyta Poturai wrote:
> On 18.09.25 16:35, Julien Grall wrote:
>> Hi Mykyta,
>>
>> On 18/09/2025 13:16, Mykyta Poturai wrote:
>>> Implement XEN_SYSCTL_CPU_HOTPLUG_* calls to allow for enabling/disabling
>>> CPU cores in runtime.
>>>
>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>> ---
>>>    xen/arch/arm/sysctl.c | 67 +++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 67 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
>>> index 32cab4feff..ca8fb550fd 100644
>>> --- a/xen/arch/arm/sysctl.c
>>> +++ b/xen/arch/arm/sysctl.c
>>> @@ -12,6 +12,7 @@
>>>    #include <xen/dt-overlay.h>
>>>    #include <xen/errno.h>
>>>    #include <xen/hypercall.h>
>>> +#include <xen/cpu.h>
>>>    #include <asm/arm64/sve.h>
>>>    #include <public/sysctl.h>
>>> @@ -23,6 +24,68 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>>                                           
>>> XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>>>    }
>>> +static long cpu_up_helper(void *data)
>>> +{
>>> +    unsigned long cpu = (unsigned long) data;
>>> +    return cpu_up(cpu);
>>> +}
>>> +
>>> +static long cpu_down_helper(void *data)
>>> +{
>>> +    unsigned long cpu = (unsigned long) data;
>>> +    return cpu_down(cpu);
>>> +}
>>> +
>>> +static long smt_up_down_helper(void *data)
>>
>> Looking at the code, you will effectively disable all the CPUs but CPU0.
>> But I don't understand why. From the name is goal seems to be disable
>> SMT threading.
>>
> 
> Sorry I have slightly misunderstood the x86 implementation/reasoning of
> this ops. I will drop them in V2.
> 
>>> +{
>>> +    bool up = (bool) data;
>>> +    unsigned int cpu;
>>> +    int ret;
>>> +
>>> +    for_each_present_cpu ( cpu )
>>> +    {
>>> +        if ( cpu == 0 )
>>> +            continue;
>>> +
>>> +        if ( up )
>>> +            ret = cpu_up(cpu);
>>> +        else
>>> +            ret = cpu_down(cpu);
>>> +
>>
>> Regardless what I wrote above, you likely want to handle preemption.
>>
>>> +        if ( ret )
>>> +            return ret;
>>   > +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
>>> +{
>>> +    bool up;
>>> +
>>> +    switch (hotplug->op) {
>>> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
>>> +            if ( hotplug->cpu == 0 )
>>
>> I can't find a similar check on x86. Do you have any pointer?
> 
> Jan correctly mentioned that CPU0 can't be disabled so this is a short
> circuit for clarity.

I have replied to Jan. In short, the clarify you are referring is what 
would make more difficult to support offlining CPU0. So I would rather 
prefer if they are not present.
>>
>>> +            return continue_hypercall_on_cpu(0, cpu_up_helper,
>>> _p(hotplug->cpu));
>>> +
>>> +        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
>>> +            if ( hotplug->cpu == 0 )
>>> +                return -EINVAL;
>>> +            return continue_hypercall_on_cpu(0, cpu_down_helper,
>>> _p(hotplug->cpu));
>>> +
>>> +        case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
>>> +        case XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE:
>>
>> Why are we implementing those helpers on Arm?
>>
>>> +            if ( CONFIG_NR_CPUS <= 1 )
>>> +                return 0;
>>> +            up = hotplug->op == XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE;
>>> +            return continue_hypercall_on_cpu(0, smt_up_down_helper,
>>> _p(up));
>>> +
>>> +        default:
>>> +            return -EINVAL;
>>> +    }
>>> +}
>>> +
>>>    long arch_do_sysctl(struct xen_sysctl *sysctl,
>>>                        XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>>    {
>>> @@ -34,6 +97,10 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
>>>            ret = dt_overlay_sysctl(&sysctl->u.dt_overlay);
>>>            break;
>>> +    case XEN_SYSCTL_cpu_hotplug:
>>
>> This will also enable CPU hotplug on 32-bit Arm. Is this what you
>> intended? (I see patch #4 only mention 64-bit Arm).
> 
> It wasn't intended. I will additionally check if it works on arm32 end
> explicitly specify it.

It will not work properly on arm32 because of the page table code. We 
have per-CPU pagetables (see init_domheap_mappings()) and they will need 
to be freed.

Note this is not a request to add support for arm32 CPU offlining.

Cheers,

-- 
Julien Grall


