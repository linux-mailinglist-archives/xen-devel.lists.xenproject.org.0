Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C3828926
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664700.1034811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBh-00006s-DJ; Tue, 09 Jan 2024 15:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664700.1034811; Tue, 09 Jan 2024 15:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBh-0008WQ-7l; Tue, 09 Jan 2024 15:38:45 +0000
Received: by outflank-mailman (input) for mailman id 664700;
 Tue, 09 Jan 2024 15:38:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4Q/=IT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rNEBf-00081L-PT
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:38:43 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b3888ba-af05-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 16:38:43 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a28ab7ae504so297438766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 07:38:43 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 fi3-20020a170906da0300b00a2adb417051sm1153685ejb.216.2024.01.09.07.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 07:38:42 -0800 (PST)
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
X-Inumbo-ID: 2b3888ba-af05-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704814722; x=1705419522; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9v48h63fj7+uc/V0QQbcMsF6YnV1T/2wiKWzNfz/LI=;
        b=SDPpe2byTIkQ/t0jWOJ88cf43i8yaio67CN/DAA5UENn/CPI/tGwTPL4Whs9N3LUvu
         BfT3dy1DSfYTOtHEjYOxN7q21U3OgDBVOqpOmK0paH/30pUgovewJZ8EJDjSTf1Guo+P
         1O8DmaQbt6EqYl6Na7GFkJmTrIXWLU/xAF/ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814722; x=1705419522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9v48h63fj7+uc/V0QQbcMsF6YnV1T/2wiKWzNfz/LI=;
        b=f0/KqbyLFSeVqjb6un7urXE+8Zi1HzZztdOGYpb5i0nd7hPcE0kcyvR82X2npHQC1m
         QCC7HHoTZtEvBs0YG3TLlcrVGFI0bufCHVmyXCXtnodZJi0e6WghqXxxIrgDpsOL8myh
         77KG3PEGYZuvxkz9s4+9MYHLcIpBZpGusH/lTMHz6Z14S9PnJHr5uQu2Y5jpr0rJSkh/
         QsCkMM56lX1T5WfpuCkTcOJSTKHF+LNzJ8V4arX4QvQsOC+6LaSnkzhhXzd3q1dV0qY5
         Yxl9PSsain88ft1DBd3vRAX+Zi4AGje4cwRDcDC5W7Yat79ORJYAHBZLEcVf/vnKWnsi
         vq7g==
X-Gm-Message-State: AOJu0YyDQfrEo8yqBL4OorVIcWsPwEI+nF+tttTHoBUG82uYv6cuVnVG
	2UpG2LJnxfY8LvOptG8SSe6+nSFQUOc6mxt1rujF16/DrcM=
X-Google-Smtp-Source: AGHT+IEo1krAN+qcSUiH5qafdfWiu4LMfiL5nRv9wcOqzqwtnyUI88IYyLgyrMkG9RRrc7rpezawRQ==
X-Received: by 2002:a17:907:c91b:b0:a28:bb1a:6209 with SMTP id ui27-20020a170907c91b00b00a28bb1a6209mr526126ejc.118.1704814722498;
        Tue, 09 Jan 2024 07:38:42 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 5/6] xen/x86: Derive topologically correct x2APIC IDs from the policy
Date: Tue,  9 Jan 2024 15:38:33 +0000
Message-Id: <20240109153834.4192-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
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
 tools/tests/cpu-policy/test-cpu-policy.c | 128 +++++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     |   2 +
 xen/lib/x86/policy.c                     |  75 +++++++++++--
 3 files changed, 199 insertions(+), 6 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 301df2c002..6ff5c1dd3d 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -650,6 +650,132 @@ static void test_is_compatible_failure(void)
     }
 }
 
