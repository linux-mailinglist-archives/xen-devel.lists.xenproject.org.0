Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FAD874E55
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689802.1075115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCKV-00029y-RK; Thu, 07 Mar 2024 11:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689802.1075115; Thu, 07 Mar 2024 11:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCKV-00027p-Oe; Thu, 07 Mar 2024 11:54:31 +0000
Received: by outflank-mailman (input) for mailman id 689802;
 Thu, 07 Mar 2024 11:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riCKU-00027j-Tf
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:54:30 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7477a11b-dc79-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 12:54:29 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d240d8baf6so9188791fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:54:29 -0800 (PST)
Received: from meli.delivery (adsl-101.109.242.224.tellas.gr.
 [109.242.224.101]) by smtp.gmail.com with ESMTPSA id
 i9-20020a5d6309000000b0033e122a9a91sm19368088wru.105.2024.03.07.03.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 03:54:29 -0800 (PST)
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
X-Inumbo-ID: 7477a11b-dc79-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812469; x=1710417269; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D4wGmyvUQ61mLBJ031BInsy1nVuxKAhaid0zefzzgGc=;
        b=RMEwsQ0eFAIJPSZlxSOtAUdD7z53wNeYy/7PvzYzwkEa39hamRh0NbNpRriLGG0Y75
         IHtvC3I1XOPpN+dJobVtqDpcz1eMlRksoTTI3AFMJzPmWzQZMKf6kOGrKqRT/ZtQlHak
         VPzEzQpkEfzm9n5HoyQV1BetGGoKeFDf9NTs2ZLpnD2vexSmHdtIPQyWSmLY1gYdJxWp
         QEzfYKlgMX9GQc4UqPFSBO7F7py0vc6s3ZIwqHJ2cA075u5zaMn/8q0F4/EASIfiamMv
         rgcAe6rvP2buKUIfFfme5/8kyCPDJBUPk5BxyS6KTtw4HZ9eYrdhG3XCmiAg0L8CPrXC
         3ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812469; x=1710417269;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4wGmyvUQ61mLBJ031BInsy1nVuxKAhaid0zefzzgGc=;
        b=tKCQnkn2QiiN5KCbuCzzJXxkzgknC7RfIwvsYcZ+vXyq3NEjPKsz/w5b2arlPi1gNp
         FCMRlI7SJfyjG4bbJlWTIgRgPzC9oIaMwWdME3BpIql6708abAfCHD8HpP8ZObSvtajQ
         9wcMXp8LsZLH6STEV6v8v0hPVkRaXalxctRSFQpxZOwxTiiG2HibFXCfpnih89CItYll
         hx24Sg85I1XXQn7Z0mJKf/w3fQCdtSTRvo811d6UwiWaWbUVD2KnvKTW6Q1WNhEl/EiC
         3137uKTC7x3BaSBHH9I8cMEiQQutMI85TuhQO6alokw0rpqHj6lyhXYLDRNe1Z8mJzpS
         z8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUe4VFK1InFYkKaI5aioTtPdg/wKc4SI4gKqP+VhTS/IgV1x+JNq7SK9DYFXtzQZhb4vP+kHuPb5o7EXny9oKIFqGjs65YP12uG5RT8CcU=
X-Gm-Message-State: AOJu0Yy1BPDlWaxVYOxaLygVhOPaYKZ90m/lwBHFI4dxf7O0yl52yLnS
	WCruIXdoDFvhcrBGzziGr6VoNJqLKQhp0K+MKVrPGXqkaauV7LDIRdI2Z6XgZf0=
X-Google-Smtp-Source: AGHT+IHz5Cvig/z02xR0HuA2J9PkQo8Dyofphkh0RFYr8J9DsKohKy9DtwP9NgjeqhuAqzXFKS1QlQ==
X-Received: by 2002:a2e:9ad6:0:b0:2d3:e236:ddc2 with SMTP id p22-20020a2e9ad6000000b002d3e236ddc2mr1155474ljj.30.1709812469290;
        Thu, 07 Mar 2024 03:54:29 -0800 (PST)
