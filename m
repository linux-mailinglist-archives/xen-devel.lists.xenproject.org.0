Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7A7966B93
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786725.1196427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Y5-0005vN-GQ; Fri, 30 Aug 2024 21:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786725.1196427; Fri, 30 Aug 2024 21:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Y5-0005sk-Cr; Fri, 30 Aug 2024 21:52:53 +0000
Received: by outflank-mailman (input) for mailman id 786725;
 Fri, 30 Aug 2024 21:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Y4-0005aM-45
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:52:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 329b11bb-671a-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:52:50 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 17250545032331016.3890116274274;
 Fri, 30 Aug 2024 14:48:23 -0700 (PDT)
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
X-Inumbo-ID: 329b11bb-671a-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054505; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GA7Yp4LFWXcUTCQ+tcxx7puOdH0pa01EM+OSB1scExt/54hyvetQ5OqApsaTg5bhieRGq8CZ0TEH2EqR42b/fkKU4deFvS7a8D7/kKY0YDcnGpp5QWB1fqAwaVrGvyJPwbEbdNOYu0gx1caNmkUjh31mqbfTmMJDnmcTeuYqy5E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054505; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sd7QQyOHQcpE3M4m4u6Ct3Fw13iRggCCs6j9qnmZOMk=; 
	b=f3kuXxbWhnh9K89+FrbWk50c5gQwEw+vXn0kUXi/q5VA2cOUs548oAm7or7+iH6nl+hxLwKQWmVFVWU87+uhxnvKh399OkS/oA7B7aAx0AQsfYZTGGDdXDchqyGILSWZonIb42lnDXEZvGjhpsdRkbmqiwzyw6B1sXkeIEQ4Cc8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054505;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Sd7QQyOHQcpE3M4m4u6Ct3Fw13iRggCCs6j9qnmZOMk=;
	b=bbvsH87qot8P5OwLFLsH9YynUee1DpqXrTjvDagCWBZuBKHREwoSy3evHF+Fehwm
	WcdP0l7LFQzr4f1EX1TA4q/YRh8tW0TQkg4voUpF/6vIBTmNrk8NMKENe8A9HXPVPCY
	p7KZgRCe+XHpDWOXzG/OfJhzNA4hWDhLl/vgqFZ8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 40/44] x86/boot: add cmdline to struct boot_domain
Date: Fri, 30 Aug 2024 17:47:25 -0400
Message-Id: <20240830214730.1621-41-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
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
index 43b588d4d105..2c1aa1475c4e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -951,8 +951,6 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
 
 static struct domain *__init create_dom0(const struct boot_info *bi)
 {
-    static char __initdata cmdline[MAX_GUEST_CMDLINE];
-
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -995,17 +993,17 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
     if ( bd->kernel->cmdline || bi->kextra )
     {
         if ( bd->kernel->cmdline )
-            safe_strcpy(cmdline, cmdline_cook(
+            safe_strcpy(bd->cmdline, cmdline_cook(
                         __va((unsigned long)bd->kernel->cmdline),
                         bi->boot_loader_name));
 
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
@@ -1013,10 +1011,10 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
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
 
@@ -1031,7 +1029,7 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    if ( construct_dom0(d, bd->kernel, bd->ramdisk, cmdline) != 0 )
+    if ( construct_dom0(d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     if ( cpu_has_smap )
-- 
2.30.2


