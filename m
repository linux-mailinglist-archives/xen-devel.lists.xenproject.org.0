Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53239921E1
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811396.1224150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFP-0001kJ-N4; Sun, 06 Oct 2024 21:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811396.1224150; Sun, 06 Oct 2024 21:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFP-0001gT-Fz; Sun, 06 Oct 2024 21:57:03 +0000
Received: by outflank-mailman (input) for mailman id 811396;
 Sun, 06 Oct 2024 21:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZAd-00051E-Qz
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:52:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3997bac1-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:52:06 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251420772766.2057968943333;
 Sun, 6 Oct 2024 14:50:20 -0700 (PDT)
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
X-Inumbo-ID: 3997bac1-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251422; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AA3iZP6P+/NUmlrLARfVjAVSfA4n8YTISN1RtKfkhmPGFZfgw1dfU/vc1o/gQQqzPIR6AKHja8lt0YN1Pynje8lV9AxuNf4vfl63bayjF6IlJKuFCAW8G89Gy04C7ipNXzNddISVaG6hwB3bt3BpzJClUEVH3Zu1/8RMoDbGtRk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251422; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V9QgKtPNRLsg8Bm0GHM4LvcFu8fucGZu4abX1YQ8tHQ=; 
	b=GMcYDSMT3wMGi/MRLcETsRy78RyZdQfkBsc/0w1meeY6F7iCCWCZ+fyiNi0ZbrKNpXbX+4awIq7X/wJU0PYG3U1xT3otc3bWaf4xAPpErm43Qf7kzf+vJQLHr4tgmqalcfjF7/cCbpsc8xAYv9hU1YJzI6kc3TGUrmKJpZINWXU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251422;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=V9QgKtPNRLsg8Bm0GHM4LvcFu8fucGZu4abX1YQ8tHQ=;
	b=L5/Z9p0oIL7mN5wsjEH3OoaCUdM6ct9EwaNfjjCh8LEkk/2ryoQMeOoQn+Es+Xeq
	p+7SQ26WwSaB0xokIJVP2oF90xkSINQlpFVbs2u5IYPSJ2S+Clnb9sPiYBqhDcHDMg8
	frBR+IBD2Yf9FTtjOG1u7as1Y+TEvi2D/7RuePvY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 14/44] x86/boot: transition relocation calculations to struct boot_module
Date: Sun,  6 Oct 2024 17:49:25 -0400
Message-Id: <20241006214956.24339-15-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Use struct boot_module fields, start and size, when calculating the relocation
address and size. It also ensures that early_mod references are kept in sync.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f968758048ed..4f540c461b26 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1490,7 +1490,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             struct boot_module *bm = &bi->mods[j];
             unsigned long size;
 
-            size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
+            size = PAGE_ALIGN(bm->headroom + bm->size);
 
             if ( bi->mods[j].flags & BOOTMOD_FLAG_X86_RELOCATED )
                 continue;
@@ -1504,13 +1504,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             if ( s < end &&
                  (bm->headroom ||
-                  ((end - size) >> PAGE_SHIFT) > bm->mod->mod_start) )
+                  paddr_to_pfn(end - size) > paddr_to_pfn(bm->start)) )
             {
-                move_memory(end - size + bm->headroom,
-                            (uint64_t)bm->mod->mod_start << PAGE_SHIFT,
-                            bm->mod->mod_end);
-                bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
-                bm->mod->mod_end += bm->headroom;
+                move_memory(end - size + bm->headroom, bm->start, bm->size);
+                bm->start = (end - size);
+                bm->mod->mod_start = paddr_to_pfn(bm->start);
+                bm->size += bm->headroom;
+                bm->mod->mod_end = bm->size;
                 bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
@@ -1542,11 +1542,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t s = (uint64_t)bi->mods[i].mod->mod_start
-                        << PAGE_SHIFT;
+        uint64_t s = (uint64_t)bi->mods[i].start;
 
         reserve_e820_ram(&boot_e820, s,
-                         s + PAGE_ALIGN(bi->mods[i].mod->mod_end));
+                         s + PAGE_ALIGN(bi->mods[i].size));
     }
 
     if ( !xen_phys_start )
@@ -1624,9 +1623,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < bi->nr_modules; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(
-                                   bi->mods[j].mod->mod_start) +
-                                   bi->mods[j].mod->mod_end;
+                    uint64_t end = bi->mods[j].start +
+                                   bi->mods[j].size;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1700,13 +1698,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        set_pdx_range(bi->mods[i].mod->mod_start,
-                      bi->mods[i].mod->mod_start +
-                      PFN_UP(bi->mods[i].mod->mod_end));
+        set_pdx_range(paddr_to_pfn(bi->mods[i].mod->mod_start),
+                      paddr_to_pfn(bi->mods[i].mod->mod_start) +
+                      PFN_UP(bi->mods[i].size));
         map_pages_to_xen(
-            (unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
-            _mfn(bi->mods[i].mod->mod_start),
-            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
+            (unsigned long)maddr_to_virt(bi->mods[i].start),
+            maddr_to_mfn(bi->mods[i].start),
+            PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
-- 
2.30.2


