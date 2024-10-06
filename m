Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C39921F0
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811431.1224297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZG9-0001VQ-Hn; Sun, 06 Oct 2024 21:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811431.1224297; Sun, 06 Oct 2024 21:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZG9-0001Q6-8w; Sun, 06 Oct 2024 21:57:49 +0000
Received: by outflank-mailman (input) for mailman id 811431;
 Sun, 06 Oct 2024 21:57:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZ9c-0006RM-Oj
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:51:04 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14032359-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:51:03 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 17282514112724.126986125020153;
 Sun, 6 Oct 2024 14:50:11 -0700 (PDT)
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
X-Inumbo-ID: 14032359-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251413; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l+kcipkQHwlLBxkls/w+F07A6/TNidxopflU4/XNpdjLLfIemUDQzJdxXC56L/QZ1IpHnnsYvBNBTCvYQvX1bFxUpLt0+kTHrllOm5CQgvs0nSInWU4awJkYTPt4p2NRGC0CkdRV6S7ftEGt/SP6BMO4+bDiYqeCs/0fAAs27aU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251413; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BE8TyVW42746XaPgeBDvj85Fi23Wy8nFIdm1DUR4nhI=; 
	b=TQUQ1Zh9+7T4eZ1apxvDhqiKVcRwagwqe9Q9aLgN85rY/XMpPirX/QyNKeX64Dmt1quHueWRSeowfV8+LwtI3ApgSTJKldPF6w+Ji5T1xoNW2XHao+7fPTGhOh048fqzwHZZ8KIx7SyZm+P4aqiOwRzGK15oWU78HZNQuYyTwck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251413;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=BE8TyVW42746XaPgeBDvj85Fi23Wy8nFIdm1DUR4nhI=;
	b=ERdnp+ChYfN0FQoigzs12OEgJLEXohNlZFsiZEgqcXjipzCuiWaSEMecjuBbXqKS
	wKgyue6cHU81yvA7jL7SLKxOE2vAsDGD/SPaiW89I+HekUm6uhw1Sa9ba9nFPFM6siZ
	iHp31iEcEBXHyX5pV7Fp8C5VCH/DSKv3zyla8iOc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 06/44] x86/boot: convert consider_modules to struct boot_module
Date: Sun,  6 Oct 2024 17:49:17 -0400
Message-Id: <20241006214956.24339-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To start transitioning consider_modules() over to struct boot_module, begin
with taking the array of struct boot_modules but use the temporary struct
element mod.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 68eb4c848ae8..ba9f110d98c6 100644
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
+        uint64_t start = (uint64_t)pfn_to_paddr(mods[i].mod->mod_start);
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


