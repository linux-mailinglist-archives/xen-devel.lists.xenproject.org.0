Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1989921EA
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811416.1224246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFt-00074V-0T; Sun, 06 Oct 2024 21:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811416.1224246; Sun, 06 Oct 2024 21:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFs-0006tS-Qz; Sun, 06 Oct 2024 21:57:32 +0000
Received: by outflank-mailman (input) for mailman id 811416;
 Sun, 06 Oct 2024 21:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZCx-0007Zk-N8
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:54:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fca659b-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:54:30 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251442732849.6483430442723;
 Sun, 6 Oct 2024 14:50:42 -0700 (PDT)
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
X-Inumbo-ID: 8fca659b-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251444; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UA0l215/6O/n3czwu2u4fUwznFePhivW8NOOszpzyp4vrhUg86OtZumlLWWz6MzCrR+yZhjHdWc8A+Tpfr1fvLimCrfdjeqrkXwJKck6r3/IiU6Th7s6WxR8kAH6nULeY7UOQxWq04X70a1OOIGmE7KrrOge6c82iUKgVjfryHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251444; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lFv35bSZ+DTHV5Gr3NY0x1keGRZxgvnnRPUaSaXb4uA=; 
	b=IHNicosX7CZxHz6jj1IcGGLGyY1mZ+5NyFsMxI2yFdrCxhcMAaqPUW1kbx3ItDc8Vdi5fpSAMRZEEJ/dBgiTtQ6MHe6/YnX5miHRbbSfp5habcBDwZLGep52CBX/UU4ju/3lmrj43RyHU+X/DDKSnwekM/B7PZ+5oark8SALcLY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251444;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=lFv35bSZ+DTHV5Gr3NY0x1keGRZxgvnnRPUaSaXb4uA=;
	b=RjG7c1OpcwWYakPT+LpzpGsbDcH1m1JUpb+dMY+37++R+XNTJ8NJTCmKPvW+Ntgh
	J1D77WAqkdq/lF/GFcAbhfCX8BxKjJHEeghnWiAY2PKDDs0PvJaf8gx+zNDuFAiT/i6
	i3oV4jccSgD/OAWvQtmFjJp7GZI3J0m05Gqo+ehI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 33/44] x86/boot: convert initial_images to struct boot_module
Date: Sun,  6 Oct 2024 17:49:44 -0400
Message-Id: <20241006214956.24339-34-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The variable initial_images is used for tracking the boot modules passed in by
the boot loader. Convert to a struct boot_module and adjust the code that uses
it accordingly.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d5916e85f68e..30a139074833 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -276,7 +276,7 @@ custom_param("acpi", parse_acpi_param);
 
 static const char *cmdline_cook(const char *p, const char *loader_name);
 
-static const module_t *__initdata initial_images;
+static const struct boot_module *__initdata initial_images;
 
 struct boot_info __initdata xen_boot_info;
 
@@ -336,8 +336,9 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = initial_images[i].mod_start;
-        unsigned long end = start + PFN_UP(initial_images[i].mod_end);
+        unsigned long start = initial_images[i].mod->mod_start;
+        unsigned long end = start +
+                            PFN_UP(initial_images[i].mod->mod_end);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -353,10 +354,12 @@ void __init discard_initial_images(void)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
+        uint64_t start =
+            (uint64_t)initial_images[i].mod->mod_start << PAGE_SHIFT;
 
         init_domheap_pages(start,
-                           start + PAGE_ALIGN(initial_images[i].mod_end));
+                           start +
+                           PAGE_ALIGN(initial_images[i].mod->mod_end));
     }
 
     bi->nr_modules = 0;
@@ -1380,7 +1383,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = bi->mods[0].mod;
+    initial_images = bi->mods;
 
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
     {
-- 
2.30.2


