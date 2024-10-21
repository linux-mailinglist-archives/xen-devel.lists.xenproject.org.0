Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F579A584C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822937.1236925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gdG-0007jF-1H; Mon, 21 Oct 2024 00:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822937.1236925; Mon, 21 Oct 2024 00:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gdF-0007fP-UO; Mon, 21 Oct 2024 00:50:49 +0000
Received: by outflank-mailman (input) for mailman id 822937;
 Mon, 21 Oct 2024 00:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gdE-0006SZ-EW
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:50:48 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 813cac43-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:50:46 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471623186522.1233549769001;
 Sun, 20 Oct 2024 17:47:03 -0700 (PDT)
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
X-Inumbo-ID: 813cac43-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471625; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HqxM3dqdeB0km8RbD03cNlgcNFhccTKsB3/cwgbgufplgTrAjeFLwM7zuLG7IwHraDZRbTpAG7qCrP5LEU0m6uxyiNRL1QKyQmNncwkN+V+Y1BniHqMeoCuGlR5urTxiKmZezHgQH/00B7GnHBlq14lhqiPVc/BT0EBNgvJMdcg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471625; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UX88o1+TSwX0OSFHrl/WAKdIoJCte8538NgcDozE6gA=; 
	b=TyFlmEAIJGaeMFUxU+j1jKotorVNlZm8Bi0WySImX/t3XgX9VAdjoUEcjHwI+5jt2o6Rt6a20r+oSt5ZPCd4LtrPn+FvhoC4aXDp25XVq8lctsl8++XZIJKLfRoYdA/6HDt8wOzpSkQzA/biTwA73h5lKyDMoU2E1x6h1eRULgY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471625;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=UX88o1+TSwX0OSFHrl/WAKdIoJCte8538NgcDozE6gA=;
	b=IKzMOY38vu0RPRknNzhv2Ov7+2JGcL0+KdOkbx69xbdhgs2IrXZtSy8XL4qzfN9A
	DxmmheJFF9EKTrTPXItg3PBjFbJKGeyYXa3nacO7bHIhaIBl2EP0HEZB/JfkD2wUSFh
	7eXcKMW+czxF2vwm6UlVC2iPIXPyazeGDHPGPg4E=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 34/38] x86/boot: add cmdline to struct boot_domain
Date: Sun, 20 Oct 2024 20:46:09 -0400
Message-Id: <20241021004613.18793-35-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a container for the "cooked" command line for a domain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootdomain.h |  4 ++++
 xen/arch/x86/setup.c                  | 18 ++++++++----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index d6264d554dba..00f7d9267965 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -8,9 +8,13 @@
 #ifndef __XEN_X86_BOOTDOMAIN_H__
 #define __XEN_X86_BOOTDOMAIN_H__
 
+#include <public/xen.h>
+
 struct boot_module;
 
 struct boot_domain {
+    char cmdline[MAX_GUEST_CMDLINE];
+
     domid_t domid;
 
     struct boot_module *kernel;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e6756d0ad18d..47b705097dd3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -962,8 +962,6 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
 
 static struct domain *__init create_dom0(struct boot_info *bi)
 {
-    static char __initdata cmdline[MAX_GUEST_CMDLINE];
-
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -1006,16 +1004,16 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( bd->kernel->cmdline || bi->kextra )
     {
         if ( bd->kernel->cmdline )
-            safe_strcpy(cmdline, cmdline_cook(__va(bd->kernel->cmdline),
+            safe_strcpy(bd->cmdline, cmdline_cook(__va(bd->kernel->cmdline),
                         bi->loader));
 
         if ( bi->kextra )
             /* kextra always includes exactly one leading space. */
-            safe_strcat(cmdline, bi->kextra);
+            safe_strcat(bd->cmdline, bi->kextra);
 
         /* Append any extra parameters. */
-        if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
-            safe_strcat(cmdline, " noapic");
+        if ( skip_ioapic_setup && !strstr(bd->cmdline, "noapic") )
+            safe_strcat(bd->cmdline, " noapic");
 
         if ( (strlen(acpi_param) == 0) && acpi_disabled )
         {
@@ -1023,14 +1021,14 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             safe_strcpy(acpi_param, "off");
         }
 
-        if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
+        if ( (strlen(acpi_param) != 0) && !strstr(bd->cmdline, "acpi=") )
         {
-            safe_strcat(cmdline, " acpi=");
-            safe_strcat(cmdline, acpi_param);
+            safe_strcat(bd->cmdline, " acpi=");
+            safe_strcat(bd->cmdline, acpi_param);
         }
     }
 
-    if ( construct_dom0(d, bd->kernel, bd->ramdisk, cmdline) != 0 )
+    if ( construct_dom0(d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     return d;
-- 
2.30.2


