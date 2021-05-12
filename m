Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449837C09F
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 16:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126268.237680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqAA-0001kn-H2; Wed, 12 May 2021 14:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126268.237680; Wed, 12 May 2021 14:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqAA-0001it-Da; Wed, 12 May 2021 14:48:38 +0000
Received: by outflank-mailman (input) for mailman id 126268;
 Wed, 12 May 2021 14:48:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F0FV=KH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lgqA9-0001im-K7
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 14:48:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9ecda99-f3ad-42f7-87e8-23407bc00fe5;
 Wed, 12 May 2021 14:48:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D399B016;
 Wed, 12 May 2021 14:48:34 +0000 (UTC)
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
X-Inumbo-ID: d9ecda99-f3ad-42f7-87e8-23407bc00fe5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620830914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=73AxySUK/bHt+9oCp3HGltTtNvpfXQnqomKvsiEwxP0=;
	b=UyJXeOKKVEw4FYmbHuKLD0TCoOoioqwb7Rny43NcyQR+5Lh8iT4Cj4B89d54Gkw7VcYr/q
	We6rghKtFB1SwGKW5WqnM9lZvJc17w873ES9PNmW/o6PwljsEUwRnNReMj1jVyKjT9YXvp
	5T8kXKtvR7mvfOgyJFvNeIO0hCX9gjU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4] tools/libs/store: cleanup libxenstore interface
Date: Wed, 12 May 2021 16:48:32 +0200
Message-Id: <20210512144832.19026-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some internals in the libxenstore interface which should be
removed.

Move those functions into xs_lib.c and the related definitions into
xs_lib.h. Remove the functions from the mapfile. Add xs_lib.o to
xenstore_client as some of the internal functions are needed there.

Bump the libxenstore version to 4.0 as the change is incompatible.
Note that the removed functions should not result in any problem as
they ought to be used by xenstored or xenstore_client only.

Avoid an enum as part of a structure as the size of an enum is
compiler implementation dependent.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2: minimal variant (Ian Jackson)
V3: replace enum with unsigned int (Andrew Cooper)
V4: full variant again, this time with version bump (Ian Jackson)
---
 tools/include/xenstore_lib.h       |  54 ++------------
 tools/libs/store/Makefile          |   4 +-
 tools/libs/store/libxenstore.map   |  10 +--
 tools/libs/store/xs.c              | 112 +---------------------------
 tools/xenstore/Makefile            |   4 +-
 tools/xenstore/utils.h             |  11 +++
 tools/xenstore/xenstore_client.c   |   2 +
 tools/xenstore/xenstored_control.c |   1 +
 tools/xenstore/xenstored_core.c    |  19 +++--
 tools/xenstore/xenstored_core.h    |   6 +-
 tools/xenstore/xenstored_watch.c   |   2 +-
 tools/xenstore/xs_lib.c            | 114 ++++++++++++++++++++++++++++-
 tools/xenstore/xs_lib.h            |  50 +++++++++++++
 tools/xenstore/xs_tdb_dump.c       |   2 +-
 14 files changed, 204 insertions(+), 187 deletions(-)
 create mode 100644 tools/xenstore/xs_lib.h

diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib.h
index 4c9b6d1685..2266009ec1 100644
--- a/tools/include/xenstore_lib.h
+++ b/tools/include/xenstore_lib.h
@@ -26,42 +26,26 @@
 #include <stdint.h>
 #include <xen/io/xs_wire.h>
 
-/* Bitmask of permissions. */
-enum xs_perm_type {
-	XS_PERM_NONE = 0,
-	XS_PERM_READ = 1,
-	XS_PERM_WRITE = 2,
-	/* Internal use. */
-	XS_PERM_ENOENT_OK = 4,
-	XS_PERM_OWNER = 8,
-	XS_PERM_IGNORE = 16,
-};
-
 struct xs_permissions
 {
 	unsigned int id;
-	enum xs_perm_type perms;
-};
-
-/* Header of the node record in tdb. */
-struct xs_tdb_record_hdr {
-	uint64_t generation;
-	uint32_t num_perms;
-	uint32_t datalen;
-	uint32_t childlen;
-	struct xs_permissions perms[0];
+	unsigned int perms;	/* Bitmask of permissions. */
+#define XS_PERM_NONE		0x00
+#define XS_PERM_READ		0x01
+#define XS_PERM_WRITE		0x02
+	/* Internal use. */
+#define XS_PERM_ENOENT_OK	0x04
+#define XS_PERM_OWNER		0x08
+#define XS_PERM_IGNORE		0x10
 };
 
 /* Each 10 bits takes ~ 3 digits, plus one, plus one for nul terminator. */
 #define MAX_STRLEN(x) ((sizeof(x) * CHAR_BIT + CHAR_BIT-1) / 10 * 3 + 2)
 
 /* Path for various daemon things: env vars can override. */
