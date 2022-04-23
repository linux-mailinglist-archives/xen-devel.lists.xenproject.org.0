Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B150CC59
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 18:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311722.528970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niIof-0007sQ-K7; Sat, 23 Apr 2022 16:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311722.528970; Sat, 23 Apr 2022 16:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niIof-0007ov-Gl; Sat, 23 Apr 2022 16:41:01 +0000
Received: by outflank-mailman (input) for mailman id 311722;
 Sat, 23 Apr 2022 16:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nM19=VB=bombadil.srs.infradead.org=BATV+786c894e6a19374922de+6817+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1niIod-0007oW-N9
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 16:40:59 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26133643-c324-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 18:40:57 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1niIoX-004edG-Bn; Sat, 23 Apr 2022 16:40:53 +0000
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
X-Inumbo-ID: 26133643-c324-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2MvqW49dlfPXlTFO4cVz6jW0fsGriUccE1VFxe7rooQ=; b=4CpgKtZWpr1YvrwrgR0PVODSfR
	eFHq3GErIpjs8WXAaxmLwUJKW2Z//2hg9eashRdzhcM19R6oVxxqIxAe6YlPuPVuItoTu4azCvfr2
	pGg65CQ/FdUzZKmE6ubYHxzYTixg9YZgL+KZeg+2Hf6FBRSvPF83kFxQ+JjE8EUs6qRpgGpXw+r1e
	ukp3Ji2ELJKv1OizDiizyYel4rZFkUXo+rKGnGWuuAZi6cPGZi7Gj7OSWaq4fKE93lQDwpAxnqKSd
	7sMpv5r84yTKbhECYHDRHM16S9tNaakXyhMW2GipLr8jLem2OCOeIy90YqNtk/EF11ryDiHiAuK4s
	nqKdocew==;
Date: Sat, 23 Apr 2022 09:40:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Juergen Gross <jgross@suse.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
Message-ID: <YmQsFb36UEH9BUnN@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Please split this into one patch that creates grant-dma-ops, and another
that sets up the virtio restricted access helpers.

> +
> +#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
> +int arch_has_restricted_virtio_memory_access(void)
> +{
> +	return (xen_has_restricted_virtio_memory_access() ||
> +			cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT));
> +}

So instead of hardcoding Xen here, this seems like a candidate for
another cc_platform_has flag.

> +config XEN_VIRTIO
> +	bool "Xen virtio support"
> +	default n

n is the default default, so no need to specify it.

> +// SPDX-License-Identifier: GPL-2.0-only
> +/******************************************************************************

The all * line is not the usual kernel style, I'd suggest to drop it.

> +static struct page *xen_grant_dma_alloc_pages(struct device *dev, size_t size,
> +					      dma_addr_t *dma_handle,
> +					      enum dma_data_direction dir,
> +					      gfp_t gfp)
> +{
> +	WARN_ONCE(1, "xen_grant_dma_alloc_pages size %zu\n", size);
> +	return NULL;
> +}
> +
> +static void xen_grant_dma_free_pages(struct device *dev, size_t size,
> +				     struct page *vaddr, dma_addr_t dma_handle,
> +				     enum dma_data_direction dir)
> +{
> +	WARN_ONCE(1, "xen_grant_dma_free_pages size %zu\n", size);
> +}

Please just wire this up to the same implementation as .alloc and .free.

> +	spin_lock(&xen_grant_dma_lock);
> +	list_add(&data->list, &xen_grant_dma_devices);
> +	spin_unlock(&xen_grant_dma_lock);

Hmm, having to do this device lookup for every DMA operation is going
to suck. It might make sense to add a private field (e.g. as a union
with the iommu field) in struct device instead.

But if not you probably want to switch to a more efficient data
structure like the xarray at least.

> +EXPORT_SYMBOL_GPL(xen_grant_setup_dma_ops);

I don't think this has any modular users, or did I miss something?

