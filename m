Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D3195DE9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 19:52:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHu3m-0007zz-0m; Fri, 27 Mar 2020 18:50:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiP0=5M=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jHu3k-0007yx-9l
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:50:24 +0000
X-Inumbo-ID: cebcf95e-705b-11ea-8a16-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cebcf95e-705b-11ea-8a16-12813bfff9fa;
 Fri, 27 Mar 2020 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gaej7huESA3uufYv2UCPxiLF2FbJiwCLGYTRpcZ6bD0=; b=bHjHZbkqZkzKiN2Lc5fRXj8hQL
 eF0RamGUkN0GEuYsgz9hsPwDUK8Fyq6aQO5iuL5IkCtCgHqDkehvBCoIlC0/n5/N09rvvkuMqyqDU
 7+nztf19nwTZRmbLOHJS4jYIKKQMq+K16ZhKkzTCIOVQ0/CfgHCJ4qnL9kw42VxNLb6U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3f-0008KU-V6; Fri, 27 Mar 2020 18:50:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3f-0007P4-MV; Fri, 27 Mar 2020 18:50:19 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:50:10 +0000
Message-Id: <20200327185012.1795-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327185012.1795-1-paul@xen.org>
References: <20200327185012.1795-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH 3/5] tools/misc: add xen-ctx to present domain
 context
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This tools is analogous to 'xen-hvmctx' which presents HVM context.
Subsequent patches will add 'dump' functions when new records are
introduced.

Signed-off-by: Paul Durrant <paul@xen.org>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
---
 .gitignore           |   1 +
 tools/misc/Makefile  |   4 ++
 tools/misc/xen-ctx.c | 144 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 tools/misc/xen-ctx.c

diff --git a/.gitignore b/.gitignore
index 4ca679ddbc..72b807141f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -206,6 +206,7 @@ tools/misc/cpuperf/cpuperf-xen
 tools/misc/xc_shadow
 tools/misc/xen_cpuperf
 tools/misc/xen-cpuid
+tools/misc/xen-ctx
 tools/misc/xen-detect
 tools/misc/xen-diag
 tools/misc/xen-tmem-list-parse
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 63947bfadc..6347bb24e9 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -30,6 +30,7 @@ INSTALL_SBIN                   += xenpm
 INSTALL_SBIN                   += xenwatchdogd
 INSTALL_SBIN                   += xen-livepatch
 INSTALL_SBIN                   += xen-diag
+INSTALL_SBIN                   += xen-ctx
 INSTALL_SBIN += $(INSTALL_SBIN-y)
 
 # Everything to be installed in a private bin/
@@ -108,6 +109,9 @@ xen-livepatch: xen-livepatch.o
 xen-diag: xen-diag.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xen-ctx: xen-ctx.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+
 xen-lowmemd: xen-lowmemd.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-ctx.c b/tools/misc/xen-ctx.c
new file mode 100644
index 0000000000..c31dd5d8e9
--- /dev/null
+++ b/tools/misc/xen-ctx.c
@@ -0,0 +1,144 @@
+/*
+ * xen-ctx.c
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
+#define READ(_x) do {                                                       \
+    if ( len - off < sizeof (_x) )                                          \
+    {                                                                       \
+        fprintf(stderr, "Error: need another %lu bytes, only %lu available",\
+                sizeof(_x), len - off);                                     \
+        exit(1);                                                            \
+    }                                                                       \
+    memcpy(&(_x), buf + off, sizeof (_x));                                  \
+    off += sizeof (_x);                                                     \
+} while (0)
+
+static void dump_header(void)
+{
+    DOMAIN_SAVE_TYPE(HEADER) h;
+    READ(h);
+    printf("    HEADER: magic %#x, version %u\n",
+           h.magic, h.version);
+}
+
+static void dump_end(void)
+{
+    DOMAIN_SAVE_TYPE(END) e;
+    READ(e);
+    printf("    END\n");
+}
+
+int main(int argc, char **argv)
+{
+    uint32_t domid;
+    unsigned int entry;
+    xc_interface *xch;
+    int rc;
+
+    if ( argc != 2 || !argv[1] || (rc = atoi(argv[1])) < 0 )
+    {
+        fprintf(stderr, "usage: %s <domid>\n", argv[0]);
+        exit(1);
+    }
+    domid = rc;
+
+    xch = xc_interface_open(0,0,0);
+    if ( !xch )
+    {
+        fprintf(stderr, "Error: can't open libxc handle\n");
+        exit(1);
+    }
+
+    rc = xc_domain_getcontext(xch, domid, 0, 0, 0);
+    if ( rc < 0 )
+    {
+        fprintf(stderr, "Error: can't get record length for dom %u: %s\n",
+                domid, strerror(errno));
+        exit(1);
+    }
+    len = rc;
+
+    buf = malloc(len);
+    if ( !buf )
+    {
+        fprintf(stderr, "Error: can't allocate %lu bytes\n", len);
+        exit(1);
+    }
+
+    rc = xc_domain_getcontext(xch, domid, 0, buf, len);
+    if ( rc < 0 )
+    {
+        fprintf(stderr, "Error: can't get domain record for dom %u: %s\n",
+                domid, strerror(errno));
+        exit(1);
+    }
+    len = rc;
+    off = 0;
+
+    printf("Domain save records for d%u\n", domid);
+
+    entry = 0;
+    for (;;) {
+        struct domain_save_descriptor desc;
+
+        READ(desc);
+        printf("[%u] type %u instance %u, length %u\n", entry++,
+               desc.typecode, desc.instance, desc.length);
+
+        switch (desc.typecode)
+        {
+        case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
+        case DOMAIN_SAVE_CODE(END): dump_end(); return 0;
+        default:
+            printf("Unknown type %u: skipping\n", desc.typecode);
+            off += desc.length;
+            break;
+        }
+    }
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


