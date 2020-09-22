Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8B274836
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKn7i-0001oe-GB; Tue, 22 Sep 2020 18:34:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKn7h-0001oJ-Du
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:34:41 +0000
X-Inumbo-ID: 0f8ab936-bd09-49ac-a0c9-1898283fc792
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f8ab936-bd09-49ac-a0c9-1898283fc792;
 Tue, 22 Sep 2020 18:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600799675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ZjmZaUz16Rtfto5cL6MHuLw5U//b1IHlG7ceB93+qBg=;
 b=IjSYBNRulpdoJGMvasA0etwsBNbs9Fsc8/YHuTPP6lFj+frro2/lgI5k
 6aZ7aPrjPNbQyyS/B7RfHDlyMt0G1/EvkVio9kOZCfaRYK192vDjxtvs4
 WMnRDJ7bejv1z+jKSMoBFVp/fbGMmZ+ErekMECcGHyfDkgMXL0DLcBuY/ k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Z8DvEV+6vNjn7RLEMRYOHAc7l24LwDXDKsbrRRhi0mubwKZDtGyT7jT7yMq/bowjp45yGZq+sU
 bTy14CI8+P08ftLmuCqL9TN4qkCY3PUarm1eKZzUXI0hyM/EwNjh+slc8IgMIi8krkML2CRwtq
 m5gf8JckQrKJ/LyCQm5sAV/8LisVOoJmGWul76a5kCE363JN4G3vRrLMO3ydG+Da/UMEpoJV5v
 QGumYmA2y0mUHo94M2XpHKfsW6d4RwoqJBk6c/2UcYt5H6Yu4Ndp67cFKTIa53fmA2p51DbE20
 w3o=
X-SBRS: 2.7
X-MesageID: 27301294
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27301294"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 10/11] TESTING dom0
Date: Tue, 22 Sep 2020 19:24:43 +0100
Message-ID: <20200922182444.12350-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200922182444.12350-1-andrew.cooper3@citrix.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Poke xenforeignmemory_map_resource() from userspace.  Confirm that all 40
grant frames can be mapped.

Do not apply.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/misc/Makefile       |   4 ++
 tools/misc/xen-resource.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 tools/misc/xen-resource.c

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 7d37f297a9..c1d262c329 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -76,6 +76,10 @@ distclean: clean
 xen-cpuid: xen-cpuid.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(APPEND_LDFLAGS)
 
+xen-resource.o: APPEND_CFLAGS += -Wno-declaration-after-statement
+xen-resource: xen-resource.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(LDLIBS_libxendevicemodel) $(APPEND_LDFLAGS)
+
 xen-hvmctx: xen-hvmctx.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-resource.c b/tools/misc/xen-resource.c
new file mode 100644
index 0000000000..3c29d43a35
--- /dev/null
+++ b/tools/misc/xen-resource.c
@@ -0,0 +1,106 @@
+#include <err.h>
+#include <error.h>
+#include <errno.h>
+#include <stdio.h>
+#include <sys/mman.h>
+
+#include <xenctrl.h>
+#include <xenforeignmemory.h>
+#include <xendevicemodel.h>
+#include <xen-tools/libs.h>
+
+static xc_interface *xch;
+static xenforeignmemory_handle *fh;
+static xendevicemodel_handle *dh;
+
+static void test(unsigned int domid, unsigned int type, unsigned int id)
+{
+    unsigned long nr = ~0;
+
+    printf("Testing d%u, type %u, id %u\n", domid, type, id);
+
+    int rc = xenforeignmemory_resource_size(fh, domid, type, id, &nr);
+    if ( rc )
+    {
+        printf("  failed %d\n", -errno);
+        return;
+    }
+    else
+        printf("  %lu frames\n", nr);
+
+    printf("  Trying to map\n");
+    void *addr = NULL;
+    xenforeignmemory_resource_handle *res =
+        xenforeignmemory_map_resource(fh, domid, type, id, 0, nr,
+                                      &addr, PROT_READ | PROT_WRITE, 0);
+    if ( !res )
+    {
+        perror("  failed");
+        return;
+    }
+
+    printf("  Success\n");
+    xenforeignmemory_unmap_resource(fh, res);
+}
+
+int main(int argc, char **argv)
+{
+    int rc;
+
+    xch = xc_interface_open(NULL, NULL, 0);
+    fh = xenforeignmemory_open(NULL, 0);
+    dh = xendevicemodel_open(NULL, 0);
+
+    if ( !xch )
+        err(1, "xc_interface_open");
+    if ( !fh )
+        err(1, "xenforeignmemory_open");
+    if ( !dh )
+        err(1, "xendevicemodel_open");
+
+    uint32_t domid = 0;
+    struct xen_domctl_createdomain dom = {
+        .flags = XEN_DOMCTL_CDF_hvm,
+        .max_vcpus = 8,
+        .max_grant_frames = 40,
+
+        .arch = {
+            .emulation_flags = XEN_X86_EMU_LAPIC,
+        },
+    };
+
+    rc = xc_domain_create(xch, &domid, &dom);
+    if ( rc )
+    {
+        perror("xc_domain_create()");
+        goto out;
+    }
+    printf("Created d%u\n", domid);
+
+    ioservid_t id = -1;
+    rc = xendevicemodel_create_ioreq_server(dh, domid, 1, &id);
+    if ( rc )
+    {
+        perror("xendevicemodel_create_ioreq_server()");
+        goto out;
+    }
+    printf("Created ioreq server %u\n", id);
+
+
+    test(domid, XENMEM_resource_ioreq_server, id);
+
+    test(domid, XENMEM_resource_grant_table,
+         XENMEM_resource_grant_table_id_shared);
+    test(domid, XENMEM_resource_grant_table,
+         XENMEM_resource_grant_table_id_status);
+
+    test(domid, 2, 0);
+
+out:
+    if ( id >= 0 )
+        xendevicemodel_destroy_ioreq_server(dh, domid, id);
+    if ( domid )
+        xc_domain_destroy(xch, domid);
+
+    return 0;
+}
-- 
2.11.0


