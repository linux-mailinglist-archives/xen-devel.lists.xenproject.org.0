Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFJiIokonGl1AAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C6D174A96
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238760.1540333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxN-0004EL-95; Mon, 23 Feb 2026 10:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238760.1540333; Mon, 23 Feb 2026 10:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxN-00047H-2w; Mon, 23 Feb 2026 10:14:25 +0000
Received: by outflank-mailman (input) for mailman id 1238760;
 Mon, 23 Feb 2026 10:14:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSxL-0002wR-4C
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:14:23 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b43dba8-10a0-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 11:14:21 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id DD394412248C;
 Mon, 23 Feb 2026 05:14:01 -0500 (EST)
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
X-Inumbo-ID: 6b43dba8-10a0-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 6/7] tools/tests/tsx: move guest creation to common area
Date: Mon, 23 Feb 2026 10:14:10 +0000
Message-ID: <78e4cef251a188713e4b2e13fd6185cc2f1d856b.1771840831.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840831.git.edwin.torok@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.18 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.67)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: 62C6D174A96
X-Rspamd-Action: no action

So that other tests can reuse the creation of HVM/PV tests.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/common/guests.c | 87 +++++++++++++++++++++++++++++++++++++
 tools/tests/common/guests.h | 11 +++++
 tools/tests/tsx/Makefile    |  2 +
 tools/tests/tsx/test-tsx.c  | 78 ++++-----------------------------
 4 files changed, 108 insertions(+), 70 deletions(-)
 create mode 100644 tools/tests/common/guests.c
 create mode 100644 tools/tests/common/guests.h

diff --git a/tools/tests/common/guests.c b/tools/tests/common/guests.c
new file mode 100644
index 0000000000..bb33bfd8c0
--- /dev/null
+++ b/tools/tests/common/guests.c
@@ -0,0 +1,87 @@
+#define _GNU_SOURCE
+#include "guests.h"
+#include "tests.h"
+
+#include <err.h>
+#include <errno.h>
+#include <string.h>
+
+xc_interface *xch;
+xc_physinfo_t physinfo;
+bool xen_has_pv = true, xen_has_hvm = true;
+
+void test_guest_init(void)
+{
+    int rc;
+    xch = xc_interface_open(NULL, NULL, 0);
+
+    if ( !xch )
+        err(1, "xc_interface_open");
+
+    rc = xc_physinfo(xch, &physinfo);
+    if ( rc )
+        err(1, "Failed to obtain physinfo");
+
+    xen_has_hvm = physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hvm;
+    xen_has_pv = physinfo.capabilities & XEN_SYSCTL_PHYSCAP_pv;
+}
+
+void test_guest(struct xen_domctl_createdomain *c)
+{
+    uint32_t domid = 0;
+    int rc;
+
+    if (!xch)
+        return fail("test_guest_init() not called");
+
+    rc = xc_domain_create(xch, &domid, c);
+    if ( rc )
+        return fail("  Domain create failure: %d - %s\n",
+                    errno, strerror(errno));
+
+    printf("  Created d%u\n", domid);
+
+    test_guest_domid(domid);
+
+    rc = xc_domain_destroy(xch, domid);
+    if ( rc )
+        fail("  Failed to destroy domain: %d - %s\n",
+             errno, strerror(errno));
+}
+
+void test_guests(void)
+{
+    if ( xen_has_pv )
+    {
+        struct xen_domctl_createdomain c = {
+            .max_vcpus = 1,
+            .max_grant_frames = 1,
+            .grant_opts = XEN_DOMCTL_GRANT_version(1),
+        };
+
+        printf("Testing PV guest\n");
+        test_guest(&c);
+    }
+
+    if ( xen_has_hvm )
+    {
+        struct xen_domctl_createdomain c = {
+            .flags = XEN_DOMCTL_CDF_hvm,
+            .max_vcpus = 1,
+            .max_grant_frames = 1,
+            .grant_opts = XEN_DOMCTL_GRANT_version(1),
+            .arch = {
+                .emulation_flags = XEN_X86_EMU_LAPIC,
+            },
+        };
+
+        if ( physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap )
+            c.flags |= XEN_DOMCTL_CDF_hap;
+        else if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_shadow) )
+            return fail("  HVM available, but neither HAP nor Shadow\n");
+
+        printf("Testing HVM guest\n");
+        test_guest(&c);
+    }
+}
+
diff --git a/tools/tests/common/guests.h b/tools/tests/common/guests.h
new file mode 100644
index 0000000000..8cd6fc1b68
--- /dev/null
+++ b/tools/tests/common/guests.h
@@ -0,0 +1,11 @@
+#include <xenctrl.h>
+#include <xen/domctl.h>
+
+extern void test_guest_domid(domid_t domid);
+extern xc_interface *xch;
+extern xc_physinfo_t physinfo;
+extern bool xen_has_pv, xen_has_hvm;
+
+void test_guest_init(void);
+void test_guest(struct xen_domctl_createdomain *c);
+void test_guests(void);
diff --git a/tools/tests/tsx/Makefile b/tools/tests/tsx/Makefile
index 54852b0327..3ccb6dcb9f 100644
--- a/tools/tests/tsx/Makefile
+++ b/tools/tests/tsx/Makefile
@@ -11,4 +11,6 @@ CFLAGS += $(CFLAGS_libxenguest)
 LDFLAGS += $(LDLIBS_libxenctrl)
 LDFLAGS += $(LDLIBS_libxenguest)
 
