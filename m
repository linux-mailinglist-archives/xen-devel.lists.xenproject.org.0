Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B691875D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749275.1157363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVq-0007WP-4V; Wed, 26 Jun 2024 16:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749275.1157363; Wed, 26 Jun 2024 16:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVp-0007N2-V6; Wed, 26 Jun 2024 16:28:49 +0000
Received: by outflank-mailman (input) for mailman id 749275;
 Wed, 26 Jun 2024 16:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVn-0006MH-VA
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:48 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29aaca38-33d9-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 18:28:47 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso104744071fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:47 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:46 -0700 (PDT)
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
X-Inumbo-ID: 29aaca38-33d9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419326; x=1720024126; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+xOouMfNTmMxHo9v7bAjCWITyqn06N8bTQ+zZ/tKIw=;
        b=OYFEbiTnClOEsBRLewytNPp7hQYeYjUX6ji1S+VYKmIL4ODLRQgM3Z5ptDqcYlwoI6
         Q+Ehq0m6IzqdSwCkWXARzCuEaq3Dl3QolxLyei7kxfhZyUzA8Q3soPbunRde0u+epwTk
         eSSS6Lwh+47LbYl2Qu79dLnp4QvAWKQA8YGHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419326; x=1720024126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+xOouMfNTmMxHo9v7bAjCWITyqn06N8bTQ+zZ/tKIw=;
        b=YBZnIXrv3RWbpAD7s0W4V0QovipOpzvVO1x6g51wtASB32RiWpVvQKBWut2SbHU2Os
         q1xtoKnW/mPy+iCrQTCzylZ6nnzo5vl/zsN62EQvG8KNPJYNOLJ+zR0e3sB7M0znl1jA
         s34+luSTAwyncADyAy61Dr6GXzxcUZ3kiVnWCECWBoFx5Qub87aq6mWtlJpT2t0lO4qb
         Hw/wZJIsJBs8u02DYYmGXQP8L4FD9DpBhZ5BIphxIaszevtzaAQOb+nQIHOKiHQS+cGZ
         flm7HjA8xeU96RxlPcRH3uXNgsYkDBll6CAH96dXaxDmTErS+YoT3rKGOcNAxtg8nq6Y
         egVw==
X-Gm-Message-State: AOJu0YyP4Ll9gm8NNsOCvGAuBdjbGahFt+YfRNdHKUsN5XJ9ItiGr7k9
	92yDAG/SmhXUSimIoHjDB3tWbYRb/yerB0dQ2c1p17DpQN/tXpTLQtLtzfsdBpi0PF7H2o2R0VN
	nKgM=
X-Google-Smtp-Source: AGHT+IF3IPdvzxA3JXkykkYNidfujye+/BWcALPxMJdj71ZMCRp0vGOO+OeWys7ok3Dm5kfg6BdS0w==
X-Received: by 2002:a2e:885a:0:b0:2eb:fca8:7f37 with SMTP id 38308e7fff4ca-2ec5b2e628fmr89509191fa.28.1719419326484;
        Wed, 26 Jun 2024 09:28:46 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 07/10] xen/lib: Add topology generator for x86
Date: Wed, 26 Jun 2024 17:28:34 +0100
Message-Id: <5ab2cb62745bca462ab3768ea1eb826d2b6e2c76.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719416329.git.alejandro.vallejo@cloud.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper to populate topology leaves in the cpu policy from
threads/core and cores/package counts. It's unit-tested in test-cpu-policy.c,
but it's not connected to the rest of the code yet.

Adds the ASSERT() macro to xen/lib/x86/private.h, as it was missing.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4:
  * v1->v2 introduced a bug. lppp must be MIN(0xff, threads_per_pkg).
  * Add missing MIN() when setting p->extd.nc (should've been done in v2)
---
 tools/tests/cpu-policy/test-cpu-policy.c | 133 +++++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     |  16 +++
 xen/lib/x86/policy.c                     |  88 +++++++++++++++
 xen/lib/x86/private.h                    |   4 +
 4 files changed, 241 insertions(+)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 301df2c00285..849d7cebaa7c 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -650,6 +650,137 @@ static void test_is_compatible_failure(void)
     }
 }
 
