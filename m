Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7DA828925
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664704.1034850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBk-0001Bn-Tb; Tue, 09 Jan 2024 15:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664704.1034850; Tue, 09 Jan 2024 15:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBk-00017L-Nn; Tue, 09 Jan 2024 15:38:48 +0000
Received: by outflank-mailman (input) for mailman id 664704;
 Tue, 09 Jan 2024 15:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4Q/=IT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rNEBi-00081N-M2
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:38:46 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2baa700d-af05-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 16:38:43 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-557bfc7f7b4so3275023a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 07:38:43 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 fi3-20020a170906da0300b00a2adb417051sm1153685ejb.216.2024.01.09.07.38.42
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
X-Inumbo-ID: 2baa700d-af05-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704814723; x=1705419523; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ip0/OxWiHAhF5VmbjEgxvgDRsSrRtgBm50FRE5FwbqQ=;
        b=brS3bRqHxXNU66iQEeFqTDvN59lN3eTMjFOxwCfyQdMo0WRrADjAoGXYVCc3qnwFff
         Hz9MLJjoSSwcKAyhqe3n5HXxQBHm3qrHThtWYqx4j08VaxxsJu2VKp5Lzbv29D2XWAsg
         futw2kezOFtxTUCmz7Uoi4z+oGM+kr2itKnX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814723; x=1705419523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ip0/OxWiHAhF5VmbjEgxvgDRsSrRtgBm50FRE5FwbqQ=;
        b=PliZcg2Hhv7Ey8nIIAdz6nKsGu1lIToqRVWYRkCrqPEDoQ1NEUMiaoH9sc+26v48XJ
         l7/bTBzsJ7QwLFedMrvwku3nlj5n94REAPFMkEbpCyMj2upBgRRmvN65GjbGuM+tyIPd
         cUasns67Y3+f8xCY9aCWXJtYXKURB3RwQV1WAJafllMZlN4kZlPO2BA0xfn9LDjDs4N4
         GulWt8bXNwMJMD36JDmkxvRqY3YHLQc6WJm+3Ydk7qzW6nZ6dBGfIMfwxELt5blWxuNa
         zFk0YeLmHGp4Ukw/EgMduSePDTxrIpZWzmrUY4OovG4S4a6wHm8eGeTHU3+94SryitAS
         RKaQ==
X-Gm-Message-State: AOJu0YziZ0o5mrKV7xnu5r4pfEDZpw0/9f3MAPnW+KnxpyMa88soWvDm
	FIidyC7ZHNoZKv1o3XvZOzlitFQ8mFgSLNm2TsZcHsfzr9Y=
X-Google-Smtp-Source: AGHT+IE2HfS1HpRppvtt5bqnp8gTZZIdOPraqXzbpm3Ahk9DyKr+vlJhrMk3dVY1NAQcGCgux/5Vvg==
X-Received: by 2002:a17:906:ecab:b0:a28:ac72:4570 with SMTP id qh11-20020a170906ecab00b00a28ac724570mr1014762ejb.21.1704814723186;
        Tue, 09 Jan 2024 07:38:43 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 6/6] xen/x86: Add topology generator
Date: Tue,  9 Jan 2024 15:38:34 +0000
Message-Id: <20240109153834.4192-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows toolstack to synthesise sensible topologies for guests. In
particular, this patch causes x2APIC IDs to be packed according to the
topology now exposed to the guests on leaf 0xb.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/include/xenguest.h        |  15 ++++
 tools/libs/guest/xg_cpuid_x86.c | 144 ++++++++++++++++++++------------
 xen/arch/x86/cpu-policy.c       |   6 +-
 3 files changed, 107 insertions(+), 58 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 4e9078fdee..f0043c559b 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -843,5 +843,20 @@ enum xc_static_cpu_featuremask {
     XC_FEATUREMASK_HVM_HAP_DEF,
 };
 const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
+
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
+ */
+void xc_topo_from_parts(struct cpu_policy *p,
+                        uint32_t threads_per_core, uint32_t cores_per_pkg);
+
 #endif /* __i386__ || __x86_64__ */
 #endif /* XENGUEST_H */
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4453178100..7a622721be 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -584,7 +584,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     bool hvm;
     xc_domaininfo_t di;
     struct xc_cpu_policy *p = xc_cpu_policy_init();
