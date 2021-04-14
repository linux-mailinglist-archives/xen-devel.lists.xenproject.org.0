Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C562435F08D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 11:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110390.210710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbbQ-0000bC-Rf; Wed, 14 Apr 2021 09:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110390.210710; Wed, 14 Apr 2021 09:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbbQ-0000ad-Nf; Wed, 14 Apr 2021 09:14:28 +0000
Received: by outflank-mailman (input) for mailman id 110390;
 Wed, 14 Apr 2021 09:14:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF16=JL=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lWbbP-0000WW-8g
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 09:14:27 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 92e6865c-ce27-4444-8413-6449d678ba19;
 Wed, 14 Apr 2021 09:14:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E04811FB;
 Wed, 14 Apr 2021 02:14:17 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C1883F73B;
 Wed, 14 Apr 2021 02:14:16 -0700 (PDT)
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
X-Inumbo-ID: 92e6865c-ce27-4444-8413-6449d678ba19
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v4 2/4] xen/arm: Handle cases when hardware_domain is NULL
Date: Wed, 14 Apr 2021 10:14:02 +0100
Message-Id: <20210414091404.14215-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210414091404.14215-1-luca.fancellu@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>

Among the common and arm codebase there are few cases where
the hardware_domain variable is checked to see if the current
domain is equal to the hardware_domain, change this cases to
use is_hardware_domain() function instead.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v4 changes:
- removed unneeded check for domain NULL from is_hardware_domain
  introduced in v3
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
 5 files changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.17.1


