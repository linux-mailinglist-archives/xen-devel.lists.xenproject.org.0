Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5790D23AC47
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:22:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2f6W-0008W8-Pb; Mon, 03 Aug 2020 18:22:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f6V-0008F4-7r
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:22:31 +0000
X-Inumbo-ID: 359da712-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 359da712-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:55 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w14so10874971ljj.4
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FmQeBTMaiyQz/Hd6vgyjkGjraUz7GZ+o5Z5LqiJNJDo=;
 b=gAWzKt2Cbi1NKv4UBav+vbo8LfDixp+Eap1dTPtwi2BMWPaf2jU4Rjoydyz7agqrr9
 +X6kk1zWdRLI6Wwn1U8IRrX2XwWY4awi9IqLlCRZPsI8lcKJqeHb9zfPJq5eOZtney6D
 17hNLeYak2BbiiZvuAwy6/k+DRZ50CV7KLH3G6tnwc498srQz0pF6HbbE50eT1K7CVS9
 jtituXwf2GEWFHkta829sxlrHqcIwj5DY2U3IF9qf8QF3ybtuvAWKIBa3pId7Xpem9jO
 Me2bjrfWwt1B2qAbtkA2Gzfs31yZXRhANkD3FnWfpiYpjWdPGJXs5XS9Jt5K5t1rg/QC
 TqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FmQeBTMaiyQz/Hd6vgyjkGjraUz7GZ+o5Z5LqiJNJDo=;
 b=YIIb4sSDldRLYrn3UP3EkqrHmXfCR1IcBlVTkY1j1Yj1sXT/Fp7Bdx+OB2mkiBadAA
 NUQl3r0t5wD8+2AdSbVbizy7DDExVWCVKUepPLC6yjCxhvq8ZzeTj53aPrYPXhXDLs2R
 41N0P4RWSujN3xTqVE1xBOxfn0y8VIb2CRBEE6DAJ6JaoImv7Sy4yQqXzvg8H/sA91oL
 1s3cqgOaIVlSmpDzeYxLvuOPeUGZgbJ8IY1LqJMnS5d2TeRzDFCxmmOh4UJnM1aUHXfa
 SJR/NiMgkpHsjhiOZAyl8XyDYD0xZyo936vmlo8gspw/bvxfQ/mBX29JiRdZWk+eX874
 eVlw==
X-Gm-Message-State: AOAM531KCGRPzOsvSMFSWVI4zg6Hq2PiK1DJKfZCilIeqeimDTzBMSJ4
 KVtxZ9qkPZ/Cl15xqp4LFNZCHfFVaTs=
X-Google-Smtp-Source: ABdhPJyPqjNSkPtYdYQNj5MmLgmHtV9oiYCjfWDQdqSaYeTCaiAqb1M+7uHa6BFqYFLlZF2nCrz+Vg==
X-Received: by 2002:a2e:3c16:: with SMTP id j22mr8489386lja.92.1596478914266; 
 Mon, 03 Aug 2020 11:21:54 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:53 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 09/12] libxl: Handle virtio-mmio irq in more correct way
Date: Mon,  3 Aug 2020 21:21:25 +0300
Message-Id: <1596478888-23030-10-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch makes possible to use device passthrough again.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 tools/libxl/libxl_arm.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 620b499..4f748e3 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -9,6 +9,10 @@
 #include <assert.h>
 #include <xen/device_tree_defs.h>
 
+#define GUEST_VIRTIO_MMIO_BASE  xen_mk_ullong(0x02000000)
+#define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)
+#define GUEST_VIRTIO_MMIO_SPI   33
+
 static const char *gicv_to_string(libxl_gic_version gic_version)
 {
     switch (gic_version) {
@@ -27,8 +31,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     uint32_t nr_spis = 0;
     unsigned int i;
-    uint32_t vuart_irq;
-    bool vuart_enabled = false;
+    uint32_t vuart_irq, virtio_irq;
+    bool vuart_enabled = false, virtio_enabled = false;
 
     /*
      * If pl011 vuart is enabled then increment the nr_spis to allow allocation
@@ -40,6 +44,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         vuart_enabled = true;
     }
 
+    /*
+     * XXX: Handle properly virtio
+     * A proper solution would be the toolstack to allocate the interrupts
+     * used by each virtio backend and let the backend now which one is used
+     */
+    if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
+        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
+        virtio_irq = GUEST_VIRTIO_MMIO_SPI;
+        virtio_enabled = true;
+    }
+
     for (i = 0; i < d_config->b_info.num_irqs; i++) {
         uint32_t irq = d_config->b_info.irqs[i];
         uint32_t spi;
@@ -59,6 +74,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return ERROR_FAIL;
         }
 
+        /* The same check as for vpl011 */
+        if (virtio_enabled && irq == virtio_irq) {
+            LOG(ERROR, "Physical IRQ %u conflicting with virtio SPI\n", irq);
+            return ERROR_FAIL;
+        }
+
         if (irq < 32)
             continue;
 
@@ -68,10 +89,6 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             nr_spis = spi + 1;
     }
 
-
-    /* XXX: Handle properly virtio */
-    nr_spis = 1;
-
     LOG(DEBUG, "Configure the domain");
 
     config->arch.nr_spis = nr_spis;
@@ -663,10 +680,6 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
-#define GUEST_VIRTIO_MMIO_BASE  xen_mk_ullong(0x02000000)
-#define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)
-#define GUEST_VIRTIO_MMIO_SPI   33
-
 static int make_virtio_mmio_node(libxl__gc *gc, void *fdt)
 {
     int res;
-- 
2.7.4


