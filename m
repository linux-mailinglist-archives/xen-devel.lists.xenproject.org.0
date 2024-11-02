Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BF99BA1C3
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829624.1244663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I4S-00043p-82; Sat, 02 Nov 2024 17:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829624.1244663; Sat, 02 Nov 2024 17:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I4S-0003yy-1x; Sat, 02 Nov 2024 17:37:56 +0000
Received: by outflank-mailman (input) for mailman id 829624;
 Sat, 02 Nov 2024 17:37:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Hux-0004r4-No
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:28:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d062b535-993f-11ef-99a3-01e77a169b0f;
 Sat, 02 Nov 2024 18:28:04 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568376554254.352253814322;
 Sat, 2 Nov 2024 10:26:16 -0700 (PDT)
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
X-Inumbo-ID: d062b535-993f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQwNjJiNTM1LTk5M2YtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNTY4NDg0LjgwMDUzMiwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568385; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DaE1msTh9OL/UMNeyEU+I+slUVIkmCcBLTOkiP4IeAh0AFi0/le5UTAY2mPxrvmSFKIax7cucpovfwpc6qUvdMAy76Ak6ZYVS3fLy/a5JmP2URQwX7pJVW65yfp0FuiGWoAfxRs3R92xHYz1/89WXYl+YRcK1pSD/cDgUyotk/I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568385; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D+Ero9Cx9cs2ogNCswgWtWOJ14E6rK5H6+adO3A9JUc=; 
	b=cz5B2xs55xJa3cNJI30LvbySktK7yR3NFJn38I5WZq+Z9irgJN+KntUaa/Bc+WxOWl2mbX+4wRLGn7JYfsI2eAGUUzfPii+t1LHFfJ0JhDqA1IXZ1luND/pYufhlxSBZB7otSUDnh2CbPuiMsbY4YRrgcijLpiUym4spH+8Z4Pg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568385;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=D+Ero9Cx9cs2ogNCswgWtWOJ14E6rK5H6+adO3A9JUc=;
	b=ebpNRVEcdLj7MAIUFRuaw3inmi9D37/O6u5vIVXXw/L86ZiXaNzV+opQt23bJGD4
	yrso92wIMRz+DnfIOPyh91WTJnLqBhqk6e4yMQkBlJJ2R0KLb53dEht4VjUnerXcW+O
	YYZoAj58haXpOymqXpqtXjGJjVWfww7ZiayQbX3A=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 12/12] x86/boot: add cmdline to struct boot_domain
Date: Sat,  2 Nov 2024 13:25:51 -0400
Message-Id: <20241102172551.17233-13-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a container for the "cooked" command line for a domain. This provides for
the backing memory to be directly associated with the domain being constructed.
This is done in anticipation that the domain construction path may need to be
invoked multiple times, thus ensuring each instance had a distinct memory
allocation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v7:
- updated commit message to expand on intent and purpose
---
 xen/arch/x86/include/asm/bootdomain.h |  4 ++++
 xen/arch/x86/include/asm/dom0_build.h |  1 +
 xen/arch/x86/pv/dom0_build.c          |  4 ++--
 xen/arch/x86/setup.c                  | 18 ++++++++----------
 4 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 3873f916f854..bc51f04a1df6 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -8,10 +8,14 @@
 #ifndef __XEN_X86_BOOTDOMAIN_H__
 #define __XEN_X86_BOOTDOMAIN_H__
 
+#include <public/xen.h>
+
 struct boot_module;
 struct domain;
 
 struct boot_domain {
+    char cmdline[MAX_GUEST_CMDLINE];
+
     domid_t domid;
 
     struct boot_module *kernel;
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 4a75fb25a801..982bc1fa9e6b 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -4,6 +4,7 @@
 #include <xen/libelf.h>
 #include <xen/sched.h>
 
+#include <asm/bootinfo.h>
 #include <asm/setup.h>
 
 extern unsigned int dom0_memflags;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 28257bf13127..2c84af52de3e 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -960,8 +960,8 @@ static int __init dom0_construct(struct boot_domain *bd)
     }
 
     memset(si->cmd_line, 0, sizeof(si->cmd_line));
-    if ( cmdline != NULL )
-        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
+    if ( cmdline[0] != '\0' )
+        strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line));
 
 #ifdef CONFIG_VIDEO
     if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 7b78bd9c7c8d..9db8a650ecc2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -980,8 +980,6 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
 
 static struct domain *__init create_dom0(struct boot_info *bi)
 {
-    static char __initdata cmdline[MAX_GUEST_CMDLINE];
-
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -1024,16 +1022,16 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( bd->kernel->cmdline_pa || bi->kextra )
     {
         if ( bd->kernel->cmdline_pa )
-            safe_strcpy(cmdline, cmdline_cook(__va(bd->kernel->cmdline_pa),
+            safe_strcpy(bd->cmdline, cmdline_cook(__va(bd->kernel->cmdline_pa),
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
@@ -1041,13 +1039,13 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
 
-        bd->kernel->cmdline_pa = __pa(cmdline);
+        bd->kernel->cmdline_pa = __pa(bd->cmdline);
     }
 
     bd->d = d;
-- 
2.30.2


