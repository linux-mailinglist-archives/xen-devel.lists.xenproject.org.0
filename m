Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA02F6506
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67303.120001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04tr-0006zG-0A; Thu, 14 Jan 2021 15:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67303.120001; Thu, 14 Jan 2021 15:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04tq-0006yq-SZ; Thu, 14 Jan 2021 15:51:02 +0000
Received: by outflank-mailman (input) for mailman id 67303;
 Thu, 14 Jan 2021 15:51:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04if-0002Sh-Kt
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:39:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a717018-3e63-43c3-b4e3-043cacae7da4;
 Thu, 14 Jan 2021 15:38:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 466D4AF24;
 Thu, 14 Jan 2021 15:38:10 +0000 (UTC)
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
X-Inumbo-ID: 2a717018-3e63-43c3-b4e3-043cacae7da4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3GdDWgeMBWkaMz/gEi/oHeX+EPdA3VpftiJhpX1VtQ=;
	b=kZ0YJfxWxWHOED8k0j2srzVXPOshF9cmGWn9KGlK0icAl7flZsEqAMXZFbnTLru5laoqjq
	CE1F9fJQBubp7A7C5kFUTO9I33yfgm6rVAEL820v8oaR36hcPQTomm1ycaEX1g1m6kIjl6
	YGv/9hBrDvICYkpQXW5f214oescEoI4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v11 17/27] tools/xenstore: dump the xenstore state for live update
Date: Thu, 14 Jan 2021 16:37:53 +0100
Message-Id: <20210114153803.2591-18-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dump the complete Xenstore status to a file (daemon case) or memory
(stubdom case).

As we don't know the exact length of the needed area in advance we are
using an anonymous rather large mapping in stubdom case, which will
use only virtual address space until accessed. And as we are writing
the area in a sequential manner this is fine. As the initial size we
are choosing the double size of the memory allocated via talloc(),
which should be more than enough.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V4:
- directly write to state file in daemon case
- add pending read data (Julien Grall)

V5:
- fix 0 length buffered data body (Julien Grall)
- simplify dump_state_buffered_data() (Paul Durrant)
- add data_resp_len field handling
- add comments (Paul Durrant)
- move dump_state_align() call out of dump_state_buffered_data()
  (Paul Durrant)
- move constant assignments out of loops (Paul Durrant)
- use set_tdb_key() (Paul Durrant)

V6:
- rename "first" to "Partial" (Paul Durrant)
- make sure data_resp_len is written (Paul Durrant)
- don't leak node memory in dump_state_nodes()
- add permission flag byte handling (Julien Grall)
- drop global state buffer (Julien Grall)
- add and correct comments (Julien Grall)
- add const (Julien Grall)
- add path buffer overrun check (Julien Grall)
- move get_watch_path() from later patch, correct dump_state_watches()
  to use it (Julien Grall)

V7:
- add glb.evtchn_fd, switch evtchn to local port
- remove definition of ROUNDUP() from utils.h due to rebase
- create state file with 0600 permissions
---
 tools/xenstore/utils.c             |  17 +++
 tools/xenstore/utils.h             |   6 +
 tools/xenstore/xenstored_control.c | 102 +++++++++++++-
 tools/xenstore/xenstored_core.c    | 213 +++++++++++++++++++++++++++++
 tools/xenstore/xenstored_core.h    |  12 ++
 tools/xenstore/xenstored_domain.c  | 105 ++++++++++++++
 tools/xenstore/xenstored_domain.h  |   3 +
 tools/xenstore/xenstored_watch.c   |  57 +++++++-
 tools/xenstore/xenstored_watch.h   |   3 +
 9 files changed, 512 insertions(+), 6 deletions(-)

diff --git a/tools/xenstore/utils.c b/tools/xenstore/utils.c
index 633ce3b4fc..0d80cb6de8 100644
--- a/tools/xenstore/utils.c
+++ b/tools/xenstore/utils.c
@@ -62,3 +62,20 @@ void barf_perror(const char *fmt, ...)
 	}
 	exit(1);
 }
