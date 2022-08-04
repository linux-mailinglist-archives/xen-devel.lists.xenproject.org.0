Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C165897FF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 09:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380190.614252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUs4-0000c5-Kr; Thu, 04 Aug 2022 07:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380190.614252; Thu, 04 Aug 2022 07:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUs4-0000Z8-GA; Thu, 04 Aug 2022 07:02:16 +0000
Received: by outflank-mailman (input) for mailman id 380190;
 Thu, 04 Aug 2022 07:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wk0C=YI=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oJUs2-0000K7-Jc
 for xen-devel@lists.xen.org; Thu, 04 Aug 2022 07:02:14 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c8d323c-13c3-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 09:02:13 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id h28so12217860pfq.11
 for <xen-devel@lists.xen.org>; Thu, 04 Aug 2022 00:02:12 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 w3-20020a170902e88300b0016be96e07d1sm46803plg.121.2022.08.04.00.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:02:10 -0700 (PDT)
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
X-Inumbo-ID: 5c8d323c-13c3-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XNF5lFqkiEnLHtnRZXOdPOJLnrAuWb9MTwMC64Rff4g=;
        b=e3ZvLaojG2E72Ta3MxOi+qccJQPC6b8WYdL7kygELyRlQdwQDZ3/nakfLdc3ClC9Hx
         ao586GkbiYS1aSItaG/kwC2e1j7BA69a4+DJOjScu0MSZW9lMEn0yHYpl1TpVXl/H+p5
         KCiJwx9E0Sq/S+uJJq21ato8miVUyES7yr1HD92BU4wsbYGAmH3tXFJxit/4TKFKxBKK
         LRAbZcN4vAkR+sp0AIx77Ssb5zMLab4GGyZ2fmwl+0tygtQc0ZcKDZFc3ihwCCUNVvMM
         USiCTqSVJG1Hvcvc2XowYl7jQitz6r1fV8kGO/nBtjUa5ehx1AARUI30nuo3DJFRT/WV
         e9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XNF5lFqkiEnLHtnRZXOdPOJLnrAuWb9MTwMC64Rff4g=;
        b=CeXFDXpkOm8QFPS7mF+PV/6LJuX5jsUkjmjSOavmwAYPV6ycyLbRHg2saizvTsE2ld
         kc1iA3f7m98XK9uzIoWKzdzeTkLoHEtT247kUaQ4ENBRJpZr231YeuZb//5WvjSmYnJm
         HUFCBnGr347D0A5wds7cfFPX1WOzFiVC/LgYL2cQ4OHDP7jx4VhqhoRc1GAmZh3Xn2n4
         C3C7Of3Mxg2LAM0pK2ngVrKx20iQnypGTDtSP+b7DRXXvospq/eOP8R2B62uD7ho+tFi
         2bmTuUDVs6+l2/xWQrFtM3Wr2GQBPp12u9lPqW8Xh4rjQMd6W0hsuc8m5ihk01zw+Zkq
         GJbg==
X-Gm-Message-State: ACgBeo19AoWYjwh6eHbw6AXKMp0QoC2g3877Gk2MlL803QZCQNpRkwE+
	xwweE27nBz0jiD4a6OLd8hGmZ2nXSTMgpA==
X-Google-Smtp-Source: AA6agR7gitQUj4IOmeOqn77IlXVXzoGacsho48zQcudPw1kc2hYZ8NewuGzPCxAAncAnQI5Y+oiCLA==
X-Received: by 2002:aa7:919a:0:b0:52a:eeef:3e65 with SMTP id x26-20020aa7919a000000b0052aeeef3e65mr391687pfa.15.1659596531003;
        Thu, 04 Aug 2022 00:02:11 -0700 (PDT)
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
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V3 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Date: Thu,  4 Aug 2022 12:31:51 +0530
Message-Id: <ae3e61fe687cb2d9dac17622da2ec81c4064db39.1659596139.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1659596139.git.viresh.kumar@linaro.org>
References: <cover.1659596139.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a separate routine to allocate base and irq for a device as the
same code will be required for each device type.

Suggested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 38 ++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 1a3ac1646e94..2f64b9f0ebee 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -48,6 +48,24 @@ static uint32_t alloc_virtio_mmio_irq(libxl__gc *gc, uint32_t *virtio_mmio_irq)
     return irq;
 }
 
+static int alloc_virtio_mmio_params(libxl__gc *gc, uint64_t *base,
+                                    uint32_t *irq, uint64_t *virtio_mmio_base,
+                                    uint32_t *virtio_mmio_irq)
+{
+    *base = alloc_virtio_mmio_base(gc, virtio_mmio_base);
+    if (!*base)
+        return ERROR_FAIL;
+
+    *irq = alloc_virtio_mmio_irq(gc, virtio_mmio_irq);
+    if (!*irq)
+        return ERROR_FAIL;
+
+    LOG(DEBUG, "Allocate Virtio MMIO params: IRQ %u BASE 0x%"PRIx64, *irq,
+        *base);
+
+    return 0;
+}
+
 static const char *gicv_to_string(libxl_gic_version gic_version)
 {
     switch (gic_version) {
@@ -85,20 +103,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         libxl_device_disk *disk = &d_config->disks[i];
 
         if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
-            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
-            if (!disk->base)
-                return ERROR_FAIL;
+            int rc = alloc_virtio_mmio_params(gc, &disk->base, &disk->irq,
+                    &virtio_mmio_base, &virtio_mmio_irq);
+            if (rc)
+                return rc;
 
-            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
-            if (!disk->irq)
-                return ERROR_FAIL;
-
-            if (virtio_irq < disk->irq)
-                virtio_irq = disk->irq;
             virtio_enabled = true;
-
-            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
-                disk->vdev, disk->irq, disk->base);
         }
     }
 
@@ -107,8 +117,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
      * present, make sure that we allocate enough SPIs for them.
      * The resulting "nr_spis" needs to cover the highest possible SPI.
      */
-    if (virtio_enabled)
+    if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
+        virtio_irq = virtio_mmio_irq - 1;
         nr_spis = max(nr_spis, virtio_irq - 32 + 1);
+    }
 
     for (i = 0; i < d_config->b_info.num_irqs; i++) {
         uint32_t irq = d_config->b_info.irqs[i];
-- 
2.31.1.272.g89b43f80a514


