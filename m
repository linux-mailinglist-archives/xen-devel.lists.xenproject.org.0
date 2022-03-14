Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE104D7BB1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289938.491676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfBM-0005Ua-K2; Mon, 14 Mar 2022 07:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289938.491676; Mon, 14 Mar 2022 07:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfBM-0005P2-FR; Mon, 14 Mar 2022 07:31:56 +0000
Received: by outflank-mailman (input) for mailman id 289938;
 Mon, 14 Mar 2022 07:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BEku=TZ=bombadil.srs.infradead.org=BATV+605a0c0c3369109790a8+6777+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nTfBK-00056d-Tf
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 07:31:54 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdd6656d-a368-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 08:31:49 +0100 (CET)
Received: from [46.140.54.162] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfAx-0044RD-TW; Mon, 14 Mar 2022 07:31:32 +0000
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
X-Inumbo-ID: cdd6656d-a368-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=HhGavQ6qvlf8H5F/ZlRZDjP5Hg4YmQaPJkbgnrtpMJI=; b=x1HmPcRq+EIQAGkkRG5r3Q2ccQ
	wnlPc6HT3VpJAMMRF1p4SFikzmXOQYomeT6ykxwmWCxoebP1bN2ceE+8XNvoM8N5VllZnT75DHXGC
	h4wekLHOCpTAFXijUS4GI7cBuhiIwxysA4rgf8RJTlGS2pKLIVQjT1AeGrirHMuQmzJkixPdmUiaw
	cmRW8o6cqr3klWE3JQHi+2CDOTmN7yN+qKBICbgnWeDRcK/2hY0uiepsrGceY5FvPtk+56Vn9gD0m
	a70FwFmi8fEZWw8s5/U6tP9pIaV7UquRjOae803zd4ky95pR5AVFQCHxkh5K/hYSfr0VZAdOqR1aQ
	rxPZmEfQ==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: cleanup swiotlb initialization v5
Date: Mon, 14 Mar 2022 08:31:14 +0100
Message-Id: <20220314073129.1862284-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this series tries to clean up the swiotlb initialization, including
that of swiotlb-xen.  To get there is also removes the x86 iommu table
infrastructure that massively obsfucates the initialization path.

Git tree:

    git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-init-cleanup

Changes since v5:
 - split a patch into three
 - fix setting x86_swiotlb_enable for Xen
 - fix a comment about forced bounce buffering for guest memory
   encryption
 - remove the xen_initial_domain check from
   xen_create_contiguous_region

Changes since v3:
 - fix a compilation issue on some powerpc configfs
 - fix and cleanup how forced bounce buffering is enabled for
   guest memory encryption

Changes since v2:
 - make ppc_swiotlb_flags actually work again
 - also force enable swiotlb for guest encrypted memory to cater
   to hyperv which doesn't set the host encrypted memory flag

Changes since v1:
 - skip IOMMU initialization on Xen PV kernels
 - various small whitespace / typo fixes

Diffstat:
 arch/ia64/include/asm/iommu_table.h      |    7 -
 arch/x86/include/asm/iommu_table.h       |  102 ------------------
 arch/x86/include/asm/swiotlb.h           |   30 -----
 arch/x86/kernel/pci-iommu_table.c        |   77 -------------
 arch/x86/kernel/pci-swiotlb.c            |   77 -------------
 arch/x86/xen/pci-swiotlb-xen.c           |   96 -----------------
 b/arch/arm/mm/init.c                     |    6 -
 b/arch/arm/xen/mm.c                      |   26 ++--
 b/arch/arm64/mm/init.c                   |    6 -
 b/arch/ia64/mm/init.c                    |    4 
 b/arch/mips/cavium-octeon/dma-octeon.c   |   15 --
 b/arch/mips/loongson64/dma.c             |    2 
 b/arch/mips/pci/pci-octeon.c             |    2 
 b/arch/mips/sibyte/common/dma.c          |    2 
 b/arch/powerpc/include/asm/svm.h         |    4 
 b/arch/powerpc/include/asm/swiotlb.h     |    1 
 b/arch/powerpc/kernel/dma-swiotlb.c      |    1 
 b/arch/powerpc/mm/mem.c                  |    6 -
 b/arch/powerpc/platforms/pseries/setup.c |    3 
 b/arch/powerpc/platforms/pseries/svm.c   |   26 ----
 b/arch/riscv/mm/init.c                   |    8 -
 b/arch/s390/mm/init.c                    |    3 
 b/arch/x86/include/asm/dma-mapping.h     |   12 --
 b/arch/x86/include/asm/gart.h            |    5 
 b/arch/x86/include/asm/iommu.h           |    8 +
 b/arch/x86/include/asm/xen/page.h        |    5 
 b/arch/x86/include/asm/xen/swiotlb-xen.h |    2 
 b/arch/x86/kernel/Makefile               |    2 
 b/arch/x86/kernel/amd_gart_64.c          |    5 
 b/arch/x86/kernel/aperture_64.c          |   14 --
 b/arch/x86/kernel/cpu/mshyperv.c         |    8 -
 b/arch/x86/kernel/pci-dma.c              |  113 ++++++++++++++++----
 b/arch/x86/kernel/tboot.c                |    1 
 b/arch/x86/kernel/vmlinux.lds.S          |   12 --
 b/arch/x86/mm/mem_encrypt_amd.c          |    3 
 b/arch/x86/pci/sta2x11-fixup.c           |    2 
 b/arch/x86/xen/Makefile                  |    2 
 b/drivers/iommu/amd/init.c               |    6 -
 b/drivers/iommu/amd/iommu.c              |    5 
 b/drivers/iommu/intel/dmar.c             |    6 -
 b/drivers/xen/swiotlb-xen.c              |  132 -----------------------
 b/include/linux/dmar.h                   |    6 -
 b/include/linux/swiotlb.h                |   22 +--
 b/include/trace/events/swiotlb.h         |   29 +----
 b/include/xen/arm/page.h                 |    1 
 b/include/xen/swiotlb-xen.h              |    8 +
 b/kernel/dma/direct.h                    |    2 
 b/kernel/dma/swiotlb.c                   |  175 +++++++++++++++----------------
 48 files changed, 264 insertions(+), 826 deletions(-)

