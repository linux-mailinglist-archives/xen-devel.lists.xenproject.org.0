Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF37E440F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628912.980869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKa-0005TH-R6; Tue, 07 Nov 2023 15:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628912.980869; Tue, 07 Nov 2023 15:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKa-0005QO-L1; Tue, 07 Nov 2023 15:49:32 +0000
Received: by outflank-mailman (input) for mailman id 628912;
 Tue, 07 Nov 2023 15:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2M1=GU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r0OKZ-0004f2-4g
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:49:31 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c7c6c9e-7d85-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 16:49:29 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-509109104e2so7674258e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:49:29 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1c721a000000b0040849ce7116sm15809852wmc.43.2023.11.07.07.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:49:27 -0800 (PST)
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
X-Inumbo-ID: 3c7c6c9e-7d85-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699372168; x=1699976968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLSFAxdv6KNhnV/xuN+r8R+eidxuGYd2af8Ta5nu6pw=;
        b=J0TaW+iBE/oMprdQN5MYmDwwfDdoUGAWqV3rlJ239wf7kSbQZ+byHjJBsPr9hTN6oc
         yDcX15KWrIMigNut/1YIN1MZIia4Dm8RkhBJLzFOkweKHAFaV7bDoya0syx2VTMEUem/
         tZWNSBclyU7K8Rx5WKaBycdTtvxloDvPvyoMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372168; x=1699976968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLSFAxdv6KNhnV/xuN+r8R+eidxuGYd2af8Ta5nu6pw=;
        b=H807TLw/Hpv1DW7rbNN2a26TyCNJWYtSDTo9Eq2zsDSevvBHBr437oMhuC9W//OG1O
         CkC/vF9rA5rfR2Gc2qBLdY7qVPAxUqpYUkq+s+EG0V6CBmOwpxY0mFHMqktagXdvvBiL
         unpx13PIyKK4l0TgvtMq/PaB4xKkzwSfzv9W10pqRVmZjgFN+RZM/S3rCt5yAiexyOxF
         eT1bjZ0apJzAkZ2Pyd29uII5UgHO/aNh5pFq7YGsReQd9aYFDkwz6CkvFsIa9gXF/VIM
         4k6SNmW30BmS9/c4M2uQ7hnQttKrIDttpvSkyd1uPbX/uxOaQjxhZCThN1BYfDmpu3pT
         XwuQ==
X-Gm-Message-State: AOJu0Yz4B1xIjsS6rupYMY2st7RNJxeVrFHqfTBsgJuQRDJfVKmhadz3
	FGFguOS6Vvs1Z2xeFeWKJRc7V81qRz2J6oVk8FQ=
X-Google-Smtp-Source: AGHT+IEQfrpjmK80gCQLWrqBtV5qfNMtAALxBQY/fc6WYhjYZ2jjhswqBKOUvc+VpdKWeLkI+HxALQ==
X-Received: by 2002:a2e:9f13:0:b0:2c6:ed5e:bbf0 with SMTP id u19-20020a2e9f13000000b002c6ed5ebbf0mr12789337ljk.34.1699372168177;
        Tue, 07 Nov 2023 07:49:28 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/7] tools/xg: Add self-(de)serialisation functions for cpu_policy
Date: Tue,  7 Nov 2023 15:49:17 +0000
Message-Id: <20231107154921.54979-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
References: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These allow a policy to internally (de)serialize itself, so that we don't
have to carry around serialization buffers when perfectly good ones are
present inside.

Both moved on top of the xend overrides as they are needed there in future
patches

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 90 ++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 41 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 3545f3e530..ac75ce2b4e 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -254,6 +254,50 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
+static int cpu_policy_deserialise_on_self(xc_interface *xch, xc_cpu_policy_t *p)
+{
+    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    int rc;
+
+    rc = x86_cpuid_copy_from_buffer(&p->policy, p->leaves.buf, p->leaves.len,
+                                    &err_leaf, &err_subleaf);
+    if ( rc )
+    {
+        if ( err_leaf != -1 )
+            ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
+                  err_leaf, err_subleaf, -rc, strerror(-rc));
+        return rc;
+    }
+
+    rc = x86_msr_copy_from_buffer(&p->policy, p->msrs.buf, p->msrs.len, &err_msr);
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
+static int cpu_policy_serialise_on_self(xc_interface *xch, xc_cpu_policy_t *p)
+{
+    uint32_t nr_leaves = p->leaves.allocated;
+    uint32_t nr_msrs = p->msrs.allocated;
+    int rc = xc_cpu_policy_serialise(xch, p,
+                                     p->leaves.buf, &nr_leaves,
+                                     p->msrs.buf, &nr_msrs);
+
+    if ( !rc )
+    {
+        p->leaves.len = nr_leaves;
+        p->msrs.len = nr_msrs;
+    }
+
+    return rc;
+}
+
 static int compare_leaves(const void *l, const void *r)
 {
     const xen_cpuid_leaf_t *lhs = l;
@@ -883,35 +927,6 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
     errno = err;
 }
 
-static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
-                              unsigned int nr_leaves, unsigned int nr_entries)
-{
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    int rc;
-
-    rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves.buf,
-                                    nr_leaves, &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        if ( err_leaf != -1 )
-            ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-                  err_leaf, err_subleaf, -rc, strerror(-rc));
-        return rc;
-    }
-
-    rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs.buf,
-                                  nr_entries, &err_msr);
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
@@ -931,7 +946,7 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
     policy->leaves.len = nr_leaves;
     policy->msrs.len = nr_msrs;
 
-    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
+    rc = cpu_policy_deserialise_on_self(xch, policy);
     if ( rc )
     {
         errno = -rc;
@@ -960,7 +975,7 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
     policy->leaves.len = nr_leaves;
     policy->msrs.len = nr_msrs;
 
-    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
+    rc = cpu_policy_deserialise_on_self(xch, policy);
     if ( rc )
     {
         errno = -rc;
@@ -974,22 +989,15 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t *policy)
 {
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    unsigned int nr_leaves = policy->leaves.allocated;
-    unsigned int nr_msrs = policy->msrs.allocated;
     int rc;
 
-    rc = xc_cpu_policy_serialise(xch, policy,
-                                 policy->leaves.buf, &nr_leaves,
-                                 policy->msrs.buf, &nr_msrs);
+    rc = cpu_policy_serialise_on_self(xch, policy);
     if ( rc )
         return rc;
 
-    policy->leaves.len = nr_leaves;
-    policy->msrs.len = nr_msrs;
-
     rc = xc_set_domain_cpu_policy(xch, domid,
-                                  nr_leaves, policy->leaves.buf,
-                                  nr_msrs, policy->msrs.buf,
+                                  policy->leaves.len, policy->leaves.buf,
+                                  policy->msrs.len, policy->msrs.buf,
                                   &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
-- 
2.34.1


