Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F07E4411
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628909.980840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKX-0004gc-PV; Tue, 07 Nov 2023 15:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628909.980840; Tue, 07 Nov 2023 15:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKX-0004fK-LV; Tue, 07 Nov 2023 15:49:29 +0000
Received: by outflank-mailman (input) for mailman id 628909;
 Tue, 07 Nov 2023 15:49:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2M1=GU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r0OKW-0004f1-9m
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:49:28 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aec3b6f-7d85-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 16:49:27 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso40796825e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:49:26 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1c721a000000b0040849ce7116sm15809852wmc.43.2023.11.07.07.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:49:25 -0800 (PST)
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
X-Inumbo-ID: 3aec3b6f-7d85-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699372166; x=1699976966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkvpmHSMusCYlZr4kFl4G1ly5WpvU3SZ+lcbW7voFmc=;
        b=epQ4X2GWFarSYAFXZd3PRTscNQ818x0uDBsDXFpksDzhlq5VEG04RU//7+n6hG8K6W
         yfTzXqBBNV1VThvE8ib8HrGCdn3i/BlfyVD7f3ZCxWgHmJ4alKCAMjTXNyD6trSd+UUn
         shH510ZzGE/LHZAslD/wI/aiF+UTzpeefL4LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372166; x=1699976966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkvpmHSMusCYlZr4kFl4G1ly5WpvU3SZ+lcbW7voFmc=;
        b=dHJG+/lCsgOm+Hd1GMLYs4VpImUmyIQjhcgfiqtXi77tf3Su6sL4E4ZY7O4iWbXvKm
         7g5/BFOf7gT0UBZNhI4BgwgFnl35vWzK3COr5cpZ8HoUy+dUvEtoUb4ZbIfUvtnNrgKb
         p0KoZ1Z0ym7osqUcPhNkW7CT2sR40ekMwrZFWywpOpUGssSVu2/VDZiM39SXRbTm8kJn
         6qP/CFLd9YP/Ho5Ur//luzrqGb8kTzEGMxgy7cHsf6EBMBmQsWfPKtIr6+AC9rdRujGj
         KMAw/fyCrbS73HPw09MfYVb3WIljykqTmpMyobnj3JjhMxFlXhkmLlFIAhMcVFeNxl1Q
         6smQ==
X-Gm-Message-State: AOJu0YznuzVXjBkIJ/LDkMsByjO2YXDc/ekDbzBK674yPhxtnIHfpamZ
	AOe50lXaVDewQrgO7FhxPAw2RtDq0wj7gA09LqI=
X-Google-Smtp-Source: AGHT+IHGdLuZ0IMWw9OVnDgXTXpSs5u56jgwjA0OzJ85L6nEi9Q0Pm8CL1hsz8lZ4aKxo8fFX7HnpQ==
X-Received: by 2002:a05:600c:3c87:b0:405:4776:735a with SMTP id bg7-20020a05600c3c8700b004054776735amr3159633wmb.2.1699372165985;
        Tue, 07 Nov 2023 07:49:25 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/7] tools/xenguest: Dynamically allocate xc_cpu_policy_t contents
Date: Tue,  7 Nov 2023 15:49:15 +0000
Message-Id: <20231107154921.54979-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
References: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is part of a larger effort to reduce technical debt in this area and
prevent policy internals from leaking in plumbing code that needs not be
aware of them.

This patch turns the internal static buffers into dynamic ones and performs
the allocations based on policy sizes probed using a hypercall. This is
meant to help dealing with mismatched versions of toolstack/Xen, as no
assumptions are made with regards of the sizes of the buffers. With this,
we are now able to use these buffers for serialization instead of
out-of-band data structures.

The scheme is simple and involves keeping track of the buffer occupancy
through the "len" field and its capacity through the "allocated" field;
think "vector" in higher-level languages. Both trackers refer to entries
rather than octets because most of the code deals in those terms.

While at this, make a minor change to MSR_MAX_SERIALISED_ENTRIES so it's
unsigned in order to please the max() macro.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/include/xenguest.h             |  2 +-
 tools/libs/guest/xg_cpuid_x86.c      | 86 +++++++++++++++++++++-------
 tools/libs/guest/xg_private.h        | 17 +++++-
 tools/libs/guest/xg_sr_common_x86.c  |  2 +-
 tools/misc/xen-cpuid.c               |  2 +-
 tools/tests/tsx/test-tsx.c           | 61 +++++++++++---------
 xen/include/xen/lib/x86/cpu-policy.h |  2 +-
 7 files changed, 119 insertions(+), 53 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b77..702965addc 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -787,7 +787,7 @@ xen_pfn_t *xc_map_m2p(xc_interface *xch,
 typedef struct xc_cpu_policy xc_cpu_policy_t;
 
 /* Create and free a xc_cpu_policy object. */
-xc_cpu_policy_t *xc_cpu_policy_init(void);
+xc_cpu_policy_t *xc_cpu_policy_init(xc_interface *xch);
 void xc_cpu_policy_destroy(xc_cpu_policy_t *policy);
 
 /* Retrieve a system policy, or get/set a domains policy. */
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index f2b1e80901..3545f3e530 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -839,15 +839,48 @@ out:
     return rc;
 }
 
