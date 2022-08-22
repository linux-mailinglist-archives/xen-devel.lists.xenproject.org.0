Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2FB59BC84
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 11:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391246.629008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3Wz-0001hW-R5; Mon, 22 Aug 2022 09:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391246.629008; Mon, 22 Aug 2022 09:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3Wz-0001eL-MW; Mon, 22 Aug 2022 09:15:37 +0000
Received: by outflank-mailman (input) for mailman id 391246;
 Mon, 22 Aug 2022 09:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J63M=Y2=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oQ3Wx-00016q-FC
 for xen-devel@lists.xen.org; Mon, 22 Aug 2022 09:15:35 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9f77b18-21fa-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 11:15:34 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id bh13so8853187pgb.4
 for <xen-devel@lists.xen.org>; Mon, 22 Aug 2022 02:15:34 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 o16-20020a170902d4d000b0016d3935eff0sm7900701plg.176.2022.08.22.02.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:15:32 -0700 (PDT)
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
X-Inumbo-ID: f9f77b18-21fa-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=UcAxz9zfTG02GukbiygV6fnm8goyBIBPPWW93ZdxHMQ=;
        b=TldwkdsMGwvA6V2GFaOyD9y+0FrzAg6yY/2gJqZce5kIhgjczzVXcElh2UDOv1Atk3
         gIxVBv3dQDY2WT0f7qPVAsuVdojSK5NbgEaV6whdWnvkA3uEphyFJnEl8x8LqrJJwIgX
         4HtsvC7glwEVNGGfR08M/k4KE3+r4AcmlUTYA6fpHgcCNYBunKWhT3rPd9prh69p4kkq
         S2YtPKJ/S2g6Eu4oW0AgzRaYJhg0+ImlC+GbD5F1EOBwubYCaey3m/hNzKqaDWqnjE9N
         +n5ZHei11iFDbKXScNfMnWWMb7gn2PajQOMmr9TU/CGYu0k+MEs19fhDKdI1D/smvmz8
         xDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=UcAxz9zfTG02GukbiygV6fnm8goyBIBPPWW93ZdxHMQ=;
        b=OePkplRCWmxswcYep7rdJVotvqQvF6/voe/MhUb24V92AdfnDbd9x0n7WwZT3Vyiqa
         Oh76yeWo0pANZYdzDH1B3j5EfM8xF64941bRO0t/EmJBp9evzmPgrME4hVVuBL0K/pWg
         fHKXndUegQ6ioKasUmZ7eip4d+SUfTlyP0Ec/9oK6rJ+tS4ItwRzN/74SB+yq/JWtEK6
         nSCXlOIyO5y3UnQxD58fzjUQN5u06WMm9FwnAtbuf48Gn+3CkNK3qbvHr0ashMYAM351
         2wgckpXGR4i8KOLfNCfDZE46rNI9c1T286ppmNzzq/SUUOaVK+6lO92EO58MadnamGdX
         zYOQ==
X-Gm-Message-State: ACgBeo0u2RGSr++8ayOGJJrhh47VxpBNuutSwXRDbjIAhO+SOaMdOa//
	t5nDs41a27VTl2biuuE32lF9dyW6zh6VXw==
X-Google-Smtp-Source: AA6agR6eCa4zwZYO7qhlhZOlzfct9HnLP0tBbItnUSzKUUFuFAvj0pO9PGRgdO7V+t4NLc4DHSnp/Q==
X-Received: by 2002:a62:6347:0:b0:531:c5a7:b209 with SMTP id x68-20020a626347000000b00531c5a7b209mr19918510pfb.60.1661159733234;
        Mon, 22 Aug 2022 02:15:33 -0700 (PDT)
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
Subject: [PATCH V5 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Date: Mon, 22 Aug 2022 14:45:15 +0530
Message-Id: <e07aa93a748525d81d6524c492347626ca7a362a.1661159474.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1661159474.git.viresh.kumar@linaro.org>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a separate routine to allocate base and irq for a device as the
same code will be required for each device type.

Suggested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 46 +++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 1a3ac1646e94..0e3051bac5e4 100644
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
-
-            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
-            if (!disk->irq)
-                return ERROR_FAIL;
+            int rc = alloc_virtio_mmio_params(gc, &disk->base, &disk->irq,
+                                              &virtio_mmio_base,
+                                              &virtio_mmio_irq);
 
-            if (virtio_irq < disk->irq)
-                virtio_irq = disk->irq;
-            virtio_enabled = true;
-
-            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
-                disk->vdev, disk->irq, disk->base);
+            if (rc)
+                return rc;
         }
     }
 
@@ -107,8 +117,16 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
      * present, make sure that we allocate enough SPIs for them.
      * The resulting "nr_spis" needs to cover the highest possible SPI.
      */
-    if (virtio_enabled)
+    if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
+        virtio_enabled = true;
+
+        /*
+         * Assumes that "virtio_mmio_irq" is the highest allocated irq, which is
+         * updated from alloc_virtio_mmio_irq() currently.
+         */
+        virtio_irq = virtio_mmio_irq - 1;
         nr_spis = max(nr_spis, virtio_irq - 32 + 1);
+    }
 
     for (i = 0; i < d_config->b_info.num_irqs; i++) {
         uint32_t irq = d_config->b_info.irqs[i];
-- 
2.31.1.272.g89b43f80a514