+
+const char *dump_state_align(FILE *fp)
+{
+	long len;
+	static char nul[8] = {};
+
+	len = ftell(fp);
+	if (len < 0)
+		return "Dump state align error";
+	len &= 7;
+	if (!len)
+		return NULL;
+
+	if (fwrite(nul, 8 - len, 1, fp) != 1)
+		return "Dump state align error";
+	return NULL;
+}
diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
index 6a1b5de9bd..df1cb9a3ba 100644
--- a/tools/xenstore/utils.h
+++ b/tools/xenstore/utils.h
@@ -3,6 +3,7 @@
 #include <stdbool.h>
 #include <string.h>
 #include <stdint.h>
+#include <stdio.h>
 
 #include <xen-tools/libs.h>
 
@@ -21,6 +22,11 @@ static inline bool strends(const char *a, const char *b)
 	return streq(a + strlen(a) - strlen(b), b);
 }
 
+/*
+ * Write NUL bytes for aligning state data to 8 bytes.
+ */
+const char *dump_state_align(FILE *fp);
+
 void barf(const char *fmt, ...) __attribute__((noreturn));
 void barf_perror(const char *fmt, ...) __attribute__((noreturn));
 
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 0c3dc14fb7..206948d7e5 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -25,12 +25,21 @@ Interactive commands for Xen Store Daemon.
 #include <time.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <sys/mman.h>
+#include <fcntl.h>
 #include <unistd.h>
+#include <xenctrl.h>
 
 #include "utils.h"
 #include "talloc.h"
 #include "xenstored_core.h"
 #include "xenstored_control.h"