-xc_cpu_policy_t *xc_cpu_policy_init(void)
+xc_cpu_policy_t *xc_cpu_policy_init(xc_interface *xch)
 {
-    return calloc(1, sizeof(struct xc_cpu_policy));
+    uint32_t nr_leaves, nr_msrs;
+    xc_cpu_policy_t *p = calloc(1, sizeof(*p));
+    if ( !p )
+        return NULL;
+
+    if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) )
+        goto fail;
+
+    p->leaves.allocated = max(nr_leaves, CPUID_MAX_SERIALISED_LEAVES);
+    p->leaves.buf = calloc(p->leaves.allocated, sizeof(*p->leaves.buf));
+    if ( !p->leaves.buf )
+        goto fail;
+
+    p->msrs.allocated = max(nr_msrs, MSR_MAX_SERIALISED_ENTRIES);
+    p->msrs.buf = calloc(p->msrs.allocated, sizeof(*p->msrs.buf));
+    if ( !p->msrs.buf )
+        goto fail;
+
+    /* Success */
+    return p;
+
+ fail:
+    xc_cpu_policy_destroy(p);
+    return NULL;
 }
 
 void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
 {
-    if ( policy )
-        free(policy);
+    int err = errno;
+
+    if ( !policy )
+        return;
+
+    if ( policy->leaves.buf )
+        free(policy->leaves.buf);
+    if ( policy->msrs.buf )
+        free(policy->msrs.buf);
+
+    free(policy);
+    errno = err;
 }
 
 static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
@@ -856,7 +889,7 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     int rc;
 
-    rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves,
+    rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves.buf,
                                     nr_leaves, &err_leaf, &err_subleaf);
     if ( rc )
     {
@@ -866,7 +899,7 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
         return rc;
     }
 
