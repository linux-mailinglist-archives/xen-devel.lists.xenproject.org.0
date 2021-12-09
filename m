Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F1646E337
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 08:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242716.419786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDrq-0007RB-3Y; Thu, 09 Dec 2021 07:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242716.419786; Thu, 09 Dec 2021 07:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDrp-0007Nk-Vr; Thu, 09 Dec 2021 07:29:25 +0000
Received: by outflank-mailman (input) for mailman id 242716;
 Thu, 09 Dec 2021 07:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5bTN=Q2=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mvDro-00075S-FL
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 07:29:24 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb0ca4bf-58c1-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 08:29:23 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id k2so7593624lji.4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 23:29:23 -0800 (PST)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f13sm445069lfe.297.2021.12.08.23.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 23:29:22 -0800 (PST)
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
X-Inumbo-ID: bb0ca4bf-58c1-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XUbUdVW/JQJGJv5htHXoALs0/d8a/QR27xFCYV/hVms=;
        b=NB1ofDHv1bCLI5ZycXHpD1vK9WrNa6k4+O7RblnTJJuyEncVfvTRjNfEUQLEmeKNQ7
         nj/4ikMG64nKUYeNSoe7q/uFXiCSLwgXcKLyiEQZuSOpA5YddU/tyzb6Ywcgswu9qfNM
         G5DMVaVZBCbwKpBXus+y/kvhaq5vep8nALBlQ/QSyk+Z97EHJpqynmGVIPl46b6ObAEL
         rAAtqBMW//87W+ZTB/k/WQ3zm+798u1+SXRVV2dsDB9Bx54YHj1gM2Lsbt3JAMPG2O/9
         pUABfV/YAvD/KsmfBj5r7aGqKCYaxf/tTxiOvWZS1xBS5PxPIr4wRxNNkntybNEdeBxn
         IRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XUbUdVW/JQJGJv5htHXoALs0/d8a/QR27xFCYV/hVms=;
        b=3+1J898qcJaJuVabMSojTUOP44W5nWJhTt5KVcpc7CCOUHDJB9YHmlUmGPrXIJAnV/
         Jihbut2C4MK9I20FttUUCJPNmri6kXfETOza8+Rx2mL9DhfPscu+RXNaXExjYyfI8AOm
         YkyNgb8GuRa5Y+hdio1g3jh0HKPDKUtVoNWot4l0G0l9PA0sezrw0S4YQVyYmTRiNxEA
         14/iLWdZEEkCfatOEBav1SgocF5ph1grJMh/CL95BT+JtD952FRY+m9OyHi15/yJOGpN
         P0QUzOosbFt5ZE9lD+9PwCSPCFKXb362aLV1dY+4OT+pARo5YkWnOsUPRTDCsHbf3076
         ulbw==
X-Gm-Message-State: AOAM5303MFbnkiG/lfmlDjWawoxyLegKDriUpe02yM2dUhiPdmZR9Cze
	r1kzzVlwohfkZC8jcB6W8VIvqcNGghpPQA==
X-Google-Smtp-Source: ABdhPJx6MjlYrfHHU5UuBUicZWv6in5FppRcK79YaoNIBKz1cXa4FcBu7I4/oIYJgKoaeqGkn7qcWQ==
X-Received: by 2002:a2e:a7c6:: with SMTP id x6mr4561545ljp.328.1639034962642;
        Wed, 08 Dec 2021 23:29:22 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v8 2/4] xen/arm: setup MMIO range trap handlers for hardware domain
Date: Thu,  9 Dec 2021 09:29:16 +0200
Message-Id: <20211209072918.460902-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209072918.460902-1-andr2000@gmail.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

In order for vPCI to work it needs to maintain guest and hardware
domain's views of the configuration space. For example, BARs and
COMMAND registers require emulation for guests and the guest view
of the registers needs to be in sync with the real contents of the
relevant registers. For that ECAM address space needs to also be
trapped for the hardware domain, so we need to implement PCI host
bridge specific callbacks to properly setup MMIO handlers for those
ranges depending on particular host bridge implementation.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v7:
- move local variable inside the loop in pci_host_iterate_bridges_and_count
  and s/err/ret
- fixed incorrect s/if ( err )/if ( err < 0 )
- moved the guest part in an else in domain_vpci_init
- s/count/ret in domain_vpci_init as it better reflects the use of the
  value
Since v6:
- eliminate pci_host_get_num_bridges and make pci_host_iterate_bridges
  return the count
- extend comment in domain_vpci_init
- remove not yet relevant code for num MMIOs and virtual bus topology
- add extra check for has_vpci in domain_vpci_get_num_mmio_handlers
- remove code that fixes num MMIOs for guest domain as it doesn't belong
  to this patch
Since v5:
- add vpci_sbdf_from_gpa helper for gpa to SBDF translation
- take bridge's bus start into account while calculating SBDF
Since v4:
- unsigned int for functions working with count
- gate number of MMIO handlers needed for CONFIG_HAS_PCI_MSI
  and fix their number, e.g. single handler for PBA and
  MSI-X tables (Roger)
- re-work code for assigning MMIO handlers to be simpler
  and account on the fact that there could multiple host bridges
  exist for the hwdom
