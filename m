Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1AB2F64CC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67205.119785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04he-0002pW-0U; Thu, 14 Jan 2021 15:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67205.119785; Thu, 14 Jan 2021 15:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hd-0002oW-Pt; Thu, 14 Jan 2021 15:38:25 +0000
Received: by outflank-mailman (input) for mailman id 67205;
 Thu, 14 Jan 2021 15:38:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hb-0002SV-MU
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f1c73ba-fd80-4032-902a-46c8d0bb7b0d;
 Thu, 14 Jan 2021 15:38:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3FA79AEC3;
 Thu, 14 Jan 2021 15:38:08 +0000 (UTC)
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
X-Inumbo-ID: 2f1c73ba-fd80-4032-902a-46c8d0bb7b0d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HsL6Mc3rID019qlX5MsNpyOqL+eLxMf7VkME+T0xvLY=;
	b=BwfVuS4zvlYNaDEdUD0dXFtGlDFSdJ4fqS9WBOY6ls9AYLYsJYUw62PRs3GJDupMdZAyGv
	srqG1FioQsN8bvaUvy4CjxYdUjArF9e+mlw4gE14pnTahIgxEapowT0+58sKwYw/th32Sl
	nm/VV75E1ztmbaR5AenYyD4yyijRUkE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v11 07/27] tools/xenstore: add live update command to xenstore-control
Date: Thu, 14 Jan 2021 16:37:43 +0100
Message-Id: <20210114153803.2591-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "live-update" command to xenstore-control enabling updating
xenstored to a new version in a running Xen system.

With -c <arg> it is possible to pass a different command line to the
new instance of xenstored. This will replace the command line used
for the invocation of the just running xenstored instance.

The running xenstored (or xenstore-stubdom) needs to support live
updating, of course.

For now just add a small dummy handler to C xenstore denying any
live update action.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- add 0 byte after kernel chunk
- add comment regrading add_to_buf() semantics (Pawel Wieczorkiewicz)
- use %u for unsigned in format (Pawel Wieczorkiewicz)
- explain buffer size better (Pawel Wieczorkiewicz)
- add loop around "-s" option for client side retry in case of timeout

V3:
- add live-update command to docs/misc/xenstore.txt (Paul Durrant)
- fix indent (Paul Durrant)

V4:
- made several parameters const (Julien Grall)
- added more details to xenstore.txt (Julien Grall)

V5:
- set old_binary to NULL initially (Paul Durrant)

V6:
- use strerror(errno) in error message (Julien Grall)

V10:
- make binary specification mandatory (Andrew Cooper)

V11:
- add sleep(1) in timeout loop (Edwin Torok)
---
 docs/misc/xenstore.txt             |  21 ++
 tools/xenstore/Makefile            |   3 +-
 tools/xenstore/xenstore_control.c  | 333 +++++++++++++++++++++++++++--
 tools/xenstore/xenstored_control.c |  30 +++
 4 files changed, 370 insertions(+), 17 deletions(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 2081f20f55..1480742330 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -317,6 +317,27 @@ CONTROL			<command>|[<parameters>|]
 	Current commands are:
 	check
 		checks xenstored innards
+	live-update|<params>|+
+		perform a live-update of the Xenstore daemon, only to
+		be used via xenstore-control command.
+		<params> are implementation specific and are used for
+		different steps of the live-update processing. Currently
+		supported <params> are:
+		-f <file>  specify new daemon binary
+		-b <size>  specify size of new stubdom binary
+		-d <chunk-size> <binary-chunk>  transfer chunk of new
+			stubdom binary
+		-c <pars>  specify new command line to use
+		-s [-t <sec>] [-F]  start live update process (-t specifies
+			timeout in seconds to wait for active transactions
+			to finish, default is 60 seconds; -F will force
+			live update to happen even with running transactions
+			after timeout elapsed)
+		-a  abort live update handling
+		All sub-options will return "OK" in case of success or an
+		error string in case of failure. -s can return "BUSY" in case
+		of an active transaction, a retry of -s can be done in that
+		case.
 	log|on
 		turn xenstore logging on
 	log|off
diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 9a0f0d012d..ab89e22d3a 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -11,6 +11,7 @@ CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += -I./include
 CFLAGS += $(CFLAGS_libxenevtchn)
 CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenguest)
 CFLAGS += $(CFLAGS_libxentoolcore)
 CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
