Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4E43F7369
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 12:37:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171888.313643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIqH4-0005wk-0q; Wed, 25 Aug 2021 10:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171888.313643; Wed, 25 Aug 2021 10:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIqH3-0005tn-Tx; Wed, 25 Aug 2021 10:36:49 +0000
Received: by outflank-mailman (input) for mailman id 171888;
 Wed, 25 Aug 2021 10:36:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIqH2-0005th-Ua
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 10:36:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIqH1-0001wQ-Pg; Wed, 25 Aug 2021 10:36:47 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIqH1-000379-Jd; Wed, 25 Aug 2021 10:36:47 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Smxc/dqXgTwjtzmiE/NyVCmrOEuiVjKcWE6syx0IC7w=; b=UfZX6R1JYbuFSf0JvNEINMz0nU
	PaA+L5Qg5TWC5GBugoVrkHQMcDXKGtzxWNueMGdAx6s/ftJ2g5ZLUPIvjpnS2xIeDHaCJ1PdmM3Hv
	xUs5nSY1aw2/Iqop/Ap9Vza1Y69JNJl+7tLXnri9AKVKN4wAlThqhOGLmxYUCfiKWRDw=;
Subject: Re: [XEN RFC PATCH 13/40] xen/arm: introduce numa_set_node for Arm
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-14-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a07963e4-84c8-32de-4e8b-013a5419deea@xen.org>
Date: Wed, 25 Aug 2021 11:36:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-14-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> This API is used to set one CPU to a NUMA node. If the system
> configure NUMA off or system initialize NUMA failed, the
> online NUMA node would set to only node#0. This will be done
> in following patches. When NUMA turn off or init failed,
> node_online_map will be cleared and set node#0 online. So we
> use node_online_map to prevent to set a CPU to an offline node.

IHMO numa_set_node() should behave exactly the same way on x86 and Arm 
because this is going to be used by the common code.

 From the commit message, I don't quite understand why the check is 
necessary on Arm but not on x86. Can you clarify it?

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/Makefile      |  1 +
>   xen/arch/arm/numa.c        | 31 +++++++++++++++++++++++++++++++
>   xen/include/asm-arm/numa.h |  2 ++
>   xen/include/asm-x86/numa.h |  1 -
>   xen/include/xen/numa.h     |  1 +
>   5 files changed, 35 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/numa.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d3b97b5b4..6e3fb8033e 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
>   obj-y += mem_access.o
>   obj-y += mm.o
>   obj-y += monitor.o
> +obj-$(CONFIG_NUMA) += numa.o
>   obj-y += p2m.o
>   obj-y += percpu.o
>   obj-y += platform.o
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> new file mode 100644
> index 0000000000..1e30c5bb13
> --- /dev/null
> +++ b/xen/arch/arm/numa.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Arm Architecture support layer for NUMA.
> + *
> + * Copyright (C) 2021 Arm Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +#include <xen/init.h>
> +#include <xen/nodemask.h>
> +#include <xen/numa.h>
> +
> +void numa_set_node(int cpu, nodeid_t nid)
> +{
> +    if ( nid >= MAX_NUMNODES ||
> +        !nodemask_test(nid, &node_online_map) )
> +        nid = 0;
> +
> +    cpu_to_node[cpu] = nid;
> +}
I think numa_set_node() will want to be implemented in common code.

> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index ab9c4a2448..1162c702df 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -27,6 +27,8 @@ extern mfn_t first_valid_mfn;
>   #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>   #define __node_distance(a, b) (20)
>   
> +#define numa_set_node(x, y) do { } while (0)

I would define it in xen/numa.h so other arch can take advantage ot it. 
Also, please use a static inline helper so the arguments are evaluated.

> +
>   #endif
>   
>   #endif /* __ARCH_ARM_NUMA_H */
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index f8e4e15586..69859b0a57 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -22,7 +22,6 @@ extern nodeid_t pxm_to_node(unsigned int pxm);
>   #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
>   
>   extern int srat_disabled(void);
> -extern void numa_set_node(int cpu, nodeid_t node);
>   extern nodeid_t setup_node(unsigned int pxm);
>   extern void srat_detect_node(int cpu);
>   
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 258a5cb3db..3972aa6b93 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -70,6 +70,7 @@ extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
>   
>   extern void numa_init_array(void);
>   extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
> +extern void numa_set_node(int cpu, nodeid_t node);
>   extern bool numa_off;
>   extern int numa_fake;
>   
> 

Cheers,

-- 
Julien Grall

