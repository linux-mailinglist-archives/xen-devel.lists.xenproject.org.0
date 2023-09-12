Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7379D524
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 17:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600550.936283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5Us-0007vp-El; Tue, 12 Sep 2023 15:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600550.936283; Tue, 12 Sep 2023 15:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5Us-0007sz-8N; Tue, 12 Sep 2023 15:40:14 +0000
Received: by outflank-mailman (input) for mailman id 600550;
 Tue, 12 Sep 2023 15:40:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qg5Uq-0005yG-Di
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 15:40:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a85f01ac-5182-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 17:40:10 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4A4244EE074F;
 Tue, 12 Sep 2023 17:40:10 +0200 (CEST)
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
X-Inumbo-ID: a85f01ac-5182-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Gianluca Luparini <gianluca.luparini@bugseng.com>
Subject: [XEN PATCH v6 4/7] xen/lib: address violations of MISRA C:2012 Rule 7.2
Date: Tue, 12 Sep 2023 17:39:01 +0200
Message-Id: <f92e8ae0d980779bd7dd4b21b70ad779f2e2488b.1694532795.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694532795.git.simone.ballarin@bugseng.com>
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

For the sake of uniformity, the following change is made:
- add the 'U' suffix to switch cases in 'cpuid.c'

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

---
Changes in v6:
- new patch obtained by splitting LIB related changes from
"xen/x86: address violations of MISRA C:2012 Rule 7.2 (v5)"
---
 xen/lib/x86/cpuid.c  | 8 ++++----
 xen/lib/x86/policy.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 2006cbaa1c..eb7698dc73 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -217,10 +217,10 @@ void x86_cpu_policy_fill_native(struct cpu_policy *p)
     }
 
     /* Extended leaves. */
-    cpuid_leaf(0x80000000, &p->extd.raw[0]);
+    cpuid_leaf(0x80000000U, &p->extd.raw[0]);
     for ( i = 1; i <= MIN(p->extd.max_leaf & 0xffffU,
                           ARRAY_SIZE(p->extd.raw) - 1); ++i )
-        cpuid_leaf(0x80000000 + i, &p->extd.raw[i]);
+        cpuid_leaf(0x80000000U + i, &p->extd.raw[i]);
 
     /* Don't report leaves from possible lower level hypervisor, for now. */
     p->hv_limit = 0;
@@ -421,7 +421,7 @@ int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
     /* Extended leaves. */
     for ( leaf = 0; leaf <= MIN(p->extd.max_leaf & 0xffffUL,
                                 ARRAY_SIZE(p->extd.raw) - 1); ++leaf )
-        COPY_LEAF(0x80000000 | leaf, XEN_CPUID_NO_SUBLEAF, &p->extd.raw[leaf]);
+        COPY_LEAF(0x80000000U | leaf, XEN_CPUID_NO_SUBLEAF, &p->extd.raw[leaf]);
 
 #undef COPY_LEAF
 
@@ -521,7 +521,7 @@ int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
             p->hv2_limit = l.a;
             break;
 
-        case 0x80000000 ... 0x80000000 + ARRAY_SIZE(p->extd.raw) - 1:
+        case 0x80000000U ... 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1:
             if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
                 goto out_of_range;
 
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index a9c60000af..f033d22785 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -22,7 +22,7 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
         FAIL_CPUID(7, 0);
 
     if ( guest->extd.max_leaf > host->extd.max_leaf )
-        FAIL_CPUID(0x80000000, NA);
+        FAIL_CPUID(0x80000000U, NA);
 
     /* TODO: Audit more CPUID data. */
 
-- 
2.34.1


