Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32229B850AA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 16:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126139.1467805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzFKm-0002Rt-K3; Thu, 18 Sep 2025 14:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126139.1467805; Thu, 18 Sep 2025 14:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzFKm-0002Oy-HI; Thu, 18 Sep 2025 14:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1126139;
 Thu, 18 Sep 2025 14:10:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TAPY=35=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uzFKl-00023R-67
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 14:10:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a80a570-9499-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 16:10:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 67FB560052;
 Thu, 18 Sep 2025 14:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE6CC4CEE7;
 Thu, 18 Sep 2025 14:09:59 +0000 (UTC)
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
X-Inumbo-ID: 2a80a570-9499-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758204600;
	bh=Pi5T819TFc2iqtg/dEe1hcW6EHD16i+UrHXuy/WzDOY=;
	h=From:To:Cc:Subject:Date:From;
	b=N6hq4IZioMzxZVLrqPxIN1sDeyN1/MixcEr36decDtSa4WNTO48EIzoRtCfHURiTP
	 XMufzHtXGUQWyG32ltphrXys4JlT2/nPQzRJUepSs7aIKZ4Dt/Ss1EyEAK8QkC8zc3
	 vIl5lD0WF4qeZn8Z3KGVbFo72DRy50Klk5ZEVPZ2yeHGy8hIMfUDG6YgqbV6WFZxca
	 4kV/RF3TSWU8WIaiPtXWJzI2gXYl0Crd2VqYcMMNL6jc66qQmehT4vZSRFKtxGw7Jr
	 cRVkT6eGVn1SU0m0y41HUKDXp21LxO+guGGu3EyXnpZKW4XO6cr0Q6FOwPLQ0JkSJE
	 62ET1qQlR3oRw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev,
	Juergen Gross <jgross@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 0/6] Preparation to .map_page and .unmap_page removal
Date: Thu, 18 Sep 2025 17:09:23 +0300
Message-ID: <cover.1758203802.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
v4:
 * Added Jason's ROB tags
 * Added "xen: swiotlb ..." patch to the list of patches which had .map_resource
 * Added extra patch "ARM: dma-mapping: Reduce ..." to remove struct
   page as much as possible.
 * Added call to .map_phys/.unmap_phys to dma_common_*_pages() functions.
v3: https://lore.kernel.org/all/cover.1758006942.git.leon@kernel.org
 * Rewrote the series to allow combination of .map_resource and
 * .map_page
   to one flow.
 * Added two new patches to convert and remove .map_resource.
v2: https://lore.kernel.org/all/cover.1752734252.git.leon@kernel.org/
 * Added default "else" section without map_phys and map_page
   callbacks (impossible).
v1: https://lore.kernel.org/all/cover.1753003879.git.leon@kernel.org
 * Changed "else if" instead of "if".
v0: https://lore.kernel.org/all/cover.1752734252.git.leon@kernel.org
---------------------------------------------------------------------

This is followup to "dma-mapping: migrate to physical address-based API" series
https://lore.kernel.org/all/cover.1757423202.git.leonro@nvidia.com

Thanks

Leon Romanovsky (6):
  dma-mapping: prepare dma_map_ops to conversion to physical address
  dma-mapping: convert dummy ops to physical address mapping
  ARM: dma-mapping: Reduce struct page exposure in arch_sync_dma*()
  ARM: dma-mapping: Switch to physical address mapping callbacks
  xen: swiotlb: Switch to physical address mapping callbacks
  dma-mapping: remove unused mapping resource callbacks

 arch/arm/mm/dma-mapping.c   | 180 +++++++++++-------------------------
 drivers/xen/swiotlb-xen.c   |  63 ++++++-------
 include/linux/dma-map-ops.h |  13 +--
 kernel/dma/dummy.c          |  13 ++-
 kernel/dma/mapping.c        |  20 ++--
 kernel/dma/ops_helpers.c    |  12 ++-
 6 files changed, 113 insertions(+), 188 deletions(-)

-- 
2.51.0


