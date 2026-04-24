Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CUuAzD862lbTgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2026 01:26:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B246409A
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2026 01:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294063.1571330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGPub-0003Wk-9G; Fri, 24 Apr 2026 23:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294063.1571330; Fri, 24 Apr 2026 23:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGPub-0003UK-6Z; Fri, 24 Apr 2026 23:26:17 +0000
Received: by outflank-mailman (input) for mailman id 1294063;
 Fri, 24 Apr 2026 23:26:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wGPuZ-0003UE-87
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 23:26:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGPuY-00GAmQ-AX
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2026 01:26:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69ebfbb4-e002-0a2a0a5209dd-0a2a450698c6-28
 for <xen-devel@lists.xenproject.org>; Sat, 25 Apr 2026 01:26:14 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69ebfc15-7371-0a2a45060019-ac6904fec59a-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Apr 2026 01:26:13 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B16F7600AE;
 Fri, 24 Apr 2026 23:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CDAC19425;
 Fri, 24 Apr 2026 23:26:12 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777073172;
	bh=kyRqrvgm9QqjIN/vVRy0hj3rI8A+watg1fyfjslJQIM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UwwfIxM4JV7wubgaeaYSQkjbGQNgnAwrfN/4+zeuwVqFMOA0LSHbOKzFln0vWgY0G
	 bTiMyd3Q10e9NYCZ3UyicG+k31XBupmLmYGtAsO7td/GNnFlQsspxbnwVXzZ+pKqdE
	 zo/Of9k44IjrCFYqr4wIBJq+oj/q+SXjdtLG1BQuG4rbL+cG7SwhouCa5FO9YiecFI
	 bbK5zj0gbiAy7TzPZILS8p7hCtGThM+owN4VxQwqb6UyJHlUWffG11Smcaiy7m+1Ed
	 lmeBvIX4Jvcr8aG3uOoa4h8iThbEMi9TIRzn/b963ZpF+40oQTde0yCyYn9/4HZANp
	 4aPZHgoN81vOw==
Date: Fri, 24 Apr 2026 16:26:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, iommu@lists.linux.dev, 
    linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
    michal.orzel@amd.com
Subject: Re: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device
 DMA memory
In-Reply-To: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
Message-ID: <alpine.DEB.2.22.394.2604241617450.6871@ubuntu-linux-20-04-desktop>
References: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-16d1c6/1777073174-91079D75-C62A58CB/0/0
X-purgate-type: clean
X-purgate-size: 4208
X-Rspamd-Queue-Id: 5C3B246409A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,nxp.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:peng.fan@nxp.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

+Michal

On Wed, 15 Apr 2026, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> On ARM64, arch_sync_dma_for_{cpu,device}() assumes that the
> physical address passed in refers to normal RAM that is part of the
> kernel linear(direct) mapping, as it unconditionally derives a CPU
> virtual address via phys_to_virt().
> 
> With Xen swiotlb, devices may use per-device coherent DMA memory,
> such as reserved-memory regions described by 'shared-dma-pool',
> which are assigned to dev->dma_mem. These regions may be marked
> no-map in DT and therefore are not part of the kernel linear map.
> In such cases, pfn_valid() still returns true, but phys_to_virt()
> is not valid and cache maintenance via arch_sync_dma_* will fault.
> 
> Prevent this by excluding devices with a private DMA memory pool
> (dev->dma_mem) from the arch_sync_dma_* fast path, and always
> fall back to xen_dma_sync_* for those devices to avoid invalid
> phys_to_virt() conversions for no-map DMA memory while preserving the
> existing fast path for normal, linear-mapped RAM.

This might not work either: the Xen side implementation is
xen/common/grant_table.c:_cache_flush.

Could you please check? From looking at the code,
page_get_owner_and_reference might return NULL for pages part of
reserved-memory regions marked as no-map.

In which case, the Xen hypercall should return -EPERM.



> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/xen/swiotlb-xen.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 2cbf2b588f5b20cfbf9e83a8339dc22092c9559a..b1445df99d9a8f1d18a83b8c413bada6e5579209 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -195,6 +195,11 @@ xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
>  }
>  #endif /* CONFIG_X86 */
>  
> +static inline bool dev_has_private_dma_pool(struct device *dev)
> +{
> +	return dev && dev->dma_mem;
> +}
> +
>  /*
>   * Map a single buffer of the indicated size for DMA in streaming mode.  The
>   * physical address to use is returned.
> @@ -262,7 +267,8 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
>  
>  done:
>  	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
> -		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr)))) {
> +		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr))) &&
> +		    !dev_has_private_dma_pool(dev)) {
>  			arch_sync_dma_for_device(phys, size, dir);
>  			arch_sync_dma_flush();
>  		} else {
> @@ -289,7 +295,8 @@ static void xen_swiotlb_unmap_phys(struct device *hwdev, dma_addr_t dev_addr,
>  	BUG_ON(dir == DMA_NONE);
>  
>  	if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
> -		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr)))) {
> +		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr))) &&
> +		    !dev_has_private_dma_pool(hwdev)) {
>  			arch_sync_dma_for_cpu(paddr, size, dir);
>  			arch_sync_dma_flush();
>  		} else {
> @@ -312,7 +319,8 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
>  	struct io_tlb_pool *pool;
>  
>  	if (!dev_is_dma_coherent(dev)) {
> -		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr)))) {
> +		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))) &&
> +		    !dev_has_private_dma_pool(dev)) {
>  			arch_sync_dma_for_cpu(paddr, size, dir);
>  			arch_sync_dma_flush();
>  		} else {
> @@ -337,7 +345,8 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
>  		__swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
>  
>  	if (!dev_is_dma_coherent(dev)) {
> -		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr)))) {
> +		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))) &&
> +		    !dev_has_private_dma_pool(dev)) {
>  			arch_sync_dma_for_device(paddr, size, dir);
>  			arch_sync_dma_flush();
>  		} else {
> 
> ---
> base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
> change-id: 20260415-xen-swiotlb-34a198b6c1d6
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

