Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46755F6D3E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 19:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417202.661850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogUz2-0002iu-Pt; Thu, 06 Oct 2022 17:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417202.661850; Thu, 06 Oct 2022 17:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogUz2-0002gO-My; Thu, 06 Oct 2022 17:48:32 +0000
Received: by outflank-mailman (input) for mailman id 417202;
 Thu, 06 Oct 2022 17:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3UN=2H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ogUz1-0002gI-5s
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 17:48:31 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1663bb88-459f-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 19:48:29 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id ot12so6283166ejb.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 10:48:29 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a1709061ba900b00782cd82db09sm6083ejg.106.2022.10.06.10.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 10:48:27 -0700 (PDT)
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
X-Inumbo-ID: 1663bb88-459f-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qCbcp558dSRzPWqfkd7610ukm4C9UgSFZEwAJSe+6ac=;
        b=PlGVFo1Bs1Xp0DNjnMDiKkz3PaSM8Z2sCoJynZKxhmHnzBAuL1n/pUlp/nneWY4zgo
         Y1ZHktK50+KOuBsev48HUYbK6+zLxV+mgndjbbiMPrUEADty8TuvnUPPYS03jC/h+hka
         9D821vE5hiB9bm65E/ugB+ZXexk0FuSAwX9zxdcqMkwVjkvVgnWlheb6V+m79eCodjWf
         QfATw2zBgP9cSXL1BAX0hdkZHkvsqvTqw6ifAhniKu5d98CxiOitg8qb1Bb57U7aq+1r
         ou36BUsFr0kSGxI5bvLqudv26uqWCD0Xcf44R+H3Ao6N3rTi9R/5TAUJxW8UJwv3bxky
         kEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCbcp558dSRzPWqfkd7610ukm4C9UgSFZEwAJSe+6ac=;
        b=wyaxgLoCO2dvOeldoMRIRtnvAXNt0MdCCVwHrcrq6gd21PnFsliDfvRtEdycmjocHZ
         pPJuKsuJqLte/wVVDh7hptBLxRSO3EYcDGaQOxVU5yognszX0cIj3jWZdo+W1j18Iyi0
         d1oclg7VVyy5nR3IoP4eIQMhJz+Wd9aH5GAnATC9M7tnTP8CCXWHT5QQnkFTu9A9lTBJ
         moXydVfO8pJKpIVWo/3oXw4pg14kZLqjU1txoVwmdeZh1QotoN2kRRlvl6Y4ZH2fg+Pu
         U6MEUK1tw6XaldQc9elI4BdY7d4L7obaWh38oLR+Mvq/GQIUYXjtci3Edx4+vJYWd9kR
         CJBA==
X-Gm-Message-State: ACrzQf0PFfsZoxeQINFryEA1sfKLaWf7iUFrfWUcLhFTP4xJ7ft8qQB8
	R2LTsExXowNaklLz0TMojnFmSqQjCd8=
X-Google-Smtp-Source: AMsMyM5F06M8lOlSxwL1OrbBJ3wulHy+f3oIidmjgUWRbsgE9MfznLbymc6xLP0QaotXghpgfzmwyw==
X-Received: by 2002:a17:907:2672:b0:781:dc01:6c5a with SMTP id ci18-20020a170907267200b00781dc016c5amr883058ejc.191.1665078508746;
        Thu, 06 Oct 2022 10:48:28 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/virtio: Handle PCI devices which Host controller is described in DT
Date: Thu,  6 Oct 2022 20:48:04 +0300
Message-Id: <20221006174804.2003029-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Use the same "xen-grant-dma" device concept (based on generic IOMMU
device-tree bindings) for the PCI devices behind device-tree based
PCI Host controller.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Slightly RFC. This is needed to support Xen grant mappings for virtio-pci devices
on Arm at some point in the future. The Xen toolstack side is not published yet.
Here, for PCI devices we use the same way to pass backend domid to the guest as for
platform devices.

Depends on Juergen's series:
https://lore.kernel.org/xen-devel/20221006071500.15689-1-jgross@suse.com/
---
 drivers/xen/grant-dma-ops.c | 51 +++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index ff9be3aff87e..79d13122ec08 100644
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
@@ -273,12 +274,28 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.dma_supported = xen_grant_dma_supported,
 };
 
-static bool xen_is_dt_grant_dma_device(struct device *dev)
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
+static bool xen_is_dt_grant_dma_device(struct device_node *np)
 {
 	struct device_node *iommu_np;
 	bool has_iommu;
 
-	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
+	iommu_np = of_parse_phandle(np, "iommus", 0);
 	has_iommu = iommu_np &&
 		    of_device_is_compatible(iommu_np, "xen,grant-dma");
 	of_node_put(iommu_np);
@@ -288,9 +305,17 @@ static bool xen_is_dt_grant_dma_device(struct device *dev)
 
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
+		ret = xen_is_dt_grant_dma_device(np);
+		of_node_put(np);
+		return ret;
+	}
 
 	return false;
 }
@@ -303,20 +328,20 @@ bool xen_virtio_mem_acc(struct virtio_device *dev)
 	return xen_is_grant_dma_device(dev->dev.parent);
 }
 
-static int xen_dt_grant_setup_dma_ops(struct device *dev,
+static int xen_dt_grant_setup_dma_ops(struct device_node *np,
 				       struct xen_grant_dma_data *data)
 {
 	struct of_phandle_args iommu_spec;
 
-	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
+	if (of_parse_phandle_with_args(np, "iommus", "#iommu-cells",
 			0, &iommu_spec)) {
-		dev_err(dev, "Cannot parse iommus property\n");
+		pr_err("%s: Cannot parse iommus property\n", np->name);
 		return -ESRCH;
 	}
 
 	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
 			iommu_spec.args_count != 1) {
-		dev_err(dev, "Incompatible IOMMU node\n");
+		pr_err("%s: Incompatible IOMMU node\n", iommu_spec.np->name);
 		of_node_put(iommu_spec.np);
 		return -ESRCH;
 	}
@@ -335,6 +360,7 @@ static int xen_dt_grant_setup_dma_ops(struct device *dev,
 void xen_grant_setup_dma_ops(struct device *dev)
 {
 	struct xen_grant_dma_data *data;
+	struct device_node *np;
 
 	data = find_xen_grant_dma_data(dev);
 	if (data) {
@@ -346,8 +372,13 @@ void xen_grant_setup_dma_ops(struct device *dev)
 	if (!data)
 		goto err;
 
-	if (dev->of_node) {
-		if (xen_dt_grant_setup_dma_ops(dev, data))
+	np = xen_dt_get_node(dev);
+	if (np) {
+		int ret;
+
+		ret = xen_dt_grant_setup_dma_ops(np, data);
+		of_node_put(np);
+		if (ret)
 			goto err;
 	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)) {
 		dev_info(dev, "Using dom0 as backend\n");
-- 
2.25.1


