Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A7A547A0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 11:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903299.1311207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8NE-0007t4-C8; Thu, 06 Mar 2025 10:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903299.1311207; Thu, 06 Mar 2025 10:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8NE-0007rX-92; Thu, 06 Mar 2025 10:22:40 +0000
Received: by outflank-mailman (input) for mailman id 903299;
 Thu, 06 Mar 2025 10:18:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=InyT=VZ=gmail.com=alemuggianu@srs-se1.protection.inumbo.net>)
 id 1tq8J7-0006sW-IY
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 10:18:25 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 559734d9-fa74-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 11:18:23 +0100 (CET)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6ef9b8b4f13so4591927b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 02:18:23 -0800 (PST)
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
X-Inumbo-ID: 559734d9-fa74-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741256302; x=1741861102; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bw/+l6pBwPqatnRtYR8R6NAHL9Sc45JxDkxne1BYq1U=;
        b=mNyggtiePZMHylOP9oq2WBIet0QEdBHcBHKASpJ0OV4s8+JEaOUjHxkb6XMGdVLkRD
         /pemMHa/ryo9SuBXThDrrUdAcESfWhIkSWVgtfj8ngy9E4rMMc0k+LkbfBR4Uo+0OacD
         HecXZuxC9iexlXvCVDT3ucRzBPO1CccfDJnlYa6i3HyZypntwll+Ogn67JXPVwYoZw3C
         B+QKVYqMK//Yh/BYKf5RqFzw5AM0SDVkh2+L/odrmTqdZ7jekP1bA5EsU6kGtjZKgSsr
         SHz+TGbpCVYKfZnoa79IeWPgLOoTYC+gJpzS3IupGyaGv3q/NlnxUGUYo+cXVuFjQtnA
         MzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256302; x=1741861102;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bw/+l6pBwPqatnRtYR8R6NAHL9Sc45JxDkxne1BYq1U=;
        b=ivJqgCMfOdsGrYHEhFxbM7sv83rPV3Z+1wY8picPfjFwMF7HviHj9XoyfuF0AyrsB+
         FHhOJ2mdAAb58yBhvwZUotEVUfRWrvN72Vzr53hTGSqq/DflgGaJDmHmt8TnqNQmS45i
         NyXKRDCmbBGvrCTsXvAgZ3yu2zQkk9UL5rsVpOHT3PV7Qy4FJKRqoausdkOrv6tGMsuc
         SCEG0ojvC5eThAIo2jHdgtcKsB0zlNEY5dIB9SPdVkrdK1rudriWYmksYRy3I4OtVIoQ
         jAPaOGoeqh3AbyOjIKEDcotqXEFtfCQRFM5wssP9D2lCUcuIvs3IaFVpAxQ81MYGP20r
         gGOA==
X-Gm-Message-State: AOJu0YxFF3wyhn1uIwkrQPNtjPQsVLN4dhlAB/5E3ItDtesXnzFsiYml
	WnDjwu0H3RUtNT/zWMJWfhJEPzl8+4gB40V8qqJVKyZbCBQMRvQtWR7Oe3TmGfEJJC3YZBupYIR
	fzC1ZTb7gWcv4aH3QPv245RxBPWirJnDM
X-Gm-Gg: ASbGnctmRiJWrPyRl0loj0h82HVZX2uN0AXIhNJK1OWiF80Cm3vUyij+BqHrisaWckF
	8tJowaaA+f1z7rTGMERrS3TYbeybCrwW4bChVL7UMplfPyVdYQ6kG6lFJXKidW5bCXeMDTFvF39
	w5FekRP9GqjHjiIHfaJ0dcCF0e
X-Google-Smtp-Source: AGHT+IEmOfH21w87fNbzWlvJ1Y1zAkcsRApJrxEEOiKbcJRqyIfykXsz4uvLFkFDTIfEXhs5Z3XG4DZUbVpvLq57XVk=
X-Received: by 2002:a05:690c:64c1:b0:6ee:5cf9:f898 with SMTP id
 00721157ae682-6fda306751bmr92625057b3.33.1741256302386; Thu, 06 Mar 2025
 02:18:22 -0800 (PST)
MIME-Version: 1.0
From: Alessandro Muggianu <alemuggianu@gmail.com>
Date: Thu, 6 Mar 2025 10:18:11 +0000
X-Gm-Features: AQ5f1JqMSAIqaYsl-pO5o-vnmxlmKGWC24r-1uqiKbIS-LwPmo309-5gUZZ3tKA
Message-ID: <CAOiua5Ojg9s24eaQkfDuUBMJffABuBEMkohHTjuF5b=-oE3ADw@mail.gmail.com>
Subject: [RFC] qxl: add additional vram regions to Xen physmap
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, 
	Paul Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Using QXL graphics on Windows 10 hvm domains causes the guest to become
