Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D4416901
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:40:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194684.346865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZGK-0001nW-ES; Fri, 24 Sep 2021 00:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194684.346865; Fri, 24 Sep 2021 00:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZGK-0001lK-B5; Fri, 24 Sep 2021 00:40:24 +0000
Received: by outflank-mailman (input) for mailman id 194684;
 Fri, 24 Sep 2021 00:40:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZGI-0001kJ-RP
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:40:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd93dfc8-1ccf-11ec-ba94-12813bfff9fa;
 Fri, 24 Sep 2021 00:40:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D94960F3A;
 Fri, 24 Sep 2021 00:40:17 +0000 (UTC)
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
X-Inumbo-ID: fd93dfc8-1ccf-11ec-ba94-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632444017;
	bh=sEK9rVy9pf6fi5/98YAuKPliIj45WL/ianbNclHQWSw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hCAdwaESoSMKLH7XsGzIrjSF9rZGZyWklOempQImtfuiYDoa4351AdRdnb3K17Fwy
	 nEQQbU1h6mbmCSyPTn+Eb40CKG3Zj3cIPSkxzA6v8BMLtZHeb9UjtGyJdJWhpgyjp9
	 Lyyyc3KRoJUBT0U8ty/VEzbhV2RmJTPzLu14teNPuFP3VikRLxs/Wxyp0j5XqnB1Aj
	 c7gMguSYEGW1wk9slaFf06JZTQLncak4C/O6T6/Xl+hxDJLTKpGq+fnoxqMU0CoePx
	 Jx31V98mG05WXurgZ/IB6ozlGtkR5KsNDCDwRjjLXj+l1yahJcHz6Y2O6qzHgJ++OU
	 PzIQW4fOFlvFA==
Date: Thu, 23 Sep 2021 17:40:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 13/37] xen/x86: decouple processor_nodes_parsed from acpi
 numa functions
In-Reply-To: <20210923120236.3692135-14-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231740070.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-14-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers


On Thu, 23 Sep 2021, Wei Chen wrote:
> Xen is using processor_nodes_parsed to record parsed processor nodes
> from ACPI table or other firmware provided resource table. This
> variable is used in ACPI numa functions directly. In follow-up
> patchs, neutral NUMA code will be abstracted and move to other files.
> So in this patch, we introduce numa_set_processor_nodes_parsed helper
> to decouple processor_nodes_parsed from acpi numa functions.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/srat.c        | 9 +++++++--
>  xen/include/asm-x86/numa.h | 1 +
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index aa07a7e975..9276a52138 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -104,6 +104,11 @@ nodeid_t setup_node(unsigned pxm)
>  	return node;
>  }
>  
> +void  __init numa_set_processor_nodes_parsed(nodeid_t node)
> +{
> +	node_set(node, processor_nodes_parsed);
> +}
> +
>  bool __init numa_memblks_available(void)
>  {
>  	if (num_node_memblks < NR_NODE_MEMBLKS)
> @@ -236,7 +241,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
>  	}
>  
>  	apicid_to_node[pa->apic_id] = node;
> -	node_set(node, processor_nodes_parsed);
> +	numa_set_processor_nodes_parsed(node);
>  	acpi_numa = 1;
>  
>  	if (opt_acpi_verbose)
> @@ -271,7 +276,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
>  		return;
>  	}
>  	apicid_to_node[pa->apic_id] = node;
> -	node_set(node, processor_nodes_parsed);
> +	numa_set_processor_nodes_parsed(node);
>  	acpi_numa = 1;
>  
>  	if (opt_acpi_verbose)
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index 78e044a390..295f875a51 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -77,6 +77,7 @@ extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
>  extern bool numa_memblks_available(void);
>  extern int numa_update_node_memblks(nodeid_t node,
>  		paddr_t start, paddr_t size, bool hotplug);
> +extern void numa_set_processor_nodes_parsed(nodeid_t node);
>  
>  void srat_parse_regions(paddr_t addr);
>  extern u8 __node_distance(nodeid_t a, nodeid_t b);
> -- 
> 2.25.1
> 

