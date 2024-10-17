Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FAD9A2A87
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820931.1234664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U77-0003GW-0k; Thu, 17 Oct 2024 17:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820931.1234664; Thu, 17 Oct 2024 17:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U76-0003El-UF; Thu, 17 Oct 2024 17:16:40 +0000
Received: by outflank-mailman (input) for mailman id 820931;
 Thu, 17 Oct 2024 17:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TzR-0008TH-14
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:08:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 764fdd61-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:08:44 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184660412458.4759663546213;
 Thu, 17 Oct 2024 10:04:20 -0700 (PDT)
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
X-Inumbo-ID: 764fdd61-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184662; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ICoRWKfFh0fwzoJ4RKp+H6tPLezHb7U0FjEexjHQMGfl5abUMQGUcC2HY+M4Q2ZryiXBOQ/I4e8k9uzcgPYvAMW4hQhE9etbli1uZFqUvZrqla/wstbhT74RhD6lJuV9wPSwSwdq2q8GndMFJtt7EQSEcnDnxw0Qrk5gmrcx7JM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184662; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yCWAwbuasnt6b9Yd1Y7i2kLi7iLwBuIBFqAlz4Zq4CE=; 
	b=GyZCqXV2sEq9lDb9hy7MIOC+4ClfXxIZZ6HuY54xuuYiOVx8f7hhFIyX0utvAYLP7XXhaAqpqTqzDxyoa50OCsZGX1xz4i1+gKf/8UGg0jnoP5ByyAgI6nrg1cQnDSMw1kFUNZpdL9HOdz4Lxna33FtBemHT6Ilb9tHeXKQRVBQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184662;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=yCWAwbuasnt6b9Yd1Y7i2kLi7iLwBuIBFqAlz4Zq4CE=;
	b=GuqVYQ57RFIx63UqbWBa/o9oOsSAbZ3TtsQyhYI50nlocZZwUneOZG4BQfpLe5d+
	DTvEIN/YFqdhwENjpg4xc1cDS+qWtm9pyLrpln/Gg+6R6vV3WL394bU3anRMfcN8xEh
	F9iKhXuErl9N27B0l025V6K0W+Fceu8sOrjPhlMw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 36/44] x86/boot: remove remaining module_t references
Date: Thu, 17 Oct 2024 13:03:16 -0400
Message-Id: <20241017170325.3842-37-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Any direct usages of module_t have been transitioned, remove the remaining
references to the mod field. This also removes any external use of
bootstrap_map(), dropping from setup.h and making it static.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- commit message rewrite
- coding style change
- remove export of bootstrap_map()
---
 xen/arch/x86/include/asm/setup.h |  1 -
 xen/arch/x86/setup.c             | 27 +++++++++------------------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 72d183e8a4de..f7958b56eab6 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -35,7 +35,6 @@ extern struct boot_info xen_boot_info;
 
 unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
-void *bootstrap_map(const module_t *mod);
 void *bootstrap_map_bm(const struct boot_module *bm);
 
 int remove_xen_ranges(struct rangeset *r);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4d53292aa444..5ae82f3abcb5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -333,8 +333,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = bi->mods[i].mod->mod_start;
-        unsigned long end = start + PFN_UP(bi->mods[i].mod->mod_end);
+        unsigned long start = bi->mods[i].start;
+        unsigned long end = start + PFN_UP(bi->mods[i].size);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -471,7 +471,7 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
     return ret;
 }
 
-void *__init bootstrap_map(const module_t *mod)
+static void *__init bootstrap_map(const module_t *mod)
 {
     if ( !mod )
         return bootstrap_map_addr(0, 0);
@@ -661,8 +661,8 @@ static uint64_t __init consider_modules(
 
     for ( i = 0; i < nr_mods ; ++i )
     {
-        uint64_t start = pfn_to_paddr(mods[i].mod->mod_start);
-        uint64_t end = start + PAGE_ALIGN(mods[i].mod->mod_end);
+        uint64_t start = (uint64_t)mods[i].start;
+        uint64_t end = start + PAGE_ALIGN(mods[i].size);
 
         if ( i == this_mod )
             continue;
@@ -1377,10 +1377,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < bi->nr_modules; i++ )
     {
-        if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
+        if ( bi->mods[i].start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
-        bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
-        bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
     }
 
     /*
@@ -1401,16 +1399,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          */
         bi->mods[xen].start = virt_to_maddr(_stext);
         bi->mods[xen].size = __2M_rwdata_end - _stext;
-
-        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
-        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
     }
 
-    bi->mods[0].headroom =
-        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
-                         bi->mods[0].mod->mod_end);
-
-    bootstrap_map(NULL);
+    bi->mods[0].headroom = bzimage_headroom(
+        bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
+    bootstrap_map_bm(NULL);
 
 #ifndef highmem_start
     /* Don't allow split below 4Gb. */
@@ -1511,9 +1504,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             {
                 move_memory(end - size + bm->headroom, bm->start, bm->size);
                 bm->start = (end - size);
-                bm->mod->mod_start = paddr_to_pfn(bm->start);
                 bm->size += bm->headroom;
-                bm->mod->mod_end = bm->size;
                 bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
-- 
2.30.2


