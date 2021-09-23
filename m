Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F832415F37
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 15:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194209.346022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOSn-00049w-Mv; Thu, 23 Sep 2021 13:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194209.346022; Thu, 23 Sep 2021 13:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOSn-00047Z-F9; Thu, 23 Sep 2021 13:08:33 +0000
Received: by outflank-mailman (input) for mailman id 194209;
 Thu, 23 Sep 2021 13:08:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOI4-0004it-89
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:57:28 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1ab318b-7c38-43f1-8007-8693397c9763;
 Thu, 23 Sep 2021 12:55:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i25so26496283lfg.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:17 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:15 -0700 (PDT)
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
X-Inumbo-ID: c1ab318b-7c38-43f1-8007-8693397c9763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XlpFRu8hRrvPpjMFenpSAJbBdeavkULfWEH3e9kj/3o=;
        b=pn/1WK9cTRCVMT8S8N+kHcScv8SVfp4WAmQl55y/V20VbgiCkjI6Mk421HuVf6HD5d
         gDj6lasHPMcFqrunqkhsT24D1oJD0PfKOWmQLaRUOyNed5XAR7hMxyJZ/puHpCBQKzlq
         GeA2LA9d28oc5bmqWILcBA1L3xPM08dTwe5eVd/3dhpR6mLVE9XbtOzCp18JDAg19kK1
         MSTJNsM0HppMoi6zI5afgpVAVQlaOc97sFuV7yj5jvHo+w6X6PoZrUhXvz6jZn30jTAq
         PrhFFr4qfbF33EQv2Xff6GNBP7lYEX2WiZq1luKuv6c9ezife0E9U3tQnXqFF0k7uy+G
         dwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XlpFRu8hRrvPpjMFenpSAJbBdeavkULfWEH3e9kj/3o=;
        b=yNttErMUSD8q+Gz2bHDy7TpdMhaYjVpufRncBVD7FfZN9qlUsfLeOAUg46bYOb3Jcw
         Mh2CyJwL2mAVahntilEtfs/oMrkjbC/iKBU+ymTFgO7oznIEGwuUEropsA7qFkow/dnF
         4mrYIEsAzQpKK2hjaDFroPbqT1K2yWI2MlQEDtnazlTpioLDuYAnvUm5QT6w0Og8i3DR
         9vAGuQgU9ZU6QrKhTlIYFjpJ/GUroR7vBFUGNH/pFLN3k7cCNj7aOhk+jj/jh49qyMVc
         +am2ZBN7MG6Ku08+BZb1gSF+4INDd5QX8lfz/Qo/4dXt4KBWzhpgd5PIH7nr49E9MRxe
         /u2w==
X-Gm-Message-State: AOAM530VvNIpAoQJabylMuoyRopAMu5aZ0RoegxAQDLf9p2EyhGoiD1k
	ThFQ7IZWx25pyeHg3rUsqlTl+ixkQl0mpg==
X-Google-Smtp-Source: ABdhPJx2iIC0KBtVCRSDDJlP12bf3jCvWEtBjbBIXUe+n2z2VKx+YKSykuDGyFp3BrRnSXWUp8dwoA==
X-Received: by 2002:a05:6512:1151:: with SMTP id m17mr4030772lfg.144.1632401716421;
        Thu, 23 Sep 2021 05:55:16 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for guests
Date: Thu, 23 Sep 2021 15:55:01 +0300
Message-Id: <20210923125501.234252-12-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v2
---
 xen/arch/arm/domain.c         |  1 +
 xen/arch/arm/vpci.c           | 87 +++++++++++++++++++++++++++++++----
 xen/arch/arm/vpci.h           |  3 ++
 xen/drivers/passthrough/pci.c | 25 ++++++++++
 xen/include/asm-arm/pci.h     |  1 +
 xen/include/xen/pci.h         |  1 +
 xen/include/xen/sched.h       |  2 +
 7 files changed, 111 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index c7b25bc70439..c0ad6ad682d2 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -797,6 +797,7 @@ void arch_domain_destroy(struct domain *d)
                        get_order_from_bytes(d->arch.efi_acpi_len));
 #endif
     domain_io_free(d);
