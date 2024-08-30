Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03E966B80
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786670.1196306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Tt-0006jd-1s; Fri, 30 Aug 2024 21:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786670.1196306; Fri, 30 Aug 2024 21:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Ts-0006ex-VB; Fri, 30 Aug 2024 21:48:32 +0000
Received: by outflank-mailman (input) for mailman id 786670;
 Fri, 30 Aug 2024 21:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Tr-00065G-NV
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:48:31 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c23d19-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:48:30 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054466365953.1827755781716;
 Fri, 30 Aug 2024 14:47:46 -0700 (PDT)
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
X-Inumbo-ID: 97c23d19-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054468; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n1vzAdrh/oyymzXFaRv9pOKnwJwtAiTcbY4L6gTtrg/4p6m6n+KMDsrPryMXD1gkFIdQ5LtNdUXOSZbXgH1Pahaq8ObLts0809zhLFn01lUmynhWs33LZ7EpTOEPqOZKm79E1f9iPdL5KLOUKP/uGhxAZA7UqStmpeM578wkoMg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054468; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0gXaC5isg4IrQFsCJP9Fq77RhO29MxC4nrBXRRPDF6A=; 
	b=Krfmu32iuu+u5S+3VHWecVIFHkV/yyapQqzJo6sUO2gTafSnjBR6FwLhjimkCHfWLeWU3pJ9QqxXZZwJna6Lu7vTJHOhSk91BqWsxtFoFnSIOoXAr+nkMGKjfYZ5DecZeJyQ4ssTI+FDY8rfJBifDxqi2hQeR3axKWIqjwm3Ypo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054468;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=0gXaC5isg4IrQFsCJP9Fq77RhO29MxC4nrBXRRPDF6A=;
	b=uppunk61v82ki+dFT/FCqIqRyq9dWDem9hk0pXj+dXLWsp6ezjWIq+I2UskrmvIn
	rHWO5A+QYDLGf7b3dQv9GxPETcA7lXWMtEbFzUCOxSkegebHf69BtdQbYh6E/N+Dzt+
	4gAx0rkCsmgHbg0dSI2SmCqG7EkIycZ0wDJGTENw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 06/44] x86/boot: convert consider_modules to struct boot_module
Date: Fri, 30 Aug 2024 17:46:51 -0400
Message-Id: <20240830214730.1621-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To start transitioning consider_modules() over to struct boot_module, begin
with taking the array of struct boot_modules but use the temporary struct
element early_mod.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 28fdbf4d4c2b..8912956ee7f1 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -632,7 +632,7 @@ static void __init noinline move_xen(void)
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
-    uint64_t s, uint64_t e, uint32_t size, const module_t *mod,
+    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
     unsigned int nr_mods, unsigned int this_mod)
 {
     unsigned int i;
@@ -642,20 +642,20 @@ static uint64_t __init consider_modules(
 
     for ( i = 0; i < nr_mods ; ++i )
     {
-        uint64_t start = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
-        uint64_t end = start + PAGE_ALIGN(mod[i].mod_end);
+        uint64_t start = (uint64_t)mods[i].early_mod->mod_start << PAGE_SHIFT;
+        uint64_t end = start + PAGE_ALIGN(mods[i].early_mod->mod_end);
 
         if ( i == this_mod )
             continue;
 
         if ( s < end && start < e )
         {
-            end = consider_modules(end, e, size, mod + i + 1,
+            end = consider_modules(end, e, size, &mods[i + 1],
                                    nr_mods - i - 1, this_mod - i - 1);
             if ( end )
                 return end;
 
-            return consider_modules(s, start, size, mod + i + 1,
+            return consider_modules(s, start, size, &mods[i + 1],
                                     nr_mods - i - 1, this_mod - i - 1);
         }
     }
@@ -1447,7 +1447,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules. */
             end = consider_modules(s, e, reloc_size + mask,
-                                   mod, boot_info->nr_mods, -1);
+                                   boot_info->mods, boot_info->nr_mods, -1);
             end &= ~mask;
         }
         else
@@ -1482,7 +1482,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
-            end = consider_modules(s, e, size, mod,
+            end = consider_modules(s, e, size, boot_info->mods,
                                    boot_info->nr_mods + relocated, j);
 
             if ( highmem_start && end > highmem_start )
@@ -1509,7 +1509,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         while ( !kexec_crash_area.start )
         {
             /* Don't overlap with modules (or Xen itself). */
-            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
+            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), boot_info->mods,
                                  boot_info->nr_mods + relocated, -1);
             if ( s >= e )
                 break;
-- 
2.30.2


