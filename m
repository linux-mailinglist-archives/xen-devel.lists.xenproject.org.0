Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12BC1F99D0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpu4-0007sF-G6; Mon, 15 Jun 2020 14:16:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpu3-0007qe-5V
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:15:59 +0000
X-Inumbo-ID: b9508c70-af12-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9508c70-af12-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 14:15:54 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: A04GakzAv8qhrDMfu5/dxLlX0prS/Tx3wC3kejqOajtC++rwD9oS+SnvHudkC83u52g3DzSgfK
 TV4xr+pPX6QLzEvL6PvEecxK9IVuJvWM5gavfu1BY4YBVv788HXRmdJZjKwQxcXuI4hFAZEhhn
 OhmE/WvawQRTrWmdKTYl4c3S7Bxa9sRIyejEPhoK7RMm6rbmttT01M3UrL2UAzmSWTLbh4QgFh
 0UjeNYb3NLqj63Q/8JIiPnq0UfM1Q9LNUS0FEQHlW5+48GZcHH7NpTG4oVyXlXBp5IqdZx7eGk
 wlE=
X-SBRS: 2.7
X-MesageID: 20064837
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20064837"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is
 sorted
Date: Mon, 15 Jun 2020 15:15:25 +0100
Message-ID: <20200615141532.1927-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200615141532.1927-1-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The existing x86_cpuid_copy_to_buffer() does produce sorted results, and we're
about to start relying on this.  Extend the unit tests.

As test_cpuid_serialise_success() is a fairly limited set of synthetic
examples right now, introduce test_cpuid_current() to operate on the full
policy for the current CPU.

Tweak the fail() macro to allow for simplified control flow.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
---
 tools/tests/cpu-policy/test-cpu-policy.c | 49 +++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index fe8cdf6ea9..7ba9707236 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -16,7 +16,7 @@ static unsigned int nr_failures;
 #define fail(fmt, ...)                          \
 ({                                              \
     nr_failures++;                              \
-    printf(fmt, ##__VA_ARGS__);                 \
+    (void)printf(fmt, ##__VA_ARGS__);           \
 })
 
 #define memdup(ptr)                             \
@@ -66,6 +66,45 @@ static void test_vendor_identification(void)
     }
 }
 
+static bool leaves_are_sorted(const xen_cpuid_leaf_t *leaves, unsigned int nr)
+{
+    for ( unsigned int i = 1; i < nr; ++i )
+    {
+        /* leaf index went backwards => not sorted. */
+        if ( leaves[i - 1].leaf > leaves[i].leaf )
+            return false;
+
+        /* leaf index went forwards => ok */
+        if ( leaves[i - 1].leaf < leaves[i].leaf )
+            continue;
+
+        /* leave index the same, subleaf didn't increase => not sorted. */
+        if ( leaves[i - 1].subleaf >= leaves[i].subleaf )
+            return false;
+    }
+
+    return true;
+}
+
+static void test_cpuid_current(void)
+{
+    struct cpuid_policy p;
+    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
+    unsigned int nr = ARRAY_SIZE(leaves);
+    int rc;
+
+    printf("Testing CPUID on current CPU\n");
+
+    x86_cpuid_policy_fill_native(&p);
+
+    rc = x86_cpuid_copy_to_buffer(&p, leaves, &nr);
+    if ( rc != 0 )
+        return fail("  Serialise, expected rc 0, got %d\n", rc);
+
+    if ( !leaves_are_sorted(leaves, nr) )
+        return fail("  Leaves not sorted\n");
+}
+
 static void test_cpuid_serialise_success(void)
 {
     static const struct test {
@@ -178,6 +217,13 @@ static void test_cpuid_serialise_success(void)
             goto test_done;
         }
 
+        if ( !leaves_are_sorted(leaves, nr) )
+        {
+            fail("  Test %s, leaves not sorted\n",
+                 t->name);
+            goto test_done;
+        }
+
     test_done:
         free(leaves);
     }
@@ -613,6 +659,7 @@ int main(int argc, char **argv)
 
     test_vendor_identification();
 
+    test_cpuid_current();
     test_cpuid_serialise_success();
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
-- 
2.11.0