@@ -81,7 +82,7 @@ xenstore: xenstore_client.o
 	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
 
 xenstore-control: xenstore_control.o
-	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
 
 xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
 	$(CC) $^ $(LDFLAGS) -o $@ $(APPEND_LDFLAGS)
diff --git a/tools/xenstore/xenstore_control.c b/tools/xenstore/xenstore_control.c
index afa04495a7..6031f216c7 100644
--- a/tools/xenstore/xenstore_control.c
+++ b/tools/xenstore/xenstore_control.c
@@ -1,9 +1,312 @@
+#define _GNU_SOURCE
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <time.h>
+#include <xenctrl.h>
+#include <xenguest.h>
 
 #include "xenstore.h"
 
+/* Add a string plus terminating 0 byte to buf, returning new len. */
+static int add_to_buf(char **buf, const char *val, int len)
+{
+    int vallen = strlen(val) + 1;
+
+    if (len < 0)
+        return -1;
+
+    *buf = realloc(*buf, len + vallen);
+    if (!*buf)
+        return -1;
+
+    strcpy(*buf + len, val);
+
+    return len + vallen;
+}
+
+static int live_update_start(struct xs_handle *xsh, bool force, unsigned int to)
+{
+    int len = 0;
+    char *buf = NULL, *ret;
+    time_t time_start;
+
+    if (asprintf(&ret, "%u", to) < 0)
+        return 1;
+    len = add_to_buf(&buf, "-s", len);
+    len = add_to_buf(&buf, "-t", len);
+    len = add_to_buf(&buf, ret, len);
+    free(ret);
+    if (force)
+        len = add_to_buf(&buf, "-F", len);
+    if (len < 0)
+        return 1;
+
+    for (time_start = time(NULL); time(NULL) - time_start < to;) {
+        ret = xs_control_command(xsh, "live-update", buf, len);
+        if (!ret)
+            goto err;
+        if (strcmp(ret, "BUSY"))
+            break;
+        sleep(1);
+    }
+
+    if (strcmp(ret, "OK"))
+        goto err;
+
+    free(buf);
+    free(ret);
+
+    return 0;
+
+ err:
+    fprintf(stderr, "Starting live update failed:\n%s\n",
+            ret ? : strerror(errno));
+    free(buf);
+    free(ret);
+
+    return 3;
+}
+
+static int live_update_cmdline(struct xs_handle *xsh, const char *cmdline)
+{
+    int len = 0, rc = 0;
+    char *buf = NULL, *ret;
+
+    len = add_to_buf(&buf, "-c", len);
+    len = add_to_buf(&buf, cmdline, len);
+    if (len < 0)
+        return 1;
+
+    ret = xs_control_command(xsh, "live-update", buf, len);
+    free(buf);
+    if (!ret || strcmp(ret, "OK")) {
+        fprintf(stderr, "Setting update binary failed:\n%s\n",
+                ret ? : strerror(errno));
+        rc = 3;
+    }
+    free(ret);
+
+    return rc;
+}
+
+static int send_kernel_blob(struct xs_handle *xsh, const char *binary)
+{
+    int rc = 0, len = 0;
+    xc_interface *xch;
+    struct xc_dom_image *dom;
+    char *ret, *buf = NULL;
+    size_t off, sz;
+#define BLOB_CHUNK_SZ 2048
+
+    xch = xc_interface_open(NULL, NULL, 0);
+    if (!xch) {
+        fprintf(stderr, "xc_interface_open() failed\n");
+        return 1;
+    }
+
+    dom = xc_dom_allocate(xch, NULL, NULL);
+    if (!dom) {
+        rc = 1;
+        goto out_close;
+    }
+
+    rc = xc_dom_kernel_file(dom, binary);
+    if (rc) {
+        rc = 1;
+        goto out_rel;
+    }
+
+    if (asprintf(&ret, "%zu", dom->kernel_size) < 0) {
+        rc = 1;
+        goto out_rel;
+    }
+    len = add_to_buf(&buf, "-b", len);
+    len = add_to_buf(&buf, ret, len);
+    free(ret);
+    if (len < 0) {
+        rc = 1;
+        goto out_rel;
+    }
+    ret = xs_control_command(xsh, "live-update", buf, len);
+    free(buf);
+    if (!ret || strcmp(ret, "OK")) {
+        fprintf(stderr, "Starting live update failed:\n%s\n",
+                ret ? : strerror(errno));
+        rc = 3;
+    }
+    free(ret);
+    if (rc)
+        goto out_rel;
+
+    /* buf capable to hold "-d" <1..2048> BLOB_CHUNK_SZ and a terminating 0. */
+    buf = malloc(3 + 5 + BLOB_CHUNK_SZ + 1);
+    if (!buf) {
+        rc = 1;
+        goto out_rel;
+    }
+
+    strcpy(buf, "-d");
+    sz = BLOB_CHUNK_SZ;
+    for (off = 0; off < dom->kernel_size; off += BLOB_CHUNK_SZ) {
+        if (dom->kernel_size - off < BLOB_CHUNK_SZ)
+            sz = dom->kernel_size - off;
+        sprintf(buf + 3, "%zu", sz);
+        len = 3 + strlen(buf + 3) + 1;
+        memcpy(buf + len, dom->kernel_blob + off, sz);
+        buf[len + sz] = 0;
+        len += sz + 1;
+        ret = xs_control_command(xsh, "live-update", buf, len);
+        if (!ret || strcmp(ret, "OK")) {
+            fprintf(stderr, "Transfer of new binary failed:\n%s\n",
+                    ret ? : strerror(errno));
+            rc = 3;
+            free(ret);
+            break;
+        }
+        free(ret);
+    }
+
+    free(buf);
+
+ out_rel:
+    xc_dom_release(dom);
+
+ out_close:
+    xc_interface_close(xch);
+
+    return rc;
+}
+
+/*
+ * Live update of Xenstore stubdom
+ *
+ * Sequence of actions:
+ * 1. transfer new stubdom binary
+ *    a) specify size
+ *    b) transfer unpacked binary in chunks
+ * 2. transfer new cmdline (optional)
+ * 3. start update (includes flags)
+ */
+static int live_update_stubdom(struct xs_handle *xsh, const char *binary,
+                               const char *cmdline, bool force, unsigned int to)
+{
+    int rc;
+
+    rc = send_kernel_blob(xsh, binary);
+    if (rc)
+        goto abort;
+
+    if (cmdline) {
+        rc = live_update_cmdline(xsh, cmdline);
+        if (rc)
+            goto abort;
+    }
+
+    rc = live_update_start(xsh, force, to);
+    if (rc)
+        goto abort;
+
+    return 0;
+
+ abort:
+    xs_control_command(xsh, "live-update", "-a", 3);
+    return rc;
+}
+
+/*
+ * Live update of Xenstore daemon
+ *
+ * Sequence of actions:
+ * 1. transfer new binary filename
+ * 2. transfer new cmdline (optional)
+ * 3. start update (includes flags)
+ */
+static int live_update_daemon(struct xs_handle *xsh, const char *binary,
+                              const char *cmdline, bool force, unsigned int to)
+{
+    int len = 0, rc;
+    char *buf = NULL, *ret;
+
+    len = add_to_buf(&buf, "-f", len);
+    len = add_to_buf(&buf, binary, len);
+    if (len < 0)
+        return 1;
+    ret = xs_control_command(xsh, "live-update", buf, len);
+    free(buf);
+    if (!ret || strcmp(ret, "OK")) {
+        fprintf(stderr, "Setting update binary failed:\n%s\n",
+                ret ? : strerror(errno));
+        free(ret);
+        return 3;
+    }
+    free(ret);
+
+    if (cmdline) {
+        rc = live_update_cmdline(xsh, cmdline);
+        if (rc)
+            goto abort;
+    }
+
+    rc = live_update_start(xsh, force, to);
+    if (rc)
+        goto abort;
+
+    return 0;
+
+ abort:
+    xs_control_command(xsh, "live-update", "-a", 3);
+    return rc;
+}
+
+static int live_update(struct xs_handle *xsh, int argc, char **argv)
+{
+    int rc = 0;
+    unsigned int i, to = 60;
+    char *binary = NULL, *cmdline = NULL, *val;
+    bool force = false;
+
+    for (i = 0; i < argc; i++) {
+        if (!strcmp(argv[i], "-c")) {
+            i++;
+            if (i == argc) {
+                fprintf(stderr, "Missing command line value\n");
+                rc = 2;
+                goto out;
+            }
+            cmdline = argv[i];
+        } else if (!strcmp(argv[i], "-t")) {
+            i++;
+            if (i == argc) {
+                fprintf(stderr, "Missing timeout value\n");
+                rc = 2;
+                goto out;
+            }
+            to = atoi(argv[i]);
+        } else if (!strcmp(argv[i], "-F"))
+            force = true;
+        else
+            binary = argv[i];
+    }
+
+    if (!binary) {
+        fprintf(stderr, "Missing binary specification\n");
+        rc = 2;
+        goto out;
+    }
+
+    val = xs_read(xsh, XBT_NULL, "/tool/xenstored/domid", &i);
+    if (val)
+        rc = live_update_stubdom(xsh, binary, cmdline, force, to);
+    else
+        rc = live_update_daemon(xsh, binary, cmdline, force, to);
+
+    free(val);
+
+ out:
+    return rc;
+}
 
 int main(int argc, char **argv)
 {
@@ -20,22 +323,6 @@ int main(int argc, char **argv)
         goto out;
     }
 