Since v3:
- fixed comment formatting
Since v2:
- removed unneeded assignment (count = 0)
- removed unneeded header inclusion
- update commit message
Since v1:
 - Dynamically calculate the number of MMIO handlers required for vPCI
   and update the total number accordingly
 - s/clb/cb
 - Do not introduce a new callback for MMIO handler setup
---
 xen/arch/arm/domain.c              |  2 +
 xen/arch/arm/pci/pci-host-common.c | 19 +++++++
 xen/arch/arm/vpci.c                | 81 ++++++++++++++++++++++++++----
 xen/arch/arm/vpci.h                |  6 +++
 xen/include/asm-arm/pci.h          |  4 ++
 5 files changed, 102 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 96e1b235501d..92a6c509e5c5 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -739,6 +739,8 @@ int arch_domain_create(struct domain *d,
     if ( (rc = domain_vgic_register(d, &count)) != 0 )
         goto fail;
 
+    count += domain_vpci_get_num_mmio_handlers(d);
+
     if ( (rc = domain_io_init(d, count + MAX_IO_HANDLER)) != 0 )
         goto fail;
 
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 40e779b5d803..84aab371cd9a 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -294,6 +294,25 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
     return -EINVAL;
 }
 
+int pci_host_iterate_bridges_and_count(struct domain *d,
+                                       int (*cb)(struct domain *d,
+                                                 struct pci_host_bridge *bridge))
+{
+    struct pci_host_bridge *bridge;
+    int count = 0;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        int ret;
+
+        ret = cb(d, bridge);
+        if ( ret < 0 )
+            return ret;
+        count += ret;
+    }
+    return count;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 23f45386f4b3..1564448c6c8d 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -16,16 +16,31 @@
 
 #include <asm/mmio.h>
 
+static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
+                                     paddr_t gpa)
+{
+    pci_sbdf_t sbdf;
+
+    if ( bridge )
+    {
+        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        sbdf.seg = bridge->segment;
+        sbdf.bus += bridge->cfg->busn_start;
+    }
+    else
+        sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+
+    return sbdf;
+}
+
 static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
                           register_t *r, void *p)
 {
-    pci_sbdf_t sbdf;
+    struct pci_host_bridge *bridge = p;
+    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
-    /* We ignore segment part and always handle segment 0 */
-    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
-
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -41,10 +56,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
                            register_t r, void *p)
 {
-    pci_sbdf_t sbdf;
-
-    /* We ignore segment part and always handle segment 0 */
-    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
+    struct pci_host_bridge *bridge = p;
+    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
 
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
@@ -55,13 +68,61 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
     .write = vpci_mmio_write,
 };
 
+static int vpci_setup_mmio_handler_cb(struct domain *d,
+                                      struct pci_host_bridge *bridge)
+{
+    struct pci_config_window *cfg = bridge->cfg;
+
+    register_mmio_handler(d, &vpci_mmio_handler,
+                          cfg->phys_addr, cfg->size, bridge);
+
+    /* We have registered a single MMIO handler. */
+    return 1;
+}
+
 int domain_vpci_init(struct domain *d)
 {
     if ( !has_vpci(d) )
         return 0;
 
-    register_mmio_handler(d, &vpci_mmio_handler,
-                          GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
+    /*
+     * The hardware domain gets as many MMIOs as required by the
+     * physical host bridge.
+     * Guests get the virtual platform layout: one virtual host bridge for now.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        int ret;
+
+        ret = pci_host_iterate_bridges_and_count(d, vpci_setup_mmio_handler_cb);
+        if ( ret < 0 )
+            return ret;
+    }
+    else
+        register_mmio_handler(d, &vpci_mmio_handler,
+                              GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
+
+    return 0;
+}
+
+static int vpci_get_num_handlers_cb(struct domain *d,
+                                    struct pci_host_bridge *bridge)
+{
+    /* Each bridge has a single MMIO handler for the configuration space. */
+    return 1;
+}
+
+unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
+{
+    if ( !has_vpci(d) )
+        return 0;
+
+    if ( is_hardware_domain(d) )
+    {
+        int ret = pci_host_iterate_bridges_and_count(d, vpci_get_num_handlers_cb);
+
+        return ret < 0 ? 0 : ret;
+    }
 
     return 0;
 }
diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
index d8a7b0e3e802..3c713f3fcdb5 100644
--- a/xen/arch/arm/vpci.h
+++ b/xen/arch/arm/vpci.h
@@ -17,11 +17,17 @@
 
 #ifdef CONFIG_HAS_VPCI
 int domain_vpci_init(struct domain *d);
+unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d);
 #else
 static inline int domain_vpci_init(struct domain *d)
 {
     return 0;
 }
+
+static inline unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
+{
+    return 0;
+}
 #endif
 
 #endif /* __ARCH_ARM_VPCI_H__ */
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index c313423cdcb2..94f003a07ca2 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -111,6 +111,10 @@ void arch_pci_init_pdev(struct pci_dev *pdev);
 
 int pci_get_new_domain_nr(void);
 
+int pci_host_iterate_bridges_and_count(struct domain *d,
+                                       int (*cb)(struct domain *d,
+                                                 struct pci_host_bridge *bridge));
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
-- 
2.25.1