-const char *xs_daemon_rootdir(void);
 const char *xs_daemon_rundir(void);
 const char *xs_daemon_socket(void);
 const char *xs_daemon_socket_ro(void);
-const char *xs_domain_dev(void);
-const char *xs_daemon_tdb(void);
 
 /* Simple write function: loops for you. */
 bool xs_write_all(int fd, const void *data, unsigned int len);
@@ -70,26 +54,4 @@ bool xs_write_all(int fd, const void *data, unsigned int len);
 bool xs_strings_to_perms(struct xs_permissions *perms, unsigned int num,
 			 const char *strings);
 
-/* Convert permissions to a string (up to len MAX_STRLEN(unsigned int)+1). */
-bool xs_perm_to_string(const struct xs_permissions *perm,
-                       char *buffer, size_t buf_len);
-
-/* Given a string and a length, count how many strings (nul terms). */
-unsigned int xs_count_strings(const char *strings, unsigned int len);
-
-/* Sanitising (quoting) possibly-binary strings. */
-struct expanding_buffer {
-	char *buf;
-	int avail;
-};
-
-/* Ensure that given expanding buffer has at least min_avail characters. */
-char *expanding_buffer_ensure(struct expanding_buffer *, int min_avail);
-
-/* sanitise_value() may return NULL if malloc fails. */
-char *sanitise_value(struct expanding_buffer *, const char *val, unsigned len);
-
-/* *out_len_r on entry is ignored; out must be at least strlen(in)+1 bytes. */
-void unsanitise_value(char *out, unsigned *out_len_r, const char *in);
-
 #endif /* XENSTORE_LIB_H */
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index bee57b5629..43b018aa8c 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -1,8 +1,8 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-MAJOR = 3.0
-MINOR = 3
+MAJOR = 4
+MINOR = 0
 
 ifeq ($(CONFIG_Linux),y)
 APPEND_LDFLAGS += -ldl
diff --git a/tools/libs/store/libxenstore.map b/tools/libs/store/libxenstore.map
index 9854305a2c..7e6c7bdd30 100644
--- a/tools/libs/store/libxenstore.map
+++ b/tools/libs/store/libxenstore.map
@@ -1,4 +1,4 @@
-VERS_3.0.3 {
+VERS_4.0 {
 	global:
 		xs_open;
 		xs_close;
@@ -32,18 +32,10 @@ VERS_3.0.3 {
 		xs_control_command;
 		xs_debug_command;
 		xs_suspend_evtchn_port;
-		xs_daemon_rootdir;
 		xs_daemon_rundir;
 		xs_daemon_socket;
 		xs_daemon_socket_ro;
-		xs_domain_dev;
-		xs_daemon_tdb;
 		xs_write_all;
 		xs_strings_to_perms;
-		xs_perm_to_string;
-		xs_count_strings;
-		expanding_buffer_ensure;
-		sanitise_value;
-		unsanitise_value;
 	local: *; /* Do not expose anything by default */
 };
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index c91377c27f..7a9a8b1656 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -34,6 +34,7 @@
 #include <stdint.h>
 #include <errno.h>
 #include "xenstore.h"
+#include "xs_lib.h"
 #include "list.h"
 #include "utils.h"
 
@@ -1358,117 +1359,6 @@ static void *read_thread(void *arg)
 }
 #endif
 
-char *expanding_buffer_ensure(struct expanding_buffer *ebuf, int min_avail)
-{
-	int want;
-	char *got;
-
-	if (ebuf->avail >= min_avail)
-		return ebuf->buf;
-
-	if (min_avail >= INT_MAX/3)
-		return 0;
-
-	want = ebuf->avail + min_avail + 10;
-	got = realloc(ebuf->buf, want);
-	if (!got)
-		return 0;
-
-	ebuf->buf = got;
-	ebuf->avail = want;
-	return ebuf->buf;
-}
-
-char *sanitise_value(struct expanding_buffer *ebuf,
-		     const char *val, unsigned len)
-{
-	int used, remain, c;
-	unsigned char *ip;
-
-#define ADD(c) (ebuf->buf[used++] = (c))
-#define ADDF(f,c) (used += sprintf(ebuf->buf+used, (f), (c)))
-
-	assert(len < INT_MAX/5);
-
-	ip = (unsigned char *)val;
-	used = 0;
-	remain = len;
-
-	if (!expanding_buffer_ensure(ebuf, remain + 1))
-		return NULL;
-
-	while (remain-- > 0) {
-		c= *ip++;
-
-		if (c >= ' ' && c <= '~' && c != '\\') {
-			ADD(c);
-			continue;
-		}
-
-		if (!expanding_buffer_ensure(ebuf, used + remain + 5))
-			/* for "<used>\\nnn<remain>\0" */
-			return 0;
-
-		ADD('\\');
-		switch (c) {
-		case '\t':  ADD('t');   break;
-		case '\n':  ADD('n');   break;
-		case '\r':  ADD('r');   break;
-		case '\\':  ADD('\\');  break;
-		default:
-			if (c < 010) ADDF("%03o", c);
-			else         ADDF("x%02x", c);
-		}
-	}
-
-	ADD(0);
-	assert(used <= ebuf->avail);
-	return ebuf->buf;
-
-#undef ADD
-#undef ADDF
-}
-
-void unsanitise_value(char *out, unsigned *out_len_r, const char *in)
-{
-	const char *ip;
-	char *op;
-	unsigned c;
-	int n;
-
-	for (ip = in, op = out; (c = *ip++); *op++ = c) {
-		if (c == '\\') {
-			c = *ip++;
-
-#define GETF(f) do {					\
-			n = 0;				\
-			sscanf(ip, f "%n", &c, &n);	\
-			ip += n;			\
-		} while (0)
-
-			switch (c) {
-			case 't':              c= '\t';            break;
-			case 'n':              c= '\n';            break;
-			case 'r':              c= '\r';            break;
-			case '\\':             c= '\\';            break;
-			case 'x':                    GETF("%2x");  break;
-			case '0': case '4':
-			case '1': case '5':
-			case '2': case '6':
-			case '3': case '7':    --ip; GETF("%3o");  break;
-			case 0:                --ip;               break;
-			default:;
-			}
-#undef GETF
-		}
-	}
-
-	*op = 0;
-
-	if (out_len_r)
-		*out_len_r = op - out;
-}
-
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index ab89e22d3a..01c9ccc70f 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -78,8 +78,8 @@ xenstored.a: $(XENSTORED_OBJS)
 $(CLIENTS): xenstore
 	ln -f xenstore $@
 
