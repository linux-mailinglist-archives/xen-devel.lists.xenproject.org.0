Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C77D8D393B
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732068.1137886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKKC-0006p3-HF; Wed, 29 May 2024 14:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732068.1137886; Wed, 29 May 2024 14:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKKC-0006mx-EL; Wed, 29 May 2024 14:30:44 +0000
Received: by outflank-mailman (input) for mailman id 732068;
 Wed, 29 May 2024 14:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCKKB-0006Xm-4R
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:30:43 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07273fc0-1dc8-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 16:30:42 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a62ef52e837so236580566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:30:42 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c937b92sm720180266b.68.2024.05.29.07.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:30:40 -0700 (PDT)
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
X-Inumbo-ID: 07273fc0-1dc8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716993041; x=1717597841; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLhg3CnTs3yrTCfULMEgcsfOyxcHrWQPcRCfZl8y51o=;
        b=kAfA0mVn4zFL9VjrbVGUTMeFhuNGOafvVMG+d1rYfm6T425ZJiIU3oRNtzvK6p6KTr
         8A1iR43uuqRxxzDoLNq2v9s/uG3xjAsnaz0+50zfx7CCJvL9XWEo94gBpJ75DZrmLM7J
         7IlJqpvZXHRnV+1BblU14d5H++wYRt8vk0qNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993041; x=1717597841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLhg3CnTs3yrTCfULMEgcsfOyxcHrWQPcRCfZl8y51o=;
        b=msXtEEmmMFMjleOO9wH2lIRBtOG3uUJQjnOQhIPBhpYQDKKDVwmmc3XNpx64eDqVoh
         meulTDQGoy5ZVmKfzt+JT0rS/+a+RJfQVJ14D1h6L6Y2PssRYeA4cE0zf1JpesIea8Kc
         nheMdwxlWqTu2Rvu4VddbbnEfVB7qxLMM6dGWwt9MBF/GN5BjVexDoIJpmA/yXN7D8G7
         TIOIRPy70xic8APgiTnzqtffY8dOBzS9p4Ktk9/6Eibh3wBK3AUJsNpHevm5WYRSakfo
         IzLI/qU2UeC/LWj1Q16dAAVGq5A66/pRhVQ35jBBLIV0Pp/TfjNVGtXu+LaIeoy45pjT
         wmRw==
X-Gm-Message-State: AOJu0Yy7DeEyWZl5Eg2aN5HUcbn/hL8ppFMUoMH7wAJMjfePGz/D9nU8
	qbch+YEntg2mUcr5vbuq4DrSKEA0sJlNPqqYla1E95jaQhXzNybxVXQkz+0zkt3fiZ+oXDOhWkm
	u
X-Google-Smtp-Source: AGHT+IGwXxQgnWzo5aeNTixO7+ynUQSRC4UA4W07qr2Zdq6yTTCP6CWsteUJQjhk8q1Ru8XYg2mhxg==
X-Received: by 2002:a17:906:f813:b0:a59:a85d:31c6 with SMTP id a640c23a62f3a-a62651123b4mr1050704066b.66.1716993041280;
        Wed, 29 May 2024 07:30:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/2] tools/xg: Streamline cpu policy serialise/deserialise calls
Date: Wed, 29 May 2024 15:30:37 +0100
Message-Id: <f456bfb8996bb1fd4b965755622cda6fcb61b297.1716992707.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716992707.git.alejandro.vallejo@cloud.com>
References: <cover.1716992707.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4:
  * Clarify with a comment the semantics of the serialised buffer accessors
  * Remove local variables in policy serialiser
---
 tools/include/xenguest.h            | 14 ++++-
 tools/libs/guest/xg_cpuid_x86.c     | 94 +++++++++++++++++++----------
 tools/libs/guest/xg_private.h       |  2 +
 tools/libs/guest/xg_sr_common_x86.c | 56 ++++++-----------
 tools/misc/xen-cpuid.c              | 41 ++++---------
 5 files changed, 108 insertions(+), 99 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b772a..85d56f26537b 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -799,15 +799,23 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
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
 
