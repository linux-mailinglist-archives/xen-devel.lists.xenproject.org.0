Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E27E4412
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:49:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628915.980899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKd-0006FW-6T; Tue, 07 Nov 2023 15:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628915.980899; Tue, 07 Nov 2023 15:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKc-00068B-Vz; Tue, 07 Nov 2023 15:49:34 +0000
Received: by outflank-mailman (input) for mailman id 628915;
 Tue, 07 Nov 2023 15:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2M1=GU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r0OKb-0004f2-Jc
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:49:33 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dc9f351-7d85-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 16:49:31 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40837ebba42so36606305e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:49:31 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1c721a000000b0040849ce7116sm15809852wmc.43.2023.11.07.07.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:49:30 -0800 (PST)
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
X-Inumbo-ID: 3dc9f351-7d85-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699372171; x=1699976971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg9I/CTQ9r8/XZi0s/EqCV9zo0mb+8u/y0FvnwuuK8Q=;
        b=ilCAKlVlmt+kYaPsSoS8uEzEHCp1Hy4tlxP81q1iUoMRNVXg41b0V0cvtGXG/7L5/X
         QFhLkQwRb8AtlTv/eQ63j4AtjrzQxr1o/G7KkRj7pKsYxBAYWV9IryZaFlUiONR2JSn9
         wtL5SQCYsLCzAaXARgn/k/v1fxHocrGtBUG/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372171; x=1699976971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zg9I/CTQ9r8/XZi0s/EqCV9zo0mb+8u/y0FvnwuuK8Q=;
        b=dz+niKDzCIphwFgPNrCiUxcUOD9HfeHSCPhEuArT7m+6vGpq0Dh7RIRmez4kg8NFuT
         yAR0LD9ZbLhmtjhDtvzAh2+9IOJ7/tWFb8TQccK/chQWUcmMG869YMUidXwOw4XsSN09
         FkruRqI9kHWwYRCofPyUrXdBa4qbaKCHHKkpB5jXVlOXF4L11OHjqs64v7A301qOFB4a
         Jpb3kyYLYJczkrfEx0/J3TRzkKuxA+BnIPpwVlv0TPu7wNWg4w3jRvvvGDbVqts2L6mz
         1LexHeNgk8/36W2uOdXUNB78nDaNIEr+MGMUABpvFddJT3j675F6mPk14NI/C9EUQXMO
         bJYA==
X-Gm-Message-State: AOJu0YxDMm0hH75FZY8aWubJNwFlnqwsXdU857gs9VQLssNI9DpYpm6e
	XsZnmt/Nam5eUGXJ5lDiCMnNuzEBtpaRz8j1aWg=
X-Google-Smtp-Source: AGHT+IGHBCo0k8bNpvm6r5Lr7wMITTEJcpxCM8440tjO1RCgbZ8S1fYoK/EGjveG3B1gn2/3WKFp8g==
X-Received: by 2002:a05:600c:45cd:b0:405:1c14:9227 with SMTP id s13-20020a05600c45cd00b004051c149227mr2921945wmo.33.1699372170830;
        Tue, 07 Nov 2023 07:49:30 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 6/7] tools/xg: Simplify xc_cpuid_xend_policy() and xc_msr_policy()
Date: Tue,  7 Nov 2023 15:49:20 +0000
Message-Id: <20231107154921.54979-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
References: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all duplication in CPUID and MSR xend-style overrides. They had an
incredible amount of overhead for no good reason.

After this patch, CPU policy application takes a number of hypercalls to
recover the policy state and then those are passed to the xend-style
override code so it can avoid them.

Furthermore, the ultimate reapplication of the policy to the domain in Xen
is done only once after both CPUID and MSRs have been fixed up.

BUG!!! apply_policy is sending the policy after deserialise when it poked
at it in its serialised form.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 261 +++++---------------------------
 1 file changed, 38 insertions(+), 223 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index acc94fb16b..e2a2659953 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -312,102 +312,32 @@ static int compare_leaves(const void *l, const void *r)
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
+    return bsearch(&key, p->leaves.buf, p->leaves.len,
+                   sizeof(*p->leaves.buf), compare_leaves);
 }
 
 static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
+    xc_interface *xch, uint32_t domid,
+    const struct xc_xend_cpuid *xend,
+    xc_cpu_policy_t *host,
+    xc_cpu_policy_t *def,
+    xc_cpu_policy_t *cur)
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
-
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
@@ -436,7 +366,7 @@ static int xc_cpuid_xend_policy(
                 {
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
                           xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                    return -EINVAL;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -446,25 +376,7 @@ static int xc_cpuid_xend_policy(
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
@@ -478,104 +390,31 @@ static int compare_msr(const void *l, const void *r)
     return lhs->idx < rhs->idx ? -1 : 1;
 }
 
-static xen_msr_entry_t *find_msr(
-    xen_msr_entry_t *msrs, unsigned int nr_msrs,
-    uint32_t index)
+static xen_msr_entry_t *find_msr(xc_cpu_policy_t *p, uint32_t index)
 {
     const xen_msr_entry_t key = { .idx = index };
 
-    return bsearch(&key, msrs, nr_msrs, sizeof(*msrs), compare_msr);
+    return bsearch(&key, p->msrs.buf, p->msrs.len,
+                   sizeof(*p->msrs.buf), compare_msr);
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
+        xen_msr_entry_t *cur_msr = find_msr(cur, msr->index);
+        const xen_msr_entry_t *def_msr = find_msr(def, msr->index);
+        const xen_msr_entry_t *host_msr = find_msr(host, msr->index);
         unsigned int i;
 
         if ( cur_msr == NULL || def_msr == NULL || host_msr == NULL )
         {
             ERROR("Missing MSR %#x", msr->index);
-            rc = -ENOENT;
-            goto out;
+            return -ENOENT;
         }
 
         for ( i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
@@ -594,8 +433,7 @@ static int xc_msr_policy(xc_interface *xch, domid_t domid,
             {
                 ERROR("MSR index %#x: bad character '%c' in policy string '%s'",
                       msr->index, msr->policy[i], msr->policy);
-                rc = -EINVAL;
-                goto out;
+                return -EINVAL;
             }
 
             if ( val )
@@ -605,25 +443,7 @@ static int xc_msr_policy(xc_interface *xch, domid_t domid,
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
@@ -822,25 +642,20 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    /* Re-apply the mutated policy onto the domain */
-    rc = xc_cpu_policy_set_domain(xch, domid, cur);
-    if ( rc )
-    {
-        rc = -errno;
+    /*
+     * Ensure changes we just made are reflected in the serialised form of
+     * the policy, as otherwise they they will be missed by the xend overrides
+     */
+    if ( (rc = cpu_policy_serialise_on_self(xch, cur)) )
         goto out;
-    }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
+    /* Apply xend-style overrides */
+    if ( (xend && (rc = xc_cpuid_xend_policy(xch, domid, xend, host, def, cur))) ||
+         (msr && (rc = xc_msr_policy(xch, domid, msr, host, def, cur))) )
         goto out;
 
-    if ( msr )
-    {
-        rc = xc_msr_policy(xch, domid, msr);
-        if ( rc )
-            goto out;
-    }
-
-    rc = 0;
+    /* Re-apply the mutated policy onto the domain */
+    rc = xc_cpu_policy_set_domain_from_serialised(xch, domid, cur);
 
 out:
     xc_cpu_policy_destroy(cur);
-- 
2.34.1