-    unsigned int i, nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
+    unsigned int nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
@@ -727,60 +727,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     }
     else
     {
-        /*
-         * Topology for HVM guests is entirely controlled by Xen.  For now, we
-         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
-         */
-        p->policy.basic.htt = true;
-        p->policy.extd.cmp_legacy = false;
-
-        /*
-         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
-         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
-         * overflow.
-         */
-        if ( !p->policy.basic.lppp )
-            p->policy.basic.lppp = 2;
-        else if ( !(p->policy.basic.lppp & 0x80) )
-            p->policy.basic.lppp *= 2;
-
-        switch ( p->policy.x86_vendor )
-        {
-        case X86_VENDOR_INTEL:
-            for ( i = 0; (p->policy.cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->policy.cache.raw)); ++i )
-            {
-                p->policy.cache.subleaf[i].cores_per_package =
-                    (p->policy.cache.subleaf[i].cores_per_package << 1) | 1;
-                p->policy.cache.subleaf[i].threads_per_cache = 0;
-            }
-            break;
-
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-            /*
-             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
-             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
-             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
-             * - overflow,
-             * - going out of sync with leaf 1 EBX[23:16],
-             * - incrementing ApicIdCoreSize when it's zero (which changes the
-             *   meaning of bits 7:0).
-             *
-             * UPDATE: I addition to avoiding overflow, some
-             * proprietary operating systems have trouble with
-             * apic_id_size values greater than 7.  Limit the value to
-             * 7 for now.
-             */
-            if ( p->policy.extd.nc < 0x7f )
-            {
-                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
-                    p->policy.extd.apic_id_size++;
-
-                p->policy.extd.nc = (p->policy.extd.nc << 1) | 1;
-            }
-            break;
-        }
+        /* TODO: Expose the ability to choose a custom topology for HVM/PVH */
+        xc_topo_from_parts(&p->policy, 1, di.max_vcpu_id + 1);
     }
 
     nr_leaves = ARRAY_SIZE(p->leaves);
@@ -1028,3 +976,89 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 
     return false;
 }
+
+static uint32_t order(uint32_t n)
+{
+    return 32 - __builtin_clz(n);
+}
+
+void xc_topo_from_parts(struct cpu_policy *p,
+                        uint32_t threads_per_core, uint32_t cores_per_pkg)
+{
+    uint32_t threads_per_pkg = threads_per_core * cores_per_pkg;
+    uint32_t apic_id_size;
+
+    if ( p->basic.max_leaf < 0xb )
+        p->basic.max_leaf = 0xb;
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
+
+    p->basic.lppp = 0xff;
+    if ( threads_per_pkg < 0xff )
+        p->basic.lppp = threads_per_pkg;
+
+    switch ( p->x86_vendor )
+    {
+        case X86_VENDOR_INTEL:
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
+
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
+             * Clip APIC ID to 8, as that's what high core-count machines do
+             *
+             * That what AMD EPYC 9654 does with >256 CPUs
+             */
+            p->extd.apic_id_size = 8;
+            if ( apic_id_size < 8 )
+                p->extd.apic_id_size = apic_id_size;
+
+            break;
+    }
+}
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 76efb050ed..679d1fe4fa 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -278,9 +278,6 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->basic.raw[0x8] = EMPTY_LEAF;
 
-    /* TODO: Rework topology logic. */
-    memset(p->topo.raw, 0, sizeof(p->topo.raw));
-
     p->basic.raw[0xc] = EMPTY_LEAF;
 
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
@@ -387,6 +384,9 @@ static void __init calculate_host_policy(void)
     recalculate_xstate(p);
     recalculate_misc(p);
 
+    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
+
     /* When vPMU is disabled, drop it from the host policy. */
     if ( vpmu_mode == XENPMU_MODE_OFF )
         p->basic.raw[0xa] = EMPTY_LEAF;
-- 
2.34.1


