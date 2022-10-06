Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22955F6187
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 09:15:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416626.661277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogL67-0004Kq-KW; Thu, 06 Oct 2022 07:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416626.661277; Thu, 06 Oct 2022 07:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogL67-0004Hy-GQ; Thu, 06 Oct 2022 07:15:11 +0000
Received: by outflank-mailman (input) for mailman id 416626;
 Thu, 06 Oct 2022 07:15:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogL65-00041m-N8
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 07:15:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c1a63a5-4546-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 09:15:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3F671F8B4;
 Thu,  6 Oct 2022 07:15:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7644B1376E;
 Thu,  6 Oct 2022 07:15:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rbaVG3yAPmM2EwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Oct 2022 07:15:08 +0000
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
X-Inumbo-ID: 9c1a63a5-4546-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665040508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blGlAxVjw5/6eJY5lj12Ctgxq+MWh1jybNrPJW65ItI=;
	b=hEHbAXRF22OPAX4YwHMgYgKd+iQAS3wV7mC+JrG0P8AVlfkPo0WePQjoqPsc5Nl7tiSieZ
	WxEBs9ooEwZN9U51qi3U3mm7BkCip8gDxHEeKdnfEEpPnI3MR8OhF9HS2HnYCz0uyTHvm4
	Oh+J6mcwl3G1+irYY+RAILlGW50XPss=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] xen/virtio: restructure xen grant dma setup
Date: Thu,  6 Oct 2022 09:14:58 +0200
Message-Id: <20221006071500.15689-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221006071500.15689-1-jgross@suse.com>
References: <20221006071500.15689-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare supporting other means than device tree for
setting up virtio devices under Xen, restructure the functions
xen_is_grant_dma_device() and xen_grant_setup_dma_ops() a little bit.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/grant-dma-ops.c | 68 +++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 25 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 8973fc1e9ccc..f29759d5301f 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -273,22 +273,28 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.dma_supported = xen_grant_dma_supported,
 };
 
-bool xen_is_grant_dma_device(struct device *dev)
+static bool xen_is_dt_grant_dma_device(struct device *dev)
 {
 	struct device_node *iommu_np;
 	bool has_iommu;
 
-	/* XXX Handle only DT devices for now */
-	if (!dev->of_node)
-		return false;
-
 	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
-	has_iommu = iommu_np && of_device_is_compatible(iommu_np, "xen,grant-dma");
+	has_iommu = iommu_np &&
+		    of_device_is_compatible(iommu_np, "xen,grant-dma");
 	of_node_put(iommu_np);
 
 	return has_iommu;
 }
 
+bool xen_is_grant_dma_device(struct device *dev)
+{
+	/* XXX Handle only DT devices for now */
+	if (dev->of_node)
+		return xen_is_dt_grant_dma_device(dev);
+
+	return false;
+}
+
 bool xen_virtio_mem_acc(struct virtio_device *dev)
 {
 	if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT))
@@ -297,45 +303,56 @@ bool xen_virtio_mem_acc(struct virtio_device *dev)
 	return xen_is_grant_dma_device(dev->dev.parent);
 }
 
-void xen_grant_setup_dma_ops(struct device *dev)
+static int xen_dt_grant_setup_dma_ops(struct device *dev,
+				       struct xen_grant_dma_data *data)
 {
-	struct xen_grant_dma_data *data;
 	struct of_phandle_args iommu_spec;
 
-	data = find_xen_grant_dma_data(dev);
-	if (data) {
-		dev_err(dev, "Xen grant DMA data is already created\n");
-		return;
-	}
-
-	/* XXX ACPI device unsupported for now */
-	if (!dev->of_node)
-		goto err;
-
 	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
 			0, &iommu_spec)) {
 		dev_err(dev, "Cannot parse iommus property\n");
-		goto err;
+		return -ESRCH;
 	}
 
 	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
 			iommu_spec.args_count != 1) {
 		dev_err(dev, "Incompatible IOMMU node\n");
 		of_node_put(iommu_spec.np);
-		goto err;
+		return -ESRCH;
 	}
 
 	of_node_put(iommu_spec.np);
 
+	/*
+	 * The endpoint ID here means the ID of the domain where the
+	 * corresponding backend is running
+	 */
+	data->backend_domid = iommu_spec.args[0];
+
+	return 0;
+}
+
+void xen_grant_setup_dma_ops(struct device *dev)
+{
+	struct xen_grant_dma_data *data;
+
+	data = find_xen_grant_dma_data(dev);
+	if (data) {
+		dev_err(dev, "Xen grant DMA data is already created\n");
+		return;
+	}
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		goto err;
 
-	/*
-	 * The endpoint ID here means the ID of the domain where the corresponding
-	 * backend is running
-	 */
-	data->backend_domid = iommu_spec.args[0];
+	if (dev->of_node) {
+		if (xen_dt_grant_setup_dma_ops(dev, data))
+			goto err;
+	} else {
+		/* XXX ACPI device unsupported for now */
+		goto err;
+	}
 
 	if (xa_err(xa_store(&xen_grant_dma_devices, (unsigned long)dev, data,
 			GFP_KERNEL))) {
@@ -348,6 +365,7 @@ void xen_grant_setup_dma_ops(struct device *dev)
 	return;
 
 err:
+	devm_kfree(dev, data);
 	dev_err(dev, "Cannot set up Xen grant DMA ops, retain platform DMA ops\n");
 }
 
-- 
2.35.3


