Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F021D314893
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83126.153955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPC-000286-IJ; Tue, 09 Feb 2021 06:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83126.153955; Tue, 09 Feb 2021 06:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPC-00027h-FN; Tue, 09 Feb 2021 06:21:46 +0000
Received: by outflank-mailman (input) for mailman id 83126;
 Tue, 09 Feb 2021 06:21:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MPB-00027c-Lk
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:21:45 +0000
Received: from mail-pj1-x102c.google.com (unknown [2607:f8b0:4864:20::102c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91bc743f-1ed8-406a-bc96-e3b732d44b4b;
 Tue, 09 Feb 2021 06:21:44 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id q72so983995pjq.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:21:44 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id s23sm21047537pgj.29.2021.02.08.22.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:21:43 -0800 (PST)
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
X-Inumbo-ID: 91bc743f-1ed8-406a-bc96-e3b732d44b4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/9o6gw27S6UN8MkYq1blVrCI9BLsI4+H00tlbC8EBE=;
        b=favimtx+6weGe8M555lmQOBhCoy54oReElTcJzpJXeVeBgHQUImtrzhR4xL2PNQ4hj
         B61sBGHNGjtqai17pbRiKkfpKFlyf3N7SfEZNhj9p694hdjwUDNvbaxplQIoX3Y2HB75
         oM9e2a4FzCjXRLbXyImmgB1sz2HO9c4H1yk+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/9o6gw27S6UN8MkYq1blVrCI9BLsI4+H00tlbC8EBE=;
        b=oOPYjOMuUbsGh+ZZcLTtdBcAqogbsFAtjMv7wYHLlO41PxODMaN6oDDWrf1fJcOZ24
         G6FbiXF8pHL/XupLhsmMsH5II2KhOktWMAr2kfXq34jMKqxn5mRgac422hiG9pah+UCg
         7dffYDO2xtBMAkyp7TrFdsyEWBJCc5kRsy00vNqFq8StkDUIgTFI407RBfxydV0wJIR3
         Cu6Ii42vF88QwPw1BrBxnOmQglMw+ppBdbCNoO7eQOLeEl/Llv3ZDXmIL9a4tkDaBBti
         DvKQBo0pRX/dVOLSrBWJsM3sxr9jA2kn9dswlpzrGTNzxiKxZgrRiaSxxVZgcFEfORIK
         n7pA==
X-Gm-Message-State: AOAM532lS2c7h9zcIyJFZdo933askUuFTf0Ir6M/wliHljaPXpzs75NK
	fwo4Fwf+P+chzLlydLBYFAIVYA==
X-Google-Smtp-Source: ABdhPJz0oyYOZadpQA/7+OnNYsgqbz6PN7ozvQBTUr4giRuwP1fH3QYLnHESLb3E3I02eo5S/4aG/w==
X-Received: by 2002:a17:90a:4fe4:: with SMTP id q91mr2479504pjh.165.1612851703796;
        Mon, 08 Feb 2021 22:21:43 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org,
	paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com,
	xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Claire Chang <tientzu@chromium.org>
Subject: [PATCH v4 00/14] Restricted DMA
Date: Tue,  9 Feb 2021 14:21:17 +0800
Message-Id: <20210209062131.2300005-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements mitigations for lack of DMA access control on
systems without an IOMMU, which could result in the DMA accessing the
system memory at unexpected times and/or unexpected addresses, possibly
leading to data leakage or corruption.

For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
not behind an IOMMU. As PCI-e, by design, gives the device full access to
system memory, a vulnerability in the Wi-Fi firmware could easily escalate
to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
full chain of exploits; [2], [3]).

To mitigate the security concerns, we introduce restricted DMA. Restricted
DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
specially allocated region and does memory allocation from the same region.
The feature on its own provides a basic level of protection against the DMA
overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system needs
to provide a way to restrict the DMA to a predefined memory region (this is
usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).

[1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
[1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
[2] https://blade.tencent.com/en/advisories/qualpwn/
[3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
[4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132

Claire Chang (14):
  swiotlb: Remove external access to io_tlb_start
  swiotlb: Move is_swiotlb_buffer() to swiotlb.c
  swiotlb: Add struct swiotlb
  swiotlb: Refactor swiotlb_late_init_with_tbl
  swiotlb: Add DMA_RESTRICTED_POOL
  swiotlb: Add restricted DMA pool
  swiotlb: Update swiotlb API to gain a struct device argument
  swiotlb: Use restricted DMA pool if available
  swiotlb: Refactor swiotlb_tbl_{map,unmap}_single
  dma-direct: Add a new wrapper __dma_direct_free_pages()
  swiotlb: Add is_dev_swiotlb_force()
  swiotlb: Add restricted DMA alloc/free support.
  dt-bindings: of: Add restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  24 +
 arch/powerpc/platforms/pseries/svm.c          |   4 +-
 drivers/iommu/dma-iommu.c                     |  12 +-
 drivers/of/address.c                          |  25 +
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   5 +
 drivers/xen/swiotlb-xen.c                     |   4 +-
 include/linux/device.h                        |   4 +
 include/linux/swiotlb.h                       |  32 +-
 kernel/dma/Kconfig                            |  14 +
 kernel/dma/direct.c                           |  51 +-
 kernel/dma/direct.h                           |   8 +-
 kernel/dma/swiotlb.c                          | 636 ++++++++++++------
 13 files changed, 582 insertions(+), 240 deletions(-)

-- 

v4:
  - Fix spinlock bad magic
  - Use rmem->name for debugfs entry
  - Address the comments in v3

v3:
  Using only one reserved memory region for both streaming DMA and memory
  allocation.
  https://lore.kernel.org/patchwork/cover/1360992/

v2:
  Building on top of swiotlb.
  https://lore.kernel.org/patchwork/cover/1280705/

v1:
  Using dma_map_ops.
  https://lore.kernel.org/patchwork/cover/1271660/

2.30.0.478.g8a0d178c01-goog


