Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6949E823E12
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:01:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661127.1030853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJbS-0000UK-EE; Thu, 04 Jan 2024 09:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661127.1030853; Thu, 04 Jan 2024 09:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJbS-0000R7-9s; Thu, 04 Jan 2024 09:01:26 +0000
Received: by outflank-mailman (input) for mailman id 661127;
 Thu, 04 Jan 2024 09:01:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJbQ-0007Zm-AR
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:01:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4c6e305-aadf-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 10:01:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF72221EE1;
 Thu,  4 Jan 2024 09:01:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 870B313722;
 Thu,  4 Jan 2024 09:01:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rFG4H+FzlmWYWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:01:21 +0000
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
X-Inumbo-ID: d4c6e305-aadf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9l1zFck36AXwEapU2Gj9ECie0Zocm/mcpIzingvfm50=;
	b=oJb1G/Ximy9O2WBkntcRwp4qve9sbCEZkIXToIvqnK6MZXB71gzoybmZn1rEEAdzUFMabL
	utWTYnmc5frDsWl+pHLWudXVojY454lsy3idO2NadM6wkHXX/OJq5GG5Gaa9uf4W/yOYgR
	qkqBa90Tbh2r5S88rnGt73V5UOYSrcA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9l1zFck36AXwEapU2Gj9ECie0Zocm/mcpIzingvfm50=;
	b=oJb1G/Ximy9O2WBkntcRwp4qve9sbCEZkIXToIvqnK6MZXB71gzoybmZn1rEEAdzUFMabL
	utWTYnmc5frDsWl+pHLWudXVojY454lsy3idO2NadM6wkHXX/OJq5GG5Gaa9uf4W/yOYgR
	qkqBa90Tbh2r5S88rnGt73V5UOYSrcA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 04/33] tools/xenlogd: connect to frontend
