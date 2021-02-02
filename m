Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFDD30CB0D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 20:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80701.147815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l714o-0001r7-C4; Tue, 02 Feb 2021 19:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80701.147815; Tue, 02 Feb 2021 19:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l714o-0001qi-8x; Tue, 02 Feb 2021 19:11:02 +0000
Received: by outflank-mailman (input) for mailman id 80701;
 Tue, 02 Feb 2021 19:11:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKoN=HE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l714n-0001qd-3F
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 19:11:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fcb1b71-6134-4c64-8799-d21583c05e78;
 Tue, 02 Feb 2021 19:10:59 +0000 (UTC)
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
X-Inumbo-ID: 5fcb1b71-6134-4c64-8799-d21583c05e78
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612293059;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wHP3tAWKLhgeTGf6oNIIFZkRbXg7nIN94ZGYk8lgsYY=;
  b=eirMNJHIMMZs9BaSQ7G20/fETMs6k2Rw3ge3T3iFdfODWjtXOx2a1IYc
   cFMS07F+9FtuNTBWNb/Zxe9dcl2lCQZ6MRX4MJsVVa10jyPdSYikM7t9f
   PCIlmGJEeK2wyX7oVw/YC9cXZm0fq06fSmwbArqkBga6Jc6mW1lF/5lvw
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Z/fiUyJ6WxUu3WkwTjrMezJ3Auls+vSANv7qeldeoLPX3cFLSUxflO+3SXCuHjvaTvm50CeKME
 Pq3tDfc+mICtijQrPrd7Vt6I3T62B8+7vh2tsomNsMxrYknAy0d89czdgZIqshfZfMFzQuV4Ot
 io+Ofks6YgP0l6Su8D6dOnW+YL1UTae5w2m2tEhZ8fNxJLAQ1Cd110irSDJ/T0/6sTRJDXSawc
 TP4U5hlajnZ8mt5vhUH2T4rHVy4pIrFcfUxmOUCJ2alj6zCKk31lZxil0955VgIQLdoD1wnCyQ
 1As=
X-SBRS: 5.1
X-MesageID: 36400885
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,396,1602561600"; 
   d="scan'208";a="36400885"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, Oleksandr
	<olekstysh@gmail.com>
Subject: [PATCH for-4.15] tools/tests: Introduce a test for acquire_resource
Date: Tue, 2 Feb 2021 19:09:37 +0000
Message-ID: <20210202190937.30206-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For now, simply try to map 40 frames of grant table.  This catches most of the
basic errors with resource sizes found and fixed through the 4.15 dev window.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Oleksandr <olekstysh@gmail.com>

Fails against current staging:

  XENMEM_acquire_resource tests
  Test x86 PV
    d7: grant table
      Fail: Map 7 - Argument list too long
  Test x86 PVH
    d8: grant table
      Fail: Map 7 - Argument list too long

The fix has already been posted:
  [PATCH v9 01/11] xen/memory: Fix mapping grant tables with XENMEM_acquire_resource

and the fixed run is:

  XENMEM_acquire_resource tests
  Test x86 PV
    d7: grant table
  Test x86 PVH
    d8: grant table

ARM folk: would you mind testing this?  I'm pretty sure the create parameters
are suitable, but I don't have any way to test this.

I've got more plans for this, but insufficient time right now.
---
 tools/tests/Makefile                 |   1 +
 tools/tests/resource/.gitignore      |   1 +
 tools/tests/resource/Makefile        |  40 ++++++++++
 tools/tests/resource/test-resource.c | 138 +++++++++++++++++++++++++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 tools/tests/resource/.gitignore
 create mode 100644 tools/tests/resource/Makefile
 create mode 100644 tools/tests/resource/test-resource.c

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index fc9b715951..c45b5fbc1d 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -2,6 +2,7 @@ XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 SUBDIRS-y :=
+SUBDIRS-y := resource
 SUBDIRS-$(CONFIG_X86) += cpu-policy
 SUBDIRS-$(CONFIG_X86) += mce-test
 ifneq ($(clang),y)
