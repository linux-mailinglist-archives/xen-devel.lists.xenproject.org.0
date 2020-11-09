Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7980D2AB898
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22469.48810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dJ-00043s-53; Mon, 09 Nov 2020 12:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22469.48810; Mon, 09 Nov 2020 12:50:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dJ-00042f-0k; Mon, 09 Nov 2020 12:50:53 +0000
Received: by outflank-mailman (input) for mailman id 22469;
 Mon, 09 Nov 2020 12:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6dH-0003tf-GO
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:51 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a51ad763-8346-45f2-a425-f8c9c9eb7af3;
 Mon, 09 Nov 2020 12:50:38 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y25so9221562lja.9
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:38 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:36 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6dH-0003tf-GO
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:51 +0000
X-Inumbo-ID: a51ad763-8346-45f2-a425-f8c9c9eb7af3
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a51ad763-8346-45f2-a425-f8c9c9eb7af3;
	Mon, 09 Nov 2020 12:50:38 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y25so9221562lja.9
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7Mun79oNB4+e5ttsNU806SzMPrzXSy2ZLLighcxfMfY=;
        b=WWIUxIatMUUQ/JCfsQDdZYnmWvE8T2h2OJYWDZzrFG0esbosTsAYeB4Q+V8boBfWVh
         +qDaIT+FtaVwJz540oMHyEzAJazvA3r80XjsSxFlmi+VVHqSc6uwgYLsT4v88nlj6K+0
         dSs66fjRUduKWocG6OrWGyX28LuDGQcuX0uzIzb/Iq0lYHZzvuHBAK4fneo9aafA5e5q
         elPLqZjK0gViriEOHK6HHLTzIvf5JWKlsFUM5+IJGACKSA3WGiyu7/gTmz963wusTJ+p
         SU1D6b7iwR9IN4g6c4eLX6Cy2g6XsdcnqmzAH8rlK2CqqCYedBWywIMrVpBBP+gJ7Z6x
         lSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7Mun79oNB4+e5ttsNU806SzMPrzXSy2ZLLighcxfMfY=;
        b=D72ikbGeU1SsPiJgZF6MpbY+RmhTdxoeLVTJRRhzr/yAWpTWf3x7c1CtQH7+QKAHd4
         0+/WMp0QD+4xeMz6/eGxD9TXoznpiTVxk6cFnexU4saJjlkqHotS2lvEpzScdKf8wB1H
         tgjdSW2W3wjG2oGhpmmnoo5N73mhNmR6SMQgqTkT9BgHRUmF/UkzJgVAfWguoszGsbWA
         2ZwasWvEcB2ezIsNuzxaVe285cgCHxCT43XuO2BcgT9TJUK63CbCly2vxNoL9Wt80Sjh
         WF37nTSXT1QeaaWeCh0BeHzXoQSE/DNvNFtE2P5KAkscxHXIHX+s9+Nl9mwYqoGNoY+J
         QV4Q==
X-Gm-Message-State: AOAM531gVoEMnUBIX4QeZ3uFrKtwRFX8ygQ6Hpcb13smXxfs849wX5L6
	40VKD3/Py85Wra9V59u44MY=
X-Google-Smtp-Source: ABdhPJyQgmzrX5saLyJOhkpBy66jZinX+gIfrfFvi2zgYffNfrppcrxhlT7B3mFNp8jlF7tFrs9X4Q==
X-Received: by 2002:a05:651c:2db:: with SMTP id f27mr5734043ljo.394.1604926237424;
        Mon, 09 Nov 2020 04:50:37 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:36 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 03/10] xen/arm: Setup MMIO range trap handlers for hardware domain
Date: Mon,  9 Nov 2020 14:50:24 +0200
Message-Id: <20201109125031.26409-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

In order vPCI to work it needs all access to PCI configuration space
access to be synchronized among all entities, e.g. hardware domain and
guests. For that implement PCI host bridge specific callbacks to
propelry setup those ranges depending on host bridge implementation.

