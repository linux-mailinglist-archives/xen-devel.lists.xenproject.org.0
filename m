Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D18B3B6400
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 17:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147904.273051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxskS-0007zg-OW; Mon, 28 Jun 2021 15:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147904.273051; Mon, 28 Jun 2021 15:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxskS-0007xC-Ku; Mon, 28 Jun 2021 15:00:32 +0000
Received: by outflank-mailman (input) for mailman id 147904;
 Mon, 28 Jun 2021 15:00:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HW7=LW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lxskQ-0007x6-LH
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 15:00:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed34cb9e-b8b2-49a3-899d-6d942d006bf8;
 Mon, 28 Jun 2021 15:00:28 +0000 (UTC)
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
X-Inumbo-ID: ed34cb9e-b8b2-49a3-899d-6d942d006bf8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624892428;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rjv0+KN+w2SEggZ26BkprHazfCWFofWHNisRqYfXtGY=;
  b=fBFcCBQ4ykwno6DRfJCb87AW4k5XivJ120/ZeBt6SINXmJ2BXr2aOrDM
   kxOZT2CwiriXuf7k77RxRvaZkSWOYQm7RHeabTh8hAuJo4F+7BLh9H76T
   cJo+/+0heAUZkR9IfmqXjSvs66XCee2TF5tCkhhkX++lNcLpX2OZZVevj
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2g6992rnAe70KSfQUYxinF4UOt5IV6smQHTrh7hLYgIDg3r0MswesZ7r2VwHlEiB2e613x1Vft
 kMKfA4jnmrrSWA3sa/AKlu0NeCVwk2L6uzRYYzJ5Qdj9EJXPc4D2pMO/rYLIFHOBi3AGSQe9J5
 VjIpN3mkdC+2t+1VeMfCxOpUNq24B2jBRvkcVMH6LBjX9uKiArc4VBSvqN4IA8+ByYz/tAvjQr
 UEX9h2m/9Ztvj4tbOiC8QDyQnaRjHMm1q6ec7Cyykj+cInG1n7LUeR8nb1JAmXaMW8y1mMaOfG
 mIs=
X-SBRS: 5.1
X-MesageID: 48719958
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2NrbNa5UG+qVr+z4HgPXwViBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTPqftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkzNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9o1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUWpDKh8KoCOCW/sLlWFtzesHfsWG2nYczHgNkBmpDt1L/tqq
 iKn/5vBbU015qbRBDJnfKk4Xid7N9p0Q6s9bbQuwqdneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KJoM3R3am/a/hRrDv8nZPiq59ns1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgk/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M3OA7Ae7rBNoXpe2O/DIu/GyWWKEg3AQO4l3es2sRF2AiDQu168HIdou
 W+bG9l
X-IronPort-AV: E=Sophos;i="5.83,306,1616472000"; 
   d="scan'208";a="48719958"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] libx86: Introduce x86_cpu_policy_calculate_compatible() with MSR_ARCH_CAPS handling
Date: Mon, 28 Jun 2021 16:00:11 +0100
Message-ID: <20210628150011.13106-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Just as with x86_cpu_policies_are_compatible(), make a start on this function
with some token handling.

Add levelling support for MSR_ARCH_CAPS, because RSBA has interesting
properties, and introduce test_calculate_compatible_success() to the unit
tests, covering various cases where the arch_caps CPUID bit falls out, and
with RSBA accumulating rather than intersecting across the two.

Extend x86_cpu_policies_are_compatible() with a check for MSR_ARCH_CAPS, which
was arguably missing from c/s e32605b07ef "x86: Begin to introduce support for
MSR_ARCH_CAPS".

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Don't break the libxl build.
 * Extend the function description to discuss why levelling the max policy
   doesn't make sense, and that we (will) pick some data from @a specifically.
 * Ifdefary for now until a Xen caller arrives.
---
 tools/include/xen-tools/libs.h           |   5 ++
 tools/libs/light/libxl_internal.h        |   2 -
 tools/tests/cpu-policy/test-cpu-policy.c | 150 +++++++++++++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     |  28 ++++++
 xen/lib/x86/policy.c                     |  49 ++++++++++
 5 files changed, 232 insertions(+), 2 deletions(-)

diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
index a16e0c3807..4de10efdea 100644
--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -63,4 +63,9 @@
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #endif
 
+#ifndef _AC
+#define __AC(X, Y)   (X ## Y)
+#define _AC(X, Y)    __AC(X, Y)
+#endif
+
 #endif	/* __XEN_TOOLS_LIBS__ */
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 0b4671318c..1816c9704f 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -126,8 +126,6 @@
 #define PVSHIM_CMDLINE "pv-shim console=xen,pv"
 
 /* Size macros. */
-#define __AC(X,Y)   (X##Y)
-#define _AC(X,Y)    __AC(X,Y)
 #define MB(_mb)     (_AC(_mb, ULL) << 20)
 #define GB(_gb)     (_AC(_gb, ULL) << 30)
 
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 75973298df..455b4fe3c0 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -775,6 +775,154 @@ static void test_is_compatible_failure(void)
     }
 }
 
