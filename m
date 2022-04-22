Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010BA50BD98
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 18:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311117.528196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwVE-0007RI-ND; Fri, 22 Apr 2022 16:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311117.528196; Fri, 22 Apr 2022 16:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwVE-0007Lx-DA; Fri, 22 Apr 2022 16:51:28 +0000
Received: by outflank-mailman (input) for mailman id 311117;
 Fri, 22 Apr 2022 16:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyV/=VA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nhwVC-0006Cr-Q8
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 16:51:26 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72be5f01-c25c-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 18:51:26 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id p12so9739958lfs.5
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 09:51:26 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056512310200b0046e2f507a3asm279742lfb.167.2022.04.22.09.51.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Apr 2022 09:51:24 -0700 (PDT)
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
X-Inumbo-ID: 72be5f01-c25c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KhuPWU8Ck/Zqwd8QYGNbplUi9vy17AnQZagSCJ37QGk=;
        b=NOb0zaTNkpTy3DsQIPg0dlh0OMrNEZEmtlKznw8XqFpcusEUdvVM6zMbTVNhxDwSXb
         9s37u6+satXYoHdp9aa7oR59besAWm0FyfFiy6XEjvSmmpgqVORyHmPjGB9ycHQDJJWY
         NhBHK5PmSgHWKDXsrY1o7I3msHW/lE2r8fRLPkm+huQTPVs0JPTel+isPlp+aKY9PECA
         TgXI2IbEGgOzT7qwLsqu/TyulQid0mXcPa7j9ZtTDusbzC4o3xYvxYVruqLq6WimAnlD
         NuIvwpd8kt/kRI2bBQnCc3VInK9vHaSdv0v4tgUnpJpgPie2NhI61zNXsHV+nBAVrH8s
         y7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KhuPWU8Ck/Zqwd8QYGNbplUi9vy17AnQZagSCJ37QGk=;
        b=boxFOPn6jT4Z0iPbjzj4SyZ5wa9eEGiboe3nTVjHT7KhAGNeocc8CPHEw+1HVHrCgq
         sgq84vgiY3QUAQysbF3o1Hs59TJwoFsqRjtAwlPDX0AmwGYxfqSeBc3bXMPYyZiNOV5t
         5jFo+Nqsamr/RpXNNVJu9Z8Eo+s2MkYOBp3caxEOgnU1gpH4j8nGmhrrVUPnQPucVgci
         r9XDbXGxLXkhuw+x71Cmkz58HGz6bGQ0IAylHMlvIjK0tdtyomnsLj9y8eJeXAaWIxZ0
         X8UPdHmw3XWtfz+udbpKmjG89AODCck1Mo2UwyRu6i2FLIglYy/bXi8C4CBb7azl47aQ
         9NFg==
X-Gm-Message-State: AOAM5332ctY2ed7ZQm03Cv7k9AkWEGP8S2aw7/IKOyCnoLKSDahB77q/
	jtLyqmlY+LJ03WNzvBHywIatVLf54PQ=
X-Google-Smtp-Source: ABdhPJwYOQYW+DLtmEipeBoU8JAOfR2j+jhgl2CJGFYZXuwNwDTvK1p0Ec2CwRYofuAFV0Wcslpcwg==
X-Received: by 2002:ac2:4e95:0:b0:471:ee3b:6534 with SMTP id o21-20020ac24e95000000b00471ee3b6534mr808665lfr.291.1650646285373;
        Fri, 22 Apr 2022 09:51:25 -0700 (PDT)
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
Subject: [PATCH V1 5/6] xen/grant-dma-ops: Retrieve the ID of backend's domain for DT devices
Date: Fri, 22 Apr 2022 19:51:02 +0300
Message-Id: <1650646263-22047-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Use the presence of recently introduced "xen,dev-domid" property
in the device node as a clear indicator of enabling Xen grant
mappings scheme for that device and read the ID of Xen domain where
the corresponding backend resides. The ID (domid) is used as
an argument to the Xen grant mapping APIs.

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
---
 drivers/xen/grant-dma-ops.c | 25 ++++++++++++++++++-------
 include/xen/xen-ops.h       |  5 +++++
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 0e69aa8..70d5d77 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -66,11 +66,6 @@ static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
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
@@ -277,6 +272,16 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.dma_supported = xen_grant_dma_supported,
 };
 
+bool xen_is_grant_dma_device(struct device *dev)
+{
+	/* XXX Handle only DT devices for now */
+	if (!dev->of_node)
+		return false;
+
+	return of_property_read_bool(dev->of_node, "xen,dev-domid");
+}
+EXPORT_SYMBOL_GPL(xen_is_grant_dma_device);
+
 void xen_grant_setup_dma_ops(struct device *dev)
 {
 	struct xen_grant_dma_data *data;
@@ -288,8 +293,14 @@ void xen_grant_setup_dma_ops(struct device *dev)
 		return;
 	}
 
-	/* XXX The dom0 is hardcoded as the backend domain for now */
-	dev_domid = 0;
+	/* XXX ACPI and PCI devices unsupported for now */
+	if (dev_is_pci(dev) || !dev->of_node)
+		goto err;
+
+	if (of_property_read_u32(dev->of_node, "xen,dev-domid", &dev_domid)) {
+		dev_err(dev, "xen,dev-domid property is not present\n");
+		goto err;
+	}
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
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


