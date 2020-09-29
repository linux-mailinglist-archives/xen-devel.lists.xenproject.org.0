Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E927D260
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.251.605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHLA-0006vc-Og; Tue, 29 Sep 2020 15:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251.605; Tue, 29 Sep 2020 15:14:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHLA-0006ux-JW; Tue, 29 Sep 2020 15:14:52 +0000
Received: by outflank-mailman (input) for mailman id 251;
 Tue, 29 Sep 2020 15:14:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kNHL8-0006qd-Ut
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 834bd61b-db9b-484d-9311-c8499a6b8f77;
 Tue, 29 Sep 2020 15:14:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C5E9B083;
 Tue, 29 Sep 2020 15:14:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kNHL8-0006qd-Ut
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:50 +0000
X-Inumbo-ID: 834bd61b-db9b-484d-9311-c8499a6b8f77
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 834bd61b-db9b-484d-9311-c8499a6b8f77;
	Tue, 29 Sep 2020 15:14:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9C5E9B083;
	Tue, 29 Sep 2020 15:14:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	kraxel@redhat.com,
	l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	christian.gmeiner@gmail.com,
	inki.dae@samsung.com,
	jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	kgene@kernel.org,
	krzk@kernel.org,
	yuq825@gmail.com,
	bskeggs@redhat.com,
	robh@kernel.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	hdegoede@redhat.com,
	sean@poorly.run,
	eric@anholt.net,
	oleksandr_andrushchenko@epam.com,
	ray.huang@amd.com,
	sumit.semwal@linaro.org,
	emil.velikov@collabora.com,
	luben.tuikov@amd.com,
	apaneers@amd.com,
	linus.walleij@linaro.org,
	melissa.srw@gmail.com,
	chris@chris-wilson.co.uk,
	miaoqinglang@huawei.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	lima@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for type conversion
Date: Tue, 29 Sep 2020 17:14:32 +0200
Message-Id: <20200929151437.19717-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929151437.19717-1-tzimmermann@suse.de>
References: <20200929151437.19717-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
from and instance of TTM's kmap_obj and initializes struct dma_buf_map
with these values. Helpful for TTM-based drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
 include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index c96a25d571c8..62d89f05a801 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -34,6 +34,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_hashtab.h>
 #include <drm/drm_vma_manager.h>
+#include <linux/dma-buf-map.h>
 #include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/wait.h>
@@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct ttm_bo_kmap_obj *map,
 	return map->virtual;
 }
 
+/**
+ * ttm_kmap_obj_to_dma_buf_map
+ *
+ * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
+ * @map: Returns the mapping as struct dma_buf_map
+ *
+ * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
+ * is not mapped, the returned mapping is initialized to NULL.
+ */
+static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj *kmap,
+					       struct dma_buf_map *map)
+{
+	bool is_iomem;
+	void *vaddr = ttm_kmap_obj_virtual(kmap, &is_iomem);
+
+	if (!vaddr)
+		dma_buf_map_clear(map);
+	else if (is_iomem)
+		dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
+	else
+		dma_buf_map_set_vaddr(map, vaddr);
+}
+
 /**
  * ttm_bo_kmap
  *
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index fd1aba545fdf..2e8bbecb5091 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -45,6 +45,12 @@
  *
  *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
  *
+ * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
+ *
+ * .. code-block:: c
+ *
+ *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
+ *
  * Test if a mapping is valid with either dma_buf_map_is_set() or
  * dma_buf_map_is_null().
  *
@@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, void *vaddr)
 	map->is_iomem = false;
 }
 
+/**
+ * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to an address in I/O memory
+ * @map:		The dma-buf mapping structure
+ * @vaddr_iomem:	An I/O-memory address
+ *
+ * Sets the address and the I/O-memory flag.
+ */
+static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
+					       void __iomem *vaddr_iomem)
+{
+	map->vaddr_iomem = vaddr_iomem;
+	map->is_iomem = true;
+}
+
 /**
  * dma_buf_map_is_equal - Compares two dma-buf mapping structures for equality
  * @lhs:	The dma-buf mapping structure
-- 
2.28.0


