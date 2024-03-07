Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ADE874E7F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689830.1075175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCSu-0007Wc-7i; Thu, 07 Mar 2024 12:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689830.1075175; Thu, 07 Mar 2024 12:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCSu-0007Ui-50; Thu, 07 Mar 2024 12:03:12 +0000
Received: by outflank-mailman (input) for mailman id 689830;
 Thu, 07 Mar 2024 12:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riCSs-0007Ub-N6
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:03:10 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a96b4cd0-dc7a-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 13:03:08 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5131a9b3d5bso897535e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 04:03:08 -0800 (PST)
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
 by smtp.gmail.com with ESMTPSA id
 er15-20020a05600c84cf00b00412ff07df2bsm2390077wmb.37.2024.03.07.04.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 04:03:07 -0800 (PST)
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
X-Inumbo-ID: a96b4cd0-dc7a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812988; x=1710417788; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RlBrkMTf7SSQDKl3PVutEMaJuCE9dxB8RnU5YDrlXDE=;
        b=UJ0a4GF7EtfryS6Fi2I4wM7sXMwoMjDYx09bLrFFKFcMLRXZ7H+FaHO3Vf3D+hEXzN
         4erI36RkHw+ns0kv7zYOmu2EHyQM1M7WjyBZL7MStnl0p3oA5xY+mey4CwsNQYa4iR5M
         Sww0ftQAVVGSfSixPKbN1QEOIXwS6An/LS9UYsMx/KTepZT68kOMl0pIUpn9TU0m2q1B
         YwSb8XFFgLz4B2L8GWW4BhpR4edIMfZJKac0tqpQDJA18dOaDELeE2Qp1Y1iyv1fkpO8
         uTW605sSzyqdl0x2d3Y3fuubWp6FAx05IQASvYMjfN65xGa1fcVYSi23nM0Mj+Z8w7LM
         mhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812988; x=1710417788;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RlBrkMTf7SSQDKl3PVutEMaJuCE9dxB8RnU5YDrlXDE=;
        b=uFBXPXh6XsX5vD8Z9NkYb/cGepH8/3I4CsrNqpGXSRfrMeZfkW2SCPQilk/RhA00hF
         hF2dNSP2s6WvwSm/1San+ICBnUXp0X+ZRyuHdERZhi6KJrir0XrfmQVENxwIfM9m3xHu
         ESWk9ZpHcCxVUHGt+k8exPyv5bRDIYROZ0OzUJCCzsee3ktEDQ3cCYQ/VMSs3s1cuUNr
         VIF/dNjJbHty2mnmybhfca31wvZgkTkxx9k5nery/YBxdHH0GzDMqQRBgfMxqG1cGoKf
         PNl4EZSkS/Aubh98FklAi9b3E3n2JDte/kmYbRRQw3xR7DRAI3Sp2uvkScEIl6O66Xgd
         ukXw==
X-Forwarded-Encrypted: i=1; AJvYcCVbcULrgCEZBWgZnXb85gWP6K6+6vlvCppJsv/c4ZP5t8YJ3NfppBftUG1ZYeJEZj04sWWOhDuD+qtljXS3ZYFSlCfHNNvnepf+fE0zwEU=
X-Gm-Message-State: AOJu0YxIRq164n/kDGRlqAOwQMvxO25lD3EDl8jDl8bVaucRDxHCDfCv
	Wz7mmV9MwPHv6g4g5fWIf6PsEGpT+GfnMS2X1sygpIbGh7O0aBpSnGHZbRmh1es=
X-Google-Smtp-Source: AGHT+IH+F3G+airsYrms0kUgm+WIurfZtRY7dRSZgr1FNrsZyAAIUW2iMiYlIEHJHqJC3i9gBMXNhA==
X-Received: by 2002:a19:f612:0:b0:513:2c86:3498 with SMTP id x18-20020a19f612000000b005132c863498mr1257889lfe.48.1709812987752;
        Thu, 07 Mar 2024 04:03:07 -0800 (PST)
Date: Thu, 07 Mar 2024 14:01:08 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH-for-9.0 7/9] hw/xen/hvm: Extract common code to xen-hvm-common.c
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-8-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-8-philmd@linaro.org>
Message-ID: <9z855.fonsju6rcb0l@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Extract non-x86 specific code out of xen-hvm.c,
>to xen-hvm-common.c. For now this new file is
>only build for x86 targets.

s/build/built

