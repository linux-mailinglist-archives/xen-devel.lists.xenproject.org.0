Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA152613AF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:42:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfkh-0004Jx-Tr; Tue, 08 Sep 2020 15:41:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j1cc=CR=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kFfkg-0004Js-Ng
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:41:46 +0000
X-Inumbo-ID: 9adb40a7-5a78-40cc-b6af-728b8636e67b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9adb40a7-5a78-40cc-b6af-728b8636e67b;
 Tue, 08 Sep 2020 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599579704;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=G9vOeS6S0lLLXQ13HPmgVZRK/YZFdatekoeqMe1HJ6Y=;
 b=ZwBoENubf6tL8JLM/vjLuDayvbXj0qMRCM5SajK+VSB7ObgN+gQFAaWS
 QCzQc0ZClxYHR+4E4okAGJckF/e9IvJ6uAd1Rr5x6AwK/e/mgYOQToN1g
 z/ZArWbiNBrreUumAoVTk7BU0U50iXM9c38Xg8o68ddzpnd6Z/GRkIaDm I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VT/nHLIaa+4NIOVCGoifgJkRbuodc7HKCvujHzU0Fl7euccYcgSvPdDvtI73XZ8QE+xJpWlmBl
 A46yZ1jxkyVirn19Gqf5eLRwSSVAJYrCOYOSvqINvicakLaY1sPGke2Fdzmv+0g3V5jeE+qLTm
 P7inhrFMe2yZ/2/2AAni9UpdsPaTQpxy6+tGSwi18oZXCrdeK99KYzkVaUn++QKzJoACy1dMje
 ZNH23AHCOVqCsJRRh3VH1dCgQMHmHiUghl/pvGqmAVWt8XyA9WQkmEVgr3TvFNgPSjpR9e4QTU
 fzI=
X-SBRS: 2.7
X-MesageID: 26506472
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,406,1592884800"; d="scan'208";a="26506472"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, 
 <wl@xen.org>, <iwj@xenproject.org>, Igor Druzhinin
 <igor.druzhinin@citrix.com>
Subject: [PATCH v4] hvmloader: indicate ACPI tables with "ACPI data" type in
 e820
