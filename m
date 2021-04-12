Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D1735C464
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 12:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108960.207954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuBn-0000kQ-In; Mon, 12 Apr 2021 10:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108960.207954; Mon, 12 Apr 2021 10:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuBn-0000jl-FK; Mon, 12 Apr 2021 10:53:07 +0000
Received: by outflank-mailman (input) for mailman id 108960;
 Mon, 12 Apr 2021 10:53:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKKJ=JJ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lVuBl-0000jA-MG
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:53:05 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 36946a84-f473-4f29-99fd-a68ce6a6bc01;
 Mon, 12 Apr 2021 10:53:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0130EED1;
 Mon, 12 Apr 2021 03:53:04 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EE903F694;
 Mon, 12 Apr 2021 03:53:02 -0700 (PDT)
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
X-Inumbo-ID: 36946a84-f473-4f29-99fd-a68ce6a6bc01
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
Subject: [PATCH v3 2/4] xen/arm: Handle cases when hardware_domain is NULL
Date: Mon, 12 Apr 2021 11:52:41 +0100
Message-Id: <20210412105243.23354-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210412105243.23354-1-luca.fancellu@arm.com>
References: <20210412105243.23354-1-luca.fancellu@arm.com>

The function is_hardware_domain() returns true if the
hardware_domain and the passed domain is NULL, here we
add a check to return false if there is no hardware_domain.

Among the common and arm codebase there are few cases where
the hardware_domain variable is checked to see if the current
domain is equal to the hardware_domain, change this cases to
use is_hardware_domain() function instead.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3 changes:
- removed unneeded parenthesis for macro is_domain_direct_mapped
- is_hardware_domain() checks for the passed domain and if it is
  NULL, it returns false.
- reverted back checks in the function late_hwdom_init
---
 xen/arch/arm/irq.c                       | 2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    | 2 +-
 xen/drivers/passthrough/arm/smmu.c       | 2 +-
 xen/include/asm-arm/domain.h             | 2 +-
 xen/include/xen/sched.h                  | 3 +++
 6 files changed, 8 insertions(+), 5 deletions(-)

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
index 1da90f207d..0a74df9931 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -30,7 +30,7 @@ enum domain_type {
 #endif
 
 /* The hardware domain has always its memory direct mapped. */
-#define is_domain_direct_mapped(d) ((d) == hardware_domain)
+#define is_domain_direct_mapped(d) is_hardware_domain(d)
 
 struct vtimer {
     struct vcpu *v;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 5485d08afb..5ba90f1214 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1022,6 +1022,9 @@ static always_inline bool is_hardware_domain(const struct domain *d)
     if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
         return false;
 
+    if ( !d )
+        return false;
+
     return evaluate_nospec(d == hardware_domain);
 }
 
-- 
2.17.1


