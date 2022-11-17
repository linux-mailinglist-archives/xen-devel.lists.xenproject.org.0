Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6A062D062
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 02:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444453.699722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovTOR-0003vm-3f; Thu, 17 Nov 2022 01:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444453.699722; Thu, 17 Nov 2022 01:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovTOQ-0003sU-Vk; Thu, 17 Nov 2022 01:08:38 +0000
Received: by outflank-mailman (input) for mailman id 444453;
 Thu, 17 Nov 2022 01:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BOBv=3R=citrix.com=prvs=31353e2df=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovTOO-0002PW-Kd
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 01:08:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b64a19f-6614-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 02:08:35 +0100 (CET)
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
X-Inumbo-ID: 5b64a19f-6614-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668647315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LGNXYRbqu08/x18C0o33vlfzJWuGN3UVgv27ZYimOA4=;
  b=MDxUSFVXro9+EaaZhXO//XMg3+sYibSmj/lZgtU0wUJCPle1AXhW57v2
   rxDS8SFfgPQPGVv+Y/Le602iQY3O4huZJH3VsZoB+/xqTuUVuorfsWULG
   AMLJ4shL7x7wPPGwrm+dYJKpZXIkCra/fvd8ifYVE3t/wwlOzo9pLClYv
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85413939
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WvCOHaDjMoFcAhVW/97jw5YqxClBgxIJ4kV8jS/XYbTApDtx0TEHm
 GUdD2+BMqqOMDCkfN4ja9vk8U9TsJHSydI2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpB4ARlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwyMMsHCIR1
 NokdGoddzyKg+GE7qyZc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/IZQyhuq3wFL4dCVVsgm9rqsr+WnDigd21dABNfKFJ4DTHpQOzy50o
 ErW32SiAQoAGeW9lzPUqm+JvNDCmzjSDdd6+LqQqacx3Qz7KnYoICMRUVy3sPyokHmUUthUK
 1EX0ic2pK10/0uuJvH/Qhm5rXisrhMaHd1KHIUSyAyL0LuS3A+fCUANVDsHY9sj3Oc8SCY2z
 FaPk5XsDCZ2rbyOYXuH8/GfqjbaEQo/IHIGZCQEZRAY+NSlq4Y25jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vqym3upHDQwox5wPWdmGo9AV0YMiifYPAwUffxeZNKsCeVFbpg
 ZQfs5HAtqZUV8jLzXHTBrVWdF202xqbGA/52kMsQLgHy2j362ePdIRT0h9gBn48Z67oZgTVS
 EPUvApQ4rpaM32rcbJ7buqNNig68UTzPY+7D66JN7KidrA0LVbap382OSZ8yki3yCARfbcD1
 YB3mCpGJVITEuxZwTW/XI/xOpd7l3lllQs/qX0WpilLMIZyhlbPF9/p03PUNIjVCZ9oRy2Lm
 +uzz+PQl31ivBTWO0E6Mec7dDjm10QTC5HssNBwfeWeOAdgE2xJI6aPn+N/Idc5wP4Lyb2gE
 pSBtqlwkwOXaZrvcFviV5yeQOm3AcYXQYwTYETAwmpEK1B8ON3yvc/zhrM8fKU99fwL8BKHZ
 6BtRihBa9wRIgn6F8M1PcOs9tIzKk/67e9MVgL8CAUCk1dbb1Sh0rfZksHHrXJm4vaf3Sfmn
 4Cd6w==
IronPort-HdrOrdr: A9a23:/VcpnKFuJTZcwOcmpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="85413939"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/4] tools/tests: Unit test for paging mempool size
Date: Thu, 17 Nov 2022 01:08:02 +0000
Message-ID: <20221117010804.9384-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221117010804.9384-1-andrew.cooper3@citrix.com>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Exercise some basic functionality of the new
xc_{get,set}_paging_mempool_size() hypercalls.

This passes on x86, but fails currently on ARM.  ARM will be fixed up in
future patches.

