Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DE584CFD9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 18:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677848.1054756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXluM-0005zN-Tp; Wed, 07 Feb 2024 17:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677848.1054756; Wed, 07 Feb 2024 17:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXluM-0005wp-Pr; Wed, 07 Feb 2024 17:40:26 +0000
Received: by outflank-mailman (input) for mailman id 677848;
 Wed, 07 Feb 2024 17:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q5t=JQ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rXluK-0005Tj-Mx
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 17:40:24 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f80944d2-c5df-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 18:40:22 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a2d7e2e7fe0so10964766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 09:40:22 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 op3-20020a170906bce300b00a37669280d1sm976355ejb.141.2024.02.07.09.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 09:40:21 -0800 (PST)
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
X-Inumbo-ID: f80944d2-c5df-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707327621; x=1707932421; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVtApRo3oDb95gESnvgdip5hWmKbe9Gt8uYW92ZcjgY=;
        b=IHKLTSYqGYMG2FbH4XhU2/4dg8HjyG7XKMChdFW0AzS2SS0+rBa/mIg1pLePXoV6Cj
         6TloVV9S5DRGe8SpK3kjoXh02ycAD5nidZo6V5bSfqYnhBKbsd41VkZRGCJD4l/J9HQR
         H7r123liUYtSaJWYGIsGgCtS3qIJxLiLhAIBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707327621; x=1707932421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVtApRo3oDb95gESnvgdip5hWmKbe9Gt8uYW92ZcjgY=;
        b=SaLmk5gg3BKOST9x3myILd3xwm54635Y2x7M7a083+S4m+ULArgLdIUNt9mEhHHZEx
         EE/rqEnhV7AmYnVOM7+CJF0D8O+hZb2tbgSgZYpp2KONPiun4ZJZXb+GzPV23fndW3R4
         NoK7zTL7ZSi9KZwvijWv+b7un7PDRwfE324OesvI9CjzQYuK/bTe8R48EpSS6ZAeKCyi
         GiVaBUErcuvNR8+fkgbVEd8ydvuk0jKsycM3Kki1xsIlIrsFCPzTLzeozbQVNWMW0CEI
         owdC0sbvieVAKSo70O/Q3qtPDI0WDZ0UA0Ze0q7ULl78ZmoYUNtpkUKjdYPvO1QTJVO1
         Jy/g==
X-Gm-Message-State: AOJu0YybHxX/YS3sJS14HVpOq+zdbp9VGCErpy6JHzYhbQfKBXpU941t
	SsB/Yt2WQwpJPLcMwTqeH95ho5J+dDKHs0nGmt7HutWxSfMxQIajGwzzqDj6RoNaebax3kTyk+f
	Q
X-Google-Smtp-Source: AGHT+IFti7lLnLxiOpm9L+6Lm+EqtJakdk0jtGAtrQZIv4hyXS+2eHGRGr7hF7VGK4dj1jA3WvSInw==
X-Received: by 2002:a17:907:7d89:b0:a38:c2f9:4ee with SMTP id oz9-20020a1709077d8900b00a38c2f904eemr337167ejc.0.1707327621345;
        Wed, 07 Feb 2024 09:40:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUu8JHBp8+s80ogwlQxOobccH2V6n8CB4NFjDsKsHcVsCjocjr8+LHqnciFLJV+cvz9ipel+qPrGpwUWU0rHratbFeRltuKDTAyMOW8946xPYF9IEOF5rfdEE2QGfsdEe6kvCdzeDMMsbTxduZ22i6lh+riJqeTHys8O8ScEF3Au59iVHk08WNMgf8KFBgY313lRhjvzc7aJz80UODN6Nv1XJ6A6Xi9E/la8Q==
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] tools/xg: Streamline cpu policy serialise/deserialise calls
Date: Wed,  7 Feb 2024 17:39:56 +0000
Message-Id: <20240207173957.19811-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
References: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
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
Splitting this patch in several is quite annoying, as it implies
artificially creating duplicates of the (de)serialization functions, and
applying them little by little. The resulting diffs are not much better
than this.
---
 tools/include/xenguest.h            |  6 +--
 tools/libs/guest/xg_cpuid_x86.c     | 62 ++++++++++++++---------------
 tools/libs/guest/xg_sr_common_x86.c | 54 +++++++++----------------
 tools/misc/xen-cpuid.c              | 40 +++++--------------
 4 files changed, 61 insertions(+), 101 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 4e9078fdee4d..5c287b4a210c 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -789,7 +789,9 @@ xen_pfn_t *xc_map_m2p(xc_interface *xch,
 typedef struct xc_cpu_policy {
     struct cpu_policy policy;
     xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
+    uint32_t nr_leaves;
     xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
+    uint32_t nr_msrs;
 } xc_cpu_policy_t;
 
 /* Create and free a xc_cpu_policy object. */
@@ -805,9 +807,7 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t *policy);
 
 /* Manipulate a policy via architectural representations. */
