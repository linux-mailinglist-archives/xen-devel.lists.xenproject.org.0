Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89827CFE49
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619421.964496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8s-0008Od-JH; Thu, 19 Oct 2023 15:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619421.964496; Thu, 19 Oct 2023 15:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8s-0008FZ-5g; Thu, 19 Oct 2023 15:40:58 +0000
Received: by outflank-mailman (input) for mailman id 619421;
 Thu, 19 Oct 2023 15:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Lg=GB=casper.srs.infradead.org=BATV+06ae5fa416ae820d9d5a+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8p-0005v1-7T
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:40:55 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e233176c-6e95-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 17:40:52 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qtV8N-007oss-5e; Thu, 19 Oct 2023 15:40:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8M-000Puf-2S; Thu, 19 Oct 2023 16:40:26 +0100
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
X-Inumbo-ID: e233176c-6e95-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=MmPhIGlWb2xAfFIm6BUSfnZhzoUzKIh6oGhh2/7mAwo=; b=frefgQivOoocUfM7eIVSWCMRfO
	BZZORKVyxMVRYmMyFs6nu/44MbNhxs5IPAbxy7BYRr/mbCK/law4r3Zx6pfttvuuIaIkEL4P25LhR
	x8h7cWH/lDF14wmcB2k0U41Alx5W63kXh8aWokv/gBNJwifWSBySiUdE8vgk9xCPRqCIfh/iwsxDv
	7UOop6JyAOvjBF13wOrhQSliUUBwgRpDq3iPfLt0e/26uw+5sJSlkkLeAZUWuIc9h/0Z4HMUNwgFF
	Z1q5L9AgFZwkoj4ad17HJhxDax9BCBydo2LeFJletDyqg+wABKbNvanJPv8ApSxCY4opUZIV3gdxx
	c+E/zmhQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v2 15/24] hw/xen: add support for Xen primary console in emulated mode
Date: Thu, 19 Oct 2023 16:40:11 +0100
Message-Id: <20231019154020.99080-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The primary console is special because the toolstack maps a page at a
fixed GFN and also allocates the guest-side event channel. Add support
for that in emulated mode, so that we can have a primary console.

Add a *very* rudimentary stub of foriegnmem ops for emulated mode, which
supports literally nothing except a single-page mapping of the console
page. This might as well have been a hack in the xen_console driver, but
this way at least the special-casing is kept within the Xen emulation
code, and it gives us a hook for a more complete implementation if/when
we ever do need one.

Now at last we can boot the Xen PV shim and run PV kernels in QEMU.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/char/xen_console.c             |  28 +++--
 hw/i386/kvm/meson.build           |   1 +
 hw/i386/kvm/trace-events          |   2 +
 hw/i386/kvm/xen-stubs.c           |   5 +
 hw/i386/kvm/xen_gnttab.c          |  32 +++++-
 hw/i386/kvm/xen_primary_console.c | 167 ++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_primary_console.h |  22 ++++
 hw/i386/kvm/xen_xenstore.c        |  10 ++
 target/i386/kvm/xen-emu.c         |  23 +++-
 9 files changed, 278 insertions(+), 12 deletions(-)
 create mode 100644 hw/i386/kvm/xen_primary_console.c
 create mode 100644 hw/i386/kvm/xen_primary_console.h

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index f4c70709c7..8256b4b889 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -33,6 +33,7 @@
 #include "hw/qdev-properties-system.h"
 #include "hw/xen/interface/io/console.h"
 #include "hw/xen/interface/io/xs_wire.h"
