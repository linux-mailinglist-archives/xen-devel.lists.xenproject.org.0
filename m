Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1F45B610
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 09:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230147.397915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC5-00071b-VS; Wed, 24 Nov 2021 07:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230147.397915; Wed, 24 Nov 2021 07:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC5-0006xc-HW; Wed, 24 Nov 2021 07:59:53 +0000
Received: by outflank-mailman (input) for mailman id 230147;
 Wed, 24 Nov 2021 07:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYi7=QL=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mpnC3-0006a3-JY
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:59:51 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f257fce-4cfc-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 08:59:49 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id c32so4982386lfv.4
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 23:59:49 -0800 (PST)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i24sm1750358ljm.135.2021.11.23.23.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:59:48 -0800 (PST)
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
X-Inumbo-ID: 7f257fce-4cfc-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TEnw6Tbi8uyQhbNNHVX1/5nrpb6E6EbDTdN5JDsqHGk=;
        b=by2F/bIANGRUvvStIBUaqd7BodO++zeMWWnZlFlu5DUN6M6rH6qCLWRUxBZKz4/AXG
         RsTr4I1VVYaMM/xaXP/07o54/b2a6PjkBSbJKqJgBpamfkKJm9zReQlQFfNwe51SvNOL
         dPbEflhZbm5VgqImC488kclu9yfnt1gO9KelDXDaAPcEgh65uSSKAg83qGdVcXUvHIgy
         AsagpG2j6GVS7C4KDeoA8CtEl9Ud+dZOmscgwTKNKyMBHKWDIz5nxmgrsUiGWRYbZMn3
         k2PC+uIpnR9Lp9zSo+SlgsFJ7a4EOt27NjEiBuPtbqGPOcgWRXnxJe7JGgVXaqZXexJy
         lgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TEnw6Tbi8uyQhbNNHVX1/5nrpb6E6EbDTdN5JDsqHGk=;
        b=w8Dxv0/tO+/H3H5TJINUfC5DxA/lIdCTVuRAoVp2ZwBtxb8MLPqiMM+WwYIY7Gusor
         6G1EkjxT9lyNZHp6blDBHhw02BxsPYFbqPye2Nxjgp4zwvQYf2Ap54PlkHwoDRpxnnQ7
         NOHc0jsMnwx1iwKAtumuZQTrQOweQZU4yKkkSjarHB4zto0w7k/VEQjVPGSFCCCUtOzU
         v8Oq8fF9RlgDB1frQvPDvKSlhgtT95ZdnncecVnLFLhTMLkx0W3TWBLfzdLiz1J1wGhk
         yPuH2w4naSS+D3y1sZSDaOpyjyJ7tM0vr1NY4970H8T26L8rCEKWYrQbkcbcal2KhH7H
         7gQg==
X-Gm-Message-State: AOAM531SKjyFg09uh1f7rUQSsm1fUXwh8A4Se9bN5RGxWppk6c4NHX3g
	YpcYj4eIdQzEki0lNuefowmSc6bv6dVimA==
X-Google-Smtp-Source: ABdhPJy+GvMQW9KqqejEYd/gYEIrhD225h+RXwB+gNhrTl1r8Gx0oPe/QnhW/ua+Q2LUKzW+ypYgKw==
X-Received: by 2002:a05:6512:3056:: with SMTP id b22mr12540254lfb.316.1637740788381;
        Tue, 23 Nov 2021 23:59:48 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v7 3/7] xen/arm: setup MMIO range trap handlers for hardware domain
Date: Wed, 24 Nov 2021 09:59:38 +0200
Message-Id: <20211124075942.2645445-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124075942.2645445-1-andr2000@gmail.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
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
 xen/arch/arm/pci/pci-host-common.c | 17 +++++++
 xen/arch/arm/vpci.c                | 79 +++++++++++++++++++++++++++---
 xen/arch/arm/vpci.h                |  6 +++
 xen/include/asm-arm/pci.h          |  4 ++
 5 files changed, 100 insertions(+), 8 deletions(-)

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
index 9653b92b5b2e..18b09d5e6f10 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -296,6 +296,23 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
     return -EINVAL;
 }
 
+int pci_host_iterate_bridges_and_count(struct domain *d,
+                                       int (*cb)(struct domain *d,
+                                                 struct pci_host_bridge *bridge))
+{
+    struct pci_host_bridge *bridge;
+    int err, count = 0;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        err = cb(d, bridge);
+        if ( err )
+            return err;
+        count += err;
+    }
+    return count;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 23f45386f4b3..ccd998d8dba2 100644
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
@@ -55,17 +68,67 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
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
 
+    /*
+     * The hardware domain gets as many MMIOs as required by the
+     * physical host bridge.
+     * Guests get the virtual platform layout: one virtual host bridge for now.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        int count;
+
+        count = pci_host_iterate_bridges_and_count(d, vpci_setup_mmio_handler_cb);
+        if ( count < 0 )
+            return count;
+
+        return 0;
+    }
+
     register_mmio_handler(d, &vpci_mmio_handler,
                           GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
 
     return 0;
 }
 
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
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
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
index c20eba643d86..4278d66e5eb9 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -110,6 +110,10 @@ void arch_pci_init_pdev(struct pci_dev *pdev);
 
 int pci_get_new_domain_nr(void);
 
+int pci_host_iterate_bridges_and_count(struct domain *d,
+                                       int (*cb)(struct domain *d,
+                                                 struct pci_host_bridge *bridge));
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
-- 
2.25.1