This callback is optional and may not be used by non-ECAM host bridges.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/pci/pci-host-common.c  | 16 ++++++++++++++++
 xen/arch/arm/pci/pci-host-generic.c | 15 +++++++++++++--
 xen/arch/arm/vpci.c                 | 16 +++++++++++++++-
 xen/include/asm-arm/pci.h           |  7 +++++++
 4 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index b011c7eff3c8..b81184d34980 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -219,6 +219,22 @@ struct device *pci_find_host_bridge_device(struct device *dev)
     }
     return dt_to_dev(bridge->dt_node);
 }
+
+int pci_host_iterate_bridges(struct domain *d,
+                             int (*clb)(struct domain *d,
+                                        struct pci_host_bridge *bridge))
+{
+    struct pci_host_bridge *bridge;
+    int err;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        err = clb(d, bridge);
+        if ( err )
+            return err;
+    }
+    return 0;
+}
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
index 54dd123e95c7..469df3da0116 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -85,12 +85,23 @@ int pci_ecam_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
     return 0;
 }
 
+static int pci_ecam_register_mmio_handler(struct domain *d,
+                                          struct pci_host_bridge *bridge,
+                                          const struct mmio_handler_ops *ops)
+{
+    struct pci_config_window *cfg = bridge->sysdata;
+
+    register_mmio_handler(d, ops, cfg->phys_addr, cfg->size, NULL);
+    return 0;
+}
+
 /* ECAM ops */
 struct pci_ecam_ops pci_generic_ecam_ops = {
     .bus_shift  = 20,
     .pci_ops    = {
-        .read       = pci_ecam_config_read,
-        .write      = pci_ecam_config_write,
+        .read                  = pci_ecam_config_read,
+        .write                 = pci_ecam_config_write,
+        .register_mmio_handler = pci_ecam_register_mmio_handler,
     }
 };
 
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 49e473ab0d10..2b9bf34c8fe6 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -80,11 +80,25 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
     .write = vpci_mmio_write,
 };
 
+static int vpci_setup_mmio_handler(struct domain *d,
+                                   struct pci_host_bridge *bridge)
+{
+    if ( bridge->ops->register_mmio_handler )
+        return bridge->ops->register_mmio_handler(d, bridge,
+                                                  &vpci_mmio_handler);
+    return 0;
+}
+
+
 int domain_vpci_init(struct domain *d)
 {
-    if ( !has_vpci(d) || is_hardware_domain(d) )
+    if ( !has_vpci(d) )
         return 0;
 
+    if ( is_hardware_domain(d) )
+        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
+
+    /* Guest domains use what is programmed in their device tree. */
     register_mmio_handler(d, &vpci_mmio_handler,
             GUEST_VPCI_ECAM_BASE,GUEST_VPCI_ECAM_SIZE,NULL);
 
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index ba23178f67ab..e3a02429b8d4 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -27,6 +27,7 @@
 #include <xen/pci.h>
 #include <xen/device_tree.h>
 #include <asm/device.h>
+#include <asm/mmio.h>
 
 #ifdef CONFIG_ARM_PCI
 
@@ -64,6 +65,9 @@ struct pci_ops {
                     uint32_t sbdf, int where, int size, u32 *val);
     int (*write)(struct pci_host_bridge *bridge,
                     uint32_t sbdf, int where, int size, u32 val);
+    int (*register_mmio_handler)(struct domain *d,
+                                 struct pci_host_bridge *bridge,
+                                 const struct mmio_handler_ops *ops);
 };
 
 /*
@@ -101,6 +105,9 @@ void pci_init(void);
 bool dt_pci_parse_bus_range(struct dt_device_node *dev,
                             struct pci_config_window *cfg);
 
+int pci_host_iterate_bridges(struct domain *d,
+                             int (*clb)(struct domain *d,
+                                        struct pci_host_bridge *bridge));
 #else   /*!CONFIG_ARM_PCI*/
 struct arch_pci_dev { };
 static inline void  pci_init(void) { }
-- 
2.17.1


