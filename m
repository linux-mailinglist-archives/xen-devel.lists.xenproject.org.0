Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F617EB4D9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:31:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632936.987464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKJ-0003O9-D1; Tue, 14 Nov 2023 16:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632936.987464; Tue, 14 Nov 2023 16:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKJ-0003Lh-9y; Tue, 14 Nov 2023 16:31:47 +0000
Received: by outflank-mailman (input) for mailman id 632936;
 Tue, 14 Nov 2023 16:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2wKI-0002Oz-NN
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:31:46 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d4a08e9-830b-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 17:31:46 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9e8b36e36e0so361036766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 08:31:46 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a170906d28100b009dd606ce80fsm5783743ejb.31.2023.11.14.08.31.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 08:31:45 -0800 (PST)
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
X-Inumbo-ID: 4d4a08e9-830b-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979505; x=1700584305; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NT+opHNXDD+8bNoiCh7g5pdE2RHJ23alItnJp/zxUjY=;
        b=VoVDfZxH6iB3TtiiAQr/rNyvp7xw04uAtkVHf+sH7+TNt8i4JZkd5kydRavLuimoTm
         5t+SzuLN1iYZ8KS/Ln9BcxvwLo2c8G+0aegwxi4tLPajdN3UZXB6/cNeSTg9DslEodMY
         Rb6pxU+NwxRBtAIuvVWqaE0pD+lOl3nBzzSP+PfEoqCvEzwNYOcweBBFw6AF4egZptlf
         PBDnFjOW2MkTRjJwnNXsc88Z4SBstQvT1VGe+O0eOSHaS6L37ytGPJV+wIO0l6dDpD7Y
         gcx5SuubnUpklzeHlPuv3qBNNZLVY2pRSwRTlR+jJOHVCVudrTLqAMYPrUP2cFNRd91p
         XOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979505; x=1700584305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NT+opHNXDD+8bNoiCh7g5pdE2RHJ23alItnJp/zxUjY=;
        b=qAIAtSXUdha2bj+tTDNTwZIjTtO828FjuSflfw5PgXJRRYx1FI/TyY6ApCDodleLH9
         eaSKxIH35Qq8YFC+/HOtJKwVt8+1JlPT+nWlbSS21nsd2xeLyeIxIXC0lkN146Oot5vY
         pupnvH1woUkWFo/cMgE/msWHuDvsiwFGvjte7seUSrV8hFsk7n2i5PBoHIX1+6AntfLW
         kTRTQSlA/01PQVlyQINK0JyCCYjlfGeoY44SIxPvQXt5YeE6SV+Lqn1ocJB0yRF9ESrM
         hmV6nZTX3Xf6EryQkQ4hDOJ2A7dcDRflUQ1Q2N9ixAZsPJ4SuhE98FV7Z3dx8FhEt+0n
         TqGw==
X-Gm-Message-State: AOJu0YzzXuQNcwBkajQd5h1eRB7RwFIts6CAbi0mZR0wte9Oc+qnwQFx
	HG594h+uqPPd0ev0SzUrWYC3kQ==
X-Google-Smtp-Source: AGHT+IFzZ/WlakywfS2j4RNnJu+KHOxUEpzbwil6pYOK3zfVQW64jjDAFiv/57u6cKngaCaBboQSjg==
X-Received: by 2002:a17:907:7b8f:b0:9da:f85a:233f with SMTP id ne15-20020a1709077b8f00b009daf85a233fmr9830571ejc.28.1699979505694;
        Tue, 14 Nov 2023 08:31:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 3/9] hw/xen/hvm: Get target page size at runtime
Date: Tue, 14 Nov 2023 17:31:17 +0100
Message-ID: <20231114163123.74888-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to build this file once for all targets, replace:

  TARGET_PAGE_BITS -> qemu_target_page_bits()
  TARGET_PAGE_SIZE -> qemu_target_page_size()
  TARGET_PAGE_MASK -> -qemu_target_page_size()

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 62 +++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 3b10425986..b64204ea94 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -22,6 +22,7 @@
 
 #include "hw/xen/xen-hvm-common.h"
 #include <xen/hvm/e820.h>
+#include "exec/target_page.h"
 #include "cpu.h"
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
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
 void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
                          bool add)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
     hwaddr start_addr = section->offset_within_address_space;
     ram_addr_t size = int128_get64(section->size);
     bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
@@ -679,8 +695,8 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
 
     trace_xen_client_set_memory(start_addr, size, log_dirty);
 
-    start_addr &= TARGET_PAGE_MASK;
-    size = ROUND_UP(size, TARGET_PAGE_SIZE);
+    start_addr &= page_mask;
+    size = ROUND_UP(size, page_size);
 
     if (add) {
         if (!memory_region_is_rom(section->mr)) {
@@ -689,8 +705,8 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
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


