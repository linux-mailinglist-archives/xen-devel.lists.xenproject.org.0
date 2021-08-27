Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551E23F9AF1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173745.316994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJczL-0000zg-P5; Fri, 27 Aug 2021 14:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173745.316994; Fri, 27 Aug 2021 14:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJczL-0000xN-Ku; Fri, 27 Aug 2021 14:37:47 +0000
Received: by outflank-mailman (input) for mailman id 173745;
 Fri, 27 Aug 2021 14:37:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJczJ-0000xH-QW
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:37:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJczI-0007NI-Oa; Fri, 27 Aug 2021 14:37:44 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJczI-0005C7-IG; Fri, 27 Aug 2021 14:37:44 +0000
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
	bh=coMF7dTOE5ugfsWEHwwvMZjjerRD7gYIPcW4O/edRlM=; b=fUa8eoxw9y6oF7MmEnPb4MDOxq
	iZFa2+okJfZLRDbxr1lYkxUIM6AIGwDW6Q7bi7eVCWYxMa8y5Rktm8wWA5svFZW3yA3by+sgDFmZQ
	RKQyCEfJiawygjfqMmBh/KTOt+f8qcbwlm45DRmnAgBFpnxkm2jnmaUt4yI64uXOep1o=;
Subject: Re: [XEN RFC PATCH 39/40] xen/x86: move numa_setup to common to
 support NUMA switch in command line
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-40-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4759ddf5-fabb-ebca-9271-38ed5d69b970@xen.org>
Date: Fri, 27 Aug 2021 15:37:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-40-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> Xen x86 has created a command line parameter "numa" as NUMA switch for
> user to turn on/off NUMA. As device tree based NUMA has been enabled
> for Arm, this parameter can be reused by Arm. So in this patch, we move
> this parameter to common.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/x86/numa.c    | 34 ----------------------------------
>   xen/common/numa.c      | 35 ++++++++++++++++++++++++++++++++++-
>   xen/include/xen/numa.h |  1 -
>   3 files changed, 34 insertions(+), 36 deletions(-)
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 8b43be4aa7..380d8ed6fd 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -11,7 +11,6 @@
>   #include <xen/nodemask.h>
>   #include <xen/numa.h>
>   #include <xen/keyhandler.h>
> -#include <xen/param.h>
>   #include <xen/time.h>
>   #include <xen/smp.h>
>   #include <xen/pfn.h>
> @@ -19,9 +18,6 @@
>   #include <xen/sched.h>
>   #include <xen/softirq.h>
>   
> -static int numa_setup(const char *s);
> -custom_param("numa", numa_setup);
> -
>   #ifndef Dprintk
>   #define Dprintk(x...)
>   #endif
> @@ -50,35 +46,6 @@ void numa_set_node(int cpu, nodeid_t node)
>       cpu_to_node[cpu] = node;
>   }
>   
> -/* [numa=off] */
> -static __init int numa_setup(const char *opt)
> -{
> -    if ( !strncmp(opt,"off",3) )
> -        numa_off = true;
> -    else if ( !strncmp(opt,"on",2) )
> -        numa_off = false;
> -#ifdef CONFIG_NUMA_EMU
> -    else if ( !strncmp(opt, "fake=", 5) )
> -    {
> -        numa_off = false;
> -        numa_fake = simple_strtoul(opt+5,NULL,0);
> -        if ( numa_fake >= MAX_NUMNODES )
> -            numa_fake = MAX_NUMNODES;
> -    }
> -#endif
> -#ifdef CONFIG_ACPI_NUMA
> -    else if ( !strncmp(opt,"noacpi",6) )
> -    {
> -        numa_off = false;
> -        acpi_numa = -1;
> -    }
> -#endif
> -    else
> -        return -EINVAL;
> -
> -    return 0;
> -}
> -
>   /*
>    * Setup early cpu_to_node.
>    *
> @@ -287,4 +254,3 @@ static __init int register_numa_trigger(void)
>       return 0;
>   }
>   __initcall(register_numa_trigger);
> -
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index 88f1594127..c98eb8d571 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -14,8 +14,12 @@
>   #include <xen/smp.h>
>   #include <xen/pfn.h>
>   #include <xen/sched.h>
> +#include <xen/param.h>
>   #include <asm/acpi.h>
>   
> +static int numa_setup(const char *s);
> +custom_param("numa", numa_setup);
> +
>   struct node_data node_data[MAX_NUMNODES];
>   
>   /* Mapping from pdx to node id */
> @@ -324,7 +328,7 @@ int __init numa_scan_nodes(u64 start, u64 end)
>   }
>   
>   #ifdef CONFIG_NUMA_EMU
> -int numa_fake __initdata = 0;
> +static int numa_fake __initdata = 0;
>   
>   /* Numa emulation */
>   static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
> @@ -409,3 +413,32 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>       /* architecture specified fallback operations */
>       arch_numa_init_failed_fallback();
>   }
> +
> +/* [numa=off] */

The documentation also needs be be updated to reflect that facts this 
option is not architecture-agnostic.

> +static __init int numa_setup(const char *opt)
> +{
> +    if ( !strncmp(opt,"off",3) )
> +        numa_off = true;
> +    else if ( !strncmp(opt,"on",2) )
> +        numa_off = false;
> +#ifdef CONFIG_NUMA_EMU
> +    else if ( !strncmp(opt, "fake=", 5) )
> +    {
> +        numa_off = false;
> +        numa_fake = simple_strtoul(opt+5,NULL,0);
> +        if ( numa_fake >= MAX_NUMNODES )
> +            numa_fake = MAX_NUMNODES;
> +    }
> +#endif
> +#ifdef CONFIG_ACPI_NUMA
> +    else if ( !strncmp(opt,"noacpi",6) )
> +    {
> +        numa_off = false;
> +        acpi_numa = -1;
> +    }
> +#endif

Looking at this code, I am not quite too sure to understand the 
difference between between "numa=noacpi" and "numa=off".

In fact, I am tempted to say this option should disappear because this 
is odd to have a firmware specific option just for ACPI but not DT. Even 
if we have one for each, this makes things a bit more complicated for 
the admin.

> +    else
> +        return -EINVAL;
> +
> +    return 0;
> +}
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index b9b5d1ad88..c647fef736 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -83,7 +83,6 @@ extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
>   extern void numa_set_node(int cpu, nodeid_t node);
>   extern int numa_scan_nodes(u64 start, u64 end);
>   extern bool numa_off;
> -extern int numa_fake;
>   extern s8 acpi_numa;
>   
>   extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
> 

Cheers,

-- 
Julien Grall

