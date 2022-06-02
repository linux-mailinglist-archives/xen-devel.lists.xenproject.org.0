Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98D53BEAD
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 21:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341186.566436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQn-0001hx-32; Thu, 02 Jun 2022 19:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341186.566436; Thu, 02 Jun 2022 19:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQm-0001br-PS; Thu, 02 Jun 2022 19:24:28 +0000
Received: by outflank-mailman (input) for mailman id 341186;
 Thu, 02 Jun 2022 19:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EeJ=WJ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwqQk-0000dK-2K
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 19:24:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cda2f64-e2a9-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 21:24:25 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id v1so1130087ejg.13
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jun 2022 12:24:25 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 eg13-20020a056402288d00b0042dce73168csm2938301edb.13.2022.06.02.12.24.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jun 2022 12:24:24 -0700 (PDT)
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
X-Inumbo-ID: 9cda2f64-e2a9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z5QlzeQbdKIOve+OBZzBdwGWf+LJ0VAgmCK8UR9Ip/I=;
        b=JsGs3AOUU2Y9WUix6EzdEzmQ3rqReff1j2L+DhP0gYv0LiZycnCA/GqH2+Y4du2Uad
         8pIDJxQ+ZbH8xFSIa4iHlHz1kf10KRLyvRXu8pYX+m7htkxYxy5W7rW9e5AU0SZKIB1f
         ZlNaolglE+ZvYXmncHkSx2TMsS3BX0vio1PNHxfT+XiqVUwschxzD+4/rDILAEIxdpre
         JinQjTFlMMiD7jcogL7DYqS3TYvavYjod3/XZULDumCHOHcUMksAu1JZWvL0xp7D5+3Y
         sGmaZ4oBtjIb7qUGxJSvKVsRWuAUQM/6LaNoR1g1cdI7S2ppacHZqVvqdTP/1nokkEXr
         grxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z5QlzeQbdKIOve+OBZzBdwGWf+LJ0VAgmCK8UR9Ip/I=;
        b=rRFdG9k9g6db6ShwAA/rQjDdc5a/ohdZXaaB+jIYsIsvJ1wWunBf2UihfsmrsO8apP
         iM3ZDd/RySVGkLFrwyK7JTrk9r+9g7rXgf0TIU/E6HyVHKtUDBsZmIOm9drWzlPB7Mfl
         AQT2JHXRQ30X/6WUUEi0WGgmBH/DyAWr36S4gduz04h9GMg8i9oqYUlRIhanBgOwotTV
         xIsFTyRi++AhC+yQFtFnROBv41ae5cQ5njnCApzTuxaMCNnFrsCeU1LdxWkDNncdTkt1
         Gf8KlNlkEdYVzcNwjsAFd8mgwl1hT52N8gk6TjllnTMlkpI7gur9GAQq72Lj2AWwxdfx
         R83A==
X-Gm-Message-State: AOAM532y+nyxkfpDiKRw6HDa27FyFn+5+lL+52q1S+CBTOB02/qJJWH0
	RF8DKvjcBFLiMNIHP/c1cdOhZzlFX1U=
X-Google-Smtp-Source: ABdhPJyum/BEFc4hal1QK39RdGrJhyKx4sfjLkjCqt1swmw2sAGVsLdhJxMQyWsjJ3IkhUXEWuqIsA==
X-Received: by 2002:a17:907:ea1:b0:6fe:f6a5:6009 with SMTP id ho33-20020a1709070ea100b006fef6a56009mr5910513ejc.275.1654197864490;
        Thu, 02 Jun 2022 12:24:24 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: [PATCH V4 7/8] xen/grant-dma-ops: Retrieve the ID of backend's domain for DT devices
Date: Thu,  2 Jun 2022 22:23:52 +0300
Message-Id: <1654197833-25362-8-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>
References: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Use the presence of "iommus" property pointed to the IOMMU node with
recently introduced "xen,grant-dma" compatible as a clear indicator
of enabling Xen grant mappings scheme for that device and read the ID
of Xen domain where the corresponding backend is running. The domid
(domain ID) is used as an argument to the Xen grant mapping APIs.

To avoid the deferred probe timeout which takes place after reusing
generic IOMMU device tree bindings (because the IOMMU device never
becomes available) enable recently introduced stub IOMMU driver by
selecting XEN_GRANT_DMA_IOMMU.

Also introduce xen_is_grant_dma_device() to check whether xen-grant
DMA ops need to be set for a passed device.

