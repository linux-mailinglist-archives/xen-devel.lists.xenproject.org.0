Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BD56BB82D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 16:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510124.787258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTGs-0004WC-C2; Wed, 15 Mar 2023 15:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510124.787258; Wed, 15 Mar 2023 15:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTGs-0004U3-9E; Wed, 15 Mar 2023 15:42:34 +0000
Received: by outflank-mailman (input) for mailman id 510124;
 Wed, 15 Mar 2023 15:42:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGcw=7H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pcTGp-0004Tv-WE
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 15:42:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe50a1c7-c347-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 16:42:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35E2A219CE;
 Wed, 15 Mar 2023 15:42:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 133A313A2F;
 Wed, 15 Mar 2023 15:42:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w5dqA2XnEWSqcQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Mar 2023 15:42:29 +0000
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
X-Inumbo-ID: fe50a1c7-c347-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678894949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Gfolxv7kP8B5XLDmdwbOPUtFO3kL0eTn8HB++NhwomM=;
	b=gfBk/wKOx4BTWXtRPkS6iH+QhBV7P9uNaskfcclreUz6S4+oB9jeYLa0QvaBTvJpJw8iVh
	/mBuN/2fIXWEbDOBMo8oewH8MuGZDxD+pPgr66MaDBtLNSwMZbrDKrps1K3fUUZevew5kQ
	3L8iYynLKzrfNmimes6t1nDAH4gRa4o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools: use libxenlight for writing xenstore-stubdom console nodes
Date: Wed, 15 Mar 2023 16:42:26 +0100
Message-Id: <20230315154226.4238-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of duplicating libxl__device_console_add() work in
init-xenstore-domain.c, just use libxenlight.

This requires to add a small wrapper function to libxenlight, as
libxl__device_console_add() is an internal function.

This at once removes a theoretical race between starting xenconsoled
and xenstore-stubdom, as the old code wasn't using a single
transaction for writing all the entries, leading to the possibility
that xenconsoled would see only some of the entries being written.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/helpers/init-xenstore-domain.c | 41 ++++++++--------------------
 tools/include/libxl.h                | 12 ++++++++
 tools/libs/light/libxl_console.c     | 20 ++++++++++++++
 3 files changed, 44 insertions(+), 29 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 85cc9e8381..5ac4212216 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -11,6 +11,7 @@
 #include <xenguest.h>
 #include <xenstore.h>
 #include <xentoollog.h>
+#include <libxl.h>
 #include <xen/sys/xenbus_dev.h>
 #include <xen-xsm/flask/flask.h>
 #include <xen/io/xenbus.h>
@@ -403,15 +404,6 @@ static void do_xs_write(struct xs_handle *xsh, char *path, char *val)
         fprintf(stderr, "writing %s to xenstore failed.\n", path);
 }
 
