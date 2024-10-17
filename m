Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DAD9A2A2B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820847.1234492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TwO-0000Mp-U7; Thu, 17 Oct 2024 17:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820847.1234492; Thu, 17 Oct 2024 17:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TwO-0000KC-Pu; Thu, 17 Oct 2024 17:05:36 +0000
Received: by outflank-mailman (input) for mailman id 820847;
 Thu, 17 Oct 2024 17:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TwN-0008TH-PG
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:05:35 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 055c323c-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:05:34 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184631161835.9593205812029;
 Thu, 17 Oct 2024 10:03:51 -0700 (PDT)
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
X-Inumbo-ID: 055c323c-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184633; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G9DjefLvn7Ru+/zbJhgbQf/oWEtG6w9X3bIJZ96hSFmnck49GVckqDLnmuA3682IGUaWsbYegHLO+bfkKQC90YUP+ymIi9P9qqKsgffrTSru886SSD3PbNPYH0LRCIqXT99Mz5lIz4wDwI6XJzRJe7imGhmwrVYtnCVmlzYKs08=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184633; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=buUYqo46akp40axyhMLTCjGqzGXlUDMWgwiiv0Mju9Y=; 
	b=nxMv2aHM6AytCLReXGvPa1qf+Ko0xf7uCwjHEE7Gd75DErgmdUhimnLuA8e9ioYg3R3Eh3X7YK7VMfWlDRWJemXU5fkb2YVpkwlPP5xNGbhMF0vGxjiEhT1/vyhGJcGsj+9653j70KD9ZQsjEaqtC3TkKHTniCK+4xm3HTeU2QY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184633;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=buUYqo46akp40axyhMLTCjGqzGXlUDMWgwiiv0Mju9Y=;
	b=Rt4/mpQfEreseFJGJfA1K+wlAgU0prYIMvig84X4FrsQCFL5W336te2DOKwrS1cD
	n+Gg9EzFSzlzi7s5uLYaJlzCIK5E/VlSKw0YGekg2RAO97mkMxcHIorDzJsDq+TB4K/
	6fOrqw0tCTQhTmKYY4VUZcyEzYJ79B/kC6zErDo8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 13/44] x86/boot: transition relocation calculations to struct boot_module
Date: Thu, 17 Oct 2024 13:02:53 -0400
Message-Id: <20241017170325.3842-14-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Use struct boot_module fields, start and size, when calculating the relocation
address and size. It also ensures that early_mod references are kept in sync.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- removed unnecessary paddr_to_pfn, allowing condition to collapse to one line
- correct a missed conversion from .mod->mod_start to .start
---
 xen/arch/x86/setup.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d51b0b03bc97..44cec48fc877 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1476,7 +1476,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
              * move mod[0], we incorporate this as extra space at the start.
              */
             struct boot_module *bm = &bi->mods[j];
-            unsigned long size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
+            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
 
             if ( bi->mods[j].flags & BOOTMOD_FLAG_X86_RELOCATED )
                 continue;
@@ -1488,15 +1488,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
                 bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
@@ -1528,11 +1526,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1610,9 +1607,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1686,12 +1682,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        set_pdx_range(bi->mods[i].mod->mod_start,
-                      bi->mods[i].mod->mod_start +
-                      PFN_UP(bi->mods[i].mod->mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
-            _mfn(bi->mods[i].mod->mod_start),
-            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
+        set_pdx_range(paddr_to_pfn(bi->mods[i].start),
+                      paddr_to_pfn(bi->mods[i].start) +
+                      PFN_UP(bi->mods[i].size));
+        map_pages_to_xen((unsigned long)maddr_to_virt(bi->mods[i].start),
+            maddr_to_mfn(bi->mods[i].start),
+            PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
-- 
2.30.2