+#include "hw/i386/kvm/xen_primary_console.h"
 #include "trace.h"
 
 struct buffer {
@@ -335,14 +336,19 @@ static char *xen_console_get_name(XenDevice *xendev, Error **errp)
     if (con->dev == -1) {
         XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
         char fe_path[XENSTORE_ABS_PATH_MAX + 1];
+        int idx = (xen_mode == XEN_EMULATE) ? 0 : 1;
         char *value;
-        int idx = 1;
 
         /* Theoretically we could go up to INT_MAX here but that's overkill */
         while (idx < 100) {
-            snprintf(fe_path, sizeof(fe_path),
-                     "/local/domain/%u/device/console/%u",
-                     xendev->frontend_id, idx);
+            if (!idx) {
+                snprintf(fe_path, sizeof(fe_path),
+                         "/local/domain/%u/console", xendev->frontend_id);
+            } else {
+                snprintf(fe_path, sizeof(fe_path),
+                         "/local/domain/%u/device/console/%u",
+                         xendev->frontend_id, idx);
+            }
             value = qemu_xen_xs_read(xenbus->xsh, XBT_NULL, fe_path, NULL);
             if (!value) {
                 if (errno == ENOENT) {
@@ -397,11 +403,15 @@ static void xen_console_realize(XenDevice *xendev, Error **errp)
      * be mapped directly as foreignmem (not a grant ref), and the guest port
      * was allocated *for* the guest by the toolstack. The guest gets these
      * through HVMOP_get_param and can use the console long before it's got
-     * XenStore up and running. We cannot create those for a Xen guest.
+     * XenStore up and running. We cannot create those for a true Xen guest,
+     * but we can for Xen emulation.
      */
     if (!con->dev) {
-        if (xen_device_frontend_scanf(xendev, "ring-ref", "%u", &u) != 1 ||
-            xen_device_frontend_scanf(xendev, "port", "%u", &u) != 1) {
+        if (xen_mode == XEN_EMULATE) {
+            xen_primary_console_create();
+        } else if (xen_device_frontend_scanf(xendev, "ring-ref", "%u", &u)
+                   != 1 ||
+                   xen_device_frontend_scanf(xendev, "port", "%u", &u) != 1) {
             error_setg(errp, "cannot create primary Xen console");
             return;
         }
@@ -414,8 +424,8 @@ static void xen_console_realize(XenDevice *xendev, Error **errp)
         xen_device_frontend_printf(xendev, "tty", "%s", cs->filename + 4);
     }
 
-    /* No normal PV driver initialization for the primary console */
-    if (!con->dev) {
+    /* No normal PV driver initialization for the primary console under Xen */
+    if (!con->dev && xen_mode != XEN_EMULATE) {
         xen_console_connect(xendev, errp);
     }
 }
diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index ab143d6474..a4a2e23c06 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -9,6 +9,7 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   'xen_evtchn.c',
   'xen_gnttab.c',
   'xen_xenstore.c',
+  'xen_primary_console.c',
   'xenstore_impl.c',
   ))
 
diff --git a/hw/i386/kvm/trace-events b/hw/i386/kvm/trace-events
index e4c82de6f3..67bf7f174e 100644
--- a/hw/i386/kvm/trace-events
+++ b/hw/i386/kvm/trace-events
@@ -18,3 +18,5 @@ xenstore_watch(const char *path, const char *token) "path %s token %s"
 xenstore_unwatch(const char *path, const char *token) "path %s token %s"
 xenstore_reset_watches(void) ""
 xenstore_watch_event(const char *path, const char *token) "path %s token %s"
+xen_primary_console_create(void) ""
+xen_primary_console_reset(int port) "port %u"
diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
index ae406e0b02..10068970fe 100644
--- a/hw/i386/kvm/xen-stubs.c
+++ b/hw/i386/kvm/xen-stubs.c
@@ -15,6 +15,7 @@
 #include "qapi/qapi-commands-misc-target.h"
 
 #include "xen_evtchn.h"
+#include "xen_primary_console.h"
 
 void xen_evtchn_snoop_msi(PCIDevice *dev, bool is_msix, unsigned int vector,
                           uint64_t addr, uint32_t data, bool is_masked)
@@ -30,6 +31,10 @@ bool xen_evtchn_deliver_pirq_msi(uint64_t address, uint32_t data)
     return false;
 }
 
+void xen_primary_console_create(void)
+{
+}
+
 #ifdef TARGET_I386
 EvtchnInfoList *qmp_xen_event_list(Error **errp)
 {
diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 839ec920a1..5519f7712f 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -25,6 +25,7 @@
 #include "hw/xen/xen_backend_ops.h"
 #include "xen_overlay.h"
 #include "xen_gnttab.h"
+#include "xen_primary_console.h"
 
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_xen.h"
@@ -38,6 +39,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GNTTAB)
 #define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
 
 static struct gnttab_backend_ops emu_gnttab_backend_ops;
+static struct foreignmem_backend_ops emu_foreignmem_backend_ops;
 
 struct XenGnttabState {
     /*< private >*/
@@ -100,6 +102,7 @@ static void xen_gnttab_realize(DeviceState *dev, Error **errp)
     s->map_track = g_new0(uint8_t, s->max_frames * ENTRIES_PER_FRAME_V1);
 
     xen_gnttab_ops = &emu_gnttab_backend_ops;
+    xen_foreignmem_ops = &emu_foreignmem_backend_ops;
 }
 
 static int xen_gnttab_post_load(void *opaque, int version_id)
@@ -524,6 +527,29 @@ static struct gnttab_backend_ops emu_gnttab_backend_ops = {
     .unmap = xen_be_gnttab_unmap,
 };
 
+/* Dummy implementation of foreignmem; just enough for console */
+static void *xen_be_foreignmem_map(uint32_t dom, void *addr, int prot,
+                                   size_t pages, xen_pfn_t *pfns,
+                                   int *errs)
+{
+    if (dom == xen_domid && !addr && pages == 1 &&
+        pfns[0] == xen_primary_console_get_pfn()) {
+        return xen_primary_console_get_map();
+    }
+
+    return NULL;
+}
+
+static int xen_be_foreignmem_unmap(void *addr, size_t pages)
+{
+    return 0;
+}
+
+static struct foreignmem_backend_ops emu_foreignmem_backend_ops = {
+    .map = xen_be_foreignmem_map,
+    .unmap = xen_be_foreignmem_unmap,
+};
+
 int xen_gnttab_reset(void)
 {
     XenGnttabState *s = xen_gnttab_singleton;
@@ -537,9 +563,13 @@ int xen_gnttab_reset(void)
     s->nr_frames = 0;
 
     memset(s->entries.v1, 0, XEN_PAGE_SIZE * s->max_frames);
-
     s->entries.v1[GNTTAB_RESERVED_XENSTORE].flags = GTF_permit_access;
     s->entries.v1[GNTTAB_RESERVED_XENSTORE].frame = XEN_SPECIAL_PFN(XENSTORE);
 
+    if (xen_primary_console_get_pfn()) {
+        s->entries.v1[GNTTAB_RESERVED_CONSOLE].flags = GTF_permit_access;
+        s->entries.v1[GNTTAB_RESERVED_CONSOLE].frame = XEN_SPECIAL_PFN(CONSOLE);
+    }
+
     return 0;
 }
diff --git a/hw/i386/kvm/xen_primary_console.c b/hw/i386/kvm/xen_primary_console.c
new file mode 100644
index 0000000000..0aa1c16ad6
--- /dev/null
+++ b/hw/i386/kvm/xen_primary_console.c
@@ -0,0 +1,167 @@
+/*
+ * QEMU Xen emulation: Primary console support
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+
+#include "hw/sysbus.h"
+#include "hw/xen/xen.h"
+#include "hw/xen/xen_backend_ops.h"
+#include "xen_evtchn.h"
+#include "xen_overlay.h"
+#include "xen_primary_console.h"
+
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
+
+#include "trace.h"
+
+#include "hw/xen/interface/event_channel.h"
+#include "hw/xen/interface/grant_table.h"
+
+#define TYPE_XEN_PRIMARY_CONSOLE "xen-primary-console"
+OBJECT_DECLARE_SIMPLE_TYPE(XenPrimaryConsoleState, XEN_PRIMARY_CONSOLE)
+
+struct XenPrimaryConsoleState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    MemoryRegion console_page;
+    void *cp;
+
+    evtchn_port_t guest_port;
+    evtchn_port_t be_port;
+
+    struct xengntdev_handle *gt;
+    void *granted_xs;
+};
+
+struct XenPrimaryConsoleState *xen_primary_console_singleton;
+
+static void xen_primary_console_realize(DeviceState *dev, Error **errp)
+{
+    XenPrimaryConsoleState *s = XEN_PRIMARY_CONSOLE(dev);
+
+    if (xen_mode != XEN_EMULATE) {
+        error_setg(errp, "Xen primary console support is for Xen emulation");
+        return;
+    }
+
+    memory_region_init_ram(&s->console_page, OBJECT(dev), "xen:console_page",
+                           XEN_PAGE_SIZE, &error_abort);
+    memory_region_set_enabled(&s->console_page, true);
+    s->cp = memory_region_get_ram_ptr(&s->console_page);
+    memset(s->cp, 0, XEN_PAGE_SIZE);
+
+    /* We can't map it this early as KVM isn't ready */
+    xen_primary_console_singleton = s;
+}
+
+static void xen_primary_console_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = xen_primary_console_realize;
+}
+
+static const TypeInfo xen_primary_console_info = {
+    .name          = TYPE_XEN_PRIMARY_CONSOLE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XenPrimaryConsoleState),
+    .class_init    = xen_primary_console_class_init,
+};
+
+
+void xen_primary_console_create(void)
+{
+    DeviceState *dev = sysbus_create_simple(TYPE_XEN_PRIMARY_CONSOLE, -1, NULL);
+
+    trace_xen_primary_console_create();
+
+    xen_primary_console_singleton = XEN_PRIMARY_CONSOLE(dev);
+
+    /*
+     * Defer the init (xen_primary_console_reset()) until KVM is set up and the
+     * overlay page can be mapped.
+     */
+}
+
+static void xen_primary_console_register_types(void)
+{
+    type_register_static(&xen_primary_console_info);
+}
+
+type_init(xen_primary_console_register_types)
+
+uint16_t xen_primary_console_get_port(void)
+{
+    XenPrimaryConsoleState *s = xen_primary_console_singleton;
+    if (!s) {
+        return 0;
+    }
+    return s->guest_port;
+}
+
+uint64_t xen_primary_console_get_pfn(void)
+{
+    XenPrimaryConsoleState *s = xen_primary_console_singleton;
+    if (!s) {
+        return 0;
+    }
+    return XEN_SPECIAL_PFN(CONSOLE);
+}
+
+void *xen_primary_console_get_map(void)
+{
+    XenPrimaryConsoleState *s = xen_primary_console_singleton;
+    if (!s) {
+        return 0;
+    }
+    return s->cp;
+}
+
+static void alloc_guest_port(XenPrimaryConsoleState *s)
+{
+    struct evtchn_alloc_unbound alloc = {
+        .dom = DOMID_SELF,
+        .remote_dom = DOMID_QEMU,
+    };
+
+    if (!xen_evtchn_alloc_unbound_op(&alloc)) {
+        s->guest_port = alloc.port;
+    }
+}
+
+int xen_primary_console_reset(void)
+{
+    XenPrimaryConsoleState *s = xen_primary_console_singleton;
+    if (!s) {
+        return 0;
+    }
+
+    if (!memory_region_is_mapped(&s->console_page)) {
+        uint64_t gpa = XEN_SPECIAL_PFN(CONSOLE) << TARGET_PAGE_BITS;
+        xen_overlay_do_map_page(&s->console_page, gpa);
+    }
+
+    alloc_guest_port(s);
+
+    trace_xen_primary_console_reset(s->guest_port);
+
+    s->gt = qemu_xen_gnttab_open();
+    uint32_t xs_gntref = GNTTAB_RESERVED_CONSOLE;
+    s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid, &xs_gntref,
+                                             PROT_READ | PROT_WRITE);
+
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_primary_console.h b/hw/i386/kvm/xen_primary_console.h
new file mode 100644
index 0000000000..dd4922f3f4
--- /dev/null
+++ b/hw/i386/kvm/xen_primary_console.h
@@ -0,0 +1,22 @@
+/*
+ * QEMU Xen emulation: Primary console support
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_XEN_PRIMARY_CONSOLE_H
+#define QEMU_XEN_PRIMARY_CONSOLE_H
+
+void xen_primary_console_create(void);
+int xen_primary_console_reset(void);
+
+uint16_t xen_primary_console_get_port(void);
+uint64_t xen_primary_console_get_pfn(void);
+void *xen_primary_console_get_map(void);
+
+#endif /* QEMU_XEN_PRIMARY_CONSOLE_H */
diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 61692d4489..2ee4916c64 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -25,6 +25,7 @@
 #include "hw/xen/xen_backend_ops.h"
 #include "xen_overlay.h"
 #include "xen_evtchn.h"
