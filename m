Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADB58D33E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 07:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382694.617755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtY-00082Y-CD; Tue, 09 Aug 2022 05:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382694.617755; Tue, 09 Aug 2022 05:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtY-0007zP-8n; Tue, 09 Aug 2022 05:35:12 +0000
Received: by outflank-mailman (input) for mailman id 382694;
 Tue, 09 Aug 2022 05:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IoV=YN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oLHtW-0006dh-BL
 for xen-devel@lists.xen.org; Tue, 09 Aug 2022 05:35:10 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0446a8a2-17a5-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 07:35:03 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id 130so9867402pfv.13
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 22:35:09 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 u11-20020a17090341cb00b0016be14a776asm9780535ple.286.2022.08.08.22.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 22:35:07 -0700 (PDT)
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
X-Inumbo-ID: 0446a8a2-17a5-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=NifFepPUEguH0dl29HRZU/y8m1pbiLwFccGf0MAc2pA=;
        b=ah2SuRCjUKuhv6hVLB517eCMzsnil5+BM1eVIYMRFKCDB/Dvpg3drAYwg0yEBs2bq6
         p98EcRuCrmJInJmt0KUgy1LQ4ZEru+Hf7uZod7FYlB1RyhWbf7twlWCj43QjBJhvPbZy
         ZonQaXmY0G8LsqzoNUttBnrAGwDA+MBhRB4tB4ULXgcXA+QTIlsKAephC50pHZ1M/jey
         1XufQpw/7zREXXeH46/fv9gbM2mPLMzAidpQK5C3pd8os9rbTBRF7qmdwr2OWrtIPAex
         wMPUb49lkvTDhoMreWA1dJF0t93kVbu1uPJtedHXvCdBGUaokEgoEYIZ6pIuzlWxwY59
         lM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NifFepPUEguH0dl29HRZU/y8m1pbiLwFccGf0MAc2pA=;
        b=JmKKEB2OLunlUikx1OZoeKMHr/7dl82YvPFh9mnF5T6o/ULciNNg5D1HFZX/wQ+2XH
         TJN1AHr0yOrgwprz8rQ70PXzNGfPNk73RkBvrmqE+K7nw37rSHaCWC3d6VzRVNgbdibs
         dYKyzqux+CeSh5BmKOQpfSOuI6G4i7zGrD+7rb4ffQT3oftdXainb1FswW4MxRPNkUo2
         I9XgwjIM2TPOPW3yZR33KV+iT+PRGhJxfZPeCn1ImHxEjNiLIhtfTo/s9onx5+Wp2Kti
         0pwHGtaoHrSO5rodFxdnDw+x3e+hJXtOKpTUx3x9kzwEKjv/oP6IPV1UtRjBeGU6UefR
         3Skw==
X-Gm-Message-State: ACgBeo1fXmjKHpE76i8t0KzVdC9DyEr7qcF3DhiVhcVsOVxzw11BTidE
	daDtMp30cJmXRbiLwvNahV4khZ3/pf80jw==
X-Google-Smtp-Source: AA6agR5gnYMyP837LUSYvjIMwCdyIj8l6QnmsH6niTyS910SeX5CSj47a3c/PFLRrKjgXspgncMDww==
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id d10-20020a656b8a000000b003db7dc5fec2mr17535630pgw.223.1660023308188;
        Mon, 08 Aug 2022 22:35:08 -0700 (PDT)
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
Subject: [PATCH V4 6/6] libxl: Allocate MMIO params for GPIO device and update DT
Date: Tue,  9 Aug 2022 11:04:33 +0530
Message-Id: <f4c77a566ce2a141e2044c859798a11152ce1928.1660023094.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1660023094.git.viresh.kumar@linaro.org>
References: <cover.1660023094.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree based on Virtio GPIO
DT bindings [1].

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 93ea8e3d3fa3..c0ffb7f179d4 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -119,6 +119,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return rc;
     }
 
+    for (i = 0; i < d_config->num_gpios; i++) {
+        libxl_device_gpio *gpio = &d_config->gpios[i];
+
+    int rc = alloc_virtio_mmio_params(gc, &gpio->base, &gpio->irq,
+            &virtio_mmio_base, &virtio_mmio_irq);
+    if (rc)
+        return rc;
+    }
+
     /*
      * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
      * present, make sure that we allocate enough SPIs for them.
@@ -976,6 +985,38 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
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
@@ -1308,6 +1349,16 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
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