+#include "xenstored_domain.h"
+
+/* Mini-OS only knows about MAP_ANON. */
+#ifndef MAP_ANONYMOUS
+#define MAP_ANONYMOUS MAP_ANON
+#endif
 
 struct live_update {
 	/* For verification the correct connection is acting. */
@@ -40,6 +49,9 @@ struct live_update {
 	void *kernel;
 	unsigned int kernel_size;
 	unsigned int kernel_off;
+
+	void *dump_state;
+	unsigned long dump_size;
 #else
 	char *filename;
 #endif
@@ -56,6 +68,10 @@ static struct live_update *lu_status;
 
 static int lu_destroy(void *data)
 {
+#ifdef __MINIOS__
+	if (lu_status->dump_state)
+		munmap(lu_status->dump_state, lu_status->dump_size);
+#endif
 	lu_status = NULL;
 
 	return 0;
@@ -274,6 +290,31 @@ static const char *lu_arch(const void *ctx, struct connection *conn,
 	errno = EINVAL;
 	return NULL;
 }
+
+static FILE *lu_dump_open(const void *ctx)
+{
+	lu_status->dump_size = ROUNDUP(talloc_total_size(NULL) * 2,
+				       XC_PAGE_SHIFT);
+	lu_status->dump_state = mmap(NULL, lu_status->dump_size,
+				     PROT_READ | PROT_WRITE,
+				     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (lu_status->dump_state == MAP_FAILED)
+		return NULL;
+
+	return fmemopen(lu_status->dump_state, lu_status->dump_size, "w");
+}
+
+static void lu_dump_close(FILE *fp)
+{
+	size_t size;
+
+	size = ftell(fp);
+	size = ROUNDUP(size, XC_PAGE_SHIFT);
+	munmap(lu_status->dump_state + size, lu_status->dump_size - size);
+	lu_status->dump_size = size;
+
+	fclose(fp);
+}
 #else
 static const char *lu_binary(const void *ctx, struct connection *conn,
 			     const char *filename)
@@ -308,6 +349,27 @@ static const char *lu_arch(const void *ctx, struct connection *conn,
 	errno = EINVAL;
 	return NULL;
 }
+
+static FILE *lu_dump_open(const void *ctx)
+{
+	char *filename;
+	int fd;
+
+	filename = talloc_asprintf(ctx, "%s/state_dump", xs_daemon_rootdir());
+	if (!filename)
+		return NULL;
+
+	fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
+	if (fd < 0)
+		return NULL;
+
+	return fdopen(fd, "w");
+}
+
+static void lu_dump_close(FILE *fp)
+{
+	fclose(fp);
+}
 #endif
 
 static bool lu_check_lu_allowed(void)
@@ -347,7 +409,45 @@ static const char *lu_reject_reason(const void *ctx)
 
 static const char *lu_dump_state(const void *ctx, struct connection *conn)
 {
-	return NULL;
+	FILE *fp;
+	const char *ret;
+	struct xs_state_record_header end;
+	struct xs_state_preamble pre;
+
+	fp = lu_dump_open(ctx);
+	if (!fp)
+		return "Dump state open error";
+
+	memcpy(pre.ident, XS_STATE_IDENT, sizeof(pre.ident));
+	pre.version = htobe32(XS_STATE_VERSION);
+	pre.flags = XS_STATE_FLAGS;
+	if (fwrite(&pre, sizeof(pre), 1, fp) != 1) {
+		ret = "Dump write error";
+		goto out;
+	}
+
+	ret = dump_state_global(fp);
+	if (ret)
+		goto out;
+	ret = dump_state_connections(fp, conn);
+	if (ret)
+		goto out;
+	ret = dump_state_special_nodes(fp);
+	if (ret)
+		goto out;
+	ret = dump_state_nodes(fp, ctx);
+	if (ret)
+		goto out;
+
+	end.type = XS_STATE_TYPE_END;
+	end.length = 0;
+	if (fwrite(&end, sizeof(end), 1, fp) != 1)
+		ret = "Dump write error";
+
+ out:
+	lu_dump_close(fp);
+
+	return ret;
 }
 
 static const char *lu_activate_binary(const void *ctx)
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 23da8dafde..97e7277791 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2272,6 +2272,219 @@ int main(int argc, char *argv[])
 	}
 }
 
+const char *dump_state_global(FILE *fp)
+{
+	struct xs_state_record_header head;
+	struct xs_state_global glb;
+
+	head.type = XS_STATE_TYPE_GLOBAL;
+	head.length = sizeof(glb);
+	if (fwrite(&head, sizeof(head), 1, fp) != 1)
+		return "Dump global state error";
+	glb.socket_fd = sock;
+	glb.evtchn_fd = xenevtchn_fd(xce_handle);
+	if (fwrite(&glb, sizeof(glb), 1, fp) != 1)
+		return "Dump global state error";
+
+	return NULL;
+}
+
+/* Called twice: first with fp == NULL to get length, then for writing data. */
+const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
+				     const struct connection *conn,
+				     struct xs_state_connection *sc)
+{
+	unsigned int len = 0, used;
+	struct buffered_data *out, *in = c->in;
+	bool partial = true;
+
+	if (in && c != conn) {
+		len = in->inhdr ? in->used : sizeof(in->hdr);
+		if (fp && fwrite(&in->hdr, len, 1, fp) != 1)
+			return "Dump read data error";
+		if (!in->inhdr && in->used) {
+			len += in->used;
+			if (fp && fwrite(in->buffer, in->used, 1, fp) != 1)
+				return "Dump read data error";
+		}
+	}
+
+	if (sc) {
+		sc->data_in_len = len;
+		sc->data_resp_len = 0;
+	}
+
+	len = 0;
+
+	list_for_each_entry(out, &c->out_list, list) {
+		used = out->used;
+		if (out->inhdr) {
+			if (!used)
+				partial = false;
+			if (fp && fwrite(out->hdr.raw + out->used,
+				  sizeof(out->hdr) - out->used, 1, fp) != 1)
+				return "Dump buffered data error";
+			len += sizeof(out->hdr) - out->used;
+			used = 0;
+		}
+		if (fp && out->hdr.msg.len &&
+		    fwrite(out->buffer + used, out->hdr.msg.len - used,
+			   1, fp) != 1)
+			return "Dump buffered data error";
+		len += out->hdr.msg.len - used;
+		if (partial && sc)
+			sc->data_resp_len = len;
+		partial = false;
+	}
+
+	/* Add "OK" for live-update command. */
+	if (c == conn) {
+		struct xsd_sockmsg msg = conn->in->hdr.msg;
+
+		msg.len = sizeof("OK");
+		if (fp && fwrite(&msg, sizeof(msg), 1, fp) != 1)
+			return "Dump buffered data error";
+		len += sizeof(msg);
+		if (fp && fwrite("OK", msg.len, 1, fp) != 1)
+
+			return "Dump buffered data error";
+		len += msg.len;
+	}
+
+	if (sc)
+		sc->data_out_len = len;
+
+	return NULL;
+}
+
+const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
+				  const struct xs_permissions *perms,
+				  unsigned int n_perms)
+{
+	unsigned int p;
+
+	for (p = 0; p < n_perms; p++) {
+		switch ((int)perms[p].perms & ~XS_PERM_IGNORE) {
+		case XS_PERM_READ:
+			sn->perms[p].access = XS_STATE_NODE_PERM_READ;
+			break;
+		case XS_PERM_WRITE:
+			sn->perms[p].access = XS_STATE_NODE_PERM_WRITE;
+			break;
+		case XS_PERM_READ | XS_PERM_WRITE:
+			sn->perms[p].access = XS_STATE_NODE_PERM_BOTH;
+			break;
+		default:
+			sn->perms[p].access = XS_STATE_NODE_PERM_NONE;
+			break;
+		}
+		sn->perms[p].flags = (perms[p].perms & XS_PERM_IGNORE)
+				     ? XS_STATE_NODE_PERM_IGNORE : 0;
+		sn->perms[p].domid = perms[p].id;
+	}
+
+	if (fwrite(sn->perms, sizeof(*sn->perms), n_perms, fp) != n_perms)
+		return "Dump node permissions error";
+
+	return NULL;
+}
+
+static const char *dump_state_node_tree(FILE *fp, char *path)
+{
+	unsigned int pathlen, childlen, p = 0;
+	struct xs_state_record_header head;
+	struct xs_state_node sn;
+	TDB_DATA key, data;
+	const struct xs_tdb_record_hdr *hdr;
+	const char *child;
+	const char *ret;
+
+	pathlen = strlen(path) + 1;
+
+	set_tdb_key(path, &key);
+	data = tdb_fetch(tdb_ctx, key);
+	if (data.dptr == NULL)
+		return "Error reading node";
+
+	/* Clean up in case of failure. */
+	talloc_steal(path, data.dptr);
+
+	hdr = (void *)data.dptr;
+
+	head.type = XS_STATE_TYPE_NODE;
+	head.length = sizeof(sn);
+	sn.conn_id = 0;
+	sn.ta_id = 0;
+	sn.ta_access = 0;
+	sn.perm_n = hdr->num_perms;
+	sn.path_len = pathlen;
+	sn.data_len = hdr->datalen;
+	head.length += hdr->num_perms * sizeof(*sn.perms);
+	head.length += pathlen;
+	head.length += hdr->datalen;
+	head.length = ROUNDUP(head.length, 3);
+
+	if (fwrite(&head, sizeof(head), 1, fp) != 1)
+		return "Dump node state error";
+	if (fwrite(&sn, sizeof(sn), 1, fp) != 1)
+		return "Dump node state error";
+
+	ret = dump_state_node_perms(fp, &sn, hdr->perms, hdr->num_perms);
+	if (ret)
+		return ret;
+
+	if (fwrite(path, pathlen, 1, fp) != 1)
+		return "Dump node path error";
+	if (hdr->datalen &&
+	    fwrite(hdr->perms + hdr->num_perms, hdr->datalen, 1, fp) != 1)
+		return "Dump node data error";
+
+	ret = dump_state_align(fp);
+	if (ret)
+		return ret;
+
+	child = (char *)(hdr->perms + hdr->num_perms) + hdr->datalen;
+
+	/*
+	 * Use path for constructing children paths.
+	 * As we don't write out nodes without having written their parent
+	 * already we will never clobber a part of the path we'll need later.
+	 */
+	pathlen--;
+	if (path[pathlen - 1] != '/') {
+		path[pathlen] = '/';
+		pathlen++;
+	}
+	while (p < hdr->childlen) {
+		childlen = strlen(child) + 1;
+		if (pathlen + childlen > XENSTORE_ABS_PATH_MAX)
+			return "Dump node path length error";
+		strcpy(path + pathlen, child);
+		ret = dump_state_node_tree(fp, path);
+		if (ret)
+			return ret;
+		p += childlen;
+		child += childlen;
+	}
+
+	talloc_free(data.dptr);
+
+	return NULL;
+}
+
+const char *dump_state_nodes(FILE *fp, const void *ctx)
+{
+	char *path;
+
+	path = talloc_size(ctx, XENSTORE_ABS_PATH_MAX);
+	if (!path)
+		return "Path buffer allocation error";
+
+	strcpy(path, "/");
+
+	return dump_state_node_tree(fp, path);
+}
+
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index db70f61f0d..22287ddfe9 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -30,6 +30,7 @@
 #include <errno.h>
 
 #include "xenstore_lib.h"
