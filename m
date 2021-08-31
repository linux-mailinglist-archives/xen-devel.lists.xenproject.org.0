Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E0F3FC06A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 03:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175402.319579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsOO-0004hF-Vm; Tue, 31 Aug 2021 01:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175402.319579; Tue, 31 Aug 2021 01:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsOO-0004eW-RY; Tue, 31 Aug 2021 01:16:48 +0000
Received: by outflank-mailman (input) for mailman id 175402;
 Tue, 31 Aug 2021 01:16:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mKsON-0004eO-Be
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 01:16:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c9638ad-8006-4cba-9ab4-f12118b8f5a8;
 Tue, 31 Aug 2021 01:16:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5539661027;
 Tue, 31 Aug 2021 01:16:45 +0000 (UTC)
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
X-Inumbo-ID: 7c9638ad-8006-4cba-9ab4-f12118b8f5a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630372605;
	bh=EMMkERme4bpHAO3lHAWCo82aopT/ZGILAKLGIOpu4RA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HbxXq7GUQ3gZJmL85C+bo+sXtnxYi1y9Dscchk6CQ2JvsM1oaKBNLg4pLLhUQ98VS
	 ztmRBAgOKsJM/pflQumJkMKqWMy9NBFotzh/S0sjRdGaXUmUvbI4qpv3A1NT08doFv
	 KZHmtmuKU5iM4Y0D69cipz0iPrM3ViybmQ7blELqh5Ci1fLbUHpliPWapl/w5/C8cG
	 k2d98e+KNh90Ke6nxIFMmuNjJJuFc9VPtARBo2M9R3JrCrnodn7iLvTcWsfowRA8fc
	 JxMS6WEZJLA1SgY3Ocl8doSQ7G843P+WBue5wxTivTJFqf3/odUM09MZoFuAdrZKau
	 jPD0ba5Ujjs+A==
Date: Mon, 30 Aug 2021 18:16:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 31/40] xen/x86: move nodes_cover_memory to
 common
In-Reply-To: <20210811102423.28908-32-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108301813320.17851@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-32-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> Not only ACPU NUMA, but also Arm device tree based NUMA
> will use nodes_cover_memory to do sanity check. So we move
> this function from arch/x86 to common.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/srat.c    | 40 ----------------------------------------
>  xen/common/numa.c      | 40 ++++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/numa.h |  1 +
>  3 files changed, 41 insertions(+), 40 deletions(-)
> 
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index dd3aa30843..dcebc7adec 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -308,46 +308,6 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  	num_node_memblks++;
>  }
>  
> -/* Sanity check to catch more bad SRATs (they are amazingly common).
> -   Make sure the PXMs cover all memory. */
> -static int __init nodes_cover_memory(void)
> -{
> -	int i;
> -	uint32_t nr_banks = arch_meminfo_get_nr_bank();
> -
> -	for (i = 0; i < nr_banks; i++) {
> -		int j, found;
> -		unsigned long long start, end;
> -
> -		if (arch_meminfo_get_ram_bank_range(i, &start, &end)) {
> -			continue;
> -		}
> -
> -		do {
> -			found = 0;
> -			for_each_node_mask(j, memory_nodes_parsed)
> -				if (start < nodes[j].end
> -				    && end > nodes[j].start) {
> -					if (start >= nodes[j].start) {
> -						start = nodes[j].end;
> -						found = 1;
> -					}
> -					if (end <= nodes[j].end) {
> -						end = nodes[j].start;
> -						found = 1;
> -					}
> -				}
> -		} while (found && start < end);
> -
> -		if (start < end) {
> -			printk(KERN_ERR "SRAT: No PXM for e820 range: "
> -				"%016Lx - %016Lx\n", start, end);
> -			return 0;
> -		}
> -	}
> -	return 1;
> -}
> -
>  void __init acpi_numa_arch_fixup(void) {}
>  
>  static uint64_t __initdata srat_region_mask;
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index 79ab250543..74960885a6 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -193,6 +193,46 @@ void __init cutoff_node(int i, u64 start, u64 end)
>  	}
>  }
>  
> +/* Sanity check to catch more bad SRATs (they are amazingly common).
> +   Make sure the PXMs cover all memory. */
> +int __init nodes_cover_memory(void)
> +{
> +	int i;
> +	uint32_t nr_banks = arch_meminfo_get_nr_bank();
> +
> +	for (i = 0; i < nr_banks; i++) {
> +		int j, found;
> +		unsigned long long start, end;
> +
> +		if (arch_meminfo_get_ram_bank_range(i, &start, &end)) {
> +			continue;
> +		}
> +
> +		do {
> +			found = 0;
> +			for_each_node_mask(j, memory_nodes_parsed)
> +				if (start < nodes[j].end
> +				    && end > nodes[j].start) {
> +					if (start >= nodes[j].start) {
> +						start = nodes[j].end;
> +						found = 1;
> +					}
> +					if (end <= nodes[j].end) {
> +						end = nodes[j].start;
> +						found = 1;
> +					}
> +				}
> +		} while (found && start < end);
> +
> +		if (start < end) {
> +			printk(KERN_ERR "SRAT: No PXM for e820 range: "
> +				"%016Lx - %016Lx\n", start, end);

I don't know if you are already doing this in a later patch but the
message shouldn't say e820 as it doesn't exist on all architecture.
Maybe "for address range" or "for memory range" would suffice.

Normally we don't do change together with code movement but in this case
I think it would be OK.