+static void test_x2apic_id_from_vcpu_id_success(void)
+{
+    static struct test {
+        const char *name;
+        uint32_t vcpu_id;
+        uint32_t x2apic_id;
+        struct cpu_policy policy;
+    } tests[] = {
+        {
+            .name = "3v: 3 t/c, 8 c/s", .vcpu_id = 3, .x2apic_id = 1 << 2,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 8, .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+        {
+            .name = "6v: 3 t/c, 8 c/s", .vcpu_id = 6, .x2apic_id = 2 << 2,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 8, .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+        {
+            .name = "24v: 3 t/c, 8 c/s", .vcpu_id = 24, .x2apic_id = 1 << 5,
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 8, .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+        {
+            .name = "35v: 3 t/c, 8 c/s", .vcpu_id = 35,
+            .x2apic_id = (35 % 3) | (((35 / 3) % 8)  << 2) | ((35 / 24) << 5),
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 8, .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+        {
+            .name = "96v: 7 t/c, 3 c/s", .vcpu_id = 96,
+            .x2apic_id = (96 % 7) | (((96 / 7) % 3)  << 3) | ((96 / 21) << 5),
+            .policy = {
+                .x86_vendor = X86_VENDOR_AMD,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 7, .level = 0, .type = 1, .id_shift = 3, },
+                    [1] = { .nr_logical = 3, .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+        {
+            .name = "3v: 3 t/c, 8 c/s", .vcpu_id = 3, .x2apic_id = 1 << 2,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 3,  .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 24, .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+        {
+            .name = "6v: 3 t/c, 8 c/s", .vcpu_id = 6, .x2apic_id = 2 << 2,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 3,  .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 24, .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+        {
+            .name = "24v: 3 t/c, 8 c/s", .vcpu_id = 24, .x2apic_id = 1 << 5,
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 3,  .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 24, .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+        {
+            .name = "35v: 3 t/c, 8 c/s", .vcpu_id = 35,
+            .x2apic_id = (35 % 3) | (((35 / 3) % 8)  << 2) | ((35 / 24) << 5),
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 3,  .level = 0, .type = 1, .id_shift = 2, },
+                    [1] = { .nr_logical = 24, .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+        {
+            .name = "96v: 7 t/c, 3 c/s", .vcpu_id = 96,
+            .x2apic_id = (96 % 7) | (((96 / 7) % 3)  << 3) | ((96 / 21) << 5),
+            .policy = {
+                .x86_vendor = X86_VENDOR_INTEL,
+                .topo.subleaf = {
+                    [0] = { .nr_logical = 7,   .level = 0, .type = 1, .id_shift = 3, },
+                    [1] = { .nr_logical = 21,  .level = 1, .type = 2, .id_shift = 5, },
+                },
+            },
+        },
+    };
+
+    printf("Testing x2apic id from vcpu id success:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        struct test *t = &tests[i];
+        uint32_t x2apic_id = x86_x2apic_id_from_vcpu_id(&t->policy, t->vcpu_id);
+        if ( x2apic_id != t->x2apic_id )
+            fail("FAIL - '%s'. bad x2apic_id: expected=%u actual=%u\n",
+                 t->name, t->x2apic_id, x2apic_id);
+    }
+}
+
 int main(int argc, char **argv)
 {
     printf("CPU Policy unit tests\n");
@@ -667,6 +793,8 @@ int main(int argc, char **argv)
     test_is_compatible_success();
     test_is_compatible_failure();
 
+    test_x2apic_id_from_vcpu_id_success();
+
     if ( nr_failures )
         printf("Done: %u failures\n", nr_failures);
     else
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 65f6335b32..d81ae2f47c 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -550,6 +550,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
 /**
  * Calculates the x2APIC ID of a vCPU given a CPU policy
  *
+ * If the policy lacks leaf 0xb falls back to legacy mapping of apic_id=cpu*2
+ *
  * @param p          CPU policy of the domain.
  * @param vcpu_id    vCPU ID of the vCPU.
  * @returns x2APIC ID of the vCPU.
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index a3b24e6879..2a50bc076a 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,15 +2,78 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
-uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
+static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
 {
     /*
-     * TODO: Derive x2APIC ID from the topology information inside `p`
-     *       rather than from vCPU ID. This bodge is a temporary measure
-     *       until all infra is in place to retrieve or derive the initial
-     *       x2APIC ID from migrated domains.
+     * `nr_logical` reported by Intel is the number of THREADS contained in
+     * the next topological scope. For example, assuming a system with 2
+     * threads/core and 3 cores/module in a fully symmetric topology,
+     * `nr_logical` at the core level will report 6. Because it's reporting
+     * the number of threads in a module.
+     *
+     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
+     * level (cores/complex, etc) so we can return it as-is.
      */
-    return vcpu_id * 2;
+    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
+        return p->topo.subleaf[lvl].nr_logical;
+
+    return p->topo.subleaf[lvl].nr_logical / p->topo.subleaf[lvl - 1].nr_logical;
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
+     * NOTE: `topo` is currently derived from leaf 0xb, which is bound to
+     * two levels, but once we track leaves 0x1f (or e26) there will be a
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
 }
 
 int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
-- 
2.34.1