+#include "xenstore_state.h"
 #include "list.h"
 #include "tdb.h"
 #include "hashtable.h"
@@ -41,6 +42,8 @@ typedef int32_t wrl_creditt;
 #define WRL_CREDIT_MAX (1000*1000*1000)
 /* ^ satisfies non-overflow condition for wrl_xfer_credit */
 
+struct xs_state_connection;
+
 struct buffered_data
 {
 	struct list_head list;
@@ -245,6 +248,15 @@ int remember_string(struct hashtable *hash, const char *str);
 
 void set_tdb_key(const char *name, TDB_DATA *key);
 
+const char *dump_state_global(FILE *fp);
+const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
+				     const struct connection *conn,
+				     struct xs_state_connection *sc);
+const char *dump_state_nodes(FILE *fp, const void *ctx);
+const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
+				  const struct xs_permissions *perms,
+				  unsigned int n_perms);
+
 #endif /* _XENSTORED_CORE_H */
 
 /*
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index ed8e83b06b..919a4d98cf 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1143,6 +1143,111 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
 	wrl_apply_debit_actual(conn->domain);
 }
 
+const char *dump_state_connections(FILE *fp, struct connection *conn)
+{
+	const char *ret = NULL;
+	unsigned int conn_id = 1;
+	struct xs_state_connection sc;
+	struct xs_state_record_header head;
+	struct connection *c;
+
+	list_for_each_entry(c, &connections, list) {
+		head.type = XS_STATE_TYPE_CONN;
+		head.length = sizeof(sc);
+
+		sc.conn_id = conn_id++;
+		sc.pad = 0;
+		memset(&sc.spec, 0, sizeof(sc.spec));
+		if (c->domain) {
+			sc.conn_type = XS_STATE_CONN_TYPE_RING;
+			sc.spec.ring.domid = c->id;
+			sc.spec.ring.tdomid = c->target ? c->target->id
+						: DOMID_INVALID;
+			sc.spec.ring.evtchn = c->domain->port;
+		} else {
+			sc.conn_type = XS_STATE_CONN_TYPE_SOCKET;
+			sc.spec.socket_fd = c->fd;
+		}
+
+		ret = dump_state_buffered_data(NULL, c, conn, &sc);
+		if (ret)
+			return ret;
+		head.length += sc.data_in_len + sc.data_out_len;
+		head.length = ROUNDUP(head.length, 3);
+		if (fwrite(&head, sizeof(head), 1, fp) != 1)
+			return "Dump connection state error";
+		if (fwrite(&sc, offsetof(struct xs_state_connection, data),
+			   1, fp) != 1)
+			return "Dump connection state error";
+		ret = dump_state_buffered_data(fp, c, conn, NULL);
+		if (ret)
+			return ret;
+		ret = dump_state_align(fp);
+		if (ret)
+			return ret;
+
+		ret = dump_state_watches(fp, c, sc.conn_id);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static const char *dump_state_special_node(FILE *fp, const char *name,
+					   const struct node_perms *perms)
+{
+	struct xs_state_record_header head;
+	struct xs_state_node sn;
+	unsigned int pathlen;
+	const char *ret;
+
+	pathlen = strlen(name) + 1;
+
+	head.type = XS_STATE_TYPE_NODE;
+	head.length = sizeof(sn);
+
+	sn.conn_id = 0;
+	sn.ta_id = 0;
+	sn.ta_access = 0;
+	sn.perm_n = perms->num;
+	sn.path_len = pathlen;
+	sn.data_len = 0;
+	head.length += perms->num * sizeof(*sn.perms);
+	head.length += pathlen;
+	head.length = ROUNDUP(head.length, 3);
+	if (fwrite(&head, sizeof(head), 1, fp) != 1)
+		return "Dump special node error";
+	if (fwrite(&sn, sizeof(sn), 1, fp) != 1)
+		return "Dump special node error";
+
+	ret = dump_state_node_perms(fp, &sn, perms->p, perms->num);
+	if (ret)
+		return ret;
+
+	if (fwrite(name, pathlen, 1, fp) != 1)
+		return "Dump special node path error";
+
+	ret = dump_state_align(fp);
+
+	return ret;
+}
+
+const char *dump_state_special_nodes(FILE *fp)
+{
+	const char *ret;
+
+	ret = dump_state_special_node(fp, "@releaseDomain",
+				      &dom_release_perms);
+	if (ret)
+		return ret;
+
+	ret = dump_state_special_node(fp, "@introduceDomain",
+				      &dom_introduce_perms);
+
+	return ret;
+}
+
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 66e0a12654..413b974375 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -97,4 +97,7 @@ void wrl_log_periodic(struct wrl_timestampt now);
 void wrl_apply_debit_direct(struct connection *conn);
 void wrl_apply_debit_trans_commit(struct connection *conn);
 
+const char *dump_state_connections(FILE *fp, struct connection *conn);
+const char *dump_state_special_nodes(FILE *fp);
+
 #endif /* _XENSTORED_DOMAIN_H */
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 9ff20690c0..9248f08bd9 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -72,6 +72,19 @@ static bool is_child(const char *child, const char *parent)
 	return child[len] == '/' || child[len] == '\0';
 }
 
