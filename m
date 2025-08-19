Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DA6B2CBC4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 20:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086941.1445099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQwb-0002PZ-IW; Tue, 19 Aug 2025 18:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086941.1445099; Tue, 19 Aug 2025 18:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQwb-0002Ny-Fm; Tue, 19 Aug 2025 18:20:25 +0000
Received: by outflank-mailman (input) for mailman id 1086941;
 Tue, 19 Aug 2025 18:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNib=27=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1uoQwZ-0002Ns-Eg
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 18:20:23 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a59c39c-7d29-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 20:20:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C14C74588D;
 Tue, 19 Aug 2025 18:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0BDC4CEF1;
 Tue, 19 Aug 2025 18:20:06 +0000 (UTC)
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
X-Inumbo-ID: 2a59c39c-7d29-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755627608;
	bh=vJQ95/awDQN15gMxlaXB+Tcfic806+eL4EX36Buoiiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXjytkUFHZiUoUGI84YdHLEqkOvvneMczP1tcgM6yHssC3PZa14NlekO8OwnhQkoH
	 1tKFJyNzeoXibR5866EB9AlD853dT6hX/BHgsXNW4sH7pbBGpZs3bWwj08oPN1sJoj
	 hWrw/W8bx/Ed7fmJOvpwVh//YcUPC4H4piBW1ARVWVGtVpPRrRKbwDEj6sLZPN6zpp
	 WYxb2QFL4WZg9ljpPs9MR4UmpIcWbSmNlEaUUOSNEz9VaSvb+A8MMAVV0hqzSSr9AT
	 hd29ClRf6ZWgUwXusfUehQO9rXf61PDcTKf5hXEkAaN2POaxHzJVqre4wL9NW9YYur
	 pp6mAS1uKCUqA==
Date: Tue, 19 Aug 2025 12:20:04 -0600
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
Subject: Re: [PATCH v4 14/16] block-dma: migrate to dma_map_phys instead of
 map_page
Message-ID: <aKTAVOBp0u6ZSC4w@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>

On Tue, Aug 19, 2025 at 08:36:58PM +0300, Leon Romanovsky wrote:
>  static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
>  		struct blk_dma_iter *iter, struct phys_vec *vec)
>  {
> -	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
> -			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
> +	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
> +			rq_dma_dir(req), 0);

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

Just a random thought when I had to double back to check what the "0"
means: many dma_ api's have a default macro without an "attrs" argument,
then an _attrs() version for when you need it. Not sure if you want to
strictly follow that pattern, but merely a suggestion.

