Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03D1614F21
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435128.688243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opu4m-0000dp-Fo; Tue, 01 Nov 2022 16:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435128.688243; Tue, 01 Nov 2022 16:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opu4m-0000bM-Bi; Tue, 01 Nov 2022 16:25:20 +0000
Received: by outflank-mailman (input) for mailman id 435128;
 Tue, 01 Nov 2022 16:25:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optvg-0000i5-TD
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:15:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c72637-5a00-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:15:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC6F21F90F;
 Tue,  1 Nov 2022 16:15:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79BBE1346F;
 Tue,  1 Nov 2022 16:15:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E81QHDtGYWOadwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:15:55 +0000
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
X-Inumbo-ID: 76c72637-5a00-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667319355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwUivDjaxbqaMaYd71PIDNVF/acd+ugyV6m7DW6bCCE=;
	b=LAfcGAD/f0G8jxFhOEnhq4NYiVUAVpLGaAo4xbrzDiB6caXDy1oqhMF8Dd6AU9uQG/oyzg
	bd/eGb3CVLzK7U/EmluFNP2j+3Vb1QHsTdZjLbMVGDWhfgwMLxbRKbSr7Sc+Vv+qM6SlCe
	zRgCuu6ioPH3VVqioqaAQm2PByqHRSs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 10/10] tools/xenstore: remove no longer needed functions from xs_lib.c
Date: Tue,  1 Nov 2022 17:14:57 +0100
Message-Id: <20221101161457.8470-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101161457.8470-1-jgross@suse.com>
References: <20221101161457.8470-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xs_daemon_tdb() in xs_lib.c is no longer used at all, so it can be
removed. xs_domain_dev() is not used by xenstored, so it can be moved
to tools/libs/store/xs.c.

Move functions used by xenstore-client only to xenstore_client.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/xs.c            |  20 +++++
 tools/xenstore/xenstore_client.c | 129 +++++++++++++++++++++++++++++
 tools/xenstore/xs_lib.c          | 138 -------------------------------
 tools/xenstore/xs_lib.h          |  17 ----
 4 files changed, 149 insertions(+), 155 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 7a9a8b1656..70e64fccb8 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -311,6 +311,26 @@ struct xs_handle *xs_domain_open(void)
 	return xs_open(0);
 }
 
