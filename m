Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0706DB1CC0A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 20:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072129.1435436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujj28-0002ku-S5; Wed, 06 Aug 2025 18:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072129.1435436; Wed, 06 Aug 2025 18:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujj28-0002jS-PI; Wed, 06 Aug 2025 18:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1072129;
 Wed, 06 Aug 2025 18:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Btr/=2S=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1ujj27-0002jL-CL
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 18:38:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fcb649a-72f4-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 20:38:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 534C15C5889;
 Wed,  6 Aug 2025 18:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410C2C4CEE7;
 Wed,  6 Aug 2025 18:38:34 +0000 (UTC)
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
X-Inumbo-ID: 8fcb649a-72f4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754505514;
	bh=3VsSAjLVcmccxCZ3hnnn1RvFFPeP1KXfNR/kPK523tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ge50qjueu3yzrmSLvI7mO9n8KQkiFiYfr4PhBvbyi9xJtwRH+3VLE26OL160ezEfS
	 l7n3yTGZYML7usXiAxesUibX5X3uv+Y7zSbVhAbamikh3Xal+W4d9sOmoNJufjNKOd
	 mltqBVBcA3J9CQVjxxN7y8g/410e0ODnTntjvgOrjJZ0GcQu7FKKjy5hCvF14lL7EB
	 GCHlgBFQUU1u6mCSnNeVtRb+60F9YWCMntqEV5h3kpkOIbolMnee/QD5F6iZ+TELym
	 IpJ05UFpUZfqx3imORqYTmOC8S0Z30OtwN23sPhn2SppRACGNtVevxAEaRFm6toCBl
	 Pc8wnVLkh3LNQ==
Date: Wed, 6 Aug 2025 21:38:31 +0300
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
Subject: Re: [PATCH v1 03/16] dma-debug: refactor to use physical addresses
 for page mapping
Message-ID: <20250806183831.GW402218@unreal>
References: <cover.1754292567.git.leon@kernel.org>
 <9ba84c387ce67389cd80f374408eebb58326c448.1754292567.git.leon@kernel.org>
 <20250806182630.GC184255@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806182630.GC184255@nvidia.com>

On Wed, Aug 06, 2025 at 03:26:30PM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 04, 2025 at 03:42:37PM +0300, Leon Romanovsky wrote:
> > +void debug_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
> > +		int direction, dma_addr_t dma_addr, unsigned long attrs)
> >  {
> >  	struct dma_debug_entry *entry;
> 
> Should this patch should also absorb debug_dma_map_resource() into
> here as well and we can have the caller of dma_dma_map_resource() call
> debug_dma_map_page with ATTR_MMIO?

It is done in "[PATCH v1 11/16] dma-mapping: export new dma_*map_phys() interface".

Thanks

> 
> If not, this looks OK
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason
> 