+$(TARGET): ../common/guests.o
+
 include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index ab099e9038..b80a812a74 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -31,6 +31,7 @@
 #include <xen-tools/common-macros.h>
 
 #include "tests.h"
+#include "guests.h"
 #include "xg_private.h"
 
 enum {
@@ -45,7 +46,6 @@ enum {
 #define MSR_TSX_CTRL                        0x00000122
 #define MSR_MCU_OPT_CTRL                    0x00000123
 
-static xc_interface *xch;
 
 /*
  * Policies, arranged as an array for easy collection of all of them.  We
@@ -60,10 +60,6 @@ static struct xc_cpu_policy policies[6];
 #define pv_default   policies[XEN_SYSCTL_cpu_policy_pv_default]
 #define hvm_default  policies[XEN_SYSCTL_cpu_policy_hvm_default]
 
-static bool xen_has_pv = true, xen_has_hvm = true;
-
-static xc_physinfo_t physinfo;
-
 static enum rtm_behaviour {
     RTM_UD,
     RTM_OK,
@@ -354,24 +350,16 @@ static void test_def_max_policies(void)
     }
 }
 
-static void test_guest(struct xen_domctl_createdomain *c)
+void test_guest_domid(domid_t domid)
 {
-    uint32_t domid = 0;
     int rc;
 
-    rc = xc_domain_create(xch, &domid, c);
-    if ( rc )
-        return fail("  Domain create failure: %d - %s\n",
-                    errno, strerror(errno));
-
-    printf("  Created d%u\n", domid);
-
     rc = xc_cpu_policy_get_domain(xch, domid, &guest_policy);
     if ( rc )
     {
         fail("  Failed to obtain domain policy: %d - %s\n",
              errno, strerror(errno));
-        goto out;
+        return;
     }
 
     dump_tsx_details(&guest_policy.policy, "Cur:");
@@ -408,7 +396,7 @@ static void test_guest(struct xen_domctl_createdomain *c)
         {
             fail("  Failed to set domain policy: %d - %s\n",
                  errno, strerror(errno));
-            goto out;
+            return;
         }
 
         /* Re-get the new policy. */
@@ -417,7 +405,7 @@ static void test_guest(struct xen_domctl_createdomain *c)
         {
             fail("  Failed to obtain domain policy: %d - %s\n",
                  errno, strerror(errno));
-            goto out;
+            return;
         }
 
         dump_tsx_details(&guest_policy.policy, "Cur:");
@@ -426,58 +414,17 @@ static void test_guest(struct xen_domctl_createdomain *c)
         {
             fail("  Expected CPUID.7[0].b 0x%08x differs from actual 0x%08x\n",
                  _7b0, guest_policy.policy.feat.raw[0].b);
-            goto out;
+            return;
         }
 
         if ( guest_policy.policy.feat.raw[0].d != _7d0 )
         {
             fail("  Expected CPUID.7[0].d 0x%08x differs from actual 0x%08x\n",
                  _7d0, guest_policy.policy.feat.raw[0].d);
-            goto out;
+            return;
         }
     }
 
- out:
-    rc = xc_domain_destroy(xch, domid);
-    if ( rc )
-        fail("  Failed to destroy domain: %d - %s\n",
-             errno, strerror(errno));
-}
-
-static void test_guests(void)
-{
-    if ( xen_has_pv )
-    {
-        struct xen_domctl_createdomain c = {
-            .max_vcpus = 1,
-            .max_grant_frames = 1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(1),
-        };
-
-        printf("Testing PV guest\n");
-        test_guest(&c);
-    }
-
-    if ( xen_has_hvm )
-    {
-        struct xen_domctl_createdomain c = {
-            .flags = XEN_DOMCTL_CDF_hvm,
-            .max_vcpus = 1,
-            .max_grant_frames = 1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(1),
-            .arch = {
-                .emulation_flags = XEN_X86_EMU_LAPIC,
-            },
-        };
-
-        if ( physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap )
-            c.flags |= XEN_DOMCTL_CDF_hap;
-        else if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_shadow) )
-            return fail("  HVM available, but neither HAP nor Shadow\n");
-
-        printf("Testing HVM guest\n");
-        test_guest(&c);
-    }
 }
 
 /* Obtain some general data, then run the tests. */
@@ -521,11 +468,6 @@ static void test_tsx(void)
 
     dump_tsx_details(&host.policy, "Host:");
 
-    rc = xc_physinfo(xch, &physinfo);
-    if ( rc )
-        return fail("Failed to obtain physinfo: %d - %s\n",
-                    errno, strerror(errno));
-
     printf("  Got %u CPUs\n", physinfo.max_cpu_id + 1);
 
     test_tsx_msrs();
@@ -538,11 +480,7 @@ int test_main(int argc, char *argv[argc+1])
 {
     printf("TSX tests\n");
 
-    xch = xc_interface_open(NULL, NULL, 0);
-
-    if ( !xch )
-        err(1, "xc_interface_open");
-
+    test_guest_init();
     test_tsx();
 
     return !!nr_failures;
-- 
2.47.3


