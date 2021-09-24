Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF26416900
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194679.346854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZFL-0000TF-4W; Fri, 24 Sep 2021 00:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194679.346854; Fri, 24 Sep 2021 00:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZFL-0000Qd-1Q; Fri, 24 Sep 2021 00:39:23 +0000
Received: by outflank-mailman (input) for mailman id 194679;
 Fri, 24 Sep 2021 00:39:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZFJ-0000QP-Cu
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:39:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db18646e-1ccf-11ec-ba94-12813bfff9fa;
 Fri, 24 Sep 2021 00:39:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9960061211;
 Fri, 24 Sep 2021 00:39:19 +0000 (UTC)
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
X-Inumbo-ID: db18646e-1ccf-11ec-ba94-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632443959;
	bh=eMtkefiv+ueAHUaY0PD++Te6w5032p/saixDgl6EPuU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ykxv//gr3ubWcTEqRFvuvOTv+AtciCSFnmve7tgh2mexgEUMOEfr5/O3bPrB7rRJh
	 RW0IOGpbUS7FlPRe3x0Y8ca7rXWpp02bJEG50lxTAW1Q77v7nu3lv3EN97cpbJt7BD
	 2Ifmj8grszILHU5GYPUB5ZBpTtUODSXXqhf7XOirCw9vA83ByC/14C+G5sCBBE4Tlj
	 HKuXkmurEuxrC3fvBSjetP9okno7W7KwYLvW0pvOBSmldBD323581sGDq9MoXeMnZO
	 W+IOaibN7aUHudQGl+sijE17w2BcbhcxIpIddBMPH5fIynGnIFzbfQ0r9AK0nFaNC8
	 pztttjj/ztYAg==
Date: Thu, 23 Sep 2021 17:39:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820
 map
In-Reply-To: <20210923120236.3692135-13-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231739050.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-13-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers


On Thu, 23 Sep 2021, Wei Chen wrote:
> We will reuse nodes_cover_memory for Arm to check its bootmem
> info. So we introduce two arch helpers to get memory map's
> entry number and specified entry's range:
>     arch_get_memory_bank_number
>     arch_get_memory_bank_range
> 
> Depends above two helpers, we make nodes_cover_memory become
> architecture independent. And the only change from an x86
> perspective is the additional checks:
>   !start || !end
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/numa.c        | 18 ++++++++++++++++++
>  xen/arch/x86/srat.c        | 11 ++++-------
>  xen/include/asm-x86/numa.h |  3 +++
>  3 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 6337bbdf31..6bc4ade411 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -378,6 +378,24 @@ unsigned int arch_have_default_dmazone(void)
>      return ( num_online_nodes() > 1 ) ? 1 : 0;
>  }
>  
> +uint32_t __init arch_meminfo_get_nr_bank(void)
> +{
> +	return e820.nr_map;
> +}
> +
> +int __init arch_meminfo_get_ram_bank_range(uint32_t bank,
> +	paddr_t *start, paddr_t *end)
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
> index 18bc6b19bb..aa07a7e975 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -419,17 +419,14 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  static int __init nodes_cover_memory(void)
>  {
>  	int i;
> +	uint32_t nr_banks = arch_meminfo_get_nr_bank();
>  
> -	for (i = 0; i < e820.nr_map; i++) {
> +	for (i = 0; i < nr_banks; i++) {
>  		int j, found;
>  		paddr_t start, end;
>  
> -		if (e820.map[i].type != E820_RAM) {
> +		if (arch_meminfo_get_ram_bank_range(i, &start, &end))
>  			continue;
> -		}
> -
> -		start = e820.map[i].addr;
> -		end = e820.map[i].addr + e820.map[i].size;
>  
>  		do {
>  			found = 0;
> @@ -448,7 +445,7 @@ static int __init nodes_cover_memory(void)
>  		} while (found && start < end);
>  
>  		if (start < end) {
> -			printk(KERN_ERR "SRAT: No PXM for e820 range: "
> +			printk(KERN_ERR "SRAT: No NODE for memory map range: "
>  				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
>  			return 0;
>  		}
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index 5772a70665..78e044a390 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -82,5 +82,8 @@ void srat_parse_regions(paddr_t addr);
>  extern u8 __node_distance(nodeid_t a, nodeid_t b);
>  unsigned int arch_get_dma_bitsize(void);
>  unsigned int arch_have_default_dmazone(void);
> +extern uint32_t arch_meminfo_get_nr_bank(void);
> +extern int arch_meminfo_get_ram_bank_range(uint32_t bank,
> +    paddr_t *start, paddr_t *end);
>  
>  #endif
> -- 
> 2.25.1
> 

