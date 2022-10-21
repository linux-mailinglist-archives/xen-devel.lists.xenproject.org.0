Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0410607D73
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 19:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427915.677530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvkl-0001vu-UP; Fri, 21 Oct 2022 17:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427915.677530; Fri, 21 Oct 2022 17:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvkl-0001sm-RG; Fri, 21 Oct 2022 17:24:15 +0000
Received: by outflank-mailman (input) for mailman id 427915;
 Fri, 21 Oct 2022 17:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRa2=2W=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1olvkl-0001se-4a
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 17:24:15 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ede1399-5165-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 19:24:14 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id w18so6024283wro.7
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 10:24:14 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6e82000000b0022ccae2fa62sm19434778wrz.22.2022.10.21.10.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 10:24:12 -0700 (PDT)
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
X-Inumbo-ID: 2ede1399-5165-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUDQoD3HFruzS+T2pXmbko4NFchZqtcIPSOZUX4d550=;
        b=ITMQlOUOpKIaUb753f69rhurvrbbWWrVSvFktbbmPh7tmWLRF3eR/90Ui4xQ3sf6lg
         T3UjNTi4gbpv3zs0ziHMJJeyBWb9EX3bXKB51VtEwdWQDA21roxTplZ1zU5VylENRoGv
         WXiq7x9aKTkqpEvuhsK82qZb0LuoD0/ge38Sm1QQd4hX7zYe7oShFlwyjTGEP07ZAaiK
         /n5U6w2CZ7/qShG4kFFFTgiBGK+2BRJfn94qsmg84ASr97i1cuY+0llqZmRwQ+skjjfk
         bIZGPME2oS53l46ziNYQ8BsuWyX9mzAALAb2X99LkS0ku++bKL0cZptXG+deegNOQWr6
         oXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUDQoD3HFruzS+T2pXmbko4NFchZqtcIPSOZUX4d550=;
        b=vZFeywvpT2I0k0liTmfQLaZCQnXbbJEJSll0JCEJONXXJ8BA9J7DfuzWX76O2pV3oP
         6+P0IS2PIbAtf9RwYfUW02x/gnEK3WkTstYGllP+8xOXRLZ2Itztk8sxZ3pZwg+yYLKO
         FfxsopLoIOejirRCXCWKWpzor2cFOIZPMnCC2BPJPnEZ0JQryc+OYVVBQQovuuoKmgAe
         ilX+qbEbYh4CRWesbjWgAG/dmZbbgzCO12zQ2YsbifUqGJlbu/recs1rvHkmX/oCgShO
         QtdN1cDLR6gRx0c5t7n4c9aEvhLwlRUUYAh4me/l6MVBqF7+V4HR39vzaeIO7KfsA+X9
         1QPw==
X-Gm-Message-State: ACrzQf2QtmnQsSRooxR2FPJsq+SdyEy5icl2BF3c3ZF2OTy1pj/pSscd
	29vxAa/lLanOi0qvmLcr18iZXgD043U=
X-Google-Smtp-Source: AMsMyM7cpK0FOcQrHC09rUmFCtFtUK6wzLIOLlA1V3/FyhaQt9J57gGebYe6YylFQ+DmvNp+rMG5eg==
X-Received: by 2002:adf:cf06:0:b0:236:4c12:47a7 with SMTP id o6-20020adfcf06000000b002364c1247a7mr4878514wrj.543.1666373052898;
        Fri, 21 Oct 2022 10:24:12 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH V3] xen/virtio: Handle PCI devices which Host controller is described in DT
Date: Fri, 21 Oct 2022 20:24:08 +0300
Message-Id: <20221021172408.77397-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Use the same "xen-grant-dma" device concept for the PCI devices
behind device-tree based PCI Host controller, but with one modification.
Unlike for platform devices, we cannot use generic IOMMU bindings
(iommus property), as we need to support more flexible configuration.
The problem is that PCI devices under the single PCI Host controller
may have the backends running in different Xen domains and thus have
different endpoints ID (backend domains ID).

Add ability to deal with generic PCI-IOMMU bindings (iommu-map/
iommu-map-mask properties) which allows us to describe relationship
between PCI devices and backend domains ID properly.

To avoid having to look up for the PCI Host bridge twice and reduce
the amount of checks pass an extra struct device_node *np to both
xen_dt_grant_init_backend_domid() and xen_is_dt_grant_dma_device().
While at it also pass domid_t *backend_domid instead of
struct xen_grant_dma_data *data to the former.

So with current patch the code expects iommus property for the platform
devices and iommu-map/iommu-map-mask properties for PCI devices.

The example of generated by the toolstack iommu-map property
for two PCI devices 0000:00:01.0 and 0000:00:02.0 whose
backends are running in different Xen domains with IDs 1 and 2
respectively:
iommu-map = <0x08 0xfde9 0x01 0x08 0x10 0xfde9 0x02 0x08>;

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Slightly RFC. This is needed to support Xen grant mappings for virtio-pci devices
on Arm at some point in the future. The Xen toolstack side is not completely ready yet.
Here, for PCI devices we use more flexible way to pass backend domid to the guest
than for platform devices.