-static void do_xs_write_dir_node(struct xs_handle *xsh, char *dir, char *node,
-                                 char *val)
-{
-    char full_path[100];
-
-    snprintf(full_path, 100, "%s/%s", dir, node);
-    do_xs_write(xsh, full_path, val);
-}
-
 static void do_xs_write_dom(struct xs_handle *xsh, char *path, char *val)
 {
     char full_path[64];
@@ -425,9 +417,10 @@ int main(int argc, char** argv)
     int opt;
     xc_interface *xch;
     struct xs_handle *xsh;
-    char buf[16], be_path[64], fe_path[64];
+    char buf[16];
     int rv, fd;
     char *maxmem_str = NULL;
+    libxl_ctx *ctx;
 
     while ( (opt = getopt_long(argc, argv, "v", options, NULL)) != -1 )
     {
@@ -528,27 +521,17 @@ int main(int argc, char** argv)
     if (maxmem)
         snprintf(buf, 16, "%d", maxmem * 1024);
     do_xs_write_dom(xsh, "memory/static-max", buf);
-    snprintf(be_path, 64, "/local/domain/0/backend/console/%d/0", domid);
-    snprintf(fe_path, 64, "/local/domain/%d/console", domid);
-    snprintf(buf, 16, "%d", domid);
-    do_xs_write_dir_node(xsh, be_path, "frontend-id", buf);
-    do_xs_write_dir_node(xsh, be_path, "frontend", fe_path);
-    do_xs_write_dir_node(xsh, be_path, "online", "1");
-    snprintf(buf, 16, "%d", XenbusStateInitialising);
-    do_xs_write_dir_node(xsh, be_path, "state", buf);
-    do_xs_write_dir_node(xsh, be_path, "protocol", "vt100");
-    do_xs_write_dir_node(xsh, fe_path, "backend", be_path);
-    do_xs_write_dir_node(xsh, fe_path, "backend-id", "0");
-    do_xs_write_dir_node(xsh, fe_path, "limit", "1048576");
-    do_xs_write_dir_node(xsh, fe_path, "type", "xenconsoled");
-    do_xs_write_dir_node(xsh, fe_path, "output", "pty");
-    do_xs_write_dir_node(xsh, fe_path, "tty", "");
-    snprintf(buf, 16, "%d", console_evtchn);
-    do_xs_write_dir_node(xsh, fe_path, "port", buf);
-    snprintf(buf, 16, "%ld", console_gfn);
-    do_xs_write_dir_node(xsh, fe_path, "ring-ref", buf);
     xs_close(xsh);
 
+    if ( libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, logger))
+    {
+        fprintf(stderr, "libxl_ctx_alloc() failed.\n");
+        rv = 3;
+        goto out;
+    }
+    libxl_console_add_xenstore(ctx, domid, 0, console_evtchn, console_gfn);
+    libxl_ctx_free(ctx);
+
     fd = creat(XEN_RUN_DIR "/xenstored.pid", 0666);
     if ( fd < 0 )
     {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d652895075..e54122991b 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -542,6 +542,11 @@
  */
 #define LIBXL_HAVE_DEVICE_DISK_SPECIFICATION 1
 
+/*
+ * LIBXL_HAVE_CONSOLE_ADD_XENSTORE indicates presence of the function
+ * libxl_console_add_xenstore() in libxl.
+ */
+#define LIBXL_HAVE_CONSOLE_ADD_XENSTORE 1
 /*
  * libxl ABI compatibility
  *
@@ -1982,6 +1987,13 @@ int libxl_console_get_tty(libxl_ctx *ctx, uint32_t domid, int cons_num,
  */
 int libxl_primary_console_get_tty(libxl_ctx *ctx, uint32_t domid_vm, char **path);
 
+/* libxl_console_add_xenstore writes the Xenstore entries for a domain's
+ * primary console based on domid, event channel port and the guest frame
+ * number of the PV console's ring page.
+ */
+int libxl_console_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
+                               int evtch, uint64_t gfn);
+
 /* May be called with info_r == NULL to check for domain's existence.
  * Returns ERROR_DOMAIN_NOTFOUND if domain does not exist (used to return
  * ERROR_INVAL for this scenario). */
diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index d8b2bc5465..ce3de100cc 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -346,6 +346,26 @@ out:
     return rc;
 }
 
+int libxl_console_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
+                               int evtch, uint64_t gfn)
+{
+    GC_INIT(ctx);
+    int rc;
+    libxl__device_console console = { .backend_domid = backend,
+                                      .output = "pty",
+                                      .consback = LIBXL__CONSOLE_BACKEND_XENCONSOLED,
+                                    };
+    libxl__domain_build_state state = { .console_port = evtch,
+                                        .console_mfn = gfn,
+                                      };
+    libxl__device device = { };
+
+    rc = libxl__device_console_add(gc, domid, &console, &state, &device);
+
+    GC_FREE;
+    return rc;
+}
+
 int libxl__device_vuart_add(libxl__gc *gc, uint32_t domid,
                             libxl__device_console *console,
                             libxl__domain_build_state *state)
-- 
2.35.3