Date: Thu, 07 Mar 2024 13:49:11 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-9.0 3/9] hw/xen/hvm: Get target page size at runtime
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-4-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-4-philmd@linaro.org>
Message-ID: <9z7qq.40e122bkrid@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>In order to build this file once for all targets, replace:
>
>  TARGET_PAGE_BITS -> qemu_target_page_bits()
>  TARGET_PAGE_SIZE -> qemu_target_page_size()
>  TARGET_PAGE_MASK -> -qemu_target_page_size()
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/i386/xen/xen-hvm.c | 62 +++++++++++++++++++++++++++----------------
> 1 file changed, 39 insertions(+), 23 deletions(-)
>
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index 3b10425986..b64204ea94 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -22,6 +22,7 @@
> 
> #include "hw/xen/xen-hvm-common.h"
> #include <xen/hvm/e820.h>
>+#include "exec/target_page.h"
> #include "cpu.h"
> 
> static MemoryRegion ram_640k, ram_lo, ram_hi;
>@@ -247,6 +248,9 @@ static int xen_add_to_physmap(XenIOState *state,
>                               MemoryRegion *mr,
>                               hwaddr offset_within_region)
> {
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>     unsigned long nr_pages;
>     int rc = 0;
>     XenPhysmap *physmap = NULL;
>@@ -254,7 +258,7 @@ static int xen_add_to_physmap(XenIOState *state,
>     hwaddr phys_offset = memory_region_get_ram_addr(mr);
>     const char *mr_name;
> 
>-    if (get_physmapping(start_addr, size, TARGET_PAGE_MASK)) {
>+    if (get_physmapping(start_addr, size, page_mask)) {
>         return 0;
>     }
>     if (size <= 0) {
>@@ -294,9 +298,9 @@ go_physmap:
>         return 0;
>     }
> 
>-    pfn = phys_offset >> TARGET_PAGE_BITS;
>-    start_gpfn = start_addr >> TARGET_PAGE_BITS;
>-    nr_pages = size >> TARGET_PAGE_BITS;
>+    pfn = phys_offset >> target_page_bits;
>+    start_gpfn = start_addr >> target_page_bits;
>+    nr_pages = size >> target_page_bits;
>     rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, nr_pages, pfn,
>                                         start_gpfn);
>     if (rc) {
>@@ -310,8 +314,8 @@ go_physmap:
>     }
> 
>     rc = xendevicemodel_pin_memory_cacheattr(xen_dmod, xen_domid,
>-                                   start_addr >> TARGET_PAGE_BITS,
>-                                   (start_addr + size - 1) >> TARGET_PAGE_BITS,
>+                                   start_addr >> target_page_bits,
>+                                   (start_addr + size - 1) >> target_page_bits,
>                                    XEN_DOMCTL_MEM_CACHEATTR_WB);
>     if (rc) {
>         error_report("pin_memory_cacheattr failed: %s", strerror(errno));
>@@ -323,11 +327,14 @@ static int xen_remove_from_physmap(XenIOState *state,
>                                    hwaddr start_addr,
>                                    ram_addr_t size)
> {
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>     int rc = 0;
>     XenPhysmap *physmap = NULL;
>     hwaddr phys_offset = 0;
> 
>-    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
>+    physmap = get_physmapping(start_addr, size, page_mask);
>     if (physmap == NULL) {
>         return -1;
>     }
>@@ -338,9 +345,9 @@ static int xen_remove_from_physmap(XenIOState *state,
>     DPRINTF("unmapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx", at "
>             "%"HWADDR_PRIx"\n", start_addr, start_addr + size, phys_offset);
> 
>-    size >>= TARGET_PAGE_BITS;
>-    start_addr >>= TARGET_PAGE_BITS;
>-    phys_offset >>= TARGET_PAGE_BITS;
>+    size >>= target_page_bits;
>+    start_addr >>= target_page_bits;
>+    phys_offset >>= target_page_bits;
>     rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, size, start_addr,
>                                         phys_offset);
>     if (rc) {
>@@ -369,13 +376,16 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>                                   hwaddr start_addr,
>                                   ram_addr_t size)
> {
>-    hwaddr npages = size >> TARGET_PAGE_BITS;
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    hwaddr npages = size >> target_page_bits;
>     const int width = sizeof(unsigned long) * 8;
>     size_t bitmap_size = DIV_ROUND_UP(npages, width);
>     int rc, i, j;
>     const XenPhysmap *physmap = NULL;
> 
>-    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
>+    physmap = get_physmapping(start_addr, size, page_mask);
>     if (physmap == NULL) {
>         /* not handled */
>         return;
>@@ -389,7 +399,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>         return;
>     }
> 
>-    rc = xen_track_dirty_vram(xen_domid, start_addr >> TARGET_PAGE_BITS,
>+    rc = xen_track_dirty_vram(xen_domid, start_addr >> target_page_bits,
>                               npages, dirty_bitmap);
>     if (rc < 0) {
> #ifndef ENODATA
>@@ -410,8 +420,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>             j = ctzl(map);
>             map &= ~(1ul << j);
>             memory_region_set_dirty(framebuffer,
>-                                    (i * width + j) * TARGET_PAGE_SIZE,
>-                                    TARGET_PAGE_SIZE);
>+                                    (i * width + j) * page_size, page_size);
>         };
>     }
> }
>@@ -631,17 +640,21 @@ void xen_register_framebuffer(MemoryRegion *mr)
> 
> void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
> {
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+
>     if (unlikely(xen_in_migration)) {
>         int rc;
>         ram_addr_t start_pfn, nb_pages;
> 
>-        start = xen_phys_offset_to_gaddr(start, length, TARGET_PAGE_MASK);
>+        start = xen_phys_offset_to_gaddr(start, length, page_mask);
> 
>         if (length == 0) {
>-            length = TARGET_PAGE_SIZE;
>+            length = page_size;
>         }
>-        start_pfn = start >> TARGET_PAGE_BITS;
>-        nb_pages = ((start + length + TARGET_PAGE_SIZE - 1) >> TARGET_PAGE_BITS)
>+        start_pfn = start >> target_page_bits;
>+        nb_pages = ((start + length + page_size - 1) >> target_page_bits)
>             - start_pfn;
>         rc = xen_modified_memory(xen_domid, start_pfn, nb_pages);
>         if (rc) {
>@@ -664,6 +677,9 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
> void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>                          bool add)
> {
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>     hwaddr start_addr = section->offset_within_address_space;
>     ram_addr_t size = int128_get64(section->size);
>     bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
>@@ -679,8 +695,8 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
> 
>     trace_xen_client_set_memory(start_addr, size, log_dirty);
> 
>-    start_addr &= TARGET_PAGE_MASK;
>-    size = ROUND_UP(size, TARGET_PAGE_SIZE);
>+    start_addr &= page_mask;
>+    size = ROUND_UP(size, page_size);
> 
>     if (add) {
>         if (!memory_region_is_rom(section->mr)) {
>@@ -689,8 +705,8 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>         } else {
>             mem_type = HVMMEM_ram_ro;
>             if (xen_set_mem_type(xen_domid, mem_type,
>-                                 start_addr >> TARGET_PAGE_BITS,
>-                                 size >> TARGET_PAGE_BITS)) {
>+                                 start_addr >> target_page_bits,
>+                                 size >> target_page_bits)) {
>                 DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
>                         start_addr);
>             }
>-- 
>2.41.0
>
>


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

