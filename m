Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186648BFD55
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718781.1121318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaD-0003nT-2W; Wed, 08 May 2024 12:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718781.1121318; Wed, 08 May 2024 12:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaC-0003e7-PA; Wed, 08 May 2024 12:39:40 +0000
Received: by outflank-mailman (input) for mailman id 718781;
 Wed, 08 May 2024 12:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nIi=ML=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s4gaB-0002b0-JQ
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:39:39 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07d48e6c-0d38-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 14:39:37 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a599af16934so1088765366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 05:39:37 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 uj4-20020a170907c98400b00a599f876c28sm5984439ejc.38.2024.05.08.05.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 05:39:36 -0700 (PDT)
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
X-Inumbo-ID: 07d48e6c-0d38-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715171976; x=1715776776; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgVeKZJJDa3o9g7T6dDnYuOFXwdr65sevSfeNvtvPGo=;
        b=etWXzobbzyIV+PYTlgoFsqPJR87wtyO1yzhz3f4p0KmYMPG9K5A7Uxa48fMhw0EV11
         jO+fBxW4Ek+DZbfehXsbLfea3sEGdi4G9skI0477CdibcRncQLkF1wXkMOlXYG9NsPCN
         R0j8z4R5Pz1CHU5+KZOffZGtY3kLq7RTP8L+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171976; x=1715776776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgVeKZJJDa3o9g7T6dDnYuOFXwdr65sevSfeNvtvPGo=;
        b=nYXNkLse6kNyy++hyhJAetq8DWk+uqSKA+pCVxW0oKOAqYuw09Wjx3+94YErGFCqvv
         9SYxZc6ByE0/Qpzo7VFmO0DZ+ss8cOEEZlaMAh6DQnjMp7obrdXX7k3HmtPm4ev47BDf
         M8EeS5Wp351slQpP/olKQQ59RtlORtsllqhAnZZ38Yf/k1pPLqgTi30Ya0DVlN3dLw9b
         3ftnIJHLitJGExOHuzgcCXihCE9X0JWboii3TbUyT8YguGrvDgchk5DiKI4OHMIfrafl
         SfKBYOZg+7C6uQ9/DiUbpmhpzo6Pe69CgW8VpqLC29r7e57EdtpljANOHBZenYVD4h8d
         7GXg==
X-Gm-Message-State: AOJu0Yz1Ad8oVZIS2hPUMFZBA2rJNeBTLJCkT9qE9VEKObC9UlIy5xLz
	qDwP6nnqhcJV929G5dU/GS7AnWa6q24oLGFK5WmsPb3oItN/qK655l2T+9YltiXfv+6E1OaomlC
	S
X-Google-Smtp-Source: AGHT+IEjhEqD6jSzOOxN3SFf1hIWRaJ0vLeIkZb+dYtRv4xOorgZ2g2626xib1oqp8QwkOANeImtag==
X-Received: by 2002:a17:906:3901:b0:a52:65bd:a19a with SMTP id a640c23a62f3a-a59fb9d6462mr167510066b.57.1715171976633;
        Wed, 08 May 2024 05:39:36 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v2 6/8] xen/lib: Add topology generator for x86
Date: Wed,  8 May 2024 13:39:25 +0100
Message-Id: <1ffad529d7fed10381df67215c747fc2d69f805e.1715102098.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715102098.git.alejandro.vallejo@cloud.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper to populate topology leaves in the cpu policy from
threads/core and cores/package counts.

