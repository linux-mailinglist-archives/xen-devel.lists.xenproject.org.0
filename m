Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF251E924
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 20:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323760.545628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1g-00085m-CT; Sat, 07 May 2022 18:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323760.545628; Sat, 07 May 2022 18:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1g-0007wN-2p; Sat, 07 May 2022 18:19:32 +0000
Received: by outflank-mailman (input) for mailman id 323760;
 Sat, 07 May 2022 18:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6lb=VP=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nnP1e-0006Tm-Ds
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 18:19:30 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c2dbbfb-ce32-11ec-a406-831a346695d4;
 Sat, 07 May 2022 20:19:29 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso6114904wml.5
 for <xen-devel@lists.xenproject.org>; Sat, 07 May 2022 11:19:29 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0020c5253d8f3sm8198457wru.63.2022.05.07.11.19.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 May 2022 11:19:27 -0700 (PDT)
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
X-Inumbo-ID: 3c2dbbfb-ce32-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i20ZoV0Dy7aIhximSqwDLxqvQZkpduCzRqaqQhDs+Gw=;
        b=kaeAxv8eQCkCyM/YsKefnviDP9GsVHb7/51955hWaPMeqjaXkbK/uyVclInXeCIUdE
         X8IXEo2iLyaRQragIBliJUttM3m9nzwxKVQiWuRmtv46zoTAxr+TSDhNPCDeGLBzpq1X
         49JcoOjn13VevVWcxYzJrKiK6peJgDk6R4HwUT1NR3m/lvWnFhUk8bsPpDQ1f9I7QBD2
         33LCxLFmevZNmxrucdGWpD9GNkaUtqTcfGH95is2ZEuijHlLJi2xWq6+Rv3EOoL7eK2c
         Wfthv4gIYltKPDkuCDjm9ROaxIFniVwE1HfbHBVyoPo58rw1q35dbgiELmS1saNmOgEZ
         oWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i20ZoV0Dy7aIhximSqwDLxqvQZkpduCzRqaqQhDs+Gw=;
        b=6UsJxtIx4RWcLGgk0Rxi5/mXcGZXh5dAOfmlikY3nNxDsKXWMFU1VRonSAg7LOlMLF
         Lye8Dwcs+gqCFgV9o2xjVixbMBUcgwvgae8tj3PfpDU40ylDrhHCf8s/yDksFPg+lzVF
         6JDHhYX3SxSJhuU7B08uKuNIXVUi1PlqpjeDvh1prP3Pinsy3LkJdVlmtX/4ERsGePy+
         Ya8OXYp8PTvPVSYruuEwnvzgjN9JwHxuJuSwSnE0BJWhrrc7t+fkszRrrEZ3+z0ctDMy
         8akuvhpj/hAQrebVURrrnSeg7Jk49r5vBQuvmwYxqDn3akROojP1dq9y1v2CyXjfGqhl
         ENOA==
X-Gm-Message-State: AOAM533cZ2xdVgstuiiytKAtbRfCvlyWraRoWQ4+u3dxptD64x9etNyN
	i3mthp8LJ8YCobl4ITlUoW307nRQkOg=
X-Google-Smtp-Source: ABdhPJwPA0kb7aWDicLsLDhgAaPwApIyoCaRdYZ+eHdlC/fExsCO5IbDdRUI+wRMk84GSOATJZsaLQ==
X-Received: by 2002:a7b:cbc2:0:b0:388:faec:2036 with SMTP id n2-20020a7bcbc2000000b00388faec2036mr9020942wmi.190.1651947568572;
        Sat, 07 May 2022 11:19:28 -0700 (PDT)
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
Subject: [PATCH V2 6/7] xen/grant-dma-ops: Retrieve the ID of backend's domain for DT devices
Date: Sat,  7 May 2022 21:19:07 +0300
Message-Id: <1651947548-4055-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>

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

Changes V1 -> V2:
   - remove dev_is_pci() check in xen_grant_setup_dma_ops()
   - remove EXPORT_SYMBOL_GPL(xen_is_grant_dma_device);
---
 drivers/xen/grant-dma-ops.c | 24 +++++++++++++++++-------
 include/xen/xen-ops.h       |  5 +++++
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 29ad7bf..8924178 100644
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
@@ -275,6 +270,15 @@ static const struct dma_map_ops xen_grant_dma_ops = {
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
+
 void xen_grant_setup_dma_ops(struct device *dev)
 {
 	struct xen_grant_dma_data *data;
@@ -286,8 +290,14 @@ void xen_grant_setup_dma_ops(struct device *dev)
 		return;
 	}
 
-	/* XXX The dom0 is hardcoded as the backend domain for now */
-	dev_domid = 0;
+	/* XXX ACPI device unsupported for now */
+	if (!dev->of_node)
+		goto err;
+
+	if (of_property_read_u32(dev->of_node, "xen,dev-domid", &dev_domid)) {
+		dev_err(dev, "xen,dev-domid property is not present\n");
+		goto err;
+	}
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
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


