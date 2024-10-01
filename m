Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7898BC42
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808076.1219951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9L-00056s-VQ; Tue, 01 Oct 2024 12:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808076.1219951; Tue, 01 Oct 2024 12:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9L-0004wn-9r; Tue, 01 Oct 2024 12:38:43 +0000
Received: by outflank-mailman (input) for mailman id 808076;
 Tue, 01 Oct 2024 12:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9J-0002va-D8
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:41 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15db92a5-7ff2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 14:38:39 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c88e6926e5so3117056a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:39 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:38 -0700 (PDT)
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
X-Inumbo-ID: 15db92a5-7ff2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786319; x=1728391119; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loD1s7lD9RQwYiYkR/KqljzHBIRiq3F0/w5l0wcOKk4=;
        b=lRwPWjC1+GOBooJw/ZmNT+yNRs05ArKUQsNLISw6uXzXqC2jdScaOMETJ81FFBCA8C
         DfQkVa5FjVyn1tPEgmncZFUIsno27vtgSuTx3XssHEK61CrC/mUGwnwttKPf3z7hXTBE
         DNO2L5DLtee9zSoSKDLmeL4UVVS+ZkGMlxPvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786319; x=1728391119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loD1s7lD9RQwYiYkR/KqljzHBIRiq3F0/w5l0wcOKk4=;
        b=v1EgebWgAmGafu0FaOvBXfPtB+1iw4StY87of7JJCCeDWxqpcxzF5NYZDF/9otwJeJ
         V0jr/o8k5VHun30fDICF5vvc5L+3YqBIj17pdzAW9H85jUA2cvcG1JG8z8fkp2vB2WUz
         b/lV8ROxLpx8ax05bNZ6jLrOmSqeSvYqer+UnuZIVwvgYavQ9rasMrPSLJ/ejTa7DfUp
         yrcUXqXOPchOEtnJYSTbv19eINEyRyWcPyrSL7tUII6+nbAoUhnTH0hF6Y/XPbKNa4pD
         UwooYLJaGw/cToir9qI1CyRIHPutKU2mVpVmliJtvs8heT2NnwxzWOcgDwhBbHuiIfQt
         8EYA==
X-Gm-Message-State: AOJu0Yz5ACvoeBRIlUQ8X4sHQDHGDqK6m6+qQqRPXSCxVZcm4SR4nzcm
	HRhTO/WnQ13pYAzr4utXLljHClfSSuWldrLn+juOcWcUXHAOaGty0miR+0ulPJH9i3kTOSytDtP
	vhUQ=
X-Google-Smtp-Source: AGHT+IH7TXEWvP98DHoKzQLTgruBwNIYgU5z1sa88Jq6yvRRgPSXxfpVWGnb88wWJ82YX1JB5jB/dA==
X-Received: by 2002:a05:6402:3584:b0:5c5:cf0b:b515 with SMTP id 4fb4d7f45d1cf-5c8824cc677mr11031275a12.1.1727786318964;
        Tue, 01 Oct 2024 05:38:38 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 11/11] tools/x86: Synthesise domain topologies
Date: Tue,  1 Oct 2024 13:38:07 +0100
Message-ID: <20241001123807.605-12-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose sensible topologies in leaf 0xb. At the moment it synthesises
non-HT systems, in line with the previous code intent.

Leaf 0xb in the host policy is no longer zapped and the guest {max,def}
policies have their topology leaves zapped instead. The intent is for
toolstack to populate them. There's no current use for the topology
information in the host policy, but it makes no harm.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v6:
  * Assign accurate APIC IDs to xc_dom_img->cpu_to_apicid
    * New field in v6. Allows ACPI generation to be correct on PVH too.
---
 tools/include/xenguest.h        |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 29 ++++++++++++++++++++++++++++-
 tools/libs/light/libxl_dom.c    | 22 +++++++++++++++++++++-
 xen/arch/x86/cpu-policy.c       |  9 ++++++---
 4 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index aa50b78dfb89..dcabf219b9cb 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -831,6 +831,9 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
 
 uint32_t xc_get_cpu_featureset_size(void);
 
