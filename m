Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E23E874EA7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689846.1075206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCaQ-0002BV-Kx; Thu, 07 Mar 2024 12:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689846.1075206; Thu, 07 Mar 2024 12:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCaQ-00029S-Hh; Thu, 07 Mar 2024 12:10:58 +0000
Received: by outflank-mailman (input) for mailman id 689846;
 Thu, 07 Mar 2024 12:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riCaO-00029K-BX
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:10:56 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf351c79-dc7b-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 13:10:54 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41312890df0so2511245e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 04:10:54 -0800 (PST)
Received: from meli.delivery (adsl-101.109.242.224.tellas.gr.
 [109.242.224.101]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b00413099fc248sm2535514wmo.3.2024.03.07.04.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 04:10:53 -0800 (PST)
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
X-Inumbo-ID: bf351c79-dc7b-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709813454; x=1710418254; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VChtDWH+qLD7Mp6r4cSwpKorizYtCui+hljfjCqt8Mo=;
        b=hmEng2M8YRHA6WzBkl843CA+w/RvaFKEKyy4IX4Z2vsFpSZeDtTmcVnCdvn8GhW8pW
         6Olh2C+sucqEhNUzkk/7nGphStKRfaB3B5T9YojvYm9AB3RgL+ahwri/eS1TE7smihVc
         j0CuA2+5MQbzYd14dDvRSC7SDah54zrKlMTTQIy42w6wDxAimU7t4yEZgrAT4BrykVZO
         hQsZygDZiKryD39RF0Mqv1muTOFbOHLUq9CXOVoP3ZdjYfTSqvbfA1fKuKCyG9UV/ItU
         I2sjOW7+XnS3ambnjtE1yZjYk+/H1p8m0PntbILzoafCuWMC9HFVqpgZKSvPPxqeDghX
         4q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709813454; x=1710418254;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VChtDWH+qLD7Mp6r4cSwpKorizYtCui+hljfjCqt8Mo=;
        b=eNjsRzElmPK+UJIC/m2V7IdSvV9FEwqerQ7CVTktpZMQweMjY7PALk/ullg3Cz2TFt
         k6BUzAnFC3WJf/o2y3zd7I7gSG4F7SiJJplz0KfzkA7SUfk8abZ1yYAEOyrxR+aZY7js
         QLRSqCS3Vc/m+euznhGk3XoAEolqqeclkfwKj4INUCDK20UvJrBuznCxLLtQGZ3lQt33
         YxWKlwuhNXHg07PCRiEPDA0tITx5AshuA0QLueRVCve1jRswYf9wcJwUPOLHDs8TqJQp
         KCY9uIucWhaJ0U53LQOKDpX+fEy3SEP9snNtLSwd7jrbeqhBwi0aLdvQAcqLX3hryUF8
         1t9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1F4lhe+BciKInP+kEb2yyntwKnpliM5QYTqL10tBTX2XZH+zwh71JU+z2QEpI11C6K5QpEL7iTk20g1/h4STy4kaueenk20JS7ecFkxQ=
X-Gm-Message-State: AOJu0YxTZF8NALWOmKz/u1TUbBZxw3nttvZgBzIfi55jrXS19vUivKvQ
	97z74zMrB3pvdf4v08IOcs/XHfTq7xms2rIHHqvx8kXd+DMBb8z+FyMFpUe+J+c=
X-Google-Smtp-Source: AGHT+IG5z5IjVvtvOh5lFpn2L/IBKC3TeobA4WgnMiVUeb4EgtJ2NdEDpXSSrkWV2Mm0pxt9sAidoA==
X-Received: by 2002:a05:600c:4f51:b0:413:7f:dc4c with SMTP id m17-20020a05600c4f5100b00413007fdc4cmr2350715wmq.5.1709813453708;
        Thu, 07 Mar 2024 04:10:53 -0800 (PST)
Date: Thu, 07 Mar 2024 14:03:13 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [RFC PATCH-for-9.0 8/9] hw/xen/hvm: Merge xen-hvm-common.c files
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-9-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-9-philmd@linaro.org>
Message-ID: <9z8i3.ib1i46u337uu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>hw/i386/xen/xen-hvm-common.c content is target agnostic,
>and should be common to all targets. Merge both files.
>Remove the now unnecessary xen_register_framebuffer() stub.
>
>ARM targets now inherit the common xen_memory_listener.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/arm/xen_arm.c             |  24 --
> hw/i386/xen/xen-hvm-common.c | 473 -----------------------------------
> hw/xen/xen-hvm-common.c      | 458 +++++++++++++++++++++++++++++++++
> stubs/xen-hw-stub.c          |   4 -
> hw/i386/xen/meson.build      |   1 -
> 5 files changed, 458 insertions(+), 502 deletions(-)
> delete mode 100644 hw/i386/xen/xen-hvm-common.c
>
>diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>index 39dcd74d07..0ead84c9e1 100644
>--- a/hw/arm/xen_arm.c
>+++ b/hw/arm/xen_arm.c
>@@ -38,17 +38,6 @@
> #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
> OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
> 
>-const MemoryListener xen_memory_listener = {
>-    .region_add = xen_region_add,
>-    .region_del = xen_region_del,
>-    .log_start = NULL,
>-    .log_stop = NULL,
>-    .log_sync = NULL,
>-    .log_global_start = NULL,
>-    .log_global_stop = NULL,
>-    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
>-};
>-
> struct XenArmState {
>     /*< private >*/
>     MachineState parent;
>@@ -136,19 +125,6 @@ void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
>     return;
> }
> 
>-void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>-                         bool add)
>-{
>-}
>-
>-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>-{
>-}
>-
>-void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>-{
>-}


