Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FCD5B17C1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 10:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402880.644823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDHo-0004Ma-MN; Thu, 08 Sep 2022 08:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402880.644823; Thu, 08 Sep 2022 08:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDHo-0004Ic-HP; Thu, 08 Sep 2022 08:53:24 +0000
Received: by outflank-mailman (input) for mailman id 402880;
 Thu, 08 Sep 2022 08:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDMa=ZL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oWDHn-0004Hp-5v
 for xen-devel@lists.xen.org; Thu, 08 Sep 2022 08:53:23 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0356a2b-2f53-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 10:53:22 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id b21so4255078plz.7
 for <xen-devel@lists.xen.org>; Thu, 08 Sep 2022 01:53:21 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 h186-20020a62dec3000000b00536b67c6a80sm14202330pfg.109.2022.09.08.01.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:53:19 -0700 (PDT)
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
X-Inumbo-ID: b0356a2b-2f53-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=g8uTdefvk9Re34ta3Hpj2EM7Z0M3BKhJL7lQL/PEL2M=;
        b=mBtM7uvNiEiMQLI2MLWBZ6JSOiFTqkssUfJyR7Lxq52+GS4fT+MsWyp1FiV4D9xh7r
         rtUo196+JZzmyWgL9K/iXKZWKEwh3mW0D+ScWCax7w2DL9kPOUYANXRiaGa1y0+UkvS9
         l2OUxIcSpjj4lAUegWK5xEbr01sr4ytlgnTKin8q1FLQDu3YpYbbs00fylMajKkB+FbA
         KzhXbrrK06bJmmxx7fWmv8y9SNGakoUIvwYs6XaHiLV2pUXsIhL6Dra+0zF0sbP+WLHm
         bSuiGkRZ2caIfvwA8yGlpzXAWjwF1oRClkh15Oh6MFFlOIsfCSHUMAdM3qY31yn9hdvT
         mhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=g8uTdefvk9Re34ta3Hpj2EM7Z0M3BKhJL7lQL/PEL2M=;
        b=ZhsyVVtnU1tjZXeTO4QpBxDhj1aN+WnzMvm/bc5JO4AWtyRVKmViyCHuCzyZHcT6ta
         aDQ9ilEgcxymkUCkTVceOgU+0d9x0M8Mx0kiK61BdO0G7V7zm7mkRv9eldQ9Ac7HjbyG
         VXFfL2eJgzimG9IClZRBsfedQ8Jb2pXY09M/lK2VhLeVBrlABayxWljCzNEQSxczoTo2
         zkauHsGnMDamqixHuj5g1I26eBTko33PXgVESpJmwXMNqKvEk8R/accs5TosmBVg0H+5
         EhL4zxgyAkNj2iBFCe6ffH/XZQl6MbF5pjiKQmZMQ2+aj0SX0ma2u97j/FHFoLDYZt45
         4RGw==
X-Gm-Message-State: ACgBeo2Z4U82SEu2F56Ebsx+qWXqcg5WcVW5Cmtm83OP2q05hxtkUac8
	LbXACpopS+dH/6p5RxD/FaBPid2sk2HcPw==
X-Google-Smtp-Source: AA6agR7ySj8B3HLO3ogrPbMnT+iVySyqolRFoWBUwcMlzqYCix0W79Ex8+UATRIvXkt438fUFUgeFA==
X-Received: by 2002:a17:90a:13c8:b0:200:17ca:f183 with SMTP id s8-20020a17090a13c800b0020017caf183mr3010705pjf.104.1662627199819;
        Thu, 08 Sep 2022 01:53:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V6 1/3] libxl: arm: Create alloc_virtio_mmio_params()
Date: Thu,  8 Sep 2022 14:22:59 +0530
Message-Id: <fa118965422d6954f9cbf95ffd8e442fcd6702a7.1662626550.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1662626550.git.viresh.kumar@linaro.org>
References: <cover.1662626550.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare for adding support for more device types, create a
separate routine to allocate base and irq for a device as the same code
will be required for other device types too.

Also move updates to virtio_irq and virtio_enabled out of the disk
device specific block, as they will depend on other device types too.

Suggested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 47 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 1a3ac1646e94..cc30ba124918 100644
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
@@ -70,6 +88,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     bool vuart_enabled = false, virtio_enabled = false;
     uint64_t virtio_mmio_base = GUEST_VIRTIO_MMIO_BASE;
     uint32_t virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
+    int rc;
 
     /*
      * If pl011 vuart is enabled then increment the nr_spis to allow allocation
@@ -85,20 +104,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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
+            rc = alloc_virtio_mmio_params(gc, &disk->base, &disk->irq,
+                                          &virtio_mmio_base,
+                                          &virtio_mmio_irq);
 
-            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
-                disk->vdev, disk->irq, disk->base);
+            if (rc)
+                return rc;
         }
     }
 
@@ -107,8 +118,16 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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


