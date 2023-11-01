Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C6B7DDE7B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626239.976342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7bg-0006yq-4F; Wed, 01 Nov 2023 09:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626239.976342; Wed, 01 Nov 2023 09:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7bg-0006vm-0b; Wed, 01 Nov 2023 09:33:48 +0000
Received: by outflank-mailman (input) for mailman id 626239;
 Wed, 01 Nov 2023 09:33:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7be-0005E0-Ty
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:33:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0fa375b-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:33:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9F8971F74A;
 Wed,  1 Nov 2023 09:33:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E73B13460;
 Wed,  1 Nov 2023 09:33:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RtuLGXkbQmWvCAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:33:45 +0000
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
X-Inumbo-ID: c0fa375b-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFW/VVQvgTZ+SrJ4qsC1qy917Hvkbh1EVGyIT8Z0qbI=;
	b=olZzq8l+lY4WagEYglSvD4Y15X3o8GxtCbwHERZLihNRN4LtJ74VzjJfJvKVijMoWkdrgA
	T4Q63PGPKbuf25mZU3HoNV4oGEm4g4muhaykikOBLWQqrtKKpQfau9pDyB+JLOzLMkap1W
	WxWH6+q/p6aCE+XzfHi/KDdEKiMNiR8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 03/29] tools/xenlogd: connect to frontend
Date: Wed,  1 Nov 2023 10:32:59 +0100
Message-Id: <20231101093325.30302-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the code for connecting to frontends to xenlogd.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenlogd/Makefile  |   2 +-
 tools/xenlogd/io.c      |  45 ++++
 tools/xenlogd/xenlogd.c | 575 +++++++++++++++++++++++++++++++++++++++-
 tools/xenlogd/xenlogd.h |  50 ++++
 4 files changed, 668 insertions(+), 4 deletions(-)
 create mode 100644 tools/xenlogd/io.c
 create mode 100644 tools/xenlogd/xenlogd.h

diff --git a/tools/xenlogd/Makefile b/tools/xenlogd/Makefile
index 550e914f59..0d44cd0e85 100644
--- a/tools/xenlogd/Makefile
+++ b/tools/xenlogd/Makefile
@@ -10,7 +10,7 @@ LDFLAGS += $(PTHREAD_LDFLAGS)
 
 TARGETS := xenlogd
 
