Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E09C6538869
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 23:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338750.563627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmVB-0000hK-EW; Mon, 30 May 2022 21:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338750.563627; Mon, 30 May 2022 21:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmVB-0000c0-8O; Mon, 30 May 2022 21:00:37 +0000
Received: by outflank-mailman (input) for mailman id 338750;
 Mon, 30 May 2022 21:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxv1=WG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nvmV8-0007Ks-Sa
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 21:00:35 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c2e20ae-e05b-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 23:00:34 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id q1so12744266ljb.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 14:00:34 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a2ea275000000b0025550e2693asm581541ljm.38.2022.05.30.14.00.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 May 2022 14:00:33 -0700 (PDT)
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
X-Inumbo-ID: 8c2e20ae-e05b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uQ1JH7AWAJHsRRYFQY27acyYSyJWPZ/cZSwuKE03m9M=;
        b=F3Dp/1RfYd/CNOWtpufTjQ5KG1C/SjG2GTXBdmAnmkIZmIISp6swxVs8EtEn+CBphf
         bJoFFuN+PnP5FTSwKK7r/G8qOeglHY3GL5o10B5kKyNI3lbYT2QRFbJMxi4Am+JQI3ZN
         ehlzziC+FS40xWH5CO/plPfSgnEkPRbzN/ZpEuxVsyac3aY0NmGhhav6DE7ZZk3YYLiZ
         NIBnVA7VpoQLIsLbKcRgByxkCjJh6t4jRaz3uUTAJF0JG+Zo5N5/KlXzqzM6ILBj7ile
         v0bUG3G8bfZR3IgtGMst1ql3DwP8EUrB62vK7C0on5gaI+gMR/yHkjGBuGFC74oT++mK
         ISEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uQ1JH7AWAJHsRRYFQY27acyYSyJWPZ/cZSwuKE03m9M=;
        b=NIcxBWdKKSECCFXSQTFd4gjYbWy+sMfBVSdTw/tzcrjWHqMf4BJPwdM2GW5hF+c3nl
         ffr7tse8JcNGebrxKF0ikt83oYe0IcOIdgHE4GrqkJvvlHeJOeAL8KFGvWsSteFMLPsp
         GLy81hW3ZRavb1vghqtdznneVwqIQRBaeBz6V9kto/zTnWRg5OMIKc1xhz3Oais2yqTi
         b4tZ2jbOZ7ZhKzs9cdVi5Mjac0RaG7LKx5t0E88ZOU0xXlfbDs7epaXcHPuY1KDgW8KS
         uFFpuTzOjD+/r6TOjg6Qj0R5q2FuJBzpKvhLZb28ClG/ZugGQ+0imyo01GtCSA08kOkI
         NxAg==
X-Gm-Message-State: AOAM5325QvQmbUvE6mLvt+NgFOPWhlkM12621ih+NuxDTy0Ad0ht1ds9
	Pj8SO/n0cjU2/J1am4zcqOiANTKrR0U=
X-Google-Smtp-Source: ABdhPJwO1sx6nXB3yQvX6BxgfoZrQPM9WyfnZcUaKJhUw7Qhdh1gVI5p09PHodbZD/CPwbZDBCk3cg==
X-Received: by 2002:a2e:b88d:0:b0:253:ee2a:6b70 with SMTP id r13-20020a2eb88d000000b00253ee2a6b70mr22917522ljp.247.1653944433394;
        Mon, 30 May 2022 14:00:33 -0700 (PDT)
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
Subject: [PATCH V3 7/8] xen/grant-dma-ops: Retrieve the ID of backend's domain for DT devices
Date: Tue, 31 May 2022 00:00:16 +0300
Message-Id: <1653944417-17168-8-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>
References: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>

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


