Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E8B24D99
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 17:38:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080053.1440689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umDXl-0004KH-Vr; Wed, 13 Aug 2025 15:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080053.1440689; Wed, 13 Aug 2025 15:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umDXl-0004IN-T2; Wed, 13 Aug 2025 15:37:37 +0000
Received: by outflank-mailman (input) for mailman id 1080053;
 Wed, 13 Aug 2025 15:37:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YXQr=2Z=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1umDXk-0004IH-8j
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 15:37:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e358bec-785b-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 17:37:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B00E35C1360;
 Wed, 13 Aug 2025 15:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A911EC4CEEB;
 Wed, 13 Aug 2025 15:37:31 +0000 (UTC)
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
X-Inumbo-ID: 6e358bec-785b-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755099452;
	bh=PQhq5rWxBSi6wo5Tnnh0V92zapg7M+UyVJSAH0kCd/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kkqdIE/HRQ5cedE1zyuMfMRaAZJeqzpFBH0/fLyOJbOpD7Q9Y6fUKKVCUSYg6Iu9+
	 +0lhPpaogX+zo7DE625PlBBN7tO+nQtx0LA2aKRv5GqYQcf/TD8I++3mIddUS1oGuS
	 2Xu0FGRyeN7MRl5kxApDBRYf8dHZhW8fLMu9BCMo8fTZeDkfiJH03TaTo8MCeUS3wk
	 Q3N2kSeVd08IYz9d3sNubS0p0XfPjY2fnOy5IU5HLL6nAdg88Wdvo9IzmX54CnrqWQ
	 dCVsQbDhz8GqQ+nB2+l0260S3CZs7QJe8H773Ex1NmDTheYUl2t1VYx6TqiJOtited
	 Jw1XTt4Q0BCbw==
Date: Wed, 13 Aug 2025 18:37:28 +0300
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
Subject: Re: [PATCH v1 16/16] nvme-pci: unmap MMIO pages with appropriate
 interface
Message-ID: <20250813153728.GC310013@unreal>
References: <cover.1754292567.git.leon@kernel.org>
 <5b0131f82a3d14acaa85f0d1dd608d2913af84e2.1754292567.git.leon@kernel.org>
 <20250807134533.GM184255@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807134533.GM184255@nvidia.com>

On Thu, Aug 07, 2025 at 10:45:33AM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 04, 2025 at 03:42:50PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Block layer maps MMIO memory through dma_map_phys() interface
> > with help of DMA_ATTR_MMIO attribute. There is a need to unmap
> > that memory with the appropriate unmap function.
> 
> Be specific, AFIACT the issue is that on dma_ops platforms the map
> will call ops->map_resource for ATTR_MMIO so we must have the unmap
> call ops->unmap_resournce
> 
> Maybe these patches should be swapped then, as adding ATTR_MMIO seems
> like it created this issue?

The best variant will be to squash previous patch "block-dma: properly
take MMIO path", but I don't want to mix them as they for different
kernel areas.

Thanks

> 
> Jason
> 