This is part of XSA-409 / CVE-2022-33747.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
CC: Anthony PERARD <anthony.perard@citrix.com>

x86 Shadow is complicated because of how it behaves for PV guests, and because
of how it forms a simultaneous equation with tot_pages.  This will require
more work to untangle.

v2:
 * s/p2m/paging/
 * Fix CFLAGS_libxenforeginmemory typo
---
 tools/tests/Makefile                             |   1 +
 tools/tests/paging-mempool/.gitignore            |   1 +
 tools/tests/paging-mempool/Makefile              |  42 ++++++
 tools/tests/paging-mempool/test-paging-mempool.c | 181 +++++++++++++++++++++++
 4 files changed, 225 insertions(+)
 create mode 100644 tools/tests/paging-mempool/.gitignore
 create mode 100644 tools/tests/paging-mempool/Makefile
 create mode 100644 tools/tests/paging-mempool/test-paging-mempool.c

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index d99146d56a64..1319c3a9d88c 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -11,6 +11,7 @@ endif
 SUBDIRS-y += xenstore
 SUBDIRS-y += depriv
 SUBDIRS-y += vpci
+SUBDIRS-y += paging-mempool
 
 .PHONY: all clean install distclean uninstall
 all clean distclean install uninstall: %: subdirs-%
diff --git a/tools/tests/paging-mempool/.gitignore b/tools/tests/paging-mempool/.gitignore
new file mode 100644
index 000000000000..2f9305b7cc07
--- /dev/null
+++ b/tools/tests/paging-mempool/.gitignore
@@ -0,0 +1 @@
+test-paging-mempool
diff --git a/tools/tests/paging-mempool/Makefile b/tools/tests/paging-mempool/Makefile
new file mode 100644
index 000000000000..5d49497710e0
--- /dev/null
+++ b/tools/tests/paging-mempool/Makefile
@@ -0,0 +1,42 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGET := test-paging-mempool
+
+.PHONY: all
+all: $(TARGET)
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGET) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
+
+CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenforeignmemory)
+CFLAGS += $(CFLAGS_libxengnttab)
+CFLAGS += $(APPEND_CFLAGS)
+
+LDFLAGS += $(LDLIBS_libxenctrl)
+LDFLAGS += $(LDLIBS_libxenforeignmemory)
+LDFLAGS += $(LDLIBS_libxengnttab)
+LDFLAGS += $(APPEND_LDFLAGS)
+
+%.o: Makefile
+
+$(TARGET): test-paging-mempool.o
+	$(CC) -o $@ $< $(LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
new file mode 100644
index 000000000000..942a2fde19c7
--- /dev/null
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -0,0 +1,181 @@
+#include <err.h>
+#include <errno.h>
+#include <inttypes.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mman.h>
+
+#include <xenctrl.h>
+#include <xenforeignmemory.h>
+#include <xengnttab.h>
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
+static uint32_t domid;
+
+static struct xen_domctl_createdomain create = {
+    .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+    .max_vcpus = 1,
+    .max_grant_frames = 1,
+    .grant_opts = XEN_DOMCTL_GRANT_version(1),
+
+    .arch = {
+#if defined(__x86_64__) || defined(__i386__)
+        .emulation_flags = XEN_X86_EMU_LAPIC,
+#endif
+    },
+};
+
+static uint64_t default_mempool_size_bytes =
+#if defined(__x86_64__) || defined(__i386__)
+    256 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. */
+#elif defined (__arm__) || defined(__aarch64__)
+    16 << 12;
+#endif
+
+static void run_tests(void)
+{
+    xen_pfn_t physmap[] = { 0 };
+    uint64_t size_bytes, old_size_bytes;
+    int rc;
+
+    printf("Test default mempool size\n");
+
+    rc = xc_get_paging_mempool_size(xch, domid, &size_bytes);
+    if ( rc )
+        return fail("  Fail: get mempool size: %d - %s\n",
+                    errno, strerror(errno));
+
+    printf("mempool size %"PRIu64" bytes (%"PRIu64"kB, %"PRIu64"MB)\n",
+           size_bytes, size_bytes >> 10, size_bytes >> 20);
+
+
+    /*
+     * Check that the domain has the expected default allocation size.  This
+     * will fail if the logic in Xen is altered without an equivelent
+     * adjustment here.
+     */
+    if ( size_bytes != default_mempool_size_bytes )
+        return fail("  Fail: size %"PRIu64" != expected size %"PRIu64"\n",
+                    size_bytes, default_mempool_size_bytes);
+
+
+    printf("Test that allocate doesn't alter pool size\n");
+
+    /*
+     * Populate the domain with some RAM.  This will cause more of the mempool
+     * to be used.
+     */
+    old_size_bytes = size_bytes;
+
+    rc = xc_domain_setmaxmem(xch, domid, -1);
+    if ( rc )
+        return fail("  Fail: setmaxmem: : %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = xc_domain_populate_physmap_exact(xch, domid, 1, 0, 0, physmap);
+    if ( rc )
+        return fail("  Fail: populate physmap: %d - %s\n",
+                    errno, strerror(errno));
+
+    /*
+     * Re-get the p2m size.  Should not have changed as a consequence of
+     * populate physmap.
+     */
+    rc = xc_get_paging_mempool_size(xch, domid, &size_bytes);
+    if ( rc )
+        return fail("  Fail: get mempool size: %d - %s\n",
+                    errno, strerror(errno));
+
+    if ( old_size_bytes != size_bytes )
+        return fail("  Fail: mempool size changed %"PRIu64" => %"PRIu64"\n",
+                    old_size_bytes, size_bytes);
+
+
+
+    printf("Test bad set size\n");
+
+    /*
+     * Check that setting a non-page size results in failure.
+     */
+    rc = xc_set_paging_mempool_size(xch, domid, size_bytes + 1);
+    if ( rc != -1 || errno != EINVAL )
+        return fail("  Fail: Bad set size: expected -1/EINVAL, got %d/%d - %s\n",
+                    rc, errno, strerror(errno));
+
+
+    printf("Test very large set size\n");
+
+    /*
+     * Check that setting a large P2M size succeeds.  This is expecting to
+     * trigger continuations.
+     */
+    rc = xc_set_paging_mempool_size(xch, domid, 64 << 20);
+    if ( rc )
+        return fail("  Fail: Set size 64MB: %d - %s\n",
+                    errno, strerror(errno));
+
+
+    /*
+     * Check that the reported size matches what set consumed.
+     */
+    rc = xc_get_paging_mempool_size(xch, domid, &size_bytes);
+    if ( rc )
+        return fail("  Fail: get p2m mempool size: %d - %s\n",
+                    errno, strerror(errno));
+
+    if ( size_bytes != 64 << 20 )
+        return fail("  Fail: expected mempool size %u, got %"PRIu64"\n",
+                    64 << 20, size_bytes);
+}
+
+int main(int argc, char **argv)
+{
+    int rc;
+
+    printf("Paging mempool tests\n");
+
+    xch = xc_interface_open(NULL, NULL, 0);
+
+    if ( !xch )
+        err(1, "xc_interface_open");
+
+    rc = xc_domain_create(xch, &domid, &create);
+    if ( rc )
+    {
+        if ( errno == EINVAL || errno == EOPNOTSUPP )
+            printf("  Skip: %d - %s\n", errno, strerror(errno));
+        else
+            fail("  Domain create failure: %d - %s\n",
+                 errno, strerror(errno));
+        goto out;
+    }
+
+    printf("  Created d%u\n", domid);
+
+    run_tests();
+
+    rc = xc_domain_destroy(xch, domid);
+    if ( rc )
+        fail("  Failed to destroy domain: %d - %s\n",
+             errno, strerror(errno));
+ out:
+    return !!nr_failures;
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


