Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96208918759
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749276.1157377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVr-0007uC-NF; Wed, 26 Jun 2024 16:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749276.1157377; Wed, 26 Jun 2024 16:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVr-0007pH-G8; Wed, 26 Jun 2024 16:28:51 +0000
Received: by outflank-mailman (input) for mailman id 749276;
 Wed, 26 Jun 2024 16:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVp-0005pK-Sm
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:49 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a480a84-33d9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:28:48 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52ce9ba0cedso4525241e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:48 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:47 -0700 (PDT)
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
X-Inumbo-ID: 2a480a84-33d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419327; x=1720024127; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYHRDHK5UDpTmTiIq7osG/ZblShK9KE6SHig+ML+kuw=;
        b=GBrmuotwVwjrUTe09bHDOlqWVGDWDmSJlfHT8uZVpuMKQIfXggwkZ7DldGGlbb1qLk
         hheWaXHf5NOp0MPspObzqxsJyB9aI0ocJJvciccQo5qpmuVbqU7JDYTCp4KUFeoLqWn0
         Z+CRjREoe5tqL8PUfK4BLGVG9glDZTAFC10iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419327; x=1720024127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYHRDHK5UDpTmTiIq7osG/ZblShK9KE6SHig+ML+kuw=;
        b=VMqzYsoWX1cmWAhGfrvUGu0BzVZbcAjXGBgW86hb1Rho0IGxQ8+4AaSm7hHPf9V9hr
         BFwKISl3PcocnyFYpRMmmLvJEGjqH/3xSQSkZsYa6qHP3P4T93gbL2AGB8z7Kmz3r69o
         DG+Km8uOonsr/DF62T3BfNfEETzMXLfEii39jfLWkoZhO0eY9L9v+NM3Sy0t7PA87Ie7
         YSteMNyzipxEP1Cetqd46nQix8ANsKNKANtmK9dp9RvahbMxNAx3lClkGjc5G6dg9ji0
         Ou8FFhzzECy0+IPJWG4CSUV6E7bUzrKfmaUxKpWf98We//Y/58t+ruFLUBzUrMgS8HTN
         bdXQ==
X-Gm-Message-State: AOJu0YwhMcc8bwQXVXw6PD1Cws0MFCmtTknjAp0uKbUgjP9JURFGvJ/U
	2ygWwTtRcdKqNwUizRY8FXk8vZEee37KhLkoiOKR0wlr317G1bh02ZXoWdme00nDzlAfKDq+cgY
	n4Zo=
X-Google-Smtp-Source: AGHT+IG3ALNl7GrDyAkGeat0PBA151FCdB5bzNb5KBoFoIZgPdmSqsTu6xRbFtJlJR/ERWDh3LdMSQ==
X-Received: by 2002:ac2:4c8c:0:b0:52c:9ae0:beed with SMTP id 2adb3069b0e04-52ce18526ecmr8127045e87.52.1719419327515;
        Wed, 26 Jun 2024 09:28:47 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 08/10] xen/x86: Derive topologically correct x2APIC IDs from the policy
Date: Wed, 26 Jun 2024 17:28:35 +0100
Message-Id: <b060f84d5119e537c77a8f0f42f16d3d8e1875fd.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719416329.git.alejandro.vallejo@cloud.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements the helper for mapping vcpu_id to x2apic_id given a valid
topology in a policy. The algo is written with the intention of extending
it to leaves 0x1f and extended 0x26 in the future.

Toolstack doesn't set leaf 0xb and the HVM default policy has it cleared,
so the leaf is not implemented. In that case, the new helper just returns
the legacy mapping.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2->v4 (v3 was not reviewed):
  * Rewrite eXX notation for CPUID leaves as "extended XX"
  * Newlines and linewraps
  * In the unit-test, reduce the scope of `policy`
  * In the unit-test, fail if topology generation fails.
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
index 79fdf9045a1b..d545d4727711 100644
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
index 72b67b44a893..c52b7192559a 100644
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
2.34.1


