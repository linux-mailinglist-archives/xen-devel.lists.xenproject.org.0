Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC38BFD53
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718783.1121342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaE-0004Qq-V4; Wed, 08 May 2024 12:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718783.1121342; Wed, 08 May 2024 12:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaE-0004Li-Jc; Wed, 08 May 2024 12:39:42 +0000
Received: by outflank-mailman (input) for mailman id 718783;
 Wed, 08 May 2024 12:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nIi=ML=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s4gaC-0002b0-JS
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:39:40 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08ccfda2-0d38-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 14:39:39 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59a0168c75so1133579866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 05:39:39 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 uj4-20020a170907c98400b00a599f876c28sm5984439ejc.38.2024.05.08.05.39.37
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
X-Inumbo-ID: 08ccfda2-0d38-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715171978; x=1715776778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBnTFB98oFX4thcLAgiTD7V4T2rkgzAOEvWeV1KCES8=;
        b=UdnJkS1Xey+jFVrHMVucdBDQL2SzZ4TR83e/tNSjcKcBV8XdzPbsUDFeeqIbA0zXUs
         7LB9lbKeGF2ACT95pL4gZe9h9f6LatQDMCvcUvvJP8ceU9w3sK2YJ+F6nv1zNPEkE8nW
         yGdkNsooVmP7y0ZPN/4KepW6Ha6i5ErQkZ4gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171978; x=1715776778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBnTFB98oFX4thcLAgiTD7V4T2rkgzAOEvWeV1KCES8=;
        b=h+l/lku6MBcCaymWVfNWhh5zVvLCL5WZprm4D0ArFblpjTcTTQL48IFieRDWf3fePQ
         PrY9IyvvzOHmN72n9lxfU2K/mKFDgd4y4YUTTI2yU8TzkmAO+6v2m692KWjguDTcUiLb
         kAGb1LXK23dH6RCX7+VzsJg4/RipsqDCoXkdRn+0LoCjn3q0TUwcK4A6QqdsZTdATgd6
         VHm0RLY12lHc5YRm957cciIJKwhorPTOvcDcFOzzKJNAghFFnmd5mTe2nInq0AoSuZYz
         zoQvC6rSWTK/lB2VcWox/1ZrXPuH7F5KqndeMx0i1SdXViuIct5xi79tZza71VyG1kyl
         yqlg==
X-Gm-Message-State: AOJu0Yx89cirfJKIdjUKQHpJYzqQMvbXbThylkbJfTKBEHspsgBnpa0j
	Syw5Jy3SclAn4EDMho9cejyzjPkiJa+X23wLIQgJqqMx2BiMjmuvvdPuBpu7Mfv45ZKgiAOCL81
	x
X-Google-Smtp-Source: AGHT+IERL7rxnRlKAg01EIgOZcb957IgS/zzCgslJ25W7IBtQ+EVGdBOj/K4oGZ1jLeGW1fySAEirQ==
X-Received: by 2002:a17:906:7951:b0:a59:ce25:9b88 with SMTP id a640c23a62f3a-a59fb9dbc65mr193715266b.54.1715171978238;
        Wed, 08 May 2024 05:39:38 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 8/8] xen/x86: Synthesise domain topologies
Date: Wed,  8 May 2024 13:39:27 +0100
Message-Id: <f51b54328a09c510c9320f1317c2da371ef16eb5.1715102098.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715102098.git.alejandro.vallejo@cloud.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose sensible topologies in leaf 0xb. At the moment it synthesises non-HT
systems, in line with the previous code intent.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Zap the topology leaves of (pv/hvm)_(def/max)_policy rather than the host policy
---
 tools/libs/guest/xg_cpuid_x86.c | 62 +++++----------------------------
 xen/arch/x86/cpu-policy.c       |  9 +++--
 2 files changed, 15 insertions(+), 56 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4453178100ad..8170769dbe43 100644
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
@@ -727,59 +727,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
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
+        /* TODO: Expose the ability to choose a custom topology for HVM/PVH */
+        unsigned int threads_per_core = 1;
+        unsigned int cores_per_pkg = di.max_vcpu_id + 1;
+        rc = x86_topo_from_parts(&p->policy, threads_per_core, cores_per_pkg);
+        if ( rc )
         {
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
+            ERROR("Failed to generate topology: t/c=%u c/p=%u",
+                  threads_per_core, cores_per_pkg);
+            goto out;
         }
     }
 
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 4b6d96276399..0ad871732ba0 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -278,9 +278,6 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->basic.raw[0x8] = EMPTY_LEAF;
 
-    /* TODO: Rework topology logic. */
-    memset(p->topo.raw, 0, sizeof(p->topo.raw));
-
     p->basic.raw[0xc] = EMPTY_LEAF;
 
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
@@ -621,6 +618,9 @@ static void __init calculate_pv_max_policy(void)
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
+
+    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -773,6 +773,9 @@ static void __init calculate_hvm_max_policy(void)
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
+
+    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_hvm_def_policy(void)
-- 
2.34.1


