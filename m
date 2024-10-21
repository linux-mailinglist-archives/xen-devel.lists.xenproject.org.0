Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A69A6E99
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823741.1237845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc6-0000Jh-8V; Mon, 21 Oct 2024 15:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823741.1237845; Mon, 21 Oct 2024 15:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc6-00008K-0M; Mon, 21 Oct 2024 15:46:34 +0000
Received: by outflank-mailman (input) for mailman id 823741;
 Mon, 21 Oct 2024 15:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2uc4-0006wR-BN
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:32 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a407dd8c-8fc3-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 17:46:30 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-539f2b95775so5435340e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:30 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:29 -0700 (PDT)
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
X-Inumbo-ID: a407dd8c-8fc3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525590; x=1730130390; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+0Jbu2kh7Cn4CCRfH/8q2upu7Cfme230B9kVzgUhq8=;
        b=PhSZxRjenbKet4mSJFH9t5Jb128DCXflavWSQy3ynGzQLw6p7YhS3JtMjTBX4WNRkY
         CYyvqXwXVfIzdZ6mxzsAtp+PZP51dCoMbms0yt5pJqn5g0FFUIZToe3fBWf0toAoLAig
         /mVUhcA0bIjs0pbMwpVi4tmilxy9e3ekfQh98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525590; x=1730130390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+0Jbu2kh7Cn4CCRfH/8q2upu7Cfme230B9kVzgUhq8=;
        b=ZZKkaGGMJHLiqduhIrP3h2LvoJ2qcbkijNgAYk14pXowwiEooFy+PUvvq8/9X0GYbl
         eoHTpQlI14xUZdfNVPxaG2PnZmFiNoN53U1mwuwMnkCueeYgvc+tLvPh9dfcspgTAUyz
         MlAgyYt7XW6A0S63LJNqp7+BMncPoXSJqhHtlJJRAktgPyj3PWSqf4odEQ9SrnJJsNd6
         aTraI/753tiYSMVRweDneOWFWIKh0cfj2bmDRBpUM+JmLS1VepOrvBQoffqspyws6dZa
         QgJhQDMAq0UOv5QR1R0kpgJnvLJACUATPku/b1kZliOedEta/JSiHM99OxkY8KY7cDYX
         bi8g==
X-Gm-Message-State: AOJu0YxU8HpjjzrzRbrT3XJAEYiGooWywl8Jvoy/ch7TlAc9h2zI5FQj
	/fVh0Xv35gNULV+WwF9DSnNCjfsPuUTLQjR46XZ3wki+YlrmN88wbSRwhY4yrzwSPZHps8Qi7D1
	5
X-Google-Smtp-Source: AGHT+IHXZ1CnR00lcFsoJkWHss8JP3iG6PSkfzvmmszq9athvUFwwflQJ2IXTTXzwW2fFJl3M3ZsZg==
X-Received: by 2002:a05:6512:3ca7:b0:531:8f2f:8ae7 with SMTP id 2adb3069b0e04-53a1545dfcbmr9958279e87.25.1729525589641;
        Mon, 21 Oct 2024 08:46:29 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v7 07/10] xen/lib: Add topology generator for x86
Date: Mon, 21 Oct 2024 16:45:57 +0100
Message-ID: <20241021154600.11745-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper to populate topology leaves in the cpu policy from
threads/core and cores/package counts. It's unit-tested in
test-cpu-policy.c, but it's not connected to the rest of the code yet.

Intel's cache leaves (CPUID[4]) have limited width for core counts, so
(in the absence of real world data for how it might behave) this
implementation takes the view that those counts should clip to their
maximum values on overflow. Just like lppp and NC.

Adds the ASSERT() macro to xen/lib/x86/private.h, as it was missing.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v7:
  * MAX/MIN -> max/min; adding U suffixes to literals for type-matching
    and uppercases for MISRA compliance.
  * Clip core counts in cache leaves to their maximum values
  * Remove unified cache conditional. Less code, and less likely for the
    threads_per_cache field to clip.
  * Add extra check to ensure threads_per_pkg fit in 16 bits (which is
    the space they have in leaf 0xb.
  * Add extra check to detect overflow in threads_per_pkg calculation.
  * Reworked the comment for the topo generator, expressing more clearly
    what are inputs and what are outputs.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 133 +++++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     |  16 +++
 xen/lib/x86/policy.c                     |  93 ++++++++++++++++
 xen/lib/x86/private.h                    |   4 +
 4 files changed, 246 insertions(+)

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
index f43e1a3b21e9..67d16fda933d 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -542,6 +542,22 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
+/**
+ * Synthesise topology information in `p` given high-level constraints
+ *
+ * Topology is expressed in various fields accross several leaves, some of
+ * which are vendor-specific. This function populates such fields given
+ * threads/core, cores/package and other existing policy fields.
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
index f033d22785be..5ff89022e901 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,6 +2,99 @@
 
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
+    /*
+     * threads_per_pkg must fit in 16bits to avoid overflowing
+     * nr_logical in leaf 0xb on Intel systems.
+     */
+    if ( !p || !threads_per_core || !cores_per_pkg ||
+         threads_per_pkg > UINT16_MAX ||
+         threads_per_pkg / cores_per_pkg != threads_per_core )
+        return -EINVAL;
+
+    p->basic.max_leaf = max(0xBU, p->basic.max_leaf);
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
+    p->basic.lppp = min(0xFFU, threads_per_pkg);
+
+    switch ( p->x86_vendor )
+    {
+    case X86_VENDOR_INTEL: {
+        struct cpuid_cache_leaf *sl = p->cache.subleaf;
+
+        for ( size_t i = 0; sl->type &&
+                            i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
+        {
+            /* Clip these values to their max if they overflow */
+            sl->cores_per_package = min(63U, cores_per_pkg - 1);
+            sl->threads_per_cache = min(4095U, threads_per_core - 1);
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
+        p->extd.nc = min(0xFFU, threads_per_pkg - 1);
+
+        /* TODO: Expose leaf e1E */
+        p->extd.topoext = false;
+
+        /*
+         * Clip APIC ID to 8 bits, as that's what high core-count machines do.
+         *
+         * That's what AMD EPYC 9654 does with >256 CPUs.
+         */
+        p->extd.apic_id_size = min(8U, apic_id_size);
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
2.47.0


