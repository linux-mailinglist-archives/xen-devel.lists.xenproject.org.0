Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6873BA1D0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 15:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149150.275717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzJhI-0003Bp-3B; Fri, 02 Jul 2021 13:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149150.275717; Fri, 02 Jul 2021 13:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzJhI-000397-05; Fri, 02 Jul 2021 13:59:12 +0000
Received: by outflank-mailman (input) for mailman id 149150;
 Fri, 02 Jul 2021 13:59:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t0DC=L2=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1lzJhG-000391-FL
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 13:59:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fef40f88-8c4d-448c-8a71-2bca51ebaed8;
 Fri, 02 Jul 2021 13:59:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E67B26142B;
 Fri,  2 Jul 2021 13:59:00 +0000 (UTC)
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
X-Inumbo-ID: fef40f88-8c4d-448c-8a71-2bca51ebaed8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625234348;
	bh=GAzz+9Wi5F3smddcMqAPXL+yX+g6y+b7+ZdyCyCYk6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRFf+Wzi4/1+CXjK9WTjhUw5flwP67NTwGefIxgOECtBfi65Tj3m3RZAnGmMeaHWN
	 2nB6ydioSV2HMouSGryEIIBRdSlehAFMTcH+PJ43Fzncx1dyolaRkF7sppvivPuZf7
	 cPX4Boe7jQMJiyFe3ZHKT4MFIZG39Q+YJQliaRWFbkh7/vzRbU7bxJi79Z1ru+gtBo
	 ad1ubKsTeSBiWjEpbwdaLM3RhLgyMoL6khfdtq+W/6U3noQUe78qA62SPzsLgc5K4n
	 HLEZtG+/PJtTdlqtEwnI8LIwqrv30Hz5pVN+cgBES579vlL24El76ac3B9gttOgNJw
	 +e4R0HS7ObwsQ==
Date: Fri, 2 Jul 2021 14:58:57 +0100
From: Will Deacon <will@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <20210702135856.GB11132@willie-the-truck>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org>
 <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
 <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
 <20210630114348.GA8383@willie-the-truck>
 <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain>
 <20210701074045.GA9436@willie-the-truck>
 <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Nathan,

On Thu, Jul 01, 2021 at 12:52:20AM -0700, Nathan Chancellor wrote:
> On 7/1/2021 12:40 AM, Will Deacon wrote:
> > On Wed, Jun 30, 2021 at 08:56:51AM -0700, Nathan Chancellor wrote:
> > > On Wed, Jun 30, 2021 at 12:43:48PM +0100, Will Deacon wrote:
> > > > On Wed, Jun 30, 2021 at 05:17:27PM +0800, Claire Chang wrote:
> > > > > `BUG: unable to handle page fault for address: 00000000003a8290` and
> > > > > the fact it crashed at `_raw_spin_lock_irqsave` look like the memory
> > > > > (maybe dev->dma_io_tlb_mem) was corrupted?
> > > > > The dev->dma_io_tlb_mem should be set here
> > > > > (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/probe.c#n2528)
> > > > > through device_initialize.
> > > > 
> > > > I'm less sure about this. 'dma_io_tlb_mem' should be pointing at
> > > > 'io_tlb_default_mem', which is a page-aligned allocation from memblock.
> > > > The spinlock is at offset 0x24 in that structure, and looking at the
> > > > register dump from the crash:
> > > > 
> > > > Jun 29 18:28:42 hp-4300G kernel: RSP: 0018:ffffadb4013db9e8 EFLAGS: 00010006
> > > > Jun 29 18:28:42 hp-4300G kernel: RAX: 00000000003a8290 RBX: 0000000000000000 RCX: ffff8900572ad580
> > > > Jun 29 18:28:42 hp-4300G kernel: RDX: ffff89005653f024 RSI: 00000000000c0000 RDI: 0000000000001d17
> > > > Jun 29 18:28:42 hp-4300G kernel: RBP: 000000000a20d000 R08: 00000000000c0000 R09: 0000000000000000
> > > > Jun 29 18:28:42 hp-4300G kernel: R10: 000000000a20d000 R11: ffff89005653f000 R12: 0000000000000212
> > > > Jun 29 18:28:42 hp-4300G kernel: R13: 0000000000001000 R14: 0000000000000002 R15: 0000000000200000
> > > > Jun 29 18:28:42 hp-4300G kernel: FS:  00007f1f8898ea40(0000) GS:ffff890057280000(0000) knlGS:0000000000000000
> > > > Jun 29 18:28:42 hp-4300G kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > Jun 29 18:28:42 hp-4300G kernel: CR2: 00000000003a8290 CR3: 00000001020d0000 CR4: 0000000000350ee0
> > > > Jun 29 18:28:42 hp-4300G kernel: Call Trace:
> > > > Jun 29 18:28:42 hp-4300G kernel:  _raw_spin_lock_irqsave+0x39/0x50
> > > > Jun 29 18:28:42 hp-4300G kernel:  swiotlb_tbl_map_single+0x12b/0x4c0
> > > > 
> > > > Then that correlates with R11 holding the 'dma_io_tlb_mem' pointer and
> > > > RDX pointing at the spinlock. Yet RAX is holding junk :/
> > > > 
> > > > I agree that enabling KASAN would be a good idea, but I also think we
> > > > probably need to get some more information out of swiotlb_tbl_map_single()
> > > > to see see what exactly is going wrong in there.
> > > 
> > > I can certainly enable KASAN and if there is any debug print I can add
> > > or dump anything, let me know!
> > 
> > I bit the bullet and took v5.13 with swiotlb/for-linus-5.14 merged in, built
> > x86 defconfig and ran it on my laptop. However, it seems to work fine!
> > 
> > Please can you share your .config?
> 
> Sure thing, it is attached. It is just Arch Linux's config run through
> olddefconfig. The original is below in case you need to diff it.
> 
> https://raw.githubusercontent.com/archlinux/svntogit-packages/9045405dc835527164f3034b3ceb9a67c7a53cd4/trunk/config
> 
> If there is anything more that I can provide, please let me know.

I eventually got this booting (for some reason it was causing LD to SEGV
trying to link it for a while...) and sadly it works fine on my laptop. Hmm.

Did you manage to try again with KASAN?

It might also be worth taking the IOMMU out of the equation, since that
interfaces differently with SWIOTLB and I couldn't figure out the code path
from the log you provided. What happens if you boot with "amd_iommu=off
swiotlb=force"?

(although word of warning here: i915 dies horribly on my laptop if I pass
swiotlb=force, even with the distro 5.10 kernel)

Will

