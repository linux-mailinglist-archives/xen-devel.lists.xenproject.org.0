Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20B473FBFD
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 14:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556119.868380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7nf-0000xu-Vr; Tue, 27 Jun 2023 12:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556119.868380; Tue, 27 Jun 2023 12:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7nf-0000vZ-T4; Tue, 27 Jun 2023 12:28:03 +0000
Received: by outflank-mailman (input) for mailman id 556119;
 Tue, 27 Jun 2023 12:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EZfr=CP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qE7ne-0000v0-AG
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 12:28:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d0004b8-14e6-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 14:27:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B1BF821887;
 Tue, 27 Jun 2023 12:27:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74F0E13462;
 Tue, 27 Jun 2023 12:27:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id s4b7Gs7VmmQ0SAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Jun 2023 12:27:58 +0000
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
X-Inumbo-ID: 0d0004b8-14e6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687868878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8JQBKjxhniaE/zxcvmS+z9dFa/XBunKMQ4z3sK0ltY=;
	b=dI6hkgyC+J6T/bu9T6u67G7T5QDTGGnb3FQ8f3ZJh1b3yuEBFux4rXRAaLOn3Az3GLprPj
	5GhV7mYYhD1LHlQDy+MBCxVv01no491R8uPmmzK3N2L0EBLECVp+HbYk3HrvjOSQC3V3Ys
	nxOye7hzlyFycf93taGbHdq869eDO6Y=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 1/5] tools/xenstore: remove no longer needed functions from xs_lib.c
Date: Tue, 27 Jun 2023 14:27:46 +0200
Message-Id: <20230627122750.2007-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230627122750.2007-1-jgross@suse.com>
References: <20230627122750.2007-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xs_daemon_tdb() in xs_lib.c is no longer used at all, so it can be
removed. xs_domain_dev() and xs_write_all() are not used by xenstored,
so they can be moved to tools/libs/store/xs.c.

xs_daemon_rootdir() is used by xenstored only and it only calls
xs_daemon_rundir(), so replace its use cases with xs_daemon_rundir()
and remove it from xs_lib.c.

xs_daemon_socket_ro() is needed in libxenstore only, so move it to
tools/libs/store/xs.c.

Move functions used by xenstore-client only to xenstore_client.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V2:
- move xs_write_all(), too
V3:
- remove xs_daemon_rootdir(), move xs_daemon_socket_ro()
---
 tools/include/xenstore.h           |   3 +
 tools/include/xenstore_lib.h       |   3 -
 tools/libs/store/xs.c              |  43 ++++++++
 tools/xenstore/xenstore_client.c   | 129 ++++++++++++++++++++++
 tools/xenstore/xenstored_control.c |   4 +-
 tools/xenstore/xenstored_core.c    |   3 +-
 tools/xenstore/xs_lib.c            | 166 -----------------------------
 tools/xenstore/xs_lib.h            |  19 ----
 8 files changed, 178 insertions(+), 192 deletions(-)

diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
index 2b3f69fb61..a442252849 100644
--- a/tools/include/xenstore.h
+++ b/tools/include/xenstore.h
@@ -113,6 +113,9 @@ void *xs_read(struct xs_handle *h, xs_transaction_t t,
 bool xs_write(struct xs_handle *h, xs_transaction_t t,
 	      const char *path, const void *data, unsigned int len);
 
+/* Simple write function: loops for you. */
+bool xs_write_all(int fd, const void *data, unsigned int len);
+
 /* Create a new directory.
  * Returns false on failure, or success if it already exists.
  */
diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib.h
index 2266009ec1..43eec87379 100644
--- a/tools/include/xenstore_lib.h
+++ b/tools/include/xenstore_lib.h
@@ -47,9 +47,6 @@ const char *xs_daemon_rundir(void);
 const char *xs_daemon_socket(void);
 const char *xs_daemon_socket_ro(void);
 
-/* Simple write function: loops for you. */
-bool xs_write_all(int fd, const void *data, unsigned int len);
-
 /* Convert strings to permissions.  False if a problem. */
 bool xs_strings_to_perms(struct xs_permissions *perms, unsigned int num,
 			 const char *strings);
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 76ffb1be45..bb93246bfb 100644
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
@@ -431,6 +451,24 @@ out_false:
 #ifdef XSTEST
 #define read_all read_all_choice
 #define xs_write_all write_all_choice
+#else
+/* Simple routine for writing to sockets, etc. */
+bool xs_write_all(int fd, const void *data, unsigned int len)
+{
+	while (len) {
+		int done;
+
+		done = write(fd, data, len);
+		if (done < 0 && errno == EINTR)
+			continue;
+		if (done <= 0)
+			return false;
+		data += done;
+		len -= done;
+	}
+
+	return true;
+}
 #endif
 
 static int get_error(const char *errorstring)
@@ -1328,6 +1366,11 @@ error:
 	return ret;
 }
 
