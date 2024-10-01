Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305A598BC49
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808074.1219931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9K-0004gi-5t; Tue, 01 Oct 2024 12:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808074.1219931; Tue, 01 Oct 2024 12:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9J-0004Yf-T0; Tue, 01 Oct 2024 12:38:41 +0000
Received: by outflank-mailman (input) for mailman id 808074;
 Tue, 01 Oct 2024 12:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9G-0002vk-7t
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:38 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14728a14-7ff2-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 14:38:37 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c89bdb9019so2448858a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:37 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:36 -0700 (PDT)
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
X-Inumbo-ID: 14728a14-7ff2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786316; x=1728391116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0GTGzwtafoymMbnFaFTF4qE2IIeqafzC6RojYeuQKU=;
        b=AwiOS6qOydFTRHg9bXtAWrwaEWPgF+IjbmwKHWbkEXaUYTo9grNcGEaJJYEJDmD1EB
         0tx6iKHiUn6cipPyuCetJn4aYk1st9mIVIWhWqXP/O9a10k7l7kxMM25ZDdwpBJxnmD2
         BE02nwmLi488m2BaEOeYXx1x8pQONGklPUVPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786316; x=1728391116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0GTGzwtafoymMbnFaFTF4qE2IIeqafzC6RojYeuQKU=;
        b=YgIHWBCDSsH2vq2LW3q+nsRY7nYbBx/uD47/6dG8KkjrDvg4QmuPSEvRQ10ezVqpok
         k+Eq0TsPXJXd7xyim4iSUdV4SLACPAW1Jy38nHQ9T2yZJfGdZjg4nTGIJeBCK4pJhmXB
         Zmt/cT9dX8siidW8pVyENlOWsiOLftDrJluDdEQnYCJyQryJ/VKx6OnfQCVkxi87d/aQ
         mlrywDIXcVkHnIHhc+0gMQbLPcuUulsH4JlQEgEBlQZ8hwZcKLNE2wEXWWqK7q6oU9RH
         oeeePA3WadzEPcHK8UrkfrrazOSE/PSJAUO9teYWuWZgomrDQ9j3tVkyATQ7ouLIL2TO
         9aEw==
X-Gm-Message-State: AOJu0YyZ7p31FyhP881H87HjulOqZdD6E1AteK7crd/qTO2Bar+sUjHT
	MUKmvmhz717rXpGGg2pooPktFENs0MbYKcCyCBLfZfb1FWiFgqWFOtEd0IjPusD2OShmaw3gEcm
	fTeY=
X-Google-Smtp-Source: AGHT+IGWrWoMczYC8L5QGRHinswuT9xtxfIlrvUWsBpMhVKDaFNgWGraiocX4r5UXEHrGxfyPE6g9A==
X-Received: by 2002:a50:951a:0:b0:5c8:81bd:ac90 with SMTP id 4fb4d7f45d1cf-5c8825fd826mr11229511a12.27.1727786316561;
        Tue, 01 Oct 2024 05:38:36 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 08/11] xen/lib: Add topology generator for x86
Date: Tue,  1 Oct 2024 13:38:04 +0100
Message-ID: <20241001123807.605-9-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper to populate topology leaves in the cpu policy from
threads/core and cores/package counts. It's unit-tested in
test-cpu-policy.c,
but it's not connected to the rest of the code yet.

Adds the ASSERT() macro to xen/lib/x86/private.h, as it was missing.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/tests/cpu-policy/test-cpu-policy.c | 133 +++++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     |  16 +++
 xen/lib/x86/policy.c                     |  88 +++++++++++++++
 xen/lib/x86/private.h                    |   4 +
 4 files changed, 241 insertions(+)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 9216010b1c5d..870f7ecee0e5 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -654,6 +654,137 @@ static void test_is_compatible_failure(void)
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
@@ -671,6 +802,8 @@ int main(int argc, char **argv)
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
index 63bc96451d2c..16b09a427841 100644
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
2.46.0


