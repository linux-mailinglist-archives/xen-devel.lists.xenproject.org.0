Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D32D30B37D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 00:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80197.146594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibs-0007yC-84; Mon, 01 Feb 2021 23:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80197.146594; Mon, 01 Feb 2021 23:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibr-0007wh-UK; Mon, 01 Feb 2021 23:27:55 +0000
Received: by outflank-mailman (input) for mailman id 80197;
 Mon, 01 Feb 2021 23:27:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6ibp-0007PB-Sp
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 23:27:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c308b7bc-9a82-4428-9e41-2107868277a2;
 Mon, 01 Feb 2021 23:27:36 +0000 (UTC)
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
X-Inumbo-ID: c308b7bc-9a82-4428-9e41-2107868277a2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612222056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=njVGh0BG2zEjGyol+qwxOLZnJzEyLf5QMa4qeRMwOaI=;
  b=J3Zc47eOJRMQTCgV3iIkux1S4SyWV86QbIvq6euaYaN+crmQntJDYHpX
   IdB/qGgIAwLdCJaI/CIftkJrnCFVyz5v8Sa9IBljosnh45OlnhgkLBv4L
   L7y7ZheU0QOpS57/ou9Yrus8yigPi480YvNh0wlp33mAcxQ207jxYBvkH
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SgNfmBguvZHKQHBqSDQjqZXWEQLQaZg26ryWUzmAlwkA4p7i4zv+Ivvf4NSSC0BQ//Zp0QQfZG
 Et15UDHnHhEAjHmzK+4iAVTf+hbKTX4EFhA+h84fmFgcL+N4FySXpL37FYol1YUzbsrJsfDBnl
 TlKbVVWjZr6s9gp0PYWL3Mwz4j1OrI6pLxc0bYFv/FqGtKyLpLq3iKnSsICVbBh59iYysXCRZv
 0tjVSppl+zZGA6hBdZo1kh7BYFKhzYmCHdOk8ho5VWD3s14FxzwPPPosztVuLDpXWqmW2DdplT
 yO0=
X-SBRS: 5.1
X-MesageID: 36319807
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36319807"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v9 08/11] tools/misc: Add xen-vmtrace tool
Date: Mon, 1 Feb 2021 23:27:00 +0000
Message-ID: <20210201232703.29275-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210201232703.29275-1-andrew.cooper3@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

Add an demonstration tool that uses xc_vmtrace_* calls in order
to manage external IPT monitoring for DomU.

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Ian Jackson <iwj@xenproject.org>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v9:
 * Fix truncated data on clean exit

v8:
 * Switch to being a build-only target
---
 tools/misc/.gitignore    |   1 +
 tools/misc/Makefile      |   7 ++
 tools/misc/xen-vmtrace.c | 166 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 tools/misc/xen-vmtrace.c

diff --git a/tools/misc/.gitignore b/tools/misc/.gitignore
index b2c3b21f57..ce6f937d0c 100644
--- a/tools/misc/.gitignore
+++ b/tools/misc/.gitignore
@@ -1,3 +1,4 @@
 xen-access
 xen-memshare
 xen-ucode
+xen-vmtrace
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 912c5d4f0e..2b683819d4 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -50,6 +50,10 @@ TARGETS_COPY += xenpvnetboot
 # Everything which needs to be built
 TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
 
+# ... including build-only targets
+TARGETS_BUILD-$(CONFIG_X86)    += xen-vmtrace
+TARGETS_BUILD += $(TARGETS_BUILD-y)
+
 .PHONY: all build
 all build: $(TARGETS_BUILD)
 
@@ -90,6 +94,9 @@ xen-hvmcrash: xen-hvmcrash.o
 xen-memshare: xen-memshare.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xen-vmtrace: xen-vmtrace.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
+
 xenperf: xenperf.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
