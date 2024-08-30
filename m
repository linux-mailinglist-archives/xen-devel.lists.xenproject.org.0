Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48706966BA5
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786760.1196536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bW-0003l2-Dh; Fri, 30 Aug 2024 21:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786760.1196536; Fri, 30 Aug 2024 21:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bW-0003gn-8D; Fri, 30 Aug 2024 21:56:26 +0000
Received: by outflank-mailman (input) for mailman id 786760;
 Fri, 30 Aug 2024 21:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Up-00065G-Iu
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:49:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb685fb0-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:49:30 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054475097108.05435664404672;
 Fri, 30 Aug 2024 14:47:55 -0700 (PDT)
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
X-Inumbo-ID: bb685fb0-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054477; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d6e5Wiun1gTE7j1u305GpLy+PnGIYCDEeqFN7m+gLdij3t0rEtBwcb3OiCVckj8DTOWRO8qK5H3w0yPnohT1XbpZ28Nj2hA+U6Jn1lP85AtWl8JeuzgXR6vXvqwzx3L23fi75b2hWZevYeThQtaJQvfoHmygabe2rM1PsLFA8Z8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054477; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NPlHbwKF+a8HLFZ7J6H7myDoAP2mw8XIrCc9sG0+8Xw=; 
	b=drgHp7d0UZBIxKvtKXmu5vBs1jw/dBMIELB7R0JMq5GXeohFfAp6EVjmTZtGO5ajvoCmaGr0ngBlMMUcR9uiFMwpD3Ob/hMKrwY2XZTe2u+0ABkf6NVu0EeIdyHsbPO899lLcKcDWEFJsPfUGm+W8fF89KDXkM/Q+sFA8Qkf0xw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054477;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=NPlHbwKF+a8HLFZ7J6H7myDoAP2mw8XIrCc9sG0+8Xw=;
	b=ZrHpK9XluX96/QQzpIf4M+PhnWfXDiEKHA0xQyvs2MQ/jR+FbgSPkKfdyw+YExhC
	U49/hNB7GSPsEhI9EdfRNwr5hQjSs9TN7gYC5kKmB357anBhPjZpF0dH40sDduEdarY
	MwRtC/UxlQPO6ASsQzl7jXJGntqeflL2/IYAM4Ek=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 14/44] x86/boot: transition relocation calculations to struct boot_module
Date: Fri, 30 Aug 2024 17:46:59 -0400
Message-Id: <20240830214730.1621-15-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Use struct boot_module fields, start and size, when calculating the relocation
address and size. It also ensures that early_mod references are kept in sync.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 27517d24b2ea..0b6bde9ce7e3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1504,7 +1504,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             struct boot_module *bm = &boot_info->mods[j];
             unsigned long size;
 
-            size = PAGE_ALIGN(bm->headroom + bm->early_mod->mod_end);
+            size = PAGE_ALIGN(bm->headroom + bm->size);
 
             if ( boot_info->mods[j].flags & BOOTMOD_FLAG_X86_RELOCATED )
                 continue;
@@ -1518,13 +1518,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             if ( s < end &&
                  (bm->headroom ||
-                  ((end - size) >> PAGE_SHIFT) > bm->early_mod->mod_start) )
+                  paddr_to_pfn(end - size) > paddr_to_pfn(bm->start)) )
             {
-                move_memory(end - size + bm->headroom,
-                            (uint64_t)bm->early_mod->mod_start << PAGE_SHIFT,
-                            bm->early_mod->mod_end);
-                bm->early_mod->mod_start = (end - size) >> PAGE_SHIFT;
-                bm->early_mod->mod_end += bm->headroom;
+                move_memory(end - size + bm->headroom, bm->start, bm->size);
+                bm->start = (end - size);
+                bm->early_mod->mod_start = paddr_to_pfn(bm->start);
+                bm->size = bm->early_mod->mod_end += bm->headroom;
                 bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
@@ -1556,11 +1555,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        uint64_t s = (uint64_t)boot_info->mods[i].early_mod->mod_start
-                        << PAGE_SHIFT;
+        uint64_t s = (uint64_t)boot_info->mods[i].start;
 
         reserve_e820_ram(&boot_e820, s,
-                         s + PAGE_ALIGN(boot_info->mods[i].early_mod->mod_end));
+                         s + PAGE_ALIGN(boot_info->mods[i].size));
     }
 
     if ( !xen_phys_start )
@@ -1638,9 +1636,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < boot_info->nr_mods; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(
-                                   boot_info->mods[j].early_mod->mod_start) +
-                                   boot_info->mods[j].early_mod->mod_end;
+                    uint64_t end = boot_info->mods[j].start +
+                                   boot_info->mods[j].size;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1714,13 +1711,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        set_pdx_range(boot_info->mods[i].early_mod->mod_start,
-                      boot_info->mods[i].early_mod->mod_start +
+        set_pdx_range(paddr_to_pfn(boot_info->mods[i].start),
+                      paddr_to_pfn(boot_info->mods[i].start) +
                       PFN_UP(boot_info->mods[i].early_mod->mod_end));
         map_pages_to_xen(
-            (unsigned long)mfn_to_virt(boot_info->mods[i].early_mod->mod_start),
-            _mfn(boot_info->mods[i].early_mod->mod_start),
-            PFN_UP(boot_info->mods[i].early_mod->mod_end), PAGE_HYPERVISOR);
+            (unsigned long)maddr_to_virt(boot_info->mods[i].start),
+            maddr_to_mfn(boot_info->mods[i].start),
+            PFN_UP(boot_info->mods[i].size), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
-- 
2.30.2


