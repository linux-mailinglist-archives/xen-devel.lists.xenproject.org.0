Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E2347765
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 12:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100925.192598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1ij-0000Ek-97; Wed, 24 Mar 2021 11:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100925.192598; Wed, 24 Mar 2021 11:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1ij-0000EK-5j; Wed, 24 Mar 2021 11:30:41 +0000
Received: by outflank-mailman (input) for mailman id 100925;
 Wed, 24 Mar 2021 11:30:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jyEQ=IW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lP1ii-0000EC-13
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:30:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36245714-d718-4300-90cd-011627dd5428;
 Wed, 24 Mar 2021 11:30:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCB7CAD38;
 Wed, 24 Mar 2021 11:30:37 +0000 (UTC)
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
X-Inumbo-ID: 36245714-d718-4300-90cd-011627dd5428
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616585437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VyTpib7WnXRWcI3JhV+PM28m0yWeZRL8EroC8XOiql8=;
	b=s+SYVuBxBksYzoz5pZ6JK0T4UFbS7Jx4Eb6hDB4CKFoEz4lKg9ntMt2yFgfj249l9Q1hFM
	fnz0VWQBkYQlzY3m2hEPAgBkWZoqphBswFcH71J97e5CqQIs0XObnKyqvCycne9eryiCSi
	sXOMwJ5YTtrXyQSr6bRBKzqjyaeNzRc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH-for-4.15 V2] tools/libs/store: tidy up libxenstore interface
Date: Wed, 24 Mar 2021 12:30:35 +0100
Message-Id: <20210324113035.32691-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xenstore_lib.h is in need to be tidied up a little bit:

- the definition of struct xs_tdb_record_hdr shouldn't be here
- some symbols are not namespaced correctly

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2: minimal variant (Ian Jackson)
---
 tools/include/xenstore_lib.h     | 17 ++++-------------
 tools/libs/store/libxenstore.map |  6 +++---
 tools/libs/store/xs.c            | 12 ++++++------
 tools/xenstore/utils.h           | 11 +++++++++++
 tools/xenstore/xenstore_client.c | 12 ++++++------
 5 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib.h
index 4c9b6d1685..f74ad7024b 100644
--- a/tools/include/xenstore_lib.h
+++ b/tools/include/xenstore_lib.h
@@ -43,15 +43,6 @@ struct xs_permissions
 	enum xs_perm_type perms;
 };
 
-/* Header of the node record in tdb. */
-struct xs_tdb_record_hdr {
-	uint64_t generation;
-	uint32_t num_perms;
-	uint32_t datalen;
-	uint32_t childlen;
-	struct xs_permissions perms[0];
-};
-
 /* Each 10 bits takes ~ 3 digits, plus one, plus one for nul terminator. */
 #define MAX_STRLEN(x) ((sizeof(x) * CHAR_BIT + CHAR_BIT-1) / 10 * 3 + 2)
 
@@ -78,18 +69,18 @@ bool xs_perm_to_string(const struct xs_permissions *perm,
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
-- 
2.26.2


