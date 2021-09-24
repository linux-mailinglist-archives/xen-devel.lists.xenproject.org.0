Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC80416902
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194687.346878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZGb-0002IG-Ow; Fri, 24 Sep 2021 00:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194687.346878; Fri, 24 Sep 2021 00:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZGb-0002Ef-Kg; Fri, 24 Sep 2021 00:40:41 +0000
Received: by outflank-mailman (input) for mailman id 194687;
 Fri, 24 Sep 2021 00:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZGa-00024Z-4z
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:40:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d197e321-b655-4bf5-ba12-363477841df3;
 Fri, 24 Sep 2021 00:40:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C30C761211;
 Fri, 24 Sep 2021 00:40:34 +0000 (UTC)
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
X-Inumbo-ID: d197e321-b655-4bf5-ba12-363477841df3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632444035;
	bh=4VAdznDK5uMsDeS8RiIXv+6D21mqHwaZX6t0QAUGsq8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J+TeqtBTERWXz2CYuEgLYUdEFU2WIv4rlesECJQoIwRNiGKfuISfNytrHTaYaccjv
	 RioWxOkaW5wrDM76jLNWMcX2jdlqi3z1Xd8QZYT4EccyIW3tYtoZAkoMlntB4KPp0I
	 v+DAVOk6sDG8BfaZkl60croMjWaIGiYara6g90jKtMIVfaoX7orwnYvBzL47S9P2i5
	 Cot7oivoopDv3W/X4hhJmN/SZlRMCvMOdiaqpFegsMFlzH6PgLeFUS824iLnmmMOae
	 qIEjzxXUqEKwZF3moPWvBCBgvI0zWyUeqGm05xl/MhfwL0SauCo1KS6R+JEpFnyaZi
	 +6HZLhQFVMikw==
Date: Thu, 23 Sep 2021 17:40:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 14/37] xen/x86: use name fw_numa to replace acpi_numa
In-Reply-To: <20210923120236.3692135-15-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231740220.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-15-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers


On Thu, 23 Sep 2021, Wei Chen wrote:
> Xen is using acpi_numa as a switch for ACPI based NUMA. We want to
> use this switch logic for other firmware based NUMA implementation,
> like device tree based NUMA in follow-up patches. As Xen will never
> use both ACPI and device tree based NUMA at runtime. So I rename
> acpi_numa to a more generic name fw_name. This will also allow to
> have the code mostly common.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/numa.c        |  6 +++---
>  xen/arch/x86/setup.c       |  2 +-
>  xen/arch/x86/srat.c        | 10 +++++-----
>  xen/include/asm-x86/acpi.h |  2 +-
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 6bc4ade411..2ef385ae3f 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -51,11 +51,11 @@ cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
>  nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>  
>  bool numa_off;
> -s8 acpi_numa = 0;
> +s8 fw_numa = 0;
>  
>  int srat_disabled(void)
>  {
> -    return numa_off || acpi_numa < 0;
> +    return numa_off || fw_numa < 0;
>  }
>  
>  /*
> @@ -315,7 +315,7 @@ static __init int numa_setup(const char *opt)
>      else if ( !strncmp(opt,"noacpi",6) )
>      {
>          numa_off = false;
> -        acpi_numa = -1;
> +        fw_numa = -1;
>      }
>  #endif
>      else
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index b101565f14..1a2093b554 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -313,7 +313,7 @@ void srat_detect_node(int cpu)
>      node_set_online(node);
>      numa_set_node(cpu, node);
>  
> -    if ( opt_cpu_info && acpi_numa > 0 )
> +    if ( opt_cpu_info && fw_numa > 0 )
>          printk("CPU %d APIC %d -> Node %d\n", cpu, apicid, node);
>  }
>  
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 9276a52138..4921830f94 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -167,7 +167,7 @@ static __init void bad_srat(void)
>  {
>  	int i;
>  	printk(KERN_ERR "SRAT: SRAT not used.\n");
> -	acpi_numa = -1;
> +	fw_numa = -1;
>  	for (i = 0; i < MAX_LOCAL_APIC; i++)
>  		apicid_to_node[i] = NUMA_NO_NODE;
>  	for (i = 0; i < ARRAY_SIZE(pxm2node); i++)
> @@ -242,7 +242,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
>  
>  	apicid_to_node[pa->apic_id] = node;
>  	numa_set_processor_nodes_parsed(node);
> -	acpi_numa = 1;
> +	fw_numa = 1;
>  
>  	if (opt_acpi_verbose)
>  		printk(KERN_INFO "SRAT: PXM %u -> APIC %08x -> Node %u\n",
> @@ -277,7 +277,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
>  	}
>  	apicid_to_node[pa->apic_id] = node;
>  	numa_set_processor_nodes_parsed(node);
> -	acpi_numa = 1;
> +	fw_numa = 1;
>  
>  	if (opt_acpi_verbose)
>  		printk(KERN_INFO "SRAT: PXM %u -> APIC %02x -> Node %u\n",
> @@ -492,7 +492,7 @@ void __init srat_parse_regions(paddr_t addr)
>  	u64 mask;
>  	unsigned int i;
>  
> -	if (acpi_disabled || acpi_numa < 0 ||
> +	if (acpi_disabled || fw_numa < 0 ||
>  	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
>  		return;
>  
> @@ -521,7 +521,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
>  	for (i = 0; i < MAX_NUMNODES; i++)
>  		cutoff_node(i, start, end);
>  
> -	if (acpi_numa <= 0)
> +	if (fw_numa <= 0)
>  		return -1;
>  
>  	if (!nodes_cover_memory()) {
> diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
> index 7032f3a001..83be71fec3 100644
> --- a/xen/include/asm-x86/acpi.h
> +++ b/xen/include/asm-x86/acpi.h
> @@ -101,7 +101,7 @@ extern unsigned long acpi_wakeup_address;
>  
>  #define ARCH_HAS_POWER_INIT	1
>  
> -extern s8 acpi_numa;
> +extern s8 fw_numa;
>  extern int acpi_scan_nodes(u64 start, u64 end);
>  #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
>  
> -- 
> 2.25.1
> 