>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/i386/xen/xen-hvm-common.c | 473 +++++++++++++++++++++++++++++++++++
> hw/i386/xen/xen-hvm.c        | 459 ---------------------------------
> hw/i386/xen/meson.build      |   1 +
> 3 files changed, 474 insertions(+), 459 deletions(-)
> create mode 100644 hw/i386/xen/xen-hvm-common.c
>
>diff --git a/hw/i386/xen/xen-hvm-common.c b/hw/i386/xen/xen-hvm-common.c
>new file mode 100644
>index 0000000000..e8ef0e0c94
>--- /dev/null
>+++ b/hw/i386/xen/xen-hvm-common.c
>@@ -0,0 +1,473 @@
>+/*
>+ * Copyright (C) 2010       Citrix Ltd.
>+ *
>+ * This work is licensed under the terms of the GNU GPL, version 2.  See
>+ * the COPYING file in the top-level directory.
>+ *
>+ * Contributions after 2012-01-13 are licensed under the terms of the
>+ * GNU GPL, version 2 or (at your option) any later version.
>+ */
>+
>+#include "qemu/osdep.h"
>+#include "qemu/range.h"
>+#include "qapi/qapi-commands-migration.h"
>+#include "exec/target_page.h"
>+#include "hw/xen/xen-hvm-common.h"
>+#include "trace.h"
>+
>+static MemoryRegion *framebuffer;
>+static bool xen_in_migration;
>+
>+static QLIST_HEAD(, XenPhysmap) xen_physmap;
>+static const XenPhysmap *log_for_dirtybit;
>+/* Buffer used by xen_sync_dirty_bitmap */
>+static unsigned long *dirty_bitmap;
>+
>+static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
>+                                   int page_mask)
>+{
>+    XenPhysmap *physmap = NULL;
>+
>+    start_addr &= -page_mask;
>+
>+    QLIST_FOREACH(physmap, &xen_physmap, list) {
>+        if (range_covers_byte(physmap->start_addr, physmap->size, start_addr)) {
>+            return physmap;
>+        }
>+    }
>+    return NULL;
>+}
>+
>+static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size,
>+                                       int page_mask)
>+{
>+    hwaddr addr = phys_offset & -page_mask;
>+    XenPhysmap *physmap = NULL;
>+
>+    QLIST_FOREACH(physmap, &xen_physmap, list) {
>+        if (range_covers_byte(physmap->phys_offset, physmap->size, addr)) {
>+            return physmap->start_addr + (phys_offset - physmap->phys_offset);
>+        }
>+    }
>+
>+    return phys_offset;
>+}
>+
>+#ifdef XEN_COMPAT_PHYSMAP
>+static int xen_save_physmap(XenIOState *state, XenPhysmap *physmap)
>+{
>+    char path[80], value[17];
>+
>+    snprintf(path, sizeof(path),
>+            "/local/domain/0/device-model/%d/physmap/%"PRIx64"/start_addr",
>+            xen_domid, (uint64_t)physmap->phys_offset);
>+    snprintf(value, sizeof(value), "%"PRIx64, (uint64_t)physmap->start_addr);
>+    if (!xs_write(state->xenstore, 0, path, value, strlen(value))) {
>+        return -1;
>+    }
>+    snprintf(path, sizeof(path),
>+            "/local/domain/0/device-model/%d/physmap/%"PRIx64"/size",
>+            xen_domid, (uint64_t)physmap->phys_offset);
>+    snprintf(value, sizeof(value), "%"PRIx64, (uint64_t)physmap->size);
>+    if (!xs_write(state->xenstore, 0, path, value, strlen(value))) {
>+        return -1;
>+    }
>+    if (physmap->name) {
>+        snprintf(path, sizeof(path),
>+                "/local/domain/0/device-model/%d/physmap/%"PRIx64"/name",
>+                xen_domid, (uint64_t)physmap->phys_offset);
>+        if (!xs_write(state->xenstore, 0, path,
>+                      physmap->name, strlen(physmap->name))) {
>+            return -1;
>+        }
>+    }
>+    return 0;
>+}
>+#else
>+static int xen_save_physmap(XenIOState *state, XenPhysmap *physmap)
>+{
>+    return 0;
>+}
>+#endif
>+
>+static int xen_add_to_physmap(XenIOState *state,
>+                              hwaddr start_addr,
>+                              ram_addr_t size,
>+                              MemoryRegion *mr,
>+                              hwaddr offset_within_region)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    unsigned long nr_pages;
>+    int rc = 0;
>+    XenPhysmap *physmap = NULL;
>+    hwaddr pfn, start_gpfn;
>+    hwaddr phys_offset = memory_region_get_ram_addr(mr);
>+    const char *mr_name;
>+
>+    if (get_physmapping(start_addr, size, page_mask)) {
>+        return 0;
>+    }
>+    if (size <= 0) {
>+        return -1;
>+    }
>+
>+    /* Xen can only handle a single dirty log region for now and we want
>+     * the linear framebuffer to be that region.
>+     * Avoid tracking any regions that is not videoram and avoid tracking
>+     * the legacy vga region. */
>+    if (mr == framebuffer && start_addr > 0xbffff) {
>+        goto go_physmap;
>+    }
>+    return -1;
>+
>+go_physmap:
>+    DPRINTF("mapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx"\n",
>+            start_addr, start_addr + size);
>+
>+    mr_name = memory_region_name(mr);
>+
>+    physmap = g_new(XenPhysmap, 1);
>+
>+    physmap->start_addr = start_addr;
>+    physmap->size = size;
>+    physmap->name = mr_name;
>+    physmap->phys_offset = phys_offset;
>+
>+    QLIST_INSERT_HEAD(&xen_physmap, physmap, list);
>+
>+    if (runstate_check(RUN_STATE_INMIGRATE)) {
>+        /* Now when we have a physmap entry we can replace a dummy mapping with
>+         * a real one of guest foreign memory. */
>+        uint8_t *p = xen_replace_cache_entry(phys_offset, start_addr, size);
>+        assert(p && p == memory_region_get_ram_ptr(mr));
>+
>+        return 0;
>+    }
>+
>+    pfn = phys_offset >> target_page_bits;
>+    start_gpfn = start_addr >> target_page_bits;
>+    nr_pages = size >> target_page_bits;
>+    rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, nr_pages, pfn,
>+                                        start_gpfn);
>+    if (rc) {
>+        int saved_errno = errno;
>+
>+        error_report("relocate_memory %lu pages from GFN %"HWADDR_PRIx
>+                     " to GFN %"HWADDR_PRIx" failed: %s",
>+                     nr_pages, pfn, start_gpfn, strerror(saved_errno));
>+        errno = saved_errno;
>+        return -1;
>+    }
>+
>+    rc = xendevicemodel_pin_memory_cacheattr(xen_dmod, xen_domid,
>+                                   start_addr >> target_page_bits,
>+                                   (start_addr + size - 1) >> target_page_bits,
>+                                   XEN_DOMCTL_MEM_CACHEATTR_WB);
>+    if (rc) {
>+        error_report("pin_memory_cacheattr failed: %s", strerror(errno));
>+    }
>+    return xen_save_physmap(state, physmap);
>+}
>+
>+static int xen_remove_from_physmap(XenIOState *state,
>+                                   hwaddr start_addr,
>+                                   ram_addr_t size)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    int rc = 0;
>+    XenPhysmap *physmap = NULL;
>+    hwaddr phys_offset = 0;
>+
>+    physmap = get_physmapping(start_addr, size, page_mask);
>+    if (physmap == NULL) {
>+        return -1;
>+    }
>+
>+    phys_offset = physmap->phys_offset;
>+    size = physmap->size;
>+
>+    DPRINTF("unmapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx", at "
>+            "%"HWADDR_PRIx"\n", start_addr, start_addr + size, phys_offset);
>+
>+    size >>= target_page_bits;
>+    start_addr >>= target_page_bits;
>+    phys_offset >>= target_page_bits;
>+    rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, size, start_addr,
>+                                        phys_offset);
>+    if (rc) {
>+        int saved_errno = errno;
>+
>+        error_report("relocate_memory "RAM_ADDR_FMT" pages"
>+                     " from GFN %"HWADDR_PRIx
>+                     " to GFN %"HWADDR_PRIx" failed: %s",
>+                     size, start_addr, phys_offset, strerror(saved_errno));
>+        errno = saved_errno;
>+        return -1;
>+    }
>+
>+    QLIST_REMOVE(physmap, list);
>+    if (log_for_dirtybit == physmap) {
>+        log_for_dirtybit = NULL;
>+        g_free(dirty_bitmap);
>+        dirty_bitmap = NULL;
>+    }
>+    g_free(physmap);
>+
>+    return 0;
>+}
>+
>+static void xen_sync_dirty_bitmap(XenIOState *state,
>+                                  hwaddr start_addr,
>+                                  ram_addr_t size)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    hwaddr npages = size >> target_page_bits;
>+    const int width = sizeof(unsigned long) * 8;
>+    size_t bitmap_size = DIV_ROUND_UP(npages, width);
>+    int rc, i, j;
>+    const XenPhysmap *physmap = NULL;
>+
>+    physmap = get_physmapping(start_addr, size, page_mask);
>+    if (physmap == NULL) {
>+        /* not handled */
>+        return;
>+    }
>+
>+    if (log_for_dirtybit == NULL) {
>+        log_for_dirtybit = physmap;
>+        dirty_bitmap = g_new(unsigned long, bitmap_size);
>+    } else if (log_for_dirtybit != physmap) {
>+        /* Only one range for dirty bitmap can be tracked. */
>+        return;
>+    }
>+
>+    rc = xen_track_dirty_vram(xen_domid, start_addr >> target_page_bits,
>+                              npages, dirty_bitmap);
>+    if (rc < 0) {
>+#ifndef ENODATA
>+#define ENODATA  ENOENT
>+#endif
>+        if (errno == ENODATA) {
>+            memory_region_set_dirty(framebuffer, 0, size);
>+            DPRINTF("xen: track_dirty_vram failed (0x" HWADDR_FMT_plx
>+                    ", 0x" HWADDR_FMT_plx "): %s\n",
>+                    start_addr, start_addr + size, strerror(errno));
>+        }
>+        return;
>+    }
>+
>+    for (i = 0; i < bitmap_size; i++) {
>+        unsigned long map = dirty_bitmap[i];
>+        while (map != 0) {
>+            j = ctzl(map);
>+            map &= ~(1ul << j);
>+            memory_region_set_dirty(framebuffer,
>+                                    (i * width + j) * page_size,
>+                                    page_size);
>+        };
>+    }
>+}
>+
>+static void xen_log_start(MemoryListener *listener,
>+                          MemoryRegionSection *section,
>+                          int old, int new)
>+{
>+    XenIOState *state = container_of(listener, XenIOState, memory_listener);
>+
>+    if (new & ~old & (1 << DIRTY_MEMORY_VGA)) {
>+        xen_sync_dirty_bitmap(state, section->offset_within_address_space,
>+                              int128_get64(section->size));
>+    }
>+}
>+
>+static void xen_log_stop(MemoryListener *listener, MemoryRegionSection *section,
>+                         int old, int new)
>+{
>+    if (old & ~new & (1 << DIRTY_MEMORY_VGA)) {
>+        log_for_dirtybit = NULL;
>+        g_free(dirty_bitmap);
>+        dirty_bitmap = NULL;
>+        /* Disable dirty bit tracking */
>+        xen_track_dirty_vram(xen_domid, 0, 0, NULL);
>+    }
>+}
>+
>+static void xen_log_sync(MemoryListener *listener, MemoryRegionSection *section)
>+{
>+    XenIOState *state = container_of(listener, XenIOState, memory_listener);
>+
>+    xen_sync_dirty_bitmap(state, section->offset_within_address_space,
>+                          int128_get64(section->size));
>+}
>+
>+static void xen_log_global_start(MemoryListener *listener)
>+{
>+    if (xen_enabled()) {
>+        xen_in_migration = true;
>+    }
>+}
>+
>+static void xen_log_global_stop(MemoryListener *listener)
>+{
>+    xen_in_migration = false;
>+}
>+
>+const MemoryListener xen_memory_listener = {
>+    .name = "xen-memory",
>+    .region_add = xen_region_add,
>+    .region_del = xen_region_del,
>+    .log_start = xen_log_start,
>+    .log_stop = xen_log_stop,
>+    .log_sync = xen_log_sync,
>+    .log_global_start = xen_log_global_start,
>+    .log_global_stop = xen_log_global_stop,
>+    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
>+};
>+
>+#ifdef XEN_COMPAT_PHYSMAP
>+void xen_read_physmap(XenIOState *state)
>+{
>+    XenPhysmap *physmap = NULL;
>+    unsigned int len, num, i;
>+    char path[80], *value = NULL;
>+    char **entries = NULL;
>+
>+    QLIST_INIT(&xen_physmap);
>+
>+    snprintf(path, sizeof(path),
>+            "/local/domain/0/device-model/%d/physmap", xen_domid);
>+    entries = xs_directory(state->xenstore, 0, path, &num);
>+    if (entries == NULL)
>+        return;
>+
>+    for (i = 0; i < num; i++) {
>+        physmap = g_new(XenPhysmap, 1);
>+        physmap->phys_offset = strtoull(entries[i], NULL, 16);
>+        snprintf(path, sizeof(path),
>+                "/local/domain/0/device-model/%d/physmap/%s/start_addr",
>+                xen_domid, entries[i]);
>+        value = xs_read(state->xenstore, 0, path, &len);
>+        if (value == NULL) {
>+            g_free(physmap);
>+            continue;
>+        }
>+        physmap->start_addr = strtoull(value, NULL, 16);
>+        free(value);
>+
>+        snprintf(path, sizeof(path),
>+                "/local/domain/0/device-model/%d/physmap/%s/size",
>+                xen_domid, entries[i]);
>+        value = xs_read(state->xenstore, 0, path, &len);
>+        if (value == NULL) {
>+            g_free(physmap);
>+            continue;
>+        }
>+        physmap->size = strtoull(value, NULL, 16);
>+        free(value);
>+
>+        snprintf(path, sizeof(path),
>+                "/local/domain/0/device-model/%d/physmap/%s/name",
>+                xen_domid, entries[i]);
>+        physmap->name = xs_read(state->xenstore, 0, path, &len);
>+
>+        QLIST_INSERT_HEAD(&xen_physmap, physmap, list);
>+    }
>+    free(entries);
>+}
>+#else
>+void xen_read_physmap(XenIOState *state)
>+{
>+    QLIST_INIT(&xen_physmap);
>+}
>+#endif
>+
>+void xen_register_framebuffer(MemoryRegion *mr)
>+{
>+    framebuffer = mr;
>+}
>+
>+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+
>+    if (unlikely(xen_in_migration)) {
>+        int rc;
>+        ram_addr_t start_pfn, nb_pages;
>+
>+        start = xen_phys_offset_to_gaddr(start, length, page_mask);
>+
>+        if (length == 0) {
>+            length = page_size;
>+        }
>+        start_pfn = start >> target_page_bits;
>+        nb_pages = ((start + length + page_size - 1) >> target_page_bits)
>+            - start_pfn;
>+        rc = xen_modified_memory(xen_domid, start_pfn, nb_pages);
>+        if (rc) {
>+            fprintf(stderr,
>+                    "%s failed for "RAM_ADDR_FMT" ("RAM_ADDR_FMT"): %i, %s\n",
>+                    __func__, start, nb_pages, errno, strerror(errno));
>+        }
>+    }
>+}
>+
>+void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>+{
>+    if (enable) {
>+        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
>+    } else {
>+        memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
>+    }
>+}
>+
>+void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>+                         bool add)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    hwaddr start_addr = section->offset_within_address_space;
>+    ram_addr_t size = int128_get64(section->size);
>+    bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
>+    hvmmem_type_t mem_type;
>+
>+    if (!memory_region_is_ram(section->mr)) {
>+        return;
>+    }
>+
>+    if (log_dirty != add) {
>+        return;
>+    }
>+
>+    trace_xen_client_set_memory(start_addr, size, log_dirty);
>+
>+    start_addr &= page_mask;
>+    size = ROUND_UP(size, page_size);
>+
>+    if (add) {
>+        if (!memory_region_is_rom(section->mr)) {
>+            xen_add_to_physmap(state, start_addr, size,
>+                               section->mr, section->offset_within_region);
>+        } else {
>+            mem_type = HVMMEM_ram_ro;
>+            if (xen_set_mem_type(xen_domid, mem_type,
>+                                 start_addr >> target_page_bits,
>+                                 size >> target_page_bits)) {
>+                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
>+                        start_addr);
>+            }
>+        }
>+    } else {
>+        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
>+            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
>+        }
>+    }
>+}
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index 3b9c31c1c8..5657693e1b 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -9,16 +9,11 @@
>  */
> 
> #include "qemu/osdep.h"
>-#include "qemu/units.h"
>-#include "qapi/error.h"
>-#include "qapi/qapi-commands-migration.h"
>-#include "trace.h"
> 
> #include "hw/i386/pc.h"
> #include "hw/irq.h"
> #include "hw/i386/apic-msidef.h"
> #include "hw/xen/xen-x86.h"
>-#include "qemu/range.h"
> 
> #include "hw/xen/xen-hvm-common.h"
> #include <xen/hvm/e820.h>
>@@ -26,8 +21,6 @@
> #include "cpu.h"
> 
> static MemoryRegion ram_640k, ram_lo, ram_hi;
>-static MemoryRegion *framebuffer;
>-static bool xen_in_migration;
> 
> /* Compatibility with older version */
> 
>@@ -56,10 +49,6 @@ typedef struct shared_vmport_iopage shared_vmport_iopage_t;
> 
> static shared_vmport_iopage_t *shared_vmport_page;
> 
>-static QLIST_HEAD(, XenPhysmap) xen_physmap;
>-static const XenPhysmap *log_for_dirtybit;
>-/* Buffer used by xen_sync_dirty_bitmap */
>-static unsigned long *dirty_bitmap;
> static Notifier suspend;
> static Notifier wakeup;
> 
>@@ -175,312 +164,6 @@ static void xen_ram_init(PCMachineState *pcms,
>     }
> }
> 
>-static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
>-                                   int page_mask)
>-{
>-    XenPhysmap *physmap = NULL;
>-
>-    start_addr &= page_mask;
>-
>-    QLIST_FOREACH(physmap, &xen_physmap, list) {
>-        if (range_covers_byte(physmap->start_addr, physmap->size, start_addr)) {
>-            return physmap;
>-        }
>-    }
>-    return NULL;
>-}
>-
>-static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size,
>-                                       int page_mask)
>-{
>-    hwaddr addr = phys_offset & page_mask;
>-    XenPhysmap *physmap = NULL;
>-
>-    QLIST_FOREACH(physmap, &xen_physmap, list) {
>-        if (range_covers_byte(physmap->phys_offset, physmap->size, addr)) {
>-            return physmap->start_addr + (phys_offset - physmap->phys_offset);
>-        }
>-    }
>-
>-    return phys_offset;
>-}
>-
>-#ifdef XEN_COMPAT_PHYSMAP
>-static int xen_save_physmap(XenIOState *state, XenPhysmap *physmap)
>-{
>-    char path[80], value[17];
>-
>-    snprintf(path, sizeof(path),
>-            "/local/domain/0/device-model/%d/physmap/%"PRIx64"/start_addr",
>-            xen_domid, (uint64_t)physmap->phys_offset);
>-    snprintf(value, sizeof(value), "%"PRIx64, (uint64_t)physmap->start_addr);
>-    if (!xs_write(state->xenstore, 0, path, value, strlen(value))) {
>-        return -1;
>-    }
>-    snprintf(path, sizeof(path),
>-            "/local/domain/0/device-model/%d/physmap/%"PRIx64"/size",
>-            xen_domid, (uint64_t)physmap->phys_offset);
>-    snprintf(value, sizeof(value), "%"PRIx64, (uint64_t)physmap->size);
>-    if (!xs_write(state->xenstore, 0, path, value, strlen(value))) {
>-        return -1;
>-    }
>-    if (physmap->name) {
>-        snprintf(path, sizeof(path),
>-                "/local/domain/0/device-model/%d/physmap/%"PRIx64"/name",
>-                xen_domid, (uint64_t)physmap->phys_offset);
>-        if (!xs_write(state->xenstore, 0, path,
>-                      physmap->name, strlen(physmap->name))) {
>-            return -1;
>-        }
>-    }
>-    return 0;
>-}
>-#else
>-static int xen_save_physmap(XenIOState *state, XenPhysmap *physmap)
>-{
>-    return 0;
>-}
>-#endif
>-
>-static int xen_add_to_physmap(XenIOState *state,
>-                              hwaddr start_addr,
>-                              ram_addr_t size,
>-                              MemoryRegion *mr,
>-                              hwaddr offset_within_region)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-    unsigned long nr_pages;
>-    int rc = 0;
>-    XenPhysmap *physmap = NULL;
>-    hwaddr pfn, start_gpfn;
>-    hwaddr phys_offset = memory_region_get_ram_addr(mr);
>-    const char *mr_name;
>-
>-    if (get_physmapping(start_addr, size, page_mask)) {
>-        return 0;
>-    }
>-    if (size <= 0) {
>-        return -1;
>-    }
>-
>-    /* Xen can only handle a single dirty log region for now and we want
>-     * the linear framebuffer to be that region.
>-     * Avoid tracking any regions that is not videoram and avoid tracking
>-     * the legacy vga region. */
>-    if (mr == framebuffer && start_addr > 0xbffff) {
>-        goto go_physmap;
>-    }
>-    return -1;
>-
>-go_physmap:
>-    DPRINTF("mapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx"\n",
>-            start_addr, start_addr + size);
>-
>-    mr_name = memory_region_name(mr);
>-
>-    physmap = g_new(XenPhysmap, 1);
>-
>-    physmap->start_addr = start_addr;
>-    physmap->size = size;
>-    physmap->name = mr_name;
>-    physmap->phys_offset = phys_offset;
>-
>-    QLIST_INSERT_HEAD(&xen_physmap, physmap, list);
>-
>-    if (runstate_check(RUN_STATE_INMIGRATE)) {
>-        /* Now when we have a physmap entry we can replace a dummy mapping with
>-         * a real one of guest foreign memory. */
>-        uint8_t *p = xen_replace_cache_entry(phys_offset, start_addr, size);
>-        assert(p && p == memory_region_get_ram_ptr(mr));
>-
>-        return 0;
>-    }
>-
>-    pfn = phys_offset >> target_page_bits;
>-    start_gpfn = start_addr >> target_page_bits;
>-    nr_pages = size >> target_page_bits;
>-    rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, nr_pages, pfn,
>-                                        start_gpfn);
>-    if (rc) {
>-        int saved_errno = errno;
>-
>-        error_report("relocate_memory %lu pages from GFN %"HWADDR_PRIx
>-                     " to GFN %"HWADDR_PRIx" failed: %s",
>-                     nr_pages, pfn, start_gpfn, strerror(saved_errno));
>-        errno = saved_errno;
>-        return -1;
>-    }
>-
>-    rc = xendevicemodel_pin_memory_cacheattr(xen_dmod, xen_domid,
>-                                   start_addr >> target_page_bits,
>-                                   (start_addr + size - 1) >> target_page_bits,
>-                                   XEN_DOMCTL_MEM_CACHEATTR_WB);
>-    if (rc) {
>-        error_report("pin_memory_cacheattr failed: %s", strerror(errno));
>-    }
>-    return xen_save_physmap(state, physmap);
>-}
>-
>-static int xen_remove_from_physmap(XenIOState *state,
>-                                   hwaddr start_addr,
>-                                   ram_addr_t size)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-    int rc = 0;
>-    XenPhysmap *physmap = NULL;
>-    hwaddr phys_offset = 0;
>-
>-    physmap = get_physmapping(start_addr, size, page_mask);
>-    if (physmap == NULL) {
>-        return -1;
>-    }
>-
>-    phys_offset = physmap->phys_offset;
>-    size = physmap->size;
>-
>-    DPRINTF("unmapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx", at "
>-            "%"HWADDR_PRIx"\n", start_addr, start_addr + size, phys_offset);
>-
>-    size >>= target_page_bits;
>-    start_addr >>= target_page_bits;
>-    phys_offset >>= target_page_bits;
>-    rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, size, start_addr,
>-                                        phys_offset);
>-    if (rc) {
>-        int saved_errno = errno;
>-
>-        error_report("relocate_memory "RAM_ADDR_FMT" pages"
>-                     " from GFN %"HWADDR_PRIx
>-                     " to GFN %"HWADDR_PRIx" failed: %s",
>-                     size, start_addr, phys_offset, strerror(saved_errno));
>-        errno = saved_errno;
>-        return -1;
>-    }
>-
>-    QLIST_REMOVE(physmap, list);
>-    if (log_for_dirtybit == physmap) {
>-        log_for_dirtybit = NULL;
>-        g_free(dirty_bitmap);
>-        dirty_bitmap = NULL;
>-    }
>-    g_free(physmap);
>-
>-    return 0;
>-}
>-
>-static void xen_sync_dirty_bitmap(XenIOState *state,
>-                                  hwaddr start_addr,
>-                                  ram_addr_t size)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-    hwaddr npages = size >> target_page_bits;
>-    const int width = sizeof(unsigned long) * 8;
>-    size_t bitmap_size = DIV_ROUND_UP(npages, width);
>-    int rc, i, j;
>-    const XenPhysmap *physmap = NULL;
>-
>-    physmap = get_physmapping(start_addr, size, page_mask);
>-    if (physmap == NULL) {
>-        /* not handled */
>-        return;
>-    }
>-
>-    if (log_for_dirtybit == NULL) {
>-        log_for_dirtybit = physmap;
>-        dirty_bitmap = g_new(unsigned long, bitmap_size);
>-    } else if (log_for_dirtybit != physmap) {
>-        /* Only one range for dirty bitmap can be tracked. */
>-        return;
>-    }
>-
>-    rc = xen_track_dirty_vram(xen_domid, start_addr >> target_page_bits,
>-                              npages, dirty_bitmap);
>-    if (rc < 0) {
>-#ifndef ENODATA
>-#define ENODATA  ENOENT
>-#endif
>-        if (errno == ENODATA) {
>-            memory_region_set_dirty(framebuffer, 0, size);
>-            DPRINTF("xen: track_dirty_vram failed (0x" HWADDR_FMT_plx
>-                    ", 0x" HWADDR_FMT_plx "): %s\n",
>-                    start_addr, start_addr + size, strerror(errno));
>-        }
>-        return;
>-    }
>-
>-    for (i = 0; i < bitmap_size; i++) {
>-        unsigned long map = dirty_bitmap[i];
>-        while (map != 0) {
>-            j = ctzl(map);
>-            map &= ~(1ul << j);
>-            memory_region_set_dirty(framebuffer,
>-                                    (i * width + j) * page_size, page_size);
>-        };
>-    }
>-}
>-
>-static void xen_log_start(MemoryListener *listener,
>-                          MemoryRegionSection *section,
>-                          int old, int new)
>-{
>-    XenIOState *state = container_of(listener, XenIOState, memory_listener);
>-
>-    if (new & ~old & (1 << DIRTY_MEMORY_VGA)) {
>-        xen_sync_dirty_bitmap(state, section->offset_within_address_space,
>-                              int128_get64(section->size));
>-    }
>-}
>-
>-static void xen_log_stop(MemoryListener *listener, MemoryRegionSection *section,
>-                         int old, int new)
>-{
>-    if (old & ~new & (1 << DIRTY_MEMORY_VGA)) {
>-        log_for_dirtybit = NULL;
>-        g_free(dirty_bitmap);
>-        dirty_bitmap = NULL;
>-        /* Disable dirty bit tracking */
>-        xen_track_dirty_vram(xen_domid, 0, 0, NULL);
>-    }
>-}
>-
>-static void xen_log_sync(MemoryListener *listener, MemoryRegionSection *section)
>-{
>-    XenIOState *state = container_of(listener, XenIOState, memory_listener);
>-
>-    xen_sync_dirty_bitmap(state, section->offset_within_address_space,
>-                          int128_get64(section->size));
>-}
>-
>-static void xen_log_global_start(MemoryListener *listener)
>-{
>-    if (xen_enabled()) {
>-        xen_in_migration = true;
>-    }
>-}
>-
>-static void xen_log_global_stop(MemoryListener *listener)
>-{
>-    xen_in_migration = false;
>-}
>-
>-const MemoryListener xen_memory_listener = {
>-    .name = "xen-memory",
>-    .region_add = xen_region_add,
>-    .region_del = xen_region_del,
>-    .log_start = xen_log_start,
>-    .log_stop = xen_log_stop,
>-    .log_sync = xen_log_sync,
>-    .log_global_start = xen_log_global_start,
>-    .log_global_stop = xen_log_global_stop,
>-    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
>-};
>-
> static void regs_to_cpu(vmware_regs_t *vmport_regs, ioreq_t *req)
> {
>     X86CPU *cpu;
>@@ -524,63 +207,6 @@ static void handle_vmport_ioreq(XenIOState *state, ioreq_t *req)
>     current_cpu = NULL;
> }
> 
>-#ifdef XEN_COMPAT_PHYSMAP
>-void xen_read_physmap(XenIOState *state)
>-{
>-    XenPhysmap *physmap = NULL;
>-    unsigned int len, num, i;
>-    char path[80], *value = NULL;
>-    char **entries = NULL;
>-
>-    QLIST_INIT(&xen_physmap);
>-
>-    snprintf(path, sizeof(path),
>-            "/local/domain/0/device-model/%d/physmap", xen_domid);
>-    entries = xs_directory(state->xenstore, 0, path, &num);
>-    if (entries == NULL)
>-        return;
>-
>-    for (i = 0; i < num; i++) {
>-        physmap = g_new(XenPhysmap, 1);
>-        physmap->phys_offset = strtoull(entries[i], NULL, 16);
>-        snprintf(path, sizeof(path),
>-                "/local/domain/0/device-model/%d/physmap/%s/start_addr",
>-                xen_domid, entries[i]);
>-        value = xs_read(state->xenstore, 0, path, &len);
>-        if (value == NULL) {
>-            g_free(physmap);
>-            continue;
>-        }
>-        physmap->start_addr = strtoull(value, NULL, 16);
>-        free(value);
>-
>-        snprintf(path, sizeof(path),
>-                "/local/domain/0/device-model/%d/physmap/%s/size",
>-                xen_domid, entries[i]);
>-        value = xs_read(state->xenstore, 0, path, &len);
>-        if (value == NULL) {
>-            g_free(physmap);
>-            continue;
>-        }
>-        physmap->size = strtoull(value, NULL, 16);
>-        free(value);
>-
>-        snprintf(path, sizeof(path),
>-                "/local/domain/0/device-model/%d/physmap/%s/name",
>-                xen_domid, entries[i]);
>-        physmap->name = xs_read(state->xenstore, 0, path, &len);
>-
>-        QLIST_INSERT_HEAD(&xen_physmap, physmap, list);
>-    }
>-    free(entries);
>-}
>-#else
>-void xen_read_physmap(XenIOState *state)
>-{
>-    QLIST_INIT(&xen_physmap);
>-}
>-#endif
>-
> static void xen_wakeup_notifier(Notifier *notifier, void *data)
> {
>     xc_set_hvm_param(xen_xc, xen_domid, HVM_PARAM_ACPI_S_STATE, 0);
>@@ -635,91 +261,6 @@ err:
>     exit(1);
> }
> 
>-void xen_register_framebuffer(MemoryRegion *mr)
>-{
>-    framebuffer = mr;
>-}
>-
>-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-
>-    if (unlikely(xen_in_migration)) {
>-        int rc;
>-        ram_addr_t start_pfn, nb_pages;
>-
>-        start = xen_phys_offset_to_gaddr(start, length, page_mask);
>-
>-        if (length == 0) {
>-            length = page_size;
>-        }
>-        start_pfn = start >> target_page_bits;
>-        nb_pages = ((start + length + page_size - 1) >> target_page_bits)
>-            - start_pfn;
>-        rc = xen_modified_memory(xen_domid, start_pfn, nb_pages);
>-        if (rc) {
>-            fprintf(stderr,
>-                    "%s failed for "RAM_ADDR_FMT" ("RAM_ADDR_FMT"): %i, %s\n",
>-                    __func__, start, nb_pages, errno, strerror(errno));
>-        }
>-    }
>-}
>-
>-void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>-{
>-    if (enable) {
>-        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
>-    } else {
>-        memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
>-    }
>-}
>-
>-void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>-                         bool add)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-    hwaddr start_addr = section->offset_within_address_space;
>-    ram_addr_t size = int128_get64(section->size);
>-    bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
>-    hvmmem_type_t mem_type;
>-
>-    if (!memory_region_is_ram(section->mr)) {
>-        return;
>-    }
>-
>-    if (log_dirty != add) {
>-        return;
>-    }
>-
>-    trace_xen_client_set_memory(start_addr, size, log_dirty);
>-
>-    start_addr &= page_mask;
>-    size = ROUND_UP(size, page_size);
>-
>-    if (add) {
>-        if (!memory_region_is_rom(section->mr)) {
>-            xen_add_to_physmap(state, start_addr, size,
>-                               section->mr, section->offset_within_region);
>-        } else {
>-            mem_type = HVMMEM_ram_ro;
>-            if (xen_set_mem_type(xen_domid, mem_type,
>-                                 start_addr >> target_page_bits,
>-                                 size >> target_page_bits)) {
>-                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
>-                        start_addr);
>-            }
>-        }
>-    } else {
>-        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
>-            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
>-        }
>-    }
>-}
>-
> void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> {
>     switch (req->type) {
>diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
>index 3f0df8bc07..d38759cfe4 100644
>--- a/hw/i386/xen/meson.build
>+++ b/hw/i386/xen/meson.build
>@@ -1,6 +1,7 @@
> i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>   'xen_apic.c',
>   'xen_pvdevice.c',
>+  'xen-hvm-common.c',
> ))
> i386_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
>   'xen-hvm.c',
>-- 
>2.41.0
>
>


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

