Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840188C89C9
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 18:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724317.1129566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s808U-0002As-JX; Fri, 17 May 2024 16:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724317.1129566; Fri, 17 May 2024 16:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s808U-00029a-FM; Fri, 17 May 2024 16:08:46 +0000
Received: by outflank-mailman (input) for mailman id 724317;
 Fri, 17 May 2024 16:08:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVtU=MU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s808T-0001vE-D5
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 16:08:45 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb6cc059-1467-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 18:08:43 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a5a1054cf61so555671566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 09:08:43 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a60eabd3csm739104366b.108.2024.05.17.09.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 09:08:41 -0700 (PDT)
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
X-Inumbo-ID: bb6cc059-1467-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715962122; x=1716566922; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRfRLYM2uaIOUr5UnCxOVm7BN+wzkpxkUR6EABqZEIM=;
        b=Pov1zbFFcTy/bPVEPAoC1lbBrD60fkrDjgoEK4sjxvAP4haZU5WpwR1MUzl92lrwBy
         cbAtZ9h4hDKqQjmiygCb3SJcaOfNcmRFp9eJAT1RrcJ0P20KZ0aOFaP+YbolGTUIUq+d
         EwBqH8tuzH2BIS+hmX+cFPKunnxeuKUP8ojyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715962122; x=1716566922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRfRLYM2uaIOUr5UnCxOVm7BN+wzkpxkUR6EABqZEIM=;
        b=RzjPc8iVrgohLzfur3LITxwK6rO/rcaX7gElSpbK1Ib/Xd/kJbC8sxfELu3xXAK0Vx
         H1eO5xdLvSCIHZWjgljuv2CIFeMzjbqCdHz5RGH5p8Ekry9f9E2XAT21QzoDwEw/pFFE
         teAj8tsiFVYJhEWnYjZEkEgyMnhHY/PhwRaa1IP0e7de9qKKf+Wm5LwvBNrR4UxrSbA2
         qXrLZgvxBy1krOeUd3LN/tb8Ov+4esfOkRWz/NT9CSAUa7tl8KZWEqhQYTOfJCBichII
         7aIPOZOUY+27gWiNliz5AZb3CKSd9rLACUIlyYVzhM/4/SzCIjLWV21XRgYqWV6IsPSZ
         ZZpQ==
X-Gm-Message-State: AOJu0Yz/wAiighj4RgohPOQmFshxiN7EedssCgUwAAzwK8fN0Akr1VfU
	84V3yyxWtuHns+hfnQu7Nw5GnlBWMwsmOEQVTnHPZc1wUrqKGQMFm13UwtapKrKahfo8d41N+Ji
	+
X-Google-Smtp-Source: AGHT+IGYuJX1kmCNe86D53+81GF3VMyvUiycUA9rCHz8TKzTSBHr6hVAAowzwLbNpyRoc4hNwxWmLw==
X-Received: by 2002:a17:906:f883:b0:a5a:8d0f:3ad1 with SMTP id a640c23a62f3a-a5a8d0f4cc1mr965870366b.17.1715962122098;
        Fri, 17 May 2024 09:08:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/2] tools/xg: Streamline cpu policy serialise/deserialise calls
Date: Fri, 17 May 2024 17:08:34 +0100
Message-Id: <c6c89012d189a2c3077b3e224942b33028e29336.1715954111.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715954111.git.alejandro.vallejo@cloud.com>
References: <cover.1715954111.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The idea is to use xc_cpu_policy_t as a single object containing both the
serialised and deserialised forms of the policy. Note that we need lengths
for the arrays, as the serialised policies may be shorter than the array
capacities.

* Add the serialised lengths to the struct so we can distinguish
  between length and capacity of the serialisation buffers.
* Remove explicit buffer+lengths in serialise/deserialise calls
  and use the internal buffer inside xc_cpu_policy_t instead.
* Refactor everything to use the new serialisation functions.
* Remove redundant serialization calls and avoid allocating dynamic
  memory aside from the policy objects in xen-cpuid. Also minor cleanup
  in the policy print call sites.

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Removed v1/patch1.
  * Added the accessors suggested in feedback.
