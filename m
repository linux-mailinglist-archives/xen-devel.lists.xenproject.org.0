Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D642585A2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 04:33:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCw6x-00027k-6L; Tue, 01 Sep 2020 02:33:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEra=CK=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kCw6v-00027f-OU
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 02:33:25 +0000
X-Inumbo-ID: 2f5d7800-b869-4186-b115-635bc8e3ea68
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f5d7800-b869-4186-b115-635bc8e3ea68;
 Tue, 01 Sep 2020 02:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598927604;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=1N/d3aiMSIG35lbBAZr6TpI1NBvNRDAdA/Fz4UbN6hs=;
 b=Q5Peuh5rL/14aCPwAGhzDI5P3h0iME4vs/+TteUClR5F/IG6J/aoTnsm
 UC8PgbTmK0PbM8JZCCDS21aKgGSIecW5JQVyfoc42LAQa3MWSh89iVyU8
 kBfTSniKMPSSRGMtDxoYWday8gv5aptnziGNQnaGyN6WmybxPTWSPXHy0 A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: iXCGQHmlhPR6aVGPEFvUODtb/WLL6ypM+Bg9W0y84XVAlpaZzG4jI3Lh48Kf6v5b2tvvO6MN0b
 wtCVtLeRQ5UeKQHWc23Su4dRwDCzfFdAzQhT1ZQ8ueZtP09eYpeFF/FmsT6EuNiuBW8YC463f/
 BaWRtsdJ7nsAIJpyzJM3ovDdjVhNYscaWgbS+FYfBktf0DyIR57Le2TEJSibOHrN4kYyLxVG6e
 kSoaq4jrhoHmXAsH5DSrdKQd6J6DaXfrHHrbiabnD0D0fW6+hfytGVP2pFn4VBlJoyh9Z08rac
 I5Q=
X-SBRS: 2.7
X-MesageID: 25834720
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,377,1592884800"; d="scan'208";a="25834720"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, 
 <wl@xen.org>, <iwj@xenproject.org>, Igor Druzhinin
 <igor.druzhinin@citrix.com>
Subject: [PATCH v2] hvmloader: indicate dynamically allocated memory as ACPI
 NVS in e820
Date: Tue, 1 Sep 2020 03:32:59 +0100
Message-ID: <1598927579-25303-1-git-send-email-igor.druzhinin@citrix.com>
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
(ACPI NVS) in contrast with regular ACPI (ACPI table) memory would avoid
potential reuse of this memory by the guest taking into account this region
may contain runtime structures like VM86 TSS, etc. If necessary, those
can be moved away later and the region marked as reclaimable.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
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
index 0c3f2d2..af68862 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -444,6 +444,12 @@ void mem_hole_populate_ram(xen_pfn_t mfn, uint32_t nr_mfns)
 static uint32_t alloc_up = RESERVED_MEMORY_DYNAMIC_START - 1;
 static uint32_t alloc_down = RESERVED_MEMORY_DYNAMIC_END;
 
+uint32_t mem_mfns_allocated(void)
+{
+    return (alloc_up >> PAGE_SHIFT) -
+            ((RESERVED_MEMORY_DYNAMIC_START - 1) >> PAGE_SHIFT);
+}
+
 xen_pfn_t mem_hole_alloc(uint32_t nr_mfns)
 {
     alloc_down -= nr_mfns << PAGE_SHIFT;
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 7bca641..98d5e02 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -200,6 +200,9 @@ void mem_hole_populate_ram(xen_pfn_t mfn, uint32_t nr_mfns);
 /* Allocate a memory hole below 4GB. */
 xen_pfn_t mem_hole_alloc(uint32_t nr_mfns);
 
+/* Return number of pages allocated */
+uint32_t mem_mfns_allocated(void);
+
 /* Allocate memory in a reserved region below 4GB. */
 void *mem_alloc(uint32_t size, uint32_t align);
 #define virt_to_phys(v) ((unsigned long)(v))
-- 
2.7.4


