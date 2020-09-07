Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D5D260734
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 01:44:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFQmw-0001NM-QW; Mon, 07 Sep 2020 23:43:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H+Bm=CQ=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kFQmv-0001NH-CL
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 23:43:05 +0000
X-Inumbo-ID: 35c5fbbb-c621-41ba-a895-3a2efc9801ee
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35c5fbbb-c621-41ba-a895-3a2efc9801ee;
 Mon, 07 Sep 2020 23:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599522182;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=0Umcj9wd5+YwSLJYrYpfUbBdnJu4BasTUz1indr1d6Q=;
 b=F7WNJLIBYyNzplF2k4Rrr4zUMhKJFLKqC93zfYjzLMZmrMx4JIqd60zh
 0StKiLV5B7wqJfy88t0CzDC2F8YaNDcTifQDsU1RbWTPXirNiQES1grjn
 Tt80k4/I4IqCM8eTEGVTJbKpDrIheZadUgZqtaC5XwJf6V1pYsDACqH7N g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jz3PLV47k129HXCuXfwUQTRSbJ/O1VQ4zFhnvXiCfUb0e5ebE7/N64tV+ZvBy08IO/UsJJTLLN
 eNepkYAN8ZrEs/7MoaSavh6duVTuESCUiHzeF0USXroTbKHNtf5XxTM3XcgeG3JOaeRKsyAB3A
 Po+cmBiuq12DeP/DeYiw0/j430wCl6mToyYIhcltUVnL08rJ5JLyIO7t7ZRLoRroHk3o7kVNtg
 oR6rkCQ7GCNeCjUOxPC09QMDk3q5LZQjkIP8KfP+Fbpp1yTgFfJmT1xhk4YtN4YYM55pQpawIc
 t2w=
X-SBRS: 2.7
X-MesageID: 26159218
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,403,1592884800"; d="scan'208";a="26159218"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, 
 <wl@xen.org>, <iwj@xenproject.org>, Igor Druzhinin
 <igor.druzhinin@citrix.com>
Subject: [PATCH v3] hvmloader: indicate ACPI tables with "ACPI data" type in
 e820
Date: Tue, 8 Sep 2020 00:42:43 +0100
Message-ID: <1599522163-21992-1-git-send-email-igor.druzhinin@citrix.com>
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
Changes in v3:
- switched from NVS to regular "ACPI data" type by separating ACPI allocations
  into their own region
- gave more information on particular kexec usecase that requires this change

Changes in v2:
- gave more information on NVS type selection and potential alternatives
  in the description
- minor type fixes suggested
---
 tools/firmware/hvmloader/config.h |  3 ++-
 tools/firmware/hvmloader/e820.c   | 21 +++++++++++++++++----
 tools/firmware/hvmloader/util.c   | 29 ++++++++++++++++++++++++++++-
 tools/firmware/hvmloader/util.h   |  2 ++
 4 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index d9b4713..ff19b64 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -71,7 +71,8 @@ extern uint64_t pci_hi_mem_start, pci_hi_mem_end;
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
index 4d1c955..bc83808 100644
--- a/tools/firmware/hvmloader/e820.c
+++ b/tools/firmware/hvmloader/e820.c
@@ -155,6 +155,8 @@ int build_e820_table(struct e820entry *e820,
 {
     unsigned int nr = 0, i, j;
     uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
+    unsigned long acpi_mem_end =
+        ACPI_MEMORY_DYNAMIC_START + (acpi_pages_allocated() << PAGE_SHIFT);
 
     if ( !lowmem_reserved_base )
             lowmem_reserved_base = 0xA0000;
@@ -199,8 +201,19 @@ int build_e820_table(struct e820entry *e820,
     nr++;
 
     /*
+     * Mark populated reserved memory that contains ACPI tables as ACPI data.
+     * That should help the guest to treat it correctly later: e.g. pass to
+     * the next kernel on kexec or reclaim if necessary.
+     */
+
+    e820[nr].addr = RESERVED_MEMBASE;
+    e820[nr].size = acpi_mem_end - RESERVED_MEMBASE;
+    e820[nr].type = E820_ACPI;
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
+        e820[nr].addr = acpi_mem_end;
+        e820[nr].size = igd_opregion_base - acpi_mem_end;
         e820[nr].type = E820_RESERVED;
         nr++;
 
@@ -227,7 +240,7 @@ int build_e820_table(struct e820entry *e820,
     }
     else
     {
-        e820[nr].addr = RESERVED_MEMBASE;
+        e820[nr].addr = acpi_mem_end;
         e820[nr].size = (uint32_t)-e820[nr].addr;
         e820[nr].type = E820_RESERVED;
         nr++;
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


