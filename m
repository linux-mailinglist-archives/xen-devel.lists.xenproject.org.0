Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2A842F497
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 15:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210640.367611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkT-0002gg-8c; Fri, 15 Oct 2021 13:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210640.367611; Fri, 15 Oct 2021 13:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkT-0002e4-4Z; Fri, 15 Oct 2021 13:59:49 +0000
Received: by outflank-mailman (input) for mailman id 210640;
 Fri, 15 Oct 2021 13:59:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mbNkQ-0002KR-Fj
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:59:46 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2769dd60-2dc0-11ec-8237-12813bfff9fa;
 Fri, 15 Oct 2021 13:59:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C94F8147A;
 Fri, 15 Oct 2021 06:59:45 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78E733F694;
 Fri, 15 Oct 2021 06:59:44 -0700 (PDT)
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
X-Inumbo-ID: 2769dd60-2dc0-11ec-8237-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Rahul Singh <rahul.singh@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH v7 5/5] arm/libxl: Emulated PCI device tree node in libxl
Date: Fri, 15 Oct 2021 14:59:22 +0100
Message-Id: <4a22121e6474adfb1c5166e0fdaddff47c6dae46.1634305870.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634305870.git.bertrand.marquis@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rahul Singh <rahul.singh@arm.com>

libxl will create an emulated PCI device tree node in the device tree to
enable the guest OS to discover the virtual PCI during guest boot.
Emulated PCI device tree node will only be created when there is any
device assigned to guest.

A new area has been reserved in the arm guest physical map at
which the VPCI bus is declared in the device tree (reg and ranges
parameters of the node).

Note that currently we are using num_pcidevs instead of
c_info->passthrough to decide whether to create a vPCI DT node.
This will be insufficient if and when ARM does PCI hotplug.
Add this note inside libxl_create.c where c_info->passthrough
is set.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes in v7:
-remove arch_arm.vpci
-create vpci DT note if (d_config->num_pcidevs)
Changes in v6:
According to https://marc.info/?l=xen-devel&m=163415838129479&w=2:
-do not set XEN_DOMCTL_CDF_vpci
-do not enable VPCI support (by setting b_info.arch_arm.vpci)
-do not define LIBXL_HAVE_BUILDINFO_ARM_VPCI
-keep b_info.arch_arm.vpci, make_vpci_node and its helpers
Change in v5:
- Move setting the arch_arm.vpci and XEN_DOMCTL_CDF_vpci to libxl_arm.c
Change in v4:
- Gate code for x86 for setting the XEN_DOMCTL_CDF_vpci for x86.
Change in v3:
- Make GUEST_VPCI_MEM_ADDR address 2MB aligned
Change in v2:
- enable doamin_vpci_init() when XEN_DOMCTL_CDF_vpci is set for domain.
---
---
 tools/libs/light/libxl_arm.c    | 103 ++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_create.c |   5 ++
 xen/include/public/arch-arm.h   |  10 ++++
 3 files changed, 118 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index fdae129605..eef1de0939 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -284,6 +284,59 @@ static int fdt_property_reg_placeholder(libxl__gc *gc, void *fdt,
     return fdt_property(fdt, "reg", regs, sizeof(regs));
 }
 
+static int fdt_property_values(libxl__gc *gc, void *fdt,
+                               const char *name,
+                               unsigned num_cells, ...)
+{
+    uint32_t prop[num_cells];
+    be32 *cells = &prop[0];
+    int i;
+    va_list ap;
+    uint32_t arg;
+
+    va_start(ap, num_cells);
+    for (i = 0 ; i < num_cells; i++) {
+        arg = va_arg(ap, uint32_t);
+        set_cell(&cells, 1, arg);
+    }
+    va_end(ap);
+
+    return fdt_property(fdt, name, prop, sizeof(prop));
+}
+
+static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
+                                    unsigned addr_cells,
+                                    unsigned size_cells,
+                                    unsigned num_regs, ...)
+{
+    uint32_t regs[num_regs*((addr_cells*2)+size_cells+1)];
+    be32 *cells = &regs[0];
+    int i;
+    va_list ap;
+    uint64_t arg;
+
+    va_start(ap, num_regs);
+    for (i = 0 ; i < num_regs; i++) {
+        /* Set the memory bit field */
+        arg = va_arg(ap, uint32_t);
+        set_cell(&cells, 1, arg);
+
+        /* Set the vpci bus address */
+        arg = addr_cells ? va_arg(ap, uint64_t) : 0;
+        set_cell(&cells, addr_cells , arg);
+
+        /* Set the cpu bus address where vpci address is mapped */
+        set_cell(&cells, addr_cells, arg);
+
+        /* Set the vpci size requested */
+        arg = size_cells ? va_arg(ap, uint64_t) : 0;
+        set_cell(&cells, size_cells, arg);
+    }
+    va_end(ap);
+
+    return fdt_property(fdt, "ranges", regs, sizeof(regs));
+}
+
 static int make_root_properties(libxl__gc *gc,
                                 const libxl_version_info *vers,
                                 void *fdt)