extremely slow. The behaviour will happen as soon as Windows loads the
driver, so the VM will initially work normally while the OS is loading.

This was reproduced on the current master but to my knowledge it's
always been an issue for Windows 10 guests on Xen (issue is not present
on KVM).

The normal VGA display adapter uses a single vram memory region which is
registered as the Xen framebuffer with xen_register_framebuffer().
This will cause it to be mapped to the Xen physmap in xen_add_to_physmap().

In the case of one or multiple QXL devices, only the first memory region
of the first (primary) device will be registered with Xen as framebuffer
and added to physmap (since it reuses the vga code), while I think all
other memory regions will be accessed via the IOREQ server, which
probably has too much overhead and seems to be the cause of the
unresponsive guest.

We made an attempt at fixing the problem by forcing those memory regions
to be added to the Xen physmap in xen_add_to_physmap().

This solves the performance issue and seems to be enough to make
QXL work. Multi-screen, additional resolutions, etc., all seems fine.

However, there is a lot I don't understand so I am not sure the change
is sensible. Hoping to get some expert eyes on this.

I see these issues with the current change:

* Broken migration. When trying to restore the domain, this assertion
  will fail for the qxl memory regions I added to the physmap (the ones
  named "qxl.vram" or "qxl.vgavram"), because the address returned by
  xen_replace_cache_entry() is different from what we get from
  memory_region_get_ram_ptr():

    qemu-system-i386: ../hw/i386/xen/xen-hvm.c:317:
