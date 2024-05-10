Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3138C24F0
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 14:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719856.1122710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5PQS-0005gs-Ib; Fri, 10 May 2024 12:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719856.1122710; Fri, 10 May 2024 12:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5PQS-0005e9-Fh; Fri, 10 May 2024 12:32:36 +0000
Received: by outflank-mailman (input) for mailman id 719856;
 Fri, 10 May 2024 12:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMhx=MN=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1s5PQQ-0005e3-RC
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 12:32:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f767244-0ec9-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 14:32:32 +0200 (CEST)
Received: from LAPTOP-EFA9O91E.localdomain
 (host-87-7-28-64.retail.telecomitalia.it [87.7.28.64])
 by support.bugseng.com (Postfix) with ESMTPSA id AFE114EE073C;
 Fri, 10 May 2024 14:32:31 +0200 (CEST)
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
X-Inumbo-ID: 5f767244-0ec9-11ef-b4bb-af5377834399
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
Subject: [XEN PATCH v3] arm/mem_access: add conditional build of mem_access.c
Date: Fri, 10 May 2024 14:32:11 +0200
Message-Id: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to comply to MISRA C:2012 Rule 8.4 for ARM the following
changes are done:
revert preprocessor conditional changes to xen/mem_access.h which
had it build unconditionally, add conditional build for xen/mem_access.c
as well and provide stubs in asm/mem_access.h for the users of this
header.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
Changes from v2:
Stylistic changes to code aimed to respect xen's coding guidelines.
---
Changes from v1:
Reverted preprocessor conditional changes to xen/mem_access.h;
added conditional build for xen/mem_access.c;
provided stubs for asm/mem_access.h functions
---
 xen/arch/arm/Makefile                 |  2 +-
 xen/arch/arm/include/asm/mem_access.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

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
index 35ed0ad154..abac8032fc 100644
--- a/xen/arch/arm/include/asm/mem_access.h
+++ b/xen/arch/arm/include/asm/mem_access.h
@@ -17,6 +17,8 @@
 #ifndef _ASM_ARM_MEM_ACCESS_H
 #define _ASM_ARM_MEM_ACCESS_H
 
+#include <xen/types.h>
+
 static inline
 bool p2m_mem_access_emulate_check(struct vcpu *v,
                                   const struct vm_event_st *rsp)
@@ -35,12 +37,28 @@ static inline bool p2m_mem_access_sanity_check(struct domain *d)
  * Send mem event based on the access. Boolean return value indicates if trap
  * needs to be injected into guest.
  */
+#ifdef CONFIG_MEM_ACCESS
 bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec);
 
 struct page_info*
 p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
                                   const struct vcpu *v);
+#else
+
+static inline bool
+p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec)
+{
+    return false;
+}
+
+static inline struct page_info*
+p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
+                                  const struct vcpu *v)
+{
+    return NULL;
+}
 
+#endif /*CONFIG_MEM_ACCESS*/
 #endif /* _ASM_ARM_MEM_ACCESS_H */
 
 /*
-- 
2.25.1