-    for (p = 2; p < argc; p++)
-        len += strlen(argv[p]) + 1;
-    if (len) {
-        par = malloc(len);
-        if (!par) {
-            fprintf(stderr, "Allocation error.\n");
-            rc = 1;
-            goto out;
-        }
-        len = 0;
-        for (p = 2; p < argc; p++) {
-            memcpy(par + len, argv[p], strlen(argv[p]) + 1);
-            len += strlen(argv[p]) + 1;
-        }
-    }
-
     xsh = xs_open(0);
     if (xsh == NULL) {
         fprintf(stderr, "Failed to contact Xenstored.\n");
@@ -43,6 +330,19 @@ int main(int argc, char **argv)
         goto out;
     }
 
+    if (!strcmp(argv[1], "live-update")) {
+        rc = live_update(xsh, argc - 2, argv + 2);
+        goto out_close;
+    }
+
+    for (p = 2; p < argc; p++)
+        len = add_to_buf(&par, argv[p], len);
+    if (len < 0) {
+        fprintf(stderr, "Allocation error.\n");
+        rc = 1;
+        goto out_close;
+    }
+
     ret = xs_control_command(xsh, argv[1], par, len);
     if (!ret) {
         rc = 3;
@@ -59,6 +359,7 @@ int main(int argc, char **argv)
     } else if (strlen(ret) > 0)
         printf("%s\n", ret);
 
