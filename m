Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95AE84CFDA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 18:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677849.1054762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXluN-00064m-9K; Wed, 07 Feb 2024 17:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677849.1054762; Wed, 07 Feb 2024 17:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXluN-0005zY-2t; Wed, 07 Feb 2024 17:40:27 +0000
Received: by outflank-mailman (input) for mailman id 677849;
 Wed, 07 Feb 2024 17:40:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q5t=JQ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rXluL-0005Tj-6h
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 17:40:25 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f82012e9-c5df-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 18:40:22 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so1147683a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 09:40:22 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 op3-20020a170906bce300b00a37669280d1sm976355ejb.141.2024.02.07.09.40.21
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
X-Inumbo-ID: f82012e9-c5df-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707327622; x=1707932422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldOTwPyqzlRUxWLHaw7i5K1+RmAlnFbaE9qRDYjtAH0=;
        b=OEEhh8ObTtLBmFFcrGBrcK0UiNVrx5h45tMxZKhrzlGM3EnSHiMP9ZCpte4ySlJe56
         9Py2EaM8xNIjPk88uRU0obzCBeyc+3ug3BGosS6j9G9igXeCh5kPtWXpKDltVxv7XsXG
         q9P+lXJBSF/OW0+AHfKzQvfsyOuve10PNzesU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707327622; x=1707932422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldOTwPyqzlRUxWLHaw7i5K1+RmAlnFbaE9qRDYjtAH0=;
        b=XM7y/XavkxbSTvmieY7p0ACePy61zumc0oY1Cc5C5CXJ9SXSA01vFIv9Q3Pf9zAZeo
         h31OBCnfh7tr7IwH1oF+G1LShn755EEgRoM1xIGQ756u8mkHuxrO/1S8/oU8uM6BdzCG
         CMZjXhGzp5MUMF7mmMgCYFaCN/Xu3RezPqHptHlVcMJ1ceffWV3gcC1KTvo5QlWl7o3d
         FCZcxVJwpieTp7PbBg6Tq0q1ybLOIJOzxttc+9qQ5cbDlPJtB+qaNj8Yx/ygYAdKGW7L
         IIhmRIwiy+n/s3ILGkSti9jttNHM1G7iEr1i32EEEIRxqybCUfeGjZoFt6IeKS4Bp7Jd
         2TQA==
X-Gm-Message-State: AOJu0YwyCZaKHrlgtZl8guA0g2GfKLWj9dTH44Bd+H82EbTgodIojHaP
	GtWRS88Ddlo0yZpmIzxf8gVTr5KE6d7QH2FlBRzpsKJeRh2JkhmCjB9cxUD9UrkmkE/ThcKz/11
	l
X-Google-Smtp-Source: AGHT+IE3MMy7s/KceVpl0+osxKbEUSaPxMA3zbux6Npx3Vw8SZaWADt2bnx3dI6X45hSB1uwO9zP+A==
X-Received: by 2002:a17:906:168e:b0:a38:41bf:f6f6 with SMTP id s14-20020a170906168e00b00a3841bff6f6mr3284144ejd.77.1707327621876;
        Wed, 07 Feb 2024 09:40:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3evZJ50jo+0bSNFkZnb7WnQH7a1v5kbysvosyVpbX6zqd3DmZFqDLPSyJfq7ElGFRcP6ky6K7IttyTpe+NbP+gPvsMEptIhhVaEDevy8pSlXI7VZG2WK+1657Su3lnKVcxrgzmro=
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/3] tools/xg: Clean up xend-style overrides for CPU policies
Date: Wed,  7 Feb 2024 17:39:57 +0000
Message-Id: <20240207173957.19811-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
References: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out policy getters/setters from both (CPUID and MSR) policy override
functions. Additionally, use host policy rather than featureset when
preparing the cur policy, saving one hypercall and several lines of
boilerplate.

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 444 +++++++++-----------------------
 1 file changed, 128 insertions(+), 316 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5699a26b946e..cee0be80ba5b 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -36,6 +36,34 @@ enum {
 #define bitmaskof(idx)      (1u << ((idx) & 31))
 #define featureword_of(idx) ((idx) >> 5)
 
+static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy)
+{
+    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    int rc;
+
+    rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves,
+                                    policy->nr_leaves, &err_leaf, &err_subleaf);
+    if ( rc )
+    {
+        if ( err_leaf != -1 )
+            ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
+                  err_leaf, err_subleaf, -rc, strerror(-rc));
+        return rc;
+    }
+
+    rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs,
+                                  policy->nr_msrs, &err_msr);
+    if ( rc )
+    {
+        if ( err_msr != -1 )
+            ERROR("Failed to deserialise MSR (err MSR %#x) (%d = %s)",
+                  err_msr, -rc, strerror(-rc));
+        return rc;
+    }
+
+    return 0;
+}
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps)
 {
     struct xen_sysctl sysctl = {};
@@ -260,102 +288,34 @@ static int compare_leaves(const void *l, const void *r)
     return 0;
 }
 
