Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7C441D4E4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199534.353705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqwE-0007H3-2k; Thu, 30 Sep 2021 07:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199534.353705; Thu, 30 Sep 2021 07:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqwD-0007FD-Vc; Thu, 30 Sep 2021 07:57:05 +0000
Received: by outflank-mailman (input) for mailman id 199534;
 Thu, 30 Sep 2021 07:57:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqsm-00017f-6u
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:53:32 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbd70223-3b19-4d81-ba12-e4167578e2fc;
 Thu, 30 Sep 2021 07:52:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y26so21641792lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:37 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:36 -0700 (PDT)
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
X-Inumbo-ID: dbd70223-3b19-4d81-ba12-e4167578e2fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXLr0ePaWCVb8hGG2KFBTiGRR67U58CE46v0AcmCx0Q=;
        b=oO3fIj/xL0UQThCgy+wTmcU6bDceKmLX8Qzv6Apktl1039A22n7iyzhM4ILHZQEk+b
         3U8aKwZeuanr3uJ16QoBVuY6pkBoOkibx83X/0uFmy9zb3E3MZIwJG6XgDJ4ZJVGV/Bz
         FSDqAYzRqJlZoEtw0kluwX3tuJZyRpGFEZi3GCuGqMYZHkmeZbKAsETl1r6hJ76UYDgo
         nUSBxwnxwpko//NSxwLtc5bp8fA2gnmOkLNmjRhBcwRQuFOzTZdSmUEMNYonZa4nPcSy
         VFRCpwji+OY4ubtBrAqGLp1523Q0c8VZ1KwIMe/C43Z/VNDuT3b06DpD86EOVul+VWeZ
         6GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXLr0ePaWCVb8hGG2KFBTiGRR67U58CE46v0AcmCx0Q=;
        b=0zNYfrgLZnZGtK+CWikRoPGaA3s9rK5JuQRgRKeJONfxrEgwyS+uBpp3GeoekkW7Sj
         JWYwcJJR/yMRftbhEPfxqTZdLckDoz4WdI/sCV/xy81nYLzuy4+x1m847NyeVLgvpchH
         mMQDqSt5z6dO9i8xY/yGT/gwDT+rcbT+hVt1fceiuwM6QYyHcShKBHy/5X8Z0h1k5U8b
         yJnsgAYOL96tGHL+OEgNdxzQYK9jsetBy0ZxY4UW8lzkQH2cw2nRwBSTVt7aw5E4VUJI
         43gd2LY4ZRr6uoARph13m/KOcBpzlKfgqCL2Vhl9G5Trhl6hA5qef24FEAFxdFt5IXDP
         xqIQ==
X-Gm-Message-State: AOAM531nbaOzMRThh4O5LLqt3CQJ40tvzxEgR9hNv87KWiuExsCP1000
	TWHXZQ9APQb3H+BeY4VL0S8VQgJPNRM=
X-Google-Smtp-Source: ABdhPJw6wtvHV/qjC/Fbro+8Unmd1W1nGr/gXYTIoQK09Mru1KFJP4dAtX44NeWGQfRPa6PCRGVP4Q==
X-Received: by 2002:ac2:4c42:: with SMTP id o2mr4317773lfk.504.1632988356657;
        Thu, 30 Sep 2021 00:52:36 -0700 (PDT)
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
Subject: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for guests
Date: Thu, 30 Sep 2021 10:52:23 +0300
Message-Id: <20210930075223.860329-12-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
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
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/arch/arm/domain.c         |  1 +
 xen/arch/arm/vpci.c           | 86 +++++++++++++++++++++++++++++++----
 xen/arch/arm/vpci.h           |  3 ++
 xen/drivers/passthrough/pci.c | 25 ++++++++++
 xen/include/asm-arm/pci.h     |  1 +
 xen/include/xen/pci.h         |  1 +
 xen/include/xen/sched.h       |  2 +
 7 files changed, 111 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index fa6fcc5e467c..095671742ad8 100644
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
index 5d6c29c8dcd9..26ec2fa7cf2d 100644
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
+    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v->domain, &sbdf) )
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
+    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v->domain, &sbdf) )
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
 
@@ -95,14 +154,25 @@ int domain_vpci_init(struct domain *d)
     if ( !has_vpci(d) )
         return 0;
 
+    return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
+}
+
+static int domain_vpci_free_cb(struct domain *d,
+                               struct pci_host_bridge *bridge)
+{
     if ( is_hardware_domain(d) )
-        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
+        XFREE(bridge->mmio_priv);
+    else
+        XFREE(d->vpci_mmio_priv);
+    return 0;
+}
 
-    /* Guest domains use what is programmed in their device tree. */
-    register_mmio_handler(d, &vpci_mmio_handler,
-                          GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
+void domain_vpci_free(struct domain *d)
+{
+    if ( !has_vpci(d) )
+        return;
 
-    return 0;
+    pci_host_iterate_bridges(d, domain_vpci_free_cb);
 }
 
 int domain_vpci_get_num_mmio_handlers(struct domain *d)
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
index 5b963d75d1ba..b7dffb769cfd 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -889,6 +889,31 @@ int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
     xfree(vdev);
     return 0;
 }
+
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool pci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
+{
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
+
+    return found;
+}
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
 /* Caller should hold the pcidevs_lock */
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 1bfba3da8f51..12b4bf467ad2 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -66,6 +66,7 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config window */
     struct pci_ops *ops;
+    void *mmio_priv;                 /* MMIO handler's private data. */
 };
 
 struct pci_ops {
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 33033a3a8f8d..89cfc4853331 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -188,6 +188,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
 int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev);
 int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev);
+bool pci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf);
 #endif
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ecdb04b4f7fc..858b4133482f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -451,6 +451,8 @@ struct domain
      * to assign a unique SBDF to a passed through virtual PCI device.
      */
     int vpci_dev_next;
+    /* Virtual PCI MMIO handler's private data. */
+    void *vpci_mmio_priv;
 #endif
 #endif
 
-- 
2.25.1


