Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4213478B1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 13:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100983.192761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2nh-0007gG-A7; Wed, 24 Mar 2021 12:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100983.192761; Wed, 24 Mar 2021 12:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2nh-0007fr-74; Wed, 24 Mar 2021 12:39:53 +0000
Received: by outflank-mailman (input) for mailman id 100983;
 Wed, 24 Mar 2021 12:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jyEQ=IW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lP2ng-0007fk-95
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 12:39:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 184b7ed3-510b-4ceb-90fb-a53fee583e66;
 Wed, 24 Mar 2021 12:39:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E76ADAB8A;
 Wed, 24 Mar 2021 12:39:49 +0000 (UTC)
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
X-Inumbo-ID: 184b7ed3-510b-4ceb-90fb-a53fee583e66
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616589590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oYu8+J3fSRjtZy4WyLNOzW1Ncx/3pJsJfPxBiYP8hzM=;
	b=o2mIh2EGkWEtMEQxVgzrrX2uM6MObLxCBLpLuWep51EdzSKnwfrVEl9TwH/ZqG7sS9g3zL
	h0zbT5m7PLaa9G7m5BiSoYlY3oc6DJ5nNkziNEoAl9iqhibExsjF+TXLkFpyIZNX0DToaI
	sz4S4JG6LxAO2IIOm/nHmbLxKtxrFwg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH-for-4.15 v3] tools/libs/store: tidy up libxenstore interface
Date: Wed, 24 Mar 2021 13:39:48 +0100
Message-Id: <20210324123948.7207-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xenstore_lib.h is in need to be tidied up a little bit:

- the definition of struct xs_tdb_record_hdr shouldn't be here
- some symbols are not namespaced correctly
- the layout of a structure with an enum inside it depends on the
  implementation of the compiler

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2: minimal variant (Ian Jackson)
V3: replace enum with unsigned int (Andrew Cooper)
---
 tools/include/xenstore_lib.h     | 37 +++++++++++---------------------
 tools/libs/store/libxenstore.map |  6 +++---
 tools/libs/store/xs.c            | 12 +++++------
 tools/xenstore/utils.h           | 11 ++++++++++
 tools/xenstore/xenstore_client.c | 12 +++++------
 tools/xenstore/xenstored_core.c  | 16 +++++++-------
 tools/xenstore/xenstored_core.h  |  8 +++----
 tools/xenstore/xenstored_watch.c |  2 +-
 tools/xenstore/xs_tdb_dump.c     |  2 +-
 9 files changed, 52 insertions(+), 54 deletions(-)

diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib.h
index 4c9b6d1685..fdf8752b16 100644
--- a/tools/include/xenstore_lib.h
+++ b/tools/include/xenstore_lib.h
@@ -26,30 +26,17 @@
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
@@ -78,18 +65,18 @@ bool xs_perm_to_string(const struct xs_permissions *perm,
 unsigned int xs_count_strings(const char *strings, unsigned int len);
 
 /* Sanitising (quoting) possibly-binary strings. */
-struct expanding_buffer {
+struct xs_expanding_buffer {
 	char *buf;
 	int avail;
 };
 
 /* Ensure that given expanding buffer has at least min_avail characters. */
-char *expanding_buffer_ensure(struct expanding_buffer *, int min_avail);
+char *xs_expanding_buffer_ensure(struct xs_expanding_buffer *, int min_avail);
 
 /* sanitise_value() may return NULL if malloc fails. */
-char *sanitise_value(struct expanding_buffer *, const char *val, unsigned len);
+char *xs_sanitise_value(struct xs_expanding_buffer *, const char *val, unsigned len);
 
 /* *out_len_r on entry is ignored; out must be at least strlen(in)+1 bytes. */
-void unsanitise_value(char *out, unsigned *out_len_r, const char *in);
+void xs_unsanitise_value(char *out, unsigned *out_len_r, const char *in);
 
 #endif /* XENSTORE_LIB_H */
diff --git a/tools/libs/store/libxenstore.map b/tools/libs/store/libxenstore.map
index 9854305a2c..fc1c213f13 100644
--- a/tools/libs/store/libxenstore.map
+++ b/tools/libs/store/libxenstore.map
@@ -42,8 +42,8 @@ VERS_3.0.3 {
 		xs_strings_to_perms;
 		xs_perm_to_string;
 		xs_count_strings;
-		expanding_buffer_ensure;
-		sanitise_value;
-		unsanitise_value;
+		xs_expanding_buffer_ensure;
+		xs_sanitise_value;
+		xs_unsanitise_value;
 	local: *; /* Do not expose anything by default */
 };
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index c91377c27f..109ea16d1e 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -1358,7 +1358,7 @@ static void *read_thread(void *arg)
 }
 #endif
 
-char *expanding_buffer_ensure(struct expanding_buffer *ebuf, int min_avail)
+char *xs_expanding_buffer_ensure(struct xs_expanding_buffer *ebuf, int min_avail)
 {
 	int want;
 	char *got;
@@ -1379,8 +1379,8 @@ char *expanding_buffer_ensure(struct expanding_buffer *ebuf, int min_avail)
 	return ebuf->buf;
 }
 
-char *sanitise_value(struct expanding_buffer *ebuf,
-		     const char *val, unsigned len)
+char *xs_sanitise_value(struct xs_expanding_buffer *ebuf,
+			const char *val, unsigned len)
 {
 	int used, remain, c;
 	unsigned char *ip;
@@ -1394,7 +1394,7 @@ char *sanitise_value(struct expanding_buffer *ebuf,
 	used = 0;
 	remain = len;
 
-	if (!expanding_buffer_ensure(ebuf, remain + 1))
+	if (!xs_expanding_buffer_ensure(ebuf, remain + 1))
 		return NULL;
 
 	while (remain-- > 0) {
@@ -1405,7 +1405,7 @@ char *sanitise_value(struct expanding_buffer *ebuf,
 			continue;
 		}
 
-		if (!expanding_buffer_ensure(ebuf, used + remain + 5))
+		if (!xs_expanding_buffer_ensure(ebuf, used + remain + 5))
 			/* for "<used>\\nnn<remain>\0" */
 			return 0;
 
@@ -1429,7 +1429,7 @@ char *sanitise_value(struct expanding_buffer *ebuf,
 #undef ADDF
 }
 
-void unsanitise_value(char *out, unsigned *out_len_r, const char *in)
+void xs_unsanitise_value(char *out, unsigned *out_len_r, const char *in)
 {
 	const char *ip;
 	char *op;
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
index 8015bfe5be..3d9d399e91 100644
--- a/tools/xenstore/xenstore_client.c
+++ b/tools/xenstore/xenstore_client.c
@@ -40,7 +40,7 @@ enum mode {
 
 static char *output_buf = NULL;
 static int output_pos = 0;
-static struct expanding_buffer ebuf;
+static struct xs_expanding_buffer ebuf;
 
 static int output_size = 0;
 
@@ -203,11 +203,11 @@ static void do_ls(struct xs_handle *h, char *path, int cur_depth, int show_perms
             if (max_width < (linewid + len + TAG_LEN)) {
                 printf(" = \"%.*s\\...\"",
                        (int)(max_width - TAG_LEN - linewid),
-		       sanitise_value(&ebuf, val, len));
+		       xs_sanitise_value(&ebuf, val, len));
             }
             else {
                 linewid += printf(" = \"%s\"",
-				  sanitise_value(&ebuf, val, len));
+				  xs_sanitise_value(&ebuf, val, len));
                 if (show_perms) {
                     putchar(' ');
                     for (linewid++;
@@ -346,7 +346,7 @@ perform(enum mode mode, int optind, int argc, char **argv, struct xs_handle *xsh
             if (raw)
                 output_raw(val, len);
             else
-                output("%s\n", sanitise_value(&ebuf, val, len));
+                output("%s\n", xs_sanitise_value(&ebuf, val, len));
             free(val);
             optind++;
             break;
@@ -359,8 +359,8 @@ perform(enum mode mode, int optind, int argc, char **argv, struct xs_handle *xsh
                 val = val_spec;
                 len = strlen(val_spec);
             } else {
-                expanding_buffer_ensure(&ebuf, strlen(val_spec)+1);
-                unsanitise_value(ebuf.buf, &len, val_spec);
+                xs_expanding_buffer_ensure(&ebuf, strlen(val_spec)+1);
+                xs_unsanitise_value(ebuf.buf, &len, val_spec);
                 val = ebuf.buf;
             }
             if (!xs_write(xsh, xth, argv[optind], val, len)) {
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 8033c1e0eb..244220c5a3 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
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
+	unsigned int mask = XS_PERM_READ | XS_PERM_WRITE | XS_PERM_OWNER;
 
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
 
@@ -619,9 +619,9 @@ static int ask_parents(struct connection *conn, const void *ctx,
  */
 static int errno_from_parents(struct connection *conn, const void *ctx,
 			      const char *node, int errnum,
-			      enum xs_perm_type perm)
+			      unsigned int perm)
 {
-	enum xs_perm_type parent_perm = XS_PERM_NONE;
+	unsigned int parent_perm = XS_PERM_NONE;
 
 	/* We always tell them about memory failures. */
 	if (errnum == ENOMEM)
@@ -641,7 +641,7 @@ static int errno_from_parents(struct connection *conn, const void *ctx,
 static struct node *get_node(struct connection *conn,
 			     const void *ctx,
 			     const char *name,
-			     enum xs_perm_type perm)
+			     unsigned int perm)
 {
 	struct node *node;
 
@@ -873,7 +873,7 @@ static struct node *get_node_canonicalized(struct connection *conn,
 					   const void *ctx,
 					   const char *name,
 					   char **canonical_name,
-					   enum xs_perm_type perm)
+					   unsigned int perm)
 {
 	char *tmp_name;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 0c9a0961b5..0b2f88dd4a 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -186,8 +186,8 @@ void send_ack(struct connection *conn, enum xsd_sockmsg_type type);
 char *canonicalize(struct connection *conn, const void *ctx, const char *node);
 
 /* Get access permissions. */
-enum xs_perm_type perm_for_conn(struct connection *conn,
-				const struct node_perms *perms);
+unsigned int perm_for_conn(struct connection *conn,
+			   const struct node_perms *perms);
 
 /* Write a node to the tdb data base. */
 int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
@@ -201,8 +201,8 @@ struct connection *new_connection(connwritefn_t *write, connreadfn_t *read);
 struct connection *get_connection_by_id(unsigned int conn_id);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
-enum xs_perm_type perm_for_conn(struct connection *conn,
-				const struct node_perms *perms);
+unsigned int perm_for_conn(struct connection *conn,
+			   const struct node_perms *perms);
 
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


