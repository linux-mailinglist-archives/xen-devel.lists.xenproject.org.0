Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5799A2ABF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821058.1234886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBN-0007uJ-Q0; Thu, 17 Oct 2024 17:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821058.1234886; Thu, 17 Oct 2024 17:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBN-0007rs-Hy; Thu, 17 Oct 2024 17:21:05 +0000
Received: by outflank-mailman (input) for mailman id 821058;
 Thu, 17 Oct 2024 17:21:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tzs-0008TH-3K
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:09:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86559b7f-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:09:11 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184665301732.0723237960185;
 Thu, 17 Oct 2024 10:04:25 -0700 (PDT)
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
X-Inumbo-ID: 86559b7f-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184668; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VMQ+bGVq9sllLGMYOT9NujBbHIYd1PyHiSqvZcsqfSqi3fbdcyF8uCB4UffqLq+rttutct2vQuff8Cm68oMs2A0PiIKPgh63dCK6kg8db51xA2lfu2XXsImLkSSQZUayMnKGYaNfUqE2bXaPNI9KAh9O4ClgvAQSnduUy9mX2TQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184668; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M5ZqTV3hdrjp9T+eS9L5DEYe6kUmW2KTxCnzOajAfpE=; 
	b=cJV/c4hN5XBjioZluQlAfs8pcUWameU1dIIU+vfl/bPdsrP5ouvEGQnbprqmny4isWbTZuxsAxP9OO4G/ZbP+HUkEiFZDR/N4zGq/bURDX51P6zE04PQYZ3TuVG7x2sQeWtjeRyvWa1xorLgGh59638FvzA8aowzkzml9NciV+4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184668;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=M5ZqTV3hdrjp9T+eS9L5DEYe6kUmW2KTxCnzOajAfpE=;
	b=vWM3I32nrj0Q9VLOHMOj77lAL0+AxCLKzgAmv40s/POtYaQXn7hPJOkvfEVDnFci
	ZXLo4KHTW97dvYUxoRO+gbdemQMHe8hA47+yxzwOn+xJOYDYZwTPqRsEcPD+1Zk2yJN
	4iqmuf1VrDGhJKkZ8qq/WeBp/1Ut2e5a0U0qiMdc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 40/44] x86/boot: add cmdline to struct boot_domain
Date: Thu, 17 Oct 2024 13:03:20 -0400
Message-Id: <20241017170325.3842-41-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
index e74526e20b5b..1aa063facfce 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -946,8 +946,6 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
 
 static struct domain *__init create_dom0(struct boot_info *bi)
 {
-    static char __initdata cmdline[MAX_GUEST_CMDLINE];
-
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -990,16 +988,16 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
@@ -1007,14 +1005,14 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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


