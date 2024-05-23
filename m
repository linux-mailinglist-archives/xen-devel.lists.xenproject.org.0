Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E28CCF84
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 11:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728282.1133166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA4xI-0004L8-NS; Thu, 23 May 2024 09:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728282.1133166; Thu, 23 May 2024 09:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA4xI-0004JQ-Ke; Thu, 23 May 2024 09:41:48 +0000
Received: by outflank-mailman (input) for mailman id 728282;
 Thu, 23 May 2024 09:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6d0=M2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sA4xH-00043S-3I
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 09:41:47 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d7a555-18e8-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 11:41:43 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34d7d04808bso1550423f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 02:41:43 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354c7df311esm9533383f8f.3.2024.05.23.02.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:41:42 -0700 (PDT)
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
X-Inumbo-ID: a9d7a555-18e8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716457303; x=1717062103; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4DEPVfsDZMMBgcybIhN0dPitEHEoXs+kEgdv7X07o8=;
        b=PLmfQk065Nm7BW7ZPPoD/qejUW34303F1zR1jCnXWxZwVdIIk5MGi0wZzkJejUb027
         AyAmjZV/wYQ1Q5b8unyNv83wzSdtqsAUCewS5B5XBQtkWXRXL3Llnll99WToZkRD56uG
         AkuC+9OlcmiLR7U4M5xrGNiccNoz1Ysfu0vgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457303; x=1717062103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4DEPVfsDZMMBgcybIhN0dPitEHEoXs+kEgdv7X07o8=;
        b=VrXS6wejdV7DmGeL0BNu7FQxe5lYsYH8MUzPeib8/F0yM/M+STnoKSVPRbtlIRjazE
         xf7k4EkBSs/SpZIG0nfXZVBPw3xt2N8tAcLh7lFdS47yMC2uaAPPRA+zm96ExtoSxCoJ
         1HiT8kiPEegvgbdfeItKt/OAgBk4udy4wTDJdzZK/r8K6qMlDPVbNClGO1Oiw8WvcdIx
         LInutPIumtIx7nRiNRk4nOPAafMdVbMYFBe4pv7giZB+vfKEbjQZKYJH6RF2586jGu60
         8+VPBD1O3YYdHs53mWB18yUC5GReg1pvfUzTtfL81YUee8KHwZBROOFp5rSl9rgWbxSp
         8eqQ==
X-Gm-Message-State: AOJu0YxciTjkklnlsm0N9wXrKpHnQ9Hr9vPwVfa1oXp/v6PgpXDnBhar
	VrnkCDiIcHDCsHGWSptobf7I7hjqIT54ZEiUy/2pm8T+Q9FrbmAOngd+RZTmb+uXlF9Fq6quM3R
	M
X-Google-Smtp-Source: AGHT+IEJytYQW8m3Pu7Ukg+JaaaH8S60s+n5e0NtgoSsx2Rit7ASpqlL97DlKIg4YVIt5cqTMF5k7Q==
X-Received: by 2002:adf:9bdc:0:b0:354:e729:c100 with SMTP id ffacd0b85a97d-354e729c251mr3530141f8f.3.1716457302632;
        Thu, 23 May 2024 02:41:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/2] tools/xg: Streamline cpu policy serialise/deserialise calls
Date: Thu, 23 May 2024 10:41:29 +0100
Message-Id: <5c6ee74b60bad4eb9cc8e17dbfcf7158d38bd32c.1716457040.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716457040.git.alejandro.vallejo@cloud.com>
References: <cover.1716457040.git.alejandro.vallejo@cloud.com>
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
v3:
  * Better context scoping in xg_sr_common_x86.
    * Can't be const because write_record() takes non-const.
  * Adjusted line length of xen-cpuid's print_policy.
  * Adjusted error messages in xen-cpuid's print_policy.
  * Reverted removal of overscoped loop indices.
---
 tools/include/xenguest.h            |  8 ++-
 tools/libs/guest/xg_cpuid_x86.c     | 98 ++++++++++++++++++++---------
 tools/libs/guest/xg_private.h       |  2 +
 tools/libs/guest/xg_sr_common_x86.c | 56 ++++++-----------
 tools/misc/xen-cpuid.c              | 41 ++++--------
 5 files changed, 106 insertions(+), 99 deletions(-)

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