Date: Thu,  4 Jan 2024 10:00:26 +0100
Message-Id: <20240104090055.27323-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.58
X-Spamd-Result: default: False [-6.58 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 NEURAL_HAM_LONG(-0.28)[-0.280];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Add the code for connecting to frontends to xenlogd.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- support multiple rings per device (Jason Andryuk)
- don't set .revents initially (Jason Andryuk)
- call poll() with infinite timeout (Jason Andryuk)
- take mutex before calling pthread_cond_signal()
V3:
- fix SPDX indentifier (Andrew Cooper)
- better validation of host path (Jason Andryuk)
- don't hard-code dom0 in backend nodes (Jason Andryuk)
- use bool instead of int for some functions' return types
- open root directory (Jason Andryuk)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xen-9pfsd/Makefile    |   2 +-
 tools/xen-9pfsd/io.c        |  45 +++
 tools/xen-9pfsd/xen-9pfsd.c | 653 +++++++++++++++++++++++++++++++++++-
 tools/xen-9pfsd/xen-9pfsd.h |  61 ++++
 4 files changed, 757 insertions(+), 4 deletions(-)
 create mode 100644 tools/xen-9pfsd/io.c
 create mode 100644 tools/xen-9pfsd/xen-9pfsd.h

diff --git a/tools/xen-9pfsd/Makefile b/tools/xen-9pfsd/Makefile
index 4e35202f08..2023b19c62 100644
--- a/tools/xen-9pfsd/Makefile
+++ b/tools/xen-9pfsd/Makefile
@@ -10,7 +10,7 @@ LDFLAGS += $(PTHREAD_LDFLAGS)
 
 TARGETS := xen-9pfsd
 
-XEN-9PFSD_OBJS = xen-9pfsd.o
+XEN-9PFSD_OBJS = xen-9pfsd.o io.o
 $(XEN-9PFSD_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(XEN-9PFSD_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
 $(XEN-9PFSD_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
new file mode 100644
index 0000000000..027e87af4c
--- /dev/null
+++ b/tools/xen-9pfsd/io.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * xen-9pfsd - Xen 9pfs daemon
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
+#include "xen-9pfsd.h"
+
+static bool io_work_pending(struct ring *ring)
+{
+    if ( ring->stop_thread )
+        return true;
+    return false;
+}
+
+void *io_thread(void *arg)
+{
+    struct ring *ring = arg;
+
+    while ( !ring->stop_thread )
+    {
+        pthread_mutex_lock(&ring->mutex);
+        if ( !io_work_pending(ring) )
+        {
+            if ( xenevtchn_unmask(xe, ring->evtchn) < 0 )
+                syslog(LOG_WARNING, "xenevtchn_unmask() failed");
+            pthread_cond_wait(&ring->cond, &ring->mutex);
+        }
+        pthread_mutex_unlock(&ring->mutex);
+
+        /* TODO: I/O handling. */
+    }
+
+    ring->thread_active = false;
+
+    return NULL;
+}
diff --git a/tools/xen-9pfsd/xen-9pfsd.c b/tools/xen-9pfsd/xen-9pfsd.c
index 22cfff0c4e..9ce9ae559b 100644
--- a/tools/xen-9pfsd/xen-9pfsd.c
+++ b/tools/xen-9pfsd/xen-9pfsd.c
@@ -24,34 +24,632 @@
 
 #include <err.h>
 #include <errno.h>
+#include <fcntl.h>
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
 
+#include "xen-9pfsd.h"
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
 static volatile bool stop_me;
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
+    /* Path must be absolute. */
+    if ( device->host_path[0] != '/' )
+        return 1;
+
+    /* No double "/". */
+    if ( strstr(device->host_path, "//") )
+        return 1;
+
+    /* No trailing "/" (includes refusing to share "/"). */
+    if ( device->host_path[strlen(device->host_path) - 1] == '/' )
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
+static bool write_backend_node(device *device, const char *node,
+                               const char *val)
+{
+    struct path p;
+    unsigned int num_perms;
+    struct xs_permissions *old_perms;
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
+        return false;
+    }
+
+    old_perms = xs_get_permissions(xs, XBT_NULL, p.path, &num_perms);
+    if ( !old_perms )
+    {
+        syslog(LOG_ERR, "error getting permissions for \"%s\"", p.path);
+        return false;
+    }
+
+    perms[0] = old_perms[0];
+    free(old_perms);
+    if ( !xs_set_permissions(xs, XBT_NULL, p.path, perms, 2) )
+    {
+        syslog(LOG_ERR, "error setting permissions for \"%s\"", p.path);
+        return false;
+    }
+
+    return true;
+}
+
+static bool write_backend_node_uint(device *device, const char *node,
+                                   unsigned int val)
+{
+    char str[12];
+
+    snprintf(str, sizeof(str), "%u", val);
+
+    return write_backend_node(device, node, str);
+}
+
+static bool write_backend_state(device *device, enum xenbus_state state)
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
+        return false;
+    }
+
+    device->backend_state = state;
+
+    return true;
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
+    if ( device->root_fd >= 0 )
+        close(device->root_fd);
+
+    free(device->host_path);
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
+    device->root_fd = -1;
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
+    device->auto_delete = read_backend_node_uint(device, "auto-delete", 0);
+
+    device->host_path = read_backend_node(device, "path");
+    if ( check_host_path(device) )
+    {
+        syslog(LOG_ERR, "Host path \"%s\" for device %u/%u invalid.",
+               device->host_path, domid, devid);
+        goto err;
+    }
+    device->root_fd = open(device->host_path, O_RDONLY | O_DIRECTORY);
+    if ( device->root_fd < 0 )
+        goto err;
+
+    if ( !write_backend_node(device, "versions", "1") )
+        goto err;
+    if ( !write_backend_node_uint(device, "max-rings", MAX_RINGS) )
+        goto err;
+    if ( !write_backend_node_uint(device, "max-ring-page-order",
+                                 MAX_RING_ORDER) )
+        goto err;
+
+    if ( !write_backend_state(device, XenbusStateInitWait) )
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
+static void disconnect_ring(struct ring *ring)
+{
+    if ( !ring )
+        return;
+
+    if ( ring->thread_active )
+    {
+        ring->stop_thread = true;
+        pthread_cond_signal(&ring->cond);
+        pthread_join(ring->thread, NULL);
+        ring->stop_thread = false;
+    }
+
+    if ( ring->data.in )
+    {
+        xengnttab_unmap(xg, ring->data.in, 1 << ring->ring_order);
+        ring->data.in = NULL;
+    }
+    if ( ring->intf )
+    {
+        xengnttab_unmap(xg, ring->intf, 1 );
+        ring->intf = NULL;
+    }
+
+    if ( ring->evtchn )
+    {
+        xenevtchn_unbind(xe, ring->evtchn);
+        ring->evtchn = 0;
+    }
+
+    pthread_mutex_destroy(&ring->mutex);
+    pthread_cond_destroy(&ring->cond);
+}
+
+static void disconnect_guest(device *device)
+{
+    unsigned int ring_idx;
+
+    for ( ring_idx = 0; ring_idx < device->num_rings; ring_idx++ )
+    {
+        disconnect_ring(device->ring[ring_idx]);
+        free(device->ring[ring_idx]);
+        device->ring[ring_idx] = NULL;
+    }
+
+    device->num_rings = 0;
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
+    unsigned int ring_idx;
+    char node[20];
+    struct ring *ring;
+    xenevtchn_port_or_error_t evtchn;
+
+    val = read_frontend_node_uint(device, "version", 0);
+    if ( val != 1 )
+        return connect_err(device, "frontend specifies illegal version");
+    device->num_rings = read_frontend_node_uint(device, "num-rings", 0);
+    if ( device->num_rings < 1 || device->num_rings > MAX_RINGS )
+        return connect_err(device, "frontend specifies illegal ring number");
+
+    for ( ring_idx = 0; ring_idx < device->num_rings; ring_idx++ )
+    {
+        ring = calloc(1, sizeof(*ring));
+        if ( !ring )
+            return connect_err(device, "could not allocate ring memory");
+        device->ring[ring_idx] = ring;
+        ring->device = device;
+        pthread_cond_init(&ring->cond, NULL);
+        pthread_mutex_init(&ring->mutex, NULL);
+
+        snprintf(node, sizeof(node), "event-channel-%u", ring_idx);
+        val = read_frontend_node_uint(device, node, 0);
+        if ( val == 0 )
+            return connect_err(device, "frontend specifies illegal evtchn");
+        evtchn = xenevtchn_bind_interdomain(xe, device->domid, val);
+        if ( evtchn < 0 )
+            return connect_err(device, "could not bind to event channel");
+        ring->evtchn = evtchn;
+
+        snprintf(node, sizeof(node), "ring-ref%u", ring_idx);
+        val = read_frontend_node_uint(device, node, 0);
+        if ( val == 0 )
+            return connect_err(device,
+                               "frontend specifies illegal grant for ring");
+        ring->intf = xengnttab_map_grant_ref(xg, device->domid, val,
+                                             PROT_READ | PROT_WRITE);
+        if ( !ring->intf )
+            return connect_err(device, "could not map interface page");
+        ring->ring_order = ring->intf->ring_order;
+        if ( ring->ring_order > MAX_RING_ORDER || ring->ring_order < 1 )
+            return connect_err(device, "frontend specifies illegal ring order");
+        ring->ring_size = XEN_FLEX_RING_SIZE(ring->ring_order);
+        ring->data.in = xengnttab_map_domain_grant_refs(xg,
+                                                        1 << ring->ring_order,
+                                                        device->domid,
+                                                        ring->intf->ref,
+                                                        PROT_READ | PROT_WRITE);
+        if ( !ring->data.in )
+            return connect_err(device, "could not map ring pages");
+        ring->data.out = ring->data.in + ring->ring_size;
+
+        if ( pthread_create(&ring->thread, NULL, io_thread, ring) )
+            return connect_err(device, "could not start I/O thread");
+        ring->thread_active = true;
+    }
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
         xs_rm(xs, XBT_NULL, "libxl/xen-9pfs");
+        xs_unwatch(xs, "backend/xen_9pfs", "main");
+
+        remove_all_devices();
+    }
     if ( xe )
         xenevtchn_close(xe);
     if ( xg )
@@ -68,6 +666,33 @@ static void do_err(const char *msg)
     exit(1);
 }
 
+static void handle_event(void)
+{
+    xenevtchn_port_or_error_t evtchn;
+    device *device;
+    struct ring *ring;
+    unsigned int ring_idx;
+
+    evtchn = xenevtchn_pending(xe);
+    if ( evtchn < 0 )
+        do_err("xenevtchn_pending() failed");
+
+    XEN_TAILQ_FOREACH( device, &devs, list )
+    {
+        for ( ring_idx = 0; ring_idx < device->num_rings; ring_idx++ )
+        {
+            ring = device->ring[ring_idx];
+            if ( ring && ring->evtchn == evtchn )
+            {
+                pthread_mutex_lock(&ring->mutex);
+                pthread_cond_signal(&ring->cond);
+                pthread_mutex_unlock(&ring->mutex);
+                return;
+            }
+        }
+    }
+}
+
 static void xen_connect(void)
 {
     xs_transaction_t t;
@@ -122,6 +747,11 @@ int main(int argc, char *argv[])
     int syslog_mask = LOG_MASK(LOG_WARNING) | LOG_MASK(LOG_ERR) |
                       LOG_MASK(LOG_CRIT) | LOG_MASK(LOG_ALERT) |
                       LOG_MASK(LOG_EMERG);
+    char **watch;
+    struct pollfd p[2] = {
+        { .events = POLLIN },
+        { .events = POLLIN }
+    };
 
     umask(027);
     if ( getenv("XEN_9PFSD_VERBOSE") )
@@ -134,9 +764,26 @@ int main(int argc, char *argv[])
 
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
+        poll(p, 2, -1);
     }
 
     close_all();
diff --git a/tools/xen-9pfsd/xen-9pfsd.h b/tools/xen-9pfsd/xen-9pfsd.h
new file mode 100644
index 0000000000..ff3562164a
--- /dev/null
+++ b/tools/xen-9pfsd/xen-9pfsd.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_9PFSD_H
+#define XEN_9PFSD_H
+
+#include <pthread.h>
+#include <stdbool.h>
+#include <xenevtchn.h>
+#include <xen_list.h>
+#include <xen/xen.h>
+#include <xen/io/xenbus.h>
+#include <xen/io/9pfs.h>
+
+#define MAX_RINGS                4
+#define MAX_RING_ORDER           9
+#define MAX_OPEN_FILES_DEFAULT   5
+
+typedef struct device device;
+
+struct ring {
+    device *device;
+    pthread_t thread;
+    bool thread_active;
+    bool stop_thread;
+    pthread_cond_t cond;
+    pthread_mutex_t mutex;
+
+    evtchn_port_t evtchn;
+    struct xen_9pfs_data_intf *intf;
+    unsigned int ring_order;
+    RING_IDX ring_size;
+    struct xen_9pfs_data data;
+};
+
+struct device {
+    /* Admin data. */
+    XEN_TAILQ_ENTRY(device) list;
+    unsigned int last_seen;    /* Set in scan_backend(). */
+    unsigned int domid;
+    unsigned int devid;
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
+    unsigned int num_rings;
+    struct ring *ring[MAX_RINGS];
+    int root_fd;
+};
+
+extern xenevtchn_handle *xe;
+
+void *io_thread(void *arg);
+
+#endif /* XEN_9PFSD_H */
-- 
2.35.3


