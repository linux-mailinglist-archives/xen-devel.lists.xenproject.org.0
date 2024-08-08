Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E4894BEC7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774243.1184747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3WA-00015q-GZ; Thu, 08 Aug 2024 13:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774243.1184747; Thu, 08 Aug 2024 13:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3WA-000130-Dp; Thu, 08 Aug 2024 13:49:26 +0000
Received: by outflank-mailman (input) for mailman id 774243;
 Thu, 08 Aug 2024 13:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Q1-0003nA-O9
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:43:05 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22c5ab56-558c-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:43:04 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7aada2358fso328243066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:43:04 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:43:02 -0700 (PDT)
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
X-Inumbo-ID: 22c5ab56-558c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124583; x=1723729383; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wbk4E5P0kulzM2wSMHSR18a7piPnaRZHfCu+Ysmfmt4=;
        b=Vezwjd1OAaajGk0hgeWszFZZNxyrHT+FUhAzwfVftZqV7m+mPdHzdFfaNtrKVlQNpt
         n6I0dXT8iB9pfRTymiQg0Zntbj6OV98diLqnMsQ/DrP+4DZxJNVofE/vOoPAJ4EkZG/u
         4gsAbiJ/6yEvlIlfaKhbM0vBefI23AZQTLZ4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124583; x=1723729383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wbk4E5P0kulzM2wSMHSR18a7piPnaRZHfCu+Ysmfmt4=;
        b=DJetY6PAcL3/OxFaVWB+D+cUNRtnhBjY7hYCXIS2DjlHfZjm+MXhr+VB5lsxURFCVS
         ruzkiE82gJDGSet7FbwERVFdbtd1xRy1copUQ8LSiSvazBP7KyfR5O9Ai5OxurynifOb
         aTma1fIiYSo60w6wrOYXhcmjAnx6db/gH+bMp/pJhTSC58887dmuG9crkXKUcO9yBQMe
         LCa3jFIPN8MDcUQ7HuYeIHOO5ykpfSovw5R8ms05lCLo1eULlOEMWdhlvT0p1W/BboGU
         mYW2I1+3mhr2x1qLPCI/TRcC7PECAzCvOCIgEWdx6JOjGEVqsjmEGjOr8NNTr31gg5Iq
         rIzw==
X-Gm-Message-State: AOJu0YywGG0sYQCVbuXj6pHkR5IBSu/MMCApzpbiyGMDP8/+Q+I003Mm
	3dv9f4WdMclaY4gyE1SZ9Ms+02f+ov7y4yU9Lglc63efj9glkSgEeBJ7GpcbofEu3s7g1cc92IB
	7
X-Google-Smtp-Source: AGHT+IE0yJNfLnzySYuMbL3cadc4rLxRuYKuQaRCOF3SC9X6o2prHqvwFzO9s1qBDqzl+YHKKvh+lA==
X-Received: by 2002:a17:907:9446:b0:a7a:87c1:26c4 with SMTP id a640c23a62f3a-a8091f5684dmr143181766b.17.1723124582978;
        Thu, 08 Aug 2024 06:43:02 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 07/10] xen/lib: Add topology generator for x86
Date: Thu,  8 Aug 2024 14:42:47 +0100
Message-ID: <20240808134251.29995-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper to populate topology leaves in the cpu policy from
threads/core and cores/package counts. It's unit-tested in
test-cpu-policy.c,
but it's not connected to the rest of the code yet.

Adds the ASSERT() macro to xen/lib/x86/private.h, as it was missing.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v5:
  * No change
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
index f43e1a3b21e9..116b305a1d7f 100644
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
2.45.2


