Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC713FFC1C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177865.323647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4ek-0002lD-LK; Fri, 03 Sep 2021 08:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177865.323647; Fri, 03 Sep 2021 08:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4ek-0002hH-Ge; Fri, 03 Sep 2021 08:34:38 +0000
Received: by outflank-mailman (input) for mailman id 177865;
 Fri, 03 Sep 2021 08:34:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4ei-0006kQ-E5
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:36 +0000
Received: from mail-ej1-x630.google.com (unknown [2a00:1450:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bb67d0b-f39f-4b34-9864-f3691fc81bea;
 Fri, 03 Sep 2021 08:34:00 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id mf2so10485515ejb.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:34:00 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:59 -0700 (PDT)
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
X-Inumbo-ID: 3bb67d0b-f39f-4b34-9864-f3691fc81bea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/GHtMwVtwcasyb8hly1Zcy56jKyqF6v6oGi9z4wXBlU=;
        b=mQ3lDyAu7ulppaS1JJy+SWOFwu+RvtpP1zI3cgCUuBtIuinOwyvLCIG9MxewYdI7wb
         dV/QNQp9gaBilxa1L3saoMIiNAKa4GjxcPpTanA20hGKCzz5QpJAiNHS/6eiO+aEby+f
         l7w6stPig8p506HVXOzw2BgAPYcOwkZ+OD0tZuyYui/AU5k+tg6rbLKS49n75aRhxpxL
         FFVTa9P9ikuYd6dbk2C9zfDC/kBVTCpJCMhTRepxDPdAUW12LYD4QcV3R1ooZ2wQyzED
         /H+subTI7EzgC9RApqZqRkYcedmNM4JZlibRP0m4S+GaRm+tZmLehtpvYwPU05nhGVEk
         4LLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/GHtMwVtwcasyb8hly1Zcy56jKyqF6v6oGi9z4wXBlU=;
        b=O4lfH5P6mjh536gva7arPTU9Frb1mcd1r2huTLL9NwRMe4CMVErcHhWA1YyUz1Gn8F
         tWfkw4jaYubWiEFKwx6qq7PfIWMfh3MD4b+gmG5TbpkKLeHzxcAHMD8Elrjo7PNIUkrf
         H5cMpYSQSQfTGWG2V2unKdAlXz2FgOFAj6TtXZQol9SqCt3ULYAbvE/PYzawRwWMsMvj
         nrO9aLXEqip9GkQlLsUeqsJ7kojKilNOv3gnZ+7ULWhIniUF9ewwtlG0kNAqCJUjT7Yf
         c7rucReZ9HOS56umrG5LTZqKfPlceVAGC5FhP7KHWZidf1iVy9oGKU4S3aYtvP7iNLvJ
         02+w==
X-Gm-Message-State: AOAM532JkJfQzvOgGj6QtsslnH1vxGZEAnffzrJ39RlJGKs5sgjk4mFU
	wGuCSbTMJ19X/nPsKqJSSQtMf6X5OsU=
X-Google-Smtp-Source: ABdhPJzkdXq4/oqy7sAR6jAHLZTgcQFNU12ssgRybTwH6NU5CgLqCQqqVvZtmbSCS+UTenNgcBH03A==
X-Received: by 2002:a17:906:2a8e:: with SMTP id l14mr2909109eje.321.1630658039681;
        Fri, 03 Sep 2021 01:33:59 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for hardware domain
Date: Fri,  3 Sep 2021 11:33:45 +0300
Message-Id: <20210903083347.131786-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

In order vPCI to work it needs all access to PCI configuration space
(ECAM) to be synchronized among all entities, e.g. hardware domain and
guests. For that implement PCI host bridge specific callbacks to
properly setup those ranges depending on particular host bridge
implementation.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/pci/ecam.c            | 11 +++++++++++
 xen/arch/arm/pci/pci-host-common.c | 16 ++++++++++++++++
 xen/arch/arm/vpci.c                | 13 +++++++++++++
 xen/include/asm-arm/pci.h          |  8 ++++++++
 4 files changed, 48 insertions(+)

diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 91c691b41fdf..92ecb2e0762b 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -42,6 +42,16 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
     return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + where;
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
 const struct pci_ecam_ops pci_generic_ecam_ops = {
     .bus_shift  = 20,
@@ -49,6 +59,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
         .map_bus                = pci_ecam_map_bus,
         .read                   = pci_generic_config_read,
         .write                  = pci_generic_config_write,
+        .register_mmio_handler  = pci_ecam_register_mmio_handler,
     }
 };
 
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index d2fef5476b8e..a89112bfbb7c 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -318,6 +318,22 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
     }
     return bridge->dt_node;
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
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index da8b1ca13c07..258134292458 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -74,11 +74,24 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
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
 int domain_vpci_init(struct domain *d)
 {
     if ( !has_vpci(d) )
         return 0;
 
+    if ( is_hardware_domain(d) )
+        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
+
+    /* Guest domains use what is programmed in their device tree. */
     register_mmio_handler(d, &vpci_mmio_handler,
                           GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
 
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 7dc4c8dc9026..2c7c7649e00f 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -17,6 +17,8 @@
 #ifndef __ARM_PCI_H__
 #define __ARM_PCI_H__
 
+#include <asm/mmio.h>
+
 #ifdef CONFIG_HAS_PCI
 
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
@@ -77,6 +79,9 @@ struct pci_ops {
                 uint32_t reg, uint32_t len, uint32_t *value);
     int (*write)(struct pci_host_bridge *bridge, uint32_t sbdf,
                  uint32_t reg, uint32_t len, uint32_t value);
+    int (*register_mmio_handler)(struct domain *d,
+                                 struct pci_host_bridge *bridge,
+                                 const struct mmio_handler_ops *ops);
 };
 
 /*
@@ -107,6 +112,9 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
                                 uint16_t *segment);
 struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
 
+int pci_host_iterate_bridges(struct domain *d,
+                             int (*clb)(struct domain *d,
+                                        struct pci_host_bridge *bridge));
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
-- 
2.25.1


