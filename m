Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71C94BECD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774276.1184768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Xb-0003cC-30; Thu, 08 Aug 2024 13:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774276.1184768; Thu, 08 Aug 2024 13:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Xa-0003Zv-Uf; Thu, 08 Aug 2024 13:50:54 +0000
Received: by outflank-mailman (input) for mailman id 774276;
 Thu, 08 Aug 2024 13:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Q2-0003nA-Mn
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:43:06 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2329c604-558c-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:43:04 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5a3b866ebc9so1119601a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:43:04 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:43:03 -0700 (PDT)
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
X-Inumbo-ID: 2329c604-558c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124584; x=1723729384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpkaQj0AAChy0px6eMw41BqPD+iDFSczkUolNTgS1vM=;
        b=Wvle1QU1yRusqp67FSsfkWNYx853zY9wOoNS/8VC7rvBQcO+6yTe01yVSVHMSTibDy
         xF2pBD/B4XUMdLh2CLU7ggXFsWKcEEusDfcWYsodoPVdDRIxhfe6DZEDACkNadYCP9aV
         3k+JlO29wg3kniPWTGHm6n2xh7FXEEIbLaOd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124584; x=1723729384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpkaQj0AAChy0px6eMw41BqPD+iDFSczkUolNTgS1vM=;
        b=nAYRQr53uTqSJPtg+G6XvGkK9vLN9cU3J2rKZA8QYkDp0AZ1j3MguvWqIzJBmlWE5P
         KEsfEy1PL4wNSarAvUHaODisTdLxAuqZwJpJtPK/U4SF5VSfGzgwHVadrESvkNWlLabY
         /6mFmzMuphIu0onwL89lQFCqDRjQ4KqBiudkdMiNpmHLNKKA6y8ezA0RMpCzC2SkoDjo
         XQ4y5G6272U8JFvI5ETSyL2JoAky5tZr3/h8skzrNa/u7dDfggH/zm/oROCXr9Svi9Qi
         w1H7dJW6h0T9t02RYP45EYKDFY7kMPIdX2z2k46qYdrY3fkME11NsFWK28bbLK+yE1Yt
         8Qfg==
X-Gm-Message-State: AOJu0YzSAYUcOXWApPB+v+3mr87R5y6oav28pvrkzd45z0FQcUj95MQj
	1bNygG3QMp0OQZ/qNUgQsPgMaM8JXmHTeCKS0NmlNg2l0OhqTKJoXA6Pu9Zd6HVV4w70PoTMskn
	E
X-Google-Smtp-Source: AGHT+IGRd6n0ebyaPtVGqWX3E+loxh0iSS5zMIcsnobxxxKh+2BOwVZfM5NY9BxP3vp0hnYSIlvluQ==
X-Received: by 2002:a17:907:d2c5:b0:a77:c95e:9b1c with SMTP id a640c23a62f3a-a8090d7affdmr146859766b.27.1723124583705;
        Thu, 08 Aug 2024 06:43:03 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 08/10] xen/x86: Derive topologically correct x2APIC IDs from the policy
Date: Thu,  8 Aug 2024 14:42:48 +0100
Message-ID: <20240808134251.29995-9-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements the helper for mapping vcpu_id to x2apic_id given a valid
topology in a policy. The algo is written with the intention of
extending it to leaves 0x1f and extended 0x26 in the future.

Toolstack doesn't set leaf 0xb and the HVM default policy has it
cleared, so the leaf is not implemented. In that case, the new helper
just returns the legacy mapping.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v5:
  * No change
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
index 116b305a1d7f..6fe19490d290 100644
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
2.45.2


