Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD06B24CD5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 17:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080031.1440666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umD4a-00089o-HQ; Wed, 13 Aug 2025 15:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080031.1440666; Wed, 13 Aug 2025 15:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umD4a-00088L-Eg; Wed, 13 Aug 2025 15:07:28 +0000
Received: by outflank-mailman (input) for mailman id 1080031;
 Wed, 13 Aug 2025 15:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YXQr=2Z=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1umD4Z-00088F-G9
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 15:07:27 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37be6c12-7857-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 17:07:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F0C06112D;
 Wed, 13 Aug 2025 15:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B711C4CEF1;
 Wed, 13 Aug 2025 15:07:22 +0000 (UTC)
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
X-Inumbo-ID: 37be6c12-7857-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755097642;
	bh=AgCFVr8B6NzxkSuzvPEJMB9AhjM0iYqJptnGya/8rdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YENt6LTmzTF5MtD2CCE/V13VNj4PuphZirCcbsVboFbdWpo5pbDoM+O1RwGND9hHA
	 WetmjCRKzL7pVzJCuB6ANhgpmI5NnCbOUKiA98JWJtIXOH8N50EVLmuQyuay6zm6ky
	 Onvhe46hQosw9HCamdkdEFdjBFc8sAKkHOvcvhEwHpJ12ST8cc+74GQ77yCDPQN8yP
	 6Wv7nBFsNIocmJw6FI3A2Sw+oIhMT6YNdwdLIq5MhleD6VLBx07CKPNCPkvEmssek+
	 ZjeG2ZowZ0nIKyT2jMky93WoiZsWFLORbU579a0ityJsLq0oaeKqLOOi+Bq4oEc02a
	 vNc66YhlSs8qQ==
Date: Wed, 13 Aug 2025 18:07:18 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v1 08/16] kmsan: convert kmsan_handle_dma to use physical
 addresses
Message-ID: <20250813150718.GB310013@unreal>
References: <cover.1754292567.git.leon@kernel.org>
 <5b40377b621e49ff4107fa10646c828ccc94e53e.1754292567.git.leon@kernel.org>
 <20250807122115.GH184255@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807122115.GH184255@nvidia.com>

On Thu, Aug 07, 2025 at 09:21:15AM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 04, 2025 at 03:42:42PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Convert the KMSAN DMA handling function from page-based to physical
> > address-based interface.
> > 
> > The refactoring renames kmsan_handle_dma() parameters from accepting
> > (struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
> > size_t size). A PFN_VALID check is added to prevent KMSAN operations
> > on non-page memory, preventing from non struct page backed address,
> > 
> > As part of this change, support for highmem addresses is implemented
> > using kmap_local_page() to handle both lowmem and highmem regions
> > properly. All callers throughout the codebase are updated to use the
> > new phys_addr_t based interface.
> 
> Use the function Matthew pointed at kmap_local_pfn()
> 
> Maybe introduce the kmap_local_phys() he suggested too.

At this point it gives nothing.

> 
> >  /* Helper function to handle DMA data transfers. */
> > -void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
> > +void kmsan_handle_dma(phys_addr_t phys, size_t size,
> >  		      enum dma_data_direction dir)
> >  {
> >  	u64 page_offset, to_go, addr;
> > +	struct page *page;
> > +	void *kaddr;
> >  
> > -	if (PageHighMem(page))
> > +	if (!pfn_valid(PHYS_PFN(phys)))
> >  		return;
> 
> Not needed, the caller must pass in a phys that is kmap
> compatible. Maybe just leave a comment. FWIW today this is also not
> checking for P2P or DEVICE non-kmap struct pages either, so it should
> be fine without checks.

It is not true as we will call to kmsan_handle_dma() unconditionally in
dma_map_phys(). The reason to it is that kmsan_handle_dma() is guarded
with debug kconfig options and cost of pfn_valid() can be accommodated
in that case. It gives more clean DMA code.

   155 dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
   156                 enum dma_data_direction dir, unsigned long attrs)
   157 {
   <...>
   187
   188         kmsan_handle_dma(phys, size, dir);
   189         trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
   190         debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
   191
   192         return addr;
   193 }
   194 EXPORT_SYMBOL_GPL(dma_map_phys);

So let's keep this patch as is.

Thanks

