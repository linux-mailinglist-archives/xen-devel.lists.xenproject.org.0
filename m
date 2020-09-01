Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF172585C8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 04:51:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCwO2-0003pH-Pk; Tue, 01 Sep 2020 02:51:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEra=CK=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kCwO1-0003pC-9c
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 02:51:05 +0000
X-Inumbo-ID: 78e62cf8-8fdc-4223-a249-a709b6a33599
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78e62cf8-8fdc-4223-a249-a709b6a33599;
 Tue, 01 Sep 2020 02:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598928662;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=JIx5W+28BTlYCrNX/vd39KNCzLQ9aRoQsnS7WfopG8I=;
 b=c/ioz5VCxSRWboWTPTMeS4ZeMaYzpWzvGpe2rF8J2vEWSbxKLB8wN6gl
 8coDd3i19lZc+PIYEf7VYzaOcmJlOUdMOKjE4ljDqzIopP/inc+WfUFCB
 D3qyTh0ahj84VEKemAshGK0N0U2Tdy2arPIgJ879v6LkWu5sYsSaFeert s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 28rIfvbCeIcgf4h7OGEWAe7O/N27zjhtPO0G1K/cPowDZjKTkLraXojgpVYWAvExn4ywDwlBZK
 6hIzFOUFDUTqbGjqv+lzSqkst/4xsxzFentdrX0R1CdcjD9+LGQmjXkbTVS5dADjCL2LcQ/ZSx
 4/dI3GAO8K/x0SjzSlkopm11M2LTZxJbIRiMcFCMR0kiKh9vQzZGJ3iz0e+cxNUMGv1Q2QI1nN
 1AQAbJUrj2/VAkY7foYcdeMbyLYWsT1o9K4YICiOyeOReMH/D8ofuy4t+oq9lmfMqdwg1E8V+t
 4zQ=
X-SBRS: 2.7
X-MesageID: 25691430
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,377,1592884800"; d="scan'208";a="25691430"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, 
 <wl@xen.org>, <iwj@xenproject.org>, Igor Druzhinin
 <igor.druzhinin@citrix.com>
Subject: [PATCH v2.1] hvmloader: indicate dynamically allocated memory as ACPI
 NVS in e820
Date: Tue, 1 Sep 2020 03:50:34 +0100
Message-ID: <1598928634-30849-1-git-send-email-igor.druzhinin@citrix.com>
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
the first kernel needs to pass firmware region locations to the second
kernel which is now a requirement after 02a3e3cdb7f12 ("x86/boot: Parse SRAT
table and count immovable memory regions").

The memory that hvmloader allocates in the reserved region mostly contains
these useful tables and could be safely indicated as ACPI without the need
to designate a sub-region specially for that. Making it non-reclaimable
(ACPI NVS) in contrast with ACPI reclaim (ACPI table) memory would avoid
potential reuse of this memory by the guest taking into account this region
may contain runtime structures like VM86 TSS, etc. If necessary, those
can be moved away later and the region marked as reclaimable.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v2.1:
- fixed previously missed uint32_t occurence

Changes in v2:
- gave more information on NVS type selection and potential alternatives
  in the description
- minor type fixes suggested

---
 tools/firmware/hvmloader/e820.c | 21 +++++++++++++++++----
 tools/firmware/hvmloader/util.c |  6 ++++++
 tools/firmware/hvmloader/util.h |  3 +++
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
index 4d1c955..0ad2f05 100644
--- a/tools/firmware/hvmloader/e820.c
+++ b/tools/firmware/hvmloader/e820.c
@@ -155,6 +155,8 @@ int build_e820_table(struct e820entry *e820,
 {
     unsigned int nr = 0, i, j;
     uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
+    unsigned long firmware_mem_end =
+        RESERVED_MEMORY_DYNAMIC_START + (mem_mfns_allocated() << PAGE_SHIFT);
 
     if ( !lowmem_reserved_base )
             lowmem_reserved_base = 0xA0000;
@@ -199,8 +201,19 @@ int build_e820_table(struct e820entry *e820,
     nr++;
 
     /*
+     * Mark populated reserved memory that contains ACPI and other tables as
+     * ACPI NVS (non-reclaimable) space - that should help the guest to treat
+     * it correctly later (e.g. pass to the next kernel on kexec).
+     */
+
+    e820[nr].addr = RESERVED_MEMBASE;
+    e820[nr].size = firmware_mem_end - RESERVED_MEMBASE;
+    e820[nr].type = E820_NVS;
+    nr++;
+
+    /*
      * Explicitly reserve space for special pages.
-     * This space starts at RESERVED_MEMBASE an extends to cover various
+     * This space starts after ACPI region and extends to cover various
      * fixed hardware mappings (e.g., LAPIC, IOAPIC, default SVGA framebuffer).
      *
      * If igd_opregion_pgbase we need to split the RESERVED region in two.
@@ -210,8 +223,8 @@ int build_e820_table(struct e820entry *e820,
     {
         uint32_t igd_opregion_base = igd_opregion_pgbase << PAGE_SHIFT;
 
-        e820[nr].addr = RESERVED_MEMBASE;
-        e820[nr].size = (uint32_t) igd_opregion_base - RESERVED_MEMBASE;
+        e820[nr].addr = firmware_mem_end;
+        e820[nr].size = igd_opregion_base - firmware_mem_end;
         e820[nr].type = E820_RESERVED;
         nr++;
 
@@ -227,7 +240,7 @@ int build_e820_table(struct e820entry *e820,
     }
     else
     {
-        e820[nr].addr = RESERVED_MEMBASE;
+        e820[nr].addr = firmware_mem_end;
         e820[nr].size = (uint32_t)-e820[nr].addr;
         e820[nr].type = E820_RESERVED;
         nr++;
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 0c3f2d2..59cde4a 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -444,6 +444,12 @@ void mem_hole_populate_ram(xen_pfn_t mfn, uint32_t nr_mfns)
 static uint32_t alloc_up = RESERVED_MEMORY_DYNAMIC_START - 1;
 static uint32_t alloc_down = RESERVED_MEMORY_DYNAMIC_END;
 
+unsigned long mem_mfns_allocated(void)
+{
+    return (alloc_up >> PAGE_SHIFT) -
+            ((RESERVED_MEMORY_DYNAMIC_START - 1) >> PAGE_SHIFT);
+}
+
 xen_pfn_t mem_hole_alloc(uint32_t nr_mfns)
 {
     alloc_down -= nr_mfns << PAGE_SHIFT;
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 7bca641..acd673a 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -200,6 +200,9 @@ void mem_hole_populate_ram(xen_pfn_t mfn, uint32_t nr_mfns);
 /* Allocate a memory hole below 4GB. */
 xen_pfn_t mem_hole_alloc(uint32_t nr_mfns);
 
+/* Return number of pages allocated */
+unsigned long mem_mfns_allocated(void);
+
 /* Allocate memory in a reserved region below 4GB. */
 void *mem_alloc(uint32_t size, uint32_t align);
 #define virt_to_phys(v) ((unsigned long)(v))
-- 
2.7.4


