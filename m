Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB960D17F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 18:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429991.681417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMf2-00028n-6z; Tue, 25 Oct 2022 16:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429991.681417; Tue, 25 Oct 2022 16:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMf2-0001zi-1D; Tue, 25 Oct 2022 16:20:16 +0000
Received: by outflank-mailman (input) for mailman id 429991;
 Tue, 25 Oct 2022 16:20:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WBn=22=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1onMf0-0001rM-6V
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 16:20:14 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7435efd-5480-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 18:20:13 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id bn35so8968089ljb.5
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 09:20:13 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a2eb550000000b002770302bdffsm540136ljn.105.2022.10.25.09.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:20:11 -0700 (PDT)
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
X-Inumbo-ID: e7435efd-5480-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPiIK7IlsJ7E5VINPN3ej70LIynHg49PxYxMULv6O+g=;
        b=Mcz2WFP8uCN+2nT+Y2LCXeXAkKPmjH58QmfnmrZDOcN5K+WTU1Mcmjc/sFiQ90Bg/t
         iXNEQCCA+E/XCB83vWVHG0V6MPAib92POhRWkYfk5ka1gkSSEt+bQpjEWq/8lbYkIU47
         Qs6eTgoLMfjLQlEgA0MhoYBOoKGLl1E/5LpfAyhxMTJBUIZSjejfGvCjir8IMkmKJ0Kp
         hMc/y55iOxg9vqAcs2CTMCZNI+Vxr0Pwzx00U42fhwCvw8zAFp4qDdkLj+YdFzQCuhQp
         mbrxa+MAlZEHS/+kprmjC+KVPUcTjOvZTzB2rAWsHtjgStKg5yumkz3HxKOEOf2ahil3
         Yy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPiIK7IlsJ7E5VINPN3ej70LIynHg49PxYxMULv6O+g=;
        b=OV/kwUaeNWj+fOf9jTrHyQC8LanWvG0CM+gXb0NU2WZ+cbcssYjXGuLMgpE6/bDJJs
         pgBoeewYeOnmg1vgn6Vq/lbEIF0yoOQuVHfyYWa29e7eEy6Wl8ybQt3QGICDokOFO8v4
         O5qIMnKVFgk0Ej7voJpNzPho+gg7tHCejEgkGPyC15wUyfABbhcUmssL7MAY7RCUYT/g
         0FpfsHNvazkCLBgmLKoH6o/pKiL7BYN81+TCJtU2QYHzkEr88VXGW31hxKRxLyLwwP58
         eknWsd9mWDL8dmAqpPxmmNZknDKRxRvf5ovv4EaJAK2AA7bK//i7d1o1GpieJV2bpf2n
         CZDQ==
X-Gm-Message-State: ACrzQf1hUvuCBYCekm+HLWuLWmO6sbVyZcgf7/sa6lcg8NbPv2a537e6
	21bVxFrluW5Igty7V9oLLEOHFui8KNE=
X-Google-Smtp-Source: AMsMyM62fltFfmb8eUA4lFmsFonT3s3D9baIIhB+ZUg06Ktu/2pzGx7vkhjbjBeMjDCfkQWNML2TEg==
X-Received: by 2002:a05:651c:33c:b0:277:e2b:de4a with SMTP id b28-20020a05651c033c00b002770e2bde4amr3738346ljp.55.1666714812379;
        Tue, 25 Oct 2022 09:20:12 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH V4 2/2] xen/virtio: Handle PCI devices which Host controller is described in DT
Date: Tue, 25 Oct 2022 19:20:04 +0300
Message-Id: <20221025162004.8501-3-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025162004.8501-1-olekstysh@gmail.com>
References: <20221025162004.8501-1-olekstysh@gmail.com>
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
the amount of checks pass an extra struct device_node *np to
xen_dt_grant_init_backend_domid().

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

Changes V3 -> V4:
   - just rebase on new prereq patch
     "xen/virtio: Optimize the setup of "xen-grant-dma" devices"

Previous discussion is at:
https://lore.kernel.org/xen-devel/20221006174804.2003029-1-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/20221015153409.918775-1-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/20221021172408.77397-1-olekstysh@gmail.com/

Based on:
https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=for-linus-6.1
---
---
 drivers/xen/grant-dma-ops.c | 46 +++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 1e797a043980..9784a77fa3c9 100644
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
@@ -292,15 +293,43 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.dma_supported = xen_grant_dma_supported,
 };
 
+static struct device_node *xen_dt_get_node(struct device *dev)
+{
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
 static int xen_dt_grant_init_backend_domid(struct device *dev,
+					   struct device_node *np,
 					   domid_t *backend_domid)
 {
-	struct of_phandle_args iommu_spec;
+	struct of_phandle_args iommu_spec = { .args_count = 1 };
 
-	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
-			0, &iommu_spec)) {
-		dev_dbg(dev, "Cannot parse iommus property\n");
-		return -ESRCH;
+	if (dev_is_pci(dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
+
+		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
+				iommu_spec.args)) {
+			dev_dbg(dev, "Cannot translate ID\n");
+			return -ESRCH;
+		}
+	} else {
+		if (of_parse_phandle_with_args(np, "iommus", "#iommu-cells",
+				0, &iommu_spec)) {
+			dev_dbg(dev, "Cannot parse iommus property\n");
+			return -ESRCH;
+		}
 	}
 
 	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
@@ -324,10 +353,13 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 static int xen_grant_init_backend_domid(struct device *dev,
 					domid_t *backend_domid)
 {
+	struct device_node *np;
 	int ret = -ENODEV;
 
-	if (dev->of_node) {
-		ret = xen_dt_grant_init_backend_domid(dev, backend_domid);
+	np = xen_dt_get_node(dev);
+	if (np) {
+		ret = xen_dt_grant_init_backend_domid(dev, np, backend_domid);
+		of_node_put(np);
 	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain()) {
 		dev_info(dev, "Using dom0 as backend\n");
 		*backend_domid = 0;
-- 
2.25.1


