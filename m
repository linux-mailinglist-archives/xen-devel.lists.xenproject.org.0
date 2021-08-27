Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A30F3F9AE2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173734.316971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcsD-0007or-Nf; Fri, 27 Aug 2021 14:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173734.316971; Fri, 27 Aug 2021 14:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcsD-0007mZ-KS; Fri, 27 Aug 2021 14:30:25 +0000
Received: by outflank-mailman (input) for mailman id 173734;
 Fri, 27 Aug 2021 14:30:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJcsC-0007mR-I1
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:30:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcsB-0007Fv-Na; Fri, 27 Aug 2021 14:30:23 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcsB-0003vl-Hl; Fri, 27 Aug 2021 14:30:23 +0000
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
	bh=SO+y3ITn3jZx+GAhkAeKGC1FvFxFsrzwoWGRy4pOZbo=; b=0QqKZNTinXbZZfZxexweQB8t/M
	4FiQUXa4eUZjcEbvseGIdUxWhHM1YkrfD6oL50ZCTNk94NVY0D3+iPi+KEMHolT6Eqtox5H5NZ4Yf
	hFdq0ExFNZ9aYpgHeIfKT0mn9pcGijTUO+7k7mK7TQ9Qjh0Xwalzw4+z3gQO9668jGAU=;
Subject: Re: [XEN RFC PATCH 37/40] xen: introduce an arch helper to do NUMA
 init failed fallback
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-38-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <48a54187-3b6b-f98c-3681-906ee3df1694@xen.org>
Date: Fri, 27 Aug 2021 15:30:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-38-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 11/08/2021 11:24, Wei Chen wrote:
> When Xen initialize NUMA failed, some architectures may need to
> do fallback actions. For example, in device tree based NUMA, Arm
> need to reset the distance between any two nodes.

 From the description here, I don't understand why we need to reset the 
distance for Arm but not x86. In fact...

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/numa.c        | 13 +++++++++++++
>   xen/common/numa.c          |  3 +++
>   xen/include/asm-arm/numa.h |  1 +
>   xen/include/asm-x86/numa.h |  6 ++++++
>   4 files changed, 23 insertions(+)
> 
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> index 6eebf8e8bc..2a18c97470 100644
> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -140,3 +140,16 @@ int __init arch_meminfo_get_ram_bank_range(int bank,
>   
>   	return 0;
>   }
> +
> +void __init arch_numa_init_failed_fallback(void)
> +{
> +    int i, j;
> +
> +    /* Reset all node distance to remote_distance */
> +    for ( i = 0; i < MAX_NUMNODES; i++ ) {
> +        for ( j = 0; j < MAX_NUMNODES; j++ ) {
> +            numa_set_distance(i, j,
> +                (i == j) ? NUMA_LOCAL_DISTANCE : NUMA_REMOTE_DISTANCE);
> +        }
> +    }
> +}

... this implementation looks fairly generic. So can you explain why we 
need it on Arm but not x86?

> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index d15c2fc311..88f1594127 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -405,4 +405,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>       cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
>       setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
>                       (u64)end_pfn << PAGE_SHIFT);
> +
> +    /* architecture specified fallback operations */
> +    arch_numa_init_failed_fallback();
>   }
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index dd31324b0b..a3982a94b6 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -28,6 +28,7 @@ extern s8 device_tree_numa;
>   extern void numa_init(bool acpi_off);
>   extern int numa_device_tree_init(const void *fdt);
>   extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
> +extern void arch_numa_init_failed_fallback(void);
>   
>   /*
>    * Temporary for fake NUMA node, when CPU, memory and distance
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index e63869135c..26280b0f3a 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -22,4 +22,10 @@ extern void init_cpu_to_node(void);
>   void srat_parse_regions(u64 addr);
>   unsigned int arch_get_dma_bitsize(void);
>   
> +/* Dummy function for numa init failed in numa_initmem_init */
> +static inline void arch_numa_init_failed_fallback(void)
> +{
> +    return;

NIT: The return is pointless.

> +}
> +
>   #endif
> 

Cheers,

-- 
Julien Grall

