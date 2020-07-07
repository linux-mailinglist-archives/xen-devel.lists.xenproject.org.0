Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23881217810
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSi-0007nF-Hb; Tue, 07 Jul 2020 19:41:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSh-0007ml-5i
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:41:03 +0000
X-Inumbo-ID: c9c50350-c089-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9c50350-c089-11ea-bca7-bc764e2007e4;
 Tue, 07 Jul 2020 19:41:02 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 58FB1A26A3;
 Tue,  7 Jul 2020 21:41:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5684AA26BB;
 Tue,  7 Jul 2020 21:41:00 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cPr368eJ3i4J; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 83B62A26AD;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zXXw5sv7UBpl; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 63757A2675;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 531FB22467;
 Tue,  7 Jul 2020 21:40:05 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mD7MzktKtjP9; Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 412DD22459;
 Tue,  7 Jul 2020 21:39:54 +0200 (CEST)
X-Quarantine-ID: <z977rWsuvJ92>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id z977rWsuvJ92; Tue,  7 Jul 2020 21:39:54 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 10B2F22454;
 Tue,  7 Jul 2020 21:39:54 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 11/11] tools/proctrace: add proctrace tool
Date: Tue,  7 Jul 2020 21:39:50 +0200
Message-Id: <8bc5959478d6ba1c1873615b53628094da578688.1594150543.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: luwei.kang@intel.com, Michal Leszczynski <michal.leszczynski@cert.pl>,
 tamas.lengyel@intel.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Add an demonstration tool that uses xc_vmtrace_* calls in order
to manage external IPT monitoring for DomU.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 tools/proctrace/Makefile    |  45 +++++++++
 tools/proctrace/proctrace.c | 179 ++++++++++++++++++++++++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 tools/proctrace/Makefile
 create mode 100644 tools/proctrace/proctrace.c

