Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57C27CFE78
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619432.964592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVBG-0000Oa-Uw; Thu, 19 Oct 2023 15:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619432.964592; Thu, 19 Oct 2023 15:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVBG-0000Ld-Rl; Thu, 19 Oct 2023 15:43:26 +0000
Received: by outflank-mailman (input) for mailman id 619432;
 Thu, 19 Oct 2023 15:43:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+UH=GB=desiato.srs.infradead.org=BATV+298c059cf2aa39b7dc34+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8w-0005v1-LU
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:41:02 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7db4f75-6e95-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 17:41:01 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qtV8O-009yCt-0Q; Thu, 19 Oct 2023 15:40:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8M-000Pub-2G; Thu, 19 Oct 2023 16:40:26 +0100
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
X-Inumbo-ID: e7db4f75-6e95-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=QuCU5QcXms7wszQodB9qpu2o64rddhbI7UNM0sYshFY=; b=DvJY9tUlPJmX/25c9m+Tvd99uP
	JzddgymEh1I1Dv6gpVQ5LV/S/XbgbYYk6CN13PMz7jjGipM0lnO1xDF4RUebg6QShjdY7qzNA8swG
	T8LjzOrw/4c+shdbobyolxbHs+MNjYG73Mofjt2U4SvIl5ZNCDhOlEaJx5xC2Jfqq1JTmgodR+wgD
	Af5cZuMreaoVDxQsR9v0/8UmdTv3I7PnrkZkGCp5oVOlK8DvcN9IaBAa5IBsRlFjp+c8l2OfBIJX2
	1wzl+IiMV6vkmISEPxJtuWqgHilomW0XqCSNwHKHBSwmxjhwZ+PLFfntKrLv1nGaErD02sgaEmcqL
	yNPYomlw==;
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
Subject: [PATCH v2 14/24] hw/xen: update Xen console to XenDevice model
Date: Thu, 19 Oct 2023 16:40:10 +0100
Message-Id: <20231019154020.99080-15-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This allows (non-primary) console devices to be created on the command
line and hotplugged.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/char/trace-events        |   8 +
 hw/char/xen_console.c       | 529 +++++++++++++++++++++++++++---------
 hw/xen/xen-legacy-backend.c |   1 -
 3 files changed, 408 insertions(+), 130 deletions(-)

diff --git a/hw/char/trace-events b/hw/char/trace-events
index babf4d35ea..7a398c82a5 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -105,3 +105,11 @@ cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
 # sh_serial.c
 sh_serial_read(char *id, unsigned size, uint64_t offs, uint64_t val) " %s size %d offs 0x%02" PRIx64 " -> 0x%02" PRIx64
 sh_serial_write(char *id, unsigned size, uint64_t offs, uint64_t val) "%s size %d offs 0x%02" PRIx64 " <- 0x%02" PRIx64
+
+# xen_console.c
+xen_console_connect(unsigned int idx, unsigned int ring_ref, unsigned int port, unsigned int limit) "idx %u ring_ref %u port %u limit %u"
+xen_console_disconnect(unsigned int idx) "idx %u"
+xen_console_unrealize(unsigned int idx) "idx %u"
+xen_console_realize(unsigned int idx, const char *chrdev) "idx %u chrdev %s"
+xen_console_device_create(unsigned int idx) "idx %u"
+xen_console_device_destroy(unsigned int idx) "idx %u"
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 810dae3f44..f4c70709c7 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -20,15 +20,20 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include <sys/select.h>
 #include <termios.h>
 
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "chardev/char-fe.h"
-#include "hw/xen/xen-legacy-backend.h"
-
+#include "hw/xen/xen-backend.h"
+#include "hw/xen/xen-bus-helper.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "hw/xen/interface/io/console.h"
+#include "hw/xen/interface/io/xs_wire.h"
+#include "trace.h"
 
 struct buffer {
     uint8_t *data;
@@ -39,16 +44,22 @@ struct buffer {
 };
 
 struct XenConsole {
-    struct XenLegacyDevice  xendev;  /* must be first */
+    struct XenDevice  xendev;  /* must be first */
+    XenEventChannel   *event_channel;
+    int               dev;
     struct buffer     buffer;
-    char              console[XEN_BUFSIZE];
-    int               ring_ref;
+    char              *fe_path;
+    unsigned int      ring_ref;
     void              *sring;
     CharBackend       chr;
     int               backlog;
 };
+typedef struct XenConsole XenConsole;
+
+#define TYPE_XEN_CONSOLE_DEVICE "xen-console"
+OBJECT_DECLARE_SIMPLE_TYPE(XenConsole, XEN_CONSOLE_DEVICE)
 
-static void buffer_append(struct XenConsole *con)
+static bool buffer_append(XenConsole *con)
 {
     struct buffer *buffer = &con->buffer;
     XENCONS_RING_IDX cons, prod, size;
@@ -60,7 +71,7 @@ static void buffer_append(struct XenConsole *con)
 
     size = prod - cons;
     if ((size == 0) || (size > sizeof(intf->out)))
-        return;
+        return false;
 
     if ((buffer->capacity - buffer->size) < size) {
         buffer->capacity += (size + 1024);
@@ -73,7 +84,7 @@ static void buffer_append(struct XenConsole *con)
 
     xen_mb();
     intf->out_cons = cons;
-    xen_pv_send_notify(&con->xendev);
+    xen_device_notify_event_channel(XEN_DEVICE(con), con->event_channel, NULL);
 
     if (buffer->max_capacity &&
         buffer->size > buffer->max_capacity) {
@@ -89,6 +100,7 @@ static void buffer_append(struct XenConsole *con)
         if (buffer->consumed > buffer->max_capacity - over)
             buffer->consumed = buffer->max_capacity - over;
     }
+    return true;
 }
 
 static void buffer_advance(struct buffer *buffer, size_t len)
@@ -100,7 +112,7 @@ static void buffer_advance(struct buffer *buffer, size_t len)
     }
 }
 
