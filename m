Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A529E9A6E9D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823744.1237854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc7-0000b9-GP; Mon, 21 Oct 2024 15:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823744.1237854; Mon, 21 Oct 2024 15:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc7-0000P1-3k; Mon, 21 Oct 2024 15:46:35 +0000
Received: by outflank-mailman (input) for mailman id 823744;
 Mon, 21 Oct 2024 15:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2uc5-0006wR-BY
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:33 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a477a862-8fc3-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 17:46:31 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9a68480164so419718166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:31 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:30 -0700 (PDT)
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
X-Inumbo-ID: a477a862-8fc3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525590; x=1730130390; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyMILG5xYLAUWZBjTYch+adQ7UE+pZOJc6bGIxa6c/k=;
        b=gbIqMD/LvondHsiZusAleCtxCJ5+HF2niZpv+nnedf0K91XU4zShgsemfSsL4j2W+o
         QZnh2x7hbqEpAJ/O0TtsYia/p3SIWYCiaFBc4DKC5B/NuA5hfDT0fzTSkO0UTfM82e6R
         mpqOio20ZhhFpQVByvMQShUc8pAHb3a25Yf2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525590; x=1730130390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyMILG5xYLAUWZBjTYch+adQ7UE+pZOJc6bGIxa6c/k=;
        b=j+VSmJqo1sKSq5Zdv6va34n71gg5tMVwrZOowZRRuCixfWcqxNuWTxQsMixg4Gs2yt
         c0eZV13/KnTTUqIwjunB9wNYOcqdhucUsP8oV9X06zgzdgTvpZtuxS9pL3z/kezRx/0d
         Y11+9FcahEHUKdss58nKyc7M8YlCrZsyn7MKwaD+k1czieVwfOn4iLv8oMy1gSh9qi2I
         01+XJTBn5SBdXuXLnpw+dWUHiQWnoEdYECASz6An1E/5h2UCkvWG09Kd0m2/VPoqXTXB
         c3WkAPebUeUYUfE+hwP1AEj9CLLZFtTEKDp3ci29hvxPNmo/I8hq/KmOAJR8uNTtdPMm
         2zOQ==
X-Gm-Message-State: AOJu0YwBxKLpuv5LOgwSAw3BeNEnMCrwxf1IRMxcNhSAjy83how1KzsR
	hMIQ7DGF0wa2Q1XUroH/eDBvKRDpE/IgPIsS7K4xHCmIfDclrq7naC3MTZI5Ums2ns66eB3alZK
	W
X-Google-Smtp-Source: AGHT+IEHO+BMoGb02KNxKaz4YLWXtEMPsaSKlJNp8iV78Jnc1cuBBSu1Fy+E5dU4JnuL1X/1iUvnbg==
X-Received: by 2002:a17:907:9629:b0:a99:43b2:417e with SMTP id a640c23a62f3a-a9a69ce1072mr1361128466b.62.1729525590393;
        Mon, 21 Oct 2024 08:46:30 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v7 08/10] xen/x86: Derive topologically correct x2APIC IDs from the policy
Date: Mon, 21 Oct 2024 16:45:58 +0100
Message-ID: <20241021154600.11745-9-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements the helper for mapping vcpu_id to x2apic_id given a valid
topology in a policy. The algo is written with the intention of
extending it to leaves 0x1f and extended 0x26 in the future.

The helper returns the legacy mapping when leaf 0xb is not implemented
(as is the case at the moment).

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v7:
  * Changes to commit message
---
 tools/tests/cpu-policy/test-cpu-policy.c | 68 +++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     | 11 ++++
 xen/lib/x86/policy.c                     | 76 ++++++++++++++++++++++++
 3 files changed, 155 insertions(+)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 849d7cebaa7c..e5f9b8f7ee39 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -781,6 +781,73 @@ static void test_topo_from_parts(void)
     }
 }
 
