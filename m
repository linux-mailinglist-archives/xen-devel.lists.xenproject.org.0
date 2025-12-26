Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF1CDFD66
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193532.1512250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC8-0007su-44; Sat, 27 Dec 2025 14:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193532.1512250; Sat, 27 Dec 2025 14:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC7-0007iX-S1; Sat, 27 Dec 2025 14:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1193532;
 Sat, 27 Dec 2025 00:30:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4j1x=7B=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZICL-0000j8-C6
 for xen-devel@lists.xenproject.org; Sat, 27 Dec 2025 00:30:21 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38c1311a-e2bb-11f0-b15c-2bf370ae4941;
 Sat, 27 Dec 2025 01:30:19 +0100 (CET)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-8b2ec756de0so794401785a.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Dec 2025 16:30:19 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:53:16 -0800 (PST)
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
X-Inumbo-ID: 38c1311a-e2bb-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766795418; x=1767400218; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/r7srQmiwZEhg1qAC5GzWj8afC3w1hmN+Jy3ezOc8f0=;
        b=iXDYOoXz6/KP7iKHkqxGxIz56GGhsqXPnadTM4wEwQ1FgI7qQ/87NxbVhe9LxuvivJ
         SkWCaUkay/aVDJdh+oaC9xhNp/00BtHTLKbQDwwhDpozjOom9fJFEkON6/L+Zvz6vxSX
         ailF84KVIHWhaQA2aNZ9hhhsNh1uz0rZQc0WBellX0mzR5aNmMi3KYFNKtps6rCpPfsR
         9heQXY16qp06g0VwApgFaTaKrr1kVWBbZI3nX+Had8A5rTNJW580PpGgXGOVUEToNyPa
         ZKgEy9//c2aLdkYJDyiMLg5QP2/gf3bSpSDVklxE4aI9kKpFnNSRexSZyshWJio5lGhi
         D2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766795418; x=1767400218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r7srQmiwZEhg1qAC5GzWj8afC3w1hmN+Jy3ezOc8f0=;
        b=aU/0UdMgUClcvmd2yvMmyWNIhYbkofjGb12/7HCc1w5C99GgJZOH/ffMddhC6a4NMv
         fMsTRZw2JkYa3d/CTXmT66iT98yg36HzX6ra/mROuI5+ArvATDFSTY2KDyUfigzyUXF8
         nskl86F0BfalM/uz4V8Qd9nlRzc9ej5RkiU6D73RN/zCES9jbaLhLb01Be02VbKoJUy7
         26DeJsMQ1KLhH813hktf7+2wl+j6FzPqE5SxSxYAjjITLuzYQB46yGBuGmfk8K4+m0jM
         xJ5v4gLX6SyM2xFEOmuSiVFMpb6vgviPoJBBOopT9XHH8GR6C90ygcVM3AR0pHaFolWV
         Tb1A==
X-Forwarded-Encrypted: i=1; AJvYcCUWN8x2xbhU32RaenDxWv6htg8OSz5ZqVRyj48DNLvXqOq3/dJnZO3tdyPQvUgu6h6U89I7XrIzQMo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuNf5Pb32egnL9A3ggzLF6nbBCxfvCQgq2djIkPuWKD7W4a+EX
	Un/ce7Qhp3t+/6iLUq2ggjtyQEX33/ov3uvfBHLcwDiSn8rV/vBcl3JDSAdfBmg1
X-Gm-Gg: AY/fxX62iC+lwQZcIqyENBSvLcbmZwKbqTO9TAGzQFYCCXRFe6g23uOj4jwPUL1nBTE
	B0XAP9H4fD4E7/w7/j+xDEmqcPoBIM18yrGzv/MgG01HrJOl3k6mXox0TyQwfYtWs1JN5HTFiB7
	JjhSgDr2XGftRh0OpxgvdrA4hJ1bLVaTnWpcjTq99hbiIP7Y1kKqy//l+bhtyalyvjFOiCwBHYk
	eWGA4R84nuHCbu5pEuneFxY13GQQjSWLMNajWAYGryePo3dILGZThtYkJPe3iyw/GKqODkToR7Z
	WSpVmt26iNhN6xUb7SgyNsi8418CniaoKU44WdOzGBAAwX9a5cdgBXMUfPnlLEEzTZxgIJ4nCl4
	PXjAwVOFFRBh+22JQNjyYsvRw51xg+h9dqG/E8yty3k7mWpqipIIPGzS9hMM8iCtBDp/Q3V8AZO
	hJK91ORX5tFxV5