-static int ring_free_bytes(struct XenConsole *con)
+static int ring_free_bytes(XenConsole *con)
 {
     struct xencons_interface *intf = con->sring;
     XENCONS_RING_IDX cons, prod, space;
@@ -118,13 +130,13 @@ static int ring_free_bytes(struct XenConsole *con)
 
 static int xencons_can_receive(void *opaque)
 {
-    struct XenConsole *con = opaque;
+    XenConsole *con = opaque;
     return ring_free_bytes(con);
 }
 
 static void xencons_receive(void *opaque, const uint8_t *buf, int len)
 {
-    struct XenConsole *con = opaque;
+    XenConsole *con = opaque;
     struct xencons_interface *intf = con->sring;
     XENCONS_RING_IDX prod;
     int i, max;
@@ -141,10 +153,10 @@ static void xencons_receive(void *opaque, const uint8_t *buf, int len)
     }
     xen_wmb();
     intf->in_prod = prod;
-    xen_pv_send_notify(&con->xendev);
+    xen_device_notify_event_channel(XEN_DEVICE(con), con->event_channel, NULL);
 }
 
-static void xencons_send(struct XenConsole *con)
+static bool xencons_send(XenConsole *con)
 {
     ssize_t len, size;
 
@@ -159,174 +171,433 @@ static void xencons_send(struct XenConsole *con)
     if (len < 1) {
         if (!con->backlog) {
             con->backlog = 1;
-            xen_pv_printf(&con->xendev, 1,
-                          "backlog piling up, nobody listening?\n");
         }
     } else {
         buffer_advance(&con->buffer, len);
         if (con->backlog && len == size) {
             con->backlog = 0;
-            xen_pv_printf(&con->xendev, 1, "backlog is gone\n");
         }
     }
+    return len > 0;
 }
 
 /* -------------------------------------------------------------------- */
 
-static int store_con_info(struct XenConsole *con)
+static bool con_event(void *_xendev)
 {
-    Chardev *cs = qemu_chr_fe_get_driver(&con->chr);
-    char *pts = NULL;
-    char *dom_path;
-    g_autoptr(GString) path = NULL;
+    XenConsole *con = XEN_CONSOLE_DEVICE(_xendev);
+    bool done_something;
+
+    done_something = buffer_append(con);
+
+    if (con->buffer.size - con->buffer.consumed) {
+        done_something |= xencons_send(con);
+    }
+    return done_something;
+}
 
