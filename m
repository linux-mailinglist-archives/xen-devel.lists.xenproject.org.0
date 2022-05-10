Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B842520D99
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 08:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325181.547683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIzl-0000qX-4y; Tue, 10 May 2022 06:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325181.547683; Tue, 10 May 2022 06:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIzl-0000nu-1c; Tue, 10 May 2022 06:05:17 +0000
Received: by outflank-mailman (input) for mailman id 325181;
 Tue, 10 May 2022 06:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+NA3=VS=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1noIzj-0007z7-DY
 for xen-devel@lists.xen.org; Tue, 10 May 2022 06:05:15 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21985c21-d027-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 08:05:03 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so1083663pjb.1
 for <xen-devel@lists.xen.org>; Mon, 09 May 2022 23:05:14 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 w25-20020a637b19000000b003c659b92b8fsm6944713pgc.32.2022.05.09.23.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 23:05:12 -0700 (PDT)
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
X-Inumbo-ID: 21985c21-d027-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ao4t6jWg9wZG5OnDiYaWDYf/ncDqRjTgOzFX6e4AW7A=;
        b=UPx3Q2aoAHaO3I1yFQqVelKV/6W5jaFEHonFI7K1vNYNSPZkKKorN4QpzncTrf/2+q
         oUX0TV661jcRoXXPwoBVkN0rhopAQv4JB2iwi8/fJGkoQXFV+W3u5X6ik1UyxhgOS440
         RVyiptw3alpJWWCv9Gi5behftA8O/ZlTpM2ZSeDh0tzVbWozho5AiN/BuyPQKi9dEjw8
         yvgFl8NHEv75UfxAT99tj1NuEj3fJzgzH+KbIxN3dVE+gOIWjecxz2oN4xJucv5cam4L
         EkZ9qlIlNkekjeF63g93oIWXfGIniHiIBEwaBFLXy/irr7WwfL0tTzjFkFvzILpfBE8x
         cC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ao4t6jWg9wZG5OnDiYaWDYf/ncDqRjTgOzFX6e4AW7A=;
        b=oQ7PWMxN2PyQtoCVIbQh1TD2NGeA1lDRlHAVwIyO5/R8bPc2JUCr8vpxBxyoUFylcv
         iOYbF91PvBy51n0N5/Pwcvy5A/vYidDge3Kp4hWRvXFiET7K4bpb7aH+J8ZvtXfLKn2S
         PkeBMTjt+wAWZhuD1fHlC4b1ND97pKbgRX6CU3OcGWy5/nU5hivwlLpJNUmYY/aV/JZx
         KO2PO50uWF7oc7EFt3CDJr+M+PWaulHQxcQxccoPJFcAO9BGmSwvAEh9XD1UhbyeIytS
         +dsMACc1UYwwhD6uYq+qvU8y2Kf2aoGnE/1MkSjjMEXLsjHsgSqqkSauftgHDS4xIoJ0
         IBhA==
X-Gm-Message-State: AOAM532kKwptW2VeUUrfTVM1aJ7e9t0ML9ZR/Z3FaPifYTk+kjKpDZ/K
	z9+2h9bUPUhb6L9y5DTtq3q/GWIXX11h3Q==
X-Google-Smtp-Source: ABdhPJyfZUHybYDgF9ZHX0pJJsJ84E9YhfxmEXMI2wt9ElM159gGUSMwD5S4ScHo0c4LarwHE9MEYw==
X-Received: by 2002:a17:90a:d308:b0:1dc:eff1:d74e with SMTP id p8-20020a17090ad30800b001dceff1d74emr15672286pju.109.1652162713277;
        Mon, 09 May 2022 23:05:13 -0700 (PDT)
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
Subject: [PATCH V2 5/6] libxl: Allocate MMIO params for I2c device and update DT
Date: Tue, 10 May 2022 11:34:50 +0530
Message-Id: <fcb54b7651a02843389f1bf739c83df44008f925.1652162646.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1652162646.git.viresh.kumar@linaro.org>
References: <cover.1652162646.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree based on Virtio I2C
DT bindings [1].

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 3a038d388cf0..d085c7cf4dbd 100644
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
     if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
         virtio_irq = virtio_mmio_irq - 1;
         nr_spis += (virtio_irq - 32) + 1;
@@ -909,6 +918,26 @@ static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
     return fdt_end_node(fdt);
 }
 
+static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt,
+                                 uint64_t base, uint32_t irq)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
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
@@ -1224,6 +1253,11 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                 FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base, disk->irq) );
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