-xenstore: xenstore_client.o
-	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+xenstore: xenstore_client.o xs_lib.o
+	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
 
 xenstore-control: xenstore_control.o
 	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
index 87713a8e5d..9d012b97c1 100644
--- a/tools/xenstore/utils.h
+++ b/tools/xenstore/utils.h
@@ -7,6 +7,17 @@
 
 #include <xen-tools/libs.h>
 
+#include "xenstore_lib.h"
+
+/* Header of the node record in tdb. */
+struct xs_tdb_record_hdr {
+	uint64_t generation;
+	uint32_t num_perms;
+	uint32_t datalen;
+	uint32_t childlen;
+	struct xs_permissions perms[0];
+};
+
 /* Is A == B ? */
 #define streq(a,b) (strcmp((a),(b)) == 0)
 
diff --git a/tools/xenstore/xenstore_client.c b/tools/xenstore/xenstore_client.c
index ddbafc5175..0628ba275e 100644
--- a/tools/xenstore/xenstore_client.c
+++ b/tools/xenstore/xenstore_client.c
@@ -22,6 +22,8 @@
 
 #include <sys/ioctl.h>
 
+#include "xs_lib.h"
+
 #define PATH_SEP '/'
 #define MAX_PATH_LEN 256
 
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 52d4817679..995f671f35 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -34,6 +34,7 @@
 
 #include "utils.h"
 #include "talloc.h"
+#include "xs_lib.h"
 #include "xenstored_core.h"
 #include "xenstored_control.h"
 #include "xenstored_domain.h"
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 02ae390e25..4b7b71cfb3 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -46,7 +46,7 @@
 #include "utils.h"
 #include "list.h"
 #include "talloc.h"
-#include "xenstore_lib.h"
+#include "xs_lib.h"
 #include "xenstored_core.h"
 #include "xenstored_watch.h"
 #include "xenstored_transaction.h"
@@ -542,11 +542,11 @@ static int write_node(struct connection *conn, struct node *node,
 	return write_node_raw(conn, &key, node, no_quota_check);
 }
 