X-Google-Smtp-Source: AGHT+IGRk72ichKRcHInGwm03WbYMZHXhydzrv/dBjOlD3Ki0dbJk2IiVKSqfCl2HL9XczgL6zklJg==
X-Received: by 2002:a17:90a:e7c9:b0:32e:7340:a7f7 with SMTP id 98e67ed59e1d1-34e921131admr17034959a91.2.1766789597799;
        Fri, 26 Dec 2025 14:53:17 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Barry Song <baohua@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>,
	Huacai Zhou <zhouhuacai@oppo.com>
Subject: [PATCH v2 0/8] dma-mapping: arm64: support batched cache sync
Date: Sat, 27 Dec 2025 11:52:40 +1300
Message-ID: <20251226225254.46197-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

Many embedded ARM64 SoCs still lack hardware cache coherency support, which
causes DMA mapping operations to appear as hotspots in on-CPU flame graphs.

For an SG list with *nents* entries, the current dma_map/unmap_sg() and DMA
sync APIs perform cache maintenance one entry at a time. After each entry,
the implementation synchronously waits for the corresponding region’s
D-cache operations to complete. On architectures like arm64, efficiency can
be improved by issuing all entries’ operations first and then performing a
single batched wait for completion.

Tangquan's results show that batched synchronization can reduce
dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
phone platform (MediaTek Dimensity 9500). The tests were performed by
pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
sg entries per buffer) for 200 iterations and then averaging the
results.

I also ran this patch set on an RK3588 Rock5B+ board and
observed that millions of DMA sync operations were batched.

v2:
 * Refine a large amount of arm64 asm code based on feedback from
   Robin, thanks!
 * Drop batch_add APIs and always use arch_sync_dma_for_* + flush,
   even for a single buffer, based on Leon’s suggestion, thanks!
 * Refine a large amount of code based on feedback from Leon, thanks!
 * Also add batch support for iommu_dma_sync_sg_for_{cpu,device}
v1 link:
 https://lore.kernel.org/lkml/20251219053658.84978-1-21cnbao@gmail.com/

v1, diff with RFC:
 * Drop a large number of #ifdef/#else/#endif blocks based on feedback
   from Catalin and Marek, thanks!
 * Also add batched iova link/unlink support, marked as RFC since I lack
   the required hardware. This was suggested by Marek, thanks!
RFC link:
 https://lore.kernel.org/lkml/20251029023115.22809-1-21cnbao@gmail.com/

Barry Song (8):
  arm64: Provide dcache_by_myline_op_nosync helper
  arm64: Provide dcache_clean_poc_nosync helper
  arm64: Provide dcache_inval_poc_nosync helper
  dma-mapping: Separate DMA sync issuing and completion waiting
  dma-mapping: Support batch mode for dma_direct_sync_sg_for_*
  dma-mapping: Support batch mode for dma_direct_{map,unmap}_sg
  dma-iommu: Support DMA sync batch mode for IOVA link and unlink
  dma-iommu: Support DMA sync batch mode for iommu_dma_sync_sg_for_{cpu,
    device}

 arch/arm64/include/asm/assembler.h  | 24 +++++++++---
 arch/arm64/include/asm/cache.h      |  6 +++
 arch/arm64/include/asm/cacheflush.h |  2 +
 arch/arm64/kernel/relocate_kernel.S |  3 +-
 arch/arm64/mm/cache.S               | 57 +++++++++++++++++++++++------
 arch/arm64/mm/dma-mapping.c         |  4 +-
 drivers/iommu/dma-iommu.c           | 35 ++++++++++++++----
 drivers/xen/swiotlb-xen.c           | 24 ++++++++----
 include/linux/dma-map-ops.h         |  6 +++
 kernel/dma/direct.c                 | 23 +++++++++---
 kernel/dma/direct.h                 | 21 ++++++++---
 kernel/dma/mapping.c                |  6 +--
 kernel/dma/swiotlb.c                |  4 +-
 13 files changed, 165 insertions(+), 50 deletions(-)

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Cc: Huacai Zhou <zhouhuacai@oppo.com>
--
2.43.0