+#include "xen_primary_console.h"
 #include "xen_xenstore.h"
 
 #include "sysemu/kvm.h"
@@ -1434,6 +1435,7 @@ static void alloc_guest_port(XenXenstoreState *s)
 int xen_xenstore_reset(void)
 {
     XenXenstoreState *s = xen_xenstore_singleton;
+    int console_port;
     GList *perms;
     int err;
 
@@ -1470,6 +1472,14 @@ int xen_xenstore_reset(void)
     relpath_printf(s, perms, "store/ring-ref", "%lu",
                    XEN_SPECIAL_PFN(XENSTORE));
 
+    console_port = xen_primary_console_get_port();
+    if (console_port) {
+        relpath_printf(s, perms, "console/ring-ref", "%lu",
+                       XEN_SPECIAL_PFN(CONSOLE));
+        relpath_printf(s, perms, "console/port", "%u", console_port);
+        relpath_printf(s, perms, "console/state", "%u", XenbusStateInitialised);
+    }
+
     g_list_free_full(perms, g_free);
 
     /*
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 477e93cd92..9f57786e95 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -28,6 +28,7 @@
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/kvm/xen_gnttab.h"
+#include "hw/i386/kvm/xen_primary_console.h"
 #include "hw/i386/kvm/xen_xenstore.h"
 
 #include "hw/xen/interface/version.h"
@@ -182,7 +183,8 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
         return ret;
     }
 
-    /* The page couldn't be overlaid until KVM was initialized */
+    /* The pages couldn't be overlaid until KVM was initialized */
+    xen_primary_console_reset();
     xen_xenstore_reset();
 
     return 0;
@@ -811,11 +813,23 @@ static bool handle_get_param(struct kvm_xen_exit *exit, X86CPU *cpu,
     case HVM_PARAM_STORE_EVTCHN:
         hp.value = xen_xenstore_get_port();
         break;
+    case HVM_PARAM_CONSOLE_PFN:
+        hp.value = xen_primary_console_get_pfn();
+        if (!hp.value) {
+            err = -EINVAL;
+        }
+        break;
+    case HVM_PARAM_CONSOLE_EVTCHN:
+        hp.value = xen_primary_console_get_port();
+        if (!hp.value) {
+            err = -EINVAL;
+        }
+        break;
     default:
         return false;
     }
 
-    if (kvm_copy_to_gva(cs, arg, &hp, sizeof(hp))) {
+    if (!err && kvm_copy_to_gva(cs, arg, &hp, sizeof(hp))) {
         err = -EFAULT;
     }
 out:
@@ -1426,6 +1440,11 @@ int kvm_xen_soft_reset(void)
         return err;
     }
 
+    err = xen_primary_console_reset();
+    if (err) {
+        return err;
+    }
+
     err = xen_xenstore_reset();
     if (err) {
         return err;
-- 
2.40.1