+static void test_calculate_compatible_success(void)
+{
+    static struct test {
+        const char *name;
+        struct {
+            struct cpuid_policy p;
+            struct msr_policy m;
+        } a, b, out;
+    } tests[] = {
+        {
+            "arch_caps, b short max_leaf",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 6,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 6,
+            },
+        },
+        {
+            "arch_caps, b feat missing",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 7,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 7,
+            },
+        },
+        {
+            "arch_caps, b rdcl_no missing",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+            },
+        },
+        {
+            "arch_caps, rdcl_no ok",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+        },
+        {
+            "arch_caps, rsba accum",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rsba = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rsba = true,
+            },
+        },
+    };
+    struct cpu_policy_errors no_errors = INIT_CPU_POLICY_ERRORS;
+
+    printf("Testing calculate compatibility success:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        struct test *t = &tests[i];
+        struct cpuid_policy *p = malloc(sizeof(struct cpuid_policy));
+        struct msr_policy *m = malloc(sizeof(struct msr_policy));
+        struct cpu_policy a = {
+            &t->a.p,
+            &t->a.m,
+        }, b = {
+            &t->b.p,
+            &t->b.m,
+        }, out = {
+            p,
+            m,
+        };
+        struct cpu_policy_errors e;
+        int res;
+
+        if ( !p || !m )
+            err(1, "%s() malloc failure", __func__);
+
+        res = x86_cpu_policy_calculate_compatible(&a, &b, &out, &e);
+
+        /* Check the expected error output. */
+        if ( res != 0 || memcmp(&no_errors, &e, sizeof(no_errors)) )
+        {
+            fail("  Test '%s' expected no errors\n"
+                 "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
+                 t->name, res, e.leaf, e.subleaf, e.msr);
+            goto test_done;
+        }
+
+        if ( memcmp(&t->out.p, p, sizeof(*p)) )
+        {
+            fail("  Test '%s' resulting CPUID policy not as expected\n",
+                 t->name);
+            goto test_done;
+        }
+
+        if ( memcmp(&t->out.m, m, sizeof(*m)) )
+        {
+            fail("  Test '%s' resulting MSR policy not as expected\n",
+                 t->name);
+            goto test_done;
+        }
+
+    test_done:
+        free(p);
+        free(m);
+    }
+}
+
 int main(int argc, char **argv)
 {
     printf("CPU Policy unit tests\n");
@@ -793,6 +941,8 @@ int main(int argc, char **argv)
     test_is_compatible_success();
     test_is_compatible_failure();
 
+    test_calculate_compatible_success();
+
     if ( nr_failures )
         printf("Done: %u failures\n", nr_failures);
     else
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 5a2c4c7b2d..0e8ff1194a 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -37,6 +37,34 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
+/*
+ * Given two policies, calculate one which is compatible with each.
+ *
+ * i.e. Given host @a and host @b, calculate what to give a VM so it can live
+ * migrate between the two.
+ *
+ * @param a        A cpu_policy.
+ * @param b        Another cpu_policy.
+ * @param out      A policy compatible with @a and @b, if successful.
+ * @param err      Optional hint for error diagnostics.
+ * @returns -errno
+ *
+ * For typical usage, @a and @b should be default system policies of the same
+ * type (i.e. PV or HVM) from different hosts.  It does not make sense to try
+ * and level max policies, as they contain the non-migrateable features.
+ *
+ * Some data (e.g. the long CPU brand string) cannot be levelled.  Such data
+ * will be taken from @a, and the content in @b will be discaraded.
+ *
+ * It is possible that @a and @b cannot be resolved to migration-compatible
+ * new policy.  In this case, the optional err pointer may identify the
+ * problematic leaf/subleaf and/or MSR.
+ */
+int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
+                                        const struct cpu_policy *b,
+                                        struct cpu_policy *out,
+                                        struct cpu_policy_errors *err);
+
 #endif /* !XEN_LIB_X86_POLICIES_H */
 
 /*
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f6cea4e2f9..de14fe4912 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -29,6 +29,9 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
     if ( ~host->msr->platform_info.raw & guest->msr->platform_info.raw )
         FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
 
+    if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw )
+        FAIL_MSR(MSR_ARCH_CAPABILITIES);
+
 #undef FAIL_MSR
 #undef FAIL_CPUID
 #undef NA
@@ -43,6 +46,52 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
     return ret;
 }
 
+#ifndef __XEN__
+int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
+                                        const struct cpu_policy *b,
+                                        struct cpu_policy *out,
+                                        struct cpu_policy_errors *err)
+{
+    const struct cpuid_policy *ap = a->cpuid, *bp = b->cpuid;
+    const struct msr_policy *am = a->msr, *bm = b->msr;
+    struct cpuid_policy *cp = out->cpuid;
+    struct msr_policy *mp = out->msr;
+
+    memset(cp, 0, sizeof(*cp));
+    memset(mp, 0, sizeof(*mp));
+
+    cp->basic.max_leaf = min(ap->basic.max_leaf, bp->basic.max_leaf);
+
+    if ( cp->basic.max_leaf >= 7 )
+    {
+        cp->feat.max_subleaf = min(ap->feat.max_subleaf, bp->feat.max_subleaf);
+
+        cp->feat.raw[0].b = ap->feat.raw[0].b & bp->feat.raw[0].b;
+        cp->feat.raw[0].c = ap->feat.raw[0].c & bp->feat.raw[0].c;
+        cp->feat.raw[0].d = ap->feat.raw[0].d & bp->feat.raw[0].d;
+    }
+
+    /* TODO: Far more. */
+
+    mp->platform_info.raw = am->platform_info.raw & bm->platform_info.raw;
+
+    if ( cp->feat.arch_caps )
+    {
+        /*
+         * RSBA means "RSB Alternative", i.e. RSB stuffing not necesserily
+         * safe.  It needs to accumulate rather than intersect across a
+         * resource pool.
+         */
+#define POL_MASK ARCH_CAPS_RSBA
+        mp->arch_caps.raw = ((am->arch_caps.raw ^ POL_MASK) &
+                             (bm->arch_caps.raw ^ POL_MASK)) ^ POL_MASK;
+#undef POL_MASK
+    }
+
+    return 0;
+}
+#endif /* !__XEN__ */
+
 /*
  * Local variables:
  * mode: C
-- 
2.11.0