Date: Tue, 8 Sep 2020 16:41:19 +0100
Message-ID: <1599579679-23983-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Guest kernel does need to know in some cases where the tables are located
to treat these regions properly. One example is kexec process where
the first kernel needs to pass ACPI region locations to the second
kernel which is now a requirement in Linux after 02a3e3cdb7f12 ("x86/boot:
Parse SRAT table and count immovable memory regions") in order for kexec
transition to actually work.

That commit introduced accesses to XSDT and SRAT while the second kernel
is still using kexec transition tables. The transition tables do not have
e820 "reserved" regions mapped where those tables are located currently
in a Xen guest. Instead "ACPI data" regions are mapped with the transition
tables that was introduced by the following commit 6bbeb276b7 ("x86/kexec:
Add the EFI system tables and ACPI tables to the ident map").

Reserve 1MB (out of 16MB currently available) right after ACPI info page for
ACPI tables exclusively but populate this region on demand and only indicate
populated memory as "ACPI data" since according to ACPI spec that memory is
reclaimable by the guest if necessary. That is close to how we treat
the same ACPI data in PVH guests. 1MB should be enough for now but could be
later extended if required.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v4:
- gated new region creation on acpi_enabled
- added a comment to explain reserved region start point

Changes in v3:
- switched from NVS to regular "ACPI data" type by separating ACPI allocations
  into their own region
- gave more information on particular kexec usecase that requires this change

Changes in v2:
- gave more information on NVS type selection and potential alternatives
  in the description
- minor type fixes suggested
---
 tools/firmware/hvmloader/config.h    |  6 +++++-
 tools/firmware/hvmloader/e820.c      | 26 ++++++++++++++++++++++----
 tools/firmware/hvmloader/hvmloader.c |  3 ++-
 tools/firmware/hvmloader/pci.c       |  1 -
 tools/firmware/hvmloader/util.c      | 29 ++++++++++++++++++++++++++++-
 tools/firmware/hvmloader/util.h      |  2 ++
 6 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index d9b4713..844120b 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -2,6 +2,7 @@
 #define __HVMLOADER_CONFIG_H__
 
 #include <stdint.h>
+#include <stdbool.h>
 
 enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
 extern enum virtual_vga virtual_vga;
@@ -62,6 +63,8 @@ extern uint8_t ioapic_version;
 extern unsigned long pci_mem_start, pci_mem_end;
 extern uint64_t pci_hi_mem_start, pci_hi_mem_end;
 
+extern bool acpi_enabled;
+
 /* Memory map. */
 #define SCRATCH_PHYSICAL_ADDRESS      0x00010000
 #define HYPERCALL_PHYSICAL_ADDRESS    0x00080000
@@ -71,7 +74,8 @@ extern uint64_t pci_hi_mem_start, pci_hi_mem_end;
 #define RESERVED_MEMBASE              0xFC000000
 /* NB. ACPI_INFO_PHYSICAL_ADDRESS *MUST* match definition in acpi/dsdt.asl! */
 #define ACPI_INFO_PHYSICAL_ADDRESS    0xFC000000
-#define RESERVED_MEMORY_DYNAMIC_START 0xFC001000
+#define ACPI_MEMORY_DYNAMIC_START     0xFC001000
+#define RESERVED_MEMORY_DYNAMIC_START 0xFC100000
 #define RESERVED_MEMORY_DYNAMIC_END   0xFE000000
 /*
  * GUEST_RESERVED: Physical address space reserved for guest use.
diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
index 4d1c955..38bcf18 100644
--- a/tools/firmware/hvmloader/e820.c
+++ b/tools/firmware/hvmloader/e820.c
@@ -155,6 +155,9 @@ int build_e820_table(struct e820entry *e820,
 {
     unsigned int nr = 0, i, j;
     uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
+    unsigned long acpi_mem_end = acpi_enabled ?
+        ACPI_MEMORY_DYNAMIC_START + (acpi_pages_allocated() << PAGE_SHIFT) :
+        RESERVED_MEMBASE;
 
     if ( !lowmem_reserved_base )
             lowmem_reserved_base = 0xA0000;
@@ -199,8 +202,23 @@ int build_e820_table(struct e820entry *e820,
     nr++;
 
     /*
+     * Mark populated reserved memory that contains ACPI tables as ACPI data.
+     * That should help the guest to treat it correctly later: e.g. pass to
+     * the next kernel on kexec or reclaim if necessary.
+     */
+
+    if ( acpi_enabled )
+    {
+        e820[nr].addr = RESERVED_MEMBASE;
+        e820[nr].size = acpi_mem_end - RESERVED_MEMBASE;
+        e820[nr].type = E820_ACPI;
+        nr++;
+    }
+
+    /*
      * Explicitly reserve space for special pages.
-     * This space starts at RESERVED_MEMBASE an extends to cover various
+     * This space starts right after ACPI region (to avoid creating a hole that
+     * might be accidentally occupied by MMIO) and extends to cover various
      * fixed hardware mappings (e.g., LAPIC, IOAPIC, default SVGA framebuffer).
      *
      * If igd_opregion_pgbase we need to split the RESERVED region in two.
@@ -210,8 +228,8 @@ int build_e820_table(struct e820entry *e820,
     {
         uint32_t igd_opregion_base = igd_opregion_pgbase << PAGE_SHIFT;
 
-        e820[nr].addr = RESERVED_MEMBASE;
-        e820[nr].size = (uint32_t) igd_opregion_base - RESERVED_MEMBASE;
+        e820[nr].addr = acpi_mem_end;
+        e820[nr].size = igd_opregion_base - acpi_mem_end;
         e820[nr].type = E820_RESERVED;
         nr++;
 
@@ -227,7 +245,7 @@ int build_e820_table(struct e820entry *e820,
     }
     else
     {
-        e820[nr].addr = RESERVED_MEMBASE;
+        e820[nr].addr = acpi_mem_end;
         e820[nr].size = (uint32_t)-e820[nr].addr;
         e820[nr].type = E820_RESERVED;
         nr++;
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index 598a226..c58841e 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -116,6 +116,8 @@ unsigned long scratch_start = SCRATCH_PHYSICAL_ADDRESS;
 uint32_t ioapic_base_address = 0xfec00000;
 uint8_t ioapic_version;
 
+bool acpi_enabled;
+
 static void init_hypercalls(void)
 {
     uint32_t eax, ebx, ecx, edx;
@@ -321,7 +323,6 @@ const struct hvm_modlist_entry *get_module_entry(
 int main(void)
 {
     const struct bios_config *bios;
-    int acpi_enabled;
     const struct hvm_modlist_entry *bios_module;
 
     /* Initialise hypercall stubs with RET, rendering them no-ops. */
diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index dcd097a..72f92d4 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -28,7 +28,6 @@
 #include <xen/hvm/ioreq.h>
 #include <xen/hvm/hvm_xs_strings.h>
 #include <xen/hvm/e820.h>
-#include <stdbool.h>
 
 unsigned long pci_mem_start = HVM_BELOW_4G_MMIO_START;
 unsigned long pci_mem_end = PCI_MEM_END;
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 0c3f2d2..7da144b 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -871,10 +871,37 @@ static unsigned long acpi_v2p(struct acpi_ctxt *ctxt, void *v)
     return virt_to_phys(v);
 }
 
+static unsigned long acpi_alloc_up = ACPI_MEMORY_DYNAMIC_START - 1;
+
+unsigned long acpi_pages_allocated(void)
+{
+    return (acpi_alloc_up >> PAGE_SHIFT) -
+            ((ACPI_MEMORY_DYNAMIC_START - 1) >> PAGE_SHIFT);
+}
+
 static void *acpi_mem_alloc(struct acpi_ctxt *ctxt,
                             uint32_t size, uint32_t align)
 {
-    return mem_alloc(size, align);
+    unsigned long s, e;
+
+    /* Align to at least 16 bytes. */
+    if ( align < 16 )
+        align = 16;
+
+    s = (acpi_alloc_up + align) & ~(align - 1);
+    e = s + size - 1;
+
+    BUG_ON((e < s) || (e >= RESERVED_MEMORY_DYNAMIC_START));
+
+    while ( (acpi_alloc_up >> PAGE_SHIFT) != (e >> PAGE_SHIFT) )
+    {
+        acpi_alloc_up += PAGE_SIZE;
+        mem_hole_populate_ram(acpi_alloc_up >> PAGE_SHIFT, 1);
+    }
+
+    acpi_alloc_up = e;
+
+    return (void *)s;
 }
 
 static void acpi_mem_free(struct acpi_ctxt *ctxt,
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 7bca641..31889de 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -282,6 +282,8 @@ bool check_overlap(uint64_t start, uint64_t size,
 extern const unsigned char dsdt_anycpu_qemu_xen[], dsdt_anycpu[], dsdt_15cpu[];
 extern const int dsdt_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu_len;
 
+unsigned long acpi_pages_allocated(void);
+
 struct acpi_config;
 void hvmloader_acpi_build_tables(struct acpi_config *config,
                                  unsigned int physical);
-- 
2.7.4