+    domain_vpci_free(d);
 }
 
 void arch_domain_shutdown(struct domain *d)
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 14947e975d69..012f958960d1 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -17,6 +17,14 @@
 
 #define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
 
+struct vpci_mmio_priv {
+    /*
+     * Set to true if the MMIO handlers were set up for the emulated
+     * ECAM host PCI bridge.
+     */
+    bool is_virt_ecam;
+};
+
 /* Do some sanity checks. */
 static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
 {
@@ -38,6 +46,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     pci_sbdf_t sbdf;
     unsigned long data = ~0UL;
     unsigned int size = 1U << info->dabt.size;
+    struct vpci_mmio_priv *priv = (struct vpci_mmio_priv *)p;
 
     sbdf.sbdf = MMCFG_BDF(info->gpa);
     reg = REGISTER_OFFSET(info->gpa);
@@ -45,6 +54,13 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     if ( !vpci_mmio_access_allowed(reg, size) )
         return 0;
 
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v, &sbdf) )
+            return 1;
+
     data = vpci_read(sbdf, reg, min(4u, size));
     if ( size == 8 )
         data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
@@ -61,6 +77,7 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
     pci_sbdf_t sbdf;
     unsigned long data = r;
     unsigned int size = 1U << info->dabt.size;
+    struct vpci_mmio_priv *priv = (struct vpci_mmio_priv *)p;
 
     sbdf.sbdf = MMCFG_BDF(info->gpa);
     reg = REGISTER_OFFSET(info->gpa);
@@ -68,6 +85,13 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
     if ( !vpci_mmio_access_allowed(reg, size) )
         return 0;
 
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v, &sbdf) )
+            return 1;
+
     vpci_write(sbdf, reg, min(4u, size), data);
     if ( size == 8 )
         vpci_write(sbdf, reg + 4, 4, data >> 32);
@@ -80,13 +104,48 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
     .write = vpci_mmio_write,
 };
 
+/*
+ * There are three  originators for the PCI configuration space access:
+ * 1. The domain that owns physical host bridge: MMIO handlers are
+ *    there so we can update vPCI register handlers with the values
+ *    written by the hardware domain, e.g. physical view of the registers/
+ *    configuration space.
+ * 2. Guest access to the passed through PCI devices: we need to properly
+ *    map virtual bus topology to the physical one, e.g. pass the configuration
+ *    space access to the corresponding physical devices.
+ * 3. Emulated host PCI bridge access. It doesn't exist in the physical
+ *    topology, e.g. it can't be mapped to some physical host bridge.
+ *    So, all access to the host bridge itself needs to be trapped and
+ *    emulated.
+ */
 static int vpci_setup_mmio_handler(struct domain *d,
                                    struct pci_host_bridge *bridge)
 {
-    struct pci_config_window *cfg = bridge->cfg;
+    struct vpci_mmio_priv *priv;
+
+    priv = xzalloc(struct vpci_mmio_priv);
+    if ( !priv )
+        return -ENOMEM;
+
+    priv->is_virt_ecam = !is_hardware_domain(d);
 
-    register_mmio_handler(d, &vpci_mmio_handler,
-                          cfg->phys_addr, cfg->size, NULL);
+    if ( is_hardware_domain(d) )
+    {
+        struct pci_config_window *cfg = bridge->cfg;
+
+        bridge->mmio_priv = priv;
+        register_mmio_handler(d, &vpci_mmio_handler,
+                              cfg->phys_addr, cfg->size,
+                              priv);
+    }
+    else
+    {
+        d->vpci_mmio_priv = priv;
+        /* Guest domains use what is programmed in their device tree. */
+        register_mmio_handler(d, &vpci_mmio_handler,
+                              GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE,
+                              priv);
+    }
     return 0;
 }
 
