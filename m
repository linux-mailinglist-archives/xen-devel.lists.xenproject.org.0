Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45349357FDD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 11:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107106.204742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURHE-0004bK-1O; Thu, 08 Apr 2021 09:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107106.204742; Thu, 08 Apr 2021 09:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURHD-0004aR-R3; Thu, 08 Apr 2021 09:48:39 +0000
Received: by outflank-mailman (input) for mailman id 107106;
 Thu, 08 Apr 2021 09:48:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/ag=JF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lURHB-0004WM-P1
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 09:48:37 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 36a3e47c-9081-4c70-b092-c6ecab5b98b2;
 Thu, 08 Apr 2021 09:48:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A11E0106F;
 Thu,  8 Apr 2021 02:48:32 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C6213F694;
 Thu,  8 Apr 2021 02:48:30 -0700 (PDT)
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
X-Inumbo-ID: 36a3e47c-9081-4c70-b092-c6ecab5b98b2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v2 2/4] xen/arm: Handle cases when hardware_domain is NULL
Date: Thu,  8 Apr 2021 10:48:16 +0100
Message-Id: <20210408094818.8173-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210408094818.8173-1-luca.fancellu@arm.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>

The function is_hardware_domain() returns true if the
hardware_domain and the passed domain is NULL, here we
add a check to return false if there is no hardware_domain.

Among the common and arm codebase there are few cases where
the hardware_domain variable is checked to see if the current
domain is equal to the hardware_domain, change this cases to
use is_hardware_domain() function instead.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/irq.c                       | 2 +-
 xen/common/domain.c                      | 4 ++--
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    | 2 +-
 xen/drivers/passthrough/arm/smmu.c       | 2 +-
 xen/include/asm-arm/domain.h             | 2 +-
 xen/include/xen/sched.h                  | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b71b099e6f..b761d90c40 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -412,7 +412,7 @@ bool is_assignable_irq(unsigned int irq)
  */
 bool irq_type_set_by_domain(const struct domain *d)
 {
-    return (d == hardware_domain);
+    return is_hardware_domain(d);
 }
 
 /*
diff --git a/xen/common/domain.c b/xen/common/domain.c
index d85984638a..e8ec3ba445 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -308,7 +308,7 @@ static int late_hwdom_init(struct domain *d)
     struct domain *dom0;
     int rv;
 
-    if ( d != hardware_domain || d->domain_id == 0 )
+    if ( !is_hardware_domain(d) || d->domain_id == 0 )
         return 0;
 
     rv = xsm_init_hardware_domain(XSM_HOOK, d);
@@ -705,7 +705,7 @@ struct domain *domain_create(domid_t domid,
     err = err ?: -EILSEQ; /* Release build safety. */
 
     d->is_dying = DOMDYING_dead;
-    if ( hardware_domain == d )
+    if ( is_hardware_domain(d) )
         hardware_domain = old_hwdom;
     atomic_set(&d->refcnt, DOMAIN_DESTROYED);
 
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index aef358d880..8b8e3a00ba 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1168,7 +1168,7 @@ static int ipmmu_reassign_device(struct domain *s, struct domain *t,
     int ret = 0;
 
     /* Don't allow remapping on other domain than hwdom */
-    if ( t && t != hardware_domain )
+    if ( t && !is_hardware_domain(t) )
         return -EPERM;
 
     if ( t == s )
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 53d150cdb6..d115df7320 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3366,7 +3366,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 	int ret = 0;
 
 	/* Don't allow remapping on other domain than hwdom */
-	if (t && t != hardware_domain)
+	if ( t && !is_hardware_domain(t) )
 		return -EPERM;
 
 	if (t == s)
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 3e8aa37866..932fdfd6dd 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2670,7 +2670,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 	int ret = 0;
 
 	/* Don't allow remapping on other domain than hwdom */
-	if (t && t != hardware_domain)
+	if ( t && !is_hardware_domain(t) )
 		return -EPERM;
 
 	if (t == s)
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 1da90f207d..738bda5ef3 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -30,7 +30,7 @@ enum domain_type {
 #endif
 
 /* The hardware domain has always its memory direct mapped. */
-#define is_domain_direct_mapped(d) ((d) == hardware_domain)
+#define is_domain_direct_mapped(d) (is_hardware_domain(d))
 
 struct vtimer {
     struct vcpu *v;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 5485d08afb..bfc9d2577c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1022,7 +1022,7 @@ static always_inline bool is_hardware_domain(const struct domain *d)
     if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
         return false;
 
-    return evaluate_nospec(d == hardware_domain);
+    return evaluate_nospec((hardware_domain != NULL) && (d == hardware_domain));
 }
 
 /* This check is for functionality specific to a control domain */
-- 
2.17.1


