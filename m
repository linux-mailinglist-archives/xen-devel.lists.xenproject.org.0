Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A69A6E9B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823743.1237864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc8-0000v3-Rv; Mon, 21 Oct 2024 15:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823743.1237864; Mon, 21 Oct 2024 15:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc8-0000Yz-7C; Mon, 21 Oct 2024 15:46:36 +0000
Received: by outflank-mailman (input) for mailman id 823743;
 Mon, 21 Oct 2024 15:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2uc5-00072f-8B
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:33 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5497378-8fc3-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 17:46:32 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539e1543ab8so7757360e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:32 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:31 -0700 (PDT)
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
X-Inumbo-ID: a5497378-8fc3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525592; x=1730130392; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLoTPwH/b49P11LPnPYXfCXJJX0udy5YrCnU2/Yv3Q8=;
        b=TZiH5fQzDmBSYxkHYc4E8iKOuLHjb9hgosDXyRrwAO91dS3rn6XJqeleqKdDp9WkQk
         hW0gXLdcbdx5kAMBBsW8hlAD0e1oYdxtNEqxh0Np0UUHcpRC7QqGy17CFUnyEyMtXjLI
         KZjE/RcrscVKwuz0Cm7YWyq4ZG6KBA+dI9Mq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525592; x=1730130392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLoTPwH/b49P11LPnPYXfCXJJX0udy5YrCnU2/Yv3Q8=;
        b=UY4iIUgrOsebtQf2gPyvW6zQFIMC3D+oJJfMqzlNkOx0VkOAA2fbwlUxHooReGJWzG
         PQXjL3hMtE/R/yGwJWuGQGlYjH04Uwbu9TsBg30F4S7AVv1qv2U1pGuBEgboTB+6OId7
         ufCQv6hgOaNWmaD99WnX59OB6/lJ0Gi3ozog2dZPo6iw59i8lrp60/YlGJEIJQQ+XfAO
         4ewAE2Hh5fVO6EBSrCauoroCHT1Ze0gouTWp0xo69p3gK+7mkV3HhbUCiLntYpZUe7za
         sHAIdJddbiP61EdRQAf9zw2wFtHv2w3/YzqAxQMbNPtqOxLAAOMUh6+NfErR8xgOtyEu
         +P9Q==
X-Gm-Message-State: AOJu0YzDOQrEgNjPP/ErsMb4FyxLnyAHh2fEYHUkajixwtfMq8KsPNKq
	EGAin/5tpTKkTStObCVSJ217KtO8XCdzia9FRQnF+emc7Cor+67wijqZJDV8hDJjkiMF1cdxcGO
	1
X-Google-Smtp-Source: AGHT+IEKI3F754OZTMcPDYuuXAH9Oj+SnjFeFSVHzQIMr0uet8yShlvwWryHEeCKjJKW5m2/CM2Iqg==
X-Received: by 2002:a05:6512:1244:b0:536:a7a4:c3d4 with SMTP id 2adb3069b0e04-53a154c9f17mr10083781e87.39.1729525591793;
        Mon, 21 Oct 2024 08:46:31 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 10/10] tools/x86: Synthesise domain topologies
Date: Mon, 21 Oct 2024 16:46:00 +0100
Message-ID: <20241021154600.11745-11-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
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
v7:
  * No changes
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
index 5f4f6830e850..1d7c34820d8f 100644
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
     for (unsigned int i = 0; i < info->max_vcpus; i++)
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
index 715a66d2a978..a7e0d44cce78 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -266,9 +266,6 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->basic.raw[0x8] = EMPTY_LEAF;
 
-    /* TODO: Rework topology logic. */
-    memset(p->topo.raw, 0, sizeof(p->topo.raw));
-
     p->basic.raw[0xc] = EMPTY_LEAF;
 
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
@@ -619,6 +616,9 @@ static void __init calculate_pv_max_policy(void)
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
+
+    /* Wipe host topology. Populated by toolstack */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -785,6 +785,9 @@ static void __init calculate_hvm_max_policy(void)
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
+
+    /* Wipe host topology. Populated by toolstack */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_hvm_def_policy(void)
-- 
2.47.0