@@ -95,13 +154,16 @@ int domain_vpci_init(struct domain *d)
     if ( !has_vpci(d) )
         return 0;
 
-    if ( is_hardware_domain(d) )
-        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
-
-    /* Guest domains use what is programmed in their device tree. */
-    register_mmio_handler(d, &vpci_mmio_handler,
-                          GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
+    return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
+}
 
+static int domain_vpci_free_cb(struct domain *d,
+                               struct pci_host_bridge *bridge)
+{
+    if ( is_hardware_domain(d) )
+        XFREE(bridge->mmio_priv);
+    else
+        XFREE(d->vpci_mmio_priv);
     return 0;
 }
 
@@ -124,6 +186,13 @@ int domain_vpci_get_num_mmio_handlers(struct domain *d)
     return count;
 }
 
+void domain_vpci_free(struct domain *d)
+{
+    if ( !has_vpci(d) )
+        return;
+
+    pci_host_iterate_bridges(d, domain_vpci_free_cb);
+}
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
index 27a2b069abd2..38e5a28c0d95 100644
--- a/xen/arch/arm/vpci.h
+++ b/xen/arch/arm/vpci.h
@@ -18,6 +18,7 @@
 #ifdef CONFIG_HAS_VPCI
 int domain_vpci_init(struct domain *d);
 int domain_vpci_get_num_mmio_handlers(struct domain *d);
+void domain_vpci_free(struct domain *d);
 #else
 static inline int domain_vpci_init(struct domain *d)
 {
@@ -28,6 +29,8 @@ static inline int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
     return 0;
 }
+
+static inline void domain_vpci_free(struct domain *d) { }
 #endif
 
 #endif /* __ARCH_ARM_VPCI_H__ */
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 4552ace855e0..579c6947cc35 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -890,6 +890,31 @@ int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
     return 0;
 }
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool pci_translate_virtual_device(struct vcpu *v, pci_sbdf_t *sbdf)
+{
+    struct domain *d = v->domain;
+    struct vpci_dev *vdev;
+    bool found = false;
+
+    pcidevs_lock();
+    list_for_each_entry ( vdev, &d->vdev_list, list )
+    {
+        if ( vdev->sbdf.sbdf == sbdf->sbdf )
+        {
+            /* Replace virtual SBDF with the physical one. */
+            *sbdf = vdev->pdev->sbdf;
+            found = true;
+            break;
+        }
+    }
+    pcidevs_unlock();
+    return found;
+}
+
 /* Caller should hold the pcidevs_lock */
 static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
                            uint8_t devfn)
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index b81f66e813ef..983a63be7572 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -72,6 +72,7 @@ struct pci_host_bridge {
     struct pci_config_window* cfg;   /* Pointer to the bridge config window */
     void *sysdata;                   /* Pointer to the config space window*/
     const struct pci_ops *ops;
+    void *mmio_priv;                 /* MMIO handler's private data. */
 };
 
 struct pci_ops {
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 35ae1d093921..0017de19e7c8 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -191,6 +191,7 @@ struct pci_dev *pci_get_real_pdev(int seg, int bus, int devfn);
 struct pci_dev *pci_get_pdev_by_domain(const struct domain *, int seg,
                                        int bus, int devfn);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
+bool pci_translate_virtual_device(struct vcpu *v, pci_sbdf_t *sbdf);
 
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
 uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index d304c7ebe766..0626820545cc 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -450,6 +450,8 @@ struct domain
      * to assign a unique SBDF to a passed through virtual PCI device.
      */
     int vpci_dev_next;
+    /* Virtual PCI MMIO handler's private data. */
+    void *vpci_mmio_priv;
 #endif
 
 #ifdef CONFIG_HAS_PASSTHROUGH
-- 
2.25.1