Changes V1 -> V2:
   - update commit description
   - rebase
   - rework to use generic PCI-IOMMU bindings instead of generic IOMMU bindings

Changes V2 -> V3:
   - update commit description, add an example
   - drop xen_dt_map_id() and squash xen_dt_get_pci_host_node() with
     xen_dt_get_node()
   - pass struct device_node *np to xen_is_dt_grant_dma_device() and
     xen_dt_grant_init_backend_domid()
   - pass domid_t *backend_domid instead of struct xen_grant_dma_data *data
     to xen_dt_grant_init_backend_domid()

Previous discussion is at:
https://lore.kernel.org/xen-devel/20221006174804.2003029-1-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/20221015153409.918775-1-olekstysh@gmail.com/

Based on:
https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=for-linus-6.1
---
 drivers/xen/grant-dma-ops.c | 80 ++++++++++++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 14 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index daa525df7bdc..76b29d20aeee 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/dma-map-ops.h>
 #include <linux/of.h>
+#include <linux/pci.h>
 #include <linux/pfn.h>
 #include <linux/xarray.h>
 #include <linux/virtio_anchor.h>
@@ -292,12 +293,37 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.dma_supported = xen_grant_dma_supported,
 };
 
-static bool xen_is_dt_grant_dma_device(struct device *dev)
+static struct device_node *xen_dt_get_node(struct device *dev)
 {
-	struct device_node *iommu_np;
+	if (dev_is_pci(dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+		struct pci_bus *bus = pdev->bus;
+
+		/* Walk up to the root bus to look for PCI Host controller */
+		while (!pci_is_root_bus(bus))
+			bus = bus->parent;
+
+		return of_node_get(bus->bridge->parent->of_node);
+	}
+
+	return of_node_get(dev->of_node);
+}
+
+static bool xen_is_dt_grant_dma_device(struct device *dev,
+					struct device_node *np)
+{
+	struct device_node *iommu_np = NULL;
 	bool has_iommu;
 
-	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
+	if (dev_is_pci(dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
+
+		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_np, NULL))
+			return false;
+	} else
+		iommu_np = of_parse_phandle(np, "iommus", 0);
+
 	has_iommu = iommu_np &&
 		    of_device_is_compatible(iommu_np, "xen,grant-dma");
 	of_node_put(iommu_np);
@@ -307,9 +333,17 @@ static bool xen_is_dt_grant_dma_device(struct device *dev)
 
 bool xen_is_grant_dma_device(struct device *dev)
 {
+	struct device_node *np;
+
 	/* XXX Handle only DT devices for now */
-	if (dev->of_node)
-		return xen_is_dt_grant_dma_device(dev);
+	np = xen_dt_get_node(dev);
+	if (np) {
+		bool ret;
+
+		ret = xen_is_dt_grant_dma_device(dev, np);
+		of_node_put(np);
+		return ret;
+	}
 
 	return false;
 }
@@ -323,14 +357,26 @@ bool xen_virtio_mem_acc(struct virtio_device *dev)
 }
 
 static int xen_dt_grant_init_backend_domid(struct device *dev,
-					   struct xen_grant_dma_data *data)
+					   struct device_node *np,
+					   domid_t *backend_domid)
 {
-	struct of_phandle_args iommu_spec;
+	struct of_phandle_args iommu_spec = { .args_count = 1 };
 
-	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
-			0, &iommu_spec)) {
-		dev_err(dev, "Cannot parse iommus property\n");
-		return -ESRCH;
+	if (dev_is_pci(dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
+
+		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
+				iommu_spec.args)) {
+			dev_err(dev, "Cannot translate ID\n");
+			return -ESRCH;
+		}
+	} else {
+		if (of_parse_phandle_with_args(np, "iommus", "#iommu-cells",
+				0, &iommu_spec)) {
+			dev_err(dev, "Cannot parse iommus property\n");
+			return -ESRCH;
+		}
 	}
 
 	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
@@ -346,7 +392,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 	 * The endpoint ID here means the ID of the domain where the
 	 * corresponding backend is running
 	 */
-	data->backend_domid = iommu_spec.args[0];
+	*backend_domid = iommu_spec.args[0];
 
 	return 0;
 }
@@ -354,6 +400,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 void xen_grant_setup_dma_ops(struct device *dev)
 {
 	struct xen_grant_dma_data *data;
+	struct device_node *np;
 
 	data = find_xen_grant_dma_data(dev);
 	if (data) {
@@ -365,8 +412,13 @@ void xen_grant_setup_dma_ops(struct device *dev)
 	if (!data)
 		goto err;
 
-	if (dev->of_node) {
-		if (xen_dt_grant_init_backend_domid(dev, data))
+	np = xen_dt_get_node(dev);
+	if (np) {
+		int ret;
+
+		ret = xen_dt_grant_init_backend_domid(dev, np, &data->backend_domid);
+		of_node_put(np);
+		if (ret)
 			goto err;
 	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)) {
 		dev_info(dev, "Using dom0 as backend\n");
-- 
2.25.1


