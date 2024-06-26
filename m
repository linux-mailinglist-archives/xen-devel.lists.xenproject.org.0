Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BA69198CC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 22:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749452.1157546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMZ1D-0007vX-VL; Wed, 26 Jun 2024 20:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749452.1157546; Wed, 26 Jun 2024 20:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMZ1D-0007tg-SN; Wed, 26 Jun 2024 20:13:27 +0000
Received: by outflank-mailman (input) for mailman id 749452;
 Wed, 26 Jun 2024 20:13:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sMZ1D-0007ta-4D
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 20:13:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sMZ1C-0007ZU-Pu; Wed, 26 Jun 2024 20:13:26 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sMZ1C-0004W3-IX; Wed, 26 Jun 2024 20:13:26 +0000
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
	bh=8UlCAQUnQ7wKyP9MSHwvz0aZjii0tgqNzYXBxJ8igKA=; b=KEzS4MIirF//bC4qBMg8FDa3gm
	MMw4teGcutc+IWV4suhwuxkdoIRBM7HKlidn0iskpHc0IMKkEDyvKqmCQDDDWrbMCWkezwtIG16JT
	l8fVgzSmgxbiq1C+PTYkf7wjGwzShkrTIOj08Uc0CXi/dULzOL/xKqtHHFWSMsKTxbKU=;
Message-ID: <766b260e-204c-423f-b0e1-c21957b6d169@xen.org>
Date: Wed, 26 Jun 2024 21:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory node
 probing
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, oleksii.kurochko@gmail.com
References: <20240626080428.18480-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240626080428.18480-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 26/06/2024 09:04, Michal Orzel wrote:
> Memory node probing is done as part of early_scan_node() that is called
> for each node with depth >= 1 (root node is at depth 0). According to
> Devicetree Specification v0.4, chapter 3.4, /memory node can only exists
> as a top level node. However, Xen incorrectly considers all the nodes with
> unit node name "memory" as RAM. This buggy behavior can result in a
> failure if there are other nodes in the device tree (at depth >= 2) with
> "memory" as unit node name. An example can be a "memory@xxx" node under
> /reserved-memory. Fix it by introducing device_tree_is_memory_node() to
> perform all the required checks to assess if a node is a proper /memory
> node.
> 
> Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM location and size")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> 4.19: This patch is fixing a possible early boot Xen failure (before main
> console is initialized). In my case it results in a warning "Shattering
> superpage is not supported" and panic "Unable to setup the directmap mappings".
> 
> If this is too late for this patch to go in, we can backport it after the tree
> re-opens.

The code looks correct to me, but I am not sure about merging it to 4.19.

This is not a new bug (in fact has been there since pretty much Xen on 
Arm was created) and we haven't seen any report until today. So in some 
way it would be best to merge it after 4.19 so it can get more testing.

In the other hand, I guess this will block you. Is this a new platform? 
Is it available?

> ---
>   xen/arch/arm/bootfdt.c | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 6e060111d95b..23c968e6955d 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -83,6 +83,32 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
>       return false;
>   }
>   
> +/*
> + * Check if a node is a proper /memory node according to Devicetree
> + * Specification v0.4, chapter 3.4.
> + */
> +static bool __init device_tree_is_memory_node(const void *fdt, int node,
> +                                              int depth)
> +{
> +    const char *type;
> +    int len;
> +
> +    if ( depth != 1 )
> +        return false;
> +
> +    if ( !device_tree_node_matches(fdt, node, "memory") )
> +        return false;
> +
> +    type = fdt_getprop(fdt, node, "device_type", &len);
> +    if ( !type )
> +        return false;
> +
> +    if ( (len <= 0) || strcmp(type, "memory") )

I would consider to use strncmp() to avoid relying on the property to be 
well-formed (i.e. nul-terminated).

> +        return false;
> +
> +    return true;
> +}
> +
>   void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>                                   uint32_t size_cells, paddr_t *start,
>                                   paddr_t *size)
> @@ -448,7 +474,7 @@ static int __init early_scan_node(const void *fdt,
>        * populated. So we should skip the parsing.
>        */
>       if ( !efi_enabled(EFI_BOOT) &&
> -         device_tree_node_matches(fdt, node, "memory") )
> +         device_tree_is_memory_node(fdt, node, depth) )
>           rc = process_memory_node(fdt, node, name, depth,
>                                    address_cells, size_cells, bootinfo_get_mem());
>       else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )

Cheers,

-- 
Julien Grall

