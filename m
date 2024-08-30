Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE3966BB1
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786799.1196617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bn-0007nc-3A; Fri, 30 Aug 2024 21:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786799.1196617; Fri, 30 Aug 2024 21:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bm-0007UK-K8; Fri, 30 Aug 2024 21:56:42 +0000
Received: by outflank-mailman (input) for mailman id 786799;
 Fri, 30 Aug 2024 21:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9XU-0000Zf-OQ
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:52:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dadde6a-671a-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:52:15 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054498973975.9857328919481;
 Fri, 30 Aug 2024 14:48:18 -0700 (PDT)
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
X-Inumbo-ID: 1dadde6a-671a-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054500; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GDSKvUqHJ5BLAS627Did2xnWccmZLTtAIspbKcJn4SGe+PXR7jf2bbK4RBHkXgpJyXMoXgbW+AcpY8RE4NjMdMt+h7Z6mVNP8nu7ZQjSfY0883AJlZaXBARkIuxBJSo35yuf7NxczM08AhMjwtPp/bNdbAQG8pK30GuB5Sstszk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054500; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3IESuTbSEXt1kpS4QxXRhBwnK5tj42QFRgJSLR4gL7g=; 
	b=AWuOdAeM3rEUAZclJJdARbz6aWQFvv4+gbaGqZ6ZV6q5e3kqzSURm7l6Z175lOkRgYF9U/szQc/TPZ+oKE5jErAV5wLzfpWFF41NtY1pEBiiwZKblJim9nR/keQReqgoqt7OjcFL04XAwaRixaQvHtmW2i80o3ZW0zzbfitd0Dc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054500;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=3IESuTbSEXt1kpS4QxXRhBwnK5tj42QFRgJSLR4gL7g=;
	b=brTGisH6Dp8rEw9sOTjel49uha73GTWa+U+PshwLRspU68ej6q2ytrr5AMqt2SNZ
	Hy4OXwg5ZRCE1oPWC9SljIAjBbZ2C1wUTjsTGR3VmwOg7KFP32Ci3swK0uHJzadS7XA
	orHHrnnbRu4jgznCPGNPv9vWNJzbmk8N3P8wOur8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 36/44] x86/boot: remove remaining early_mod references
Date: Fri, 30 Aug 2024 17:47:21 -0400
Message-Id: <20240830214730.1621-37-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Any direct usages of struct mod have been transitioned, remove the remaining
references to early_mod fields.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 81610405a53c..46f6bf82fe63 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -336,9 +336,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < boot_info->nr_mods; ++i )
     {
-        unsigned long start = boot_info->mods[i].early_mod->mod_start;
-        unsigned long end = start +
-                            PFN_UP(boot_info->mods[i].early_mod->mod_end);
+        unsigned long start = boot_info->mods[i].start;
+        unsigned long end = start + PFN_UP(boot_info->mods[i].size);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -665,8 +664,8 @@ static uint64_t __init consider_modules(
 
     for ( i = 0; i < nr_mods ; ++i )
     {
-        uint64_t start = (uint64_t)mods[i].early_mod->mod_start << PAGE_SHIFT;
-        uint64_t end = start + PAGE_ALIGN(mods[i].early_mod->mod_end);
+        uint64_t start = (uint64_t)mods[i].start;
+        uint64_t end = start + PAGE_ALIGN(mods[i].size);
 
         if ( i == this_mod )
             continue;
@@ -1397,10 +1396,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods; i++ )
     {
-        if ( boot_info->mods[i].early_mod->mod_start & (PAGE_SIZE - 1) )
+        if ( boot_info->mods[i].start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
-        boot_info->mods[i].early_mod->mod_end -= boot_info->mods[i].early_mod->mod_start;
-        boot_info->mods[i].early_mod->mod_start >>= PAGE_SHIFT;
     }
 
     /*
@@ -1419,15 +1416,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        boot_info->mods[idx].start = boot_info->mods[idx].early_mod->mod_start
-                                   = virt_to_mfn(_stext);
-        boot_info->mods[idx].size = boot_info->mods[idx].early_mod->mod_end
-                                  = __2M_rwdata_end - _stext;
+        boot_info->mods[idx].start = virt_to_maddr(_stext);
+        boot_info->mods[idx].size = __2M_rwdata_end - _stext;
     }
 
     boot_info->mods[0].headroom = bzimage_headroom(
-                        bootstrap_map(boot_info->mods[0].early_mod),
-                        boot_info->mods[0].early_mod->mod_end);
+                        bootstrap_map_bm(&boot_info->mods[0]),
+                        boot_info->mods[0].size);
     bootstrap_map(NULL);
 
 #ifndef highmem_start
@@ -1533,8 +1528,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             {
                 move_memory(end - size + bm->headroom, bm->start, bm->size);
                 bm->start = (end - size);
-                bm->early_mod->mod_start = paddr_to_pfn(bm->start);
-                bm->size = bm->early_mod->mod_end += bm->headroom;
+                bm->size += bm->headroom;
                 bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
@@ -1724,7 +1718,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         set_pdx_range(paddr_to_pfn(boot_info->mods[i].start),
                       paddr_to_pfn(boot_info->mods[i].start) +
-                      PFN_UP(boot_info->mods[i].early_mod->mod_end));
+                      PFN_UP(boot_info->mods[i].size));
         map_pages_to_xen(
             (unsigned long)maddr_to_virt(boot_info->mods[i].start),
             maddr_to_mfn(boot_info->mods[i].start),
-- 
2.30.2


