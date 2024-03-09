Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F29877390
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690980.1076757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2II-0004pW-Ra; Sat, 09 Mar 2024 19:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690980.1076757; Sat, 09 Mar 2024 19:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2II-0004m9-OO; Sat, 09 Mar 2024 19:23:42 +0000
Received: by outflank-mailman (input) for mailman id 690980;
 Sat, 09 Mar 2024 19:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2IH-0001PG-JI
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:41 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8959b764-de4a-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 20:23:41 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so229182966b.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:41 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a1709063e0900b00a45a73e0be9sm1167156eji.180.2024.03.09.11.23.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:40 -0800 (PST)
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
X-Inumbo-ID: 8959b764-de4a-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012220; x=1710617020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJ7HW/Ft7i83AZTN2mskut6mEUi0nRJo8gD5MOoOvrw=;
        b=P8jkQ+ybtwbClY1iPTzida1BCEbdz/lFV879UtmldppvbbqOk2jOLyFBxx7ABRiujg
         UzzIrGRc8WUYaII3MCNeAiFFnfxC55I+QMBvfnvDBVp54RIAFnPpZgM9IrpPpsmalgHG
         SIQWrJcdrhzfUrqNi9CWl9Tuc+CfrDp3G3GYBF2p5DeYzHPFRqdG9pOx8DgtbZa3HkkA
         jHU15kA41b7A9XcZMd8ZdoPo04tydENv4Df970bRDMjwA+gKTCb7T4QF5tE5RbG8+7QC
         gLV2ArsJbpcBDmTo73TuBuSM8sD8CyPU9dk1EL/gsFqT24W+WcW1l54KPVXbR0TBRa8Z
         n7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012220; x=1710617020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJ7HW/Ft7i83AZTN2mskut6mEUi0nRJo8gD5MOoOvrw=;
        b=WQaoEMfo1AfmP3DT3JfWydH2BTV0BsELObJStYFgKHEaVlZUQmu/i0P8ka35ErR7a4
         BQgGmeAov9FKtU40QZe/mdZ4jVTYNx7pNXNE37rU/6kH2VfrvWR5AuLQdcfQf7KffT4t
         vWpRxwwEFlRz9ZIIBtmj3NhGhvA+OxY02HcTIWSI8h9hPcTskrNf7csKC8qY6+CGaKbI
         SgGP8x5BTymJxVJkaSWa0tRkR5eop7ybv5X6FcJZgFhVlYWU2NwaSvVVBr+oURQUx7Se
         oz5FDRZUNKvPRt2+47r6FNmwMXXct2ZZE2js/EHFGLtSMJCJwqAOViy4k/VxIcsCvHhd
         jKjw==
X-Forwarded-Encrypted: i=1; AJvYcCXfxmG0dP3atvuY/zL80ZxPtpiO23lC23dRoFADIwFx1pCaRAvXW9ONiEMHVj1QGljj7u9knyIWtyYjLC3PUEAzgFzZp7hqnMj73aY+s2M=
X-Gm-Message-State: AOJu0YwGpEP7Azw8/YpbpJOrO3AIxEwMAACV4+PGDQWrAs4eJbupcpoj
	2W/XQc7a8gSuq7jqsqBvIOiuo6XG0EwxpX1bNgltSX7cD0it8CIFaZ/Wf3LrawU=
X-Google-Smtp-Source: AGHT+IGJ8dRKKvAEJydBIDk5EIHimW4WL5gyfDXoimVbXutg1h6Ab0DpFGsPNz89nrlp7nNRGTQq2A==
X-Received: by 2002:a17:907:96ab:b0:a44:17da:424 with SMTP id hd43-20020a17090796ab00b00a4417da0424mr1554598ejc.56.1710012220525;
        Sat, 09 Mar 2024 11:23:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PULL 14/43] hw/xen/hvm: Get target page size at runtime
Date: Sat,  9 Mar 2024 20:21:41 +0100
Message-ID: <20240309192213.23420-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to build this file once for all targets, replace:

  TARGET_PAGE_BITS -> qemu_target_page_bits()
  TARGET_PAGE_SIZE -> qemu_target_page_size()
  TARGET_PAGE_MASK -> -qemu_target_page_size()

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Message-Id: <20231114163123.74888-4-philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 62 +++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 844b11ae08..7745cb3963 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -23,6 +23,7 @@
 #include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/arch_hvm.h"
 #include <xen/hvm/e820.h>
+#include "exec/target_page.h"
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
 static MemoryRegion *framebuffer;
@@ -247,6 +248,9 @@ static int xen_add_to_physmap(XenIOState *state,
                               MemoryRegion *mr,
                               hwaddr offset_within_region)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
     unsigned long nr_pages;
     int rc = 0;
     XenPhysmap *physmap = NULL;
