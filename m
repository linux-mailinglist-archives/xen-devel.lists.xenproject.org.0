Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A62EB992
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 06:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62296.110300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx1bC-000181-PF; Wed, 06 Jan 2021 05:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62296.110300; Wed, 06 Jan 2021 05:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx1bC-00017c-L7; Wed, 06 Jan 2021 05:43:10 +0000
Received: by outflank-mailman (input) for mailman id 62296;
 Wed, 06 Jan 2021 03:41:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBi8=GJ=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kwzhW-0005dZ-6F
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 03:41:34 +0000
Received: from mail-pl1-x62d.google.com (unknown [2607:f8b0:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d0bc7a9-8658-415d-a8eb-662e9dc1221f;
 Wed, 06 Jan 2021 03:41:33 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id r4so864100pls.11
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 19:41:33 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
 by smtp.gmail.com with ESMTPSA id v10sm544816pjr.47.2021.01.05.19.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 19:41:31 -0800 (PST)
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
X-Inumbo-ID: 3d0bc7a9-8658-415d-a8eb-662e9dc1221f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U3TpLfW+vImhvH0nGRTRbZCkU/q6uvDGxQ/ffdS/DVM=;
        b=akatZ9qvuVqvk7jTIGmhjfDVt/R+fkDe7KGtuV2FiL0W9X0lfcwuxwQ5SDHkDWvo/Y
         OU4FPQJAhXwq03c8Ys0HNgl+IupiV5k8xFok85r5ImLAz1DYG9c87lF8ePniw4ZUVnDj
         udHjYJ0V3gqIMjH0S4jHAYa5kPGyqU1QS8adQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U3TpLfW+vImhvH0nGRTRbZCkU/q6uvDGxQ/ffdS/DVM=;
        b=XhgUU4Dt30pIC8yCffuXMauxktp7J6cnJV466UkfcDzKbevmzebognvIHpueLz/ckQ
         Zqyn74lj58lJbxRzCXV00IG0LYjdh9aoSM27TKxnXMGNErWj2Ac/QEjtYAniskYKEMQr
         XpHOCqpRJF2CHK4J/Ly43tzKSHdTJXfSOdFNchoELByuf303GdhVqJbd9XxOzuujAFO+
         QEVS1QAEYhQzmsv3Fzmd8WT+ssF1/qT8pPB+SUFexL/833cExA0tFhsQE6vSBSXJLHsF
         tiu/5LJ3g8y47M6mABbJK1Q2HFtc5oLQpgZoYN3X7OoVDIG2keMya3aGd9Lg/NuNdzhZ
         yEyA==
X-Gm-Message-State: AOAM533l+2vMHqXUZouHob1RXgrT/0tRktlXoWD2Ljqjt4NRKYszH9lS
	pShhXIiyJHSOjha4hJR9Y4ft6w==
X-Google-Smtp-Source: ABdhPJzMVJXWuHdnqMMSkgz9jt5n+Akn+pP0QJigxunJGEBd/ODEkJmP1Ra/LRA2SYqMSUv/fxQHkA==
X-Received: by 2002:a17:90a:4582:: with SMTP id v2mr1714522pjg.58.1609904492458;
        Tue, 05 Jan 2021 19:41:32 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: robh+dt@kernel.org,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	joro@8bytes.org,
	will@kernel.org,
	frowand.list@gmail.com,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: grant.likely@arm.com,
	xypron.glpk@gmx.de,
	treding@nvidia.com,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	gregkh@linuxfoundation.org,
	saravanak@google.com,
	rafael.j.wysocki@intel.com,
	heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org,
	dan.j.williams@intel.com,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	tfiga@chromium.org,
	drinkcat@chromium.org,
	Claire Chang <tientzu@chromium.org>
Subject: [RFC PATCH v3 0/6] Restricted DMA
Date: Wed,  6 Jan 2021 11:41:18 +0800
Message-Id: <20210106034124.30560-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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
usually done at firmware level, e.g. in ATF on some ARM platforms).

[1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
[1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
[2] https://blade.tencent.com/en/advisories/qualpwn/
[3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/

Claire Chang (6):
  swiotlb: Add io_tlb_mem struct
  swiotlb: Add restricted DMA pool
  swiotlb: Use restricted DMA pool if available
  swiotlb: Add restricted DMA alloc/free support.
  dt-bindings: of: Add restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  24 +
 arch/powerpc/platforms/pseries/svm.c          |   4 +-
 drivers/iommu/dma-iommu.c                     |  12 +-
 drivers/of/address.c                          |  21 +
 drivers/of/device.c                           |   4 +
 drivers/of/of_private.h                       |   5 +
 drivers/xen/swiotlb-xen.c                     |   4 +-
 include/linux/device.h                        |   4 +
 include/linux/swiotlb.h                       |  61 +-
 kernel/dma/Kconfig                            |   1 +
 kernel/dma/direct.c                           |  20 +-
 kernel/dma/direct.h                           |  10 +-
 kernel/dma/swiotlb.c                          | 576 +++++++++++-------
 13 files changed, 514 insertions(+), 232 deletions(-)

-- 
2.29.2.729.g45daf8777d-goog

v3: 
  Using only one reserved memory region for both streaming DMA and memory
  allocation.

v2:
  Building on top of swiotlb.
  https://lore.kernel.org/patchwork/cover/1280705/

v1:
  Using dma_map_ops.
  https://lore.kernel.org/patchwork/cover/1271660/

