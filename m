Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245C49A2A47
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820895.1234612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Tz6-0007Q9-3n; Thu, 17 Oct 2024 17:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820895.1234612; Thu, 17 Oct 2024 17:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Tz6-0007O0-09; Thu, 17 Oct 2024 17:08:24 +0000
Received: by outflank-mailman (input) for mailman id 820895;
 Thu, 17 Oct 2024 17:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TvL-0006TN-Cm
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:04:31 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de6aa70a-8ca9-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:04:29 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184622569551.9933736684571;
 Thu, 17 Oct 2024 10:03:42 -0700 (PDT)
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
X-Inumbo-ID: de6aa70a-8ca9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184625; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JxOPe9KK7rni9b8F2K6sb0JpTMEgtu2VDdjARWYd1Kp30tslpPEQm8P3yMuvFyqO3ovQSvaZ1L5/Ler/EpO49VKusqWouUM1iMZNUO7Dw5arx1yPimgprRJnyxZZRiFGiD7YdkUHpf8NTmKV9D6TajoPMLeBeVdfwpqtjQRU9Hw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184625; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i/MwelbIDlLsytRqJnx56gOPNpJbq/sBz2YfvwIYl4c=; 
	b=GAQSAHJxfulU7UVno+fvmUbI8jcisFo6uaampi1BTROFbdzvYVFVKUAiN6nOl2ATaH1VE+KYxb1Zxg/rACDZZ/ts0MuCOCZ1nzSjZdTf0By70/W4bNGfsbFc8Yi/SkO6GBnDWpR6gdD/bYy591F0n8xqIPaHronuRevRF9OMSJk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184625;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=i/MwelbIDlLsytRqJnx56gOPNpJbq/sBz2YfvwIYl4c=;
	b=qcLTaouKMVsM2G/AnEtCSkWyGecFRTR9kUX8ygvq8O1JsNJjln0u/54rOtKTThsA
	0HEMECXMh0x2+Or1JUYSpuzdI1VnqWw1dd1kDieGylfsDdE5ZOtWcTbsjeW+s59OW7W
	AXcjDtgJ8VmYRh6xpS4M3AlU7IpNZ/JtRPQI0X+A=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 06/44] x86/boot: convert consider_modules to struct boot_module
Date: Thu, 17 Oct 2024 13:02:46 -0400
Message-Id: <20241017170325.3842-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To start transitioning consider_modules() over to struct boot_module, begin
with taking the array of struct boot_modules but use the temporary struct
element mod.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- drop unnecessary type cast
---
 xen/arch/x86/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d8ee5741740a..10934bf31d7f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -629,7 +629,7 @@ static void __init noinline move_xen(void)
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
-    uint64_t s, uint64_t e, uint32_t size, const module_t *mod,
+    uint64_t s, uint64_t e, uint32_t size, const struct boot_module mods[],
     unsigned int nr_mods, unsigned int this_mod)
 {
     unsigned int i;
@@ -639,20 +639,20 @@ static uint64_t __init consider_modules(
 
     for ( i = 0; i < nr_mods ; ++i )
     {
-        uint64_t start = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
-        uint64_t end = start + PAGE_ALIGN(mod[i].mod_end);
+        uint64_t start = pfn_to_paddr(mods[i].mod->mod_start);
+        uint64_t end = start + PAGE_ALIGN(mods[i].mod->mod_end);
 
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
@@ -1428,7 +1428,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules. */
             end = consider_modules(s, e, reloc_size + mask,
-                                   mod, bi->nr_modules, -1);
+                                   bi->mods, bi->nr_modules, -1);
             end &= ~mask;
         }
         else
@@ -1463,7 +1463,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
-            end = consider_modules(s, e, size, mod,
+            end = consider_modules(s, e, size, bi->mods,
                                    bi->nr_modules + relocated, j);
 
             if ( highmem_start && end > highmem_start )
@@ -1490,7 +1490,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         while ( !kexec_crash_area.start )
         {
             /* Don't overlap with modules (or Xen itself). */
-            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
+            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), bi->mods,
                                  bi->nr_modules + relocated, -1);
             if ( s >= e )
                 break;
-- 
2.30.2