No functional change, as it's not connected to anything yet.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * New patch. Extracted from v1/patch6
---
 tools/tests/cpu-policy/test-cpu-policy.c | 128 +++++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     |  16 +++
 xen/lib/x86/policy.c                     |  86 +++++++++++++++
 3 files changed, 230 insertions(+)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 301df2c00285..0ba8c418b1b3 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -650,6 +650,132 @@ static void test_is_compatible_failure(void)
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
+                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 1, .level = 1, .type = 2, .id_shift = 2, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 1, .cores_per_pkg = 3,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 1, .level = 0, .type = 1, .id_shift = 0, },
+                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 7, .cores_per_pkg = 5,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
+                    [1] = { .nr_logical = 5, .level = 1, .type = 2, .id_shift = 6, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 2, .cores_per_pkg = 128,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
+                    [1] = { .nr_logical = 128, .level = 1, .type = 2, .id_shift = 8, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 3, .cores_per_pkg = 1,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 1, .cores_per_pkg = 3,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 1, .level = 0, .type = 1, .id_shift = 0, },
+                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 2, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 7, .cores_per_pkg = 5,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
+                    [1] = { .nr_logical = 35, .level = 1, .type = 2, .id_shift = 6, },
+                },
+            },
+        },
+        {
+            .threads_per_core = 2, .cores_per_pkg = 128,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 2, .level = 0, .type = 1, .id_shift = 1, },
+                    [1] = { .nr_logical = 256, .level = 1, .type = 2, .id_shift = 8, },
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
+        int rc = x86_topo_from_parts(&actual, t->threads_per_core, t->cores_per_pkg);
+
+        if ( rc || memcmp(&actual.topo, &t->policy.topo, sizeof(actual.topo)) )
+        {
+#define TOPO(n) topo.subleaf[(n)]
+            fail("FAIL[%d] - '%s %u t/c, %u c/p'\n",
+                 rc,
+                 x86_cpuid_vendor_to_str(t->policy.x86_vendor),
+                 t->threads_per_core, t->cores_per_pkg);
+            printf("  subleaf=%u  expected_n=%u actual_n=%u\n"
+                   "             expected_lvl=%u actual_lvl=%u\n"
+                   "             expected_type=%u actual_type=%u\n"
+                   "             expected_shift=%u actual_shift=%u\n",
+                   0, t->policy.TOPO(0).nr_logical, actual.TOPO(0).nr_logical,
+                      t->policy.TOPO(0).level,      actual.TOPO(0).level,
+                      t->policy.TOPO(0).type,       actual.TOPO(0).type,
+                      t->policy.TOPO(0).id_shift,   actual.TOPO(0).id_shift);
+
+            printf("  subleaf=%u  expected_n=%u actual_n=%u\n"
+                   "             expected_lvl=%u actual_lvl=%u\n"
+                   "             expected_type=%u actual_type=%u\n"
+                   "             expected_shift=%u actual_shift=%u\n",
+                   1, t->policy.TOPO(1).nr_logical, actual.TOPO(1).nr_logical,
+                      t->policy.TOPO(1).level,      actual.TOPO(1).level,
+                      t->policy.TOPO(1).type,       actual.TOPO(1).type,
+                      t->policy.TOPO(1).id_shift,   actual.TOPO(1).id_shift);
+#undef TOPO
+        }
+    }
+}
+
 int main(int argc, char **argv)
 {
     printf("CPU Policy unit tests\n");
@@ -667,6 +793,8 @@ int main(int argc, char **argv)
     test_is_compatible_success();
     test_is_compatible_failure();
 
+    test_topo_from_parts();
+
     if ( nr_failures )
         printf("Done: %u failures\n", nr_failures);
     else
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 392320b9adbe..f5df18e9f77c 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -551,6 +551,22 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
  */
 uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id);
 
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
index 4cef658feeb8..d033ee5398dd 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -13,6 +13,92 @@ uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
     return vcpu_id * 2;
 }
 
+static unsigned int order(unsigned int n)
+{
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
+    p->basic.lppp = MIN(0xff, p->basic.lppp);
+
+    switch ( p->x86_vendor )
+    {
+        case X86_VENDOR_INTEL: {
+            struct cpuid_cache_leaf *sl = p->cache.subleaf;
+            for ( size_t i = 0; sl->type &&
+                                i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
+            {
+                sl->cores_per_package = cores_per_pkg - 1;
+                sl->threads_per_cache = threads_per_core - 1;
+                if ( sl->type == 3 /* unified cache */ )
+                    sl->threads_per_cache = threads_per_pkg - 1;
+            }
+            break;
+        }
+        case X86_VENDOR_AMD:
+        case X86_VENDOR_HYGON:
+            /* Expose p->basic.lppp */
+            p->extd.cmp_legacy = true;
+
+            /* Clip NC to the maximum value it can hold */
+            p->extd.nc = 0xff;
+            if ( threads_per_pkg <= 0xff )
+                p->extd.nc = threads_per_pkg - 1;
+
+            /* TODO: Expose leaf e1E */
+            p->extd.topoext = false;
+
+            /*
+             * Clip APIC ID to 8 bits, as that's what high core-count machines do
+             *
+             * That what AMD EPYC 9654 does with >256 CPUs
+             */
+            p->extd.apic_id_size = MIN(8, apic_id_size);
+
+            break;
+    }
+
+    return 0;
+}
+
 int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err)
-- 
2.34.1