+const char *xs_daemon_socket_ro(void)
+{
+	return xs_daemon_socket();
+}
+
 #ifdef USE_PTHREAD
 static void *read_thread(void *arg)
 {
diff --git a/tools/xenstore/xenstore_client.c b/tools/xenstore/xenstore_client.c
index de788b3e0a..27fda81401 100644
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
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index ed80924ee4..6ef800ff64 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -560,7 +560,7 @@ static FILE *lu_dump_open(const void *ctx)
 	char *filename;
 	int fd;
 
-	filename = talloc_asprintf(ctx, "%s/state_dump", xs_daemon_rootdir());
+	filename = talloc_asprintf(ctx, "%s/state_dump", xs_daemon_rundir());
 	if (!filename)
 		return NULL;
 
@@ -583,7 +583,7 @@ static void lu_get_dump_state(struct lu_dump_state *state)
 	state->size = 0;
 
 	state->filename = talloc_asprintf(NULL, "%s/state_dump",
-					  xs_daemon_rootdir());
+					  xs_daemon_rundir());
 	if (!state->filename)
 		barf("Allocation failure");
 
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 07fbac55ac..a78cbf1116 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2888,10 +2888,9 @@ int main(int argc, char *argv[])
 
 	reopen_log();
 
-	/* make sure xenstored directories exist */
+	/* Make sure xenstored directory exists. */
 	/* Errors ignored here, will be reported when we open files */
 	mkdir(xs_daemon_rundir(), 0755);
-	mkdir(xs_daemon_rootdir(), 0755);
 
 	if (dofork) {
 		openlog("xenstored", 0, LOG_DAEMON);
diff --git a/tools/xenstore/xs_lib.c b/tools/xenstore/xs_lib.c
index b9941c567c..826fa7b5a8 100644
--- a/tools/xenstore/xs_lib.c
+++ b/tools/xenstore/xs_lib.c
@@ -32,11 +32,6 @@ const char *xs_daemon_rundir(void)
 	return (s ? s : XEN_RUN_STORED);
 }
 
-const char *xs_daemon_rootdir(void)
-{
-	return xs_daemon_rundir();
-}
-
 static const char *xs_daemon_path(void)
 {
 	static char buf[PATH_MAX];
@@ -49,61 +44,11 @@ static const char *xs_daemon_path(void)
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
 }
 
-const char *xs_daemon_socket_ro(void)
-{
-	return xs_daemon_path();
-}
-
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
-/* Simple routines for writing to sockets, etc. */
-bool xs_write_all(int fd, const void *data, unsigned int len)
-{
-	while (len) {
-		int done;
-
-		done = write(fd, data, len);
-		if (done < 0 && errno == EINTR)
-			continue;
-		if (done <= 0)
-			return false;
-		data += done;
-		len -= done;
-	}
-
-	return true;
-}
-
 /* Convert strings to permissions.  False if a problem. */
 bool xs_strings_to_perms(struct xs_permissions *perms, unsigned int num,
 			 const char *strings)
@@ -179,114 +124,3 @@ unsigned int xs_count_strings(const char *strings, unsigned int len)
 
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
index efa05997d6..5b9874d741 100644
--- a/tools/xenstore/xs_lib.h
+++ b/tools/xenstore/xs_lib.h
@@ -21,10 +21,6 @@
 
 #include "xenstore_lib.h"
 
-const char *xs_daemon_rootdir(void);
-const char *xs_domain_dev(void);
-const char *xs_daemon_tdb(void);
-
 /* Convert permissions to a string (up to len MAX_STRLEN(unsigned int)+1). */
 bool xs_perm_to_string(const struct xs_permissions *perm,
 		       char *buffer, size_t buf_len);
@@ -32,19 +28,4 @@ bool xs_perm_to_string(const struct xs_permissions *perm,
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