-XENLOGD_OBJS = xenlogd.o
+XENLOGD_OBJS = xenlogd.o io.o
 $(XENLOGD_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(XENLOGD_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
 $(XENLOGD_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
new file mode 100644
index 0000000000..ef0954d69d
--- /dev/null
+++ b/tools/xenlogd/io.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * xenlogd - Xen logging daemon
+ *
+ * Copyright (C) 2023 Juergen Gross <jgross@suse.com>
+ *
+ * I/O thread handling.
+ */
+
+#include <stdbool.h>
+#include <string.h>
+#include <syslog.h>
+
+#include "xenlogd.h"
+
+static bool io_work_pending(device *device)
+{
+    if ( device->stop_thread )
+        return true;
+    return false;
+}
+
+void *io_thread(void *arg)
+{
+    device *device = arg;
+
+    while ( !device->stop_thread )
+    {
+        pthread_mutex_lock(&device->mutex);
+        if ( !io_work_pending(device) )
+        {
+            if ( xenevtchn_unmask(xe, device->evtchn) < 0 )
+                syslog(LOG_WARNING, "xenevtchn_unmask() failed");
+            pthread_cond_wait(&device->cond, &device->mutex);
+        }
+        pthread_mutex_unlock(&device->mutex);
+
+        /* TODO: I/O handling. */
+    }
+
+    device->thread_active = false;
+
+    return NULL;
+}
diff --git a/tools/xenlogd/xenlogd.c b/tools/xenlogd/xenlogd.c
index 792d1026a3..da0a09a122 100644
--- a/tools/xenlogd/xenlogd.c
+++ b/tools/xenlogd/xenlogd.c
@@ -24,34 +24,562 @@
 
 #include <err.h>
 #include <errno.h>
+#include <poll.h>
+#include <pthread.h>
 #include <signal.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <syslog.h>
+#include <sys/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>
-#include <xenevtchn.h>
 #include <xengnttab.h>
 #include <xenstore.h>
 
+#include "xenlogd.h"
+
+/*
+ * List of currently known devices.
+ * The list itself is modified only in the main thread. When a device is being
+ * removed its memory needs to be freed after the I/O thread (if existing)
+ * has stopped.
+ */
+static XEN_TAILQ_HEAD(devhead, device) devs = XEN_TAILQ_HEAD_INITIALIZER(devs);
+
+struct path {
+    char path[100];
+};
+
 static bool stop_me;
 static bool daemon_running;
 static struct xs_handle *xs;
 static xengnttab_handle *xg;
-static xenevtchn_handle *xe;
+static unsigned int now;
+
+xenevtchn_handle *xe;
 
 static void handle_stop(int sig)
 {
     stop_me = true;
 }
 
+static int check_host_path(device *device)
+{
+    struct stat statbuf;
+    char *path, *p;
+    int ret = 1;
+
+    if ( !device->host_path )
+        return 1;
+
+    if ( device->host_path[0] != '/' )
+        return 1;
+
+    path = strdup(device->host_path);
+    if ( !path )
+    {
+        syslog(LOG_CRIT, "memory allocation failure!");
+        return 1;
+    }
+
+    for ( p = path; p; )
+    {
+        p = strchr(p + 1, '/');
+        if ( p )
+            *p = 0;
+        if ( !stat(path, &statbuf) )
+        {
+            if ( !(statbuf.st_mode & S_IFDIR) )
+                break;
+            if ( !p )
+            {
+                ret = 0;
+                break;
+            }
+            *p = '/';
+            continue;
+        }
+        if ( mkdir(path, 0777) )
+            break;
+        if ( p )
+            *p = '/';
+    }
+
+    free(path);
+    return ret;
+}
+
+static void construct_frontend_path(device *device, const char *node,
+                                    struct path *p)
+{
+    snprintf(p->path, sizeof(p->path), "/local/domain/%u/device/9pfs/%u/%s",
+             device->domid, device->devid, node);
+}
+
+static void construct_backend_path(device *device, const char *node,
+                                   struct path *p)
+{
+    snprintf(p->path, sizeof(p->path), "backend/xen_9pfs/%u/%u/%s",
+             device->domid, device->devid, node);
+}
+
+static char *read_backend_node(device *device, const char *node)
+{
+    struct path p;
+    char *val;
+    unsigned int len;
+
+    construct_backend_path(device, node, &p);
+    val = xs_read(xs, XBT_NULL, p.path, &len);
+
+    return val;
+}
+
+static unsigned int uint_from_string(char *string, unsigned int def)
+{
+    unsigned long val;
+    char *end;
+
+    if ( !string )
+        return def;
+
+    val = strtoul(string, &end, 10);
+    if ( *end || val > UINT_MAX )
+        val = def;
+    free(string);
+
+    return val;
+}
+
+static unsigned int read_backend_node_uint(device *device, const char *node,
+                                           unsigned int def)
+{
+    return uint_from_string(read_backend_node(device, node), def);
+}
+
+static unsigned int read_frontend_node_uint(device *device, const char *node,
+                                            unsigned int def)
+{
+    struct path p;
+    unsigned int len;
+
+    construct_frontend_path(device, node, &p);
+
+    return uint_from_string(xs_read(xs, XBT_NULL, p.path, &len), def);
+}
+
+static int write_backend_node(device *device, const char *node, const char *val)
+{
+    struct path p;
+    struct xs_permissions perms[2] = {
+        { .id = 0, .perms = XS_PERM_NONE },
+        { .id = device->domid, .perms = XS_PERM_READ }
+    };
+
+    construct_backend_path(device, node, &p);
+    if ( !xs_write(xs, XBT_NULL, p.path, val, strlen(val)) )
+    {
+        syslog(LOG_ERR, "error writing bacḱend node \"%s\" for device %u/%u",
+               node, device->domid, device->devid);
+        return 1;
+    }
+
+    if ( !xs_set_permissions(xs, XBT_NULL, p.path, perms, 2) )
+    {
+        syslog(LOG_ERR, "error setting permissions for \"%s\"", p.path);
+        return 1;
+    }
+
+    return 0;
+}
+
+static int write_backend_state(device *device, enum xenbus_state state)
+{
+    struct path p;
+    char val[2];
+
+    snprintf(val, sizeof(val), "%u", state);
+    construct_backend_path(device, "state", &p);
+    if ( !xs_write(xs, XBT_NULL, p.path, val, 1) )
+    {
+        syslog(LOG_ERR, "error writing backend state %u for device %u/%u",
+               state, device->domid, device->devid);
+        return 1;
+    }
+
+    device->backend_state = state;
+
+    return 0;
+}
+
+static device *find_device(unsigned int domid, unsigned int devid)
+{
+    device *device;
+
+    XEN_TAILQ_FOREACH( device, &devs, list )
+    {
+        if ( domid == device->domid && devid == device->devid )
+            return device;
+    }
+
+    return NULL;
+}
+
+static void free_device(device *device)
+{
+    char token[20];
+    struct path p;
+
+    construct_frontend_path(device, "state", &p);
+    snprintf(token, sizeof(token), "%u/%u", device->domid, device->devid);
+    xs_unwatch(xs, p.path, token);
+
+    free(device->host_path);
+
+    pthread_mutex_destroy(&device->mutex);
+    pthread_cond_destroy(&device->cond);
+
+    free(device);
+}
+
+static device *new_device(unsigned int domid, unsigned int devid)
+{
+    device *device;
+    char token[20];
+    struct path p;
+    char *val;
+
+    device = calloc(1, sizeof(*device));
+    if ( !device )
+    {
+        syslog(LOG_CRIT, "Got no memory for new device %u/%u", domid, devid);
+        return NULL;
+    }
+
+    device->domid = domid;
+    device->devid = devid;
+
+    construct_frontend_path(device, "state", &p);
+    snprintf(token, sizeof(token), "%u/%u", domid, devid);
+    if ( !xs_watch(xs, p.path, token) )
+    {
+        syslog(LOG_ERR, "Setting up watch for device %u/%u failed",
+               domid, devid);
+        free(device);
+        return NULL;
+    }
+
+    pthread_cond_init(&device->cond, NULL);
+    pthread_mutex_init(&device->mutex, NULL);
+
+    val = read_backend_node(device, "security_model");
+    if ( !val || strcmp(val, "none") )
+    {
+        syslog(LOG_ERR, "Security model \"%s\" for device %u/%u invalid.",
+               val, domid, devid);
+        free(val);
+        goto err;
+    }
+    free(val);
+
+    device->max_space = read_backend_node_uint(device, "max-space", 0);
+    device->max_files = read_backend_node_uint(device, "max-files", 0);
+    device->max_open_files =
+        read_backend_node_uint(device, "max-open-files", 0)
+        ?: MAX_OPEN_FILES_DEFAULT;
+    device->auto_delete = !!read_backend_node_uint(device, "auto-delete", 0);
+
+    device->host_path = read_backend_node(device, "path");
+    if ( check_host_path(device) )
+    {
+        syslog(LOG_ERR, "Host path \"%s\" for device %u/%u invalid.",
+               device->host_path, domid, devid);
+        goto err;
+    }
+
+    if ( write_backend_node(device, "versions", "1") )
+        goto err;
+    if ( write_backend_node(device, "max-rings", "1") )
+        goto err;
+    if ( write_backend_node(device, "max-ring-page-order", "9") )
+        goto err;
+
+    if ( write_backend_state(device, XenbusStateInitWait) )
+        goto err;
+
+    XEN_TAILQ_INSERT_TAIL(&devs, device, list);
+    syslog(LOG_INFO, "New device %u/%u added", domid, devid);
+
+    return device;
+
+ err:
+    free_device(device);
+    return NULL;
+}
+
+static void disconnect_guest(device *device)
+{
+    if ( device->thread_active )
+    {
+        device->stop_thread = true;
+        pthread_cond_signal(&device->cond);
+        pthread_join(device->thread, NULL);
+        device->stop_thread = false;
+    }
+
+    if ( device->data.in )
+    {
+        xengnttab_unmap(xg, device->data.in, 1 << device->ring_order);
+        device->data.in = NULL;
+    }
+    if ( device->intf )
+    {
+        xengnttab_unmap(xg, device->intf, 1 );
+        device->intf = NULL;
+    }
+
+    if ( device->evtchn )
+    {
+        xenevtchn_unbind(xe, device->evtchn);
+        device->evtchn = 0;
+    }
+}
+
+static void close_device(device *device, enum xenbus_state state)
+{
+    disconnect_guest(device);
+    write_backend_state(device, state);
+}
+
+static void connect_err(device *device, const char *msg)
+{
+    syslog(LOG_WARNING, "%s", msg);
+    close_device(device, XenbusStateClosed);
+}
+
+static void connect_device(device *device)
+{
+    unsigned int val;
+    xenevtchn_port_or_error_t evtchn;
+
+    val = read_frontend_node_uint(device, "version", 0);
+    if ( val != 1 )
+        return connect_err(device, "frontend specifies illegal version");
+    val = read_frontend_node_uint(device, "num-rings", 0);
+    if ( val != 1 )
+        return connect_err(device, "frontend specifies illegal ring number");
+
+    val = read_frontend_node_uint(device, "event-channel-0", 0);
+    if ( val == 0 )
+        return connect_err(device, "frontend specifies illegal evtchn");
+    evtchn = xenevtchn_bind_interdomain(xe, device->domid, val);
+    if ( evtchn < 0 )
+        return connect_err(device, "could not bind to event channel");
+    device->evtchn = evtchn;
+
+    val = read_frontend_node_uint(device, "ring-ref0", 0);
+    if ( val == 0 )
+        return connect_err(device, "frontend specifies illegal grant for ring");
+    device->intf = xengnttab_map_grant_ref(xg, device->domid, val,
+                                           PROT_READ | PROT_WRITE);
+    if ( !device->intf )
+        return connect_err(device, "could not map interface page");
+    device->ring_order = device->intf->ring_order;
+    if ( device->ring_order > 9 || device->ring_order < 1 )
+        return connect_err(device, "frontend specifies illegal ring order");
+    device->ring_size = XEN_FLEX_RING_SIZE(device->ring_order);
+    device->data.in = xengnttab_map_domain_grant_refs(xg,
+                                                      1 << device->ring_order,
+                                                      device->domid,
+                                                      device->intf->ref,
+                                                      PROT_READ | PROT_WRITE);
+    if ( !device->data.in )
+        return connect_err(device, "could not map ring pages");
+    device->data.out = device->data.in + device->ring_size;
+
+    if ( pthread_create(&device->thread, NULL, io_thread, device) )
+       return connect_err(device, "could not start I/O thread");
+    device->thread_active = true;
+
+    write_backend_state(device, XenbusStateConnected);
+}
+
+static void remove_device(device *device)
+{
+    XEN_TAILQ_REMOVE(&devs, device, list);
+
+    disconnect_guest(device);
+    free_device(device);
+}
+
+static void remove_all_devices(void)
+{
+    device *device, *tmp;
+
+    XEN_TAILQ_FOREACH_SAFE( device, &devs, list, tmp )
+        remove_device(device);
+}
+
+static void frontend_changed(device *device)
+{
+    struct path p;
+    char *state, *end;
+    unsigned int len;
+    unsigned long new_state;
+
+    construct_frontend_path(device, "state", &p);
+    state = xs_read(xs, XBT_NULL, p.path, &len);
+    if ( !state )
+    {
+        close_device(device, XenbusStateClosed);
+        return;
+    }
+
+    new_state = strtoul(state, &end, 10);
+    if ( *end || new_state > XenbusStateReconfigured )
+    {
+        syslog(LOG_WARNING, "unknown state \"%s\" seen for device %u/%u", state,
+               device->domid, device->devid);
+        new_state = XenbusStateUnknown;
+    }
+    free(state);
+
+    if ( new_state == device->frontend_state )
+        return;
+
+    switch ( new_state )
+    {
+    case XenbusStateInitialising:
+        break;
+
+    case XenbusStateInitialised:
+        connect_device(device);
+        break;
+
+    case XenbusStateConnected:
+        break;
+
+    case XenbusStateClosing:
+        close_device(device, XenbusStateClosing);
+        break;
+
+    case XenbusStateClosed:
+        close_device(device, XenbusStateClosed);
+        break;
+
+    default:
+        syslog(LOG_WARNING, "not handled frontend state %lu for device %u/%u",
+               new_state, device->domid, device->devid);
+        break;
+    }
+
+    device->frontend_state = new_state;
+}
+
+static void check_device(unsigned int domid, unsigned int devid)
+{
+    device *device;
+
+    device = find_device(domid, devid);
+    if ( !device )
+    {
+        device = new_device(domid, devid);
+        if ( !device )
+            return;
+    }
+
+    device->last_seen = now;
+}
+
+static void scan_backend(void)
+{
+    char **doms;
+    unsigned int n_doms, dom;
+    char **devices;
+    unsigned int n_devs, dev;
+    char dom_path[24];
+    unsigned long domid, devid;
+    char *end;
+    device *device, *tmp;
+
+    now++;
+
+    doms = xs_directory(xs, XBT_NULL, "backend/xen_9pfs", &n_doms);
+    if ( doms == NULL )
+        return;
+
+    for ( dom = 0; dom < n_doms; dom++ )
+    {
+        errno = 0;
+        domid = strtoul(doms[dom], &end, 10);
+        if ( errno || *end || domid >= DOMID_FIRST_RESERVED )
+            continue;
+
+        snprintf(dom_path, sizeof(dom_path), "backend/xen_9pfs/%lu", domid);
+        devices = xs_directory(xs, XBT_NULL, dom_path, &n_devs);
+
+        for ( dev = 0; dev < n_devs; dev++ )
+        {
+            errno = 0;
+            devid = strtoul(devices[dev], &end, 10);
+            if ( errno || *end || devid > UINT_MAX )
+                continue;
+
+            check_device(domid, devid);
+        }
+
+        free(devices);
+    }
+
+    free(doms);
+
+    XEN_TAILQ_FOREACH_SAFE( device, &devs, list, tmp )
+    {
+        if ( device->last_seen != now )
+            remove_device(device);
+    }
+}
+
+static void handle_watch(char *path, char *token)
+{
+    unsigned int domid, devid;
+    device *device;
+
+    if ( !strcmp(token, "main") )
+    {
+        scan_backend();
+        return;
+    }
+
+    if ( sscanf(token, "%u/%u", &domid, &devid) != 2 )
+    {
+        syslog(LOG_WARNING, "unknown watch event %s %s", path, token);
+        return;
+    }
+
+    device = find_device(domid, devid);
+    if ( !device )
+    {
+        syslog(LOG_WARNING, "watch event for unknown device %u/%u",
+               domid, devid);
+        return;
+    }
+
+    frontend_changed(device);
+}
+
 static void close_all(void)
 {
     if ( daemon_running )
+    {
         xs_rm(xs, XBT_NULL, "/tool/xenlog");
+        xs_unwatch(xs, "backend/xen_9pfs", "main");
+
+        remove_all_devices();
+    }
     if ( xe )
         xenevtchn_close(xe);
     if ( xg )
@@ -68,6 +596,25 @@ static void do_err(const char *msg)
     exit(1);
 }
 
+static void handle_event(void)
+{
+    xenevtchn_port_or_error_t evtchn;
+    device *device;
+
+    evtchn = xenevtchn_pending(xe);
+    if ( evtchn < 0 )
+        do_err("xenevtchn_pending() failed");
+
+    XEN_TAILQ_FOREACH( device, &devs, list )
+    {
+        if ( device->evtchn == evtchn )
+        {
+            pthread_cond_signal(&device->cond);
+            break;
+        }
+    }
+}
+
 static void xen_connect(void)
 {
     xs_transaction_t t;
@@ -122,6 +669,11 @@ int main(int argc, char *argv[])
     int syslog_mask = LOG_MASK(LOG_WARNING) | LOG_MASK(LOG_ERR) |
                       LOG_MASK(LOG_CRIT) | LOG_MASK(LOG_ALERT) |
                       LOG_MASK(LOG_EMERG);
+    char **watch;
+    struct pollfd p[2] = {
+        { .events = POLLIN, .revents = POLLIN },
+        { .events = POLLIN }
+    };
 
     umask(027);
     if ( getenv("XENLOGD_VERBOSE") )
@@ -134,9 +686,26 @@ int main(int argc, char *argv[])
 
     xen_connect();
 
+    if ( !xs_watch(xs, "backend/xen_9pfs", "main") )
+        do_err("xs_watch() in main thread failed");
+    p[0].fd = xs_fileno(xs);
+    p[1].fd = xenevtchn_fd(xe);
+
+    scan_backend();
+
     while ( !stop_me )
     {
-        sleep(60);
+        while ( (p[0].revents & POLLIN) &&
+                (watch = xs_check_watch(xs)) != NULL )
+        {
+            handle_watch(watch[XS_WATCH_PATH], watch[XS_WATCH_TOKEN]);
+            free(watch);
+        }
+
+        if ( p[1].revents & POLLIN )
+            handle_event();
+
+        poll(p, 2, 10000);
     }
 
     close_all();
diff --git a/tools/xenlogd/xenlogd.h b/tools/xenlogd/xenlogd.h
new file mode 100644
index 0000000000..a8e9f9ca22
--- /dev/null
+++ b/tools/xenlogd/xenlogd.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef XENLOGD_H
+#define XENLOGD_H
+
+#include <pthread.h>
+#include <stdbool.h>
+#include <xenevtchn.h>
+#include <xen_list.h>
+#include <xen/xen.h>
+#include <xen/io/xenbus.h>
+#include <xen/io/9pfs.h>
+
+#define MAX_OPEN_FILES_DEFAULT   5
+
+typedef struct device device;
+struct device {
+    /* Admin data. */
+    XEN_TAILQ_ENTRY(device) list;
+    unsigned int last_seen;    /* Set in scan_backend(). */
+    unsigned int domid;
+    unsigned int devid;
+    bool thread_active;
+    bool stop_thread;
+    pthread_t thread;
+    pthread_cond_t cond;
+    pthread_mutex_t mutex;
+
+    /* Tool side configuration data. */
+    char *host_path;
+    unsigned int max_space;
+    unsigned int max_files;
+    unsigned int max_open_files;
+    bool auto_delete;
+
+    /* Connection data. */
+    enum xenbus_state backend_state;
+    enum xenbus_state frontend_state;
+    evtchn_port_t evtchn;
+    struct xen_9pfs_data_intf *intf;
+    unsigned int ring_order;
+    RING_IDX ring_size;
+    struct xen_9pfs_data data;
+};
+
+extern xenevtchn_handle *xe;
+
+void *io_thread(void *arg);
+
+#endif /* XENLOGD_H */
-- 
2.35.3


