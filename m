Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E57E4416
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628914.980881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKb-0005gp-Hm; Tue, 07 Nov 2023 15:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628914.980881; Tue, 07 Nov 2023 15:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKb-0005Z0-BH; Tue, 07 Nov 2023 15:49:33 +0000
Received: by outflank-mailman (input) for mailman id 628914;
 Tue, 07 Nov 2023 15:49:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2M1=GU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r0OKZ-0004f1-S3
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:49:31 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d4b71b0-7d85-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 16:49:30 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40838915cecso42705195e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:49:30 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1c721a000000b0040849ce7116sm15809852wmc.43.2023.11.07.07.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:49:28 -0800 (PST)
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
X-Inumbo-ID: 3d4b71b0-7d85-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699372170; x=1699976970; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDz6sGbi3amh7p4RXJVmm4OJgTg+X2ePEDBCKg+zF5k=;
        b=lSDk6vs8/JC4JmQtCcUUdEEHUZ37PXu+OmTBD0qgdCb9BOA7j+99gwK95WFJ56tfh9
         nDoWJYcwmMaHValPZxzCCCxINCoJWfCIMpu1ZlgPjNqq3qmDo2MaHiO+MDLOEzyaaieS
         Z+JcpngiJXPUjJfiXUuonYjFJKRnWKgZkB0Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372170; x=1699976970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDz6sGbi3amh7p4RXJVmm4OJgTg+X2ePEDBCKg+zF5k=;
        b=gpTDMJS9qXvyEyzjUGV1kcBXcEJyOFIGF1W0FN6S+t9Z9OhvmjVURYBvOIh6NVo1uz
         XJENLUVWFUULGiVaYTYXCMJNWDoB9+YQlRkhNJMeDrVbeUpTc5F+7rRRL4gph2z7QaDC
         MPGETNQ9pGhp4zC7yhY939W2Dpdg6rhiKIS130uMKJp0uA8r9En5XT1ZXRv2Ef911C4S
         v8bjVJbdE5d47BnLHilO9r5/IBWlEod4D3nAo6XtQrOOvVsuLN1L48GVxCgzZO1w4Sow
         lAYHoVIcW3XJNAo+R6aDnbM3sqCqK/pVBFqcdm2JExEglJhKkH29s3FeOI9SO7Ud7NIb
         aigA==
X-Gm-Message-State: AOJu0YzOy7UbsQyzu2paQP9g3OVrcwmmApDoQKQHEe9mvWMeM2vLShRl
	N8E+o1uO/fMlrd7Gv28W2TrBBFOM9TCDKMEGQDY=
X-Google-Smtp-Source: AGHT+IFmW3jjWcsrqSaiOv0teP9ieNlXQyUDrN5eM399cB2e2LXIW4gFHVF2DUtXCSDhz27yUCHcSg==
X-Received: by 2002:a05:600c:46d4:b0:405:49aa:d578 with SMTP id q20-20020a05600c46d400b0040549aad578mr2552796wmo.37.1699372170112;
        Tue, 07 Nov 2023 07:49:30 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 5/7] tools/xg: Streamline xc_cpuid_apply_policy()
Date: Tue,  7 Nov 2023 15:49:19 +0000
Message-Id: <20231107154921.54979-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
References: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instantiates host, default and domain policies in order to clean up a lot
of boilerplate hypercalls. This is partial work in order to deduplicate
the same hypercalls being used when updating CPUID and MSR parts of the
policy.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/include/xenguest.h        |   1 +
 tools/libs/guest/xg_cpuid_x86.c | 184 ++++++++++++++++----------------
 2 files changed, 93 insertions(+), 92 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index a66d9f7807..f0b58bb395 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -788,6 +788,7 @@ typedef struct xc_cpu_policy xc_cpu_policy_t;
 
 /* Create and free a xc_cpu_policy object. */
 xc_cpu_policy_t *xc_cpu_policy_init(xc_interface *xch);
+xc_cpu_policy_t *xc_cpu_policy_clone(const xc_cpu_policy_t *other);
 void xc_cpu_policy_destroy(xc_cpu_policy_t *policy);
 
 /* Retrieve a system policy, or get/set a domains policy. */
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 8fafeb2a02..acc94fb16b 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -635,13 +635,14 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     int rc;
     bool hvm;
     xc_domaininfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpu_policy *p = NULL;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
