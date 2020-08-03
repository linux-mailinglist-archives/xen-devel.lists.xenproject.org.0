Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5F23AC40
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:22:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2f6H-0008Mg-Sj; Mon, 03 Aug 2020 18:22:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f6G-0008F4-7C
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:22:16 +0000
X-Inumbo-ID: 33932a00-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33932a00-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:52 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x24so3651785lfe.11
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KJwl2Gf8Kc5S6/JKnP2lqwji4gRYsqHMXGwGJUsp3PA=;
 b=HYJEXbGiDpX09e/7tZjQdogZIcJH4gMNC09XuyfFLcrQThKzJ7c6ZFJCl2riNdhQHn
 N0zLR59eCnQ48byQmeEticc8+PAD0yhFJJGO6IXTqOkC/kFxBGf8zuKAGiT9BDnofh+L
 Ze/ZNeonVO5rP7j6/vDr6T5/wJd35ZREnwHf6AWZD8kDX9FS3rZoOyFbtM+3BM/4SBxi
 5lottYR/7hNls0wK9wO/RtKoCc5JrHbiULIfTo72r1rS3n+lXW+BsCKRtGINM3emRq1K
 +nJ7h1sWOFTi+IBjAeZoQ4sh+1LGtWIN6fXQgH1k9sIoCzqBO0FPRMY9X4ll1/RNWz82
 nKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KJwl2Gf8Kc5S6/JKnP2lqwji4gRYsqHMXGwGJUsp3PA=;
 b=IUFu/dTEY5LkOYxAQx0EFwdVtskyv2cSXpFwqizsU1zL5E6P78BAbuJQbsgfTUSRFr
 gOjsGw+pHfx7d2WuogdYV2TDW9LmJaNGSUKUtDrkurV7Ft03H0qMbwk5iNT6iDthQui1
 pVkadhh1YsDIks1bi+f1F/N/k5gf8RT8uNMSx4UjfX+D/TgiMrRsk38mLNAMoc3G2tJZ
 W+vSW6zWKa+a8Y2YX4/nRne7jOfDKW+hLEP96kD0tZyskatcU+pOpm/SJ5he77Xhg6Bj
 PfDpJQGQnCYpMUAzgmVZwon1rdu371NZx1eF5smC7571LhtXRJ3bNtquxGV8XdzwYVKz
 NvZw==
X-Gm-Message-State: AOAM531mY97voCksnP1D1/ZhtYb/+6L2vGh28gX24uUG0Ek/YH1a96Ar
 fF6/7/ReBJ7I8ANEcTcsyJRVU3KDkTg=
X-Google-Smtp-Source: ABdhPJz/K3XOJPdOW03K8F5ra2FDgmd10m+rY5j09JeC8qbFsgW0FOwPYAJfoEjxaSi+C7e6N/cx0w==
X-Received: by 2002:ac2:4c33:: with SMTP id u19mr9422767lfq.154.1596478910795; 
 Mon, 03 Aug 2020 11:21:50 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:50 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 06/12] libxl: Introduce basic virtio-mmio support on Arm
Date: Mon,  3 Aug 2020 21:21:22 +0300
Message-Id: <1596478888-23030-7-git-send-email-olekstysh@gmail.com>
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
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch creates specific device node in the Guest device-tree
with allocated MMIO range and SPI interrupt if specific 'virtio'
property is present in domain config.

Please note, this patch breaks device passthrough use-case which
will be fixed in one of the follow-up patches.

Please note, this is a split/cleanup of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 tools/libxl/libxl_arm.c     | 39 +++++++++++++++++++++++++++++++++++++++
 tools/libxl/libxl_types.idl |  1 +
 tools/xl/xl_parse.c         |  1 +
 3 files changed, 41 insertions(+)

diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 34f8a29..620b499 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -68,6 +68,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             nr_spis = spi + 1;
     }
 
+
+    /* XXX: Handle properly virtio */
+    nr_spis = 1;
+
     LOG(DEBUG, "Configure the domain");
 
     config->arch.nr_spis = nr_spis;
@@ -659,6 +663,37 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+#define GUEST_VIRTIO_MMIO_BASE  xen_mk_ullong(0x02000000)
+#define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)
+#define GUEST_VIRTIO_MMIO_SPI   33
+
+static int make_virtio_mmio_node(libxl__gc *gc, void *fdt)
+{
+    int res;
+    gic_interrupt intr;
+
+    /* XXX: Add address in the node name */
+    res = fdt_begin_node(fdt, "virtio");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "virtio,mmio");
+    if (res) return res;
+
+    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                            1, GUEST_VIRTIO_MMIO_BASE, GUEST_VIRTIO_MMIO_SIZE);
+    if (res) return res;
+
+    set_interrupt(intr, GUEST_VIRTIO_MMIO_SPI, 0xf, DT_IRQ_TYPE_EDGE_RISING);
+    res = fdt_property_interrupts(gc, fdt, &intr, 1);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -962,6 +997,9 @@ next_resize:
         if (info->tee == LIBXL_TEE_TYPE_OPTEE)
             FDT( make_optee_node(gc, fdt) );
 
+        if (libxl_defbool_val(info->arch_arm.virtio))
+            FDT( make_virtio_mmio_node(gc, fdt) );
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
@@ -1179,6 +1217,7 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
 {
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
+    libxl_defbool_setdefault(&b_info->arch_arm.virtio, false);
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
         return;
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 9d3f05f..b054bf9 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -639,6 +639,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
+                               ("virtio", libxl_defbool),
                                ("vuart", libxl_vuart_type),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 61b4ef7..b8306aa 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2579,6 +2579,7 @@ skip_usbdev:
     }
 
     xlu_cfg_get_defbool(config, "dm_restrict", &b_info->dm_restrict, 0);
+    xlu_cfg_get_defbool(config, "virtio", &b_info->arch_arm.virtio, 0);
 
     if (c_info->type == LIBXL_DOMAIN_TYPE_HVM) {
         if (!xlu_cfg_get_string (config, "vga", &buf, 0)) {
-- 
2.7.4


