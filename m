Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B747CDC42
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 14:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618549.962315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt612-0000Y9-2j; Wed, 18 Oct 2023 12:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618549.962315; Wed, 18 Oct 2023 12:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt611-0000VY-V7; Wed, 18 Oct 2023 12:51:11 +0000
Received: by outflank-mailman (input) for mailman id 618549;
 Wed, 18 Oct 2023 12:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt610-0000VS-Om
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 12:51:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01e2b170-6db5-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 14:51:08 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id 406D14EE0738;
 Wed, 18 Oct 2023 14:51:07 +0200 (CEST)
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
X-Inumbo-ID: 01e2b170-6db5-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2] arm/cpufeature: address violations of MISRA C:2012 Rule 8.2
Date: Wed, 18 Oct 2023 14:50:46 +0200
Message-Id: <7976ea7591a073a7896c2cfe9d0b1b77f414731a.1697632684.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- fixed names.
---
 xen/arch/arm/include/asm/cpufeature.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 8011076b8c..c95582044a 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -127,8 +127,8 @@ static inline void cpus_set_cap(unsigned int num)
 struct arm_cpu_capabilities {
     const char *desc;
     u16 capability;
-    bool (*matches)(const struct arm_cpu_capabilities *);
-    int (*enable)(void *); /* Called on every active CPUs */
+    bool (*matches)(const struct arm_cpu_capabilities *entry);
+    int (*enable)(void *data); /* Called on every active CPUs */
     union {
         struct {    /* To be used for eratum handling only */
             u32 midr_model;
@@ -448,10 +448,10 @@ struct cpuinfo_arm {
 
 extern struct cpuinfo_arm system_cpuinfo;
 
-extern void identify_cpu(struct cpuinfo_arm *);
+extern void identify_cpu(struct cpuinfo_arm *c);
 
 #ifdef CONFIG_ARM_64
-extern void update_system_features(const struct cpuinfo_arm *);
+extern void update_system_features(const struct cpuinfo_arm *new);
 #else
 static inline void update_system_features(const struct cpuinfo_arm *cpuinfo)
 {
-- 
2.34.1


