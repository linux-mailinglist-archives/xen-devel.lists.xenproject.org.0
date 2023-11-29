Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9497FDC1E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 17:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644111.1004692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MzL-0001Ui-2R; Wed, 29 Nov 2023 16:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644111.1004692; Wed, 29 Nov 2023 16:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MzK-0001Ri-Vr; Wed, 29 Nov 2023 16:00:34 +0000
Received: by outflank-mailman (input) for mailman id 644111;
 Wed, 29 Nov 2023 16:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l7XS=HK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r8MzJ-0001Rc-Gk
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 16:00:33 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c48f08a-8ed0-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 17:00:31 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b4f6006d5so14774875e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 08:00:31 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfce85000000b0033314c63881sm2828493wrn.22.2023.11.29.08.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 08:00:30 -0800 (PST)
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
X-Inumbo-ID: 6c48f08a-8ed0-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701273631; x=1701878431; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBcHra9Y1Q4gvcfz2SoEQCJlciSK32eaIEbRIUY8qBU=;
        b=E/Sdvplod70Q2OIUGn446E/LJt2t68Gwxyn3IDDhXBcwL2DB+0LKy6iaR6Daub6EEC
         cOitJ+8BByKnkQmP9Nf8uOhKgqttpPNaPJQMI1cJBA0IZCzxiQZTPXA96KYRYpp0zjR3
         zrFJphCPYkc2UobZoMDqBRXOyqF86zHtn3km8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701273631; x=1701878431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBcHra9Y1Q4gvcfz2SoEQCJlciSK32eaIEbRIUY8qBU=;
        b=ROsiOGxLErtLsAeBOVO7PnezVAhI+jBUPF8pxzKrayviJwM4tLLxy04oDlD7Z+A+0f
         UiSDJFwJODDHUDili18AOy7W0a3gQpG1I9swckDv3SH4NgLYsW0yBEDwnMN84IfMrekU
         NIn97O0w5ccezFUZ+pulUnxJQ7Jl8BvzAc9ftUMtq8NT85d8yNk0M/G95mVNbsBh90Dx
         Nl8EkqFkCkQKTE1lYXwEssn/C2pa/uBqwD97TnaL28R7hvUlQzXFU7GLzSCC0NGGeWf6
         jPq9i6ccIFaZBS8oajttl9G8Aiycpag2N58Kq5VEr66dVQ+HT+VvAGcN+cCKR29KRZ/9
         1Gkw==
X-Gm-Message-State: AOJu0YwWa4vcHkmABjOvy6gLK1sjQF7Jw7fEu2K4hpoGs0uCwdJvUHk8
	xWyvjx18+WbNDnGCFlL42lU+cF9ic/9hCz3iHJI=
X-Google-Smtp-Source: AGHT+IGp+rROAxm6g/NazMTgybVVYdHzIIoaHqIICbGvpOqBqel6SbmVluEb8aecpXZqpext5HhOlw==
X-Received: by 2002:a05:600c:4453:b0:40b:5464:b241 with SMTP id v19-20020a05600c445300b0040b5464b241mr1234417wmn.4.1701273631016;
        Wed, 29 Nov 2023 08:00:31 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xg: Fix potential memory leak in cpu policy getters/setters
Date: Wed, 29 Nov 2023 16:00:28 +0000
Message-Id: <20231129160028.67226-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They allocate two different hypercall buffers, but leak the first
allocation if the second one failed due to an early return that bypasses
cleanup.

Remove the early exit and go through _post() instead. Invoking _post() is
benign even if _pre() failed.

