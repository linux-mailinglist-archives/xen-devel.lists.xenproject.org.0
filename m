Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860E1B26759
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 15:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081737.1441751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umY33-0007sG-AT; Thu, 14 Aug 2025 13:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081737.1441751; Thu, 14 Aug 2025 13:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umY33-0007qU-80; Thu, 14 Aug 2025 13:31:17 +0000
Received: by outflank-mailman (input) for mailman id 1081737;
 Thu, 14 Aug 2025 13:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hncw=22=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1umY32-0007SK-61
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 13:31:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f26c0c94-7912-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 15:31:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 766E96111F;
 Thu, 14 Aug 2025 13:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E81C4CEF1;
 Thu, 14 Aug 2025 13:31:11 +0000 (UTC)
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
X-Inumbo-ID: f26c0c94-7912-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755178272;
	bh=WW0xB1u8XI1L1gGsXl6wpt3WDXrr4yCiJlHi7BUNlCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqHxW8YW58Ln/tIjnGi73wY9qD5/Iqkzwyv6qop3T0s5v319Ftg/c1ujK3/+Pmp3O
	 3SJY9d+x4hq26C9R4ldz3ap27JZ3CK6dbddTXlBk+z2z09uVrOYjtUFTpeGlFvgNjV
	 L1huyBWZL3RmFzTXcCZe8HHfxLc3AApxz5Ss7QLL+ussS/TR5qi1rfohz3kzvuYQXA
	 z9fOR+m/fazEworlcK45UcqDrJLI+rHyeuLbz0YS0ZizqgTQFWAKE1JSOTRnlpXZlF
	 3y7wTMxm2dgJYYjVCyrbQbIxiWn20GP+y7nUAEOT4RU14M4Kgk2W8/qCK/ckcjXpyq
	 NVGeZpIDI1XVQ==
Date: Thu, 14 Aug 2025 16:31:06 +0300
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
Message-ID: <20250814133106.GE310013@unreal>
References: <cover.1754292567.git.leon@kernel.org>
 <5b40377b621e49ff4107fa10646c828ccc94e53e.1754292567.git.leon@kernel.org>
 <20250807122115.GH184255@nvidia.com>
 <20250813150718.GB310013@unreal>
 <20250814121316.GC699432@nvidia.com>
 <20250814123506.GD310013@unreal>
 <20250814124448.GE699432@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814124448.GE699432@nvidia.com>

On Thu, Aug 14, 2025 at 09:44:48AM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 14, 2025 at 03:35:06PM +0300, Leon Romanovsky wrote:
> > > Then check attrs here, not pfn_valid.
> > 
> > attrs are not available in kmsan_handle_dma(). I can add it if you prefer.
> 
> That makes more sense to the overall design. The comments I gave
> before were driving at a promise to never try to touch a struct page
> for ATTR_MMIO and think this should be comphrensive to never touching
> a struct page even if pfnvalid.
> 
> > > > So let's keep this patch as is.
> > > 
> > > Still need to fix the remarks you clipped, do not check PageHighMem
> > > just call kmap_local_pfn(). All thie PageHighMem stuff is new to this
> > > patch and should not be here, it is the wrong way to use highmem.
> > 
> > Sure, thanks
> 
> I am wondering if there is some reason it was written like this in the
> first place. Maybe we can't even do kmap here.. So perhaps if there is
> not a strong reason to change it just continue to check pagehighmem
> and fail.
> 
> if (!(attrs & ATTR_MMIO) && PageHighMem(phys_to_page(phys)))
>    return;

Does this version good enough? There is no need to call to
kmap_local_pfn() if we prevent PageHighMem pages.

diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index eab7912a3bf0..d9cf70f4159c 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -337,13 +337,13 @@ static void kmsan_handle_dma_page(const void *addr, size_t size,

 /* Helper function to handle DMA data transfers. */
 void kmsan_handle_dma(phys_addr_t phys, size_t size,
-                     enum dma_data_direction dir)
+                     enum dma_data_direction dir, unsigned long attrs)
 {
        u64 page_offset, to_go, addr;
        struct page *page;
        void *kaddr;

-       if (!pfn_valid(PHYS_PFN(phys)))
+       if ((attrs & ATTR_MMIO) || PageHighMem(phys_to_page(phys)))
                return;

        page = phys_to_page(phys);
@@ -357,19 +357,12 @@ void kmsan_handle_dma(phys_addr_t phys, size_t size,
        while (size > 0) {
                to_go = min(PAGE_SIZE - page_offset, (u64)size);

-               if (PageHighMem(page))
-                       /* Handle highmem pages using kmap */
-                       kaddr = kmap_local_page(page);
-               else
-                       /* Lowmem pages can be accessed directly */
-                       kaddr = page_address(page);
+               /* Lowmem pages can be accessed directly */
+               kaddr = page_address(page);

                addr = (u64)kaddr + page_offset;
                kmsan_handle_dma_page((void *)addr, to_go, dir);

-               if (PageHighMem(page))
-                       kunmap_local(page);
-
                phys += to_go;
                size -= to_go;

(END)


> 
> Jason
> 

