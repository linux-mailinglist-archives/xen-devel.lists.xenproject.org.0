Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E05B2FF72C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72422.130389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUT-0004zI-O2; Thu, 21 Jan 2021 21:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72422.130389; Thu, 21 Jan 2021 21:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUT-0004yI-I1; Thu, 21 Jan 2021 21:27:41 +0000
Received: by outflank-mailman (input) for mailman id 72422;
 Thu, 21 Jan 2021 21:27:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hUR-0004xo-R4
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:27:39 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68ffbe82-822a-4ed2-b229-2a8cd48775d7;
 Thu, 21 Jan 2021 21:27:37 +0000 (UTC)
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
X-Inumbo-ID: 68ffbe82-822a-4ed2-b229-2a8cd48775d7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611264458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ygrxiTWMU6ddR5H5cC6oPFyoapiyUYkxKa2094fnWg=;
  b=JHW4RIdkR0rYCGVSmR6djyDRTenNFHhjjXUXB2pWaagkFpYKRodT8Tiv
   70edUAV9LOWPn6FjjjLyHy0ycdkJyZSca2tOZVU0AoVM8vkccfEZH6wwd
   nR/C/XdqScDP3dVBlaNSi0CW2xhJGTFErBMfziNUz6gIQuCuIluUVaa1C
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1zCq+VimT1/IZWu8Fuo2jqnyI7SzvSEKWY2v+4vSlECRUL9Avzfg+wf2W+IkI4gx+mLIml4569
 mtr2GgxyVpwZmXnuEN9pHUhPKe3YUDhC7i+mwX/sZg1EgaSqLmXNIs//EqoXdfANnlZ5c3kj7J
 EO6o4aiYhBSMdMShHluv/P5EkmcFT1G9E9C53VhaQYXICQJ0P5v6J0MFyqZkG+kKyljl4R3iGB
 wrpDziwzVe0NtmltI69mxgoXS6XNbVPk3ZFTt7UgAIF2UuRbavkLSQXK8sR4TtomlmkWKG5Rb2
 8Ds=
X-SBRS: 5.1
X-MesageID: 35651441
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="35651441"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v7 08/10] tools/misc: Add xen-vmtrace tool
Date: Thu, 21 Jan 2021 21:27:16 +0000
Message-ID: <20210121212718.2441-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210121212718.2441-1-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

Add an demonstration tool that uses xc_vmtrace_* calls in order
to manage external IPT monitoring for DomU.

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
 tools/misc/.gitignore    |   1 +
 tools/misc/Makefile      |   4 ++
 tools/misc/xen-vmtrace.c | 154 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 159 insertions(+)
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
index 912c5d4f0e..c5017e6c70 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -25,6 +25,7 @@ INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
 INSTALL_SBIN-$(CONFIG_X86)     += xen-memshare
 INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
 INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
+INSTALL_SBIN-$(CONFIG_X86)     += xen-vmtrace
 INSTALL_SBIN                   += xencov
 INSTALL_SBIN                   += xenhypfs
 INSTALL_SBIN                   += xenlockprof
@@ -90,6 +91,9 @@ xen-hvmcrash: xen-hvmcrash.o
 xen-memshare: xen-memshare.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xen-vmtrace: xen-vmtrace.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
+
 xenperf: xenperf.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
new file mode 100644
index 0000000000..47fea871cf
--- /dev/null
+++ b/tools/misc/xen-vmtrace.c
@@ -0,0 +1,154 @@
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
+static volatile int interrupted = 0;
+
+static xc_interface *xch;
+static xenforeignmemory_handle *fh;
+
+void int_handler(int signum)
+{
+    interrupted = 1;
+}
+
+int main(int argc, char **argv)
+{
+    uint32_t domid, vcpu;
+    int rc, exit = 1;
+    size_t size;
+    char *buf = NULL;
+    xenforeignmemory_resource_handle *fres = NULL;
+    uint64_t last_offset = 0;
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
+        uint64_t offset;
+
+        if ( xc_vmtrace_output_position(xch, domid, vcpu, &offset) )
+        {
+            perror("xc_vmtrace_output_position()");
+            goto out;
+        }
+
+        if ( offset > last_offset )
+            fwrite(buf + last_offset, offset - last_offset, 1, stdout);
+        else if ( offset < last_offset )
+        {
+            /* buffer wrapped */
+            fwrite(buf + last_offset, size - last_offset, 1, stdout);
+            fwrite(buf, offset, 1, stdout);
+        }
+
+        last_offset = offset;
+        usleep(1000 * 100);
+
+        if ( xc_domain_getinfo(xch, domid, 1, &dominfo) != 1 ||
+             dominfo.domid != domid || dominfo.shutdown )
+            break;
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


