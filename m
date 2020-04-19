Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A261AF91D
	for <lists+xen-devel@lfdr.de>; Sun, 19 Apr 2020 11:51:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQ6b0-0001sR-S9; Sun, 19 Apr 2020 09:50:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+3Jy=6D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQ6az-0001sM-JB
 for xen-devel@lists.xenproject.org; Sun, 19 Apr 2020 09:50:37 +0000
X-Inumbo-ID: 36c3e1f6-8223-11ea-8f63-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36c3e1f6-8223-11ea-8f63-12813bfff9fa;
 Sun, 19 Apr 2020 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RH2hdVxOyk3fFCZM1TxXyP1c7ntIm63sYd3dwBS69VI=; b=LacVcxUyMPjVd2SrdDa7YJFKhK
 2JmWy+Qe5tWBKdRlhFG1e5s6V+2QjrHwLeMU3RCOahYVpKIOURuxrfTVRNTB/GjwRLk8TXMjzz3gR
 CEH6TCSFPboyh2hIE4q1PHcdACDZFGnYVDqKP5d+CjhDikCBCpjS1dQoVcUUgJY08i1I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQ6av-00079V-My; Sun, 19 Apr 2020 09:50:33 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQ6av-0000QZ-A8; Sun, 19 Apr 2020 09:50:33 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] xen/arm: Avoid to open-code the relinquish state machine
Date: Sun, 19 Apr 2020 10:50:30 +0100
Message-Id: <20200419095030.2081-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In commit 0dfffe01d5 "x86: Improve the efficiency of
domain_relinquish_resources()", the x86 version of the function has been
reworked to avoid open-coding the state machine and also add more
documentation.

Bring the Arm version on part with x86 by introducing a documented
PROGRESS() macro to avoid latent bugs and make the new PROG_* states
private to domain_relinquish_resources().

Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/domain.c        | 60 ++++++++++++++++++++++--------------
 xen/include/asm-arm/domain.h |  9 +-----
 2 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 6627be2922..31169326b2 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -674,7 +674,6 @@ int arch_domain_create(struct domain *d,
     int rc, count = 0;
 
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
-    d->arch.relmem = RELMEM_not_started;
 
     /* Idle domains do not need this setup */
     if ( is_idle_domain(d) )
@@ -950,13 +949,41 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
     return ret;
 }
 
+/*
+ * Record the current progress. Subsequent hypercall continuations will
+ * logically restart work from this point.
+ *
+ * PROGRESS() markers must not be in the middle of loops. The loop
+ * variable isn't preserved accross a continuation.
+ *
+ * To avoid redundant work, there should be a marker before each
+ * function which may return -ERESTART.
+ */
+enum {
+    PROG_tee = 1,
+    PROG_xen,
+    PROG_page,
+    PROG_mapping,
+    PROG_done,
+};
+
+#define PROGRESS(x)                         \
+    d->arch.rel_priv = PROG_ ## x;          \
+    /* Fallthrough */                       \
+    case PROG_ ## x
+
 int domain_relinquish_resources(struct domain *d)
 {
     int ret = 0;
 
-    switch ( d->arch.relmem )
+    /*
+     * This hypercall can take minutes of wallclock time to complete.  This
+     * logic implements a co-routine, stashing state in struct domain across
+     * hypercall continuation boundaries.
+     */
+    switch ( d->arch.rel_priv )
     {
-    case RELMEM_not_started:
+    case 0:
         ret = iommu_release_dt_devices(d);
         if ( ret )
             return ret;
@@ -967,42 +994,27 @@ int domain_relinquish_resources(struct domain *d)
          */
         domain_vpl011_deinit(d);
 
-        d->arch.relmem = RELMEM_tee;
-        /* Fallthrough */
-
-    case RELMEM_tee:
+    PROGRESS(tee):
         ret = tee_relinquish_resources(d);
         if (ret )
             return ret;
 
-        d->arch.relmem = RELMEM_xen;
-        /* Fallthrough */
-
-    case RELMEM_xen:
+    PROGRESS(xen):
         ret = relinquish_memory(d, &d->xenpage_list);
         if ( ret )
             return ret;
 
-        d->arch.relmem = RELMEM_page;
-        /* Fallthrough */
-
-    case RELMEM_page:
+    PROGRESS(page):
         ret = relinquish_memory(d, &d->page_list);
         if ( ret )
             return ret;
 
-        d->arch.relmem = RELMEM_mapping;
-        /* Fallthrough */
-
-    case RELMEM_mapping:
+    PROGRESS(mapping):
         ret = relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
 
-        d->arch.relmem = RELMEM_done;
-        /* Fallthrough */
-
-    case RELMEM_done:
+    PROGRESS(done):
         break;
 
     default:
@@ -1012,6 +1024,8 @@ int domain_relinquish_resources(struct domain *d)
     return 0;
 }
 
+#undef PROGRESS
+
 void arch_dump_domain_info(struct domain *d)
 {
     p2m_dump_info(d);
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index d39477a939..d2142c6707 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -56,14 +56,7 @@ struct arch_domain
     struct vmmio vmmio;
 
     /* Continuable domain_relinquish_resources(). */
-    enum {
-        RELMEM_not_started,
-        RELMEM_tee,
-        RELMEM_xen,
-        RELMEM_page,
-        RELMEM_mapping,
-        RELMEM_done,
-    } relmem;
+    unsigned int rel_priv;
 
     struct {
         uint64_t offset;
-- 
2.17.1


