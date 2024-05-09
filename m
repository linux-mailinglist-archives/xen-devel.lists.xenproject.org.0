Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A51D8C0E50
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 12:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719175.1121769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51DJ-0007D4-Kx; Thu, 09 May 2024 10:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719175.1121769; Thu, 09 May 2024 10:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51DJ-0007Al-I8; Thu, 09 May 2024 10:41:25 +0000
Received: by outflank-mailman (input) for mailman id 719175;
 Thu, 09 May 2024 10:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VSaB=MM=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1s51DH-0007Af-PZ
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 10:41:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd2f3ea-0df0-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 12:41:21 +0200 (CEST)
Received: from LAPTOP-EFA9O91E.localdomain
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 8AE014EE0737;
 Thu,  9 May 2024 12:41:20 +0200 (CEST)
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
X-Inumbo-ID: acd2f3ea-0df0-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [XEN PATCH v2] arm/mem_access: add conditional build of mem_access.c
Date: Thu,  9 May 2024 12:39:53 +0200
Message-Id: <ad49a2006a6f19c2db1ff5eabb9ffd666693c4c5.1715250761.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to comply to MISRA C:2012 Rule 8.4 for ARM asm/mem_access.h in
the case where MEM_ACCESS=n stubs are needed to allow the conditional
compilation of the users of this header.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
Changes from v1:
Reverted preprocessor conditional changes to xen/mem_access.h;
added conditional build for xen/mem_access.c;
provided stubs for asm/mem_access.h functions.
---
 xen/arch/arm/Makefile                 | 2 +-
 xen/arch/arm/include/asm/mem_access.h | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7b1350e2ef..45dc29ea53 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -37,7 +37,7 @@ obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.init.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
-obj-y += mem_access.o
+obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
 obj-y += p2m.o
diff --git a/xen/arch/arm/include/asm/mem_access.h b/xen/arch/arm/include/asm/mem_access.h
index 35ed0ad154..2f73172e39 100644
--- a/xen/arch/arm/include/asm/mem_access.h
+++ b/xen/arch/arm/include/asm/mem_access.h
@@ -17,6 +17,7 @@
 #ifndef _ASM_ARM_MEM_ACCESS_H
 #define _ASM_ARM_MEM_ACCESS_H
 
+#include <xen/types.h>
 static inline
 bool p2m_mem_access_emulate_check(struct vcpu *v,
                                   const struct vm_event_st *rsp)
@@ -35,12 +36,20 @@ static inline bool p2m_mem_access_sanity_check(struct domain *d)
  * Send mem event based on the access. Boolean return value indicates if trap
  * needs to be injected into guest.
  */
+#ifdef CONFIG_MEM_ACCESS
 bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec);
 
 struct page_info*
 p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
                                   const struct vcpu *v);
+#else
 
+static inline bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec) {return false;}
+
+static inline struct page_info*
+p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
+                                  const struct vcpu *v) {return NULL;}
+#endif /*CONFIG_MEM_ACCESS*/
 #endif /* _ASM_ARM_MEM_ACCESS_H */
 
 /*
-- 
2.25.1