-    rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs,
+    rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs.buf,
                                   nr_entries, &err_msr);
     if ( rc )
     {
@@ -882,18 +915,22 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
                              xc_cpu_policy_t *policy)
 {
-    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
-    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
+    unsigned int nr_leaves = policy->leaves.allocated;
+    unsigned int nr_msrs = policy->msrs.allocated;
     int rc;
 
-    rc = get_system_cpu_policy(xch, policy_idx, &nr_leaves, policy->leaves,
-                               &nr_msrs, policy->msrs);
+    rc = get_system_cpu_policy(xch, policy_idx,
+                               &nr_leaves, policy->leaves.buf,
+                               &nr_msrs, policy->msrs.buf);
     if ( rc )
     {
         PERROR("Failed to obtain %u policy", policy_idx);
         return rc;
     }
 
+    policy->leaves.len = nr_leaves;
+    policy->msrs.len = nr_msrs;
+
     rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
     if ( rc )
     {
@@ -907,18 +944,22 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
 int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t *policy)
 {
-    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
-    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
+    unsigned int nr_leaves = policy->leaves.allocated;
+    unsigned int nr_msrs = policy->msrs.allocated;
     int rc;
 
-    rc = get_domain_cpu_policy(xch, domid, &nr_leaves, policy->leaves,
-                               &nr_msrs, policy->msrs);
+    rc = get_domain_cpu_policy(xch, domid,
+                               &nr_leaves, policy->leaves.buf,
+                               &nr_msrs, policy->msrs.buf);
     if ( rc )
     {
         PERROR("Failed to obtain domain %u policy", domid);
         return rc;
     }
 
+    policy->leaves.len = nr_leaves;
+    policy->msrs.len = nr_msrs;
+
     rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
     if ( rc )
     {
@@ -933,17 +974,22 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t *policy)
 {
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
-    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
+    unsigned int nr_leaves = policy->leaves.allocated;
+    unsigned int nr_msrs = policy->msrs.allocated;
     int rc;
 
-    rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
-                                 policy->msrs, &nr_msrs);
+    rc = xc_cpu_policy_serialise(xch, policy,
+                                 policy->leaves.buf, &nr_leaves,
+                                 policy->msrs.buf, &nr_msrs);
     if ( rc )
         return rc;
 
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, policy->leaves,
-                                  nr_msrs, policy->msrs,
+    policy->leaves.len = nr_leaves;
+    policy->msrs.len = nr_msrs;
+
+    rc = xc_set_domain_cpu_policy(xch, domid,
+                                  nr_leaves, policy->leaves.buf,
+                                  nr_msrs, policy->msrs.buf,
                                   &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index d73947094f..94957ea5ca 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -174,9 +174,22 @@ int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
 #include <xen/lib/x86/cpu-policy.h>
 
 struct xc_cpu_policy {
+    /** Deserialised policy */
     struct cpu_policy policy;
-    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
-    xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
+
+    /** Serialised buffer of CPUID leaves */
+    struct {
+        xen_cpuid_leaf_t *buf; /**< Base address */
+        size_t allocated; /**< Memory allocated to the buffer (in entries) */
+        size_t len; /**< Number of entries in use (in entries) */
+    } leaves;
+
+    /** Serialised buffer of MSRs */
+    struct {
+        xen_msr_entry_t *buf; /**< Base address */
+        size_t allocated; /**< Memory allocated to the buffer (in entries) */
+        size_t len; /**< Number of entries in use (in entries) */
+    } msrs;
 };
 #endif /* x86 */
 
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 563b4f0168..ad63c675ed 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -59,7 +59,7 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
 
     cpuid.data = malloc(nr_leaves * sizeof(xen_cpuid_leaf_t));
     msrs.data  = malloc(nr_msrs   * sizeof(xen_msr_entry_t));
-    policy = xc_cpu_policy_init();
+    policy = xc_cpu_policy_init(xch);
     if ( !cpuid.data || !msrs.data || !policy )
     {
         ERROR("Cannot allocate memory for CPU Policy");
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 7370f1b56e..a87b9f99f2 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -532,7 +532,7 @@ int main(int argc, char **argv)
         uint32_t i, max_leaves, max_msrs;
 
         xc_interface *xch = xc_interface_open(0, 0, 0);
-        xc_cpu_policy_t *policy = xc_cpu_policy_init();
+        xc_cpu_policy_t *policy = xc_cpu_policy_init(xch);
 
         if ( !xch )
             err(1, "xc_interface_open");
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index b7e1972ce8..3371bb26f7 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -58,7 +58,7 @@ static xc_interface *xch;
  * don't care about the raw policy (index 0) so reuse that for the guest
  * policy.
  */
-static struct xc_cpu_policy policies[6];
+static struct xc_cpu_policy *policies[6];
 #define guest_policy policies[0]
 #define host         policies[XEN_SYSCTL_cpu_policy_host]
 #define pv_max       policies[XEN_SYSCTL_cpu_policy_pv_max]
@@ -151,15 +151,15 @@ static void test_tsx_msrs(void)
 {
     printf("Testing MSR_TSX_FORCE_ABORT consistency\n");
     test_tsx_msr_consistency(
-        MSR_TSX_FORCE_ABORT, host.policy.feat.tsx_force_abort);
+        MSR_TSX_FORCE_ABORT, host->policy.feat.tsx_force_abort);
 
     printf("Testing MSR_TSX_CTRL consistency\n");
     test_tsx_msr_consistency(
-        MSR_TSX_CTRL, host.policy.arch_caps.tsx_ctrl);
+        MSR_TSX_CTRL, host->policy.arch_caps.tsx_ctrl);
 
     printf("Testing MSR_MCU_OPT_CTRL consistency\n");
     test_tsx_msr_consistency(
-        MSR_MCU_OPT_CTRL, host.policy.feat.srbds_ctrl);
+        MSR_MCU_OPT_CTRL, host->policy.feat.srbds_ctrl);
 }
 
 /*
@@ -281,7 +281,7 @@ static void test_rtm_behaviour(void)
     else
         return fail("  Got unexpected behaviour %d\n", rtm_behaviour);
 
-    if ( host.policy.feat.rtm )
+    if ( host->policy.feat.rtm )
     {
         if ( rtm_behaviour == RTM_UD )
             fail("  Host reports RTM, but appears unavailable\n");
@@ -347,13 +347,13 @@ static void test_def_max_policies(void)
     if ( xen_has_pv )
     {
         printf("Testing PV default/max policies\n");
-        test_guest_policies(&pv_max.policy, &pv_default.policy);
+        test_guest_policies(&pv_max->policy, &pv_default->policy);
     }
 
     if ( xen_has_hvm )
     {
         printf("Testing HVM default/max policies\n");
-        test_guest_policies(&hvm_max.policy, &hvm_default.policy);
+        test_guest_policies(&hvm_max->policy, &hvm_default->policy);
     }
 }
 
@@ -369,7 +369,7 @@ static void test_guest(struct xen_domctl_createdomain *c)
 
     printf("  Created d%u\n", domid);
 
-    rc = xc_cpu_policy_get_domain(xch, domid, &guest_policy);
+    rc = xc_cpu_policy_get_domain(xch, domid, guest_policy);
     if ( rc )
     {
         fail("  Failed to obtain domain policy: %d - %s\n",
@@ -377,23 +377,23 @@ static void test_guest(struct xen_domctl_createdomain *c)
         goto out;
     }
 
-    dump_tsx_details(&guest_policy.policy, "Cur:");
+    dump_tsx_details(&guest_policy->policy, "Cur:");
 
     /*
      * Check defaults given to the guest.
      */
-    if ( guest_policy.policy.feat.rtm != (rtm_behaviour == RTM_OK) )
+    if ( guest_policy->policy.feat.rtm != (rtm_behaviour == RTM_OK) )
         fail("  RTM %u in guest, despite rtm behaviour\n",
-             guest_policy.policy.feat.rtm);
+             guest_policy->policy.feat.rtm);
 