+    uint32_t def_policy;
+    /*
+     * Three full policies.  The host, default for the domain type,
+     * and domain current.
+     */
+    xc_cpu_policy_t *host = NULL, *def = NULL, *cur = NULL;
 
+    /* Determine if domid is PV or HVM */
     if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
     {
         PERROR("Failed to obtain d%d info", domid);
@@ -650,48 +651,24 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
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
-    /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
-    /* Tolerate "buffer too small", as we've got the bits we need. */
-    if ( rc && errno != ENOBUFS )
+    if ( !(host = xc_cpu_policy_init(xch)) ||
+         !(def = xc_cpu_policy_clone(host)) ||
+         !(cur = xc_cpu_policy_clone(host)) )
     {
-        PERROR("Failed to obtain host featureset");
-        rc = -errno;
+        PERROR("Failed to allocate policy state");
         goto out;
     }
 
-    /* Get the domain's default policy. */
-    nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                        : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s default policy", hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto out;
-    }
+    def_policy = hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                     : XEN_SYSCTL_cpu_policy_pv_default;
 
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
+    /* Get the domain type's default policy. */
+    if ( (rc = xc_cpu_policy_get_domain(xch, domid, cur)) ||
+         (rc = xc_cpu_policy_get_system(xch, def_policy, def)) ||
+         (rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host)) )
     {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
+        PERROR("Failed to obtain d%d, %s and/or host policies",
+               domid, hvm ? "hvm" : "pv");
         goto out;
     }
 
@@ -711,18 +688,16 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * - Re-enable features which have become (possibly) off by default.
          */
 
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-        p->feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
-        p->feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
+        cur->policy.basic.rdrand = host->policy.basic.rdrand;
+        cur->policy.feat.hle = host->policy.feat.hle;
+        cur->policy.feat.rtm = host->policy.feat.rtm;
 
         if ( hvm )
-        {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
-        }
+            cur->policy.feat.mpx = host->policy.feat.mpx;
 
-        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
-        p->feat.max_subleaf = 0;
-        p->extd.max_leaf = min(p->extd.max_leaf, 0x8000001c);
+        cur->policy.basic.max_leaf = min(host->policy.basic.max_leaf, 0xdu);
+        cur->policy.feat.max_subleaf = 0;
+        cur->policy.extd.max_leaf = min(host->policy.extd.max_leaf, 0x8000001c);
     }
 
     if ( featureset )
@@ -730,7 +705,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         uint32_t disabled_features[FEATURESET_NR_ENTRIES],
             feat[FEATURESET_NR_ENTRIES] = {};
         static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-        unsigned int i, b;
 
         /*
          * The user supplied featureset may be shorter or longer than
@@ -741,17 +715,17 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
         /* Check for truncated set bits. */
         rc = -EOPNOTSUPP;
-        for ( i = user_len; i < nr_features; ++i )
+        for ( size_t i = user_len; i < nr_features; ++i )
             if ( featureset[i] != 0 )
                 goto out;
 
         memcpy(feat, featureset, sizeof(*featureset) * user_len);
 
         /* Disable deep dependencies of disabled features. */
-        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        for ( size_t i = 0; i < ARRAY_SIZE(disabled_features); ++i )
             disabled_features[i] = ~feat[i] & deep_features[i];
 
-        for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+        for ( size_t b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
         {
             const uint32_t *dfs;
 
@@ -759,24 +733,24 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                  !(dfs = x86_cpu_policy_lookup_deep_deps(b)) )
                 continue;
 
-            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+            for ( size_t i = 0; i < ARRAY_SIZE(disabled_features); ++i )
             {
                 feat[i] &= ~dfs[i];
                 disabled_features[i] &= ~dfs[i];
             }
         }
 
