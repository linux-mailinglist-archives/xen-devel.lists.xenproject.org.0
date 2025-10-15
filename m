Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCBDBDDA60
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 11:13:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143384.1477108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8xZN-0002qR-3F; Wed, 15 Oct 2025 09:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143384.1477108; Wed, 15 Oct 2025 09:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8xZN-0002oi-0G; Wed, 15 Oct 2025 09:13:17 +0000
Received: by outflank-mailman (input) for mailman id 1143384;
 Wed, 15 Oct 2025 09:13:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aLBx=4Y=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v8xZM-0002lL-1H
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 09:13:16 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b25297d-a9a7-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 11:13:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D36264172E;
 Wed, 15 Oct 2025 09:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5DDC4CEF8;
 Wed, 15 Oct 2025 09:13:08 +0000 (UTC)
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
X-Inumbo-ID: 2b25297d-a9a7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519588;
	bh=ywR7wdHo9iJDPAMnOLxx2KSfcpdMYgaVYoeQgeEMVE0=;
	h=From:To:Cc:Subject:Date:From;
	b=T/fn/Q7Et3W/XoUP2+BW/BncjyLdn9Q59dx4I+uKrVGVx83N3CoqpvJHFxWuqRsC+
	 XdbXTMel6OirvBhxiFjPLifrL1qZ1WA1GV0CfnbnyJ0gLcqjgJlrUBUk085bytleC1
	 Ps1/U8qadzNDPEXTFtbAw3rfhPCKp+JJvyNHVNWiVzxBuTqLX4e1h0uwpfnG6FXSGu
	 ahv0t+DTPlJs6QFO33ojzLxd9DpyMUAoYg7u/ZEvqC360GdrnKWc4kvzqrKjjOzNyu
	 sfpnfCdbcfzoWkUMqnORIpnF4VZ9xrYID8Bc3PCTstBRCa5sVe3z7x9f1ejmwsSTxY
	 9ePteT4berpfg==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH v5 00/14] Remove DMA map_page/map_resource and their unmap callbacks
Date: Wed, 15 Oct 2025 12:12:46 +0300
Message-ID: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251015-remove-map-page-a28302e6cc7d
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit

This series is a combination of previous two steps [1, 2] to reduce
number of accesses to struct page in the code "below" DMA layer.

In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.

Thanks

[1] https://lore.kernel.org/all/cover.1758203802.git.leon@kernel.org
[2] https://lore.kernel.org/all/cover.1759071169.git.leon@kernel.org

---
Leon Romanovsky (14):
      dma-mapping: prepare dma_map_ops to conversion to physical address
      dma-mapping: convert dummy ops to physical address mapping
      ARM: dma-mapping: Reduce struct page exposure in arch_sync_dma*()
      ARM: dma-mapping: Switch to physical address mapping callbacks
      xen: swiotlb: Switch to physical address mapping callbacks
      dma-mapping: remove unused mapping resource callbacks
      alpha: Convert mapping routine to rely on physical address
      MIPS/jazzdma: Provide physical address directly
      parisc: Convert DMA map_page to map_phys interface
      powerpc: Convert to physical address DMA mapping
      sparc: Use physical address DMA mapping
      x86: Use physical address for DMA mapping
      xen: swiotlb: Convert mapping routine to rely on physical address
      dma-mapping: remove unused map_page callback

 arch/alpha/kernel/pci_iommu.c            |  48 ++++-----
 arch/arm/mm/dma-mapping.c                | 180 +++++++++----------------------
 arch/mips/jazz/jazzdma.c                 |  20 ++--
 arch/powerpc/include/asm/iommu.h         |   8 +-
 arch/powerpc/kernel/dma-iommu.c          |  22 ++--
 arch/powerpc/kernel/iommu.c              |  14 +--
 arch/powerpc/platforms/ps3/system-bus.c  |  33 +++---
 arch/powerpc/platforms/pseries/ibmebus.c |  15 +--
 arch/powerpc/platforms/pseries/vio.c     |  21 ++--
 arch/sparc/kernel/iommu.c                |  30 ++++--
 arch/sparc/kernel/pci_sun4v.c            |  31 +++---
 arch/sparc/mm/io-unit.c                  |  38 +++----
 arch/sparc/mm/iommu.c                    |  46 ++++----
 arch/x86/kernel/amd_gart_64.c            |  19 ++--
 drivers/parisc/ccio-dma.c                |  54 +++++-----
 drivers/parisc/iommu-helpers.h           |  10 +-
 drivers/parisc/sba_iommu.c               |  54 +++++-----
 drivers/xen/grant-dma-ops.c              |  20 ++--
 drivers/xen/swiotlb-xen.c                |  63 +++++------
 include/linux/dma-map-ops.h              |  14 +--
 kernel/dma/dummy.c                       |  13 ++-
 kernel/dma/mapping.c                     |  26 +----
 kernel/dma/ops_helpers.c                 |  12 ++-
 23 files changed, 361 insertions(+), 430 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251015-remove-map-page-a28302e6cc7d

Best regards,
--  
Leon Romanovsky <leon@kernel.org>


