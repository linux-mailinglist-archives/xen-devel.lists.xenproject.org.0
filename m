Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502326AF06F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 19:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507835.782022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc4A-00078d-IL; Tue, 07 Mar 2023 18:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507835.782022; Tue, 07 Mar 2023 18:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc4A-00074B-9w; Tue, 07 Mar 2023 18:29:38 +0000
Received: by outflank-mailman (input) for mailman id 507835;
 Tue, 07 Mar 2023 18:29:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tG96=67=desiato.srs.infradead.org=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZc24-0002M9-VE
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 18:27:29 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b13f9716-bd15-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 19:27:18 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZc1m-00H8T1-30; Tue, 07 Mar 2023 18:27:11 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1m-009e8A-2b; Tue, 07 Mar 2023 18:27:10 +0000
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
X-Inumbo-ID: b13f9716-bd15-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=WnOlrCyXVBFqHNPB9VF+Knv7LZVlnO+BJbMZlWwhtOM=; b=aKFknAVieLzHIqQknENSUJdyad
	jcIzcYIM17RO04t88vGzsaT/LaXvHqHe4R2BAhIRu48wBwJ3itf45//Rn2XxMFZ4YfSqf7FAwlav+
	zJ0IoWZg/NfNjiNHPlAx5mczQpqlEm3y8XVyqWayqlcZTN7zSXI3c8Kg2aAbwMrIIjqCneuq7ZqRp
	WtvIf0635eqjvjTU4U/B2PYWwOwfHDx3OvCpgWzfrPPtc1SFacTbMkK9RiJFEIlpVAabE8AQOZ/Dz
	Sv6la7yTOTfP+D4w3wgHvJrEYatF55iNtAuIXgoLC1k7GjwJxeiEtnWxMXGJouJbmbnJO7sd70CWW
	5O9mQ4Ig==;
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 01/27] hw/xen: Add xenstore wire implementation and implementation stubs
Date: Tue,  7 Mar 2023 18:26:41 +0000
Message-Id: <20230307182707.2298618-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This implements the basic wire protocol for the XenStore commands, punting
all the actual implementation to xs_impl_* functions which all just return
errors for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/meson.build     |   1 +
 hw/i386/kvm/trace-events    |  15 +
 hw/i386/kvm/xen_xenstore.c  | 871 +++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xenstore_impl.c | 117 +++++
 hw/i386/kvm/xenstore_impl.h |  58 +++
 5 files changed, 1054 insertions(+), 8 deletions(-)
 create mode 100644 hw/i386/kvm/xenstore_impl.c
 create mode 100644 hw/i386/kvm/xenstore_impl.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 82dd6ae7c6..6621ba5cd7 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -9,6 +9,7 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   'xen_evtchn.c',
   'xen_gnttab.c',
   'xen_xenstore.c',
+  'xenstore_impl.c',
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/trace-events b/hw/i386/kvm/trace-events
index b83c3eb965..e4c82de6f3 100644
--- a/hw/i386/kvm/trace-events
+++ b/hw/i386/kvm/trace-events
@@ -3,3 +3,18 @@ kvm_xen_unmap_pirq(int pirq, int gsi) "pirq %d gsi %d"
 kvm_xen_get_free_pirq(int pirq, int type) "pirq %d type %d"
 kvm_xen_bind_pirq(int pirq, int port) "pirq %d port %d"
 kvm_xen_unmask_pirq(int pirq, char *dev, int vector) "pirq %d dev %s vector %d"
