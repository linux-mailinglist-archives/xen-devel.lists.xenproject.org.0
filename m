Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569ED7C8887
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616663.958839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK23-00035u-IL; Fri, 13 Oct 2023 15:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616663.958839; Fri, 13 Oct 2023 15:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK23-00031i-Do; Fri, 13 Oct 2023 15:24:55 +0000
Received: by outflank-mailman (input) for mailman id 616663;
 Fri, 13 Oct 2023 15:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK22-0002kz-6T
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:24:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a816777d-69dc-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 17:24:53 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id 480814EE0744;
 Fri, 13 Oct 2023 17:24:52 +0200 (CEST)
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
X-Inumbo-ID: a816777d-69dc-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 02/10] arm/cpufeature: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:32 +0200
Message-Id: <3b28dca993cac9391b997c1744218cf4062907df.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207038.git.federico.serafini@bugseng.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/include/asm/cpufeature.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 8011076b8c..41e97c23dd 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -127,8 +127,8 @@ static inline void cpus_set_cap(unsigned int num)
 struct arm_cpu_capabilities {
     const char *desc;
     u16 capability;
-    bool (*matches)(const struct arm_cpu_capabilities *);
-    int (*enable)(void *); /* Called on every active CPUs */
+    bool (*matches)(const struct arm_cpu_capabilities *caps);
+    int (*enable)(void *ptr); /* Called on every active CPUs */
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