+/* Returns the APIC ID of the `cpu`-th CPU according to `policy` */
+uint32_t xc_cpu_to_apicid(const xc_cpu_policy_t *policy, unsigned int cpu);
+
 enum xc_static_cpu_featuremask {
     XC_FEATUREMASK_KNOWN,
     XC_FEATUREMASK_SPECIAL,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4453178100ad..c591f8732a1a 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -725,8 +725,16 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         p->policy.basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
         p->policy.extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
     }
-    else
+    else if ( restore )
     {
+        /*
+         * Reconstruct the topology exposed on Xen <= 4.13. It makes very little
+         * sense, but it's what those guests saw so it's set in stone now.
+         *
+         * Guests from Xen 4.14 onwards carry their own CPUID leaves in the
+         * migration stream so they don't need special treatment.
+         */
+
         /*
          * Topology for HVM guests is entirely controlled by Xen.  For now, we
          * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
@@ -782,6 +790,20 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
             break;
         }
     }
+    else
+    {
+        /* TODO: Expose the ability to choose a custom topology for HVM/PVH */
+        unsigned int threads_per_core = 1;
+        unsigned int cores_per_pkg = di.max_vcpu_id + 1;
+
+        rc = x86_topo_from_parts(&p->policy, threads_per_core, cores_per_pkg);
+        if ( rc )
+        {
+            ERROR("Failed to generate topology: rc=%d t/c=%u c/p=%u",
+                  rc, threads_per_core, cores_per_pkg);
+            goto out;
+        }
+    }
 
     nr_leaves = ARRAY_SIZE(p->leaves);
     rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
@@ -1028,3 +1050,8 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 
     return false;
 }
+
+uint32_t xc_cpu_to_apicid(const xc_cpu_policy_t *policy, unsigned int cpu)
+{
+    return x86_x2apic_id_from_vcpu_id(&policy->policy, cpu);
+}
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 7f9c6eaa8b24..8dbfc5b7df61 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -1063,6 +1063,9 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     libxl_domain_build_info *const info = &d_config->b_info;
     struct xc_dom_image *dom = NULL;
     bool device_model = info->type == LIBXL_DOMAIN_TYPE_HVM ? true : false;
+#if defined(__i386__) || defined(__x86_64__)
+    struct xc_cpu_policy *policy = NULL;
+#endif
 
     xc_dom_loginit(ctx->xch);
 
@@ -1083,8 +1086,22 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     dom->container_type = XC_DOM_HVM_CONTAINER;
 
 #if defined(__i386__) || defined(__x86_64__)
+    policy = xc_cpu_policy_init();
+    if (!policy) {
+        LOGE(ERROR, "xc_cpu_policy_get_domain failed d%u", domid);
+        rc = ERROR_NOMEM;
+        goto out;
+    }
+
+    rc = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
+    if (rc != 0) {
+        LOGE(ERROR, "xc_cpu_policy_get_domain failed d%u", domid);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
     for ( uint32_t i = 0; i < info->max_vcpus; i++ )
-        dom->cpu_to_apicid[i] = 2 * i; /* TODO: Replace by topo calculation */
+        dom->cpu_to_apicid[i] = xc_cpu_to_apicid(policy, i);
 #endif
 
     /* The params from the configuration file are in Mb, which are then
@@ -1214,6 +1231,9 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
 out:
     assert(rc != 0);
     if (dom != NULL) xc_dom_release(dom);
+#if defined(__i386__) || defined(__x86_64__)
+    xc_cpu_policy_destroy(policy);
+#endif
     return rc;
 }
 
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index b6d9fad56773..39c0aba9ea36 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -266,9 +266,6 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->basic.raw[0x8] = EMPTY_LEAF;
 
-    /* TODO: Rework topology logic. */
-    memset(p->topo.raw, 0, sizeof(p->topo.raw));
-
     p->basic.raw[0xc] = EMPTY_LEAF;
 
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
@@ -616,6 +613,9 @@ static void __init calculate_pv_max_policy(void)
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
+
+    /* Wipe host topology. Populated by toolstack */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -779,6 +779,9 @@ static void __init calculate_hvm_max_policy(void)
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
+
+    /* Wipe host topology. Populated by toolstack */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_hvm_def_policy(void)
-- 
2.46.0