+/*
+ * Accessors for the serialised forms of the policy. The outputs are pointers
+ * into the policy object and not fresh allocations, so their lifetimes are tied
+ * to the policy object itself.
+ */
+int xc_cpu_policy_get_leaves(xc_interface *xch, const xc_cpu_policy_t *policy,
+                             const xen_cpuid_leaf_t **leaves, uint32_t *nr);
+int xc_cpu_policy_get_msrs(xc_interface *xch, const xc_cpu_policy_t *policy,
+                           const xen_msr_entry_t **msrs, uint32_t *nr);
+
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4453178100ad..6cab5c60bb41 100644
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
@@ -942,32 +944,26 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
     return rc;
 }
 
-int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
-                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
-                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
+int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *p)
 {
     int rc;
+    p->nr_leaves = ARRAY_SIZE(p->leaves);
+    p->nr_msrs = ARRAY_SIZE(p->msrs);
 
-    if ( leaves )
+    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &p->nr_leaves);
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
+    rc = x86_msr_copy_to_buffer(&p->policy, p->msrs, &p->nr_msrs);
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
 
     errno = 0;
@@ -1012,6 +1008,42 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
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
index 563b4f016877..a0d67c3211c6 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -1,4 +1,5 @@
 #include "xg_sr_common_x86.h"
+#include "xg_sr_stream_format.h"
 
 int write_x86_tsc_info(struct xc_sr_context *ctx)
 {
@@ -45,54 +46,39 @@ int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
-    struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
-    uint32_t nr_leaves = 0, nr_msrs = 0;
-    xc_cpu_policy_t *policy = NULL;
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
+
+    if ( policy->nr_leaves )
     {
-        rc = write_record(ctx, &cpuid);
+        struct xc_sr_record record = {
+            .type = REC_TYPE_X86_CPUID_POLICY,
+            .data = policy->leaves,
+            .length = policy->nr_leaves * sizeof(*policy->leaves),
+        };
+
+        rc = write_record(ctx, &record);
         if ( rc )
             goto out;
     }
 
-    msrs.length = nr_msrs * sizeof(xen_msr_entry_t);
-    if ( msrs.length )
+    if ( policy->nr_msrs )
     {
-        rc = write_record(ctx, &msrs);
+        struct xc_sr_record record = {
+            .type = REC_TYPE_X86_MSR_POLICY,
+            .data = policy->msrs,
+            .length = policy->nr_msrs * sizeof(*policy->msrs),
+        };
+
+        rc = write_record(ctx, &record);
         if ( rc )
             goto out;
     }
@@ -100,8 +86,6 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
     rc = 0;
 
  out:
-    free(cpuid.data);
-    free(msrs.data);
     xc_cpu_policy_destroy(policy);
 
     return rc;
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 4c4593528dfe..488f43378406 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -156,12 +156,18 @@ static void dump_info(xc_interface *xch, bool detail)
 
     free(fs);
 }
-
-static void print_policy(const char *name,
-                         xen_cpuid_leaf_t *leaves, uint32_t nr_leaves,
-                         xen_msr_entry_t *msrs, uint32_t nr_msrs)
+static void print_policy(xc_interface *xch, const char *name,
+                         const xc_cpu_policy_t *policy)
 {
     unsigned int l;
+    const xen_cpuid_leaf_t *leaves;
+    const xen_msr_entry_t *msrs;
+    uint32_t nr_leaves, nr_msrs;
+
+    if ( xc_cpu_policy_get_leaves(xch, policy, &leaves, &nr_leaves) )
+        err(1, "xc_cpu_policy_get_leaves()");
+    if ( xc_cpu_policy_get_msrs(xch, policy, &msrs, &nr_msrs) )
+        err(1, "xc_cpu_policy_get_msrs()");
 
     printf("%s policy: %u leaves, %u MSRs\n", name, nr_leaves, nr_msrs);
     printf(" CPUID:\n");
@@ -287,8 +293,6 @@ int main(int argc, char **argv)
             [ XEN_SYSCTL_cpu_policy_pv_default ]   = "PV Default",
             [ XEN_SYSCTL_cpu_policy_hvm_default ]  = "HVM Default",
         };
-        xen_cpuid_leaf_t *leaves;
-        xen_msr_entry_t *msrs;
         uint32_t i, max_leaves, max_msrs;
 
         xc_interface *xch = xc_interface_open(0, 0, 0);
@@ -305,36 +309,21 @@ int main(int argc, char **argv)
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
@@ -346,18 +335,12 @@ int main(int argc, char **argv)
 
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


