Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F0589805
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 09:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380197.614285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUsF-0001mn-Fs; Thu, 04 Aug 2022 07:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380197.614285; Thu, 04 Aug 2022 07:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUsF-0001kC-C2; Thu, 04 Aug 2022 07:02:27 +0000
Received: by outflank-mailman (input) for mailman id 380197;
 Thu, 04 Aug 2022 07:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wk0C=YI=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oJUsE-000883-0B
 for xen-devel@lists.xen.org; Thu, 04 Aug 2022 07:02:26 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6477013a-13c3-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 09:02:25 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id w7so18512722ply.12
 for <xen-devel@lists.xen.org>; Thu, 04 Aug 2022 00:02:25 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 h8-20020a056a00000800b0052e6c058bccsm125165pfk.61.2022.08.04.00.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:02:22 -0700 (PDT)
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
X-Inumbo-ID: 6477013a-13c3-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NvJtOV01vWUnDPySFX3bI7cooUnCi0cZCWz8i8egjwM=;
        b=N1XGR7kbt9Bqp5pXN6OP5kmgAQq9Tg8JzcsFNdTmILkSC52Le5clpihTXEF3YoVL2S
         AlLFk9rxhAMEpB/2w3pJ04pDOLgLLbMUGm/TZTWZgpAa1KLFsZlvMwB3S4ueKJjAf5Ku
         jfCp6jEYqb6J78KMhz9Qvt6k4YYXihBZLRg7hOo5Z+dNObqu8FtleKviTzhYBLHKtX0W
         coYRw0OgZ6pJRAAJCwFPw3/bbipRh/RGa6AdagWarexTuyr9qoBs81OEZ+G1zgM8gUTT
         J3pXLaqUXP/gV0MeCUW+AzgBWHhDyCxyg24S+uxw0LgPnbzRRW4UKppG0BfANplP7DBY
         d9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NvJtOV01vWUnDPySFX3bI7cooUnCi0cZCWz8i8egjwM=;
        b=gJLXZLlADXa319OZRqHdy2ikAEMEWLkvMQagIGrYJ1NQBnIEsL3Bf7Uo7F+yS2SIJZ
         4xkYbQyBUzybzILBFC6EphnHSawWDohUhHJ27r+tNYhjsrXR9WzpS0px3P7OsKCbGS+y
         U42rdwpan/qalXM2ceoy2PVctFgOgOprj0kovNqbHlfZcBGrRODmZNej0qVrQsh5GGe0
         g05M2GH8y1w6qBUs/q5DYNSfoVcI8qZUjFG5sIEHl5JkMXliT/4l9Z+un+m1RI/+8ZHZ
         YIYHwHhb7oWNN0OkmPsRNCoUtj6iG+fj5TIzAeNI37fEBqdEV4kPpnDBJ94jUOX55DbH
         RvHA==
X-Gm-Message-State: ACgBeo0cXoA/byrbf7YRzXbU0qbxmAJRSaTmMBhvvGWA0+KeeNyRynNK
	VaPT9a6lJiPqs13+wR9IaGZ1tAMR2bZGdg==
X-Google-Smtp-Source: AA6agR6WuDtE+TTMuV9OLfDWyDOeFAH1y7h8Wh2zRU/3Xosqq4SwzfT522R4gKUbnDNCBke/tDBHSQ==
X-Received: by 2002:a17:902:f608:b0:16d:c44:137 with SMTP id n8-20020a170902f60800b0016d0c440137mr525312plg.173.1659596543763;
        Thu, 04 Aug 2022 00:02:23 -0700 (PDT)
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
Subject: [PATCH V3 6/6] libxl: Allocate MMIO params for GPIO device and update DT
Date: Thu,  4 Aug 2022 12:31:54 +0530
Message-Id: <20af3a836d0ddd0d73024f8c10f7325e89ef19d8.1659596139.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1659596139.git.viresh.kumar@linaro.org>
References: <cover.1659596139.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree based on Virtio GPIO
DT bindings [1].

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 08a1499c9523..14b95087f027 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -121,6 +121,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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
@@ -974,6 +983,38 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
     return fdt_end_node(fdt);
 }
 
+static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt, uint64_t base,
+                                      uint32_t irq)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
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
@@ -1305,6 +1346,12 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
             FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq) );
         }
 
+        for (i = 0; i < d_config->num_gpios; i++) {
+            libxl_device_gpio *gpio = &d_config->gpios[i];
+
+            FDT( make_virtio_mmio_node_gpio(gc, fdt, gpio->base, gpio->irq) );
+        }
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
-- 
2.31.1.272.g89b43f80a514