+ out_close:
     xs_close(xsh);
 
  out:
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 8d29db8270..00fda5acdb 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -149,11 +149,41 @@ static int do_control_print(void *ctx, struct connection *conn,
 	return 0;
 }
 
+static int do_control_lu(void *ctx, struct connection *conn,
+			 char **vec, int num)
+{
+	const char *resp;
+
+	resp = talloc_strdup(ctx, "NYI");
+	send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
+	return 0;
+}
+
 static int do_control_help(void *, struct connection *, char **, int);
 
 static struct cmd_s cmds[] = {
 	{ "check", do_control_check, "" },
 	{ "log", do_control_log, "on|off" },
+
+	/*
+	 * The parameters are those of the xenstore-control utility!
+	 * Depending on environment (Mini-OS or daemon) the live-update
+	 * sequence is split into several sub-operations:
+	 * 1. Specification of new binary
+	 *    daemon:  -f <filename>
+	 *    Mini-OS: -b <binary-size>
+	 *             -d <size> <data-bytes> (multiple of those)
+	 * 2. New command-line (optional): -c <cmdline>
+	 * 3. Start of update: -s [-F] [-t <timeout>]
+	 * Any sub-operation needs to respond with the string "OK" in case
+	 * of success, any other response indicates failure.
+	 * A started live-update sequence can be aborted via "-a" (not
+	 * needed in case of failure for the first or last live-update
+	 * sub-operation).
+	 */
+	{ "live-update", do_control_lu,
+		"[-c <cmdline>] [-F] [-t <timeout>] <file>\n"
+		"    Default timeout is 60 seconds.", 4 },
 #ifdef __MINIOS__
 	{ "memreport", do_control_memreport, "" },
 #else
-- 
2.26.2