-static xen_cpuid_leaf_t *find_leaf(
-    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
-    const struct xc_xend_cpuid *xend)
+static xen_cpuid_leaf_t *find_leaf(xc_cpu_policy_t *p,
+                                   const struct xc_xend_cpuid *xend)
 {
     const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
 
-    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
+    return bsearch(&key, p->leaves, ARRAY_SIZE(p->leaves),
+                   sizeof(*p->leaves), compare_leaves);
 }
 
-static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
+static int xc_cpuid_xend_policy(xc_interface *xch, uint32_t domid,
+                                const struct xc_xend_cpuid *xend,
+                                xc_cpu_policy_t *host,
+                                xc_cpu_policy_t *def,
+                                xc_cpu_policy_t *cur)
 {
-    int rc;
-    bool hvm;
-    xc_domaininfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, default for the domain type,
-     * and domain current.
-     */
-    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
-    unsigned int nr_host, nr_def, nr_cur;
-
-    if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
-    {
-        PERROR("Failed to obtain d%d info", domid);
-        rc = -errno;
-        goto fail;
-    }
-    hvm = di.flags & XEN_DOMINF_hvm_guest;
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto fail;
-    }
-
-    rc = -ENOMEM;
-    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
-         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        goto fail;
-    }
-
-    /* Get the domain's current policy. */
-    nr_msrs = 0;
-    nr_cur = nr_leaves;
-    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto fail;
-    }
-
-    /* Get the domain type's default policy. */
-    nr_msrs = 0;
-    nr_def = nr_leaves;
-    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                        : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_def, def, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto fail;
-    }
-
-    /* Get the host policy. */
-    nr_msrs = 0;
-    nr_host = nr_leaves;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_host, host, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto fail;
-    }
+    if ( !xend )
+        return 0;
 
-    rc = -EINVAL;
     for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, xend);
+        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, xend);
+        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, xend);
 
         if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
         {
             ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
-            goto fail;
+            return -EINVAL;
         }
 
         for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
@@ -384,7 +344,7 @@ static int xc_cpuid_xend_policy(
                 {
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
                           xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                    return -EINVAL;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -394,25 +354,7 @@ static int xc_cpuid_xend_policy(
         }
     }
 
-    /* Feed the transformed currrent policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto fail;
-    }
-
-    /* Success! */
-
- fail:
-    free(cur);
-    free(def);
-    free(host);
-
-    return rc;
+    return 0;
 }
 
 static int compare_msr(const void *l, const void *r)
@@ -426,107 +368,34 @@ static int compare_msr(const void *l, const void *r)
     return lhs->idx < rhs->idx ? -1 : 1;
 }
 
-static xen_msr_entry_t *find_msr(
-    xen_msr_entry_t *msrs, unsigned int nr_msrs,
-    uint32_t index)
+static xen_msr_entry_t *find_msr(xc_cpu_policy_t *p,
+                                 uint32_t index)
 {
     const xen_msr_entry_t key = { .idx = index };
 
-    return bsearch(&key, msrs, nr_msrs, sizeof(*msrs), compare_msr);
+    return bsearch(&key, p->msrs, ARRAY_SIZE(p->msrs),
+                   sizeof(*p->msrs), compare_msr);
 }
 