@@ -687,6 +740,53 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+static int make_vpci_node(libxl__gc *gc, void *fdt,
+                          const struct arch_info *ainfo,
+                          struct xc_dom_image *dom)
+{
+    int res;
+    const uint64_t vpci_ecam_base = GUEST_VPCI_ECAM_BASE;
+    const uint64_t vpci_ecam_size = GUEST_VPCI_ECAM_SIZE;
+    const char *name = GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
+
+    res = fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
+    if (res) return res;
+
+    res = fdt_property_string(fdt, "device_type", "pci");
+    if (res) return res;
+
+    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
+    if (res) return res;
+
+    res = fdt_property_values(gc, fdt, "bus-range", 2, 0, 255);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", 3);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#size-cells", 2);
+    if (res) return res;
+
+    res = fdt_property_string(fdt, "status", "okay");
+    if (res) return res;
+
+    res = fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+        GUEST_ROOT_SIZE_CELLS, 2,
+        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_ADDR, GUEST_VPCI_MEM_SIZE,
+        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_ADDR,
+        GUEST_VPCI_PREFETCH_MEM_SIZE);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -991,6 +1091,9 @@ next_resize:
         if (info->tee == LIBXL_TEE_TYPE_OPTEE)
             FDT( make_optee_node(gc, fdt) );
 
+        if (d_config->num_pcidevs)
+            FDT( make_vpci_node(gc, fdt, ainfo, dom) );
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 6ebb2bfc76..5a61d01722 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1096,6 +1096,11 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
         goto error_out;
     }
 
+    /*
+     * Note: libxl_arm directly examines num_pcidevs to decide whether
+     * to create a vPCI DT node, rather than using c_info->passthrough.
+     * This will be insufficient if and when ARM does PCI hotplug.
+     */
     bool need_pt = d_config->num_pcidevs || d_config->num_dtdevs;
     if (c_info->passthrough == LIBXL_PASSTHROUGH_DEFAULT) {
         c_info->passthrough = need_pt
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index b4c615bcdf..94b31511dd 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -433,6 +433,11 @@ typedef uint64_t xen_callback_t;
 #define GUEST_PL011_BASE    xen_mk_ullong(0x22000000)
 #define GUEST_PL011_SIZE    xen_mk_ullong(0x00001000)
 
+/* Guest PCI-PCIe memory space where config space and BAR will be available.*/
+#define GUEST_VPCI_ADDR_TYPE_MEM            xen_mk_ullong(0x02000000)
+#define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
+#define GUEST_VPCI_MEM_SIZE                 xen_mk_ullong(0x10000000)
+
 /*
  * 16MB == 4096 pages reserved for guest to use as a region to map its
  * grant table in.
@@ -453,6 +458,11 @@ typedef uint64_t xen_callback_t;
 #define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low RAM @ 1GB */
 #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
 
+/* 4GB @ 4GB Prefetch Memory for VPCI */
+#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM   xen_mk_ullong(0x42000000)
+#define GUEST_VPCI_PREFETCH_MEM_ADDR        xen_mk_ullong(0x100000000)
+#define GUEST_VPCI_PREFETCH_MEM_SIZE        xen_mk_ullong(0x100000000)
+
 #define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of RAM @ 8GB */
 #define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)
 
-- 
2.25.1


