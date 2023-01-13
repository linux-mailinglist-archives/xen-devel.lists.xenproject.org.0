Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405BE668B8A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476634.739095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjt-0007ip-Gg; Fri, 13 Jan 2023 05:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476634.739095; Fri, 13 Jan 2023 05:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjs-0007Ow-B7; Fri, 13 Jan 2023 05:36:28 +0000
Received: by outflank-mailman (input) for mailman id 476634;
 Fri, 13 Jan 2023 05:36:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCfN-0005sP-8M
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9291ca8e-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CA57FEC;
 Thu, 12 Jan 2023 21:32:29 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DCB763F587;
 Thu, 12 Jan 2023 21:31:44 -0800 (PST)
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
X-Inumbo-ID: 9291ca8e-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/mpu: make Xen boot to idle on MPU systems(DNM)
Date: Fri, 13 Jan 2023 13:29:14 +0800
Message-Id: <20230113052914.3845596-42-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

As we have not implmented guest support in part#1 series of MPU
support, Xen can not create any guest in boot time. So in this
patch we make Xen boot to idle on MPU system for reviewer to
test part#1 series.

THIS PATCH IS ONLY FOR TESTING, NOT FOR REVIEWING.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/mm_mpu.c |  3 +++
 xen/arch/arm/setup.c  | 21 ++++++++++++---------
 xen/arch/arm/traps.c  |  2 ++
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index 434ed872c1..73d5779ab4 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -32,6 +32,9 @@
 #include <asm/page.h>
 #include <asm/setup.h>
 
+/* Non-boot CPUs use this to find the correct pagetables. */
+uint64_t init_ttbr;
+
 #ifdef NDEBUG
 static inline void
 __attribute__ ((__format__ (__printf__, 1, 2)))
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index b21fc4b8e2..d04ad8f838 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -803,16 +803,19 @@ void __init start_xen(unsigned long boot_phys_offset,
 #endif
     enable_cpu_features();
 
-    /* Create initial domain 0. */
-    if ( !is_dom0less_mode() )
-        create_dom0();
-    else
-        printk(XENLOG_INFO "Xen dom0less mode detected\n");
-
-    if ( acpi_disabled )
+    if ( !IS_ENABLED(CONFIG_ARM_V8R) )
     {
-        create_domUs();
-        alloc_static_evtchn();
+        /* Create initial domain 0. */
+        if ( !is_dom0less_mode() )
+            create_dom0();
+        else
+            printk(XENLOG_INFO "Xen dom0less mode detected\n");
+
+        if ( acpi_disabled )
+        {
+            create_domUs();
+            alloc_static_evtchn();
+        }
     }
 
     /*
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 061c92acbd..2444f7f6d8 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -963,7 +963,9 @@ void vcpu_show_registers(const struct vcpu *v)
     ctxt.ifsr32_el2 = v->arch.ifsr;
 #endif
 
+#ifndef CONFIG_HAS_MPU
     ctxt.vttbr_el2 = v->domain->arch.p2m.vttbr;
+#endif
 
     _show_registers(&v->arch.cpu_info->guest_cpu_user_regs, &ctxt, 1, v);
 }
-- 
2.25.1


