Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D33B816E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 13:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148178.273795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyYdQ-0007FG-Kq; Wed, 30 Jun 2021 11:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148178.273795; Wed, 30 Jun 2021 11:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyYdQ-0007DR-Hj; Wed, 30 Jun 2021 11:44:04 +0000
Received: by outflank-mailman (input) for mailman id 148178;
 Wed, 30 Jun 2021 11:44:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=muIj=LY=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1lyYdO-0007DL-Gg
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 11:44:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fca5b77a-3425-4845-8bdc-992783a64d56;
 Wed, 30 Jun 2021 11:44:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 658936191E;
 Wed, 30 Jun 2021 11:43:52 +0000 (UTC)
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
X-Inumbo-ID: fca5b77a-3425-4845-8bdc-992783a64d56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625053440;
	bh=T1naDXZ4KL7jQSaB561jHvJlgBOMGMQ3/1PtLxSRV3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vw8LJOu5KCD34mYOTCMTaQTWi8sHKQiF+Cb+FRKyG+InGjsh4w5CH8gnw31a5qAII
	 fdxwWup5a6Ngr850taEcU9ZCSLqJ9xB2i8TJhh5jtbhjxfDnOyNmjKcCavn+Lg4tkH
	 BT4r0W8tudkIUpIlaA5qcnegOAtKQcX6CJcSCUAclVHoKv4x47CJbH5I8ALtxpamjf
	 y69MeQSUFUeisr4w4Nt7M+WH4SJ7ztkfgf6rb2x4qemdLyCnbXEMIuY+1x1gvjyIVN
	 oskCC9GD49xMtxzkxb+rjm1PqbzB1n44Y73LgO/3einGNWpmSI/rVZcsQyguvuwKPI
	 LyjS1rkSbdFqQ==
Date: Wed, 30 Jun 2021 12:43:48 +0100
From: Will Deacon <will@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com,
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com,
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk,
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, Jianxiong Gao <jxgao@google.com>,
	joonas.lahtinen@linux.intel.com, linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Qian Cai <quic_qiancai@quicinc.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210630114348.GA8383@willie-the-truck>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org>
 <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
 <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jun 30, 2021 at 05:17:27PM +0800, Claire Chang wrote:
> On Wed, Jun 30, 2021 at 9:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Thu, Jun 24, 2021 at 11:55:20PM +0800, Claire Chang wrote:
> > > Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
> > > use it to determine whether to bounce the data or not. This will be
> > > useful later to allow for different pools.
> > >
> > > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> > > Tested-by: Will Deacon <will@kernel.org>
> > > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> >
> > This patch as commit af452ec1b1a3 ("swiotlb: Use is_swiotlb_force_bounce
> > for swiotlb data bouncing") causes my Ryzen 3 4300G system to fail to
> > get to an X session consistently (although not every single time),
> > presumably due to a crash in the AMDGPU driver that I see in dmesg.
> >
> > I have attached logs at af452ec1b1a3 and f127c9556a8e and I am happy
> > to provide any further information, debug, or test patches as necessary.
> 
> Are you using swiotlb=force? or the swiotlb_map is called because of
> !dma_capable? (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/dma/direct.h#n93)

The command line is in the dmesg:

  | Kernel command line: initrd=\amd-ucode.img initrd=\initramfs-linux-next-llvm.img root=PARTUUID=8680aa0c-cf09-4a69-8cf3-970478040ee7 rw intel_pstate=no_hwp irqpoll

but I worry that this looks _very_ similar to the issue reported by Qian
Cai which we thought we had fixed. Nathan -- is the failure deterministic?

> `BUG: unable to handle page fault for address: 00000000003a8290` and
> the fact it crashed at `_raw_spin_lock_irqsave` look like the memory
> (maybe dev->dma_io_tlb_mem) was corrupted?
> The dev->dma_io_tlb_mem should be set here
> (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/probe.c#n2528)
> through device_initialize.

I'm less sure about this. 'dma_io_tlb_mem' should be pointing at
'io_tlb_default_mem', which is a page-aligned allocation from memblock.
The spinlock is at offset 0x24 in that structure, and looking at the
register dump from the crash:

Jun 29 18:28:42 hp-4300G kernel: RSP: 0018:ffffadb4013db9e8 EFLAGS: 00010006
Jun 29 18:28:42 hp-4300G kernel: RAX: 00000000003a8290 RBX: 0000000000000000 RCX: ffff8900572ad580
Jun 29 18:28:42 hp-4300G kernel: RDX: ffff89005653f024 RSI: 00000000000c0000 RDI: 0000000000001d17
Jun 29 18:28:42 hp-4300G kernel: RBP: 000000000a20d000 R08: 00000000000c0000 R09: 0000000000000000
Jun 29 18:28:42 hp-4300G kernel: R10: 000000000a20d000 R11: ffff89005653f000 R12: 0000000000000212
Jun 29 18:28:42 hp-4300G kernel: R13: 0000000000001000 R14: 0000000000000002 R15: 0000000000200000
Jun 29 18:28:42 hp-4300G kernel: FS:  00007f1f8898ea40(0000) GS:ffff890057280000(0000) knlGS:0000000000000000
Jun 29 18:28:42 hp-4300G kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun 29 18:28:42 hp-4300G kernel: CR2: 00000000003a8290 CR3: 00000001020d0000 CR4: 0000000000350ee0
Jun 29 18:28:42 hp-4300G kernel: Call Trace:
Jun 29 18:28:42 hp-4300G kernel:  _raw_spin_lock_irqsave+0x39/0x50
Jun 29 18:28:42 hp-4300G kernel:  swiotlb_tbl_map_single+0x12b/0x4c0

Then that correlates with R11 holding the 'dma_io_tlb_mem' pointer and
RDX pointing at the spinlock. Yet RAX is holding junk :/

I agree that enabling KASAN would be a good idea, but I also think we
probably need to get some more information out of swiotlb_tbl_map_single()
to see see what exactly is going wrong in there.

Will

