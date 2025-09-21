Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0B6B8D2CE
	for <lists+xen-devel@lfdr.de>; Sun, 21 Sep 2025 02:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127518.1468315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v08Ev-0004Ie-6R; Sun, 21 Sep 2025 00:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127518.1468315; Sun, 21 Sep 2025 00:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v08Ev-0004Fg-0C; Sun, 21 Sep 2025 00:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1127518;
 Sun, 21 Sep 2025 00:47:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jld+=4A=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1v08Et-0004FV-QU
 for xen-devel@lists.xenproject.org; Sun, 21 Sep 2025 00:47:39 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f74c4ac-9684-11f0-9809-7dc792cee155;
 Sun, 21 Sep 2025 02:47:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 70099600AC;
 Sun, 21 Sep 2025 00:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F266C4CEEB;
 Sun, 21 Sep 2025 00:47:29 +0000 (UTC)
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
X-Inumbo-ID: 8f74c4ac-9684-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758415652;
	bh=aFgKZNQUQCaJ2vrroedLHD+DNPOlwj6GGUlnWjzhG5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLUxwzDvBQpVLTwxkVcEMGkM0isY6OG/nLB20SsNVXIRKxxZrAbNIPP/lH+JLvuUn
	 Kib9NA0Qx8ucaR4Lud4LpP66fHzAfy4YMg/WGXGCNSBD/snmzPLJ/GJr5uZM4GRPA4
	 FmPuCrywKU63yNMwT+i1LUerAAz4LYMUpnupPis0tcH13QBvBt9TCQlrhzdIw9AGje
	 8PZjHxaN7jKNeL5CBfGmMNjS4nLwafvguDKC8M88c1TuvUDa7uTmWsQUU6EjD9ZRCh
	 q7PhsUzYYnzKkPRC+D+A2gtlVl3c6gXMUqXDS+5w81SLBHHJjwyUZmv9q7TG8Bge2K
	 OMtCSqZskSdHw==
Date: Sat, 20 Sep 2025 18:47:27 -0600
From: Keith Busch <kbusch@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
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
Subject: Re: [PATCH v6 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <aM9LH6WSeOPGeleY@kbusch-mbp>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
 <aM1_9cS_LGl4GFC5@kbusch-mbp>
 <20250920155352.GH10800@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920155352.GH10800@unreal>

On Sat, Sep 20, 2025 at 06:53:52PM +0300, Leon Romanovsky wrote:
> On Fri, Sep 19, 2025 at 10:08:21AM -0600, Keith Busch wrote:
> > On Fri, Sep 12, 2025 at 12:03:27PM +0300, Leon Romanovsky wrote:
> > > On Fri, Sep 12, 2025 at 12:25:38AM +0200, Marek Szyprowski wrote:
> > > > >
> > > > > This series does the core code and modern flows. A followup series
> > > > > will give the same treatment to the legacy dma_ops implementation.
> > > > 
> > > > Applied patches 1-13 into dma-mapping-for-next branch. Let's check if it 
> > > > works fine in linux-next.
> > > 
> > > Thanks a lot.
> > 
> > Just fyi, when dma debug is enabled, we're seeing this new warning
> > below. I have not had a chance to look into it yet, so I'm just
> > reporting the observation.
> 
> Did you apply all patches or only Marek's branch?
> I don't get this warning when I run my NVMe tests on current dmabuf-vfio branch.

This was the snapshot of linux-next from the 20250918 tag. It doesn't
have the full patchset applied.

One other thing to note, this was runing on arm64 platform using smmu
configured with 64k pages. If your iommu granule is 4k instead, we
wouldn't use the blk_dma_map_direct path.

