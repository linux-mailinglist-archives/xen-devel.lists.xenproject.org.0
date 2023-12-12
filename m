Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E680E98B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 11:57:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652936.1019109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0S6-0000w6-1T; Tue, 12 Dec 2023 10:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652936.1019109; Tue, 12 Dec 2023 10:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0S5-0000uH-Uq; Tue, 12 Dec 2023 10:57:25 +0000
Received: by outflank-mailman (input) for mailman id 652936;
 Tue, 12 Dec 2023 10:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uNK=HX=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rD0S3-0000tY-Mc
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 10:57:23 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39f57206-98dd-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 11:57:22 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33635163fe6so186703f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 02:57:22 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c314500b0040b56f2cce3sm18321291wmo.23.2023.12.12.02.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 02:57:20 -0800 (PST)
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
X-Inumbo-ID: 39f57206-98dd-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702378641; x=1702983441; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQntZ9IVfXXUVY24eUxCSk33M52J4eNjxmyKF3h3sV8=;
        b=k5Vax9dNJbhZxPSE8xmAfw3F3tGJ86Z8vKCrZE7+nGhp4sLjVryKbDEuemUlcq9q9J
         cZY2md57sCJfY0HEu2SZsb2aWvXRrYOGB0eucl7rjoJX2MGynk0vflIUyJgDZBuRHKR/
         nGUQVW+IgG9gcdz92XZLZPmYTYDhfFbvYjf+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702378641; x=1702983441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQntZ9IVfXXUVY24eUxCSk33M52J4eNjxmyKF3h3sV8=;
        b=klcOiz5PPHwWnxmY1bPG3TIxvfL9HL4od2jZvQUc3rFob+vfpN6BSmchEO2J8XaxQs
         QL8JZ5YlNBruKxpZxGsHPmZrwG1mz73YHIy9oFi6T4ibUI5IaxHdaIQOoKm48PiUNH/w
         iajUs/BR+GCIWgsriaOJvRek8H5mBFxYWiwSw0iDM+hFkXDXPRUzrmXhQRss75IuXgf8
         UvS+Iphy+zxfJUGgNR3LTV9M7VYh5gNrVYNIFeXLIDu1G0e4JfdP6OjkDeCC8jkM+IO2
         Wz2grR1lASJ1K/zLEA93Qp4Ug11ARm0j2lo+NI7TDYJY2R6vKzAnAUiQDMn9BPMB/es2
         jk1A==
X-Gm-Message-State: AOJu0Yx8oj3Gln5g+aeTpv8HiIvr8r9b1Wh0M0QB//R5DUYQOJipFVOd
	S2E6MjqgN6JvqNNwWrHFL+7Z70sCh4yzPI2VrMI=
X-Google-Smtp-Source: AGHT+IHG2qvH/AxbT4iFo2lXvF+I4JV5xHpjgdowuxyEtXvvHYXMT8/tgrsDAsfKVL7feK5RhWGyLw==
X-Received: by 2002:a05:600c:4749:b0:40c:31e6:cae3 with SMTP id w9-20020a05600c474900b0040c31e6cae3mr2819959wmo.115.1702378641131;
        Tue, 12 Dec 2023 02:57:21 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xg: Reserialise CPU policies with the allocated number of leaves.
Date: Tue, 12 Dec 2023 10:57:17 +0000
Message-Id: <20231212105717.6031-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The procedure used to customize the domain CPU policy is broken when
toolstack tries to set leaves (with subleaves) that the hypervisor didn't
need to serialise (i.e: because they where empty subleaves).

During typical domain creation xg does the following:

  1. Probe Xen for max #leaves that a policy may have
  2. Allocate memory for that many leaves
  3. Tell the hypervisor to dump the policy in the allocated buffer
  4. Deserialise it
  5. Modify it
  6. Reserialise it
  7. Send it back to Xen

The problem is that (3) overrides nr_leaves, which then makes (6) fail in
the case where (5) has added subleaves that Xen understands but didn't need
to serialize on (3).

The fix uses an opaque CPU policy object so we can (a) avoid probing Xen
for sizes, and (b) trivially have knowledge of the actual size of the
buffer.

While at it, fix xc_cpu_policy_destroy() to preserve errno accross free()

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 98 +++++++++++++++------------------
 1 file changed, 45 insertions(+), 53 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index db5aebc815..4453178100 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -583,13 +583,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     int rc;
     bool hvm;
     xc_domaininfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpu_policy *p = NULL;
+    struct xc_cpu_policy *p = xc_cpu_policy_init();
+    unsigned int i, nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
 