---
 tools/include/xenguest.h            |  8 ++-
 tools/libs/guest/xg_cpuid_x86.c     | 98 ++++++++++++++++++++---------
 tools/libs/guest/xg_private.h       |  2 +
 tools/libs/guest/xg_sr_common_x86.c | 54 ++++++----------
 tools/misc/xen-cpuid.c              | 43 ++++---------
 5 files changed, 104 insertions(+), 101 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b772a..563811cd8dde 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -799,14 +799,16 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t *policy);
 
 /* Manipulate a policy via architectural representations. */
-int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
-                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
-                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *policy);
 int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                const xen_cpuid_leaf_t *leaves,
                                uint32_t nr);
 int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
+int xc_cpu_policy_get_leaves(xc_interface *xch, const xc_cpu_policy_t *policy,
+                             const xen_cpuid_leaf_t **leaves, uint32_t *nr);
+int xc_cpu_policy_get_msrs(xc_interface *xch, const xc_cpu_policy_t *policy,
+                           const xen_msr_entry_t **msrs, uint32_t *nr);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4453178100ad..4f4b86b59470 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -834,14 +834,13 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
     }
 }
 
-static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
-                              unsigned int nr_leaves, unsigned int nr_entries)
+static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy)
 {
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     int rc;
 
     rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves,
-                                    nr_leaves, &err_leaf, &err_subleaf);
+                                    policy->nr_leaves, &err_leaf, &err_subleaf);
     if ( rc )
     {
         if ( err_leaf != -1 )
@@ -851,7 +850,7 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
     }
 
     rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs,
-                                  nr_entries, &err_msr);
+                                  policy->nr_msrs, &err_msr);
     if ( rc )
     {
         if ( err_msr != -1 )
@@ -878,7 +877,10 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
         return rc;
     }
 
-    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
+    policy->nr_leaves = nr_leaves;
+    policy->nr_msrs = nr_msrs;
+
+    rc = deserialize_policy(xch, policy);
     if ( rc )
     {
         errno = -rc;
@@ -903,7 +905,10 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
         return rc;
     }
 
-    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
+    policy->nr_leaves = nr_leaves;
+    policy->nr_msrs = nr_msrs;
+
+    rc = deserialize_policy(xch, policy);
     if ( rc )
     {
         errno = -rc;
@@ -917,17 +922,14 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t *policy)
 {
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
-    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
     int rc;
 
-    rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
-                                 policy->msrs, &nr_msrs);
+    rc = xc_cpu_policy_serialise(xch, policy);
     if ( rc )
         return rc;
 
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, policy->leaves,
-                                  nr_msrs, policy->msrs,
+    rc = xc_set_domain_cpu_policy(xch, domid, policy->nr_leaves, policy->leaves,
+                                  policy->nr_msrs, policy->msrs,
                                   &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
@@ -942,34 +944,32 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
     return rc;
 }
 
-int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
-                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
-                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
+int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *p)
 {
+    unsigned int nr_leaves = ARRAY_SIZE(p->leaves);
+    unsigned int nr_msrs = ARRAY_SIZE(p->msrs);
     int rc;
 
-    if ( leaves )
+    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
+    if ( rc )
     {
-        rc = x86_cpuid_copy_to_buffer(&p->policy, leaves, nr_leaves);
-        if ( rc )
-        {
-            ERROR("Failed to serialize CPUID policy");
-            errno = -rc;
-            return -1;
-        }
+        ERROR("Failed to serialize CPUID policy");
+        errno = -rc;
+        return -1;
     }
 
-    if ( msrs )
+    p->nr_leaves = nr_leaves;
+
+    rc = x86_msr_copy_to_buffer(&p->policy, p->msrs, &nr_msrs);
+    if ( rc )
     {
-        rc = x86_msr_copy_to_buffer(&p->policy, msrs, nr_msrs);
-        if ( rc )
-        {
-            ERROR("Failed to serialize MSR policy");
-            errno = -rc;
-            return -1;
-        }
+        ERROR("Failed to serialize MSR policy");
+        errno = -rc;
+        return -1;
     }
 
+    p->nr_msrs = nr_msrs;
+
     errno = 0;
     return 0;
 }
