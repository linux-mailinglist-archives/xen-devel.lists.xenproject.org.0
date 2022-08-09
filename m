Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC27358D33C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 07:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382689.617711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtP-0006mJ-Ou; Tue, 09 Aug 2022 05:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382689.617711; Tue, 09 Aug 2022 05:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtP-0006jP-Kx; Tue, 09 Aug 2022 05:35:03 +0000
Received: by outflank-mailman (input) for mailman id 382689;
 Tue, 09 Aug 2022 05:35:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IoV=YN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oLHtN-0006BY-K0
 for xen-devel@lists.xen.org; Tue, 09 Aug 2022 05:35:01 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02a11967-17a5-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 07:35:00 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id pm17so10716126pjb.3
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 22:35:00 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 4-20020a170902c20400b0016c38eb1f3asm9721818pll.214.2022.08.08.22.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 22:34:58 -0700 (PDT)
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
X-Inumbo-ID: 02a11967-17a5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=aIzbIEzFpUUXj5cpYUTP2MCSxRElsGZiwM2/TXC0VsI=;
        b=L76+H2rgeLBrfAKpc3uKaEhG+DOu/3CqLUU8BTux4E7SMjcoi5+CMQdzLVgSO9H/T/
         RKV50FBWpE+Mt+QgOCq2TEJLHwfLYY70ipU+XCp2H+L03wdcaz30/nnOEepffQBxEBoy
         r0PacWYSPtTrE65G4b1Mihjyum+RojJw6pfJPO/iOpuHGWNAYvWBYN6V69vztqUO/wpr
         HUIyxstRzgNqWU/fBZx844Fnmjy2I7fxa4v7kZ28L/Q+rXRdVLXTUKiFoUdXcvw1FlG7
         ibRGsD1AMjApBJCRSNF1Jb17QE06iWpkOCb8Xr44GF3qjRs6XZkwxKSS2S/Hf3p1Nw7J
         U2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=aIzbIEzFpUUXj5cpYUTP2MCSxRElsGZiwM2/TXC0VsI=;
        b=10ua5QbvPLZbFrmHPYG2ckIBrn+QFSvUAAaEhBue0HOm9ezed+h/QbdOrXP/HuG/T6
         IUJvORMLQsaEfrwBnMqwgn8KxqjIpafEUXczCnV1EoQ/Zh2/8EFPd+cF628fnnybXq4E
         KVCbBTQLMvgIliCrDrdue2IbGtRdAjR9KaFDrOieL7urqLwET55tT8632A6QSrFHeYdb
         a5R9MCOPlftK9Cg7G9namp0nBvJNm76MjhX2cEqfr2+aYEFmKyinPz+dl8aDaJVOXuuI
         sg/U3+uc7Bt5MgQYLMg+VQZy6q9PKePRv68eGIfPxWifQdLMmHbO7tuaTYguCmMaeMzQ
         f2GA==
X-Gm-Message-State: ACgBeo18zJhMdDJo3lL6enE+yXSqFmQRYB+IGNpVbdRj890DOxgjeMhG
	A4ovuNRD9EQc8Di976qp3fJtIQaq2ni7uw==
X-Google-Smtp-Source: AA6agR41ANL+8QzX63pVGQ7WNHWYu0sjGYFKdhwiXDMFeKWjRLaY2tp+japlo0YYGG46K9sSKD9oOw==
X-Received: by 2002:a17:903:1110:b0:16b:6968:1d08 with SMTP id n16-20020a170903111000b0016b69681d08mr22008834plh.3.1660023299480;
        Mon, 08 Aug 2022 22:34:59 -0700 (PDT)
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
Subject: [PATCH V4 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Date: Tue,  9 Aug 2022 11:04:30 +0530
Message-Id: <9a382501b425f4248e071e93db7c213025f402e6.1660023094.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1660023094.git.viresh.kumar@linaro.org>
References: <cover.1660023094.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a separate routine to allocate base and irq for a device as the
same code will be required for each device type.

Suggested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 41 +++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 1a3ac1646e94..4a750852b671 100644
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
@@ -85,20 +103,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         libxl_device_disk *disk = &d_config->disks[i];
 
         if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
-            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
-            if (!disk->base)
-                return ERROR_FAIL;
-
-            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
-            if (!disk->irq)
-                return ERROR_FAIL;
-
-            if (virtio_irq < disk->irq)
-                virtio_irq = disk->irq;
-            virtio_enabled = true;
-
-            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
-                disk->vdev, disk->irq, disk->base);
+            int rc = alloc_virtio_mmio_params(gc, &disk->base, &disk->irq,
+                    &virtio_mmio_base, &virtio_mmio_irq);
+            if (rc)
+                return rc;
         }
     }
 
@@ -107,8 +115,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
      * present, make sure that we allocate enough SPIs for them.
      * The resulting "nr_spis" needs to cover the highest possible SPI.
      */
-    if (virtio_enabled)
+    if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
+        virtio_enabled = true;
+        virtio_irq = virtio_mmio_irq - 1;
         nr_spis = max(nr_spis, virtio_irq - 32 + 1);
+    }
 
     for (i = 0; i < d_config->b_info.num_irqs; i++) {
         uint32_t irq = d_config->b_info.irqs[i];
-- 
2.31.1.272.g89b43f80a514