I think this is not correct, Xen on arm does not do migration and does 
not handle memory (the hardware does). We should keep the stubs here.

And not merge the physmapping/dirty mapping of i386 to the common code.

.. which I guess means xen_memory_listener cannot be shared either. 
Unless it's non-const and i386 code sets the log_* callback fields on 
init.

>-
> #ifdef CONFIG_TPM
> static void xen_enable_tpm(XenArmState *xam)
> {
>diff --git a/hw/i386/xen/xen-hvm-common.c b/hw/i386/xen/xen-hvm-common.c
>deleted file mode 100644
>index e8ef0e0c94..0000000000
>--- a/hw/i386/xen/xen-hvm-common.c
>+++ /dev/null
>@@ -1,473 +0,0 @@
>-/*
>- * Copyright (C) 2010       Citrix Ltd.
>- *
>- * This work is licensed under the terms of the GNU GPL, version 2.  See
>- * the COPYING file in the top-level directory.
>- *
>- * Contributions after 2012-01-13 are licensed under the terms of the
>- * GNU GPL, version 2 or (at your option) any later version.
>- */
>-
>-#include "qemu/osdep.h"
>-#include "qemu/range.h"
>-#include "qapi/qapi-commands-migration.h"
>-#include "exec/target_page.h"
>-#include "hw/xen/xen-hvm-common.h"
>-#include "trace.h"
>-
>-static MemoryRegion *framebuffer;
>-static bool xen_in_migration;
>-
>-static QLIST_HEAD(, XenPhysmap) xen_physmap;
>-static const XenPhysmap *log_for_dirtybit;
>-/* Buffer used by xen_sync_dirty_bitmap */
>-static unsigned long *dirty_bitmap;
>-
>-static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
>-                                   int page_mask)
>-{
>-    XenPhysmap *physmap = NULL;
>-
>-    start_addr &= -page_mask;
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
>-    hwaddr addr = phys_offset & -page_mask;
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
>-                                    (i * width + j) * page_size,
>-                                    page_size);
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
>diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
>index 73fa2c414d..50ce45effc 100644
>--- a/hw/xen/xen-hvm-common.c
>+++ b/hw/xen/xen-hvm-common.c
>@@ -1,7 +1,9 @@
> #include "qemu/osdep.h"
> #include "qemu/units.h"
> #include "qemu/bitops.h"
>+#include "qemu/range.h"
> #include "qapi/error.h"
>+#include "qapi/qapi-commands-migration.h"
> #include "exec/target_page.h"
> #include "trace.h"
> 
>@@ -11,6 +13,462 @@
> #include "hw/boards.h"
> 
> MemoryRegion xen_memory;
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
> 
> void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>                    Error **errp)
>diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
>index 53c6a6f2a0..da8912f037 100644
>--- a/stubs/xen-hw-stub.c
>+++ b/stubs/xen-hw-stub.c
>@@ -13,7 +13,3 @@ int xen_is_pirq_msi(uint32_t msi_data)
> {
>     return 0;
> }
>-
>-void xen_register_framebuffer(MemoryRegion *mr)
>-{
>-}
>diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
>index d38759cfe4..3f0df8bc07 100644
>--- a/hw/i386/xen/meson.build
>+++ b/hw/i386/xen/meson.build
>@@ -1,7 +1,6 @@
> i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>   'xen_apic.c',
>   'xen_pvdevice.c',
>-  'xen-hvm-common.c',
> ))
> i386_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
>   'xen-hvm.c',
>-- 
>2.41.0
>
>