-    /* Only continue if we're talking to a pty. */
-    if (!CHARDEV_IS_PTY(cs)) {
-        return 0;
+/* -------------------------------------------------------------------- */
+
+static bool xen_console_connect(XenDevice *xendev, Error **errp)
+{
+    XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
+    unsigned int port, limit;
+
+    if (xen_device_frontend_scanf(xendev, "ring-ref", "%u",
+                                  &con->ring_ref) != 1) {
+        error_setg(errp, "failed to read ring-ref");
+        return false;
     }
-    pts = cs->filename + 4;
 
-    dom_path = qemu_xen_xs_get_domain_path(xenstore, xen_domid);
-    if (!dom_path) {
-        return 0;
+    if (xen_device_frontend_scanf(xendev, "port", "%u", &port) != 1) {
+        error_setg(errp, "failed to read remote port");
+        return false;
     }
 
-    path = g_string_new(dom_path);
-    free(dom_path);
+    if (xen_device_frontend_scanf(xendev, "limit", "%u", &limit) == 1) {
+        con->buffer.max_capacity = limit;
+    }
 
-    if (con->xendev.dev) {
-        g_string_append_printf(path, "/device/console/%d", con->xendev.dev);
+    if (!con->dev) {
+        xen_pfn_t mfn = (xen_pfn_t)con->ring_ref;
+        con->sring = qemu_xen_foreignmem_map(xendev->frontend_id, NULL,
+                                             PROT_READ | PROT_WRITE,
+                                             1, &mfn, NULL);
+        if (!con->sring) {
+            error_setg(errp, "failed to map console page");
+            return false;
+        }
     } else {
-        g_string_append(path, "/console");
+        con->sring = xen_device_map_grant_refs(xendev,
+                                               &con->ring_ref, 1,
+                                               PROT_READ | PROT_WRITE,
+                                               errp);
+        if (!con->sring) {
+            error_prepend(errp, "failed to map grant ref: ");
+            return false;
+        }
     }
-    g_string_append(path, "/tty");
 
-    if (xenstore_write_str(con->console, path->str, pts)) {
-        fprintf(stderr, "xenstore_write_str for '%s' fail", path->str);
-        return -1;
+    con->event_channel = xen_device_bind_event_channel(xendev, port,
+                                                       con_event,
+                                                       con,
+                                                       errp);
+    if (!con->event_channel) {
+        return false;
     }
-    return 0;
+
+    trace_xen_console_connect(con->dev, con->ring_ref, port,
+                              con->buffer.max_capacity);
+
+    qemu_chr_fe_set_handlers(&con->chr, xencons_can_receive,
+                             xencons_receive, NULL, NULL, con, NULL,
+                             true);
+
+    return true;
 }
 
-static int con_init(struct XenLegacyDevice *xendev)
+static void xen_console_disconnect(XenDevice *xendev, Error **errp)
 {
-    struct XenConsole *con = container_of(xendev, struct XenConsole, xendev);
-    char *type, *dom, label[32];
-    int ret = 0;
-    const char *output;
-
-    /* setup */
-    dom = qemu_xen_xs_get_domain_path(xenstore, con->xendev.dom);
-    if (!xendev->dev) {
-        snprintf(con->console, sizeof(con->console), "%s/console", dom);
-    } else {
-        snprintf(con->console, sizeof(con->console), "%s/device/console/%d", dom, xendev->dev);
+    XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
+
+    trace_xen_console_disconnect(con->dev);
+
+    qemu_chr_fe_set_handlers(&con->chr, NULL, NULL, NULL, NULL,
+                             con, NULL, true);
+
+    if (con->event_channel) {
+        xen_device_unbind_event_channel(xendev, con->event_channel,
+                                        errp);
+        con->event_channel = NULL;
     }
-    free(dom);
 
-    type = xenstore_read_str(con->console, "type");
-    if (!type || strcmp(type, "ioemu") != 0) {
-        xen_pv_printf(xendev, 1, "not for me (type=%s)\n", type);
-        ret = -1;
-        goto out;
+    if (con->sring) {
+        if (!con->dev) {
+            qemu_xen_foreignmem_unmap(con->sring, 1);
+        } else {
+            xen_device_unmap_grant_refs(xendev, con->sring,
+                                        &con->ring_ref, 1, errp);
+        }
+        con->sring = NULL;
     }
+}
 
-    output = xenstore_read_str(con->console, "output");
+static void xen_console_frontend_changed(XenDevice *xendev,
+                                         enum xenbus_state frontend_state,
+                                         Error **errp)
+{
+    ERRP_GUARD();
+    enum xenbus_state backend_state = xen_device_backend_get_state(xendev);
+
+    switch (frontend_state) {
+    case XenbusStateInitialised:
+    case XenbusStateConnected:
+        if (backend_state == XenbusStateConnected) {
+            break;
+        }
 
-    /* no Xen override, use qemu output device */
-    if (output == NULL) {
-        if (con->xendev.dev) {
-            qemu_chr_fe_init(&con->chr, serial_hd(con->xendev.dev),
-                             &error_abort);
+        xen_console_disconnect(xendev, errp);
+        if (*errp) {
+            break;
         }
-    } else {
-        snprintf(label, sizeof(label), "xencons%d", con->xendev.dev);
-        qemu_chr_fe_init(&con->chr,
-                         /*
-                          * FIXME: sure we want to support implicit
-                          * muxed monitors here?
-                          */
-                         qemu_chr_new_mux_mon(label, output, NULL),
-                         &error_abort);
+
+        if (!xen_console_connect(xendev, errp)) {
+            xen_device_backend_set_state(xendev, XenbusStateClosing);
+            break;
+        }
+
+        xen_device_backend_set_state(xendev, XenbusStateConnected);
+        break;
+
+    case XenbusStateClosing:
+        xen_device_backend_set_state(xendev, XenbusStateClosing);
+        break;
+
+    case XenbusStateClosed:
+    case XenbusStateUnknown:
+        xen_console_disconnect(xendev, errp);
+        if (*errp) {
+            break;
+        }
+
+        xen_device_backend_set_state(xendev, XenbusStateClosed);
+        break;
+
+    default:
+        break;
     }
+}
 
-    store_con_info(con);
+static char *xen_console_get_name(XenDevice *xendev, Error **errp)
+{
+    XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
+
+    if (con->dev == -1) {
+        XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
+        char fe_path[XENSTORE_ABS_PATH_MAX + 1];
+        char *value;
+        int idx = 1;
+
+        /* Theoretically we could go up to INT_MAX here but that's overkill */
+        while (idx < 100) {
+            snprintf(fe_path, sizeof(fe_path),
+                     "/local/domain/%u/device/console/%u",
+                     xendev->frontend_id, idx);
+            value = qemu_xen_xs_read(xenbus->xsh, XBT_NULL, fe_path, NULL);
+            if (!value) {
+                if (errno == ENOENT) {
+                    con->dev = idx;
+                    goto found;
+                }
+                error_setg(errp, "cannot read %s: %s", fe_path,
+                           strerror(errno));
+                return NULL;
+            }
+            free(value);
+            idx++;
+        }
+        error_setg(errp, "cannot find device index for console device");
+        return NULL;
+    }
+ found:
+    return g_strdup_printf("%u", con->dev);
+}
 
-out:
-    g_free(type);
-    return ret;
+static void xen_console_unrealize(XenDevice *xendev)
+{
+    XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
+
+    trace_xen_console_unrealize(con->dev);
+
+    /* Disconnect from the frontend in case this has not already happened */
+    xen_console_disconnect(xendev, NULL);
+
+    qemu_chr_fe_deinit(&con->chr, false);
 }
 
-static int con_initialise(struct XenLegacyDevice *xendev)
+static void xen_console_realize(XenDevice *xendev, Error **errp)
 {
-    struct XenConsole *con = container_of(xendev, struct XenConsole, xendev);
-    int limit;
-
-    if (xenstore_read_int(con->console, "ring-ref", &con->ring_ref) == -1)
-        return -1;
-    if (xenstore_read_int(con->console, "port", &con->xendev.remote_port) == -1)
-        return -1;
-    if (xenstore_read_int(con->console, "limit", &limit) == 0)
-        con->buffer.max_capacity = limit;
+    ERRP_GUARD();
+    XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
+    Chardev *cs = qemu_chr_fe_get_driver(&con->chr);
+    unsigned int u;
 
-    if (!xendev->dev) {
-        xen_pfn_t mfn = con->ring_ref;
-        con->sring = qemu_xen_foreignmem_map(con->xendev.dom, NULL,
-                                             PROT_READ | PROT_WRITE,
-                                             1, &mfn, NULL);
+    if (!cs) {
+        error_setg(errp, "no backing character device");
+        return;
+    }
+
+    if (con->dev == -1) {
+        error_setg(errp, "no device index provided");
+        return;
+    }
+
+    /*
+     * The Xen primary console is special. The ring-ref is actually a GFN to
+     * be mapped directly as foreignmem (not a grant ref), and the guest port
+     * was allocated *for* the guest by the toolstack. The guest gets these
+     * through HVMOP_get_param and can use the console long before it's got
+     * XenStore up and running. We cannot create those for a Xen guest.
+     */
+    if (!con->dev) {
+        if (xen_device_frontend_scanf(xendev, "ring-ref", "%u", &u) != 1 ||
+            xen_device_frontend_scanf(xendev, "port", "%u", &u) != 1) {
+            error_setg(errp, "cannot create primary Xen console");
+            return;
+        }
+    }
+
+    trace_xen_console_realize(con->dev, object_get_typename(OBJECT(cs)));
+
+    if (CHARDEV_IS_PTY(cs)) {
+        /* Strip the leading 'pty:' */
+        xen_device_frontend_printf(xendev, "tty", "%s", cs->filename + 4);
+    }
+
+    /* No normal PV driver initialization for the primary console */
+    if (!con->dev) {
+        xen_console_connect(xendev, errp);
+    }
+}
+
+static char *console_frontend_path(struct qemu_xs_handle *xenstore,
+                                   unsigned int dom_id, unsigned int dev)
+{
+    if (!dev) {
+        return g_strdup_printf("/local/domain/%u/console", dom_id);
     } else {
-        con->sring = xen_be_map_grant_ref(xendev, con->ring_ref,
-                                          PROT_READ | PROT_WRITE);
+        return g_strdup_printf("/local/domain/%u/device/console/%u", dom_id,
+                               dev);
     }
-    if (!con->sring)
-        return -1;
+}
 
-    xen_be_bind_evtchn(&con->xendev);
-    qemu_chr_fe_set_handlers(&con->chr, xencons_can_receive,
-                             xencons_receive, NULL, NULL, con, NULL, true);
-
-    xen_pv_printf(xendev, 1,
-                  "ring mfn %d, remote port %d, local port %d, limit %zd\n",
-                  con->ring_ref,
-                  con->xendev.remote_port,
-                  con->xendev.local_port,
-                  con->buffer.max_capacity);
-    return 0;
+static char *xen_console_get_frontend_path(XenDevice *xendev, Error **errp)
+{
+    XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
+    XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
+    char *ret = console_frontend_path(xenbus->xsh, xendev->frontend_id,
+                                      con->dev);
+
+    if (!ret) {
+        error_setg(errp, "failed to create frontend path");
+    }
+    return ret;
 }
 
-static void con_disconnect(struct XenLegacyDevice *xendev)
+
+static Property xen_console_properties[] = {
+    DEFINE_PROP_CHR("chardev", XenConsole, chr),
+    DEFINE_PROP_INT32("idx", XenConsole, dev, -1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void xen_console_class_init(ObjectClass *class, void *data)
 {
-    struct XenConsole *con = container_of(xendev, struct XenConsole, xendev);
+    DeviceClass *dev_class = DEVICE_CLASS(class);
+    XenDeviceClass *xendev_class = XEN_DEVICE_CLASS(class);
+
+    xendev_class->backend = "console";
+    xendev_class->device = "console";
+    xendev_class->get_name = xen_console_get_name;
+    xendev_class->realize = xen_console_realize;
+    xendev_class->frontend_changed = xen_console_frontend_changed;
+    xendev_class->unrealize = xen_console_unrealize;
+    xendev_class->get_frontend_path = xen_console_get_frontend_path;
+
+    device_class_set_props(dev_class, xen_console_properties);
+}
 
-    qemu_chr_fe_deinit(&con->chr, false);
-    xen_pv_unbind_evtchn(&con->xendev);
+static const TypeInfo xen_console_type_info = {
+    .name = TYPE_XEN_CONSOLE_DEVICE,
+    .parent = TYPE_XEN_DEVICE,
+    .instance_size = sizeof(XenConsole),
+    .class_init = xen_console_class_init,
+};
 
-    if (con->sring) {
-        if (!xendev->dev) {
-            qemu_xen_foreignmem_unmap(con->sring, 1);
-        } else {
-            xen_be_unmap_grant_ref(xendev, con->sring, con->ring_ref);
+static void xen_console_register_types(void)
+{
+    type_register_static(&xen_console_type_info);
+}
+
+type_init(xen_console_register_types)
+
+/* Called to instantiate a XenConsole when the backend is detected. */
+static void xen_console_device_create(XenBackendInstance *backend,
+                                      QDict *opts, Error **errp)
+{
+    ERRP_GUARD();
+    XenBus *xenbus = xen_backend_get_bus(backend);
+    const char *name = xen_backend_get_name(backend);
+    unsigned long number;
+    char *fe = NULL, *type = NULL, *output = NULL;
+    char label[32];
+    XenDevice *xendev = NULL;
+    XenConsole *con;
+    Chardev *cd = NULL;
+    struct qemu_xs_handle *xsh = xenbus->xsh;
+
+    if (qemu_strtoul(name, NULL, 10, &number) || number > INT_MAX) {
+        error_setg(errp, "failed to parse name '%s'", name);
+        goto fail;
+    }
+
+    trace_xen_console_device_create(number);
+
+    fe = console_frontend_path(xsh, xen_domid, number);
+    if (fe == NULL) {
+        error_setg(errp, "failed to generate frontend path");
+        goto fail;
+    }
+
+    if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
+        error_prepend(errp, "failed to read console device type: ");
+        goto fail;
+    }
+
+    if (strcmp(type, "ioemu")) {
+        error_setg(errp, "declining to handle console type '%s'",
+                   type);
+        goto fail;
+    }
+
+    xendev = XEN_DEVICE(qdev_new(TYPE_XEN_CONSOLE_DEVICE));
+    con = XEN_CONSOLE_DEVICE(xendev);
+
+    con->dev = number;
+
+    snprintf(label, sizeof(label), "xencons%ld", number);
+
+    if (xs_node_scanf(xsh, XBT_NULL, fe, "output", NULL, "%ms", &output) == 1) {
+        /*
+         * FIXME: sure we want to support implicit
+         * muxed monitors here?
+         */
+        cd = qemu_chr_new_mux_mon(label, output, NULL);
+        if (!cd) {
+            error_setg(errp, "console: No valid chardev found at '%s': ",
+                       output);
+            goto fail;
         }
-        con->sring = NULL;
+    } else if (number) {
+        cd = serial_hd(number);
+        if (!cd) {
+            error_prepend(errp, "console: No serial device #%ld found: ",
+                          number);
+            goto fail;
+        }
+    } else {
+        /* No 'output' node on primary console: use null. */
+        cd = qemu_chr_new(label, "null", NULL);
+        if (!cd) {
+            error_setg(errp, "console: failed to create null device");
+            goto fail;
+        }
+    }
+
+    if (!qemu_chr_fe_init(&con->chr, cd, errp)) {
+        error_prepend(errp, "console: failed to initialize backing chardev: ");
+        goto fail;
+    }
+
+    if (qdev_realize_and_unref(DEVICE(xendev), BUS(xenbus), errp)) {
+        xen_backend_set_device(backend, xendev);
+        goto done;
+    }
+
+    error_prepend(errp, "realization of console device %lu failed: ",
+                  number);
+
+ fail:
+    if (xendev) {
+        object_unparent(OBJECT(xendev));
     }
+ done:
+    g_free(fe);
+    free(type);
+    free(output);
 }
 
-static void con_event(struct XenLegacyDevice *xendev)
+static void xen_console_device_destroy(XenBackendInstance *backend,
+                                       Error **errp)
 {
-    struct XenConsole *con = container_of(xendev, struct XenConsole, xendev);
+    ERRP_GUARD();
+    XenDevice *xendev = xen_backend_get_device(backend);
+    XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
 
-    buffer_append(con);
-    if (con->buffer.size - con->buffer.consumed)
-        xencons_send(con);
-}
+    trace_xen_console_device_destroy(con->dev);
 
-/* -------------------------------------------------------------------- */
+    object_unparent(OBJECT(xendev));
+}
 
-struct XenDevOps xen_console_ops = {
-    .size       = sizeof(struct XenConsole),
-    .flags      = DEVOPS_FLAG_IGNORE_STATE|DEVOPS_FLAG_NEED_GNTDEV,
-    .init       = con_init,
-    .initialise = con_initialise,
-    .event      = con_event,
-    .disconnect = con_disconnect,
+static const XenBackendInfo xen_console_backend_info  = {
+    .type = "console",
+    .create = xen_console_device_create,
+    .destroy = xen_console_device_destroy,
 };
+
+static void xen_console_register_backend(void)
+{
+    xen_backend_register(&xen_console_backend_info);
+}
+
+xen_backend_init(xen_console_register_backend);
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 4ded3cec23..124dd5f3d6 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -623,7 +623,6 @@ void xen_be_init(void)
 
     xen_set_dynamic_sysbus();
 
-    xen_be_register("console", &xen_console_ops);
     xen_be_register("vkbd", &xen_kbdmouse_ops);
 #ifdef CONFIG_VIRTFS
     xen_be_register("9pfs", &xen_9pfs_ops);
-- 
2.40.1


