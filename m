Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6F0520D96
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 08:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325179.547658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIzg-0008WV-KS; Tue, 10 May 2022 06:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325179.547658; Tue, 10 May 2022 06:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIzg-0008QY-FU; Tue, 10 May 2022 06:05:12 +0000
Received: by outflank-mailman (input) for mailman id 325179;
 Tue, 10 May 2022 06:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+NA3=VS=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1noIze-0007ob-TK
 for xen-devel@lists.xen.org; Tue, 10 May 2022 06:05:11 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25223eee-d027-11ec-a406-831a346695d4;
 Tue, 10 May 2022 08:05:09 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so1176648pjb.3
 for <xen-devel@lists.xen.org>; Mon, 09 May 2022 23:05:09 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 g17-20020a170902d5d100b0015e8d4eb1f0sm1027055plh.58.2022.05.09.23.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 23:05:07 -0700 (PDT)
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
X-Inumbo-ID: 25223eee-d027-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=svVS82OvBdmvv7JLfSbwnD8mRf2Q0xw4MKyZG61zwPs=;
        b=bZHc71ib68Kyd06jqtULLoUCaA3zns/ci74fepqyPN3W8EsEXTQcdBKGX1HPQ1u1/h
         U7YfPdGh8YBaWTrGEEHDS/ma/YUWpv4Jv3+RKulsB9cWgKHacDoHGaSz6FwBKNVPjDj1
         AzuzYPvDkEe9YyCuSGzeh1Kx5PdBaO+zzQgXkphqf9xX2cVMr4Ea9OBMsBeuClFxup1k
         ESpZwGz+8FTsGWOV+VzjaWO0Czk6dA8ETlBi+1VaiMfQ/Hud/0tvof9yXgP7NuT/WIG4
         /j3FvDFe9t25WEr9yb1zgRBSeDd620fn9u6+UAkPS4yFqhZpGSqdB1U4r6/kEvbs2EgZ
         Ezuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=svVS82OvBdmvv7JLfSbwnD8mRf2Q0xw4MKyZG61zwPs=;
        b=nTzvYPlP0AWNuH2p/llEe97CdN6Dcdn+VSWW4Ht/0S/4gnOqFNbEOkun7igIFLULGq
         b/psYNC/2hjlXbgg8EV+y2Umx/dohdnIemhbEob84OEroILcC5tZk0pPbxEgoZ901PZQ
         MgLwmZaBXhDP66lu26LKQFBjpVT2A2yH7kHYanb1fcmnEH9hVmmtrDnzdizHnpZUSR4l
         3tT1kDV3hPxlxzsqNz8SWNsgULkoH6gvdep5/WwgUTa+JSEB2WAlF1qj2P50BJOc6br+
         9Rc9wie0ofjasgqvu1/5reoV03/v7wdPUU5B7S2qzWWvvgWeOwBkoKvu8CS8EhvpI9M0
         VuSg==
X-Gm-Message-State: AOAM532BLOLGrvtVJyriGc6F2Uk9R6XSkOTYnCPTwrYBT++xok+Q+TYP
	20Jq+iKTTtJKmJ2cdFnwGp67BGcvmL7cgA==
X-Google-Smtp-Source: ABdhPJw0NKJ4Q/0dkxs8PCIcoIpZRhB2dwZKfpWje1lHYFkWpSYYwaA1BNIRtzlezkm2oH3TFk6mBw==
X-Received: by 2002:a17:902:a981:b0:156:229d:6834 with SMTP id bh1-20020a170902a98100b00156229d6834mr18791093plb.128.1652162708233;
        Mon, 09 May 2022 23:05:08 -0700 (PDT)
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
Subject: [PATCH V2 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Date: Tue, 10 May 2022 11:34:48 +0530
Message-Id: <32fa4a77c76187f68b074ff1cc81d8de5f683638.1652162646.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1652162646.git.viresh.kumar@linaro.org>
References: <cover.1652162646.git.viresh.kumar@linaro.org>
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
index 37403a2cebb1..6b95ded82dc3 100644
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
@@ -85,25 +103,18 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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
 
-    if (virtio_enabled)
+    if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
+        virtio_irq = virtio_mmio_irq - 1;
         nr_spis += (virtio_irq - 32) + 1;
+        virtio_enabled = true;
+    }
 
     for (i = 0; i < d_config->b_info.num_irqs; i++) {
         uint32_t irq = d_config->b_info.irqs[i];
-- 
2.31.1.272.g89b43f80a514


