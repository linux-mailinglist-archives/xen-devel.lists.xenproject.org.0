Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA1B8A820
	for <lists+xen-devel@lfdr.de>; Fri, 19 Sep 2025 18:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126935.1468175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzdf0-0003Kl-E5; Fri, 19 Sep 2025 16:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126935.1468175; Fri, 19 Sep 2025 16:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzdf0-0003Hh-BF; Fri, 19 Sep 2025 16:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1126935;
 Fri, 19 Sep 2025 16:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tl77=36=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1uzdez-0003Hb-7b
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 16:08:33 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dff06662-9572-11f0-9809-7dc792cee155;
 Fri, 19 Sep 2025 18:08:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 581BF60140;
 Fri, 19 Sep 2025 16:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C8EC4CEF0;
 Fri, 19 Sep 2025 16:08:23 +0000 (UTC)
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
X-Inumbo-ID: dff06662-9572-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758298105;
	bh=KR7+2nE82F6C0RiPmuqmiCYxfBNwhzjUQ6Re6K7PmkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxcwNWOdwyYYCt/Mr4IoNw/QjfiG4fCy9ykIixLtIZgzxpvEaTh0ZrsRzbEkVlnG2
	 m8b1wOyRgj64SHlplGanM4IqWdr6Ywznq35IYlrDTPSiuH1HbSJA9OSV6F3cLQ0fmv
	 gIfqZUpL6QTaZY7lchfgfbbV/HzPQ9GlWuIYB09YAq8LPsugW8lRkDPp3pD3pmqfjH
	 MMDTa/BarqpIPeeM6zxgfbm5MTp42dkz6/ahu8QcAFUE+eO/S+U7a/1bN3BopMvk86
	 +JRB492i+MxOTtI0yVlp8MJ781GY30PjuvtN+/6jEMPcnyQy8X2xhocLeJS5gf/FQl
	 TeUW9JwC+yaOg==
Date: Fri, 19 Sep 2025 10:08:21 -0600
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
Message-ID: <aM1_9cS_LGl4GFC5@kbusch-mbp>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912090327.GU341237@unreal>

On Fri, Sep 12, 2025 at 12:03:27PM +0300, Leon Romanovsky wrote:
> On Fri, Sep 12, 2025 at 12:25:38AM +0200, Marek Szyprowski wrote:
> > >
> > > This series does the core code and modern flows. A followup series
> > > will give the same treatment to the legacy dma_ops implementation.
> > 
> > Applied patches 1-13 into dma-mapping-for-next branch. Let's check if it 
> > works fine in linux-next.
> 
> Thanks a lot.

Just fyi, when dma debug is enabled, we're seeing this new warning
below. I have not had a chance to look into it yet, so I'm just
reporting the observation.

 DMA-API: nvme 0006:01:00.0: cacheline tracking EEXIST, overlapping mappings aren't supported
 WARNING: kernel/dma/debug.c:598 at add_dma_entry+0x26c/0x328, CPU#1: (udev-worker)/773
 Modules linked in: acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E)
 CPU: 1 UID: 0 PID: 773 Comm: (udev-worker) Tainted: G            E    N  6.17.0-rc6-next-20250918-debug #6 PREEMPT(none)
 Tainted: [E]=UNSIGNED_MODULE, [N]=TEST
 pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
 pc : add_dma_entry+0x26c/0x328
 lr : add_dma_entry+0x26c/0x328
 sp : ffff80009fe0f460
 x29: ffff80009fe0f470 x28: 0000000000000001 x27: 0000000000000001
 x26: ffff8000835d7f38 x25: ffff8000835d7000 x24: ffff8000835d7e60
 x23: 0000000000000000 x22: 0000000006e2cc00 x21: 0000000000000000
 x20: ffff800082e8f218 x19: ffff0000a908ff80 x18: 00000000ffffffff
 x17: ffff8000801972a0 x16: ffff800080197054 x15: 0000000000000000
 x14: 0000000000000000 x13: 0000000000000004 x12: 0000000000020006
 x11: 0000000030e4ef9f x10: ffff800083443358 x9 : ffff80008019499c
 x8 : 00000000fffeffff x7 : ffff800083443358 x6 : 0000000000000000
 x5 : 00000000000bfff4 x4 : 0000000000000000 x3 : ffff0000bb005ac0
 x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000bb005ac0
 Call trace:
  add_dma_entry+0x26c/0x328 (P)
  debug_dma_map_phys+0xc4/0xf0
  dma_map_phys+0xe0/0x410
  dma_map_page_attrs+0x94/0xf8
  blk_dma_map_direct.isra.0+0x64/0xb8
  blk_rq_dma_map_iter_next+0x6c/0xc8
  nvme_prep_rq+0x894/0xa98
  nvme_queue_rqs+0xb0/0x1a0
  blk_mq_dispatch_queue_requests+0x268/0x3b8
  blk_mq_flush_plug_list+0x90/0x188
  __blk_flush_plug+0x104/0x170
  blk_finish_plug+0x38/0x50
  read_pages+0x1a4/0x3b8
  page_cache_ra_unbounded+0x1a0/0x400
  force_page_cache_ra+0xa8/0xd8
  page_cache_sync_ra+0xa0/0x3f8
  filemap_get_pages+0x104/0x950
  filemap_read+0xf4/0x498
  blkdev_read_iter+0x88/0x180
  vfs_read+0x214/0x310
  ksys_read+0x70/0x110
  __arm64_sys_read+0x20/0x30
  invoke_syscall+0x4c/0x118
  el0_svc_common.constprop.0+0xc4/0xf0
  do_el0_svc+0x24/0x38
  el0_svc+0x1a0/0x340
  el0t_64_sync_handler+0x98/0xe0
  el0t_64_sync+0x17c/0x180
 ---[ end trace 0000000000000000 ]---


