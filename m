Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE0445FB8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222022.384039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misnA-0001a4-HB; Fri, 05 Nov 2021 06:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222022.384039; Fri, 05 Nov 2021 06:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misnA-0001VY-BG; Fri, 05 Nov 2021 06:33:36 +0000
Received: by outflank-mailman (input) for mailman id 222022;
 Fri, 05 Nov 2021 06:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1misn9-0000uf-0Y
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:33:35 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cc0448d-3e02-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:33:34 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id b15so10319817edd.7
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:33:34 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e12sm3599870ejs.86.2021.11.04.23.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:33:33 -0700 (PDT)
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
X-Inumbo-ID: 4cc0448d-3e02-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7DFfi4NJpO6ZXPEa/MCt5rYVrF3eNK6m45b8kORo1QM=;
        b=KU2BVBauL1W0b/kJmCt+Hr5QQBqzVNc0UslYueGmROgDiwKbNU0oPqWXHhFe0LI4gW
         o/8iXU7+Dx8ENyZtdb8vH2lbgsSrBukG9TH3JHp5Lwug+65NLBGjcKQBbLumdy3WjNQT
         1kNHTFFTEwsmBIRjG/g3LmRlqMD6V/8dU6MUftY5E9gbn7A19FkWZK8cWWh9+/hQgjqP
         AxH3e23Ad4eotR/kZWprmoQOCCGv0Bhju38poSp/cdFl7lFOieGH9GAL/Fy+qeDmDCJl
         wjnB6INtfkTho6b9W+TuujtFlEiUfrp/DpevSZXJ85XHO/z5OPaMAbKb4QAW+KcWgVS9
         KzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7DFfi4NJpO6ZXPEa/MCt5rYVrF3eNK6m45b8kORo1QM=;
        b=NzG7boXjcofdvd2w1NG2fHGXPqnnaFYRY+u0qqbGX74fW6qrSyz1SqexKU99ueOAup
         p5ULyGbNvWGQI4ey4eqXWaunTagvpGpgFCmNsYPbw9FWb1QJR3lFDmtFwGu/WFOnaILZ
         BOAs9/IJALcMdNjlB+m0gAatAgffAnqypXF3rtf/d5eGXXt8Eflks6rPDUEOvJ+1Edkv
         htljP1tnRBbwyrfMiwuGiQEimcsjs3Zvh7RGc0MuPOuga69bDmusGnhyRvrR2SrNRHnW
         KrmlAre+PvozGJ8ordFgltyTILA9vf19L98pOVADTNlRi7Ubqvy6d4njFm5UAr+EpbB4
         k+Zw==
X-Gm-Message-State: AOAM532WOh220kG0PbixkIoa5GzH3xkiE1ItaKOK5MeVMQVgqJk/amed
	p58lvoAo9x3s8r3IPvOvSEbJQlQMxZYvkQ==
X-Google-Smtp-Source: ABdhPJxknzRzOzobhrZIu7O3Gw2GhpxGesAfhPjns3ww0txfV1NaULioEwlrF/dxT5ryKUEXPdt1sg==
X-Received: by 2002:a17:906:478e:: with SMTP id cw14mr52604639ejc.46.1636094013511;
        Thu, 04 Nov 2021 23:33:33 -0700 (PDT)
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
Subject: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for hardware domain
Date: Fri,  5 Nov 2021 08:33:22 +0200
Message-Id: <20211105063326.939843-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105063326.939843-1-andr2000@gmail.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
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
 xen/arch/arm/pci/pci-host-common.c | 27 ++++++++++++
 xen/arch/arm/vpci.c                | 66 ++++++++++++++++++++++++++----
 xen/arch/arm/vpci.h                |  6 +++
 xen/include/asm-arm/pci.h          |  5 +++
 5 files changed, 98 insertions(+), 8 deletions(-)

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
index 47104b22b221..0d271a6e8881 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -289,6 +289,33 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
     return -EINVAL;
 }
 
+int pci_host_iterate_bridges(struct domain *d,
+                             int (*cb)(struct domain *d,
+                                       struct pci_host_bridge *bridge))
+{
+    struct pci_host_bridge *bridge;
+    int err;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        err = cb(d, bridge);
+        if ( err )
+            return err;
+    }
+    return 0;
+}
+
+unsigned int pci_host_get_num_bridges(void)
+{
+    struct pci_host_bridge *bridge;
+    unsigned int count = 0;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+        count++;
+
+    return count;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 23f45386f4b3..5a6ebd8b9868 100644
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
@@ -55,17 +68,54 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
     .write = vpci_mmio_write,
 };
 
+static int vpci_setup_mmio_handler_cb(struct domain *d,
+                                      struct pci_host_bridge *bridge)
+{
+    struct pci_config_window *cfg = bridge->cfg;
+
+    register_mmio_handler(d, &vpci_mmio_handler,
+                          cfg->phys_addr, cfg->size, bridge);
+    return 0;
+}
+
 int domain_vpci_init(struct domain *d)
 {
     if ( !has_vpci(d) )
         return 0;
 
+    if ( is_hardware_domain(d) )
+        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler_cb);
+
+    /* Guest domains use what is programmed in their device tree. */
     register_mmio_handler(d, &vpci_mmio_handler,
                           GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
 
     return 0;
 }
 
+unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
+{
+    unsigned int count;
+
+    if ( is_hardware_domain(d) )
+        /* For each PCI host bridge's configuration space. */
+        count = pci_host_get_num_bridges();
+    else
+        /*
+         * There's a single MSI-X MMIO handler that deals with both PBA
+         * and MSI-X tables per each PCI device being passed through.
+         * Maximum number of supported devices is 32 as virtual bus
+         * topology emulates the devices as embedded endpoints.
+         * +1 for a single emulated host bridge's configuration space.
+         */
+        count = 1;
+#ifdef CONFIG_HAS_PCI_MSI
+        count += 32;
+#endif
+
+    return count;
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
index c20eba643d86..969333043431 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -110,6 +110,11 @@ void arch_pci_init_pdev(struct pci_dev *pdev);
 
 int pci_get_new_domain_nr(void);
 
+int pci_host_iterate_bridges(struct domain *d,
+                             int (*clb)(struct domain *d,
+                                        struct pci_host_bridge *bridge));
+unsigned int pci_host_get_num_bridges(void);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
-- 
2.25.1


