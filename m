Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93791538903
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 00:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338893.563730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvo5C-0000vO-Vh; Mon, 30 May 2022 22:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338893.563730; Mon, 30 May 2022 22:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvo5C-0000sZ-SD; Mon, 30 May 2022 22:41:54 +0000
Received: by outflank-mailman (input) for mailman id 338893;
 Mon, 30 May 2022 22:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvo4a-000799-S6
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 22:41:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bc7b1ed-e069-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 00:41:14 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653950423920903.2613018163844;
 Mon, 30 May 2022 15:40:23 -0700 (PDT)
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
X-Inumbo-ID: 9bc7b1ed-e069-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653950426; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XrvTuKYnQvr4VmxSf5tKRMwkglQkygeiNP8xPTO7MSvDJTb3+NNc27XqncdtfI4B0i8G+kfSlo6TrobfI/qBKVIHcZ+KXC+fxZ3Xj1los2vhTppGjMd5/LUklExRkJjKh1acQl1mfTy/2Vqida9Tifrrxl9R2Dr7JYFcTpm0GMs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653950426; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=nndS4b5R/wYFUWfqbrv+HVeHYowHUAVZYTBTrHEBrVY=; 
	b=WQl/+jdaHNXtbkvckiP8rTWW8rTh7BA6MtU7VyRcG+jYKQ9J/8P+o9LW5n6/8PJFiPVo2Sbic/6rBkijPst/uTFtLG8QYbTXfnvn+hDXk8zJDCYOF2BF3GLj1Gg1xAI5rHywJpF1nTEiEl5fgLjE4THK7U1JHG7ZC3ur1HWbC2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653950426;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=nndS4b5R/wYFUWfqbrv+HVeHYowHUAVZYTBTrHEBrVY=;
	b=H0EVJc5QO8n65Xn2pOmGFcrLtETK1L93L5emmI7SvD7IJmlm6N8jVKMKQ/qhtDC1
	MsfbX0whXMUEVu/2dEbLGW/LniKy1bop36BnG46+2xl4EqUx0I6B9lmbreZx/ynolBc
	rcEVUD4PKjckwSAmnLCsLDyo7rxfcxxrm8CH+tsc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [v2 3/3] xsm: properly handle error from XSM init
Date: Mon, 30 May 2022 22:39:45 -0400
Message-Id: <20220531023945.22196-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531023945.22196-1-dpsmith@apertussolutions.com>
References: <20220531023945.22196-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit is to move towards providing a uniform interface across
architectures to initialize the XSM framework. Specifically, it provides a
common handling of initialization failure by providing the printing of a
warning message.

For Arm, xsm_dt_init() was tailored to have an Arm specific expansion of the
return values. This expansion added a value to reflect whether the security
supported XSM policy module was the enforcing policy module. This was then used
to determine if a warning message would be printed. Despite this expansion,
like x86, Arm does not address any XSM initialization errors that may have
occurred.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/arm/setup.c | 10 +++++-----
 xen/arch/x86/setup.c |  9 +++++++--
 xen/xsm/xsm_core.c   | 22 +++++++++++-----------
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index ea1f5ee3d3..6bf71e1064 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -967,11 +967,11 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     tasklet_subsys_init();
 
-    if ( xsm_dt_init() != 1 )
-        warning_add("WARNING: SILO mode is not enabled.\n"
-                    "It has implications on the security of the system,\n"
-                    "unless the communications have been forbidden between\n"
-                    "untrusted domains.\n");
+    if ( xsm_dt_init() )
+        warning_add("WARNING: XSM failed to initialize.\n"
+                    "This has implications on the security of the system,\n"
+                    "as uncontrolled communications between trusted and\n"
+                    "untrusted domains may occur.\n");
 
     init_maintenance_interrupt();
     init_timer_interrupt();
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 53a73010e0..ed67b50c9d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -24,6 +24,7 @@
 #include <xen/pfn.h>
 #include <xen/nodemask.h>
 #include <xen/virtual_region.h>
+#include <xen/warning.h>
 #include <xen/watchdog.h>
 #include <public/version.h>
 #ifdef CONFIG_COMPAT
@@ -1690,7 +1691,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     open_softirq(NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ, new_tlbflush_clock_period);
 
-    if ( opt_watchdog ) 
+    if ( opt_watchdog )
         nmi_watchdog = NMI_LOCAL_APIC;
 
     find_smp_config();
@@ -1700,7 +1701,11 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
-    xsm_multiboot_init(module_map, mbi);
+    if ( xsm_multiboot_init(module_map, mbi) )
+        warning_add("WARNING: XSM failed to initialize.\n"
+                    "This has implications on the security of the system,\n"
+                    "as uncontrolled communications between trusted and\n"
+                    "untrusted domains may occur.\n");
 
     /*
      * IOMMU-related ACPI table parsing may require some of the system domains
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 8f6c3de8a6..6377895e1e 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -10,23 +10,17 @@
  *  as published by the Free Software Foundation.
  */
 
-#include <xen/init.h>
 #include <xen/errno.h>
+#include <xen/hypercall.h>
+#include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/param.h>
-
-#include <xen/hypercall.h>
+#include <xen/warning.h>
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_XSM
-
-#ifdef CONFIG_MULTIBOOT
 #include <asm/setup.h>
-#endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
-#include <asm/setup.h>
-#endif
+#ifdef CONFIG_XSM
 
 #define XSM_FRAMEWORK_VERSION    "1.0.1"
 
@@ -190,7 +184,13 @@ int __init xsm_dt_init(void)
 
     xfree(policy_buffer);
 
-    return ret ?: (xsm_bootparam == XSM_BOOTPARAM_SILO);
+    if ( xsm_bootparam != XSM_BOOTPARAM_SILO )
+        warning_add("WARNING: SILO mode is not enabled.\n"
+                    "It has implications on the security of the system,\n"
+                    "unless the communications have been forbidden between\n"
+                    "untrusted domains.\n");
+
+    return ret;
 }
 
 /**
-- 
2.20.1


