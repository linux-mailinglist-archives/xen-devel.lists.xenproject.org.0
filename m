Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAAEB3AAA7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 21:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099906.1453572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uri1C-0006f3-OA; Thu, 28 Aug 2025 19:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099906.1453572; Thu, 28 Aug 2025 19:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uri1C-0006d6-Kr; Thu, 28 Aug 2025 19:10:42 +0000
Received: by outflank-mailman (input) for mailman id 1099906;
 Thu, 28 Aug 2025 19:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e5LM=3I=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1uri1A-0006cl-Iz
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 19:10:40 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae5305f1-8442-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 21:10:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AE2F160139;
 Thu, 28 Aug 2025 19:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBADC4CEEB;
 Thu, 28 Aug 2025 19:10:34 +0000 (UTC)
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
X-Inumbo-ID: ae5305f1-8442-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756408236;
	bh=nTTeahhIb0FZNTHkQNMJBnWQfHnp2aJ+r4oH3UJmf9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiAyKBDPTCAig6cfYhRFzVMlXt8gF/BgqIWlzfngucl4yl5Wcl8PEMxeGxZyn4feY
	 9QNbLauol7wPo69EnbsJUOvYSMo6YfZ3+owIkOs7tkWX5BPwXZEGC9l2iz9VL73nWJ
	 LMeYGO+x9LIMWkAgoCM0LVxjf0/nrBlT574LedC07bLp9s3BQzVau6M5uUSf07U/m8
	 vqELaFQz9N5nFU8S5MsiAq/DKmR1fhhzHyINYKZV0xBuVLm5Y0saWfzSXpuLfpmwbf
	 9eS/h5nEcBCqmS1GS4AcOq4YDto3/XpsP6UcVeqRbKR8yG+flv5A1aPbY1iMmgWmoI
	 HI/G0rHOVaaNA==
Date: Thu, 28 Aug 2025 13:10:32 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: Re: [PATCH v4 15/16] block-dma: properly take MMIO path
Message-ID: <aLCpqI-VQ7KeB6DL@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
 <20250828165427.GB10073@unreal>
 <aLCOqIaoaKUEOdeh@kbusch-mbp>
 <20250828184115.GE7333@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828184115.GE7333@nvidia.com>

On Thu, Aug 28, 2025 at 03:41:15PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 28, 2025 at 11:15:20AM -0600, Keith Busch wrote:
> > 
> > I don't think that was ever the case. Metadata is allocated
> > independently of the data payload, usually by the kernel in
> > bio_integrity_prep() just before dispatching the request. The bio may
> > have a p2p data payload, but the integrity metadata is just a kmalloc
> > buf in that path.
> 
> Then you should do two dma mapping operations today, that is how the
> API was built. You shouldn't mix P2P and non P2P within a single
> operation right now..

Data and metadata are mapped as separate operations. They're just
different parts of one blk-mq request.

