Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F0E8D3952
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732087.1137954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKMF-0001ST-24; Wed, 29 May 2024 14:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732087.1137954; Wed, 29 May 2024 14:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKME-0001LK-O2; Wed, 29 May 2024 14:32:50 +0000
Received: by outflank-mailman (input) for mailman id 732087;
 Wed, 29 May 2024 14:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCKMD-0000Tu-GG
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:32:49 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ceb76e-1dc8-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:32:47 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so274373666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:32:47 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a647b827400sm74614166b.69.2024.05.29.07.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:32:46 -0700 (PDT)
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
X-Inumbo-ID: 51ceb76e-1dc8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716993167; x=1717597967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgRshC8PIUKcDrs5c2zLkCCg7umtJyxW/HyRPKfHKPk=;
        b=OJkv0CUzDkTO2zcH2V3p4wXROqFdWmjNnd/tcAg3wzx5XrwIVaF31S2tKAp88xrCDM
         XckDpv4J2JQZTpvY+9kXcQ3ErfAzC2i8zafdcSN8itjCEoVmV/aZsH4B9wnIDsNLrCJF
         IPdmsdgLJf2ZmeqVPcYGVgFY2Kv9F0n9iq6Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993167; x=1717597967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgRshC8PIUKcDrs5c2zLkCCg7umtJyxW/HyRPKfHKPk=;
        b=OK+iFZ4wQ6NyTvKPCkaTm27zOj0zEHszbxdwXMRggIlVZkNk1D2aIHZ+ZqI7L+ToyS
         2+BQ3fkBQ5ukApKe4n6PEHRLVG53NSWYFTXkfgE2s2VTFykLPqrjQ9DmQLoh0Ax6Eg6y
         lxvykrRRKjMMNWYoR786xZgi2LNJ3ey/w8r94tNabg7aG/qPicVkps4cfKra3v2kgMbS
         mlRF53a20mhWkTJPfzeGp9BjSgjGvL0c8zxet+DnVNvyXqlBF98lZ1ORrP9BxZbklhD7
         kDQYJpFKV/SYWMjNwpm8pOg/HvvHtsN8TghGdT2Aj2vCY654G+y49VUIGRYTDICquZ2a
         aMlw==
X-Gm-Message-State: AOJu0YwdnGsnNEkDJVfMBJE/edB41FS5ob7jW6TaazKuh7alurzrNDyO
	uSsLUXsnzwY8wKslXEZ86NE7hO6sNA0/3x2lNCv/X+CM8xYPAjWk0s9ClTDAtdLcQTvlKrxjL/d
	x
X-Google-Smtp-Source: AGHT+IGjD11cLXk8jwlNmuLmPdqqildXHoRCJVxhX1JxaCN4sTVT/mV9v7sxuuC1d7V1axehTvoTqg==
X-Received: by 2002:a17:906:888:b0:a59:bc75:5000 with SMTP id a640c23a62f3a-a62642da520mr1056775166b.12.1716993166772;
        Wed, 29 May 2024 07:32:46 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v3 5/6] xen/x86: Derive topologically correct x2APIC IDs from the policy
Date: Wed, 29 May 2024 15:32:34 +0100
Message-Id: <d3f016ebd656402f5b40cf55a51a7f970e6e69ec.1716976271.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716976271.git.alejandro.vallejo@cloud.com>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
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
v3:
  * Formatting adjustments.
  * Replace a conditional in x86_topo_from_parts() with MIN()
    * Was meant to happen in v2, but fell between the cracks.
  * Moved the `policy` variable to the inner scope so it's clean for every test.
  * Rewrote commit message to say "extended 0x26" rather than e26.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 68 ++++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     |  2 +
 xen/lib/x86/policy.c                     | 73 ++++++++++++++++++++++--
 3 files changed, 138 insertions(+), 5 deletions(-)

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
index 7709736a2812..239386b71769 100644
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
-     *       rather than from the vCPU ID alone. This bodge is a temporary
-     *       measure until all infra is in place to retrieve or derive the
-     *       initial x2APIC ID from migrated domains.
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
      */
-    return id * 2;
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