@@ -1012,6 +1012,42 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
+int xc_cpu_policy_get_leaves(xc_interface *xch,
+                             const xc_cpu_policy_t *policy,
+                             const xen_cpuid_leaf_t **leaves,
+                             uint32_t *nr)
+{
+    if ( !policy )
+    {
+        ERROR("Failed to fetch CPUID leaves from policy object");
+        errno = -EINVAL;
+        return -1;
+    }
+
+    *leaves = policy->leaves;
+    *nr = policy->nr_leaves;
+
+    return 0;
+}
+
+int xc_cpu_policy_get_msrs(xc_interface *xch,
+                           const xc_cpu_policy_t *policy,
+                           const xen_msr_entry_t **msrs,
+                           uint32_t *nr)
+{
+    if ( !policy )
+    {
+        ERROR("Failed to fetch MSRs from policy object");
+        errno = -EINVAL;
+        return -1;
+    }
+
+    *msrs = policy->msrs;
+    *nr = policy->nr_msrs;
+
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index d73947094f2e..a65dae818f3d 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -177,6 +177,8 @@ struct xc_cpu_policy {
     struct cpu_policy policy;
     xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
     xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
+    uint32_t nr_leaves;
+    uint32_t nr_msrs;
 };
 #endif /* x86 */
 
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 563b4f016877..832047756e58 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -1,4 +1,5 @@
 #include "xg_sr_common_x86.h"
+#include "xg_sr_stream_format.h"
 
 int write_x86_tsc_info(struct xc_sr_context *ctx)
 {
@@ -45,54 +46,37 @@ int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
-    struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
-    uint32_t nr_leaves = 0, nr_msrs = 0;
-    xc_cpu_policy_t *policy = NULL;
+    struct xc_sr_record record;
+    xc_cpu_policy_t *policy = xc_cpu_policy_init();
     int rc;
 
-    if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) < 0 )
-    {
-        PERROR("Unable to get CPU Policy size");
-        return -1;
-    }
-
-    cpuid.data = malloc(nr_leaves * sizeof(xen_cpuid_leaf_t));
-    msrs.data  = malloc(nr_msrs   * sizeof(xen_msr_entry_t));
-    policy = xc_cpu_policy_init();
-    if ( !cpuid.data || !msrs.data || !policy )
-    {
-        ERROR("Cannot allocate memory for CPU Policy");
-        rc = -1;
-        goto out;
-    }
-
-    if ( xc_cpu_policy_get_domain(xch, ctx->domid, policy) )
+    if ( !policy || xc_cpu_policy_get_domain(xch, ctx->domid, policy) )
     {
         PERROR("Unable to get d%d CPU Policy", ctx->domid);
         rc = -1;
         goto out;
     }
-    if ( xc_cpu_policy_serialise(xch, policy, cpuid.data, &nr_leaves,
-                                 msrs.data, &nr_msrs) )
-    {
-        PERROR("Unable to serialize d%d CPU Policy", ctx->domid);
-        rc = -1;
-        goto out;
-    }
 
-    cpuid.length = nr_leaves * sizeof(xen_cpuid_leaf_t);
-    if ( cpuid.length )
+    record = (struct xc_sr_record) {
+        .type = REC_TYPE_X86_CPUID_POLICY,
+        .data = policy->leaves,
+        .length = policy->nr_leaves * sizeof(*policy->leaves),
+    };
+    if ( record.length )
     {
-        rc = write_record(ctx, &cpuid);
+        rc = write_record(ctx, &record);
         if ( rc )
             goto out;
     }
 
-    msrs.length = nr_msrs * sizeof(xen_msr_entry_t);
-    if ( msrs.length )
+    record = (struct xc_sr_record) {
+        .type = REC_TYPE_X86_MSR_POLICY,
+        .data = policy->msrs,
+        .length = policy->nr_msrs * sizeof(*policy->msrs),
+    };
+    if ( record.length )
     {
-        rc = write_record(ctx, &msrs);
+        rc = write_record(ctx, &record);
         if ( rc )
             goto out;
     }
@@ -100,8 +84,6 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
     rc = 0;
 
  out:
-    free(cpuid.data);
-    free(msrs.data);
     xc_cpu_policy_destroy(policy);
 
     return rc;
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 8893547bebce..1c9ba6d32060 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -409,17 +409,21 @@ static void dump_info(xc_interface *xch, bool detail)
     free(fs);
 }
 
