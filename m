Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF43FC059
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 03:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175393.319568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsFd-00037x-1i; Tue, 31 Aug 2021 01:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175393.319568; Tue, 31 Aug 2021 01:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsFc-000356-V2; Tue, 31 Aug 2021 01:07:44 +0000
Received: by outflank-mailman (input) for mailman id 175393;
 Tue, 31 Aug 2021 01:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mKsFb-000350-Ob
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 01:07:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f91cd22-b6fa-4e89-9df1-ccc327575b76;
 Tue, 31 Aug 2021 01:07:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E780460FF2;
 Tue, 31 Aug 2021 01:07:41 +0000 (UTC)
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
X-Inumbo-ID: 3f91cd22-b6fa-4e89-9df1-ccc327575b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630372062;
	bh=dj3LXRUeaLfQqrDYcn6jdtmyWGlRMe7c/lnewJRaE2k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WxfZ2T3XujqRq6vtZt+16ICN8yfmpDKW5Sdvuem2KLjGsu0OULrLTgeC+2oM8Y/sS
	 avm4r5PDBrx5YAfswXpTELwlzq0HuCIOMg9OoGN/LIpEWX4nOx2mHOh+SzNKPWAwSg
	 2ayjJYAbXB5ZQpikLar51ZA1h1Cr8e86m00IwaRwgK6kp7vT4Is5LIKM+lWqEBYgTn
	 ZdOxirkQENhtUE0BbNpdXV1SOcOZ0Y3v89xG+404cmL+wXduPVSw/W0vqriby9lN6g
	 UY5I3JGjZTiP2CD9nNvIOHybIvi4cOXSpuFDx2JpNolOXfaM23TPTWIsm+ectPG6Lg
	 sUqgekfdoxQEQ==
Date: Mon, 30 Aug 2021 18:07:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 28/40] xen/x86: decouple nodes_cover_memory with
 E820 map
In-Reply-To: <20210811102423.28908-29-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108301807020.17851@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-29-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> We will reuse nodes_cover_memory for Arm to check its bootmem
> info. So we introduce two arch helpers to get memory map's
> entry number and specified entry's range:
>     arch_get_memory_bank_number
>     arch_get_memory_bank_range
> 
> Depends above two helpers, we make nodes_cover_memory become
> architecture independent.

You might want to note that the only change from an x86 perspective is
the additional checks:

  !start || !end


> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/numa.c    | 18 ++++++++++++++++++
>  xen/arch/x86/srat.c    |  8 +++-----
>  xen/include/xen/numa.h |  4 ++++
>  3 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 6908738305..8b43be4aa7 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -128,6 +128,24 @@ unsigned int __init arch_get_dma_bitsize(void)
>                   + PAGE_SHIFT, 32);
>  }
>  
> +uint32_t __init arch_meminfo_get_nr_bank(void)
> +{
> +	return e820.nr_map;
> +}
> +
> +int __init arch_meminfo_get_ram_bank_range(int bank,
> +	unsigned long long *start, unsigned long long *end)
> +{
> +	if (e820.map[bank].type != E820_RAM || !start || !end) {
> +		return -1;
> +	}
> +
> +	*start = e820.map[bank].addr;
> +	*end = e820.map[bank].addr + e820.map[bank].size;
> +
> +	return 0;
> +}
> +
>  static void dump_numa(unsigned char key)
>  {
>      s_time_t now = NOW();
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 6d68b8a614..2298353846 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -316,18 +316,16 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  static int __init nodes_cover_memory(void)
>  {
>  	int i;
> +	uint32_t nr_banks = arch_meminfo_get_nr_bank();
>  
> -	for (i = 0; i < e820.nr_map; i++) {
> +	for (i = 0; i < nr_banks; i++) {
>  		int j, found;
>  		unsigned long long start, end;
>  
> -		if (e820.map[i].type != E820_RAM) {
> +		if (arch_meminfo_get_ram_bank_range(i, &start, &end)) {
>  			continue;
>  		}
>  
> -		start = e820.map[i].addr;
> -		end = e820.map[i].addr + e820.map[i].size;
> -
>  		do {
>  			found = 0;
>  			for_each_node_mask(j, memory_nodes_parsed)
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 0475823b13..6d18059bcd 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -89,6 +89,10 @@ static inline void clear_node_cpumask(int cpu)
>  	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
>  }
>  
> +extern uint32_t arch_meminfo_get_nr_bank(void);
> +extern int arch_meminfo_get_ram_bank_range(int bank,
> +    unsigned long long *start, unsigned long long *end);
> +
>  #endif /* CONFIG_NUMA */
>  
>  #endif /* _XEN_NUMA_H */
> -- 
> 2.25.1
> 

