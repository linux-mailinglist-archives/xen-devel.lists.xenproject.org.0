Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A3A2551DF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 02:14:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBS1d-000087-CX; Fri, 28 Aug 2020 00:13:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+vO4=CG=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kBS1c-000082-BR
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 00:13:48 +0000
X-Inumbo-ID: ae27402b-c550-4bd9-8d1f-491f365f3107
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae27402b-c550-4bd9-8d1f-491f365f3107;
 Fri, 28 Aug 2020 00:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598573626;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=lKUHMYWvMqoXoQIRy3yQttVawMRij0Lk9YPfLKj1a8E=;
 b=IKs0THmhc/wF/kPFlnM51pMEgj4xZowmNF/pDMA3zoXba7qM1P3A53dZ
 bwQ15PUGi+WEXfokbEM5P8ICUVyBO1gJEmYP6n0GSuyBylqVxZO7q1oUW
 WDQ8Uh7ITgFRi4X5ECxlTPPPBG/6puc4IbWHrzH7R3rsgNu8O2JQTu4dG s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WMi1N9EbrA9THccyKaiqUGvp1F1jkKTCjGP+iY3Gb9GJNcO5xfmj3qxQ+WKfhjWgh3ayE3Kud2
 eDzKh3fr2dyy7eHVsWILpOdPmLopohdQSkkf0kRt7M9woB58LJ6RmO0GfVV7JjqTk8BRpvX8aA
 lxzmnGzkqmhyIeJfHAhl44mXgucXWRS/hi54jzXxJLroVnJxrcTpMGArgVaz+3Sgm8BH8OEruq
 2ohKtYzkhlMv4bMEDqKG45tMXa0k6Tlu40s3CvdFfBMgUHymzAgma/OyGew0Jd2J8Dp6AsMbFN
 ZCY=
X-SBRS: 2.7
X-MesageID: 25783811
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,361,1592884800"; d="scan'208";a="25783811"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, 
 <wl@xen.org>, <iwj@xenproject.org>, Igor Druzhinin
 <igor.druzhinin@citrix.com>
Subject: [PATCH] hvmloader: indicate firmware tables as ACPI NVS in e820
Date: Fri, 28 Aug 2020 01:13:19 +0100
Message-ID: <1598573599-23792-1-git-send-email-igor.druzhinin@citrix.com>
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
(ACPI NVS) would avoid potential reuse of this memory by the guest.
Swtiching from Reserved to ACPI NVS type for this memory would also mean
its content is preserved across S4 (which is true for any ACPI type according
to the spec).

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 tools/firmware/hvmloader/e820.c | 21 +++++++++++++++++----
 tools/firmware/hvmloader/util.c |  6 ++++++
 tools/firmware/hvmloader/util.h |  3 +++
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
index 4d1c955..ef60007 100644
--- a/tools/firmware/hvmloader/e820.c
+++ b/tools/firmware/hvmloader/e820.c
@@ -155,6 +155,8 @@ int build_e820_table(struct e820entry *e820,
 {
     unsigned int nr = 0, i, j;
     uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
+    uint32_t firmware_mem_end =
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
+        e820[nr].size = (uint32_t) igd_opregion_base - firmware_mem_end;
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