-
 static int xc_msr_policy(xc_interface *xch, domid_t domid,
-                         const struct xc_msr *msr)
+                         const struct xc_msr *msr,
+                         xc_cpu_policy_t *host,
+                         xc_cpu_policy_t *def,
+                         xc_cpu_policy_t *cur)
 {
-    int rc;
-    bool hvm;
-    xc_domaininfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, default for the domain type,
-     * and domain current.
-     */
-    xen_msr_entry_t *host = NULL, *def = NULL, *cur = NULL;
-    unsigned int nr_host, nr_def, nr_cur;
-
-    if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
-    {
-        PERROR("Failed to obtain d%d info", domid);
-        rc = -errno;
-        goto out;
-    }
-    hvm = di.flags & XEN_DOMINF_hvm_guest;
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
-    if ( (host = calloc(nr_msrs, sizeof(*host))) == NULL ||
-         (def  = calloc(nr_msrs, sizeof(*def)))  == NULL ||
-         (cur  = calloc(nr_msrs, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Get the domain's current policy. */
-    nr_leaves = 0;
-    nr_cur = nr_msrs;
-    rc = get_domain_cpu_policy(xch, domid, &nr_leaves, NULL, &nr_cur, cur);
-    if ( rc )
-    {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto out;
-    }
-
-    /* Get the domain type's default policy. */
-    nr_leaves = 0;
-    nr_def = nr_msrs;
-    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                        : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, NULL, &nr_def, def);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto out;
-    }
-
-    /* Get the host policy. */
-    nr_leaves = 0;
-    nr_host = nr_msrs;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_leaves, NULL, &nr_host, host);
-    if ( rc )
-    {
-        PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto out;
-    }
-
     for ( ; msr->index != XC_MSR_INPUT_UNUSED; ++msr )
     {
-        xen_msr_entry_t *cur_msr = find_msr(cur, nr_cur, msr->index);
-        const xen_msr_entry_t *def_msr = find_msr(def, nr_def, msr->index);
-        const xen_msr_entry_t *host_msr = find_msr(host, nr_host, msr->index);
-        unsigned int i;
+        xen_msr_entry_t *cur_msr = find_msr(cur, msr->index);
+        const xen_msr_entry_t *def_msr = find_msr(def, msr->index);
+        const xen_msr_entry_t *host_msr = find_msr(host, msr->index);
 
         if ( cur_msr == NULL || def_msr == NULL || host_msr == NULL )
         {
             ERROR("Missing MSR %#x", msr->index);
-            rc = -ENOENT;
-            goto out;
+            return -ENOENT;
         }
 
-        for ( i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
+        for ( size_t i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
         {
             bool val;
 
@@ -542,8 +411,7 @@ static int xc_msr_policy(xc_interface *xch, domid_t domid,
             {
                 ERROR("MSR index %#x: bad character '%c' in policy string '%s'",
                       msr->index, msr->policy[i], msr->policy);
-                rc = -EINVAL;
-                goto out;
+                return -EINVAL;
             }
 
             if ( val )
@@ -553,25 +421,7 @@ static int xc_msr_policy(xc_interface *xch, domid_t domid,
         }
     }
 
-    /* Feed the transformed policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, 0, NULL, nr_cur, cur,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto out;
-    }
-
-    /* Success! */
-
- out:
-    free(cur);
-    free(def);
-    free(host);
-
-    return rc;
+    return 0;
 }
 
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
@@ -583,14 +433,16 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     int rc;
     bool hvm;
     xc_domaininfo_t di;
-    struct xc_cpu_policy *p = xc_cpu_policy_init();
-    unsigned int i, nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
 
-    if ( !p )
-        return -ENOMEM;
+    struct xc_cpu_policy *host = xc_cpu_policy_init();
+    struct xc_cpu_policy *def = xc_cpu_policy_init();
+    struct xc_cpu_policy *cur = xc_cpu_policy_init();
+
+    if ( !host || !def || !cur )
+    {
+        rc = -ENOMEM;
+        goto out;
+    }
 
     if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
     {
@@ -600,21 +452,19 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     }
     hvm = di.flags & XEN_DOMINF_hvm_guest;
 
-    /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
-    /* Tolerate "buffer too small", as we've got the bits we need. */
-    if ( rc && errno != ENOBUFS )
+    /* Get the raw host policy */
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+    if ( rc )
     {
-        PERROR("Failed to obtain host featureset");
+        PERROR("Failed to obtain host policy");
         rc = -errno;
         goto out;
     }
 
     /* Get the domain's default policy. */
-    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                        : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, p->leaves, &nr_msrs, NULL);
+    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                           : XEN_SYSCTL_cpu_policy_pv_default,
+                                  def);
     if ( rc )
     {
         PERROR("Failed to obtain %s default policy", hvm ? "hvm" : "pv");
@@ -622,14 +472,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    rc = x86_cpuid_copy_from_buffer(&p->policy, p->leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
-        goto out;
-    }
+    /* Copy the deserialised default policy to modify it */
+    memcpy(cur, def, sizeof(*cur));
 
     if ( restore )
     {
@@ -647,18 +491,18 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * - Re-enable features which have become (possibly) off by default.
          */
 
-        p->policy.basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-        p->policy.feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
-        p->policy.feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
+        cur->policy.basic.rdrand = host->policy.basic.rdrand;
+        cur->policy.feat.hle = host->policy.feat.hle;
+        cur->policy.feat.rtm = host->policy.feat.rtm;
 
         if ( hvm )
         {
-            p->policy.feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
+            cur->policy.feat.mpx = host->policy.feat.mpx;
         }
 
-        p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0xdu);
-        p->policy.feat.max_subleaf = 0;
-        p->policy.extd.max_leaf = min(p->policy.extd.max_leaf, 0x8000001c);
+        cur->policy.basic.max_leaf = min(cur->policy.basic.max_leaf, 0xdu);
+        cur->policy.feat.max_subleaf = 0;
+        cur->policy.extd.max_leaf = min(cur->policy.extd.max_leaf, 0x8000001c);
     }
 
     if ( featureset )
@@ -666,7 +510,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         uint32_t disabled_features[FEATURESET_NR_ENTRIES],
             feat[FEATURESET_NR_ENTRIES] = {};
         static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-        unsigned int i, b;
+        unsigned int b;
 
         /*
          * The user supplied featureset may be shorter or longer than
@@ -677,14 +521,14 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
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
 
         for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
@@ -695,24 +539,24 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                  !(dfs = x86_cpu_policy_lookup_deep_deps(b)) )
                 continue;
 
-            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+            for ( size_t i = 0; i < ARRAY_SIZE(disabled_features); ++i )
             {
                 feat[i] &= ~dfs[i];
                 disabled_features[i] &= ~dfs[i];
             }
         }
 
-        x86_cpu_featureset_to_policy(feat, &p->policy);
+        x86_cpu_featureset_to_policy(feat, &cur->policy);
     }
     else
     {
-        p->policy.extd.itsc = itsc;
+        cur->policy.extd.itsc = itsc;
 
         if ( hvm )
         {
-            p->policy.basic.pae = pae;
-            p->policy.basic.vmx = nested_virt;
-            p->policy.extd.svm = nested_virt;
+            cur->policy.basic.pae = pae;
+            cur->policy.basic.vmx = nested_virt;
+            cur->policy.extd.svm = nested_virt;
         }
     }
 
@@ -722,8 +566,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * On hardware without CPUID Faulting, PV guests see real topology.
          * As a consequence, they also need to see the host htt/cmp fields.
          */
-        p->policy.basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->policy.extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
+        cur->policy.basic.htt       = host->policy.basic.htt;
+        cur->policy.extd.cmp_legacy = host->policy.extd.cmp_legacy;
     }
     else
     {
@@ -731,28 +575,28 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * Topology for HVM guests is entirely controlled by Xen.  For now, we
          * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
          */
-        p->policy.basic.htt = true;
-        p->policy.extd.cmp_legacy = false;
+        cur->policy.basic.htt = true;
+        cur->policy.extd.cmp_legacy = false;
 
         /*
          * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
          * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
          * overflow.
          */
-        if ( !p->policy.basic.lppp )
-            p->policy.basic.lppp = 2;
-        else if ( !(p->policy.basic.lppp & 0x80) )
-            p->policy.basic.lppp *= 2;
+        if ( !cur->policy.basic.lppp )
+            cur->policy.basic.lppp = 2;
+        else if ( !(cur->policy.basic.lppp & 0x80) )
+            cur->policy.basic.lppp *= 2;
 
-        switch ( p->policy.x86_vendor )
+        switch ( cur->policy.x86_vendor )
         {
         case X86_VENDOR_INTEL:
-            for ( i = 0; (p->policy.cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->policy.cache.raw)); ++i )
+            for ( size_t i = 0; (cur->policy.cache.subleaf[i].type &&
+                                i < ARRAY_SIZE(cur->policy.cache.raw)); ++i )
             {
-                p->policy.cache.subleaf[i].cores_per_package =
-                    (p->policy.cache.subleaf[i].cores_per_package << 1) | 1;
-                p->policy.cache.subleaf[i].threads_per_cache = 0;
+                cur->policy.cache.subleaf[i].cores_per_package =
+                    (cur->policy.cache.subleaf[i].cores_per_package << 1) | 1;
+                cur->policy.cache.subleaf[i].threads_per_cache = 0;
             }
             break;
 
@@ -772,49 +616,45 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
              * apic_id_size values greater than 7.  Limit the value to
              * 7 for now.
              */
-            if ( p->policy.extd.nc < 0x7f )
+            if ( cur->policy.extd.nc < 0x7f )
             {
-                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
-                    p->policy.extd.apic_id_size++;
+                if ( cur->policy.extd.apic_id_size != 0 && cur->policy.extd.apic_id_size < 0x7 )
+                    cur->policy.extd.apic_id_size++;
 
-                p->policy.extd.nc = (p->policy.extd.nc << 1) | 1;
+                cur->policy.extd.nc = (cur->policy.extd.nc << 1) | 1;
             }
             break;
         }
     }
 
