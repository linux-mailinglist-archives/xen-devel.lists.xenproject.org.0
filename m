Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E87E4414
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:49:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628913.980875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKb-0005XT-2I; Tue, 07 Nov 2023 15:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628913.980875; Tue, 07 Nov 2023 15:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKa-0005TF-V2; Tue, 07 Nov 2023 15:49:32 +0000
Received: by outflank-mailman (input) for mailman id 628913;
 Tue, 07 Nov 2023 15:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2M1=GU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r0OKZ-0004f2-Kx
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:49:31 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cd35fa3-7d85-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 16:49:30 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c504a5e1deso76812941fa.2
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
X-Inumbo-ID: 3cd35fa3-7d85-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699372169; x=1699976969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jiUkZX/lOtTWPH5LYfdV9AHbgGtbP06hzMjaTd5OCM=;
        b=aj/Jbu+QM+wxszoAF+dBDZvECfkN9N7NHUOK8Y+uYwDX2psQ3SgQiQSkHq+geeE1su
         1VSlLG/zaqLqLGd7sENV21i7nplo6IHx4j6p+/0Zt9EFMDoF++NxEuVFcjXGzIOAwbsY
         BA0mO6Q3+iObOhOnwy33aeyNuGqYbXSENuar4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372169; x=1699976969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jiUkZX/lOtTWPH5LYfdV9AHbgGtbP06hzMjaTd5OCM=;
        b=a8a2WxesjaZmcI88zfOL16rf8aclVPkF0AA377l97lUgva48j/w0wW3zwOpVFNn3vO
         JB4qJw4JO8koGI9P6mMRCjty7W5DzUTKOOf3BNuerw+INsGlqYHiqPj5yVIjD7IH3QaE
         C0UJAYKsacBmVBMXFIGNJLFvgCNcdhW9+VfJ0vOBmIop8p3qhMol7Ry2nMnXuT2vUgsv
         XwVEuV2jFxu/tms40tGdGmeDS8UEpdEvwl/otJ/BTSJtTR/0O2Dx43SORzxR2Pr68a4S
         nJKE7iG2yHHP8GDhnryCYn80PthAobYLUuPJlzGRu1/hu6KH7g0KUuTIG4qfUboodOoF
         jk9Q==
X-Gm-Message-State: AOJu0YxzTEzUj0Ydnrg4pVE4w5JYyXYt0lfd3cTuq0Wi0Lc21wRolya1
	cvWd8Pc2aIfx0IEHPinziyWk9LP9hdWPYuqn024=
X-Google-Smtp-Source: AGHT+IFmwp4HP9zrnpfBEm8j5iQIJVQsEddmM00wdeRcT3qA+x4VfZlFYl9CWgHoK6RI5zuOeiXwew==
X-Received: by 2002:a2e:b0ed:0:b0:2bd:19c5:3950 with SMTP id h13-20020a2eb0ed000000b002bd19c53950mr24956350ljl.33.1699372168684;
        Tue, 07 Nov 2023 07:49:28 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/7] tools/xg: Split xc_cpu_policy_set_domain()
Date: Tue,  7 Nov 2023 15:49:18 +0000
Message-Id: <20231107154921.54979-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
References: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xc_cpu_policy_set_domain_from_serialised() converts the cpu policy into its
serialised form first and then sends that to Xen. Meanwhile,
xc_cpu_policy_domain_set_from_deserialised() uses whatever is already in
the internal serialisation buffer of the policy object.

This split helps in a future patch where modifications are done in the
serialized form and we don't want to do a serialization round-trip to
send it to Xen.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/include/xenguest.h        |  8 ++++++--
 tools/libs/guest/xg_cpuid_x86.c | 24 ++++++++++++++----------
 tools/tests/tsx/test-tsx.c      |  2 +-
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 702965addc..a66d9f7807 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -795,8 +795,12 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
                              xc_cpu_policy_t *policy);
 int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t *policy);
-int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t *policy);
+int xc_cpu_policy_set_domain_from_serialised(xc_interface *xch,
+                                             uint32_t domid,
+                                             xc_cpu_policy_t *policy);
+int xc_cpu_policy_set_domain_from_deserialised(xc_interface *xch,
+                                               uint32_t domid,
+                                               xc_cpu_policy_t *policy);
 
 /* Manipulate a policy via architectural representations. */
 int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index ac75ce2b4e..8fafeb2a02 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -985,20 +985,24 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
     return rc;
 }
 
-int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t *policy)
+int xc_cpu_policy_set_domain_from_deserialised(xc_interface *xch, uint32_t domid,
+                                               xc_cpu_policy_t *policy)
 {
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     int rc;
-
-    rc = cpu_policy_serialise_on_self(xch, policy);
-    if ( rc )
+    if ( (rc = cpu_policy_serialise_on_self(xch, policy)) )
         return rc;
 
-    rc = xc_set_domain_cpu_policy(xch, domid,
-                                  policy->leaves.len, policy->leaves.buf,
-                                  policy->msrs.len, policy->msrs.buf,
-                                  &err_leaf, &err_subleaf, &err_msr);
+    return xc_cpu_policy_set_domain_from_serialised(xch, domid, policy);
+}
+
+int xc_cpu_policy_set_domain_from_serialised(xc_interface *xch, uint32_t domid,
+                                             xc_cpu_policy_t *policy)
+{
+    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    int rc = xc_set_domain_cpu_policy(xch, domid,
+                                      policy->leaves.len, policy->leaves.buf,
+                                      policy->msrs.len, policy->msrs.buf,
+                                      &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
         ERROR("Failed to set domain %u policy (%d = %s)", domid, -rc,
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index 3371bb26f7..21b5640796 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -405,7 +405,7 @@ static void test_guest(struct xen_domctl_createdomain *c)
                 (bitmaskof(X86_FEATURE_HLE) | bitmaskof(X86_FEATURE_RTM)));
 
         /* Set the new policy. */
-        rc = xc_cpu_policy_set_domain(xch, domid, guest_policy);
+        rc = xc_cpu_policy_set_domain_from_deserialised(xch, domid, guest_policy);
         if ( rc )
         {
             fail("  Failed to set domain policy: %d - %s\n",
-- 
2.34.1


