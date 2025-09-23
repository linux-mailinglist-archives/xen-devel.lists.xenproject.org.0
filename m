Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C846AB9733C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 20:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128630.1468927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v17nI-0006il-HL; Tue, 23 Sep 2025 18:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128630.1468927; Tue, 23 Sep 2025 18:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v17nI-0006gq-CW; Tue, 23 Sep 2025 18:31:16 +0000
Received: by outflank-mailman (input) for mailman id 1128630;
 Tue, 23 Sep 2025 18:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DzNg=4C=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1v17nH-0006gk-6K
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 18:31:15 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 742fed62-98ab-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 20:31:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6BC3A4393E;
 Tue, 23 Sep 2025 18:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB030C4CEF5;
 Tue, 23 Sep 2025 18:30:57 +0000 (UTC)
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
X-Inumbo-ID: 742fed62-98ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758652259;
	bh=gxKH7wZVbZJUgsdcRmV6yXRnCWQ9TqZ9bpedLe1yt7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4ZXIaWM41Ablw/mVVeAaJkiSYgUA1XjiTWt5LSH4qwLIacOxMZE3jScnz0xix1Wv
	 SAp5BLuT2R2dCAYXxRdOCtJez17N/cBe9kv8+xOmcpzYoZ/UpcFkDX5GmNuOLJGCFV
	 Bcs4RLVyhjVQyFhRGAbe1bDHxUFJbKgGu/3vW1Mt1BkujhZ/XZn25PIvUn5jT3S9nw
	 YVX4n2lhWFpC/hhBuXD/s3h9/tXRxQArUIgc5V0sUKhDNiOC8ABgtjM7Q3+LQGe+ys
	 cSfhtq2Jd52bcQy4LLrP2uqO++/e9zs0F7UgxrbinfFgheCfADXwZVzyKQ2yU+i53A
	 XGP2nnt2Bp5Ig==
Date: Tue, 23 Sep 2025 12:30:55 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <aNLnXwAJveHIqfz0@kbusch-mbp>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
 <aM1_9cS_LGl4GFC5@kbusch-mbp>
 <20250920155352.GH10800@unreal>
 <aM9LH6WSeOPGeleY@kbusch-mbp>
 <20250923170936.GA2614310@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923170936.GA2614310@nvidia.com>

On Tue, Sep 23, 2025 at 02:09:36PM -0300, Jason Gunthorpe wrote:
> On Sat, Sep 20, 2025 at 06:47:27PM -0600, Keith Busch wrote:
> > 
> > One other thing to note, this was runing on arm64 platform using smmu
> > configured with 64k pages. If your iommu granule is 4k instead, we
> > wouldn't use the blk_dma_map_direct path.
> 
> I spent some time looking to see if I could guess what this is and
> came up empty. It seems most likely we are leaking a dma mapping
> tracking somehow? The DMA API side is pretty simple here though..

Yeah, nothing stood out to me here either.
 
> Not sure the 64k/4k itself is a cause, but triggering the non-iova
> flow is probably the issue.
> 
> Can you check the output of this debugfs:

I don't have a system in this state at the moment, so we checked
previous logs on machines running older kernels. It's extermely
uncommon, but this error was happening prior to this series, so I don't
think this introduced any new problem here. I'll keeping looking, but I
don't think we'll make much progress if I can't find a more reliable
reproducer.

Thanks!

