Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEE551B92B
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321562.542603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVza-0007ys-Qg; Thu, 05 May 2022 07:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321562.542603; Thu, 05 May 2022 07:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVza-0007tH-Kn; Thu, 05 May 2022 07:33:42 +0000
Received: by outflank-mailman (input) for mailman id 321562;
 Thu, 05 May 2022 07:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7gz=VN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1nmVzZ-0007CX-4Y
 for xen-devel@lists.xen.org; Thu, 05 May 2022 07:33:41 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae742219-cc45-11ec-a406-831a346695d4;
 Thu, 05 May 2022 09:33:40 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id p12so3037160pfn.0
 for <xen-devel@lists.xen.org>; Thu, 05 May 2022 00:33:40 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 v10-20020aa799ca000000b0050dc7628166sm660155pfi.64.2022.05.05.00.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 00:33:38 -0700 (PDT)
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
X-Inumbo-ID: ae742219-cc45-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oaW6A1hTB436RSWpybXMNt3EyRCE2jUiJD8XH/4GaQk=;
        b=vdN1z4Xl4+W+wF9Zqgim2NY6dUQsGEGR3O8/mWhFKgr/dzabvXjWTLqQOM/N0Mmh7P
         1augu9E5HCtpv03jGlmm3+B0tlnObreRnffK/eis41JupPw0wF+L02KTYnA8RqxlLbkX
         KpfFRkc/HkDHLFpwxgv9qp1K/neeVuzH8X4tt4WgP6h8b4cenvuYp5FkyWI2krCV2SUu
         iDJVPHCbX3s5kYDmjSDgjVUCP3jGFjhZGCQzQfSSK2cwpec5J7NaOUnFTDoFK0NjbgII
         a8N2Mh0SLebfwvvpDE/mjTrXAPN5yl06inr6jhn/MRQFd6IlTpQxv+q8MVsMlTh+iLtG
         HW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oaW6A1hTB436RSWpybXMNt3EyRCE2jUiJD8XH/4GaQk=;
        b=L+9usCsWxJLO+NuUa64aq968uxOX9sMenRhoyrCO6h+QTiw04yI3ywmjmhnFa48rdL
         oNHuYXUIZOo0zQ9AcnN2dlj4L32G0tAnIzw2T+EkS3cKTvd7rBxsiH8k6VRB373s9UJd
         /s5bkHut8csMunQDMkM/3PTZQd2CAMk8q41HqJ1JplEav5DHhLpnotkc3ifgCkJhjqGv
         5nW0SN1dtlCyCFgIM9apkytaX2LzIF9qrOWG8pBm7pFamCYVbn07FK/WhfCpAYUQKzVO
         IlIPnrno4PrxdQSiopb6XuIqiGP2lgyo4sD3EYbsAC7zAr8Bre48P908hNJqXyJPY1QX
         wSmA==
X-Gm-Message-State: AOAM533VRCpVcstmC3A/PAuWh7ysKZhkR46872QlipncY8BOy0URQ1xT
	li0nfwDsehkqoo/mBDZgg2pSHCrlMdsrCg==
X-Google-Smtp-Source: ABdhPJwOTMbqTMVYU7vnXDi2mDFlDRgF2RkAaFuDlhX4shtx7BTvK7Ri/i74rwPlQxZk2EKMaGd3jw==
X-Received: by 2002:a65:684c:0:b0:3ab:7c9c:f648 with SMTP id q12-20020a65684c000000b003ab7c9cf648mr21261369pgt.562.1651736018870;
        Thu, 05 May 2022 00:33:38 -0700 (PDT)
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
Subject: [PATCH 3/4] libxl: Allocate MMIO params for I2c device and update DT
Date: Thu,  5 May 2022 13:03:22 +0530
Message-Id: <aa5335be86c926555e12d5d3d54afa5b29059be3.1651734854.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1651734854.git.viresh.kumar@linaro.org>
References: <cover.1651734854.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 57 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 8132a47a72b6..ea633d6f91df 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -115,6 +115,26 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         }
     }
 
+    for (i = 0; i < d_config->num_i2cs; i++) {
+        libxl_device_i2c *i2c = &d_config->i2cs[i];
+
+        i2c->base = alloc_virtio_mmio_base(gc);
+        if (!i2c->base)
+            return ERROR_FAIL;
+
+        i2c->irq = alloc_virtio_mmio_irq(gc);
+        if (!i2c->irq)
+            return ERROR_FAIL;
+
+        if (virtio_irq < i2c->irq)
+            virtio_irq = i2c->irq;
+
+        virtio_enabled = true;
+
+        LOG(DEBUG, "Allocate Virtio MMIO params for I2C: IRQ %u BASE 0x%"PRIx64,
+            i2c->irq, i2c->base);
+    }
+
     if (virtio_enabled)
         nr_spis += (virtio_irq - 32) + 1;
 
@@ -874,7 +894,7 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
 }
 
 
-static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
+static int _make_virtio_mmio_node(libxl__gc *gc, void *fdt,
                                  uint64_t base, uint32_t irq)
 {
     int res;
@@ -897,7 +917,35 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
     res = fdt_property_interrupts(gc, fdt, &intr, 1);
     if (res) return res;
 
-    res = fdt_property(fdt, "dma-coherent", NULL, 0);
+    return fdt_property(fdt, "dma-coherent", NULL, 0);
+}
+
+static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
+                                 uint64_t base, uint32_t irq)
+{
+    int res;
+
+    res = _make_virtio_mmio_node(gc, fdt, base, irq);
+    if (res) return res;
+
+    return fdt_end_node(fdt);
+}
+
+static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt,
+                                 uint64_t base, uint32_t irq)
+{
+    int res;
+
+    res = _make_virtio_mmio_node(gc, fdt, base, irq);
+    if (res) return res;
+
+    res = fdt_begin_node(fdt, "i2c");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "virtio,device22");
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
     if (res) return res;
 
     res = fdt_end_node(fdt);
@@ -1221,6 +1269,11 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                 FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
         }
 
+        for (i = 0; i < d_config->num_i2cs; i++) {
+            libxl_device_i2c *i2c = &d_config->i2cs[i];
+            FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq) );
+        }
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
-- 
2.31.1.272.g89b43f80a514


