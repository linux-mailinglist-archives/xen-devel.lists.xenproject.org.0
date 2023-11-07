Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8AE7E4417
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628916.980906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKd-0006P4-LA; Tue, 07 Nov 2023 15:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628916.980906; Tue, 07 Nov 2023 15:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKd-0006F9-Gd; Tue, 07 Nov 2023 15:49:35 +0000
Received: by outflank-mailman (input) for mailman id 628916;
 Tue, 07 Nov 2023 15:49:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2M1=GU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r0OKc-0004f2-75
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:49:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e36e0fc-7d85-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 16:49:32 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9c41e95efcbso867542466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:49:32 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1c721a000000b0040849ce7116sm15809852wmc.43.2023.11.07.07.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:49:31 -0800 (PST)
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
X-Inumbo-ID: 3e36e0fc-7d85-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699372171; x=1699976971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDBR4US0usgZD2c5iZwJM+sDkiWc35BKuxl/wMSfHac=;
        b=QvNIK8271sfLDZrFCM5JT9b7DQNM5NA4KOVIdJaxFPtGwGIZl7ur4B15mcP87fgW7o
         zlmwwg26u0pMJvxMuM45W3Xt8zR4Zdqkgk9xkzt8zGeqLLOxQ0b3fkKw08yb2TdV5TXl
         0GjeOV8h66RY8Htsr3WxIXCkLUruphaqnsfvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372171; x=1699976971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDBR4US0usgZD2c5iZwJM+sDkiWc35BKuxl/wMSfHac=;
        b=T0IifDnJcB6dS2q8HLgo8J+g2FjGaM0CJL8b2qxcUnyooks39+QAbc5BBzsgyUnfnF
         dAYrBHnoPP9tyXN0hKBKua1j90jgZvxhNNzodRQLHeuN3j/geYqhS5m+oeWRx7yaipf3
         761HB/h+e/sXQnrFDVj6DrCEWbPd4qPzbFiQmU9qbTyNjCciWBp6Nm14FkhvikkxsrOy
         dO5Oknxqficn5yh6Y6zszRO1ArRsUaUFdGQONkRQGMKnSGfp6Am84rKy2sEZhkvce8Sv
         ENXsKvmIBDFrmlsoF1KXdQzSOqgmWTaxap7jLlr/o8LsWq+38BxYYzhU1o/L6RrD+RPb
         GB6Q==
X-Gm-Message-State: AOJu0YyKBHDRhziSn+l6JDzwCIM2SkXkTwtZRUl0MutTv0Q652p4ZJVz
	5VYNEo4Ky+Rf0ObwbL9jyXqSRO0jiWSKiM2121o=
X-Google-Smtp-Source: AGHT+IGqE9FPvetndnMzBHNgitBPMVRCK0GIGWphjpwGakTNt5adzQgfKtbmCnTDP6JlgVaAn6C4tg==
X-Received: by 2002:a17:907:7203:b0:9dd:64ca:dc69 with SMTP id dr3-20020a170907720300b009dd64cadc69mr10494988ejc.1.1699372171370;
        Tue, 07 Nov 2023 07:49:31 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 7/7] tools/xg: Simplify hypercall stubs
Date: Tue,  7 Nov 2023 15:49:21 +0000
Message-Id: <20231107154921.54979-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
References: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now there are no pending dependencies on the current form of the hypercall
stubs. Replace them with simpler forms that only take the xc_cpu_policy
object. This way the plumbing logic becomes a lot simpler, allowing the
policy to be extended without touching the plumbing code.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 59 ++++++++++++---------------------
 1 file changed, 22 insertions(+), 37 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index e2a2659953..cf07a69764 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -125,16 +125,17 @@ int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
     return ret;
 }
 
