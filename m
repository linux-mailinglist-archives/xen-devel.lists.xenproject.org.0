Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769FC9A583C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822876.1236786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZL-0007dW-5J; Mon, 21 Oct 2024 00:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822876.1236786; Mon, 21 Oct 2024 00:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZL-0007a9-2O; Mon, 21 Oct 2024 00:46:47 +0000
Received: by outflank-mailman (input) for mailman id 822876;
 Mon, 21 Oct 2024 00:46:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gZJ-000738-Lq
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:46:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f120f82e-8f45-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:46:44 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471586110575.2544669844197;
 Sun, 20 Oct 2024 17:46:26 -0700 (PDT)
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
X-Inumbo-ID: f120f82e-8f45-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471587; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jz96BrikdNvb6h+sW+8+QNhXkT6jvzLV4UgMHDxoVjQxpOjOBQ0i21LTZ2YW/Ja4uV0HabLx3G1inbGLGXxg0mzmafHMSuUZ5nC2bPf0NmexJvvxT6/VjXq197H6GqoFMpco1jZ1l8rWWB/fFRY4Jdm4tnjpll8kMhAX8oASiVM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471587; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5BxR907iR5u9/6Q1o/EHkq0aEkes4oDlkRcMr/AbvX4=; 
	b=FLwMYW6bbSr35RkxwEd34DlEHCt2o7cDwPuu+G0gvxroyezK7blnL61mVafWiSojhS+RzRSVNl5zsGhNxoLVlKl/N5EsF7wR99uObp63rzjtFp0/KXanEehk4Yqp+hPEJkXPjKyfdG1ah7NPRE9yFiRcsJwqgLvML6Ghfv8Ykgo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471587;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=5BxR907iR5u9/6Q1o/EHkq0aEkes4oDlkRcMr/AbvX4=;
	b=iFb+ctHZTLWhQhMF92wcvY/sYWmZ+9HBVvgD5c4F4JuA/B39N310cWu2lNnMEEXD
	s6of4wzioysICSnkLrTD/2bE/4u0yh0F2JmZ5bQGtOVpn5Iwq9rNcOVH0wxjij3ys6w
	ECW3ckhZCKVErBZig0aMFg0NibsDqP5/cwlk2XOg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 02/38] x86/boot: convert consider_modules to struct boot_module
Date: Sun, 20 Oct 2024 20:45:37 -0400
Message-Id: <20241021004613.18793-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
index db670258d650..1eafa0a61e0e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -645,7 +645,7 @@ static void __init noinline move_xen(void)
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
-    uint64_t s, uint64_t e, uint32_t size, const module_t *mod,
+    uint64_t s, uint64_t e, uint32_t size, const struct boot_module mods[],
     unsigned int nr_mods, unsigned int this_mod)
 {
     unsigned int i;
@@ -655,20 +655,20 @@ static uint64_t __init consider_modules(
 
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
@@ -1451,7 +1451,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules. */
             end = consider_modules(s, e, reloc_size + mask,
-                                   mod, bi->nr_modules, -1);
+                                   bi->mods, bi->nr_modules, -1);
             end &= ~mask;
         }
         else
@@ -1486,7 +1486,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
-            end = consider_modules(s, e, size, mod,
+            end = consider_modules(s, e, size, bi->mods,
                                    bi->nr_modules + relocated, j);
 
             if ( highmem_start && end > highmem_start )
@@ -1513,7 +1513,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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


