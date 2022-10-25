Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A729860D17D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 18:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429990.681410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMf1-0001zb-PG; Tue, 25 Oct 2022 16:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429990.681410; Tue, 25 Oct 2022 16:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMf1-0001vs-JH; Tue, 25 Oct 2022 16:20:15 +0000
Received: by outflank-mailman (input) for mailman id 429990;
 Tue, 25 Oct 2022 16:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WBn=22=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1onMez-0001rM-D1
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 16:20:13 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e685419e-5480-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 18:20:11 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id j16so3396894lfe.12
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 09:20:11 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a2eb550000000b002770302bdffsm540136ljn.105.2022.10.25.09.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:20:10 -0700 (PDT)
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
X-Inumbo-ID: e685419e-5480-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UV2oUhVEfu6LblayNLcdu/AQ1PbbiXWA9+mIDyTGomE=;
        b=jHP8bromagJtShAR4OXQqOiiJnYOMZ99PKWZmleaWTvbqPcpz+1WleJuAYpfL7lg2D
         I6Qaq/wQzFvNdBhh5APfDP0dBEMs9x9bSepGL4BZxmDiKWc5lcm8z3EQV65vVVayn0+8
         eYL9t7oKfgH94k2clhjYAywHHF36WGOQy5Iu6BFyV//AMTlyEjF+bSTCVbTV9FHTFPjO
         lqhAEbSWveWcXPsD08vtJi9A/YilEMzV0lx/zp6Yu7wh5+vA0nGuC/8wGquRG/5J4vby
         1gSkgUzUP5Qj2w+8mVKNvowFNLA+aBXoBtFAtG3qAUkgv0b++3IOaYgwC25AgKLHpNB1
         W/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UV2oUhVEfu6LblayNLcdu/AQ1PbbiXWA9+mIDyTGomE=;
        b=Yfdc2TVcKlWId91w8GxeRjn9e1SzwUAr0Jjl/mkVIjw+j/PVgb5H4UKzvzqzYa+Utv
         ukhB2LmK/V1cQAQ6iIU6hxLq6HSP7nG4Pjz8oyeotWSiDhYH18SA3qiuRoYd6YM/PoXE
         S53o+e6v6BgL/kgv0L9GpmvJRF9MXWft7I7vnHp03+87kzGZu3aDgB8JmzXSIysWwKue
         Wz9uJWXv/zfg451Efp5Wu6PVTCP3BFPyKXzGQ7scrLIQyfs7RWgihfLBbfrbjsPDieT2
         CgPWtqkkKlpazNKi70pFUnygg8lfvhLRkyD5kmQPJ4LwTc4Bm+TXipq5jfQH7h44XlQQ
         Fi7Q==
X-Gm-Message-State: ACrzQf2Io71zMAmii4ocktpBVoR9gZ3TBaFoP0d5FQP8jdcWln5VVkFE
	U13v+QRSNCDNqlnVGCz4goDYipsj9q8=
X-Google-Smtp-Source: AMsMyM7vTkKKKxpLC2kahjXumjJuMQ9qspfZXCsmk6MxMMlz27MpanKsalOSPJ4gBzGwfkX8DmkhEg==
X-Received: by 2002:a19:3857:0:b0:4ac:eca1:9275 with SMTP id d23-20020a193857000000b004aceca19275mr2862744lfj.97.1666714810866;
        Tue, 25 Oct 2022 09:20:10 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH V4 1/2] xen/virtio: Optimize the setup of "xen-grant-dma" devices
Date: Tue, 25 Oct 2022 19:20:03 +0300
Message-Id: <20221025162004.8501-2-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025162004.8501-1-olekstysh@gmail.com>
References: <20221025162004.8501-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is needed to avoid having to parse the same device-tree
several times for a given device.

For this to work we need to install the xen_virtio_restricted_mem_acc
callback in Arm's xen_guest_init() which is same callback as x86's
PV and HVM modes already use and remove the manual assignment in
xen_setup_dma_ops(). Also we need to split the code to initialize
backend_domid into a separate function.

Prior to current patch we parsed the device-tree three times:
1. xen_setup_dma_ops()->...->xen_is_dt_grant_dma_device()
2. xen_setup_dma_ops()->...->xen_dt_grant_init_backend_domid()
3. xen_virtio_mem_acc()->...->xen_is_dt_grant_dma_device()

With current patch we parse the device-tree only once in
xen_virtio_restricted_mem_acc()->...->xen_dt_grant_init_backend_domid()

Other benefits are:
- Not diverge from x86 when setting up Xen grant DMA ops
- Drop several global functions

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
New patch
---
 arch/arm/xen/enlighten.c    |  2 +-
 drivers/xen/grant-dma-ops.c | 77 ++++++++++++++-----------------------
 include/xen/arm/xen-ops.h   |  4 +-
 include/xen/xen-ops.h       | 16 --------
 4 files changed, 30 insertions(+), 69 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 93c8ccbf2982..7d59765aef22 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -445,7 +445,7 @@ static int __init xen_guest_init(void)
 		return 0;
 
 	if (IS_ENABLED(CONFIG_XEN_VIRTIO))
-		virtio_set_mem_acc_cb(xen_virtio_mem_acc);
+		virtio_set_mem_acc_cb(xen_virtio_restricted_mem_acc);
 
 	if (!acpi_disabled)
 		xen_acpi_guest_init();
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index daa525df7bdc..1e797a043980 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -292,50 +292,20 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.dma_supported = xen_grant_dma_supported,
 };
 
