Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A875393B0
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 17:11:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339756.564671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3Wa-00047X-EP; Tue, 31 May 2022 15:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339756.564671; Tue, 31 May 2022 15:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3Wa-00043x-Ay; Tue, 31 May 2022 15:11:12 +0000
Received: by outflank-mailman (input) for mailman id 339756;
 Tue, 31 May 2022 15:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw3WY-0002ll-34
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 15:11:10 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e544f357-e0f3-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 17:11:08 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654009835556426.3417674232287;
 Tue, 31 May 2022 08:10:35 -0700 (PDT)
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
X-Inumbo-ID: e544f357-e0f3-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1654009838; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OJLP+9jHjwII8G59UpMBuxVdvooVsmxuTNH7LC2KmAx0uop8eEVZqSlsKLlUmjh5eWAwYMB7E5mKmx2i9atGSY9fNAqjtMfQN9l1g3eyE3tVRmJk3Syn/kUdEXtaM1FVL/OfBN3WY+hzpoA99PwtYpWBkchsRcqQlG+T8bAemKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654009838; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/itM5oH8P546jOtaqfXF7dt1u8YSqmz3yqRhRU6zukM=; 
	b=F8CzgC5Dtk22p9lDWm9iTY/QcG3gEWSMcPfpCD2yJDLdvw7BfqO2zlPPHq0eefPyTd8/mpWJ3BElyKPkkJrUe4QswUvgRana7vuijqHGnsMdPW2oBAMFMjCSy1P5NrZvA/N3pc/f+szfex7nen/z5oLUb7BP3138GJFmi5ezS2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654009838;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=/itM5oH8P546jOtaqfXF7dt1u8YSqmz3yqRhRU6zukM=;
	b=KmdbP0tEpFHfezGkght3uPOAZUvNc3z9h4+3GkA0ohhmln8Gl7paPnEzEFr2vLD7
	u7reg+w1tHmUAIKxGOlpnfCXlPNAdqwe3+19DNvJXRDoJHIpPTuMOlrX5f7u4ywizkf
	MauJ279SaiiWVvylqsJgtOsFSEZAdhS3gB7YYyNk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v3 3/3] xsm: properly handle error from XSM init
Date: Tue, 31 May 2022 11:08:57 -0400
Message-Id: <20220531150857.19727-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531150857.19727-1-dpsmith@apertussolutions.com>
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> # arm
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