diff --git a/tools/proctrace/Makefile b/tools/proctrace/Makefile
new file mode 100644
index 0000000000..9c135229b9
--- /dev/null
+++ b/tools/proctrace/Makefile
@@ -0,0 +1,45 @@
+# Copyright (C) CERT Polska - NASK PIB
+# Author: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; under version 2 of the License.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+
+XEN_ROOT=3D$(CURDIR)/../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+CFLAGS  +=3D -Werror
+CFLAGS  +=3D $(CFLAGS_libxenevtchn)
+CFLAGS  +=3D $(CFLAGS_libxenctrl)
+LDLIBS  +=3D $(LDLIBS_libxenctrl)
+LDLIBS  +=3D $(LDLIBS_libxenevtchn)
+LDLIBS  +=3D $(LDLIBS_libxenforeignmemory)
+
+.PHONY: all
+all: build
+
+.PHONY: build
+build: proctrace
+
+.PHONY: install
+install: build
+	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
+	$(INSTALL_PROG) proctrace $(DESTDIR)$(sbindir)/proctrace
+
+.PHONY: uninstall
+uninstall:
+	rm -f $(DESTDIR)$(sbindir)/proctrace
+
+.PHONY: clean
+clean:
+	$(RM) -f proctrace $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/proctrace/proctrace.c b/tools/proctrace/proctrace.c
new file mode 100644
index 0000000000..3c1ccccee8
--- /dev/null
+++ b/tools/proctrace/proctrace.c
@@ -0,0 +1,179 @@
+/***********************************************************************=
*******
+ * tools/proctrace.c
+ *
+ * Demonstrative tool for collecting Intel Processor Trace data from Xen=
.
+ *  Could be used to externally monitor a given vCPU in given DomU.
+ *
+ * Copyright (C) 2020 by CERT Polska - NASK PIB
+ *
+ * Authors: Micha=C5=82 Leszczy=C5=84ski, michal.leszczynski@cert.pl
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
+#include <stdlib.h>
+#include <stdio.h>
+#include <sys/mman.h>
+#include <signal.h>
+#include <errno.h>
+
+#include <xenctrl.h>
+#include <xen/xen.h>
+#include <xenforeignmemory.h>
+
+volatile int interrupted =3D 0;
+volatile int domain_down =3D 0;
+
+void term_handler(int signum) {
+    interrupted =3D 1;
+}
+
+int main(int argc, char* argv[]) {
+    xc_interface *xc;
+    uint32_t domid;
+    uint32_t vcpu_id;
+    uint64_t size;
+
+    int rc =3D -1;
+    uint8_t *buf =3D NULL;
+    uint64_t last_offset =3D 0;
+
+    xenforeignmemory_handle *fmem;
+    xenforeignmemory_resource_handle *fres;
+
+    if (signal(SIGINT, term_handler) =3D=3D SIG_ERR)
+    {
+        fprintf(stderr, "Failed to register signal handler\n");
+        return 1;
+    }
+
+    if (argc !=3D 3) {
+        fprintf(stderr, "Usage: %s <domid> <vcpu_id>\n", argv[0]);
+        fprintf(stderr, "It's recommended to redirect this"
+                        "program's output to file\n");
+        fprintf(stderr, "or to pipe it's output to xxd or other program.=
\n");
+        return 1;
+    }
+
+    domid =3D atoi(argv[1]);
+    vcpu_id =3D atoi(argv[2]);
+
+    xc =3D xc_interface_open(0, 0, 0);
+
+    fmem =3D xenforeignmemory_open(0, 0);
+
+    if (!xc) {
+        fprintf(stderr, "Failed to open xc interface\n");
+        return 1;
+    }
+
+    rc =3D xc_vmtrace_pt_enable(xc, domid, vcpu_id);
+
+    if (rc) {
+        fprintf(stderr, "Failed to call xc_vmtrace_pt_enable\n");
+        return 1;
+    }
+   =20
+    rc =3D xc_vmtrace_pt_get_offset(xc, domid, vcpu_id, NULL, &size);
+
+    if (rc) {
+        fprintf(stderr, "Failed to get trace buffer size\n");
+        return 1;
+    }
+
+    fres =3D xenforeignmemory_map_resource(
+        fmem, domid, XENMEM_resource_vmtrace_buf,
+        /* vcpu: */ vcpu_id,
+        /* frame: */ 0,
+        /* num_frames: */ size >> XC_PAGE_SHIFT,
+        (void **)&buf,
+        PROT_READ, 0);
+
+    if (!buf) {
+        fprintf(stderr, "Failed to map trace buffer\n");
+        return 1;
+    }
+
+    while (!interrupted) {
+        uint64_t offset;
+        rc =3D xc_vmtrace_pt_get_offset(xc, domid, vcpu_id, &offset, NUL=
L);
+
+        if (rc =3D=3D ENODATA) {
+            interrupted =3D 1;
+            domain_down =3D 1;
+	} else if (rc) {
+            fprintf(stderr, "Failed to call xc_vmtrace_pt_get_offset\n")=
;
+            return 1;
+        }
+
+        if (offset > last_offset)
+        {
+            fwrite(buf + last_offset, offset - last_offset, 1, stdout);
+        }
+        else if (offset < last_offset)
+        {
+            // buffer wrapped
+            fwrite(buf + last_offset, size - last_offset, 1, stdout);
+            fwrite(buf, offset, 1, stdout);
+        }
+
+        last_offset =3D offset;
+        usleep(1000 * 100);
+    }
+
+    rc =3D xenforeignmemory_unmap_resource(fmem, fres);
+
+    if (rc) {
+        fprintf(stderr, "Failed to unmap resource\n");
+        return 1;
+    }
+
+    rc =3D xenforeignmemory_close(fmem);
+
+    if (rc) {
+        fprintf(stderr, "Failed to close fmem\n");
+        return 1;
+    }
+
+    /*
+     * Don't try to disable PT if the domain is already dying.
+     */
+    if (!domain_down) {
+        rc =3D xc_vmtrace_pt_disable(xc, domid, vcpu_id);
+
+        if (rc) {
+            fprintf(stderr, "Failed to call xc_vmtrace_pt_disable\n");
+            return 1;
+        }
+    }
+
+    rc =3D xc_interface_close(xc);
+
+    if (rc) {
+        fprintf(stderr, "Failed to close xc interface\n");
+        return 1;
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
--=20
2.17.1