+xenstore_error(unsigned int id, unsigned int tx_id, const char *err) "req %u tx %u err %s"
+xenstore_read(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_write(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_mkdir(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_directory(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_directory_part(unsigned int tx_id, const char *path, unsigned int offset) "tx %u path %s offset %u"
+xenstore_transaction_start(unsigned int new_tx) "new_tx %u"
+xenstore_transaction_end(unsigned int tx_id, bool commit) "tx %u commit %d"
+xenstore_rm(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_get_perms(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_set_perms(unsigned int tx_id, const char *path) "tx %u path %s"
+xenstore_watch(const char *path, const char *token) "path %s token %s"
+xenstore_unwatch(const char *path, const char *token) "path %s token %s"
+xenstore_reset_watches(void) ""
+xenstore_watch_event(const char *path, const char *token) "path %s token %s"
diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 14193ef3f9..64d8f1a38f 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -28,6 +28,10 @@
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_xen.h"
 
+#include "trace.h"
+
+#include "xenstore_impl.h"
+
 #include "hw/xen/interface/io/xs_wire.h"
 #include "hw/xen/interface/event_channel.h"
 
@@ -47,6 +51,9 @@ struct XenXenstoreState {
     SysBusDevice busdev;
     /*< public >*/
 
+    XenstoreImplState *impl;
+    GList *watch_events;
+
     MemoryRegion xenstore_page;
     struct xenstore_domain_interface *xs;
     uint8_t req_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
@@ -64,6 +71,7 @@ struct XenXenstoreState {
 struct XenXenstoreState *xen_xenstore_singleton;
 
 static void xen_xenstore_event(void *opaque);
+static void fire_watch_cb(void *opaque, const char *path, const char *token);
 
 static void xen_xenstore_realize(DeviceState *dev, Error **errp)
 {
@@ -89,6 +97,8 @@ static void xen_xenstore_realize(DeviceState *dev, Error **errp)
     }
     aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), true,
                        xen_xenstore_event, NULL, NULL, NULL, s);
+
+    s->impl = xs_impl_create();
 }
 
 static bool xen_xenstore_is_needed(void *opaque)
@@ -213,20 +223,761 @@ static void reset_rsp(XenXenstoreState *s)
     s->rsp_offset = 0;
 }
 
+static void xs_error(XenXenstoreState *s, unsigned int id,
+                     xs_transaction_t tx_id, int errnum)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    const char *errstr = NULL;
+
+    for (unsigned int i = 0; i < ARRAY_SIZE(xsd_errors); i++) {
+        struct xsd_errors *xsd_error = &xsd_errors[i];
+
+        if (xsd_error->errnum == errnum) {
+            errstr = xsd_error->errstring;
+            break;
+        }
+    }
+    assert(errstr);
+
+    trace_xenstore_error(id, tx_id, errstr);
+
+    rsp->type = XS_ERROR;
+    rsp->req_id = id;
+    rsp->tx_id = tx_id;
+    rsp->len = (uint32_t)strlen(errstr) + 1;
+
+    memcpy(&rsp[1], errstr, rsp->len);
+}
+
+static void xs_ok(XenXenstoreState *s, unsigned int type, unsigned int req_id,
+                  xs_transaction_t tx_id)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    const char *okstr = "OK";
+
+    rsp->type = type;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = (uint32_t)strlen(okstr) + 1;
+
+    memcpy(&rsp[1], okstr, rsp->len);
+}
+
+/*
+ * The correct request and response formats are documented in xen.git:
+ * docs/misc/xenstore.txt. A summary is given below for convenience.
+ * The '|' symbol represents a NUL character.
+ *
+ * ---------- Database read, write and permissions operations ----------
+ *
+ * READ                    <path>|                 <value|>
+ * WRITE                   <path>|<value|>
+ *         Store and read the octet string <value> at <path>.
+ *         WRITE creates any missing parent paths, with empty values.
+ *
+ * MKDIR                   <path>|
+ *         Ensures that the <path> exists, by necessary by creating
+ *         it and any missing parents with empty values.  If <path>
+ *         or any parent already exists, its value is left unchanged.
+ *
+ * RM                      <path>|
+ *         Ensures that the <path> does not exist, by deleting
+ *         it and all of its children.  It is not an error if <path> does
+ *         not exist, but it _is_ an error if <path>'s immediate parent
+ *         does not exist either.
+ *
+ * DIRECTORY               <path>|                 <child-leaf-name>|*
+ *         Gives a list of the immediate children of <path>, as only the
+ *         leafnames.  The resulting children are each named
+ *         <path>/<child-leaf-name>.
+ *
+ * DIRECTORY_PART          <path>|<offset>         <gencnt>|<child-leaf-name>|*
+ *         Same as DIRECTORY, but to be used for children lists longer than
+ *         XENSTORE_PAYLOAD_MAX. Input are <path> and the byte offset into
+ *         the list of children to return. Return values are the generation
+ *         count <gencnt> of the node (to be used to ensure the node hasn't
+ *         changed between two reads: <gencnt> being the same for multiple
+ *         reads guarantees the node hasn't changed) and the list of children
+ *         starting at the specified <offset> of the complete list.
+ *
+ * GET_PERMS               <path>|                 <perm-as-string>|+
+ * SET_PERMS               <path>|<perm-as-string>|+?
+ *         <perm-as-string> is one of the following
+ *                 w<domid>        write only
+ *                 r<domid>        read only
+ *                 b<domid>        both read and write
+ *                 n<domid>        no access
+ *         See https://wiki.xen.org/wiki/XenBus section
+ *         `Permissions' for details of the permissions system.
+ *         It is possible to set permissions for the special watch paths
+ *         "@introduceDomain" and "@releaseDomain" to enable receiving those
+ *         watches in unprivileged domains.
+ *
+ * ---------- Watches ----------
+ *
+ * WATCH                   <wpath>|<token>|?
+ *         Adds a watch.
+ *
+ *         When a <path> is modified (including path creation, removal,
+ *         contents change or permissions change) this generates an event
+ *         on the changed <path>.  Changes made in transactions cause an
+ *         event only if and when committed.  Each occurring event is
+ *         matched against all the watches currently set up, and each
+ *         matching watch results in a WATCH_EVENT message (see below).
+ *
+ *         The event's path matches the watch's <wpath> if it is an child
+ *         of <wpath>.
+ *
+ *         <wpath> can be a <path> to watch or @<wspecial>.  In the
+ *         latter case <wspecial> may have any syntax but it matches
+ *         (according to the rules above) only the following special
+ *         events which are invented by xenstored:
+ *             @introduceDomain    occurs on INTRODUCE
+ *             @releaseDomain      occurs on any domain crash or
+ *                                 shutdown, and also on RELEASE
+ *                                 and domain destruction
+ *         <wspecial> events are sent to privileged callers or explicitly
+ *         via SET_PERMS enabled domains only.
+ *
+ *         When a watch is first set up it is triggered once straight
+ *         away, with <path> equal to <wpath>.  Watches may be triggered
+ *         spuriously.  The tx_id in a WATCH request is ignored.
+ *
+ *         Watches are supposed to be restricted by the permissions
+ *         system but in practice the implementation is imperfect.
+ *         Applications should not rely on being sent a notification for
+ *         paths that they cannot read; however, an application may rely
+ *         on being sent a watch when a path which it _is_ able to read
+ *         is deleted even if that leaves only a nonexistent unreadable
+ *         parent.  A notification may omitted if a node's permissions
+ *         are changed so as to make it unreadable, in which case future
+ *         notifications may be suppressed (and if the node is later made
+ *         readable, some notifications may have been lost).
+ *
+ * WATCH_EVENT                                     <epath>|<token>|
+ *         Unsolicited `reply' generated for matching modification events
+ *         as described above.  req_id and tx_id are both 0.
+ *
+ *         <epath> is the event's path, ie the actual path that was
+ *         modified; however if the event was the recursive removal of an
+ *         parent of <wpath>, <epath> is just
+ *         <wpath> (rather than the actual path which was removed).  So
+ *         <epath> is a child of <wpath>, regardless.
+ *
+ *         Iff <wpath> for the watch was specified as a relative pathname,
+ *         the <epath> path will also be relative (with the same base,
+ *         obviously).
+ *
+ * UNWATCH                 <wpath>|<token>|?
+ *
+ * RESET_WATCHES           |
+ *         Reset all watches and transactions of the caller.
+ *
+ * ---------- Transactions ----------
+ *
+ * TRANSACTION_START       |                       <transid>|
+ *         <transid> is an opaque uint32_t allocated by xenstored
+ *         represented as unsigned decimal.  After this, transaction may
+ *         be referenced by using <transid> (as 32-bit binary) in the
+ *         tx_id request header field.  When transaction is started whole
+ *         db is copied; reads and writes happen on the copy.
+ *         It is not legal to send non-0 tx_id in TRANSACTION_START.
+ *
+ * TRANSACTION_END         T|
+ * TRANSACTION_END         F|
+ *         tx_id must refer to existing transaction.  After this
+ *         request the tx_id is no longer valid and may be reused by
+ *         xenstore.  If F, the transaction is discarded.  If T,
+ *         it is committed: if there were any other intervening writes
+ *         then our END gets get EAGAIN.
+ *
+ *         The plan is that in the future only intervening `conflicting'
+ *         writes cause EAGAIN, meaning only writes or other commits
+ *         which changed paths which were read or written in the
+ *         transaction at hand.
+ *
+ */
+
+static void xs_read(XenXenstoreState *s, unsigned int req_id,
+                    xs_transaction_t tx_id, uint8_t *req_data, unsigned int len)
+{
+    const char *path = (const char *)req_data;
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    uint8_t *rsp_data = (uint8_t *)&rsp[1];
+    g_autoptr(GByteArray) data = g_byte_array_new();
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_read(tx_id, path);
+    err = xs_impl_read(s->impl, xen_domid, tx_id, path, data);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    rsp->type = XS_READ;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = 0;
+
+    len = data->len;
+    if (len > XENSTORE_PAYLOAD_MAX) {
+        xs_error(s, req_id, tx_id, E2BIG);
+        return;
+    }
+
+    memcpy(&rsp_data[rsp->len], data->data, len);
+    rsp->len += len;
+}
+
+static void xs_write(XenXenstoreState *s, unsigned int req_id,
+                     xs_transaction_t tx_id, uint8_t *req_data,
+                     unsigned int len)
+{
+    g_autoptr(GByteArray) data = g_byte_array_new();
+    const char *path;
+    int err;
+
+    if (len == 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    path = (const char *)req_data;
+
+    while (len--) {
+        if (*req_data++ == '\0') {
+            break;
+        }
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    g_byte_array_append(data, req_data, len);
+
+    trace_xenstore_write(tx_id, path);
+    err = xs_impl_write(s->impl, xen_domid, tx_id, path, data);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_WRITE, req_id, tx_id);
+}
+
+static void xs_mkdir(XenXenstoreState *s, unsigned int req_id,
+                     xs_transaction_t tx_id, uint8_t *req_data,
+                     unsigned int len)
+{
+    g_autoptr(GByteArray) data = g_byte_array_new();
+    const char *path;
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    path = (const char *)req_data;
+
+    trace_xenstore_mkdir(tx_id, path);
+    err = xs_impl_read(s->impl, xen_domid, tx_id, path, data);
+    if (err == ENOENT) {
+        err = xs_impl_write(s->impl, xen_domid, tx_id, path, data);
+    }
+
+    if (!err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_MKDIR, req_id, tx_id);
+}
+
+static void xs_append_strings(XenXenstoreState *s, struct xsd_sockmsg *rsp,
+                              GList *strings, unsigned int start, bool truncate)
+{
+    uint8_t *rsp_data = (uint8_t *)&rsp[1];
+    GList *l;
+
+    for (l = strings; l; l = l->next) {
+        size_t len = strlen(l->data) + 1; /* Including the NUL termination */
+        char *str = l->data;
+
+        if (rsp->len + len > XENSTORE_PAYLOAD_MAX) {
+            if (truncate) {
+                len = XENSTORE_PAYLOAD_MAX - rsp->len;
+                if (!len) {
+                    return;
+                }
+            } else {
+                xs_error(s, rsp->req_id, rsp->tx_id, E2BIG);
+                return;
+            }
+        }
+
+        if (start) {
+            if (start >= len) {
+                start -= len;
+                continue;
+            }
+
+            str += start;
+            len -= start;
+            start = 0;
+        }
+
+        memcpy(&rsp_data[rsp->len], str, len);
+        rsp->len += len;
+    }
+    /* XS_DIRECTORY_PART wants an extra NUL to indicate the end */
+    if (truncate && rsp->len < XENSTORE_PAYLOAD_MAX) {
+        rsp_data[rsp->len++] = '\0';
+    }
+}
+
+static void xs_directory(XenXenstoreState *s, unsigned int req_id,
+                         xs_transaction_t tx_id, uint8_t *req_data,
+                         unsigned int len)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    GList *items = NULL;
+    const char *path;
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    path = (const char *)req_data;
+
+    trace_xenstore_directory(tx_id, path);
+    err = xs_impl_directory(s->impl, xen_domid, tx_id, path, NULL, &items);
+    if (err != 0) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    rsp->type = XS_DIRECTORY;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = 0;
+
+    xs_append_strings(s, rsp, items, 0, false);
+
+    g_list_free_full(items, g_free);
+}
+
+static void xs_directory_part(XenXenstoreState *s, unsigned int req_id,
+                              xs_transaction_t tx_id, uint8_t *req_data,
+                              unsigned int len)
+{
+    const char *offset_str, *path = (const char *)req_data;
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    char *rsp_data = (char *)&rsp[1];
+    uint64_t gencnt = 0;
+    unsigned int offset;
+    GList *items = NULL;
+    int err;
+
+    if (len == 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    while (len--) {
+        if (*req_data++ == '\0') {
+            break;
+        }
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    offset_str = (const char *)req_data;
+    while (len--) {
+        if (*req_data++ == '\0') {
+            break;
+        }
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    if (len) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    if (qemu_strtoui(offset_str, NULL, 10, &offset) < 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_directory_part(tx_id, path, offset);
+    err = xs_impl_directory(s->impl, xen_domid, tx_id, path, &gencnt, &items);
+    if (err != 0) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    rsp->type = XS_DIRECTORY_PART;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = snprintf(rsp_data, XENSTORE_PAYLOAD_MAX, "%" PRIu64, gencnt) + 1;
+
+    xs_append_strings(s, rsp, items, offset, true);
+
+    g_list_free_full(items, g_free);
+}
+
+static void xs_transaction_start(XenXenstoreState *s, unsigned int req_id,
+                                 xs_transaction_t tx_id, uint8_t *req_data,
+                                 unsigned int len)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    char *rsp_data = (char *)&rsp[1];
+    int err;
+
+    if (len != 1 || req_data[0] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    rsp->type = XS_TRANSACTION_START;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = 0;
+
+    err = xs_impl_transaction_start(s->impl, xen_domid, &tx_id);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    trace_xenstore_transaction_start(tx_id);
+
+    rsp->len = snprintf(rsp_data, XENSTORE_PAYLOAD_MAX, "%u", tx_id);
+    assert(rsp->len < XENSTORE_PAYLOAD_MAX);
+    rsp->len++;
+}
+
+static void xs_transaction_end(XenXenstoreState *s, unsigned int req_id,
+                               xs_transaction_t tx_id, uint8_t *req_data,
+                               unsigned int len)
+{
+    bool commit;
+    int err;
+
+    if (len != 2 || req_data[1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    switch (req_data[0]) {
+    case 'T':
+        commit = true;
+        break;
+    case 'F':
+        commit = false;
+        break;
+    default:
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_transaction_end(tx_id, commit);
+    err = xs_impl_transaction_end(s->impl, xen_domid, tx_id, commit);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_TRANSACTION_END, req_id, tx_id);
+}
+
+static void xs_rm(XenXenstoreState *s, unsigned int req_id,
+                  xs_transaction_t tx_id, uint8_t *req_data, unsigned int len)
+{
+    const char *path = (const char *)req_data;
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_rm(tx_id, path);
+    err = xs_impl_rm(s->impl, xen_domid, tx_id, path);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_RM, req_id, tx_id);
+}
+
+static void xs_get_perms(XenXenstoreState *s, unsigned int req_id,
+                         xs_transaction_t tx_id, uint8_t *req_data,
+                         unsigned int len)
+{
+    const char *path = (const char *)req_data;
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    GList *perms = NULL;
+    int err;
+
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_get_perms(tx_id, path);
+    err = xs_impl_get_perms(s->impl, xen_domid, tx_id, path, &perms);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    rsp->type = XS_GET_PERMS;
+    rsp->req_id = req_id;
+    rsp->tx_id = tx_id;
+    rsp->len = 0;
+
+    xs_append_strings(s, rsp, perms, 0, false);
+
+    g_list_free_full(perms, g_free);
+}
+
+static void xs_set_perms(XenXenstoreState *s, unsigned int req_id,
+                         xs_transaction_t tx_id, uint8_t *req_data,
+                         unsigned int len)
+{
+    const char *path = (const char *)req_data;
+    uint8_t *perm;
+    GList *perms = NULL;
+    int err;
+
+    if (len == 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    while (len--) {
+        if (*req_data++ == '\0') {
+            break;
+        }
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    perm = req_data;
+    while (len--) {
+        if (*req_data++ == '\0') {
+            perms = g_list_append(perms, perm);
+            perm = req_data;
+        }
+    }
+
+    /*
+     * Note that there may be trailing garbage at the end of the buffer.
+     * This is explicitly permitted by the '?' at the end of the definition:
+     *
+     *    SET_PERMS         <path>|<perm-as-string>|+?
+     */
+
+    trace_xenstore_set_perms(tx_id, path);
+    err = xs_impl_set_perms(s->impl, xen_domid, tx_id, path, perms);
+    g_list_free(perms);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_SET_PERMS, req_id, tx_id);
+}
+
+static void xs_watch(XenXenstoreState *s, unsigned int req_id,
+                     xs_transaction_t tx_id, uint8_t *req_data,
+                     unsigned int len)
+{
+    const char *token, *path = (const char *)req_data;
+    int err;
+
+    if (len == 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    while (len--) {
+        if (*req_data++ == '\0') {
+            break;
+        }
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    token = (const char *)req_data;
+    while (len--) {
+        if (*req_data++ == '\0') {
+            break;
+        }
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    /*
+     * Note that there may be trailing garbage at the end of the buffer.
+     * This is explicitly permitted by the '?' at the end of the definition:
+     *
+     *    WATCH             <wpath>|<token>|?
+     */
+
+    trace_xenstore_watch(path, token);
+    err = xs_impl_watch(s->impl, xen_domid, path, token, fire_watch_cb, s);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_WATCH, req_id, tx_id);
+}
+
+static void xs_unwatch(XenXenstoreState *s, unsigned int req_id,
+                       xs_transaction_t tx_id, uint8_t *req_data,
+                       unsigned int len)
+{
+    const char *token, *path = (const char *)req_data;
+    int err;
+
+    if (len == 0) {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    while (len--) {
+        if (*req_data++ == '\0') {
+            break;
+        }
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    token = (const char *)req_data;
+    while (len--) {
+        if (*req_data++ == '\0') {
+            break;
+        }
+        if (len == 0) {
+            xs_error(s, req_id, tx_id, EINVAL);
+            return;
+        }
+    }
+
+    trace_xenstore_unwatch(path, token);
+    err = xs_impl_unwatch(s->impl, xen_domid, path, token, fire_watch_cb, s);
+    if (err) {
+        xs_error(s, req_id, tx_id, err);
+        return;
+    }
+
+    xs_ok(s, XS_UNWATCH, req_id, tx_id);
+}
+
+static void xs_reset_watches(XenXenstoreState *s, unsigned int req_id,
+                             xs_transaction_t tx_id, uint8_t *req_data,
+                             unsigned int len)
+{
+    if (len == 0 || req_data[len - 1] != '\0') {
+        xs_error(s, req_id, tx_id, EINVAL);
+        return;
+    }
+
+    trace_xenstore_reset_watches();
+    xs_impl_reset_watches(s->impl, xen_domid);
+
+    xs_ok(s, XS_RESET_WATCHES, req_id, tx_id);
+}
+
+static void xs_priv(XenXenstoreState *s, unsigned int req_id,
+                    xs_transaction_t tx_id, uint8_t *data,
+                    unsigned int len)
+{
+    xs_error(s, req_id, tx_id, EACCES);
+}
+
+static void xs_unimpl(XenXenstoreState *s, unsigned int req_id,
+                      xs_transaction_t tx_id, uint8_t *data,
+                      unsigned int len)
+{
+    xs_error(s, req_id, tx_id, ENOSYS);
+}
+
+typedef void (*xs_impl)(XenXenstoreState *s, unsigned int req_id,
+                        xs_transaction_t tx_id, uint8_t *data,
+                        unsigned int len);
+
+struct xsd_req {
+    const char *name;
+    xs_impl fn;
+};
+#define XSD_REQ(_type, _fn)                           \
+    [_type] = { .name = #_type, .fn = _fn }
+
+struct xsd_req xsd_reqs[] = {
+    XSD_REQ(XS_READ, xs_read),
+    XSD_REQ(XS_WRITE, xs_write),
+    XSD_REQ(XS_MKDIR, xs_mkdir),
+    XSD_REQ(XS_DIRECTORY, xs_directory),
+    XSD_REQ(XS_DIRECTORY_PART, xs_directory_part),
+    XSD_REQ(XS_TRANSACTION_START, xs_transaction_start),
+    XSD_REQ(XS_TRANSACTION_END, xs_transaction_end),
+    XSD_REQ(XS_RM, xs_rm),
+    XSD_REQ(XS_GET_PERMS, xs_get_perms),
+    XSD_REQ(XS_SET_PERMS, xs_set_perms),
+    XSD_REQ(XS_WATCH, xs_watch),
+    XSD_REQ(XS_UNWATCH, xs_unwatch),
+    XSD_REQ(XS_CONTROL, xs_priv),
+    XSD_REQ(XS_INTRODUCE, xs_priv),
+    XSD_REQ(XS_RELEASE, xs_priv),
+    XSD_REQ(XS_IS_DOMAIN_INTRODUCED, xs_priv),
+    XSD_REQ(XS_RESUME, xs_priv),
+    XSD_REQ(XS_SET_TARGET, xs_priv),
+    XSD_REQ(XS_RESET_WATCHES, xs_reset_watches),
+};
+
 static void process_req(XenXenstoreState *s)
 {
     struct xsd_sockmsg *req = (struct xsd_sockmsg *)s->req_data;
-    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
-    const char enosys[] = "ENOSYS";
+    xs_impl handler = NULL;
 
     assert(req_pending(s));
     assert(!s->rsp_pending);
 
-    rsp->type = XS_ERROR;
-    rsp->req_id = req->req_id;
-    rsp->tx_id = req->tx_id;
-    rsp->len = sizeof(enosys);
-    memcpy((void *)&rsp[1], enosys, sizeof(enosys));
+    if (req->type < ARRAY_SIZE(xsd_reqs)) {
+        handler = xsd_reqs[req->type].fn;
+    }
+    if (!handler) {
+        handler = &xs_unimpl;
+    }
+
+    handler(s, req->req_id, req->tx_id, (uint8_t *)&req[1], req->len);
 
     s->rsp_pending = true;
     reset_req(s);
@@ -415,6 +1166,106 @@ static unsigned int put_rsp(XenXenstoreState *s)
     return copylen;
 }
 
+static void deliver_watch(XenXenstoreState *s, const char *path,
+                          const char *token)
+{
+    struct xsd_sockmsg *rsp = (struct xsd_sockmsg *)s->rsp_data;
+    uint8_t *rsp_data = (uint8_t *)&rsp[1];
+    unsigned int len;
+
+    assert(!s->rsp_pending);
+
+    trace_xenstore_watch_event(path, token);
+
+    rsp->type = XS_WATCH_EVENT;
+    rsp->req_id = 0;
+    rsp->tx_id = 0;
+    rsp->len = 0;
+
+    len = strlen(path);
+
+    /* XENSTORE_ABS/REL_PATH_MAX should ensure there can be no overflow */
+    assert(rsp->len + len < XENSTORE_PAYLOAD_MAX);
+
+    memcpy(&rsp_data[rsp->len], path, len);
+    rsp->len += len;
+    rsp_data[rsp->len] = '\0';
+    rsp->len++;
+
+    len = strlen(token);
+    /*
+     * It is possible for the guest to have chosen a token that will
+     * not fit (along with the patch) into a watch event. We have no
+     * choice but to drop the event if this is the case.
+     */
+    if (rsp->len + len >= XENSTORE_PAYLOAD_MAX) {
+        return;
+    }
+
+    memcpy(&rsp_data[rsp->len], token, len);
+    rsp->len += len;
+    rsp_data[rsp->len] = '\0';
+    rsp->len++;
+
+    s->rsp_pending = true;
+}
+
+struct watch_event {
+    char *path;
+    char *token;
+};
+
+static void queue_watch(XenXenstoreState *s, const char *path,
+                        const char *token)
+{
+    struct watch_event *ev = g_new0(struct watch_event, 1);
+
+    ev->path = g_strdup(path);
+    ev->token = g_strdup(token);
+
+    s->watch_events = g_list_append(s->watch_events, ev);
+}
+
+static void fire_watch_cb(void *opaque, const char *path, const char *token)
+{
+    XenXenstoreState *s = opaque;
+
+    assert(qemu_mutex_iothread_locked());
+
+    /*
+     * If there's a response pending, we obviously can't scribble over
+     * it. But if there's a request pending, it has dibs on the buffer
+     * too.
+     *
+     * In the common case of a watch firing due to backend activity
+     * when the ring was otherwise idle, we should be able to copy the
+     * strings directly into the rsp_data and thence the actual ring,
+     * without needing to perform any allocations and queue them.
+     */
+    if (s->rsp_pending || req_pending(s)) {
+        queue_watch(s, path, token);
+    } else {
+        deliver_watch(s, path, token);
+        /*
+         * If the message was queued because there was already ring activity,
+         * no need to wake the guest. But if not, we need to send the evtchn.
+         */
+        xen_be_evtchn_notify(s->eh, s->be_port);
+    }
+}
+
+static void process_watch_events(XenXenstoreState *s)
+{
+    struct watch_event *ev = s->watch_events->data;
+
+    deliver_watch(s, ev->path, ev->token);
+
+    s->watch_events = g_list_remove(s->watch_events, ev);
+    g_free(ev->path);
+    g_free(ev->token);
+    g_free(ev);
+}
+
 static void xen_xenstore_event(void *opaque)
 {
     XenXenstoreState *s = opaque;
@@ -433,6 +1284,10 @@ static void xen_xenstore_event(void *opaque)
         copied_to = copied_from = 0;
         processed = false;
 
+        if (!s->rsp_pending && s->watch_events) {
+            process_watch_events(s);
+        }
+
         if (s->rsp_pending) {
             copied_to = put_rsp(s);
         }
@@ -441,7 +1296,7 @@ static void xen_xenstore_event(void *opaque)
             copied_from = get_req(s);
         }
 
-        if (req_pending(s) && !s->rsp_pending) {
+        if (req_pending(s) && !s->rsp_pending && !s->watch_events) {
             process_req(s);
             processed = true;
         }
diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
new file mode 100644
index 0000000000..31dbc98fe0
--- /dev/null
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -0,0 +1,117 @@
+/*
+ * QEMU Xen emulation: The actual implementation of XenStore
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "xen_xenstore.h"
+#include "xenstore_impl.h"
+
+struct XenstoreImplState {
+};
+
+int xs_impl_read(XenstoreImplState *s, unsigned int dom_id,
+                 xs_transaction_t tx_id, const char *path, GByteArray *data)
+{
+    /*
+     * The data GByteArray shall exist, and will be freed by caller.
+     * Just g_byte_array_append() to it.
+     */
+    return ENOENT;
+}
+
+int xs_impl_write(XenstoreImplState *s, unsigned int dom_id,
+                  xs_transaction_t tx_id, const char *path, GByteArray *data)
+{
+    /*
+     * The data GByteArray shall exist, will be freed by caller. You are
+     * free to use g_byte_array_steal() and keep the data.
+     */
+    return ENOSYS;
+}
+
+int xs_impl_directory(XenstoreImplState *s, unsigned int dom_id,
+                      xs_transaction_t tx_id, const char *path,
+                      uint64_t *gencnt, GList **items)
+{
+    /*
+     * The items are (char *) to be freed by caller. Although it's consumed
+     * immediately so if you want to change it to (const char *) and keep
+     * them, go ahead and change the caller.
+     */
+    return ENOENT;
+}
+
+int xs_impl_transaction_start(XenstoreImplState *s, unsigned int dom_id,
+                              xs_transaction_t *tx_id)
+{
+    return ENOSYS;
+}
+
+int xs_impl_transaction_end(XenstoreImplState *s, unsigned int dom_id,
+                            xs_transaction_t tx_id, bool commit)
+{
+    return ENOSYS;
+}
+
+int xs_impl_rm(XenstoreImplState *s, unsigned int dom_id,
+               xs_transaction_t tx_id, const char *path)
+{
+    return ENOSYS;
+}
+
+int xs_impl_get_perms(XenstoreImplState *s, unsigned int dom_id,
+                      xs_transaction_t tx_id, const char *path, GList **perms)
+{
+    /*
+     * The perms are (char *) in the <perm-as-string> wire format to be
+     * freed by the caller.
+     */
+    return ENOSYS;
+}
+
+int xs_impl_set_perms(XenstoreImplState *s, unsigned int dom_id,
+                      xs_transaction_t tx_id, const char *path, GList *perms)
+{
+    /*
+     * The perms are (const char *) in the <perm-as-string> wire format.
+     */
+    return ENOSYS;
+}
+
+int xs_impl_watch(XenstoreImplState *s, unsigned int dom_id, const char *path,
+                  const char *token, xs_impl_watch_fn fn, void *opaque)
+{
+    /*
+     * When calling the callback @fn, note that the path should
+     * precisely match the relative path that the guest provided, even
+     * if it was a relative path which needed to be prefixed with
+     * /local/domain/${domid}/
+     */
+    return ENOSYS;
+}
+
+int xs_impl_unwatch(XenstoreImplState *s, unsigned int dom_id,
+                    const char *path, const char *token,
+                    xs_impl_watch_fn fn, void *opaque)
+{
+    /* Remove the watch that matches all four criteria */
+    return ENOSYS;
+}
+
+int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id)
+{
+    return ENOSYS;
+}
+
+XenstoreImplState *xs_impl_create(void)
+{
+    return g_new0(XenstoreImplState, 1);
+}
diff --git a/hw/i386/kvm/xenstore_impl.h b/hw/i386/kvm/xenstore_impl.h
new file mode 100644
index 0000000000..beb7b29ab8
--- /dev/null
+++ b/hw/i386/kvm/xenstore_impl.h
@@ -0,0 +1,58 @@
+/*
+ * QEMU Xen emulation: The actual implementation of XenStore
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_XENSTORE_IMPL_H
+#define QEMU_XENSTORE_IMPL_H
+
+typedef uint32_t xs_transaction_t;
+
+#define XBT_NULL 0
+
+typedef struct XenstoreImplState XenstoreImplState;
+
+XenstoreImplState *xs_impl_create(void);
+
+/*
+ * These functions return *positive* error numbers. This is a little
+ * unconventional but it helps to keep us honest because there is
+ * also a very limited set of error numbers that they are permitted
+ * to return (those in xsd_errors).
+ */
+
+int xs_impl_read(XenstoreImplState *s, unsigned int dom_id,
+                 xs_transaction_t tx_id, const char *path, GByteArray *data);
+int xs_impl_write(XenstoreImplState *s, unsigned int dom_id,
+                  xs_transaction_t tx_id, const char *path, GByteArray *data);
+int xs_impl_directory(XenstoreImplState *s, unsigned int dom_id,
+                      xs_transaction_t tx_id, const char *path,
+                      uint64_t *gencnt, GList **items);
+int xs_impl_transaction_start(XenstoreImplState *s, unsigned int dom_id,
+                              xs_transaction_t *tx_id);
+int xs_impl_transaction_end(XenstoreImplState *s, unsigned int dom_id,
+                            xs_transaction_t tx_id, bool commit);
+int xs_impl_rm(XenstoreImplState *s, unsigned int dom_id,
+               xs_transaction_t tx_id, const char *path);
+int xs_impl_get_perms(XenstoreImplState *s, unsigned int dom_id,
+                      xs_transaction_t tx_id, const char *path, GList **perms);
+int xs_impl_set_perms(XenstoreImplState *s, unsigned int dom_id,
+                      xs_transaction_t tx_id, const char *path, GList *perms);
+
+/* This differs from xs_watch_fn because it has the token */
+typedef void(xs_impl_watch_fn)(void *opaque, const char *path,
+                               const char *token);
+int xs_impl_watch(XenstoreImplState *s, unsigned int dom_id, const char *path,
+                  const char *token, xs_impl_watch_fn fn, void *opaque);
+int xs_impl_unwatch(XenstoreImplState *s, unsigned int dom_id,
+                    const char *path, const char *token, xs_impl_watch_fn fn,
+                    void *opaque);
+int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id);
+
+#endif /* QEMU_XENSTORE_IMPL_H */
-- 
2.39.0


