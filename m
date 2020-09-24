Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028552771DF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 15:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLR1E-0004Uv-Gb; Thu, 24 Sep 2020 13:10:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zFsw=DB=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kLR1D-0004Um-6K
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 13:10:39 +0000
X-Inumbo-ID: 6e1c6f9c-bf0a-427c-a4a9-debd22608f28
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e1c6f9c-bf0a-427c-a4a9-debd22608f28;
 Thu, 24 Sep 2020 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=QR724F3db4Ob9IKxdxpQejdkQ7yWd69fX4xFchX0Dps=; b=1FZ5pioH5Ym5gXT8PKaotvJaTp
 Q1UGZhnESOazgAjLZZLGfgWwDsF38IbAiAqs+ua+YGSYZK0xMHYrQTkxMvbBYyUN+o1Id/9dUCnu4
 SOsPX5wCiVq7qlm2bux7WwE7Ee3AQWYlEqn9IT+qLJdOaXiz0OaMnqDDYdjpvI+KiM90=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kLR1B-0006fc-JA; Thu, 24 Sep 2020 13:10:37 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kLR1B-0002DB-Am; Thu, 24 Sep 2020 13:10:37 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v9 3/8] tools/misc: add xen-domctx to present domain context
Date: Thu, 24 Sep 2020 14:10:25 +0100
Message-Id: <20200924131030.1876-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200924131030.1876-1-paul@xen.org>
References: <20200924131030.1876-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This tool is analogous to 'xen-hvmctx' which presents HVM context.
Subsequent patches will add 'dump' functions when new records are
introduced.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>

NOTE: Ian requested ack from Andrew

v3:
 - Re-worked to avoid copying onto stack
 - Added optional typecode and instance arguments

v2:
 - Change name from 'xen-ctx' to 'xen-domctx'
---
 .gitignore              |   1 +
 tools/misc/Makefile     |   4 +
 tools/misc/xen-domctx.c | 200 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 205 insertions(+)
 create mode 100644 tools/misc/xen-domctx.c

diff --git a/.gitignore b/.gitignore
index 5e8c47e2db..efbbd46fa9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -233,6 +233,7 @@ tools/misc/xen_cpuperf
 tools/misc/xen-cpuid
 tools/misc/xen-detect
 tools/misc/xen-diag
+tools/misc/xen-domctx
 tools/misc/xen-tmem-list-parse
 tools/misc/xen-livepatch
 tools/misc/xenperf
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 7d37f297a9..fb673d0ff6 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -32,6 +32,7 @@ INSTALL_SBIN                   += xenpm
 INSTALL_SBIN                   += xenwatchdogd
 INSTALL_SBIN                   += xen-livepatch
 INSTALL_SBIN                   += xen-diag
+INSTALL_SBIN                   += xen-domctx
 INSTALL_SBIN += $(INSTALL_SBIN-y)
 
 # Everything to be installed in a private bin/
@@ -111,6 +112,9 @@ xen-livepatch: xen-livepatch.o
 xen-diag: xen-diag.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xen-domctx: xen-domctx.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+
 xen-lowmemd: xen-lowmemd.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