+static const char *get_watch_path(const struct watch *watch, const char *name)
+{
+	const char *path = name;
+
+	if (watch->relative_path) {
+		path += strlen(watch->relative_path);
+		if (*path == '/') /* Could be "" */
+			path++;
+	}
+
+	return path;
+}
+
 /*
  * Send a watch event.
  * Temporary memory allocations are done with ctx.
@@ -85,11 +98,7 @@ static void add_event(struct connection *conn,
 	unsigned int len;
 	char *data;
 
-	if (watch->relative_path) {
-		name += strlen(watch->relative_path);
-		if (*name == '/') /* Could be "" */
-			name++;
-	}
+	name = get_watch_path(watch, name);
 
 	len = strlen(name) + 1 + strlen(watch->token) + 1;
 	/* Don't try to send over-long events. */
@@ -291,6 +300,44 @@ void conn_delete_all_watches(struct connection *conn)
 	}
 }
 
+const char *dump_state_watches(FILE *fp, struct connection *conn,
+			       unsigned int conn_id)
+{
+	const char *ret = NULL;
+	struct watch *watch;
+	struct xs_state_watch sw;
+	struct xs_state_record_header head;
+	const char *path;
+
+	head.type = XS_STATE_TYPE_WATCH;
+
+	list_for_each_entry(watch, &conn->watches, list) {
+		head.length = sizeof(sw);
+
+		sw.conn_id = conn_id;
+		path = get_watch_path(watch, watch->node);
+		sw.path_length = strlen(path) + 1;
+		sw.token_length = strlen(watch->token) + 1;
+		head.length += sw.path_length + sw.token_length;
+		head.length = ROUNDUP(head.length, 3);
+		if (fwrite(&head, sizeof(head), 1, fp) != 1)
+			return "Dump watch state error";
+		if (fwrite(&sw, sizeof(sw), 1, fp) != 1)
+			return "Dump watch state error";
+
+		if (fwrite(path, sw.path_length, 1, fp) != 1)
+			return "Dump watch path error";
+		if (fwrite(watch->token, sw.token_length, 1, fp) != 1)
+			return "Dump watch token error";
+
+		ret = dump_state_align(fp);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/xenstored_watch.h b/tools/xenstore/xenstored_watch.h
index 03094374f3..3d81645f45 100644
--- a/tools/xenstore/xenstored_watch.h
+++ b/tools/xenstore/xenstored_watch.h
@@ -30,4 +30,7 @@ void fire_watches(struct connection *conn, const void *tmp, const char *name,
 
 void conn_delete_all_watches(struct connection *conn);
 
+const char *dump_state_watches(FILE *fp, struct connection *conn,
+			       unsigned int conn_id);
+
 #endif /* _XENSTORED_WATCH_H */
-- 
2.26.2


