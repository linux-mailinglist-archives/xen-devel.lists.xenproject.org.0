Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53FCB86743
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 20:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126432.1467996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdO-0003In-GU; Thu, 18 Sep 2025 18:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126432.1467996; Thu, 18 Sep 2025 18:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdO-0003Go-Dk; Thu, 18 Sep 2025 18:45:34 +0000
Received: by outflank-mailman (input) for mailman id 1126432;
 Thu, 18 Sep 2025 18:45:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TAPY=35=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uzJdM-0003Gi-EM
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 18:45:32 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6ae65cd-94bf-11f0-9d14-b5c5bf9af7f9;
 Thu, 18 Sep 2025 20:45:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7A3B96021D;
 Thu, 18 Sep 2025 18:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340C7C4CEE7;
 Thu, 18 Sep 2025 18:45:28 +0000 (UTC)
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
X-Inumbo-ID: a6ae65cd-94bf-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221129;
	bh=u6NaIt2RygsBlCtYn4hZiQqQdifJG8iCHYQXwiLX65E=;
	h=From:To:Cc:Subject:Date:From;
	b=Z28vS7zXihUdX9isz4tKX5bJfG+N6wgA49ZsUL9MzWkxVOZIaB9CEoaGCeOdF5Wlc
	 irtxfrEkcx12CNmXSpOaxnrWSE3uyQ9BLUGMgdMwz3ZkzTrB7vIU5S+RDvQ6dKM5ki
	 RxUJdVCwUhpNByj1sxF0SK4ASPa55TnwfCGcGHPBq14Ogh8/QuEEAY6ulYXQRiCrc/
	 gKhn/kbZmmAWPpdmUgqtKeJS0PBEgSw0hZoyR9kwDh1THqWJDw1i1JuxwJQDO1Fvaa
	 tjs8Xsk56/6qq7xSDRAZoHUF6JGB7I+NLrajHOGD2OUILv6g7xC1NJVMJM9wXp6cE/
	 8ldLVQITFO98w==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jason Wang <jasowang@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/9] Remove DMA .map_page and .unmap_page callbacks
Date: Thu, 18 Sep 2025 21:45:00 +0300
Message-ID: <cover.1758219786.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series continues following two series:
1. "dma-mapping: migrate to physical address-based API" 
https://lore.kernel.org/all/cover.1757423202.git.leonro@nvidia.com
2. "Preparation to .map_page and .unmap_page removal"
Preparation to .map_page and .unmap_page removal

In this series, the DMA .map_page/.unmap_page callbacks are converted to newly
introduced .map_phys/.unmap_phys interfaces. This conversion allows us to reduce
or eliminate (for certain ARCHs) use of struct pages in DMA path.

Thanks

Leon Romanovsky (9):
  alpha: Convert mapping routine to rely on physical address
  MIPS/jazzdma: Provide physical address directly
  parisc: Convert DMA map_page to map_phys interface
  powerpc: Convert to physical address DMA mapping
  sparc64: Use physical address DMA mapping
  x86: Use physical address for DMA mapping
  vdpa: Convert to physical address DMA mapping
  xen: swiotlb: Convert mapping routine to rely on physical address
  dma-mapping: remove unused map_page callback

 arch/alpha/kernel/pci_iommu.c            | 47 ++++++++++--------------
 arch/mips/jazz/jazzdma.c                 | 20 ++++++----
 arch/powerpc/include/asm/iommu.h         |  8 ++--
 arch/powerpc/kernel/dma-iommu.c          | 22 +++++------
 arch/powerpc/kernel/iommu.c              | 14 +++----
 arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++-------
 arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++----
 arch/powerpc/platforms/pseries/vio.c     | 21 ++++++-----
 arch/sparc/kernel/iommu.c                | 16 ++++----
 arch/sparc/kernel/pci_sun4v.c            | 16 ++++----
 arch/sparc/mm/io-unit.c                  | 13 +++----
 arch/sparc/mm/iommu.c                    | 46 ++++++++++++-----------
 arch/x86/kernel/amd_gart_64.c            | 19 +++++-----
 drivers/parisc/ccio-dma.c                | 25 +++++++------
 drivers/parisc/sba_iommu.c               | 23 ++++++------
 drivers/vdpa/vdpa_user/iova_domain.c     | 11 +++---
 drivers/vdpa/vdpa_user/iova_domain.h     |  8 ++--
 drivers/vdpa/vdpa_user/vduse_dev.c       | 18 +++++----
 drivers/xen/grant-dma-ops.c              | 20 ++++++----
 include/linux/dma-map-ops.h              |  7 ----
 kernel/dma/mapping.c                     | 12 ------
 kernel/dma/ops_helpers.c                 |  8 +---
 22 files changed, 208 insertions(+), 214 deletions(-)

-- 
2.51.0