+static const char *xs_domain_dev(void)
+{
+	char *s = getenv("XENSTORED_PATH");
+	if (s)
+		return s;
+#if defined(__RUMPUSER_XEN__) || defined(__RUMPRUN__)
+	return "/dev/xen/xenbus";
+#elif defined(__linux__)
+	if (access("/dev/xen/xenbus", F_OK) == 0)
+		return "/dev/xen/xenbus";
+	return "/proc/xen/xenbus";
+#elif defined(__NetBSD__)
+	return "/kern/xen/xenbus";
+#elif defined(__FreeBSD__)
+	return "/dev/xen/xenstore";
+#else
+	return "/dev/xen/xenbus";
+#endif
+}
+
 struct xs_handle *xs_open(unsigned long flags)
 {
 	struct xs_handle *xsh = NULL;
diff --git a/tools/xenstore/xenstore_client.c b/tools/xenstore/xenstore_client.c
index 0628ba275e..8ff8abf12a 100644
--- a/tools/xenstore/xenstore_client.c
+++ b/tools/xenstore/xenstore_client.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <assert.h>
 #include <err.h>
 #include <errno.h>
 #include <fcntl.h>
@@ -40,12 +41,140 @@ enum mode {
     MODE_watch,
 };
 
+/* Sanitising (quoting) possibly-binary strings. */
+struct expanding_buffer {
+    char *buf;
+    int avail;
+};
+
 static char *output_buf = NULL;
 static int output_pos = 0;
 static struct expanding_buffer ebuf;
 
 static int output_size = 0;
 
+/* Ensure that given expanding buffer has at least min_avail characters. */
+static char *expanding_buffer_ensure(struct expanding_buffer *ebuf,
+                                     int min_avail)
+{
+    int want;
+    char *got;
+
+    if ( ebuf->avail >= min_avail )
+        return ebuf->buf;
+
+    if ( min_avail >= INT_MAX/3 )
+        return 0;
+
+    want = ebuf->avail + min_avail + 10;
+    got = realloc(ebuf->buf, want);
+    if ( !got )
+        return 0;
+
+    ebuf->buf = got;
+    ebuf->avail = want;
+    return ebuf->buf;
+}
+
+/* sanitise_value() may return NULL if malloc fails. */
+static char *sanitise_value(struct expanding_buffer *ebuf,
+                            const char *val, unsigned len)
+{
+    int used, remain, c;
+    unsigned char *ip;
+
+#define ADD(c) (ebuf->buf[used++] = (c))
+#define ADDF(f,c) (used += sprintf(ebuf->buf+used, (f), (c)))
+
+    assert(len < INT_MAX/5);
+
+    ip = (unsigned char *)val;
+    used = 0;
+    remain = len;
+
+    if ( !expanding_buffer_ensure(ebuf, remain + 1) )
+        return NULL;
+
+    while ( remain-- > 0 )
+    {
+        c= *ip++;
+
+        if ( c >= ' ' && c <= '~' && c != '\\' )
+        {
+            ADD(c);
+            continue;
+        }
+
+        if ( !expanding_buffer_ensure(ebuf, used + remain + 5) )
+            /* for "<used>\\nnn<remain>\0" */
+            return 0;
+
+        ADD('\\');
+        switch (c)
+        {
+        case '\t':  ADD('t');   break;
+        case '\n':  ADD('n');   break;
+        case '\r':  ADD('r');   break;
+        case '\\':  ADD('\\');  break;
+        default:
+            if ( c < 010 ) ADDF("%03o", c);
+            else           ADDF("x%02x", c);
+        }
+    }
+
+    ADD(0);
+    assert(used <= ebuf->avail);
+    return ebuf->buf;
+
+#undef ADD
+#undef ADDF
+}
+
+/* *out_len_r on entry is ignored; out must be at least strlen(in)+1 bytes. */
+static void unsanitise_value(char *out, unsigned *out_len_r, const char *in)
+{
+    const char *ip;
+    char *op;
+    unsigned c;
+    int n;
+
+    for ( ip = in, op = out; (c = *ip++); *op++ = c )
+    {
+        if ( c == '\\' )
+        {
+            c = *ip++;
+
+#define GETF(f) do                   \
+{                                    \
+     n = 0;                          \
+     sscanf(ip, f "%n", &c, &n);     \
+     ip += n;                        \
+} while ( 0 )
+
+            switch ( c )
+            {
+            case 't':           c= '\t';           break;
+            case 'n':           c= '\n';           break;
+            case 'r':           c= '\r';           break;
+            case '\\':          c= '\\';           break;
+            case 'x':           GETF("%2x");       break;
+            case '0': case '4':
+            case '1': case '5':
+            case '2': case '6':
+            case '3': case '7': --ip; GETF("%3o"); break;
+            case 0:             --ip;              break;
+            default:;
+            }
+#undef GETF
+        }
+    }
+
+    *op = 0;
+
+    if ( out_len_r )
+        *out_len_r = op - out;
+}
+
 /* make sure there is at least 'len' more space in output_buf */
 static void expand_buffer(size_t len)
 {
diff --git a/tools/xenstore/xs_lib.c b/tools/xenstore/xs_lib.c
index b9941c567c..1cfa9236bd 100644
--- a/tools/xenstore/xs_lib.c
+++ b/tools/xenstore/xs_lib.c
@@ -49,13 +49,6 @@ static const char *xs_daemon_path(void)
 	return buf;
 }
 
-const char *xs_daemon_tdb(void)
-{
-	static char buf[PATH_MAX];
-	snprintf(buf, sizeof(buf), "%s/tdb", xs_daemon_rootdir());
-	return buf;
-}
-
 const char *xs_daemon_socket(void)
 {
 	return xs_daemon_path();
@@ -66,26 +59,6 @@ const char *xs_daemon_socket_ro(void)
 	return xs_daemon_path();
 }
 
-const char *xs_domain_dev(void)
-{
-	char *s = getenv("XENSTORED_PATH");
-	if (s)
-		return s;
-#if defined(__RUMPUSER_XEN__) || defined(__RUMPRUN__)
-	return "/dev/xen/xenbus";
-#elif defined(__linux__)
-	if (access("/dev/xen/xenbus", F_OK) == 0)
-		return "/dev/xen/xenbus";
-	return "/proc/xen/xenbus";
-#elif defined(__NetBSD__)
-	return "/kern/xen/xenbus";
-#elif defined(__FreeBSD__)
-	return "/dev/xen/xenstore";
-#else
-	return "/dev/xen/xenbus";
-#endif
-}
-
 /* Simple routines for writing to sockets, etc. */
 bool xs_write_all(int fd, const void *data, unsigned int len)
 {
@@ -179,114 +152,3 @@ unsigned int xs_count_strings(const char *strings, unsigned int len)
 
 	return num;
 }
-
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
-			case 't':		c= '\t';		break;
-			case 'n':		c= '\n';		break;
-			case 'r':		c= '\r';		break;
-			case '\\':		c= '\\';		break;
-			case 'x':		GETF("%2x");		break;
-			case '0': case '4':
-			case '1': case '5':
-			case '2': case '6':
-			case '3': case '7':	--ip; GETF("%3o");	break;
-			case 0:			--ip;			break;
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
diff --git a/tools/xenstore/xs_lib.h b/tools/xenstore/xs_lib.h
index efa05997d6..61229aa435 100644
--- a/tools/xenstore/xs_lib.h
+++ b/tools/xenstore/xs_lib.h
@@ -22,8 +22,6 @@
 #include "xenstore_lib.h"
 
 const char *xs_daemon_rootdir(void);
-const char *xs_domain_dev(void);
-const char *xs_daemon_tdb(void);
 
 /* Convert permissions to a string (up to len MAX_STRLEN(unsigned int)+1). */
 bool xs_perm_to_string(const struct xs_permissions *perm,
@@ -32,19 +30,4 @@ bool xs_perm_to_string(const struct xs_permissions *perm,
 /* Given a string and a length, count how many strings (nul terms). */
 unsigned int xs_count_strings(const char *strings, unsigned int len);
 
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
 #endif /* XS_LIB_H */
-- 
2.35.3