-    nr_leaves = ARRAY_SIZE(p->leaves);
-    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
-    if ( rc )
+    if ( xend || msr )
     {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
+        // The overrides are over the serialised form of the policy
+        if ( (rc = xc_cpu_policy_serialise(xch, cur)) )
+            goto out;
+
+        if ( (rc = xc_cpuid_xend_policy(xch, domid, xend, host, def, cur)) )
+            goto out;
+        if ( (rc = xc_msr_policy(xch, domid, msr, host, def, cur)) )
+            goto out;
+
+        if ( (rc = deserialize_policy(xch, cur)) )
+            goto out;
     }
 
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, p->leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
+    rc = xc_cpu_policy_set_domain(xch, domid, cur);
     if ( rc )
     {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
         rc = -errno;
         goto out;
     }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
-        goto out;
-
-    if ( msr )
-    {
-        rc = xc_msr_policy(xch, domid, msr);
-        if ( rc )
-            goto out;
-    }
-
     rc = 0;
 
 out:
-    xc_cpu_policy_destroy(p);
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
+    xc_cpu_policy_destroy(cur);
 
     return rc;
 }
@@ -834,34 +674,6 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
     }
 }
 
-static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy)
-{
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    int rc;
-
-    rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves,
-                                    policy->nr_leaves, &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        if ( err_leaf != -1 )
-            ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-                  err_leaf, err_subleaf, -rc, strerror(-rc));
-        return rc;
-    }
-
-    rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs,
-                                  policy->nr_msrs, &err_msr);
-    if ( rc )
-    {
-        if ( err_msr != -1 )
-            ERROR("Failed to deserialise MSR (err MSR %#x) (%d = %s)",
-                  err_msr, -rc, strerror(-rc));
-        return rc;
-    }
-
-    return 0;
-}
-
 int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
                              xc_cpu_policy_t *policy)
 {
-- 
2.34.1