+static void test_x2apic_id_from_vcpu_id_success(void)
+{
+    static const struct test {
+        unsigned int vcpu_id;
+        unsigned int threads_per_core;
+        unsigned int cores_per_pkg;
+        uint32_t x2apic_id;
+        uint8_t x86_vendor;
+    } tests[] = {
+        {
+            .vcpu_id = 3, .threads_per_core = 3, .cores_per_pkg = 8,
+            .x2apic_id = 1 << 2,
+        },
+        {
+            .vcpu_id = 6, .threads_per_core = 3, .cores_per_pkg = 8,
+            .x2apic_id = 2 << 2,
+        },
+        {
+            .vcpu_id = 24, .threads_per_core = 3, .cores_per_pkg = 8,
+            .x2apic_id = 1 << 5,
+        },
+        {
+            .vcpu_id = 35, .threads_per_core = 3, .cores_per_pkg = 8,
+            .x2apic_id = (35 % 3) | (((35 / 3) % 8) << 2) | ((35 / 24) << 5),
+        },
+        {
+            .vcpu_id = 96, .threads_per_core = 7, .cores_per_pkg = 3,
+            .x2apic_id = (96 % 7) | (((96 / 7) % 3) << 3) | ((96 / 21) << 5),
+        },
+    };
+
+    const uint8_t vendors[] = {
+        X86_VENDOR_INTEL,
+        X86_VENDOR_AMD,
+        X86_VENDOR_CENTAUR,
+        X86_VENDOR_SHANGHAI,
+        X86_VENDOR_HYGON,
+    };
+
+    printf("Testing x2apic id from vcpu id success:\n");
+
+    /* Perform the test run on every vendor we know about */
+    for ( size_t i = 0; i < ARRAY_SIZE(vendors); ++i )
+    {
+        for ( size_t j = 0; j < ARRAY_SIZE(tests); ++j )
+        {
+            struct cpu_policy policy = { .x86_vendor = vendors[i] };
+            const struct test *t = &tests[j];
+            uint32_t x2apic_id;
+            int rc = x86_topo_from_parts(&policy, t->threads_per_core,
+                                         t->cores_per_pkg);
+
+            if ( rc ) {
+                fail("FAIL[%d] - 'x86_topo_from_parts() failed", rc);
+                continue;
+            }
+
+            x2apic_id = x86_x2apic_id_from_vcpu_id(&policy, t->vcpu_id);
+            if ( x2apic_id != t->x2apic_id )
+                fail("FAIL - '%s cpu%u %u t/c %u c/p'. bad x2apic_id: expected=%u actual=%u\n",
+                     x86_cpuid_vendor_to_str(policy.x86_vendor),
+                     t->vcpu_id, t->threads_per_core, t->cores_per_pkg,
+                     t->x2apic_id, x2apic_id);
+        }
+    }
+}
+
 int main(int argc, char **argv)
 {
     printf("CPU Policy unit tests\n");
@@ -799,6 +866,7 @@ int main(int argc, char **argv)
     test_is_compatible_failure();
 
     test_topo_from_parts();
+    test_x2apic_id_from_vcpu_id_success();
 
     if ( nr_failures )
         printf("Done: %u failures\n", nr_failures);
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 67d16fda933d..61d5cf3c7f12 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -542,6 +542,17 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
+/**
+ * Calculates the x2APIC ID of a vCPU given a CPU policy
+ *
+ * If the policy lacks leaf 0xb falls back to legacy mapping of apic_id=cpu*2
+ *
+ * @param p          CPU policy of the domain.
+ * @param id         vCPU ID of the vCPU.
+ * @returns x2APIC ID of the vCPU.
+ */
+uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id);
+
 /**
  * Synthesise topology information in `p` given high-level constraints
  *
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index 5ff89022e901..427a90f907a2 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,6 +2,82 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
+static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p,
+                                              size_t lvl)
+{
+    /*
+     * `nr_logical` reported by Intel is the number of THREADS contained in
+     * the next topological scope. For example, assuming a system with 2
+     * threads/core and 3 cores/module in a fully symmetric topology,
+     * `nr_logical` at the core level will report 6. Because it's reporting
+     * the number of threads in a module.
+     *
+     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
+     * level (cores/complex, etc) so we can return it as-is.
+     */
+    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
+        return p->topo.subleaf[lvl].nr_logical;
+
+    return p->topo.subleaf[lvl].nr_logical /
+           p->topo.subleaf[lvl - 1].nr_logical;
+}
+
+uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
+{
+    uint32_t shift = 0, x2apic_id = 0;
+
+    /* In the absence of topology leaves, fallback to traditional mapping */
+    if ( !p->topo.subleaf[0].type )
+        return id * 2;
+
+    /*
+     * `id` means different things at different points of the algo
+     *
+     * At lvl=0: global thread_id (same as vcpu_id)
+     * At lvl=1: global core_id
+     * At lvl=2: global socket_id (actually complex_id in AMD, module_id
+     *                             in Intel, but the name is inconsequential)
+     *
+     *                 +--+
+     *            ____ |#0| ______           <= 1 socket
+     *           /     +--+       \+--+
+     *       __#0__              __|#1|__    <= 2 cores/socket
+     *      /   |  \        +--+/  +-|+  \
+     *    #0   #1   #2      |#3|    #4    #5 <= 3 threads/core
+     *                      +--+
+     *
+     * ... and so on. Global in this context means that it's a unique
+     * identifier for the whole topology, and not relative to the level
+     * it's in. For example, in the diagram shown above, we're looking at
+     * thread #3 in the global sense, though it's #0 within its core.
+     *
+     * Note that dividing a global thread_id by the number of threads per
+     * core returns the global core id that contains it. e.g: 0, 1 or 2
+     * divided by 3 returns core_id=0. 3, 4 or 5 divided by 3 returns core
+     * 1, and so on. An analogous argument holds for higher levels. This is
+     * the property we exploit to derive x2apic_id from vcpu_id.
+     *
+     * NOTE: `topo` is currently derived from leaf 0xb, which is bound to two
+     * levels, but once we track leaves 0x1f (or extended 0x26) there will be a
+     * few more. The algorithm is written to cope with that case.
+     */
+    for ( uint32_t i = 0; i < ARRAY_SIZE(p->topo.raw); i++ )
+    {
+        uint32_t nr_parts;
+
+        if ( !p->topo.subleaf[i].type )
+            /* sentinel subleaf */
+            break;
+
+        nr_parts = parts_per_higher_scoped_level(p, i);
+        x2apic_id |= (id % nr_parts) << shift;
+        id /= nr_parts;
+        shift = p->topo.subleaf[i].id_shift;
+    }
+
+    return (id << shift) | x2apic_id;
+}
+
 static unsigned int order(unsigned int n)
 {
     ASSERT(n); /* clz(0) is UB */
-- 
2.47.0