+    if ( !p )
+        return -ENOMEM;
+
     if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
     {
         PERROR("Failed to obtain d%d info", domid);
@@ -598,19 +600,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     }
     hvm = di.flags & XEN_DOMINF_hvm_guest;
 
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL )
-        goto out;
-
     /* Get the host policy. */
     rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
                                &len, host_featureset);
@@ -623,10 +612,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     }
 
     /* Get the domain's default policy. */
-    nr_msrs = 0;
     rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
                                         : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
+                               &nr_leaves, p->leaves, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain %s default policy", hvm ? "hvm" : "pv");
@@ -634,7 +622,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
+    rc = x86_cpuid_copy_from_buffer(&p->policy, p->leaves, nr_leaves,
                                     &err_leaf, &err_subleaf);
     if ( rc )
     {
@@ -659,18 +647,18 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * - Re-enable features which have become (possibly) off by default.
          */
 
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-        p->feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
-        p->feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
+        p->policy.basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
+        p->policy.feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
+        p->policy.feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
 
         if ( hvm )
         {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
+            p->policy.feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
         }
 
-        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
-        p->feat.max_subleaf = 0;
-        p->extd.max_leaf = min(p->extd.max_leaf, 0x8000001c);
+        p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0xdu);
+        p->policy.feat.max_subleaf = 0;
+        p->policy.extd.max_leaf = min(p->policy.extd.max_leaf, 0x8000001c);
     }
 
     if ( featureset )
@@ -714,17 +702,17 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
             }
         }
 
-        x86_cpu_featureset_to_policy(feat, p);
+        x86_cpu_featureset_to_policy(feat, &p->policy);
     }
     else
     {
-        p->extd.itsc = itsc;
+        p->policy.extd.itsc = itsc;
 
         if ( hvm )
         {
-            p->basic.pae = pae;
-            p->basic.vmx = nested_virt;
-            p->extd.svm = nested_virt;
+            p->policy.basic.pae = pae;
+            p->policy.basic.vmx = nested_virt;
+            p->policy.extd.svm = nested_virt;
         }
     }
 
@@ -734,8 +722,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * On hardware without CPUID Faulting, PV guests see real topology.
          * As a consequence, they also need to see the host htt/cmp fields.
          */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
+        p->policy.basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
+        p->policy.extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
     }
     else
     {
@@ -743,28 +731,28 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * Topology for HVM guests is entirely controlled by Xen.  For now, we
          * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
          */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
+        p->policy.basic.htt = true;
+        p->policy.extd.cmp_legacy = false;
 
         /*
          * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
          * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
          * overflow.
          */
-        if ( !p->basic.lppp )
-            p->basic.lppp = 2;
-        else if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
+        if ( !p->policy.basic.lppp )
+            p->policy.basic.lppp = 2;
+        else if ( !(p->policy.basic.lppp & 0x80) )
+            p->policy.basic.lppp *= 2;
 
-        switch ( p->x86_vendor )
+        switch ( p->policy.x86_vendor )
         {
         case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
+            for ( i = 0; (p->policy.cache.subleaf[i].type &&
+                          i < ARRAY_SIZE(p->policy.cache.raw)); ++i )
             {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
+                p->policy.cache.subleaf[i].cores_per_package =
+                    (p->policy.cache.subleaf[i].cores_per_package << 1) | 1;
+                p->policy.cache.subleaf[i].threads_per_cache = 0;
             }
             break;
 
@@ -784,25 +772,26 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
              * apic_id_size values greater than 7.  Limit the value to
              * 7 for now.
              */
-            if ( p->extd.nc < 0x7f )
+            if ( p->policy.extd.nc < 0x7f )
             {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size < 0x7 )
-                    p->extd.apic_id_size++;
+                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
+                    p->policy.extd.apic_id_size++;
 
-                p->extd.nc = (p->extd.nc << 1) | 1;
+                p->policy.extd.nc = (p->policy.extd.nc << 1) | 1;
             }
             break;
         }
     }
 
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
+    nr_leaves = ARRAY_SIZE(p->leaves);
+    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
     if ( rc )
     {
         ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
         goto out;
     }
 
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
+    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, p->leaves, 0, NULL,
                                   &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
@@ -825,8 +814,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     rc = 0;
 
 out:
-    free(p);
-    free(leaves);
+    xc_cpu_policy_destroy(p);
 
     return rc;
 }
@@ -839,7 +827,11 @@ xc_cpu_policy_t *xc_cpu_policy_init(void)
 void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
 {
     if ( policy )
+    {
+        int err = errno;
         free(policy);
+        errno = err;
+    }
 }
 
 static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
-- 
2.34.1


