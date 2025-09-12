Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33625B56FDB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 07:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124138.1466643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy24i-0006n2-1F; Mon, 15 Sep 2025 05:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124138.1466643; Mon, 15 Sep 2025 05:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy24h-0006l8-U6; Mon, 15 Sep 2025 05:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1124138;
 Mon, 15 Sep 2025 05:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zYaf=32=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uy24g-0006l2-WE
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 05:48:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97e446ef-91f7-11f0-9d13-b5c5bf9af7f9;
 Mon, 15 Sep 2025 07:48:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 05E2143F68;
 Mon, 15 Sep 2025 05:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FCDC4CEF1;
 Mon, 15 Sep 2025 05:48:21 +0000 (UTC)
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
X-Inumbo-ID: 97e446ef-91f7-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757915302;
	bh=QmA1uWtopyZKqYFa3aB5R38vcRhwp6UNA5QEhCCpxlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LY4R44OPNzL3Qer2vVNQup9uUTcNx43gZqh5FwLU0Oh1PdFVX0Y/KMu9Uvifa32bq
	 LKQg8b7U2pc5ik4+PxHv4Vxaw4OOg+vsmxh8TnpYqhx/pMCEM27S4kfw09R8Z3+SrS
	 WOCH3NphTYB7cis3wXHahmF9XEuFQFnTdwnEgrsxicfvxKQHyvsgH5+RBeSZZNlt+1
	 jN5OeNDI/I13LeozFgh3Z/w6y7Zqmf8gbZ1coqUma25WZo+AQ3j6hF69NbTonbiUow
	 a8r0c3Mzdr4L7umKhPtyml+GICc0Iz7CXrXjBFFY5PAmWMihDcJf2V0TWoeJPC1g6V
	 RKkFNq598mfYQ==
Date: Fri, 12 Sep 2025 12:03:27 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
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
Subject: Re: [PATCH v6 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250912090327.GU341237@unreal>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>

On Fri, Sep 12, 2025 at 12:25:38AM +0200, Marek Szyprowski wrote:
> On 09.09.2025 15:27, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > Changelog:
> > v6:
> >   * Based on "dma-debug: don't enforce dma mapping check on noncoherent
> >     allocations" patch.
> >   * Removed some unused variables from kmsan conversion.
> >   * Fixed missed ! in dma check.
> > v5: https://lore.kernel.org/all/cover.1756822782.git.leon@kernel.org
> >   * Added Jason's and Keith's Reviewed-by tags
> >   * Fixed DMA_ATTR_MMIO check in dma_direct_map_phys
> >   * Jason's cleanup suggestions
> > v4: https://lore.kernel.org/all/cover.1755624249.git.leon@kernel.org/
> >   * Fixed kbuild error with mismatch in kmsan function declaration due to
> >     rebase error.
> > v3: https://lore.kernel.org/all/cover.1755193625.git.leon@kernel.org
> >   * Fixed typo in "cacheable" word
> >   * Simplified kmsan patch a lot to be simple argument refactoring
> > v2: https://lore.kernel.org/all/cover.1755153054.git.leon@kernel.org
> >   * Used commit messages and cover letter from Jason
> >   * Moved setting IOMMU_MMIO flag to dma_info_to_prot function
> >   * Micro-optimized the code
> >   * Rebased code on v6.17-rc1
> > v1: https://lore.kernel.org/all/cover.1754292567.git.leon@kernel.org
> >   * Added new DMA_ATTR_MMIO attribute to indicate
> >     PCI_P2PDMA_MAP_THRU_HOST_BRIDGE path.
> >   * Rewrote dma_map_* functions to use thus new attribute
> > v0: https://lore.kernel.org/all/cover.1750854543.git.leon@kernel.org/
> > ------------------------------------------------------------------------
> >
> > This series refactors the DMA mapping to use physical addresses
> > as the primary interface instead of page+offset parameters. This
> > change aligns the DMA API with the underlying hardware reality where
> > DMA operations work with physical addresses, not page structures.
> >
> > The series maintains export symbol backward compatibility by keeping
> > the old page-based API as wrapper functions around the new physical
> > address-based implementations.
> >
> > This series refactors the DMA mapping API to provide a phys_addr_t
> > based, and struct-page free, external API that can handle all the
> > mapping cases we want in modern systems:
> >
> >   - struct page based cacheable DRAM
> >   - struct page MEMORY_DEVICE_PCI_P2PDMA PCI peer to peer non-cacheable
> >     MMIO
> >   - struct page-less PCI peer to peer non-cacheable MMIO
> >   - struct page-less "resource" MMIO
> >
> > Overall this gets much closer to Matthew's long term wish for
> > struct-pageless IO to cacheable DRAM. The remaining primary work would
> > be in the mm side to allow kmap_local_pfn()/phys_to_virt() to work on
> > phys_addr_t without a struct page.
> >
> > The general design is to remove struct page usage entirely from the
> > DMA API inner layers. For flows that need to have a KVA for the
> > physical address they can use kmap_local_pfn() or phys_to_virt(). This
> > isolates the struct page requirements to MM code only. Long term all
> > removals of struct page usage are supporting Matthew's memdesc
> > project which seeks to substantially transform how struct page works.
> >
> > Instead make the DMA API internals work on phys_addr_t. Internally
> > there are still dedicated 'page' and 'resource' flows, except they are
> > now distinguished by a new DMA_ATTR_MMIO instead of by callchain. Both
> > flows use the same phys_addr_t.
> >
> > When DMA_ATTR_MMIO is specified things work similar to the existing
> > 'resource' flow. kmap_local_pfn(), phys_to_virt(), phys_to_page(),
> > pfn_valid(), etc are never called on the phys_addr_t. This requires
> > rejecting any configuration that would need swiotlb. CPU cache
> > flushing is not required, and avoided, as ATTR_MMIO also indicates the
> > address have no cacheable mappings. This effectively removes any
> > DMA API side requirement to have struct page when DMA_ATTR_MMIO is
> > used.
> >
> > In the !DMA_ATTR_MMIO mode things work similarly to the 'page' flow,
> > except on the common path of no cache flush, no swiotlb it never
> > touches a struct page. When cache flushing or swiotlb copying
> > kmap_local_pfn()/phys_to_virt() are used to get a KVA for CPU
> > usage. This was already the case on the unmap side, now the map side
> > is symmetric.
> >
> > Callers are adjusted to set DMA_ATTR_MMIO. Existing 'resource' users
> > must set it. The existing struct page based MEMORY_DEVICE_PCI_P2PDMA
> > path must also set it. This corrects some existing bugs where iommu
> > mappings for P2P MMIO were improperly marked IOMMU_CACHE.
> >
> > Since ATTR_MMIO is made to work with all the existing DMA map entry
> > points, particularly dma_iova_link(), this finally allows a way to use
> > the new DMA API to map PCI P2P MMIO without creating struct page. The
> > VFIO DMABUF series demonstrates how this works. This is intended to
> > replace the incorrect driver use of dma_map_resource() on PCI BAR
> > addresses.
> >
> > This series does the core code and modern flows. A followup series
> > will give the same treatment to the legacy dma_ops implementation.
> 
> Applied patches 1-13 into dma-mapping-for-next branch. Let's check if it 
> works fine in linux-next.

Thanks a lot.

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
> 