-int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
-                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
-                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *policy);
 int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                const xen_cpuid_leaf_t *leaves,
                                uint32_t nr);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4453178100ad..5699a26b946e 100644
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
index 46abdb914092..1d4761d9ad9f 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -403,17 +403,18 @@ static void dump_info(xc_interface *xch, bool detail)
     free(fs);
 }
 
-static void print_policy(const char *name,
-                         xen_cpuid_leaf_t *leaves, uint32_t nr_leaves,
-                         xen_msr_entry_t *msrs, uint32_t nr_msrs)
+static void print_policy(const char *name, xc_cpu_policy_t *policy)
 {
-    unsigned int l;
+    const xen_cpuid_leaf_t *leaves = policy->leaves;
+    const xen_msr_entry_t *msrs = policy->msrs;
+    uint32_t nr_leaves = policy->nr_leaves;
+    uint32_t nr_msrs = policy->nr_msrs;
 
     printf("%s policy: %u leaves, %u MSRs\n", name, nr_leaves, nr_msrs);
     printf(" CPUID:\n");
     printf("  %-8s %-8s -> %-8s %-8s %-8s %-8s\n",
            "leaf", "subleaf", "eax", "ebx", "ecx", "edx");
-    for ( l = 0; l < nr_leaves; ++l )
+    for ( uint32_t l = 0; l < nr_leaves; ++l )
     {
         /* Skip empty leaves. */
         if ( !leaves[l].a && !leaves[l].b && !leaves[l].c && !leaves[l].d )
@@ -426,7 +427,7 @@ static void print_policy(const char *name,
 
     printf(" MSRs:\n");
     printf("  %-8s -> %-16s\n", "index", "value");
-    for ( l = 0; l < nr_msrs; ++l )
+    for ( uint32_t l = 0; l < nr_msrs; ++l )
         printf("  %08x -> %016"PRIx64"\n",
                msrs[l].idx, msrs[l].val);
 }
@@ -533,8 +534,6 @@ int main(int argc, char **argv)
             [ XEN_SYSCTL_cpu_policy_pv_default ]   = "PV Default",
             [ XEN_SYSCTL_cpu_policy_hvm_default ]  = "HVM Default",
         };
-        xen_cpuid_leaf_t *leaves;
-        xen_msr_entry_t *msrs;
         uint32_t i, max_leaves, max_msrs;
 
         xc_interface *xch = xc_interface_open(0, 0, 0);
@@ -551,36 +550,21 @@ int main(int argc, char **argv)
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
+            print_policy(name, policy);
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
@@ -592,18 +576,12 @@ int main(int argc, char **argv)
 
                     err(1, "xc_cpu_policy_get_system(, %s, )", sys_policies[i]);
                 }
-                if ( xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves,
-                                             msrs, &nr_msrs) )
-                    err(1, "xc_cpu_policy_serialise");
 
-                print_policy(sys_policies[i], leaves, nr_leaves,
-                             msrs, nr_msrs);
+                print_policy(sys_policies[i], policy);
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


