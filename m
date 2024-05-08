Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D448BFD58
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718782.1121323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaD-0003tx-Dj; Wed, 08 May 2024 12:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718782.1121323; Wed, 08 May 2024 12:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaD-0003o2-7P; Wed, 08 May 2024 12:39:41 +0000
Received: by outflank-mailman (input) for mailman id 718782;
 Wed, 08 May 2024 12:39:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nIi=ML=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s4gaB-0002bO-RN
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:39:39 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 084d133c-0d38-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 14:39:38 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59b097b202so851533466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 05:39:38 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 uj4-20020a170907c98400b00a599f876c28sm5984439ejc.38.2024.05.08.05.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 05:39:37 -0700 (PDT)
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
X-Inumbo-ID: 084d133c-0d38-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715171977; x=1715776777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0aXIfx/yfl8UuSfpAwTUvnGU7Teh/O7MEVINpnauu4=;
        b=hy++ymaiEXPVnLDqM4/WZ9q9u6ujYGhksxMMbxSuutD31RCbpI+RDAX3Q7UhQr26eR
         jz+T/mMiclLsfEp6Nfp9EYnDCS2vZjw0OZTXYXB8Adny3QxVEXr94wcVdkswRyEXevOa
         8ShZHR+sK+VbrQiI0N/a65oktZOpbR335J2z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171977; x=1715776777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0aXIfx/yfl8UuSfpAwTUvnGU7Teh/O7MEVINpnauu4=;
        b=xIeeh5DbkvtGDoDHwRyrwYgGDiCqR8YBk+vWo3lz8ie4XnLX1jpt301q2ZRYuy1vdw
         FiMuzos3WFpd/Z0V9/bFqLfwyuBbrVSEbZyz+GjhGe2lw9qZfsunwb9qaLSZNfU0UXP0
         OQMdwn9Tfn5zGDhGl4cUZA0HlHhO0yH4ydah3Pfryk5pbD/HpHnCXUEKXzT/Sdt2AjqZ
         IW4tBXxecnLKGUqaFPkrhMiN45CzKnUJJzPQAlpikz+p/Gfruod50pG2ra9Sz6o6XxQF
         2LQOGXNFcgtMtlzDmlgqm4GG5nJ9d03GtNK2BhC68lTOklX8C5JQpD64z2/iH2d7LZ++
         9Igw==
X-Gm-Message-State: AOJu0YzQqnxnVooQh7M367Vxg21ru6HHSTy+5HErgzYe/0OwuLm3gfnT
	+COfbgyjsy7QapxNzwC5JxHBSb9yvFTgAOwo9vTlYJKp4R5OQIGKMrDvNHoQsAoO4SiYKm1wmVL
	k
X-Google-Smtp-Source: AGHT+IGPNenRVYdkse7eucd1yFdgEvIk9xBV/nUjri4SqCLroW46G1BK17f6LxgMI3Mu+6BsAJeyxQ==
X-Received: by 2002:a17:906:b7cb:b0:a59:ba18:2fb9 with SMTP id a640c23a62f3a-a59fb9211d3mr151555366b.12.1715171977453;
        Wed, 08 May 2024 05:39:37 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v2 7/8] xen/x86: Derive topologically correct x2APIC IDs from the policy
Date: Wed,  8 May 2024 13:39:26 +0100
Message-Id: <87a2a4589e330472b7260ff6ab513744596a4488.1715102098.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715102098.git.alejandro.vallejo@cloud.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements the helper for mapping vcpu_id to x2apic_id given a valid
topology in a policy. The algo is written with the intention of extending
it to leaves 0x1f and e26 in the future.

Toolstack doesn't set leaf 0xb and the HVM default policy has it cleared,
so the leaf is not implemented. In that case, the new helper just returns
the legacy mapping.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * const-ify the test definitions
  * Cosmetic changes (newline + parameter name in prototype)
---
 tools/tests/cpu-policy/test-cpu-policy.c | 63 ++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     |  2 +
 xen/lib/x86/policy.c                     | 73 ++++++++++++++++++++++--
 3 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 0ba8c418b1b3..82a6aeb23317 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -776,6 +776,68 @@ static void test_topo_from_parts(void)
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
+            .x2apic_id = (35 % 3) | (((35 / 3) % 8)  << 2) | ((35 / 24) << 5),
+        },
+        {
+            .vcpu_id = 96, .threads_per_core = 7, .cores_per_pkg = 3,
+            .x2apic_id = (96 % 7) | (((96 / 7) % 3)  << 3) | ((96 / 21) << 5),
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
+        struct cpu_policy policy = { .x86_vendor = vendors[i] };
+        for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+        {
+            const struct test *t = &tests[i];
+            uint32_t x2apic_id;
+            int rc = x86_topo_from_parts(&policy, t->threads_per_core, t->cores_per_pkg);
+
+            x2apic_id = x86_x2apic_id_from_vcpu_id(&policy, t->vcpu_id);
+            if ( rc || x2apic_id != t->x2apic_id )
+                fail("FAIL[%d] - '%s cpu%u %u t/c %u c/p'. bad x2apic_id: expected=%u actual=%u\n",
+                     rc,
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
@@ -794,6 +856,7 @@ int main(int argc, char **argv)
     test_is_compatible_failure();
 
     test_topo_from_parts();
+    test_x2apic_id_from_vcpu_id_success();
 
     if ( nr_failures )
         printf("Done: %u failures\n", nr_failures);
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f5df18e9f77c..2cbc2726a861 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -545,6 +545,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
 /**
  * Calculates the x2APIC ID of a vCPU given a CPU policy
  *
+ * If the policy lacks leaf 0xb falls back to legacy mapping of apic_id=cpu*2
+ *
  * @param p          CPU policy of the domain.
  * @param id         vCPU ID of the vCPU.
  * @returns x2APIC ID of the vCPU.
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index d033ee5398dd..e498e32f8fd7 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,15 +2,78 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
+static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
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
+    return p->topo.subleaf[lvl].nr_logical / p->topo.subleaf[lvl - 1].nr_logical;
+}
+
 uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
 {
+    uint32_t shift = 0, x2apic_id = 0;
+
+    /* In the absence of topology leaves, fallback to traditional mapping */
+    if ( !p->topo.subleaf[0].type )
+        return id * 2;
+
     /*
-     * TODO: Derive x2APIC ID from the topology information inside `p`
-     *       rather than from vCPU ID. This bodge is a temporary measure
-     *       until all infra is in place to retrieve or derive the initial
-     *       x2APIC ID from migrated domains.
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
+     * NOTE: `topo` is currently derived from leaf 0xb, which is bound to
+     * two levels, but once we track leaves 0x1f (or e26) there will be a
+     * few more. The algorithm is written to cope with that case.
      */
-    return vcpu_id * 2;
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
 }
 
 static unsigned int order(unsigned int n)
-- 
2.34.1