-static void print_policy(const char *name,
-                         xen_cpuid_leaf_t *leaves, uint32_t nr_leaves,
-                         xen_msr_entry_t *msrs, uint32_t nr_msrs)
+static void print_policy(xc_interface *xch, const char *name, const xc_cpu_policy_t *policy)
 {
-    unsigned int l;
+    const xen_cpuid_leaf_t *leaves;
+    const xen_msr_entry_t *msrs;
+    uint32_t nr_leaves, nr_msrs;
+
+    if ( xc_cpu_policy_get_leaves(xch, policy, &leaves, &nr_leaves) ||
+         xc_cpu_policy_get_msrs(xch, policy, &msrs, &nr_msrs) )
+        err(1, "print_policy()");
 
     printf("%s policy: %u leaves, %u MSRs\n", name, nr_leaves, nr_msrs);
     printf(" CPUID:\n");
     printf("  %-8s %-8s -> %-8s %-8s %-8s %-8s\n",
            "leaf", "subleaf", "eax", "ebx", "ecx", "edx");
-    for ( l = 0; l < nr_leaves; ++l )
+    for ( uint32_t l = 0; l < nr_leaves; ++l )
     {
         /* Skip empty leaves. */
         if ( !leaves[l].a && !leaves[l].b && !leaves[l].c && !leaves[l].d )
@@ -432,7 +436,7 @@ static void print_policy(const char *name,
 
     printf(" MSRs:\n");
     printf("  %-8s -> %-16s\n", "index", "value");
-    for ( l = 0; l < nr_msrs; ++l )
+    for ( uint32_t l = 0; l < nr_msrs; ++l )
         printf("  %08x -> %016"PRIx64"\n",
                msrs[l].idx, msrs[l].val);
 }
@@ -539,8 +543,6 @@ int main(int argc, char **argv)
             [ XEN_SYSCTL_cpu_policy_pv_default ]   = "PV Default",
             [ XEN_SYSCTL_cpu_policy_hvm_default ]  = "HVM Default",
         };
-        xen_cpuid_leaf_t *leaves;
-        xen_msr_entry_t *msrs;
         uint32_t i, max_leaves, max_msrs;
 
         xc_interface *xch = xc_interface_open(0, 0, 0);
@@ -557,36 +559,21 @@ int main(int argc, char **argv)
             printf("Xen reports there are maximum %u leaves and %u MSRs\n",
                    max_leaves, max_msrs);
 
-        leaves = calloc(max_leaves, sizeof(xen_cpuid_leaf_t));
-        if ( !leaves )
-            err(1, "calloc(max_leaves)");
-        msrs = calloc(max_msrs, sizeof(xen_msr_entry_t));
-        if ( !msrs )
-            err(1, "calloc(max_msrs)");
-
         if ( domid != -1 )
         {
             char name[20];
-            uint32_t nr_leaves = max_leaves;
-            uint32_t nr_msrs = max_msrs;
 
             if ( xc_cpu_policy_get_domain(xch, domid, policy) )
                 err(1, "xc_cpu_policy_get_domain(, %d, )", domid);
-            if ( xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves,
-                                         msrs, &nr_msrs) )
-                err(1, "xc_cpu_policy_serialise");
 
             snprintf(name, sizeof(name), "Domain %d", domid);
-            print_policy(name, leaves, nr_leaves, msrs, nr_msrs);
+            print_policy(xch, name, policy);
         }
         else
         {
             /* Get system policies */
             for ( i = 0; i < ARRAY_SIZE(sys_policies); ++i )
             {
-                uint32_t nr_leaves = max_leaves;
-                uint32_t nr_msrs = max_msrs;
-
                 if ( xc_cpu_policy_get_system(xch, i, policy) )
                 {
                     if ( errno == EOPNOTSUPP )
@@ -598,18 +585,12 @@ int main(int argc, char **argv)
 
                     err(1, "xc_cpu_policy_get_system(, %s, )", sys_policies[i]);
                 }
-                if ( xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves,
-                                             msrs, &nr_msrs) )
-                    err(1, "xc_cpu_policy_serialise");
 
-                print_policy(sys_policies[i], leaves, nr_leaves,
-                             msrs, nr_msrs);
+                print_policy(xch, sys_policies[i], policy);
             }
         }
 
         xc_cpu_policy_destroy(policy);
-        free(leaves);
-        free(msrs);
         xc_interface_close(xch);
     }
     else if ( mode == MODE_INFO || mode == MODE_DETAIL )
-- 
2.34.1


