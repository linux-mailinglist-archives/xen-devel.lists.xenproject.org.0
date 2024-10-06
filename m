Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C786A9921F1
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811434.1224310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZGF-0002R5-Ro; Sun, 06 Oct 2024 21:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811434.1224310; Sun, 06 Oct 2024 21:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZGF-0002MO-Jz; Sun, 06 Oct 2024 21:57:55 +0000
Received: by outflank-mailman (input) for mailman id 811434;
 Sun, 06 Oct 2024 21:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZD4-0007Zk-PS
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:54:38 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9404fcf2-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:54:37 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251443868264.5790216144809;
 Sun, 6 Oct 2024 14:50:43 -0700 (PDT)
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
X-Inumbo-ID: 9404fcf2-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251445; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YjFRi6RSin7RS7URyzfSCUHHkzSAXGNAIvBhq+4Or4YqrRVxOycfoVFRNq3BKrhYyLVo4MlNsBlrzKRlGFzyGpl8ct2UugN2RAsiJ6R2mBFXHt31L6mXHI7iqVSPmwHdNf+YBtNE2+Fy78DWd9LrvxSPGObXu9MOgB9ZHt64Qh8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251445; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3hkZxM5JKY193qyhBp7nRAR8syZAmf01uqr3bX0ldPM=; 
	b=XDmtwOkTJPGnIVDuA1acDUu0BT/5MWFW8n4jhUznqfIGiSZEx0JNOftK7hI0KkeOrVIKFHuecDpWY4qMEC+pnDzh0KM70LW9n6s9tV0Dyup/0Ij7MnWNVEE5ziPjDuhgbTttwNFHOOc6WZHIV4ZGEiG5iBrHWDUATL33c/HnsWo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251445;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=3hkZxM5JKY193qyhBp7nRAR8syZAmf01uqr3bX0ldPM=;
	b=CDdRbygm93UaItfWJV6ST87dwiZxBwGRrW/2tTQAH5J+D9lyHW1xGEcZc9w4Q+7u
	Nb1lA8vaX58bvTFb32cnIX8CwLxBMccLi/3KAW6rYmd34BIwM+TjnvjfP9W4PEpZbVs
	gnSZU58pkDzQdlouA5pnyU/pgE96Z0x17nrVfdME=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 34/44] x86/boot: drop the use of initial_images unit global
Date: Sun,  6 Oct 2024 17:49:45 -0400
Message-Id: <20241006214956.24339-35-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 30a139074833..b3b6e6f38622 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -276,8 +276,6 @@ custom_param("acpi", parse_acpi_param);
 
 static const char *cmdline_cook(const char *p, const char *loader_name);
 
-static const struct boot_module *__initdata initial_images;
-
 struct boot_info __initdata xen_boot_info;
 
 static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
@@ -336,9 +334,9 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = initial_images[i].mod->mod_start;
+        unsigned long start = bi->mods[i].mod->mod_start;
         unsigned long end = start +
-                            PFN_UP(initial_images[i].mod->mod_end);
+                            PFN_UP(bi->mods[i].mod->mod_end);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -355,15 +353,14 @@ void __init discard_initial_images(void)
     for ( i = 0; i < bi->nr_modules; ++i )
     {
         uint64_t start =
-            (uint64_t)initial_images[i].mod->mod_start << PAGE_SHIFT;
+            (uint64_t)bi->mods[i].mod->mod_start << PAGE_SHIFT;
 
         init_domheap_pages(start,
                            start +
-                           PAGE_ALIGN(initial_images[i].mod->mod_end));
+                           PAGE_ALIGN(bi->mods[i].mod->mod_end));
     }
 
     bi->nr_modules = 0;
-    initial_images = NULL;
 }
 
 static void __init init_idle_domain(void)
@@ -1383,8 +1380,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = bi->mods;
-
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
     {
         if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
-- 
2.30.2