+static void test_topo_from_parts(void)
+{
+    static const struct test {
+        unsigned int threads_per_core;
+        unsigned int cores_per_pkg;
+        struct cpu_policy policy;
+    } tests[] = {
+        {
+            .threads_per_core = 3, .cores_per_pkg = 1,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
+                    { .nr_logical = 1, .level = 1, .type = 2, .id_shift = 2, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 1, .cores_per_pkg = 3,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    { .nr_logical = 1, .level = 0, .type = 1, .id_shift = 0, },
+                    { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 7, .cores_per_pkg = 5,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
+                    { .nr_logical = 5, .level = 1, .type = 2, .id_shift = 6, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 2, .cores_per_pkg = 128,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
+                    { .nr_logical = 128, .level = 1, .type = 2,
+                      .id_shift = 8, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 3, .cores_per_pkg = 1,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
+                    { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 1, .cores_per_pkg = 3,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    { .nr_logical = 1, .level = 0, .type = 1, .id_shift = 0, },
+                    { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 7, .cores_per_pkg = 5,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
+                    { .nr_logical = 35, .level = 1, .type = 2, .id_shift = 6, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 2, .cores_per_pkg = 128,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
+                    { .nr_logical = 256, .level = 1, .type = 2,
+                      .id_shift = 8, },
+                },
+            },
+        },
+    };
+
+    printf("Testing topology synthesis from parts:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        struct cpu_policy actual = { .x86_vendor = t->policy.x86_vendor };
+        int rc = x86_topo_from_parts(&actual, t->threads_per_core,
+                                     t->cores_per_pkg);
+
+        if ( rc || memcmp(&actual.topo, &t->policy.topo, sizeof(actual.topo)) )
+        {
+#define TOPO(n, f)  t->policy.topo.subleaf[(n)].f, actual.topo.subleaf[(n)].f
+            fail("FAIL[%d] - '%s %u t/c, %u c/p'\n",
+                 rc,
+                 x86_cpuid_vendor_to_str(t->policy.x86_vendor),
+                 t->threads_per_core, t->cores_per_pkg);
+            printf("  subleaf=%u  expected_n=%u actual_n=%u\n"
+                   "             expected_lvl=%u actual_lvl=%u\n"
+                   "             expected_type=%u actual_type=%u\n"
+                   "             expected_shift=%u actual_shift=%u\n",
+                   0,
+                   TOPO(0, nr_logical),
+                   TOPO(0, level),
+                   TOPO(0, type),
+                   TOPO(0, id_shift));
+
+            printf("  subleaf=%u  expected_n=%u actual_n=%u\n"
+                   "             expected_lvl=%u actual_lvl=%u\n"
+                   "             expected_type=%u actual_type=%u\n"
+                   "             expected_shift=%u actual_shift=%u\n",
+                   1,
+                   TOPO(1, nr_logical),
+                   TOPO(1, level),
+                   TOPO(1, type),
+                   TOPO(1, id_shift));
+#undef TOPO
+        }
+    }
+}
+
 int main(int argc, char **argv)
 {
     printf("CPU Policy unit tests\n");
@@ -667,6 +798,8 @@ int main(int argc, char **argv)
     test_is_compatible_success();
     test_is_compatible_failure();
 
+    test_topo_from_parts();
+
     if ( nr_failures )
         printf("Done: %u failures\n", nr_failures);
     else
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index d26012c6da78..79fdf9045a1b 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -542,6 +542,22 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
+/**
+ * Synthesise topology information in `p` given high-level constraints
+ *
+ * Topology is given in various fields accross several leaves, some of
+ * which are vendor-specific. This function uses the policy itself to
+ * derive such leaves from threads/core and cores/package.
+ *
+ * @param p                   CPU policy of the domain.
+ * @param threads_per_core    threads/core. Doesn't need to be a power of 2.
+ * @param cores_per_package   cores/package. Doesn't need to be a power of 2.
+ * @return                    0 on success; -errno on failure
+ */
+int x86_topo_from_parts(struct cpu_policy *p,
+                        unsigned int threads_per_core,
+                        unsigned int cores_per_pkg);
+
 #endif /* !XEN_LIB_X86_POLICIES_H */
 
 /*
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f033d22785be..72b67b44a893 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,6 +2,94 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
+static unsigned int order(unsigned int n)
+{
+    ASSERT(n); /* clz(0) is UB */
+
+    return 8 * sizeof(n) - __builtin_clz(n);
+}
+
+int x86_topo_from_parts(struct cpu_policy *p,
+                        unsigned int threads_per_core,
+                        unsigned int cores_per_pkg)
+{
+    unsigned int threads_per_pkg = threads_per_core * cores_per_pkg;
+    unsigned int apic_id_size;
+
+    if ( !p || !threads_per_core || !cores_per_pkg )
+        return -EINVAL;
+
+    p->basic.max_leaf = MAX(0xb, p->basic.max_leaf);
+
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
+
+    /* thread level */
+    p->topo.subleaf[0].nr_logical = threads_per_core;
+    p->topo.subleaf[0].id_shift = 0;
+    p->topo.subleaf[0].level = 0;
+    p->topo.subleaf[0].type = 1;
+    if ( threads_per_core > 1 )
+        p->topo.subleaf[0].id_shift = order(threads_per_core - 1);
+
+    /* core level */
+    p->topo.subleaf[1].nr_logical = cores_per_pkg;
+    if ( p->x86_vendor == X86_VENDOR_INTEL )
+        p->topo.subleaf[1].nr_logical = threads_per_pkg;
+    p->topo.subleaf[1].id_shift = p->topo.subleaf[0].id_shift;
+    p->topo.subleaf[1].level = 1;
+    p->topo.subleaf[1].type = 2;
+    if ( cores_per_pkg > 1 )
+        p->topo.subleaf[1].id_shift += order(cores_per_pkg - 1);
+
+    apic_id_size = p->topo.subleaf[1].id_shift;
+
+    /*
+     * Contrary to what the name might seem to imply. HTT is an enabler for
+     * SMP and there's no harm in setting it even with a single vCPU.
+     */
+    p->basic.htt = true;
+    p->basic.lppp = MIN(0xff, threads_per_pkg);
+
+    switch ( p->x86_vendor )
+    {
+    case X86_VENDOR_INTEL: {
+        struct cpuid_cache_leaf *sl = p->cache.subleaf;
+
+        for ( size_t i = 0; sl->type &&
+                            i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
+        {
+            sl->cores_per_package = cores_per_pkg - 1;
+            sl->threads_per_cache = threads_per_core - 1;
+            if ( sl->type == 3 /* unified cache */ )
+                sl->threads_per_cache = threads_per_pkg - 1;
+        }
+        break;
+    }
+
+    case X86_VENDOR_AMD:
+    case X86_VENDOR_HYGON:
+        /* Expose p->basic.lppp */
+        p->extd.cmp_legacy = true;
+
+        /* Clip NC to the maximum value it can hold */
+        p->extd.nc = MIN(0xff, threads_per_pkg - 1);
+
+        /* TODO: Expose leaf e1E */
+        p->extd.topoext = false;
+
+        /*
+         * Clip APIC ID to 8 bits, as that's what high core-count machines do.
+         *
+         * That's what AMD EPYC 9654 does with >256 CPUs.
+         */
+        p->extd.apic_id_size = MIN(8, apic_id_size);
+
+        break;
+    }
+
+    return 0;
+}
+
 int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err)
diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
index 60bb82a400b7..2ec9dbee33c2 100644
--- a/xen/lib/x86/private.h
+++ b/xen/lib/x86/private.h
@@ -4,6 +4,7 @@
 #ifdef __XEN__
 
 #include <xen/bitops.h>
+#include <xen/bug.h>
 #include <xen/guest_access.h>
 #include <xen/kernel.h>
 #include <xen/lib.h>
@@ -17,6 +18,7 @@
 
 #else
 
+#include <assert.h>
 #include <errno.h>
 #include <inttypes.h>
 #include <stdbool.h>
@@ -28,6 +30,8 @@
 
 #include <xen-tools/common-macros.h>
 
+#define ASSERT(x) assert(x)
+
 static inline bool test_bit(unsigned int bit, const void *vaddr)
 {
     const char *addr = vaddr;
-- 
2.34.1