-static bool xen_is_dt_grant_dma_device(struct device *dev)
-{
-	struct device_node *iommu_np;
-	bool has_iommu;
-
-	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
-	has_iommu = iommu_np &&
-		    of_device_is_compatible(iommu_np, "xen,grant-dma");
-	of_node_put(iommu_np);
-
-	return has_iommu;
-}
-
-bool xen_is_grant_dma_device(struct device *dev)
-{
-	/* XXX Handle only DT devices for now */
-	if (dev->of_node)
-		return xen_is_dt_grant_dma_device(dev);
-
-	return false;
-}
-
-bool xen_virtio_mem_acc(struct virtio_device *dev)
-{
-	if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain())
-		return true;
-
-	return xen_is_grant_dma_device(dev->dev.parent);
-}
-
 static int xen_dt_grant_init_backend_domid(struct device *dev,
-					   struct xen_grant_dma_data *data)
+					   domid_t *backend_domid)
 {
 	struct of_phandle_args iommu_spec;
 
 	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
 			0, &iommu_spec)) {
-		dev_err(dev, "Cannot parse iommus property\n");
+		dev_dbg(dev, "Cannot parse iommus property\n");
 		return -ESRCH;
 	}
 
 	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
 			iommu_spec.args_count != 1) {
-		dev_err(dev, "Incompatible IOMMU node\n");
+		dev_dbg(dev, "Incompatible IOMMU node\n");
 		of_node_put(iommu_spec.np);
 		return -ESRCH;
 	}
@@ -346,12 +316,28 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 	 * The endpoint ID here means the ID of the domain where the
 	 * corresponding backend is running
 	 */
-	data->backend_domid = iommu_spec.args[0];
+	*backend_domid = iommu_spec.args[0];
 
 	return 0;
 }
 
-void xen_grant_setup_dma_ops(struct device *dev)
+static int xen_grant_init_backend_domid(struct device *dev,
+					domid_t *backend_domid)
+{
+	int ret = -ENODEV;
+
+	if (dev->of_node) {
+		ret = xen_dt_grant_init_backend_domid(dev, backend_domid);
+	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain()) {
+		dev_info(dev, "Using dom0 as backend\n");
+		*backend_domid = 0;
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static void xen_grant_setup_dma_ops(struct device *dev, domid_t backend_domid)
 {
 	struct xen_grant_dma_data *data;
 
@@ -365,16 +351,7 @@ void xen_grant_setup_dma_ops(struct device *dev)
 	if (!data)
 		goto err;
 
-	if (dev->of_node) {
-		if (xen_dt_grant_init_backend_domid(dev, data))
-			goto err;
-	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)) {
-		dev_info(dev, "Using dom0 as backend\n");
-		data->backend_domid = 0;
-	} else {
-		/* XXX ACPI device unsupported for now */
-		goto err;
-	}
+	data->backend_domid = backend_domid;
 
 	if (store_xen_grant_dma_data(dev, data)) {
 		dev_err(dev, "Cannot store Xen grant DMA data\n");
@@ -392,12 +369,14 @@ void xen_grant_setup_dma_ops(struct device *dev)
 
 bool xen_virtio_restricted_mem_acc(struct virtio_device *dev)
 {
-	bool ret = xen_virtio_mem_acc(dev);
+	domid_t backend_domid;
 
-	if (ret)
-		xen_grant_setup_dma_ops(dev->dev.parent);
+	if (!xen_grant_init_backend_domid(dev->dev.parent, &backend_domid)) {
+		xen_grant_setup_dma_ops(dev->dev.parent, backend_domid);
+		return true;
+	}
 
-	return ret;
+	return false;
 }
 
 MODULE_DESCRIPTION("Xen grant DMA-mapping layer");
diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
index b0766a660338..70073f5a2b54 100644
--- a/include/xen/arm/xen-ops.h
+++ b/include/xen/arm/xen-ops.h
@@ -8,9 +8,7 @@
 static inline void xen_setup_dma_ops(struct device *dev)
 {
 #ifdef CONFIG_XEN
-	if (xen_is_grant_dma_device(dev))
-		xen_grant_setup_dma_ops(dev);
-	else if (xen_swiotlb_detect())
+	if (xen_swiotlb_detect())
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
index a34f4271a2e9..47f11bec5e90 100644
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -216,26 +216,10 @@ static inline void xen_preemptible_hcall_end(void) { }
 #endif /* CONFIG_XEN_PV && !CONFIG_PREEMPTION */
 
 #ifdef CONFIG_XEN_GRANT_DMA_OPS
-void xen_grant_setup_dma_ops(struct device *dev);
-bool xen_is_grant_dma_device(struct device *dev);
-bool xen_virtio_mem_acc(struct virtio_device *dev);
 bool xen_virtio_restricted_mem_acc(struct virtio_device *dev);
 #else
-static inline void xen_grant_setup_dma_ops(struct device *dev)
-{
-}
-static inline bool xen_is_grant_dma_device(struct device *dev)
-{
-	return false;
-}
-
 struct virtio_device;
 
-static inline bool xen_virtio_mem_acc(struct virtio_device *dev)
-{
-	return false;
-}
-
 static inline bool xen_virtio_restricted_mem_acc(struct virtio_device *dev)
 {
 	return false;
-- 
2.25.1