@@ -254,7 +258,7 @@ static int xen_add_to_physmap(XenIOState *state,
     hwaddr phys_offset = memory_region_get_ram_addr(mr);
     const char *mr_name;
 
-    if (get_physmapping(start_addr, size, TARGET_PAGE_MASK)) {
+    if (get_physmapping(start_addr, size, page_mask)) {
         return 0;
     }
     if (size <= 0) {
@@ -294,9 +298,9 @@ go_physmap:
         return 0;
     }
 
-    pfn = phys_offset >> TARGET_PAGE_BITS;
-    start_gpfn = start_addr >> TARGET_PAGE_BITS;
-    nr_pages = size >> TARGET_PAGE_BITS;
+    pfn = phys_offset >> target_page_bits;
+    start_gpfn = start_addr >> target_page_bits;
+    nr_pages = size >> target_page_bits;
     rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, nr_pages, pfn,
                                         start_gpfn);
     if (rc) {
@@ -310,8 +314,8 @@ go_physmap:
     }
 
     rc = xendevicemodel_pin_memory_cacheattr(xen_dmod, xen_domid,
-                                   start_addr >> TARGET_PAGE_BITS,
-                                   (start_addr + size - 1) >> TARGET_PAGE_BITS,
+                                   start_addr >> target_page_bits,
+                                   (start_addr + size - 1) >> target_page_bits,
                                    XEN_DOMCTL_MEM_CACHEATTR_WB);
     if (rc) {
         error_report("pin_memory_cacheattr failed: %s", strerror(errno));
@@ -323,11 +327,14 @@ static int xen_remove_from_physmap(XenIOState *state,
                                    hwaddr start_addr,
                                    ram_addr_t size)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
     int rc = 0;
     XenPhysmap *physmap = NULL;
     hwaddr phys_offset = 0;
 
-    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
+    physmap = get_physmapping(start_addr, size, page_mask);
     if (physmap == NULL) {
         return -1;
     }
@@ -338,9 +345,9 @@ static int xen_remove_from_physmap(XenIOState *state,
     DPRINTF("unmapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx", at "
             "%"HWADDR_PRIx"\n", start_addr, start_addr + size, phys_offset);
 
-    size >>= TARGET_PAGE_BITS;
-    start_addr >>= TARGET_PAGE_BITS;
-    phys_offset >>= TARGET_PAGE_BITS;
+    size >>= target_page_bits;
+    start_addr >>= target_page_bits;
+    phys_offset >>= target_page_bits;
     rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, size, start_addr,
                                         phys_offset);
     if (rc) {
@@ -369,13 +376,16 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
                                   hwaddr start_addr,
                                   ram_addr_t size)
 {
-    hwaddr npages = size >> TARGET_PAGE_BITS;
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
+    hwaddr npages = size >> target_page_bits;
     const int width = sizeof(unsigned long) * 8;
     size_t bitmap_size = DIV_ROUND_UP(npages, width);
     int rc, i, j;
     const XenPhysmap *physmap = NULL;
 
-    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
+    physmap = get_physmapping(start_addr, size, page_mask);
     if (physmap == NULL) {
         /* not handled */
         return;
@@ -389,7 +399,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
         return;
     }
 
-    rc = xen_track_dirty_vram(xen_domid, start_addr >> TARGET_PAGE_BITS,
+    rc = xen_track_dirty_vram(xen_domid, start_addr >> target_page_bits,
                               npages, dirty_bitmap);
     if (rc < 0) {
 #ifndef ENODATA
@@ -410,8 +420,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
             j = ctzl(map);
             map &= ~(1ul << j);
             memory_region_set_dirty(framebuffer,
-                                    (i * width + j) * TARGET_PAGE_SIZE,
-                                    TARGET_PAGE_SIZE);
+                                    (i * width + j) * page_size, page_size);
         };
     }
 }
@@ -631,17 +640,21 @@ void xen_register_framebuffer(MemoryRegion *mr)
 
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
+
     if (unlikely(xen_in_migration)) {
         int rc;
         ram_addr_t start_pfn, nb_pages;
 
-        start = xen_phys_offset_to_gaddr(start, length, TARGET_PAGE_MASK);
+        start = xen_phys_offset_to_gaddr(start, length, page_mask);
 
         if (length == 0) {
-            length = TARGET_PAGE_SIZE;
+            length = page_size;
         }
-        start_pfn = start >> TARGET_PAGE_BITS;
-        nb_pages = ((start + length + TARGET_PAGE_SIZE - 1) >> TARGET_PAGE_BITS)
+        start_pfn = start >> target_page_bits;
+        nb_pages = ((start + length + page_size - 1) >> target_page_bits)
             - start_pfn;
         rc = xen_modified_memory(xen_domid, start_pfn, nb_pages);
         if (rc) {
@@ -664,6 +677,9 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
 void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
                                 bool add)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
     hwaddr start_addr = section->offset_within_address_space;
     ram_addr_t size = int128_get64(section->size);
     bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
@@ -679,8 +695,8 @@ void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
 
     trace_xen_client_set_memory(start_addr, size, log_dirty);
 
-    start_addr &= TARGET_PAGE_MASK;
-    size = ROUND_UP(size, TARGET_PAGE_SIZE);
+    start_addr &= page_mask;
+    size = ROUND_UP(size, page_size);
 
     if (add) {
         if (!memory_region_is_rom(section->mr)) {
@@ -689,8 +705,8 @@ void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
         } else {
             mem_type = HVMMEM_ram_ro;
             if (xen_set_mem_type(xen_domid, mem_type,
-                                 start_addr >> TARGET_PAGE_BITS,
-                                 size >> TARGET_PAGE_BITS)) {
+                                 start_addr >> target_page_bits,
+                                 size >> target_page_bits)) {
                 DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
                         start_addr);
             }
-- 
2.41.0


