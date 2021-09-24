Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57830416903
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194689.346888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZGm-0002iX-4H; Fri, 24 Sep 2021 00:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194689.346888; Fri, 24 Sep 2021 00:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZGm-0002gU-0k; Fri, 24 Sep 2021 00:40:52 +0000
Received: by outflank-mailman (input) for mailman id 194689;
 Fri, 24 Sep 2021 00:40:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZGk-0002bg-5W
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:40:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3619d34e-7c90-43e6-ae6f-21e23c2bb8c4;
 Fri, 24 Sep 2021 00:40:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D31461211;
 Fri, 24 Sep 2021 00:40:47 +0000 (UTC)
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
X-Inumbo-ID: 3619d34e-7c90-43e6-ae6f-21e23c2bb8c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632444047;
	bh=KlzvEBlrAj3KfMIRLLDTGuTGCbdiigud5SjmjPEGICQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eCBrXR515xDmsgPiJGarco3YaQT2yyM1XU865B9VCwyXb/Hbw5X1YIkR5WJE/HbaT
	 sU7JcJ+M3/JxBBl3hCkoUjMubvNZ3saMyTcfHYu8x//AkTVJimssj/6XYHW9Jw4862
	 7PVUzfEIqTh0pylNiRVpjiLTq/sKrbD8dZ/HPtCxihdRWJa5/Dq4YDMRmgRVcLxuhG
	 YlYS/DCYeTMJjoJu7yY4gVJ+XqygQ6gzOK6co2YZ+B/H/jZhKEgVG3kEGGsjFMMMXv
	 bJW6oISPh2ysfC2NnOkot8pM/AcnP/jG9soOCQY/HgmCU5Srvz6td/rr83IDsZ/Rbo
	 B2oOWDADTF7VQ==
Date: Thu, 23 Sep 2021 17:40:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 15/37] xen/x86: rename acpi_scan_nodes to
 numa_scan_nodes
In-Reply-To: <20210923120236.3692135-16-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231740400.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-16-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers


On Thu, 23 Sep 2021, Wei Chen wrote:
> The most code in acpi_scan_nodes can be reused by other NUMA
> implementation. Rename acpi_scan_nodes to a more generic name
> numa_scan_nodes, and replace BIOS to Firmware in print message,
> as BIOS is x86 specific name.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/numa.c        | 2 +-
>  xen/arch/x86/srat.c        | 4 ++--
>  xen/include/asm-x86/acpi.h | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 2ef385ae3f..8a4710df39 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -261,7 +261,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>      end = pfn_to_paddr(end_pfn);
>  
>  #ifdef CONFIG_ACPI_NUMA
> -    if ( !numa_off && !acpi_scan_nodes(start, end) )
> +    if ( !numa_off && !numa_scan_nodes(start, end) )
>          return;
>  #endif
>  
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 4921830f94..0b8b0b0c95 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -512,7 +512,7 @@ void __init srat_parse_regions(paddr_t addr)
>  }
>  
>  /* Use the information discovered above to actually set up the nodes. */
> -int __init acpi_scan_nodes(paddr_t start, paddr_t end)
> +int __init numa_scan_nodes(paddr_t start, paddr_t end)
>  {
>  	int i;
>  	nodemask_t all_nodes_parsed;
> @@ -547,7 +547,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
>  		paddr_t size = nodes[i].end - nodes[i].start;
>  		if ( size == 0 )
>  			printk(KERN_WARNING "SRAT: Node %u has no memory. "
> -			       "BIOS Bug or mis-configured hardware?\n", i);
> +			       "Firmware Bug or mis-configured hardware?\n", i);
>  
>  		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
>  	}
> diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
> index 83be71fec3..2add971072 100644
> --- a/xen/include/asm-x86/acpi.h
> +++ b/xen/include/asm-x86/acpi.h
> @@ -102,7 +102,7 @@ extern unsigned long acpi_wakeup_address;
>  #define ARCH_HAS_POWER_INIT	1
>  
>  extern s8 fw_numa;
> -extern int acpi_scan_nodes(u64 start, u64 end);
> +extern int numa_scan_nodes(u64 start, u64 end);
>  #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
>  
>  extern struct acpi_sleep_info acpi_sinfo;
> -- 
> 2.25.1
> 