xen_add_to_physmap: Assertion `p && p ==
memory_region_get_ram_ptr(mr)' failed.

  If I understand correctly, we try to recreate the physmap entry for
  the region by calling xen_replace_cache_entry(), which retrieves
  the guest memory address using xenforeignmemory_map2(), since the VRAM
  should belong to the guest and not QEMU (however this might not be the
  case for the QXL memory regions?). The address we obtain should
  also match the one obtained through memory_region_get_ram_ptr(),
  which (I think) will come from the restored VM state.

  In qxl.c, I'm only calling memory_region_get_ram_ptr(&qxl->vram_bar)
  to ensure the region is mapped on the host (not doing so will cause
  issues later), but I'm not using the returned pointer anywhere.
  Maybe it's supposed to be saved with the VM state?

* Now that I'm using a list of regions registered as Xen framebuffer, I
  don't know what to do in xen_sync_dirty_bitmap(). At the moment I
  forced it to only call memory_region_set_dirty() on the "original"
  framebuffer in a quick and dirty way, since it seems like we get there
  only from the vga code but not from the QXL code, which seems to use
  memory_region_set_dirty() instead (from qxl_set_dirty()).

* I used memory_region_set_log(<qxl_mem_region>, true, DIRTY_MEMORY_VGA)
   or the regions won't be actually added in arch_xen_set_memory(). I don't
   know if that's the right call, I just copied what we do for std VGA.

Hoping there isn't a fundamental issue with the approach, it would be
great to have this working!

The issue should be easy to reproduce but please let me know if I failed
to provide some important information.

Thank you,

Alessandro

---

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 7178dec85d..80dc0b2131 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -29,6 +29,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
+#include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "trace.h"
@@ -2139,11 +2140,14 @@ static void qxl_realize_common(PCIQXLDevice
*qxl, Error **errp)
     memory_region_init_alias(&qxl->vram32_bar, OBJECT(qxl), "qxl.vram32",
                              &qxl->vram_bar, 0, qxl->vram32_size);

+    memory_region_get_ram_ptr(&qxl->vram_bar);
     memory_region_init_io(&qxl->io_bar, OBJECT(qxl), &qxl_io_ops, qxl,
                           "qxl-ioports", io_size);
     if (qxl->have_vga) {
         vga_dirty_log_start(&qxl->vga);
     }
+    xen_register_framebuffer(&qxl->vram_bar);
+    memory_region_set_log(&qxl->vram_bar, true, DIRTY_MEMORY_VGA);
     memory_region_set_flush_coalesced(&qxl->io_bar);


@@ -2268,6 +2272,9 @@ static void qxl_realize_secondary(PCIDevice
*dev, Error **errp)
     qxl->id = qemu_console_get_index(qxl->vga.con); /* == channel_id */

     qxl_realize_common(qxl, errp);
+
+    xen_register_framebuffer(&qxl->vga.vram);
+    memory_region_set_log(&qxl->vga.vram, true, DIRTY_MEMORY_VGA);
 }

 static int qxl_pre_save(void *opaque)
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 4f6446600c..33c7c14804 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -14,6 +14,8 @@
 #include "qapi/qapi-commands-migration.h"
 #include "trace.h"

+#include "exec/ramblock.h"
+
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
 #include "hw/i386/apic-msidef.h"
@@ -26,7 +28,7 @@
 #include "exec/target_page.h"

 static MemoryRegion ram_640k, ram_lo, ram_hi;
-static MemoryRegion *framebuffer;
+static QLIST_HEAD(, XenFramebuffer) xen_framebuffer;
 static bool xen_in_migration;

 /* Compatibility with older version */
@@ -175,6 +177,17 @@ static void xen_ram_init(PCMachineState *pcms,
     }
 }

+static MemoryRegion *get_framebuffer_by_name(const char *name) {
+    XenFramebuffer *fb = NULL;
+
+    QLIST_FOREACH(fb, &xen_framebuffer, list) {
+        if (g_strcmp0(memory_region_name(fb->mr), name) == 0) {
+            return fb->mr;
+        }
+    }
+    return NULL;
+}
+
 static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
                                    int page_mask)
 {
@@ -254,6 +267,7 @@ static int xen_add_to_physmap(XenIOState *state,
     unsigned long nr_pages;
     int rc = 0;
     XenPhysmap *physmap = NULL;
+    XenFramebuffer *fb = NULL;
     hwaddr pfn, start_gpfn;
     hwaddr phys_offset = memory_region_get_ram_addr(mr);
     const char *mr_name;
@@ -269,9 +283,14 @@ static int xen_add_to_physmap(XenIOState *state,
      * the linear framebuffer to be that region.
      * Avoid tracking any regions that is not videoram and avoid tracking
      * the legacy vga region. */
-    if (mr == framebuffer && start_addr > 0xbffff) {
-        goto go_physmap;
+    if (start_addr > 0xbffff) {
+        QLIST_FOREACH(fb, &xen_framebuffer, list) {
+            if (mr == fb->mr) {
+                goto go_physmap;
+            }
+        }
     }
+
     return -1;

 go_physmap:
@@ -293,6 +312,7 @@ go_physmap:
         /* Now when we have a physmap entry we can replace a dummy mapping with
          * a real one of guest foreign memory. */
         uint8_t *p = xen_replace_cache_entry(phys_offset, start_addr, size);
+        // For qxl.vram this assert will fail
         assert(p && p == memory_region_get_ram_ptr(mr));

         return 0;
@@ -406,7 +426,8 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
 #define ENODATA  ENOENT
 #endif
         if (errno == ENODATA) {
-            memory_region_set_dirty(framebuffer, 0, size);
+            MemoryRegion *fb = get_framebuffer_by_name("vga.vram");
+            memory_region_set_dirty(fb, 0, size);
             DPRINTF("xen: track_dirty_vram failed (0x" HWADDR_FMT_plx
                     ", 0x" HWADDR_FMT_plx "): %s\n",
                     start_addr, start_addr + size, strerror(errno));
@@ -419,8 +440,10 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
         while (map != 0) {
             j = ctzl(map);
             map &= ~(1ul << j);
-            memory_region_set_dirty(framebuffer,
-                                    (i * width + j) * page_size, page_size);
+            MemoryRegion *fb = get_framebuffer_by_name("vga.vram");
+            memory_region_set_dirty(fb,
+                                   (i * width + j) * page_size, page_size);
+
         };
     }
 }
@@ -618,6 +641,8 @@ void xen_hvm_init_pc(PCMachineState *pcms,
MemoryRegion **ram_memory)

     xen_is_stubdomain = xen_check_stubdomain(state->xenstore);

+    QLIST_INIT(&xen_framebuffer);
+
     QLIST_INIT(&xen_physmap);
     xen_read_physmap(state);

@@ -658,7 +683,12 @@ err:

 void xen_register_framebuffer(MemoryRegion *mr)
 {
-    framebuffer = mr;
+    XenFramebuffer *fb = NULL;
+
+    fb= g_new(XenFramebuffer, 1);
+    fb->mr = mr;
+
+    QLIST_INSERT_HEAD(&xen_framebuffer, fb, list);
 }

 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 3d796235dc..8eba992c55 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -43,6 +43,13 @@ static inline ioreq_t
*xen_vcpu_ioreq(shared_iopage_t *shared_page, int vcpu)

 #define BUFFER_IO_MAX_DELAY  100

+typedef struct XenFramebuffer {
+    MemoryRegion *mr;
+
+    QLIST_ENTRY(XenFramebuffer) list;
+} XenFramebuffer;
+
+
 typedef struct XenPhysmap {
     hwaddr start_addr;
     ram_addr_t size;

