Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C31B961F37
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 08:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784479.1193832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjBtp-0001qi-8j; Wed, 28 Aug 2024 06:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784479.1193832; Wed, 28 Aug 2024 06:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjBtp-0001nd-4N; Wed, 28 Aug 2024 06:11:21 +0000
Received: by outflank-mailman (input) for mailman id 784479;
 Wed, 28 Aug 2024 06:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gvM=P3=bombadil.srs.infradead.org=BATV+4c6678e563c2e29e76cf+7675+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sjBto-0001ZP-7E
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 06:11:20 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 572d1c0f-6504-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 08:11:19 +0200 (CEST)
Received: from [2001:4bb8:2dc:a2cd:2ccf:8fbe:8ab4:c9db] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sjBtg-0000000E1uh-0axG; Wed, 28 Aug 2024 06:11:13 +0000
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
X-Inumbo-ID: 572d1c0f-6504-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=xXPvEjkN13oRSPiD1VpIsI6lICkEOhwDSVN6M4ebF3M=; b=G6ceizxaxo/5YPTjysre3RE3P5
	r6theemKFI6tHVBOtljvn4KkqxAS2QAOgq2kFNqL/qSweoZ78GG5roeidLnOxQYaFwBGFSvMgjIxT
	Nd3VjlhZeAlYoMTPJ/A+LgEVZKiJo8/6vpC94GKnxo/yeszqxNmOI2uH+gYkKm6wByymb+IQbHgRs
	lDgiPm0CITsg8ivicn6DOIMDexltTWRjLyX7eFt13Mh7KXkquOY+RUG+jycl2hgcaS99zex+kd+o9
	eIbY6ta0tPyXUDbcb5Au2QNiyOxW5yX9stCLkEzWH5+UibAoch+LaUcS6z8gLwS5pfwAXC+wswjoI
	AbBwVQ3w==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] vdpa_sim: don't select DMA_OPS
Date: Wed, 28 Aug 2024 09:10:28 +0300
Message-ID: <20240828061104.1925127-2-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828061104.1925127-1-hch@lst.de>
References: <20240828061104.1925127-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

vdpa_sim has been fixed to not override the dma_map_ops in commit
6c3d329e6486 ("vdpa_sim: get rid of DMA ops"), so don't select the
symbol and don't depend on HAS_DMA.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vdpa/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 5265d09fc1c409..b08de3b7706109 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -11,8 +11,7 @@ if VDPA
 
 config VDPA_SIM
 	tristate "vDPA device simulator core"
-	depends on RUNTIME_TESTING_MENU && HAS_DMA
-	select DMA_OPS
+	depends on RUNTIME_TESTING_MENU
 	select VHOST_RING
 	select IOMMU_IOVA
 	help
-- 
2.43.0


