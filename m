Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD387BDA1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693221.1081030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkl7L-0000UI-Es; Thu, 14 Mar 2024 13:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693221.1081030; Thu, 14 Mar 2024 13:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkl7L-0000Sm-C7; Thu, 14 Mar 2024 13:27:31 +0000
Received: by outflank-mailman (input) for mailman id 693221;
 Thu, 14 Mar 2024 13:27:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rkl7K-0000Sg-2f
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:27:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkl7J-0000eY-G1; Thu, 14 Mar 2024 13:27:29 +0000
Received: from [15.248.2.233] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkl7J-0003TK-8S; Thu, 14 Mar 2024 13:27:29 +0000
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
	bh=pQelkiwX0kX7ykh541CjD1da4ARJjAM4zimwE5aQOGk=; b=b0JSf5POyVk2QTyf54K8jbl+AE
	zyuFdWlAHAns6nTI98B878sA0Pw0T1S5RztuzRBl8dIt/d4iNI5YOt6pnHqwmOben8PPxsXoi/RO1
	hh6axB8F090AkJ8B14q2j/jzdPk4v0gUdb6nQsbEfWuJVjWMPylAY781Ksqrf+hBne8U=;
Message-ID: <77520838-67cb-4755-8b02-2ec8b90c7bfa@xen.org>
Date: Thu, 14 Mar 2024 13:27:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Set correct per-cpu cpu_core_mask
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20240228015822.56108-1-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240228015822.56108-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 28/02/2024 01:58, Henry Wang wrote:
> In the common sysctl command XEN_SYSCTL_physinfo, the value of
> cores_per_socket is calculated based on the cpu_core_mask of CPU0.
> Currently on Arm this is a fixed value 1 (can be checked via xl info),
> which is not correct. This is because during the Arm CPU online
> process at boot time, setup_cpu_sibling_map() only sets the per-cpu
> cpu_core_mask for itself.
> 
> cores_per_socket refers to the number of cores that belong to the same
> socket (NUMA node). Currently Xen on Arm does not support physical
> CPU hotplug and NUMA, also we assume there is no multithread. Therefore
> cores_per_socket means all possible CPUs detected from the device
> tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
> accordingly. Drop the in-code comment which seems to be outdated.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - Do not do the multithread check.
> ---
>   xen/arch/arm/smpboot.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index a84e706d77..d9ebd55d4a 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -66,7 +66,6 @@ static bool cpu_is_dead;
>   
>   /* ID of the PCPU we're running on */
>   DEFINE_PER_CPU(unsigned int, cpu_id);
> -/* XXX these seem awfully x86ish... */

:). I guess at the time we didn't realize that MT was supported on Arm. 
It is at least part of the spec, but as Michal pointed out it doesn't 
look like a lot of processors supports it.

>   /* representing HT siblings of each logical CPU */
>   DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
>   /* representing HT and core siblings of each logical CPU */
> @@ -89,6 +88,10 @@ static int setup_cpu_sibling_map(int cpu)
>       cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
>       cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
>   
> +    /* Currently we assume there is no multithread. */

I am not very familiar with the scheduling in Xen. Do you know what's 
the consequence of not properly supporting MT? One thing I can think of 
is security (I know there were plenty of security issues with SMT).

Depending on the answer, I would consider to print a warning and maybe 
add it in SUPPORT.MD in a separate patch.

Also, looking at the v1 discussion, it sounds like even cpu_sibling_mask 
would not be correct. So I think it would make sense to move the comment 
on top of setup_cpu_sibling_map.

> +    cpumask_or(per_cpu(cpu_core_mask, cpu),
> +               per_cpu(cpu_core_mask, cpu), &cpu_possible_map);

AFIACT, per_cpu(cpu_core_mask, ...) will now be equal to 
cpu_possible_map. In that case, wouldn't it be better to simply copy the 
cpumask?

This would also allow to drop cpumask_set_cpu(..., cpu_core_mask) above.

Cheers,

-- 
Julien Grall

