Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62CB2CBC7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 20:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086950.1445109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQyk-0003du-TJ; Tue, 19 Aug 2025 18:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086950.1445109; Tue, 19 Aug 2025 18:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQyk-0003cH-QV; Tue, 19 Aug 2025 18:22:38 +0000
Received: by outflank-mailman (input) for mailman id 1086950;
 Tue, 19 Aug 2025 18:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNib=27=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1uoQyj-0003c9-3D
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 18:22:37 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7abc0eb4-7d29-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 20:22:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 594E960209;
 Tue, 19 Aug 2025 18:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8557CC4CEF1;
 Tue, 19 Aug 2025 18:22:32 +0000 (UTC)
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
X-Inumbo-ID: 7abc0eb4-7d29-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755627754;
	bh=VSqn6WSqLVd/XpfzgudXSJRo0uPOQ5wyv2bWmCBBnJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=alN6/hwHpvzthoP/KrllDuyPfF9f8yAYQER8+ba4p7ZAaMRpwoXt8rvK6QE3L0ekl
	 bNm+CTndacGb+nR2BKXPNUnvE9okK+nJN6vWKLBypTEbMKpjdWZnobeyYbTdlJBwG3
	 eQhAlRfAJUiGmqIDHRjbObolLDa17Te4yFQpGASd/eKfIFxPevya5z3Kg7b9O2j2pW
	 xGJZckYIQxAQDMxUtnVFWJEEUia3gPTM6PRono+D9/zC602CQuuuu0N45uS/29jmmO
	 kxle5BpRno+jkLFSoQGxLhrpEA9gCkuIidPS0ZJ3bdNRJ1LR7RUOVZQkLijjuMZ2fZ
	 kFmTbvgXjx5hQ==
Date: Tue, 19 Aug 2025 12:22:30 -0600
From: Keith Busch <kbusch@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 11/16] dma-mapping: export new dma_*map_phys()
 interface
Message-ID: <aKTA5i1IZquRBolf@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <bb979e4620b3bdf2878e29b998d982185beefee0.1755624249.git.leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb979e4620b3bdf2878e29b998d982185beefee0.1755624249.git.leon@kernel.org>

On Tue, Aug 19, 2025 at 08:36:55PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Introduce new DMA mapping functions dma_map_phys() and dma_unmap_phys()
> that operate directly on physical addresses instead of page+offset
> parameters. This provides a more efficient interface for drivers that
> already have physical addresses available.
> 
> The new functions are implemented as the primary mapping layer, with
> the existing dma_map_page_attrs()/dma_map_resource() and
> dma_unmap_page_attrs()/dma_unmap_resource() functions converted to simple
> wrappers around the phys-based implementations.
> 
> In case dma_map_page_attrs(), the struct page is converted to physical
> address with help of page_to_phys() function and dma_map_resource()
> provides physical address as is together with addition of DMA_ATTR_MMIO
> attribute.
> 
> The old page-based API is preserved in mapping.c to ensure that existing
> code won't be affected by changing EXPORT_SYMBOL to EXPORT_SYMBOL_GPL
> variant for dma_*map_phys().

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

