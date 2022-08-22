Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A8C59BC86
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 11:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391249.629041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3X8-0002ip-QJ; Mon, 22 Aug 2022 09:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391249.629041; Mon, 22 Aug 2022 09:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3X8-0002fa-M8; Mon, 22 Aug 2022 09:15:46 +0000
Received: by outflank-mailman (input) for mailman id 391249;
 Mon, 22 Aug 2022 09:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J63M=Y2=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oQ3X6-00016q-If
 for xen-devel@lists.xen.org; Mon, 22 Aug 2022 09:15:44 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff6ca335-21fa-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 11:15:43 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id m15so2273118pjj.3
 for <xen-devel@lists.xen.org>; Mon, 22 Aug 2022 02:15:43 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 b194-20020a6334cb000000b0041d02809facsm6958423pga.79.2022.08.22.02.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:15:41 -0700 (PDT)
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
X-Inumbo-ID: ff6ca335-21fa-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XPO6uUW2aI4P/8vL92ycMK94cuye3tq563IA6689ljc=;
        b=HTZEvkwROQexnDYLr+x+fQKWnjQO4N+9lAvx1razDZPz/wrNJgOiURGFZmERofc1Wi
         nFwWH27wOsfcEYfKhN2wOlH79TLMPJzql8U1utfnlI8MEJAE0h1Upf0eUV8Ws1fR8xUk
         pQjebaOB1bBrSYapq8LJnPSWPGWi/C2RlPXLKcLG9ACC6g35wTUyhRj5CSRCTXTRTPV0
         rkt1IUIPU08FUImcHfvAIOkoq2SbMfYQHkJGeySJbVxLTW4LrIIb0cidQ2FjauukmYfR
         ehdQaxuhYvUFbuqz9Vl7EU4iST5EQrvUrrbedJzf82hMRw+SF9fFXThY5HZjJj77IUME
         ZADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XPO6uUW2aI4P/8vL92ycMK94cuye3tq563IA6689ljc=;
        b=eZJKYyN76f969m3O9QYGBZMfRuLgZHQnQumqZ0zgNnB6MWUJMtWehnNjYDZv83HwKm
         QVGnv7C3/uFKDUTDK2EZtmEmwT2Y4qhd/ZolnbDXQkO0OYci9scuWDbvBPoFhWqVZQHX
         B/rtFaW8N6Rzooo+EnvQ9OwO1og3cRE0A/5Rg+85PN9aS7KvFfwVNnzJqZhTz8CCNiDW
         Hg3lpkyrwAqUoGyLkJEXUZ+Z60tthddKlZvLC9yCHP1+f277qfjGC+5NJ9YZ6FbSgZal
         QW4EOHTvT5vD+W4pZgKqWxTD3pRo79gcRB4vOn3PGjbGCSYoIMO28TFT1A+hoPcUW0qz
         1lKQ==
X-Gm-Message-State: ACgBeo19wDCyMjU4tzO5i37H/kqve4JcjG8nN8RgeBJO5Y85+7VuVvcZ
	8KnGJ0jyusL7G4wM9qqSfE+8V7EtDhu9Sw==
X-Google-Smtp-Source: AA6agR7byTBxhWJPa6a5rX2AncrvRnnlziDy+FzQHQ2INg5On7XlXYdlOSG+9SfCSdXy7YShhnMfqw==
X-Received: by 2002:a17:90a:e009:b0:1fa:e417:b9b7 with SMTP id u9-20020a17090ae00900b001fae417b9b7mr17532898pjy.149.1661159742430;
        Mon, 22 Aug 2022 02:15:42 -0700 (PDT)
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
Subject: [PATCH V5 6/6] libxl: Allocate MMIO params for GPIO device and update DT
Date: Mon, 22 Aug 2022 14:45:18 +0530
Message-Id: <4a238937ceb803f494e5633a3a779866383bd463.1661159474.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1661159474.git.viresh.kumar@linaro.org>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree based on Virtio GPIO
DT bindings [1].

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4c1012e56893..86c1e560900f 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -121,6 +121,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return rc;
     }
 
+    for (i = 0; i < d_config->num_gpios; i++) {
+        libxl_device_gpio *gpio = &d_config->gpios[i];
+    int rc = alloc_virtio_mmio_params(gc, &gpio->base, &gpio->irq,
+                                      &virtio_mmio_base, &virtio_mmio_irq);
+
+    if (rc)
+        return rc;
+    }
+
     /*
      * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
      * present, make sure that we allocate enough SPIs for them.
@@ -984,6 +993,38 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
     return fdt_end_node(fdt);
 }
 
+static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt, uint64_t base,
+                                      uint32_t irq, uint32_t backend_domid)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    if (res) return res;
+
+    res = fdt_begin_node(fdt, "gpio");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "virtio,device29");
+    if (res) return res;
+
+    res = fdt_property(fdt, "gpio-controller", NULL, 0);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#gpio-cells", 2);
+    if (res) return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", 2);
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
@@ -1317,6 +1358,16 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                                            i2c->backend_domid) );
         }
 
+        for (i = 0; i < d_config->num_gpios; i++) {
+            libxl_device_gpio *gpio = &d_config->gpios[i];
+
+            if (gpio->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                iommu_needed = true;
+
+            FDT( make_virtio_mmio_node_gpio(gc, fdt, gpio->base, gpio->irq,
+                                            gpio->backend_domid) );
+        }
+
         /*
          * Note, this should be only called after creating all virtio-mmio
          * device nodes
-- 
2.31.1.272.g89b43f80a514