-        x86_cpu_featureset_to_policy(feat, p);
+        x86_cpu_featureset_to_policy(feat, &cur->policy);
     }
     else
     {
-        p->extd.itsc = itsc;
+        cur->policy.extd.itsc = itsc;
 
         if ( hvm )
         {
-            p->basic.pae = pae;
-            p->basic.vmx = nested_virt;
-            p->extd.svm = nested_virt;
+            cur->policy.basic.pae = pae;
+            cur->policy.basic.vmx = nested_virt;
+            cur->policy.extd.svm = nested_virt;
         }
     }
 
@@ -786,8 +760,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * On hardware without CPUID Faulting, PV guests see real topology.
          * As a consequence, they also need to see the host htt/cmp fields.
          */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
+        cur->policy.basic.htt       = host->policy.basic.htt;
+        cur->policy.extd.cmp_legacy = host->policy.extd.cmp_legacy;
     }
     else
     {
@@ -795,28 +769,28 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * Topology for HVM guests is entirely controlled by Xen.  For now, we
          * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
          */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
+        cur->policy.basic.htt = true;
+        cur->policy.extd.cmp_legacy = false;
 
         /*
          * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
          * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
          * overflow.
          */
-        if ( !p->basic.lppp )
-            p->basic.lppp = 2;
-        else if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
+        if ( !cur->policy.basic.lppp )
+            cur->policy.basic.lppp = 2;
+        else if ( !(cur->policy.basic.lppp & 0x80) )
+            cur->policy.basic.lppp *= 2;
 
-        switch ( p->x86_vendor )
+        switch ( cur->policy.x86_vendor )
         {
         case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
+            for ( size_t i = 0; (cur->policy.cache.subleaf[i].type &&
+                          i < ARRAY_SIZE(cur->policy.cache.raw)); ++i )
             {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
+                cur->policy.cache.subleaf[i].cores_per_package =
+                    (cur->policy.cache.subleaf[i].cores_per_package << 1) | 1;
+                cur->policy.cache.subleaf[i].threads_per_cache = 0;
             }
             break;
 
@@ -836,30 +810,22 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
              * apic_id_size values greater than 7.  Limit the value to
              * 7 for now.
              */
-            if ( p->extd.nc < 0x7f )
+            if ( cur->policy.extd.nc < 0x7f )
             {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size < 0x7 )
-                    p->extd.apic_id_size++;
+                if ( cur->policy.extd.apic_id_size != 0 &&
+                     cur->policy.extd.apic_id_size < 0x7 )
+                    cur->policy.extd.apic_id_size++;
 
-                p->extd.nc = (p->extd.nc << 1) | 1;
+                cur->policy.extd.nc = (cur->policy.extd.nc << 1) | 1;
             }
             break;
         }
     }
 
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
-    if ( rc )
-    {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
-    }
-
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
+    /* Re-apply the mutated policy onto the domain */
+    rc = xc_cpu_policy_set_domain(xch, domid, cur);
     if ( rc )
     {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
         rc = -errno;
         goto out;
     }
@@ -877,8 +843,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     rc = 0;
 
 out:
-    free(p);
-    free(leaves);
+    xc_cpu_policy_destroy(cur);
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
 
     return rc;
 }
@@ -911,6 +878,39 @@ xc_cpu_policy_t *xc_cpu_policy_init(xc_interface *xch)
     return NULL;
 }
 
+xc_cpu_policy_t *xc_cpu_policy_clone(const xc_cpu_policy_t *other)
+{
+    xc_cpu_policy_t *policy;
+
+    if ( !other )
+        return NULL;
+
+    policy = malloc(sizeof(*policy));
+    if ( !policy )
+        return NULL;
+
+    *policy = *other;
+
+    /* Override every buffer with identical new ones */
+    policy->leaves.buf = calloc(other->leaves.allocated,
+                                sizeof(*other->leaves.buf));
+    policy->msrs.buf = calloc(other->msrs.allocated,
+                              sizeof(*other->msrs.buf));
+
+    if ( !policy->leaves.buf || !policy->msrs.buf )
+    {
+        xc_cpu_policy_destroy(policy);
+        return NULL;
+    }
+
+    memcpy(policy->leaves.buf, other->leaves.buf,
+           other->leaves.allocated);
+    memcpy(policy->msrs.buf, other->msrs.buf,
+           other->msrs.allocated);
+
+    return policy;
+}
+
 void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
 {
     int err = errno;
-- 
2.34.1


