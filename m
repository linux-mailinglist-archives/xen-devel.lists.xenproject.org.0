Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6397E214EBF
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 20:56:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js9oL-0005mX-GZ; Sun, 05 Jul 2020 18:56:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZHG=AQ=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1js9oK-0005m2-00
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 18:56:20 +0000
X-Inumbo-ID: 359cef92-bef1-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 359cef92-bef1-11ea-b7bb-bc764e2007e4;
 Sun, 05 Jul 2020 18:56:19 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2CEB8A20CD;
 Sun,  5 Jul 2020 20:56:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 02E85A20C3;
 Sun,  5 Jul 2020 20:56:16 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1I7hzOnL4bmA; Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D1F3EA209C;
 Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vSDx68SufYYS; Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1C8C7A2037;
 Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7365222C24;
 Sun,  5 Jul 2020 20:55:19 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2s-5pUYlNWXw; Sun,  5 Jul 2020 20:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id B371B22C22;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
X-Quarantine-ID: <cnal_8Z5apTk>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cnal_8Z5apTk; Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 8764A22C24;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 11/11] tools/proctrace: add proctrace tool
Date: Sun,  5 Jul 2020 20:55:04 +0200
Message-Id: <e0ac5422825ce307470256aab1652336d5179a9a.1593974333.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
In-Reply-To: <cover.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
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
 tools/proctrace/Makefile    |  48 +++++++++++
 tools/proctrace/proctrace.c | 163 ++++++++++++++++++++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 tools/proctrace/Makefile
 create mode 100644 tools/proctrace/proctrace.c

diff --git a/tools/proctrace/Makefile b/tools/proctrace/Makefile
new file mode 100644
index 0000000000..2983c477fe
--- /dev/null
+++ b/tools/proctrace/Makefile
@@ -0,0 +1,48 @@
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
+	$(RM) -f $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+
+iptlive: iptlive.o Makefile
+	$(CC) $(LDFLAGS) $< -o $@ $(LDLIBS) $(APPEND_LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/proctrace/proctrace.c b/tools/proctrace/proctrace.c
new file mode 100644
index 0000000000..22bf91db8d
--- /dev/null
+++ b/tools/proctrace/proctrace.c
@@ -0,0 +1,163 @@
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
+
+#include <xenctrl.h>
+#include <xen/xen.h>
+#include <xenforeignmemory.h>
+
+#define BUF_SIZE (16384 * XC_PAGE_SIZE)
+
+volatile int interrupted =3D 0;
+
+void term_handler(int signum) {
+    interrupted =3D 1;
+}
+
+int main(int argc, char* argv[]) {
+    xc_interface *xc;
+    uint32_t domid;
+    uint32_t vcpu_id;
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
+
+    fres =3D xenforeignmemory_map_resource(
+        fmem, domid, XENMEM_resource_vmtrace_buf,
+        /* vcpu: */ vcpu_id,
+        /* frame: */ 0,
+        /* num_frames: */ BUF_SIZE >> XC_PAGE_SHIFT,
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
+        rc =3D xc_vmtrace_pt_get_offset(xc, domid, vcpu_id, &offset);
+
+        if (rc) {
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
+            fwrite(buf + last_offset, BUF_SIZE - last_offset, 1, stdout)=
;
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
+    rc =3D xc_vmtrace_pt_disable(xc, domid, vcpu_id);
+
+    if (rc) {
+        fprintf(stderr, "Failed to call xc_vmtrace_pt_disable\n");
+        return 1;
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