Fixes: 6b85e427098c ('x86/sysctl: Implement XEN_SYSCTL_get_cpu_policy')
Fixes: 60529dfeca14 ('x86/domctl: Implement XEN_DOMCTL_get_cpu_policy')
Fixes: 14ba07e6f816 ('x86/domctl: Implement XEN_DOMCTL_set_cpumsr_policy')
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 86 +++++++++++++++------------------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4497087daa..db5aebc815 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -136,20 +136,20 @@ static int get_system_cpu_policy(xc_interface *xch, uint32_t index,
     DECLARE_HYPERCALL_BOUNCE(msrs,
                              *nr_msrs * sizeof(*msrs),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
-    int ret;
-
-    if ( xc_hypercall_bounce_pre(xch, leaves) ||
-         xc_hypercall_bounce_pre(xch, msrs) )
-        return -1;
+    int ret = -1;
 
-    sysctl.cmd = XEN_SYSCTL_get_cpu_policy;
-    sysctl.u.cpu_policy.index = index;
-    sysctl.u.cpu_policy.nr_leaves = *nr_leaves;
-    set_xen_guest_handle(sysctl.u.cpu_policy.leaves, leaves);
-    sysctl.u.cpu_policy.nr_msrs = *nr_msrs;
-    set_xen_guest_handle(sysctl.u.cpu_policy.msrs, msrs);
-
-    ret = do_sysctl(xch, &sysctl);
+    if ( !xc_hypercall_bounce_pre(xch, leaves) &&
+         !xc_hypercall_bounce_pre(xch, msrs) )
+    {
+        sysctl.cmd = XEN_SYSCTL_get_cpu_policy;
+        sysctl.u.cpu_policy.index = index;
+        sysctl.u.cpu_policy.nr_leaves = *nr_leaves;
+        set_xen_guest_handle(sysctl.u.cpu_policy.leaves, leaves);
+        sysctl.u.cpu_policy.nr_msrs = *nr_msrs;
+        set_xen_guest_handle(sysctl.u.cpu_policy.msrs, msrs);
+
+        ret = do_sysctl(xch, &sysctl);
+    }
 
     xc_hypercall_bounce_post(xch, leaves);
     xc_hypercall_bounce_post(xch, msrs);
@@ -174,20 +174,20 @@ static int get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     DECLARE_HYPERCALL_BOUNCE(msrs,
                              *nr_msrs * sizeof(*msrs),
                              XC_HYPERCALL_BUFFER_BOUNCE_OUT);
-    int ret;
-
-    if ( xc_hypercall_bounce_pre(xch, leaves) ||
-         xc_hypercall_bounce_pre(xch, msrs) )
-        return -1;
-
-    domctl.cmd = XEN_DOMCTL_get_cpu_policy;
-    domctl.domain = domid;
-    domctl.u.cpu_policy.nr_leaves = *nr_leaves;
-    set_xen_guest_handle(domctl.u.cpu_policy.leaves, leaves);
-    domctl.u.cpu_policy.nr_msrs = *nr_msrs;
-    set_xen_guest_handle(domctl.u.cpu_policy.msrs, msrs);
+    int ret = -1;
 
-    ret = do_domctl(xch, &domctl);
+    if ( !xc_hypercall_bounce_pre(xch, leaves) &&
+         !xc_hypercall_bounce_pre(xch, msrs) )
+    {
+        domctl.cmd = XEN_DOMCTL_get_cpu_policy;
+        domctl.domain = domid;
+        domctl.u.cpu_policy.nr_leaves = *nr_leaves;
+        set_xen_guest_handle(domctl.u.cpu_policy.leaves, leaves);
+        domctl.u.cpu_policy.nr_msrs = *nr_msrs;
+        set_xen_guest_handle(domctl.u.cpu_policy.msrs, msrs);
+
+        ret = do_domctl(xch, &domctl);
+    }
 
     xc_hypercall_bounce_post(xch, leaves);
     xc_hypercall_bounce_post(xch, msrs);
@@ -214,32 +214,24 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     DECLARE_HYPERCALL_BOUNCE(msrs,
                              nr_msrs * sizeof(*msrs),
                              XC_HYPERCALL_BUFFER_BOUNCE_IN);
-    int ret;
-
-    if ( err_leaf_p )
-        *err_leaf_p = -1;
-    if ( err_subleaf_p )
-        *err_subleaf_p = -1;
-    if ( err_msr_p )
-        *err_msr_p = -1;
+    int ret = -1;
 
-    if ( xc_hypercall_bounce_pre(xch, leaves) )
-        return -1;
-
-    if ( xc_hypercall_bounce_pre(xch, msrs) )
-        return -1;
-
-    domctl.cmd = XEN_DOMCTL_set_cpu_policy;
-    domctl.domain = domid;
-    domctl.u.cpu_policy.nr_leaves = nr_leaves;
-    set_xen_guest_handle(domctl.u.cpu_policy.leaves, leaves);
-    domctl.u.cpu_policy.nr_msrs = nr_msrs;
-    set_xen_guest_handle(domctl.u.cpu_policy.msrs, msrs);
     domctl.u.cpu_policy.err_leaf = -1;
     domctl.u.cpu_policy.err_subleaf = -1;
     domctl.u.cpu_policy.err_msr = -1;
 
-    ret = do_domctl(xch, &domctl);
+    if ( !xc_hypercall_bounce_pre(xch, leaves) &&
+         !xc_hypercall_bounce_pre(xch, msrs) )
+    {
+        domctl.cmd = XEN_DOMCTL_set_cpu_policy;
+        domctl.domain = domid;
+        domctl.u.cpu_policy.nr_leaves = nr_leaves;
+        set_xen_guest_handle(domctl.u.cpu_policy.leaves, leaves);
+        domctl.u.cpu_policy.nr_msrs = nr_msrs;
+        set_xen_guest_handle(domctl.u.cpu_policy.msrs, msrs);
+
+        ret = do_domctl(xch, &domctl);
+    }
 
     xc_hypercall_bounce_post(xch, leaves);
     xc_hypercall_bounce_post(xch, msrs);
-- 
2.34.1