new file mode 100644
index 0000000000..243325dfce
--- /dev/null
+++ b/tools/misc/xen-domctx.c
@@ -0,0 +1,200 @@
+/*
+ * xen-domctx.c
+ *
+ * Print out domain save records in a human-readable way.
+ *
+ * Copyright Amazon.com Inc. or its affiliates.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <inttypes.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+
+#include <xenctrl.h>
+#include <xen/xen.h>
+#include <xen/domctl.h>
+#include <xen/save.h>
+
+static void *buf = NULL;
+static size_t len, off;
+
+#define GET_PTR(_x)                                                        \
+    do {                                                                   \
+        if ( len - off < sizeof(*(_x)) )                                   \
+        {                                                                  \
+            fprintf(stderr,                                                \
+                    "error: need another %lu bytes, only %lu available\n", \
+                    sizeof(*(_x)), len - off);                             \
+            exit(1);                                                       \
+        }                                                                  \
+        (_x) = buf + off;                                                  \
+    } while (false);
+
+static void dump_header(void)
+{
+    DOMAIN_SAVE_TYPE(HEADER) *h;
+
+    GET_PTR(h);
+
+    printf("    HEADER: magic %#x, version %u\n",
+           h->magic, h->version);
+
+}
+
+static void dump_end(void)
+{
+    DOMAIN_SAVE_TYPE(END) *e;
+
+    GET_PTR(e);
+
+    printf("    END\n");
+}
+
+static void usage(const char *prog)
+{
+    fprintf(stderr, "usage: %s <domid> [ <typecode> [ <instance> ]]\n",
+            prog);
+    exit(1);
+}
+
+int main(int argc, char **argv)
+{
+    char *s, *e;
+    long domid;
+    long typecode = -1;
+    long instance = -1;
+    unsigned int entry;
+    xc_interface *xch;
+    int rc;
+
+    if ( argc < 2 || argc > 4 )
+        usage(argv[0]);
+
+    s = e = argv[1];
+    domid = strtol(s, &e, 0);
+
+    if ( *s == '\0' || *e != '\0' ||
+         domid < 0 || domid >= DOMID_FIRST_RESERVED )
+    {
+        fprintf(stderr, "invalid domid '%s'\n", s);
+        exit(1);
+    }
+
+    if ( argc >= 3 )
+    {
+        s = e = argv[2];
+        typecode = strtol(s, &e, 0);
+
+        if ( *s == '\0' || *e != '\0' )
+        {
+            fprintf(stderr, "invalid typecode '%s'\n", s);
+            exit(1);
+        }
+    }
+
+    if ( argc == 4 )
+    {
+        s = e = argv[3];
+        instance = strtol(s, &e, 0);
+
+        if ( *s == '\0' || *e != '\0' )
+        {
+            fprintf(stderr, "invalid instance '%s'\n", s);
+            exit(1);
+        }
+    }
+
+    xch = xc_interface_open(0, 0, 0);
+    if ( !xch )
+    {
+        fprintf(stderr, "error: can't open libxc handle\n");
+        exit(1);
+    }
+
+    rc = xc_domain_getcontext(xch, domid, NULL, &len);
+    if ( rc < 0 )
+    {
+        fprintf(stderr, "error: can't get record length for dom %lu: %s\n",
+                domid, strerror(errno));
+        exit(1);
+    }
+
+    buf = malloc(len);
+    if ( !buf )
+    {
+        fprintf(stderr, "error: can't allocate %lu bytes\n", len);
+        exit(1);
+    }
+
+    rc = xc_domain_getcontext(xch, domid, buf, &len);
+    if ( rc < 0 )
+    {
+        fprintf(stderr, "error: can't get domain record for dom %lu: %s\n",
+                domid, strerror(errno));
+        exit(1);
+    }
+    off = 0;
+
+    entry = 0;
+    for ( ; ; )
+    {
+        struct domain_save_descriptor *desc;
+
+        GET_PTR(desc);
+
+        off += sizeof(*desc);
+
+        if ( (typecode < 0 || typecode == desc->typecode) &&
+             (instance < 0 || instance == desc->instance) )
+        {
+            printf("[%u] type: %u instance: %u length: %u\n", entry++,
+                   desc->typecode, desc->instance, desc->length);
+
+            switch (desc->typecode)
+            {
+            case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
+            case DOMAIN_SAVE_CODE(END): dump_end(); break;
+            default:
+                printf("Unknown type %u: skipping\n", desc->typecode);
+                break;
+            }
+        }
+
+        if ( desc->typecode == DOMAIN_SAVE_CODE(END) )
+            break;
+
+        off += desc->length;
+    }
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.20.1


