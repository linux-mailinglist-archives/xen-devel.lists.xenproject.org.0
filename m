Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD9BA7301
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 17:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132399.1470760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2svJ-0001bo-Us; Sun, 28 Sep 2025 15:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132399.1470760; Sun, 28 Sep 2025 15:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2svJ-0001aI-S0; Sun, 28 Sep 2025 15:02:49 +0000
Received: by outflank-mailman (input) for mailman id 1132399;
 Sun, 28 Sep 2025 15:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zTFj=4H=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v2svI-0001Mg-QG
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 15:02:48 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2db117a1-9c7c-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 17:02:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 60CC46218F;
 Sun, 28 Sep 2025 15:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E12C4CEF0;
 Sun, 28 Sep 2025 15:02:38 +0000 (UTC)
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
X-Inumbo-ID: 2db117a1-9c7c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071759;
	bh=Akj3CON6IBsq+OP9A9OkC5SszLfqcLnpZRG8DGaLpwM=;
	h=From:To:Cc:Subject:Date:From;
	b=TnkMQdRqI3QZ3YV/GCpp5pqPe146ZT+yd8f0yZi5dqhffQqkLDkFNg275CdcBt57r
	 P46/Q8MJggBoVrUATbN4yQz/1RNVzEr4qRwDBK1qefHMrZA7rRP2hz2qDSVWQ0iS7S
	 DGy5cZpbTLZ4famPhxfNn0tm+T9zHJU/CGhwJumTvkSrrah3nVMcJlpks0e7mhTc4w
	 j8HKF/6RRxHmpIgigj7NLyGRrG0vXEG8EvTBOOsy4JlJy5mBhEoqFp+dHa3/mFRG69
	 4FazbdhYoc7M4C8CocEkOrWVODSNfM2PMKHWaItVyJziGeyDxLU2xd+NY5jkkGqhpC
	 h/JiXqu+FTGaw==
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
	xen-devel@lists.xenproject.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v1 0/9] Remove DMA .map_page and .unmap_page callbacks
Date: Sun, 28 Sep 2025 18:02:20 +0300
Message-ID: <cover.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
v1:
 * Fixed wrong offset in alpha conversion patch.
v0: https://lore.kernel.org/all/cover.1758219786.git.leon@kernel.org

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

 arch/alpha/kernel/pci_iommu.c            | 48 +++++++++++-------------
 arch/mips/jazz/jazzdma.c                 | 20 ++++++----
 arch/powerpc/include/asm/iommu.h         |  8 ++--
 arch/powerpc/kernel/dma-iommu.c          | 22 +++++------
 arch/powerpc/kernel/iommu.c              | 14 +++----
 arch/powerpc/platforms/ps3/system-bus.c  | 33 +++++++++-------
 arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++----
 arch/powerpc/platforms/pseries/vio.c     | 21 ++++++-----
 arch/sparc/kernel/iommu.c                | 16 ++++----
 arch/sparc/kernel/pci_sun4v.c            | 16 ++++----
 arch/sparc/mm/io-unit.c                  | 13 +++----
 arch/sparc/mm/iommu.c                    | 46 ++++++++++++-----------
 arch/x86/kernel/amd_gart_64.c            | 19 +++++-----
 drivers/parisc/ccio-dma.c                | 25 ++++++------
 drivers/parisc/sba_iommu.c               | 23 ++++++------
 drivers/vdpa/vdpa_user/iova_domain.c     | 11 +++---
 drivers/vdpa/vdpa_user/iova_domain.h     |  8 ++--
 drivers/vdpa/vdpa_user/vduse_dev.c       | 18 +++++----
 drivers/xen/grant-dma-ops.c              | 20 ++++++----
 include/linux/dma-map-ops.h              |  7 ----
 kernel/dma/mapping.c                     | 12 ------
 kernel/dma/ops_helpers.c                 |  8 +---
 22 files changed, 209 insertions(+), 214 deletions(-)

-- 
2.51.0