-    if ( guest_policy.policy.feat.hle ||
-         guest_policy.policy.feat.tsx_force_abort ||
-         guest_policy.policy.feat.rtm_always_abort ||
-         guest_policy.policy.feat.srbds_ctrl ||
-         guest_policy.policy.arch_caps.tsx_ctrl )
+    if ( guest_policy->policy.feat.hle ||
+         guest_policy->policy.feat.tsx_force_abort ||
+         guest_policy->policy.feat.rtm_always_abort ||
+         guest_policy->policy.feat.srbds_ctrl ||
+         guest_policy->policy.arch_caps.tsx_ctrl )
         fail("  Unexpected features advertised\n");
 
-    if ( host.policy.feat.rtm )
+    if ( host->policy.feat.rtm )
     {
         unsigned int _7b0;
 
@@ -401,11 +401,11 @@ static void test_guest(struct xen_domctl_createdomain *c)
          * If host RTM is available, all combinations of guest flags should be
          * possible.  Flip both HLE/RTM to check non-default settings.
          */
-        _7b0 = (guest_policy.policy.feat.raw[0].b ^=
+        _7b0 = (guest_policy->policy.feat.raw[0].b ^=
                 (bitmaskof(X86_FEATURE_HLE) | bitmaskof(X86_FEATURE_RTM)));
 
         /* Set the new policy. */
-        rc = xc_cpu_policy_set_domain(xch, domid, &guest_policy);
+        rc = xc_cpu_policy_set_domain(xch, domid, guest_policy);
         if ( rc )
         {
             fail("  Failed to set domain policy: %d - %s\n",
@@ -414,7 +414,7 @@ static void test_guest(struct xen_domctl_createdomain *c)
         }
 
         /* Re-get the new policy. */
-        rc = xc_cpu_policy_get_domain(xch, domid, &guest_policy);
+        rc = xc_cpu_policy_get_domain(xch, domid, guest_policy);
         if ( rc )
         {
             fail("  Failed to obtain domain policy: %d - %s\n",
@@ -422,12 +422,12 @@ static void test_guest(struct xen_domctl_createdomain *c)
             goto out;
         }
 
-        dump_tsx_details(&guest_policy.policy, "Cur:");
+        dump_tsx_details(&guest_policy->policy, "Cur:");
 
-        if ( guest_policy.policy.feat.raw[0].b != _7b0 )
+        if ( guest_policy->policy.feat.raw[0].b != _7b0 )
         {
             fail("  Expected CPUID.7[1].b 0x%08x differs from actual 0x%08x\n",
-                 _7b0, guest_policy.policy.feat.raw[0].b);
+                 _7b0, guest_policy->policy.feat.raw[0].b);
             goto out;
         }
     }
@@ -480,11 +480,18 @@ static void test_tsx(void)
 {
     int rc;
 
-    /* Read all policies except raw. */
-    for ( unsigned int i = XEN_SYSCTL_cpu_policy_host;
-          i <= XEN_SYSCTL_cpu_policy_hvm_default; ++i )
+    for ( unsigned int i = 0; i < ARRAY_SIZE(policies); ++i )
     {
-        rc = xc_cpu_policy_get_system(xch, i, &policies[i]);
+        policies[i] = xc_cpu_policy_init(xch);
+        if ( !policies[i] )
+            return fail("Failed to allocate policy[%u]: %d - %s\n",
+                        i, errno, strerror(errno));
+
+        /* Read all policies except raw. */
+        if ( i == XEN_SYSCTL_cpu_policy_raw )
+            continue;
+
+        rc = xc_cpu_policy_get_system(xch, i, policies[i]);
 
         if ( rc == -1 && errno == EOPNOTSUPP )
         {
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index d5e447e9dc..c4dd81f2bb 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -110,7 +110,7 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
      2 /* hv_limit and hv2_limit */ )
 
 /* Maximum number of MSRs written when serialising a cpu_policy. */
-#define MSR_MAX_SERIALISED_ENTRIES 2
+#define MSR_MAX_SERIALISED_ENTRIES 2U
 
 struct cpu_policy
 {
-- 
2.34.1