-enum xs_perm_type perm_for_conn(struct connection *conn,
-				const struct node_perms *perms)
+unsigned int perm_for_conn(struct connection *conn,
+			   const struct node_perms *perms)
 {
 	unsigned int i;
-	enum xs_perm_type mask = XS_PERM_READ|XS_PERM_WRITE|XS_PERM_OWNER;
+	unsigned int mask = XS_PERM_READ|XS_PERM_WRITE|XS_PERM_OWNER;
 
 	/* Owners and tools get it all... */
 	if (!domain_is_unprivileged(conn) || perms->p[0].id == conn->id
@@ -584,7 +584,7 @@ char *get_parent(const void *ctx, const char *node)
  * Temporary memory allocations are done with ctx.
  */
 static int ask_parents(struct connection *conn, const void *ctx,
-		       const char *name, enum xs_perm_type *perm)
+		       const char *name, unsigned int *perm)
 {
 	struct node *node;
 
@@ -618,10 +618,9 @@ static int ask_parents(struct connection *conn, const void *ctx,
  * Temporary memory allocations are done with ctx.
  */
 static int errno_from_parents(struct connection *conn, const void *ctx,
-			      const char *node, int errnum,
-			      enum xs_perm_type perm)
+			      const char *node, int errnum, unsigned int perm)
 {
-	enum xs_perm_type parent_perm = XS_PERM_NONE;
+	unsigned int parent_perm = XS_PERM_NONE;
 
 	/* We always tell them about memory failures. */
 	if (errnum == ENOMEM)
@@ -641,7 +640,7 @@ static int errno_from_parents(struct connection *conn, const void *ctx,
 static struct node *get_node(struct connection *conn,
 			     const void *ctx,
 			     const char *name,
-			     enum xs_perm_type perm)
+			     unsigned int perm)
 {
 	struct node *node;
 
@@ -873,7 +872,7 @@ static struct node *get_node_canonicalized(struct connection *conn,
 					   const void *ctx,
 					   const char *name,
 					   char **canonical_name,
-					   enum xs_perm_type perm)
+					   unsigned int perm)
 {
 	char *tmp_name;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index b50ea3f57d..6a6d0448e8 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -185,8 +185,8 @@ void send_ack(struct connection *conn, enum xsd_sockmsg_type type);
 char *canonicalize(struct connection *conn, const void *ctx, const char *node);
 
 /* Get access permissions. */
-enum xs_perm_type perm_for_conn(struct connection *conn,
-				const struct node_perms *perms);
+unsigned int perm_for_conn(struct connection *conn,
+			   const struct node_perms *perms);
 
 /* Write a node to the tdb data base. */
 int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
@@ -200,8 +200,6 @@ struct connection *new_connection(connwritefn_t *write, connreadfn_t *read);
 struct connection *get_connection_by_id(unsigned int conn_id);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
-enum xs_perm_type perm_for_conn(struct connection *conn,
-				const struct node_perms *perms);
 
 /* Is this a valid node name? */
 bool is_valid_nodename(const char *node);
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index db89e0141f..aca0a71bad 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -124,7 +124,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 			    const char *name, struct node *node,
 			    struct node_perms *perms)
 {
-	enum xs_perm_type perm;
+	unsigned int perm;
 	struct node *parent;
 	char *parent_name;
 
diff --git a/tools/xenstore/xs_lib.c b/tools/xenstore/xs_lib.c
index 80c03acbea..10fa4c3ad0 100644
--- a/tools/xenstore/xs_lib.c
+++ b/tools/xenstore/xs_lib.c
@@ -16,12 +16,13 @@
     License along with this library; If not, see <http://www.gnu.org/licenses/>.
 */
 
+#include <assert.h>
 #include <unistd.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
 #include <errno.h>
-#include "xenstore_lib.h"
+#include "xs_lib.h"
 
 /* Common routines for the Xen store daemon and client library. */
 
@@ -179,3 +180,114 @@ unsigned int xs_count_strings(const char *strings, unsigned int len)
 
 	return num;
 }
+
+char *expanding_buffer_ensure(struct expanding_buffer *ebuf, int min_avail)
+{
+	int want;
+	char *got;
+
+	if (ebuf->avail >= min_avail)
+		return ebuf->buf;
+
+	if (min_avail >= INT_MAX/3)
+		return 0;
+
+	want = ebuf->avail + min_avail + 10;
+	got = realloc(ebuf->buf, want);
+	if (!got)
+		return 0;
+
+	ebuf->buf = got;
+	ebuf->avail = want;
+	return ebuf->buf;
+}
+
+char *sanitise_value(struct expanding_buffer *ebuf,
+		     const char *val, unsigned len)
+{
+	int used, remain, c;
+	unsigned char *ip;
+
+#define ADD(c) (ebuf->buf[used++] = (c))
+#define ADDF(f,c) (used += sprintf(ebuf->buf+used, (f), (c)))
+
+	assert(len < INT_MAX/5);
+
+	ip = (unsigned char *)val;
+	used = 0;
+	remain = len;
+
+	if (!expanding_buffer_ensure(ebuf, remain + 1))
+		return NULL;
+
+	while (remain-- > 0) {
+		c= *ip++;
+
+		if (c >= ' ' && c <= '~' && c != '\\') {
+			ADD(c);
+			continue;
+		}
+
+		if (!expanding_buffer_ensure(ebuf, used + remain + 5))
+			/* for "<used>\\nnn<remain>\0" */
+			return 0;
+
+		ADD('\\');
+		switch (c) {
+		case '\t':  ADD('t');   break;
+		case '\n':  ADD('n');   break;
+		case '\r':  ADD('r');   break;
+		case '\\':  ADD('\\');  break;
+		default:
+			if (c < 010) ADDF("%03o", c);
+			else         ADDF("x%02x", c);
+		}
+	}
+
+	ADD(0);
+	assert(used <= ebuf->avail);
+	return ebuf->buf;
+
+#undef ADD
+#undef ADDF
+}
+
+void unsanitise_value(char *out, unsigned *out_len_r, const char *in)
+{
+	const char *ip;
+	char *op;
+	unsigned c;
+	int n;
+
+	for (ip = in, op = out; (c = *ip++); *op++ = c) {
+		if (c == '\\') {
+			c = *ip++;
+
+#define GETF(f) do {					\
+			n = 0;				\
+			sscanf(ip, f "%n", &c, &n);	\
+			ip += n;			\
+		} while (0)
+
+			switch (c) {
+			case 't':		c= '\t';		break;
+			case 'n':		c= '\n';		break;
+			case 'r':		c= '\r';		break;
+			case '\\':		c= '\\';		break;
+			case 'x':		GETF("%2x");		break;
+			case '0': case '4':
+			case '1': case '5':
+			case '2': case '6':
+			case '3': case '7':	--ip; GETF("%3o");	break;
+			case 0:			--ip;			break;
+			default:;
+			}
+#undef GETF
+		}
+	}
+
+	*op = 0;
+
+	if (out_len_r)
+		*out_len_r = op - out;
+}
diff --git a/tools/xenstore/xs_lib.h b/tools/xenstore/xs_lib.h
new file mode 100644
index 0000000000..efa05997d6
--- /dev/null
+++ b/tools/xenstore/xs_lib.h
@@ -0,0 +1,50 @@
+/*
+    Common routines between Xen store user library and daemon.
+    Copyright (C) 2005 Rusty Russell IBM Corporation
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+*/
+
+#ifndef XS_LIB_H
+#define XS_LIB_H
+
+#include "xenstore_lib.h"
+
+const char *xs_daemon_rootdir(void);
+const char *xs_domain_dev(void);
+const char *xs_daemon_tdb(void);
+
+/* Convert permissions to a string (up to len MAX_STRLEN(unsigned int)+1). */
+bool xs_perm_to_string(const struct xs_permissions *perm,
+		       char *buffer, size_t buf_len);
+
+/* Given a string and a length, count how many strings (nul terms). */
+unsigned int xs_count_strings(const char *strings, unsigned int len);
+
+/* Sanitising (quoting) possibly-binary strings. */
+struct expanding_buffer {
+	char *buf;
+	int avail;
+};
+
+/* Ensure that given expanding buffer has at least min_avail characters. */
+char *expanding_buffer_ensure(struct expanding_buffer *, int min_avail);
+
+/* sanitise_value() may return NULL if malloc fails. */
+char *sanitise_value(struct expanding_buffer *, const char *val, unsigned len);
+
+/* *out_len_r on entry is ignored; out must be at least strlen(in)+1 bytes. */
+void unsanitise_value(char *out, unsigned *out_len_r, const char *in);
+
+#endif /* XS_LIB_H */
diff --git a/tools/xenstore/xs_tdb_dump.c b/tools/xenstore/xs_tdb_dump.c
index f74676cf1c..5d2db392b4 100644
--- a/tools/xenstore/xs_tdb_dump.c
+++ b/tools/xenstore/xs_tdb_dump.c
@@ -17,7 +17,7 @@ static uint32_t total_size(struct xs_tdb_record_hdr *hdr)
 		+ hdr->datalen + hdr->childlen;
 }
 
-static char perm_to_char(enum xs_perm_type perm)
+static char perm_to_char(unsigned int perm)
 {
 	return perm == XS_PERM_READ ? 'r' :
 		perm == XS_PERM_WRITE ? 'w' :
-- 
2.26.2