-static int get_system_cpu_policy(xc_interface *xch, uint32_t index,
-                                 uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                                 uint32_t *nr_msrs, xen_msr_entry_t *msrs)
+static int get_system_cpu_policy_serialised(xc_interface *xch, uint32_t index,
+                                            xc_cpu_policy_t *p)
 {
     struct xen_sysctl sysctl = {};
+    xen_cpuid_leaf_t *leaves = p->leaves.buf;
+    xen_msr_entry_t *msrs = p->msrs.buf;
     DECLARE_HYPERCALL_BOUNCE(leaves,
-                             *nr_leaves * sizeof(*leaves),
+                             p->leaves.allocated * sizeof(*leaves),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
     DECLARE_HYPERCALL_BOUNCE(msrs,
-                             *nr_msrs * sizeof(*msrs),
+                             p->msrs.allocated * sizeof(*msrs),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
     int ret;
 
@@ -144,9 +145,9 @@ static int get_system_cpu_policy(xc_interface *xch, uint32_t index,
 
     sysctl.cmd = XEN_SYSCTL_get_cpu_policy;
     sysctl.u.cpu_policy.index = index;
-    sysctl.u.cpu_policy.nr_leaves = *nr_leaves;
+    sysctl.u.cpu_policy.nr_leaves = p->leaves.allocated;
     set_xen_guest_handle(sysctl.u.cpu_policy.leaves, leaves);
-    sysctl.u.cpu_policy.nr_msrs = *nr_msrs;
+    sysctl.u.cpu_policy.nr_msrs = p->msrs.allocated;
     set_xen_guest_handle(sysctl.u.cpu_policy.msrs, msrs);
 
     ret = do_sysctl(xch, &sysctl);
@@ -156,23 +157,24 @@ static int get_system_cpu_policy(xc_interface *xch, uint32_t index,
 
     if ( !ret )
     {
-        *nr_leaves = sysctl.u.cpu_policy.nr_leaves;
-        *nr_msrs = sysctl.u.cpu_policy.nr_msrs;
+        p->leaves.len = sysctl.u.cpu_policy.nr_leaves;
+        p->msrs.len = sysctl.u.cpu_policy.nr_msrs;
     }
 
     return ret;
 }
 
-static int get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                                 uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                                 uint32_t *nr_msrs, xen_msr_entry_t *msrs)
+static int get_domain_cpu_policy_serialised(xc_interface *xch, uint32_t domid,
+                                            xc_cpu_policy_t *p)
 {
     DECLARE_DOMCTL;
+    xen_cpuid_leaf_t *leaves = p->leaves.buf;
+    xen_msr_entry_t *msrs = p->msrs.buf;
     DECLARE_HYPERCALL_BOUNCE(leaves,
-                             *nr_leaves * sizeof(*leaves),
+                             p->leaves.allocated * sizeof(*leaves),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
     DECLARE_HYPERCALL_BOUNCE(msrs,
-                             *nr_msrs * sizeof(*msrs),
+                             p->msrs.allocated * sizeof(*msrs),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
     int ret;
 
@@ -182,9 +184,9 @@ static int get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
 
     domctl.cmd = XEN_DOMCTL_get_cpu_policy;
     domctl.domain = domid;
-    domctl.u.cpu_policy.nr_leaves = *nr_leaves;
+    domctl.u.cpu_policy.nr_leaves = p->leaves.allocated;
     set_xen_guest_handle(domctl.u.cpu_policy.leaves, leaves);
-    domctl.u.cpu_policy.nr_msrs = *nr_msrs;
+    domctl.u.cpu_policy.nr_msrs = p->msrs.allocated;
     set_xen_guest_handle(domctl.u.cpu_policy.msrs, msrs);
 
     ret = do_domctl(xch, &domctl);
@@ -194,8 +196,8 @@ static int get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
 
     if ( !ret )
     {
-        *nr_leaves = domctl.u.cpu_policy.nr_leaves;
-        *nr_msrs = domctl.u.cpu_policy.nr_msrs;
+        p->leaves.len = domctl.u.cpu_policy.nr_leaves;
+        p->msrs.len = domctl.u.cpu_policy.nr_msrs;
     }
 
     return ret;
@@ -745,22 +747,14 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
 int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
                              xc_cpu_policy_t *policy)
 {
-    unsigned int nr_leaves = policy->leaves.allocated;
-    unsigned int nr_msrs = policy->msrs.allocated;
     int rc;
 
-    rc = get_system_cpu_policy(xch, policy_idx,
-                               &nr_leaves, policy->leaves.buf,
-                               &nr_msrs, policy->msrs.buf);
-    if ( rc )
+    if ( (rc = get_system_cpu_policy_serialised(xch, policy_idx, policy)) )
     {
         PERROR("Failed to obtain %u policy", policy_idx);
         return rc;
     }
 
-    policy->leaves.len = nr_leaves;
-    policy->msrs.len = nr_msrs;
-
     rc = cpu_policy_deserialise_on_self(xch, policy);
     if ( rc )
     {
@@ -774,22 +768,13 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
 int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t *policy)
 {
-    unsigned int nr_leaves = policy->leaves.allocated;
-    unsigned int nr_msrs = policy->msrs.allocated;
-    int rc;
-
-    rc = get_domain_cpu_policy(xch, domid,
-                               &nr_leaves, policy->leaves.buf,
-                               &nr_msrs, policy->msrs.buf);
+    int rc = get_domain_cpu_policy_serialised(xch, domid, policy);
     if ( rc )
     {
         PERROR("Failed to obtain domain %u policy", domid);
         return rc;
     }
 
-    policy->leaves.len = nr_leaves;
-    policy->msrs.len = nr_msrs;
-
     rc = cpu_policy_deserialise_on_self(xch, policy);
     if ( rc )
     {
-- 
2.34.1