diff --git a/tools/tests/resource/.gitignore b/tools/tests/resource/.gitignore
new file mode 100644
index 0000000000..4872e97d4b
--- /dev/null
+++ b/tools/tests/resource/.gitignore
@@ -0,0 +1 @@
+test-resource
diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
new file mode 100644
index 0000000000..8a3373e786
--- /dev/null
+++ b/tools/tests/resource/Makefile
@@ -0,0 +1,40 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGET := test-resource
+
+.PHONY: all
+all: $(TARGET)
+
+.PHONY: run
+run: $(TARGET)
+	./$(TARGET)
+
+.PHONY: clean
+clean:
+	$(RM) -f -- *.o .*.d .*.d2 $(TARGET)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -f -- *~
+
+.PHONY: install
+install: all
+
+.PHONY: uninstall
+uninstall:
+
+CFLAGS += -Werror -D__XEN_TOOLS__
+CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenforeginmemory)
+CFLAGS += $(APPEND_CFLAGS)
+
+LDFLAGS += $(LDLIBS_libxenctrl)
+LDFLAGS += $(LDLIBS_libxenforeignmemory)
+LDFLAGS += $(APPEND_LDFLAGS)
+
+test-resource: test-resource.o
+	$(CC) $(LDFLAGS) -o $@ $<
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
new file mode 100644
index 0000000000..81a2a5cd12
--- /dev/null
+++ b/tools/tests/resource/test-resource.c
@@ -0,0 +1,138 @@
+#include <err.h>
+#include <errno.h>
+#include <error.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mman.h>
+
+#include <xenctrl.h>
+#include <xenforeignmemory.h>
+#include <xendevicemodel.h>
+#include <xen-tools/libs.h>
+
+static unsigned int nr_failures;
+#define fail(fmt, ...)                          \
+({                                              \
+    nr_failures++;                              \
+    (void)printf(fmt, ##__VA_ARGS__);           \
+})
+
+static xc_interface *xch;
+static xenforeignmemory_handle *fh;
+static xendevicemodel_handle *dh;
+
+static void test_gnttab(uint32_t domid, unsigned int nr_frames)
+{
+    xenforeignmemory_resource_handle *res;
+    void *addr = NULL;
+    size_t size;
+    int rc;
+
+    printf("  d%u: grant table\n", domid);
+
+    rc = xenforeignmemory_resource_size(
+        fh, domid, XENMEM_resource_grant_table,
+        XENMEM_resource_grant_table_id_shared, &size);
+    if ( rc )
+        return fail("    Fail: Get size: %d - %s\n", errno, strerror(errno));
+
+    if ( (size >> XC_PAGE_SHIFT) != nr_frames )
+        return fail("    Fail: Get size: expected %u frames, got %zu\n",
+                    nr_frames, size >> XC_PAGE_SHIFT);
+
+    res = xenforeignmemory_map_resource(
+        fh, domid, XENMEM_resource_grant_table,
+        XENMEM_resource_grant_table_id_shared, 0, size >> XC_PAGE_SHIFT,
+        &addr, PROT_READ | PROT_WRITE, 0);
+    if ( !res )
+        return fail("    Fail: Map %d - %s\n", errno, strerror(errno));
+
+    rc = xenforeignmemory_unmap_resource(fh, res);
+    if ( rc )
+        return fail("    Fail: Unmap %d - %s\n", errno, strerror(errno));
+}
+
+static void test_domain_configurations(void)
+{
+    static struct test {
+        const char *name;
+        struct xen_domctl_createdomain create;
+    } tests[] = {
+#if defined(__x86_64__) || defined(__i386__)
+        {
+            .name = "x86 PV",
+            .create = {
+                .max_vcpus = 2,
+                .max_grant_frames = 40,
+            },
+        },
+        {
+            .name = "x86 PVH",
+            .create = {
+                .flags = XEN_DOMCTL_CDF_hvm,
+                .max_vcpus = 2,
+                .max_grant_frames = 40,
+                .arch = {
+                    .emulation_flags = XEN_X86_EMU_LAPIC,
+                },
+            },
+        },
+#elif defined(__aarch64__) || defined(__arm__)
+        {
+            .name = "ARM",
+            .create = {
+                .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+                .max_vcpus = 2,
+                .max_grant_frames = 40,
+            },
+        },
+#endif
+    };
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        struct test *t = &tests[i];
+        uint32_t domid = 0;
+        int rc;
+
+        printf("Test %s\n", t->name);
+
+        rc = xc_domain_create(xch, &domid, &t->create);
+        if ( rc )
+        {
+            if ( errno == EINVAL || errno == EOPNOTSUPP )
+                printf("  Skip: %d - %s\n", errno, strerror(errno));
+            else
+                fail("  Domain create failure: %d - %s\n",
+                     errno, strerror(errno));
+            continue;
+        }
+
+        test_gnttab(domid, t->create.max_grant_frames);
+
+        rc = xc_domain_destroy(xch, domid);
+        if ( rc )
+            fail("  Failed to destroy domain: %d - %s\n",
+                 errno, strerror(errno));
+    }
+}
+
+int main(int argc, char **argv)
+{
+    printf("XENMEM_acquire_resource tests\n");
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
+    test_domain_configurations();
+
+    return !!nr_failures;
+}
-- 
2.11.0


