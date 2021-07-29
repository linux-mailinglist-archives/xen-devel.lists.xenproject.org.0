Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7553DAD3B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 22:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162034.297346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9CRr-0007O1-VD; Thu, 29 Jul 2021 20:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162034.297346; Thu, 29 Jul 2021 20:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9CRr-0007KO-Oy; Thu, 29 Jul 2021 20:16:07 +0000
Received: by outflank-mailman (input) for mailman id 162034;
 Thu, 29 Jul 2021 20:16:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yd/7=MV=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m9CRq-0005tB-EK
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 20:16:06 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7e59648-f0a9-11eb-986b-12813bfff9fa;
 Thu, 29 Jul 2021 20:15:56 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRW-0008VK-N8; Thu, 29 Jul 2021 14:15:48 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRT-0001TQ-GA; Thu, 29 Jul 2021 14:15:43 -0600
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
X-Inumbo-ID: c7e59648-f0a9-11eb-986b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-Id:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=7rAmHnoYgxgYjh3HpXE3zIryStVPnDAXEkL4Vf4StFI=; b=L5MNdXu2RkyJTJf1U2kRvC9rdG
	Fi2zQ1Jo3u1ckG/sUDTfnnmRyNWyUMZVsCZU5ucjiSE8C7rbOZzmh1mIa+nIyi3p3yQ8QIqp8/8xs
	cM2jhkuv4pfRuvlROkJ6z1cv/rfzQGi+rw77mVN27FJvbTmHpYWyID7OpgY0TpEjoXxQB12zUEd2r
	qyL1Zv3YKYpHBX2i1FpWwa4P7p3I9m48iblFE7zjLA4rM23n63DmfJ4gAgeBygMx7BL4dr76mc0ma
	v5/O9IEdo/7kZsErHJx4AGKvqOqjGEMEdx65oFZOavjAfDwmsYJuN/6fgpzQ96CduuqfEm7ibrvmU
	gsRgMH7A==;
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-parisc@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stephen Bates <sbates@raithlin.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Thu, 29 Jul 2021 14:15:18 -0600
Message-Id: <20210729201539.5602-1-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v3 00/21] .map_sg() error cleanup
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Hi,

This v3 of the series is spun out and expanded from my work to add
P2PDMA support to DMA map operations[1]. v2 is at [2]. The main changes
in v1 are to more carefully define the meaning of the error codes for
dma_map_sgtable().

The P2PDMA work requires distinguishing different error conditions in
a map_sg operation. dma_map_sgtable() already allows for returning an
error code (where as dma_map_sg() is only allowed to return zero)
however, it currently only returns -EINVAL when a .map_sg() call returns
zero.

This series cleans up all .map_sg() implementations to return appropriate
error codes. After the cleanup, dma_map_sg() will still return zero,
however dma_map_sgtable() will pass the error code from the .map_sg()
call. Thanks go to Martn Oliveira for doing a lot of the cleanup of the
obscure implementations.

The patch set is based off of v5.14-rc2 and a git repo can be found
here:

  https://github.com/sbates130272/linux-p2pmem map_sg_err_cleanup_v2

Thanks,

Logan

[1] https://lore.kernel.org/linux-block/20210513223203.5542-1-logang@deltatee.com/
[2] https://lore.kernel.org/linux-mips/20210723175008.22410-1-logang@deltatee.com/

--

Changes in v3:
  - Move the validation of errnos into __dma_map_sg_attrs() (Per
    Christoph)
  - Fix the out of date commit message in patch 21 (Per Eike)
Changes in v2:
  - Attempt to define the meanings of the errors returned by
    dma_map_sgtable() and restrict the valid return codes of
    .map_sg implementations. (Per Christoph)
  - Change dma_map_sgtable() to EXPORT_SYMBOL_GPL() (Per Christoph)
  - Add patches to remove the erroneous setting of sg->dma_address
    to DMA_MAP_ERROR in a few .map_sg(0 implementations. (Per
    Christoph).

--

Logan Gunthorpe (10):
  dma-mapping: Allow map_sg() ops to return negative error codes
  dma-direct: Return appropriate error code from dma_direct_map_sg()
  iommu: Return full error code from iommu_map_sg[_atomic]()
  dma-iommu: Return error code from iommu_dma_map_sg()
  ARM/dma-mapping: don't set failed sg dma_address to DMA_MAPPING_ERROR
  powerpc/iommu: don't set failed sg dma_address to DMA_MAPPING_ERROR
  s390/pci: don't set failed sg dma_address to DMA_MAPPING_ERROR
  sparc/iommu: don't set failed sg dma_address to DMA_MAPPING_ERROR
  x86/amd_gart: don't set failed sg dma_address to DMA_MAPPING_ERROR
  dma-mapping: Disallow .map_sg operations from returning zero on error

Martin Oliveira (11):
  alpha: return error code from alpha_pci_map_sg()
  ARM/dma-mapping: return error code from .map_sg() ops
  ia64/sba_iommu: return error code from sba_map_sg_attrs()
  MIPS/jazzdma: return error code from jazz_dma_map_sg()
  powerpc/iommu: return error code from .map_sg() ops
  s390/pci: return error code from s390_dma_map_sg()
  sparc/iommu: return error codes from .map_sg() ops
  parisc: return error code from .map_sg() ops
  xen: swiotlb: return error code from xen_swiotlb_map_sg()
  x86/amd_gart: return error code from gart_map_sg()
  dma-mapping: return error code from dma_dummy_map_sg()

 arch/alpha/kernel/pci_iommu.c           | 10 ++-
 arch/arm/mm/dma-mapping.c               | 26 +++++---
 arch/ia64/hp/common/sba_iommu.c         |  6 +-
 arch/mips/jazz/jazzdma.c                |  2 +-
 arch/powerpc/kernel/iommu.c             |  6 +-
 arch/powerpc/platforms/ps3/system-bus.c |  2 +-
 arch/powerpc/platforms/pseries/vio.c    |  5 +-
 arch/s390/pci/pci_dma.c                 | 13 ++--
 arch/sparc/kernel/iommu.c               |  6 +-
 arch/sparc/kernel/pci_sun4v.c           |  6 +-
 arch/sparc/mm/iommu.c                   |  2 +-
 arch/x86/kernel/amd_gart_64.c           | 18 +++---
 drivers/iommu/dma-iommu.c               | 23 ++++---
 drivers/iommu/iommu.c                   | 15 +++--
 drivers/parisc/ccio-dma.c               |  2 +-
 drivers/parisc/sba_iommu.c              |  2 +-
 drivers/xen/swiotlb-xen.c               |  2 +-
 include/linux/dma-map-ops.h             |  5 +-
 include/linux/dma-mapping.h             | 35 +++--------
 include/linux/iommu.h                   | 22 +++----
 kernel/dma/direct.c                     |  2 +-
 kernel/dma/dummy.c                      |  2 +-
 kernel/dma/mapping.c                    | 82 ++++++++++++++++++++++---
 23 files changed, 177 insertions(+), 117 deletions(-)


base-commit: ff1176468d368232b684f75e82563369208bc371
--
2.20.1