Remove the hardcoded domid 0 in xen_grant_setup_dma_ops().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes RFC -> V1:
   - new patch, split required changes from commit:
    "[PATCH 4/6] virtio: Various updates to xen-virtio DMA ops layer"
   - update checks in xen_virtio_setup_dma_ops() to only support
     DT devices for now
   - remove the "virtio,mmio" check from xen_is_virtio_device()
   - remane everything according to the new naming scheme:
     s/virtio/grant_dma

Changes V1 -> V2:
   - remove dev_is_pci() check in xen_grant_setup_dma_ops()
   - remove EXPORT_SYMBOL_GPL(xen_is_grant_dma_device);

Changes V2 -> V3:
   - Stefano already gave his Reviewed-by, I dropped it due to the changes (significant)
   - update commit description
   - reuse generic IOMMU device tree bindings, select XEN_GRANT_DMA_IOMMU
     to avoid the deferred probe timeout

Changes V3 -> V4:
   - add Stefano's R-b
---
 drivers/xen/Kconfig         |  1 +
 drivers/xen/grant-dma-ops.c | 48 ++++++++++++++++++++++++++++++++++++++-------
 include/xen/xen-ops.h       |  5 +++++
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 35d20d9..bfd5f4f 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -347,6 +347,7 @@ config XEN_VIRTIO
 	bool "Xen virtio support"
 	depends on VIRTIO
 	select XEN_GRANT_DMA_OPS
+	select XEN_GRANT_DMA_IOMMU if OF
 	help
 	  Enable virtio support for running as Xen guest. Depending on the
 	  guest type this will require special support on the backend side
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 44659f4..6586152 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -55,11 +55,6 @@ static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
  * Such a DMA address is formed by using the grant reference as a frame
  * number and setting the highest address bit (this bit is for the backend
  * to be able to distinguish it from e.g. a mmio address).
- *
- * Note that for now we hard wire dom0 to be the backend domain. In order
- * to support any domain as backend we'd need to add a way to communicate
- * the domid of this backend, e.g. via Xenstore, via the PCI-device's
- * config space or DT/ACPI.
  */
 static void *xen_grant_dma_alloc(struct device *dev, size_t size,
 				 dma_addr_t *dma_handle, gfp_t gfp,
@@ -275,9 +270,26 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.dma_supported = xen_grant_dma_supported,
 };
 
+bool xen_is_grant_dma_device(struct device *dev)
+{
+	struct device_node *iommu_np;
+	bool has_iommu;
+
+	/* XXX Handle only DT devices for now */
+	if (!dev->of_node)
+		return false;
+
+	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
+	has_iommu = iommu_np && of_device_is_compatible(iommu_np, "xen,grant-dma");
+	of_node_put(iommu_np);
+
+	return has_iommu;
+}
+
 void xen_grant_setup_dma_ops(struct device *dev)
 {
 	struct xen_grant_dma_data *data;
+	struct of_phandle_args iommu_spec;
 
 	data = find_xen_grant_dma_data(dev);
 	if (data) {
@@ -285,12 +297,34 @@ void xen_grant_setup_dma_ops(struct device *dev)
 		return;
 	}
 
+	/* XXX ACPI device unsupported for now */
+	if (!dev->of_node)
+		goto err;
+
+	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
+			0, &iommu_spec)) {
+		dev_err(dev, "Cannot parse iommus property\n");
+		goto err;
+	}
+
+	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
+			iommu_spec.args_count != 1) {
+		dev_err(dev, "Incompatible IOMMU node\n");
+		of_node_put(iommu_spec.np);
+		goto err;
+	}
+
+	of_node_put(iommu_spec.np);
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		goto err;
 
-	/* XXX The dom0 is hardcoded as the backend domain for now */
-	data->backend_domid = 0;
+	/*
+	 * The endpoint ID here means the ID of the domain where the corresponding
+	 * backend is running
+	 */
+	data->backend_domid = iommu_spec.args[0];
 
 	if (xa_err(xa_store(&xen_grant_dma_devices, (unsigned long)dev, data,
 			GFP_KERNEL))) {
diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
index 4f9fad5..62be9dc 100644
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -223,10 +223,15 @@ static inline void xen_preemptible_hcall_end(void) { }
 
 #ifdef CONFIG_XEN_GRANT_DMA_OPS
 void xen_grant_setup_dma_ops(struct device *dev);
+bool xen_is_grant_dma_device(struct device *dev);
 #else
 static inline void xen_grant_setup_dma_ops(struct device *dev)
 {
 }
+static inline bool xen_is_grant_dma_device(struct device *dev)
+{
+	return false;
+}
 #endif /* CONFIG_XEN_GRANT_DMA_OPS */
 
 #endif /* INCLUDE_XEN_OPS_H */
-- 
2.7.4


