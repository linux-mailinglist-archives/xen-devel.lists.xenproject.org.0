Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F114B58D340
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 07:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382692.617745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtV-0007gw-4N; Tue, 09 Aug 2022 05:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382692.617745; Tue, 09 Aug 2022 05:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtV-0007cw-0C; Tue, 09 Aug 2022 05:35:09 +0000
Received: by outflank-mailman (input) for mailman id 382692;
 Tue, 09 Aug 2022 05:35:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IoV=YN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oLHtT-0006BY-Ep
 for xen-devel@lists.xen.org; Tue, 09 Aug 2022 05:35:07 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0618726f-17a5-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 07:35:06 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id y1so4813446plb.2
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 22:35:06 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 i15-20020a17090332cf00b0016cf3f124e5sm9880956plr.131.2022.08.08.22.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 22:35:04 -0700 (PDT)
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
X-Inumbo-ID: 0618726f-17a5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3u6sGyZ8gp270ZFZu62PvztelHz8px5vnBASNJrcqXc=;
        b=vYqXcl/FVy7OhfhUEYdwZbQalwTEDVktmnPxHHzZ82YWO59agx/VYCvxwfqsMTwB48
         wgrM65+pnC5HX1oPKguEubBhG6lVOUKKLzq3q/RbmX6wVcNayRwWNdJRNfSrqdxlqYY4
         r/z5wWUwfSnm8QjQm+nxMJAmj00UnGnGX5P7HOrCJh9F9sQgyUhw2g1Kg1as7YVrekNb
         oq5RoXJFlBUXuTNEjzYthBcqAqfbheokG7CXor0gzyuCnqt+rinBGmrmjxv29KLiHrK+
         EB0K0v0WbaUebyFus4I3kqKe+vEqlmIRtoSTwv9pRPJjcK61O3Kesy6YQwRFet2/tAPm
         Ykvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3u6sGyZ8gp270ZFZu62PvztelHz8px5vnBASNJrcqXc=;
        b=0yld1ndz8h0E9CI68njY/wRPuziju0m1LSSKnoUYHl6D6iwkU8TpJRVnatDPL6Ca5D
         T0YmH5HPc96X/fHsDfoDkeEF47M/0oLVVI3ghdlBYnomX2fpa4ju7FuTNyGnQ8RyCR4z
         n7ecjWfl+7rWjvVJD3VYCTbuN5RNlK0uIqtvbt6Buncsi4uki6vR75a3+0tlaVhWan7i
         Htq+alOMeH2eVK72p5LsLMR6H3vLvC9Yh04BGRBnh6y54uNUptzVVefWgtzsrN3gkay+
         p8KmcuvDMsJxag4mYvVwDA9KxcCk1v7vF3nLTuxXmjKKKIlSw9P564UORqq13CDY0uwd
         UjFw==
X-Gm-Message-State: ACgBeo0QX7vWKuM3M7lolD++cB1YyvVUHtCPjBAX7NxtPPZvTb8E3bm+
	7qRhxM1EeoqotYDZl29r46EGRhxvWon3FQ==
X-Google-Smtp-Source: AA6agR4A9r463y557MIGubQxFf8sgfJEeQy4QqO4hmIauxqvHxR4UUrnEM2iYbkMu99lOvfkoVAK/g==
X-Received: by 2002:a17:902:ecc8:b0:16f:9355:c103 with SMTP id a8-20020a170902ecc800b0016f9355c103mr18093875plh.122.1660023305236;
        Mon, 08 Aug 2022 22:35:05 -0700 (PDT)
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
	Julien Grall <julien@xen.org>
Subject: [PATCH V4 5/6] libxl: Allocate MMIO params for I2c device and update DT
Date: Tue,  9 Aug 2022 11:04:32 +0530
Message-Id: <762932ad90785d31039343d543da14c84ce8327d.1660023094.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1660023094.git.viresh.kumar@linaro.org>
References: <cover.1660023094.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree based on Virtio I2C
DT bindings [1].

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 57 +++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 891cb6ef2674..93ea8e3d3fa3 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -110,6 +110,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         }
     }
 
+    for (i = 0; i < d_config->num_i2cs; i++) {
+        libxl_device_i2c *i2c = &d_config->i2cs[i];
+
+        int rc = alloc_virtio_mmio_params(gc, &i2c->base, &i2c->irq,
+                &virtio_mmio_base, &virtio_mmio_irq);
+        if (rc)
+            return rc;
+    }
+
     /*
      * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
      * present, make sure that we allocate enough SPIs for them.
@@ -947,6 +956,26 @@ static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
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
@@ -1148,7 +1177,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
     size_t fdt_size = 0;
     int pfdt_size = 0;
     libxl_domain_build_info *const info = &d_config->b_info;
-    bool iommu_created;
+    bool iommu_needed;
     unsigned int i;
 
     const libxl_version_info *vers;
@@ -1256,22 +1285,36 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
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
                                             disk->irq, disk->backend_domid) );
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