new file mode 100644
index 0000000000..cc58a0707b
--- /dev/null
+++ b/tools/misc/xen-vmtrace.c
@@ -0,0 +1,166 @@
+/******************************************************************************
+ * tools/vmtrace.c
+ *
+ * Demonstrative tool for collecting Intel Processor Trace data from Xen.
+ *  Could be used to externally monitor a given vCPU in given DomU.
+ *
+ * Copyright (C) 2020 by CERT Polska - NASK PIB
+ *
+ * Authors: Michał Leszczyński, michal.leszczynski@cert.pl
+ * Date:    June, 2020
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; under version 2 of the License.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <err.h>
+#include <errno.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+
+#include <xenctrl.h>
+#include <xenforeignmemory.h>
+
+#define MSR_RTIT_CTL                        0x00000570
+#define  RTIT_CTL_OS                        (1 <<  2)
+#define  RTIT_CTL_USR                       (1 <<  3)
+#define  RTIT_CTL_BRANCH_EN                 (1 << 13)
+
+static xc_interface *xch;
+static xenforeignmemory_handle *fh;
+static uint32_t domid, vcpu;
+static size_t size;
+static char *buf;
+
+static sig_atomic_t interrupted = 0;
+static void int_handler(int signum)
+{
+    interrupted = 1;
+}
+
+static int get_more_data(void)
+{
+    static uint64_t last_pos;
+    uint64_t pos;
+
+    if ( xc_vmtrace_output_position(xch, domid, vcpu, &pos) )
+    {
+        perror("xc_vmtrace_output_position()");
+        return -1;
+    }
+
+    if ( pos > last_pos )
+        fwrite(buf + last_pos, pos - last_pos, 1, stdout);
+    else if ( pos < last_pos )
+    {
+        /* buffer wrapped */
+        fwrite(buf + last_pos, size - last_pos, 1, stdout);
+        fwrite(buf, pos, 1, stdout);
+    }
+
+    last_pos = pos;
+    return 0;
+}
+
+int main(int argc, char **argv)
+{
+    int rc, exit = 1;
+    xenforeignmemory_resource_handle *fres = NULL;
+
+    if ( signal(SIGINT, int_handler) == SIG_ERR )
+        err(1, "Failed to register signal handler\n");
+
+    if ( argc != 3 )
+    {
+        fprintf(stderr, "Usage: %s <domid> <vcpu_id>\n", argv[0]);
+        fprintf(stderr, "It's recommended to redirect thisprogram's output to file\n");
+        fprintf(stderr, "or to pipe it's output to xxd or other program.\n");
+        return 1;
+    }
+
+    domid = atoi(argv[1]);
+    vcpu  = atoi(argv[2]);
+
+    xch = xc_interface_open(NULL, NULL, 0);
+    fh = xenforeignmemory_open(NULL, 0);
+
+    if ( !xch )
+        err(1, "xc_interface_open()");
+    if ( !fh )
+        err(1, "xenforeignmemory_open()");
+
+    rc = xenforeignmemory_resource_size(
+        fh, domid, XENMEM_resource_vmtrace_buf, vcpu, &size);
+    if ( rc )
+        err(1, "xenforeignmemory_resource_size()");
+
+    fres = xenforeignmemory_map_resource(
+        fh, domid, XENMEM_resource_vmtrace_buf, vcpu,
+        0, size >> XC_PAGE_SHIFT, (void **)&buf, PROT_READ, 0);
+    if ( !fres )
+        err(1, "xenforeignmemory_map_resource()");
+
+    if ( xc_vmtrace_set_option(
+             xch, domid, vcpu, MSR_RTIT_CTL,
+             RTIT_CTL_BRANCH_EN | RTIT_CTL_USR | RTIT_CTL_OS) )
+    {
+        perror("xc_vmtrace_set_option()");
+        goto out;
+    }
+
+    if ( xc_vmtrace_enable(xch, domid, vcpu) )
+    {
+        perror("xc_vmtrace_enable()");
+        goto out;
+    }
+
+    while ( !interrupted )
+    {
+        xc_dominfo_t dominfo;
+
+        if ( get_more_data() )
+            goto out;
+
+        usleep(1000 * 100);
+
+        if ( xc_domain_getinfo(xch, domid, 1, &dominfo) != 1 ||
+             dominfo.domid != domid || dominfo.shutdown )
+        {
+            if ( get_more_data() )
+                goto out;
+            break;
+        }
+    }
+
+    exit = 0;
+
+ out:
+    if ( xc_vmtrace_disable(xch, domid, vcpu) )
+        perror("xc_vmtrace_disable()");
+
+    if ( fres && xenforeignmemory_unmap_resource(fh, fres) )
+        perror("xenforeignmemory_unmap_resource()");
+
+    return exit;
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
2.11.0


