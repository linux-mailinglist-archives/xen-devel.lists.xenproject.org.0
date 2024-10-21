Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064079A5863
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823043.1237141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjj-00027P-DD; Mon, 21 Oct 2024 00:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823043.1237141; Mon, 21 Oct 2024 00:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjj-0001vF-7R; Mon, 21 Oct 2024 00:57:31 +0000
Received: by outflank-mailman (input) for mailman id 823043;
 Mon, 21 Oct 2024 00:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2ga6-000738-Ow
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:47:34 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e7738f3-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:47:33 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471594102634.8207739049702;
 Sun, 20 Oct 2024 17:46:34 -0700 (PDT)
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
X-Inumbo-ID: 0e7738f3-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471595; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DwBCWLzNDovqZO5A9SXMghcH2KD50zs29+J6GUIcLtpoCvmPaS1zrNs85gIQEX9BiTBElkSayoF3xl7ABzdrskKCHsDOCsc/6Hy4N6VRSCIuWkrJo+xJRfVsla12uuB7MTseHX4p+T7kCV5uGK4t4I7pxLN5zmJ4N9hcgvHNyrg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471595; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gBcmVTmdjlVx1YSjoPePx3/LQoLpGu8yyKS5g8B8j3Q=; 
	b=jyX2LyLDGO46yhvd0aPQxMj7fyBiJRf57HKzlL1nylqHBcBixsG49NhgY9e4Y1X4osqdJWicA7BrekyH4+DE5YsSilXZQJ4ECwX5DpV195SLKte3nMwRoD4SnhDeNfnyVipe+VDr2Bps9KD7pQ4zZ/e5ceYqnADpJd88sMSBiRk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471595;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=gBcmVTmdjlVx1YSjoPePx3/LQoLpGu8yyKS5g8B8j3Q=;
	b=HRxnN92+I8POhxf1RYKBqGlJk64RR2HEYD1BDj4K2x44SzNZObo6HwVYTIrH6VGy
	IzcsEDOiqKtQ2S33Z7eNRDIAf+mapElmYN4c1E4FXL+IfOVWdMsVuiCQv3JU29CuhMC
	QalrGqlJUQZRb293r7/mGRMUioJXCAiGQdzd88ko=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 09/38] x86/boot: transition relocation calculations to struct boot_module
Date: Sun, 20 Oct 2024 20:45:44 -0400
Message-Id: <20241021004613.18793-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Use struct boot_module fields, start and size, when calculating the relocation
address and size. It also ensures that early_mod references are kept in sync.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v6:
- introduce local s and l refs for start and size, shortening the lines while
  correcting the indentation style

Changes since v5:
- removed unnecessary paddr_to_pfn, allowing condition to collapse to one line
- correct a missed conversion from .mod->mod_start to .start
---
 xen/arch/x86/setup.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4e5d4055e7dd..b02391b887b1 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1507,7 +1507,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
              * move mod[0], we incorporate this as extra space at the start.
              */
             struct boot_module *bm = &bi->mods[j];
-            unsigned long size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
+            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
 
             if ( bm->relocated )
                 continue;
@@ -1519,15 +1519,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             if ( highmem_start && end > highmem_start )
                 continue;
 
-            if ( s < end &&
-                 (bm->headroom ||
-                  ((end - size) >> PAGE_SHIFT) > bm->mod->mod_start) )
+            if ( s < end && (bm->headroom || (end - size) > bm->start) )
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
                 bm->relocated = true;
             }
         }
@@ -1558,10 +1556,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t s = (uint64_t)bi->mods[i].mod->mod_start << PAGE_SHIFT;
+        uint64_t s = bi->mods[i].start;
 
-        reserve_e820_ram(&boot_e820, s,
-                         s + PAGE_ALIGN(bi->mods[i].mod->mod_end));
+        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(bi->mods[i].size));
     }
 
     if ( !xen_phys_start )
@@ -1639,8 +1636,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < bi->nr_modules; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(bi->mods[j].mod->mod_start) +
-                                   bi->mods[j].mod->mod_end;
+                    uint64_t end = bi->mods[j].start + bi->mods[j].size;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1714,12 +1710,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        set_pdx_range(bi->mods[i].mod->mod_start,
-                      bi->mods[i].mod->mod_start +
-                          PFN_UP(bi->mods[i].mod->mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
-                         _mfn(bi->mods[i].mod->mod_start),
-                         PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
+        unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
+        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s) + PFN_UP(l));
+        map_pages_to_xen((unsigned long)maddr_to_virt(s), maddr_to_mfn(s),
+                         PFN_UP(l), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
-- 
2.30.2


