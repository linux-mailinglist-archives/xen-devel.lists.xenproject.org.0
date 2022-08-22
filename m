Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A27259BC83
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 11:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391248.629031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3X4-0002JB-F2; Mon, 22 Aug 2022 09:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391248.629031; Mon, 22 Aug 2022 09:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3X4-0002GB-AP; Mon, 22 Aug 2022 09:15:42 +0000
Received: by outflank-mailman (input) for mailman id 391248;
 Mon, 22 Aug 2022 09:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J63M=Y2=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oQ3X2-00016q-LP
 for xen-devel@lists.xen.org; Mon, 22 Aug 2022 09:15:40 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd9864d6-21fa-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 11:15:39 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 w11-20020a17090a380b00b001f73f75a1feso13311011pjb.2
 for <xen-devel@lists.xen.org>; Mon, 22 Aug 2022 02:15:39 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 o36-20020a17090a0a2700b001faee47021dsm5067943pjo.45.2022.08.22.02.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:15:38 -0700 (PDT)
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
X-Inumbo-ID: fd9864d6-21fa-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=75pvqr4wOoO82a941SksaNrC8HBct24tTgm2e3AVDno=;
        b=Q5y5pMuABIAqxzolE4IjvmRqVi7UyMQ8RkPgJgSmT4vAxpUm4b029H4PTxQr5SEv3J
         /cFA/6FiIkNQ/SfIxYTvoaxd6I714LhBceqiHSVxSsdBU8ttY/N/Pk82Aebz9PCsum7Y
         ce91dRzoZl4tc71n1bv9ep4XOJHqmyWuWkRFPdSh8GkalbR0ppTQdfa4C3KEo50qkayJ
         GBUN+3sOd8TZDAmyQYFpgDmnHTcGQau4xraciWgUyDYxCzdivi+aLoRcRODnOWpd1cyR
         NcCAR3P3Ks1dSdDAo3O1P0ukdhwan3cONH0G0gFij13/zMjVXDXznPC/sJe157rrdARt
         03Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=75pvqr4wOoO82a941SksaNrC8HBct24tTgm2e3AVDno=;
        b=NYE37MBE6StTmIVWgINbehX7Lj0IwkWq7ceN2YFyXdcQ6IcpDemrEwQTmFElDmCCgo
         UJ180l5hYngUnMRfnhx5dcYZk4JPX/HS4a/H2r0X8HFXEzAKcjaxf7QgIhB7Jk0JDjYz
         FAJZS0xc8LHsR7F7vEhdVmbxj40NWcUB1Rjhw30PIy6YpMgS821qholcVCKaqlPvvIeT
         dNmxbxvqUdWCoVsqdPvMIAb4k3M1c0zHWCYo8rVvbp8mr9pCjNHbAQelokVLEZSYr0SY
         AhAVz8YWKd2VSIztpd4rHnULodmdtfEJrtzwGqC8DH/u9YYvahxH/bUOFjEL54ntRoK5
         yC3A==
X-Gm-Message-State: ACgBeo3eSW+/i4fi4oEZP1n6lQ7h6iHk+AdRpP54fMVVTNTYYE+biB1E
	P+wKax8Va09dU2l38HxJi64s8UPsnvFZ+Q==
X-Google-Smtp-Source: AA6agR7iVrhjd8sV3hNQ19u7HyyBhNvlhBpwR1sXrR7DqTGjQRrRYkxvBEiIYu/7kahlrheaPrVsAg==
X-Received: by 2002:a17:90a:9309:b0:1fa:d28b:3751 with SMTP id p9-20020a17090a930900b001fad28b3751mr19904291pjo.189.1661159739298;
        Mon, 22 Aug 2022 02:15:39 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	anthony.perard@citrix.com,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V5 5/6] libxl: Allocate MMIO params for I2c device and update DT
Date: Mon, 22 Aug 2022 14:45:17 +0530
Message-Id: <7b871a16d981dcdc0046e6a69f77e2bcffe79065.1661159474.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1661159474.git.viresh.kumar@linaro.org>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree based on Virtio I2C
DT bindings [1].

This also relocates the code responsible to call make_xen_iommu_node()
towards the end of the routine, so we create the node only once.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 57 +++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4d0469f8166a..4c1012e56893 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -112,6 +112,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         }
     }
 
+    for (i = 0; i < d_config->num_i2cs; i++) {
+        libxl_device_i2c *i2c = &d_config->i2cs[i];
+        int rc = alloc_virtio_mmio_params(gc, &i2c->base, &i2c->irq,
+                                          &virtio_mmio_base, &virtio_mmio_irq);
+
+        if (rc)
+            return rc;
+    }
+
     /*
      * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
      * present, make sure that we allocate enough SPIs for them.
@@ -955,6 +964,26 @@ static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
     return fdt_end_node(fdt);
 }
 
+static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
+                                     uint32_t irq, uint32_t backend_domid)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    if (res) return res;
+
+    res = fdt_begin_node(fdt, "i2c");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "virtio,device22");
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return fdt_end_node(fdt);
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -1156,7 +1185,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
     size_t fdt_size = 0;
     int pfdt_size = 0;
     libxl_domain_build_info *const info = &d_config->b_info;
-    bool iommu_created;
+    bool iommu_needed;
     unsigned int i;
 
     const libxl_version_info *vers;
@@ -1264,16 +1293,13 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
 
-        iommu_created = false;
+        iommu_needed = false;
         for (i = 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk = &d_config->disks[i];
 
             if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
-                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
-                    !iommu_created) {
-                    FDT( make_xen_iommu_node(gc, fdt) );
-                    iommu_created = true;
-                }
+                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                    iommu_needed = true;
 
                 FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base,
                                                   disk->irq,
@@ -1281,6 +1307,23 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
             }
         }
 
+        for (i = 0; i < d_config->num_i2cs; i++) {
+            libxl_device_i2c *i2c = &d_config->i2cs[i];
+
+            if (i2c->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                iommu_needed = true;
+
+            FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq,
+                                           i2c->backend_domid) );
+        }
+
+        /*
+         * Note, this should be only called after creating all virtio-mmio
+         * device nodes
+         */
+        if (iommu_needed)
+            FDT( make_xen_iommu_node(gc, fdt) );
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
-- 
2.31.1.272.g89b43f80a514


