Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63539A2A89
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820935.1234675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U7M-0003iw-8O; Thu, 17 Oct 2024 17:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820935.1234675; Thu, 17 Oct 2024 17:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U7M-0003gS-5U; Thu, 17 Oct 2024 17:16:56 +0000
Received: by outflank-mailman (input) for mailman id 820935;
 Thu, 17 Oct 2024 17:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TzA-00014B-HW
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:08:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bd16e38-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:08:26 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184658005873.5613662896585;
 Thu, 17 Oct 2024 10:04:18 -0700 (PDT)
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
X-Inumbo-ID: 6bd16e38-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184660; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n7ZYi8u/rh/V7Dw9U4AhWRO/mKjxsLHcvk2bf9fVBZUnfCUuCkptJ9yzyu1VdzWzgU44ApHNdSUeLMwndFoWF4w8STrNUXNP5tIgUjpRsPUV5h3xqLf7X0jjv8vy1GjLGC2d5g4Z4C0NZ+6WC8MWDXNk+suElVcTu707am/nnd4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184660; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JraRp4qDaDWJ2lj1CcSCRxF+QAMscl93p41Cp6mewpw=; 
	b=anJC8yyyrOqRlOC/1FBaHJ6rqFhMr1m84qT2Jy/1vpZuBt5VrI9PqrKei0hXvy+VfxwPyiPtHnig1FlH7IgX7/+ET44C+QkOZWQYQt0pgH3wmFNBruUsAiZ/oxJtc8YOiX8HroIu6z8Z9MjAOE860kQnWTEQVT07+gl04TKXitM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184660;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=JraRp4qDaDWJ2lj1CcSCRxF+QAMscl93p41Cp6mewpw=;
	b=Ap1tYajcF/sRYx7/Ua6dS2DfhYOwNh/9hyXa3+gMfIPBDe0A9HWtIDb4f9TuVY8/
	D4a0iHviwHMpz3h4Wd56ZcB1FpYjQiin12xmSV3itQ1W5v0GxNoWfo1zX6lzD3Xsj98
	+YeheXOzZd6g2Ahif2l3CIrhgUw1TsriaOH0bT1w=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 34/44] x86/boot: drop the use of initial_images unit global
Date: Thu, 17 Oct 2024 13:03:14 -0400
Message-Id: <20241017170325.3842-35-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

---

Changes since v5:
- coding style changes
---
 xen/arch/x86/setup.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f5cd7eeb157c..f8b9c164c1cb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -276,8 +276,6 @@ custom_param("acpi", parse_acpi_param);
 
 static const char *cmdline_cook(const char *p, const char *loader_name);
 
-static const struct boot_module *__initdata initial_images;
-
 struct boot_info __initdata xen_boot_info;
 
 static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
@@ -335,8 +333,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = initial_images[i].mod->mod_start;
-        unsigned long end = start + PFN_UP(initial_images[i].mod->mod_end);
+        unsigned long start = bi->mods[i].mod->mod_start;
+        unsigned long end = start + PFN_UP(bi->mods[i].mod->mod_end);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -353,14 +351,12 @@ void __init discard_initial_images(void)
     for ( i = 0; i < bi->nr_modules; ++i )
     {
         uint64_t start =
-            (uint64_t)initial_images[i].mod->mod_start << PAGE_SHIFT;
+            (uint64_t)bi->mods[i].mod->mod_start << PAGE_SHIFT;
 
-        init_domheap_pages(start,
-                           start + PAGE_ALIGN(initial_images[i].mod->mod_end));
+        init_domheap_pages(start, start + PAGE_ALIGN(bi->mods[i].mod->mod_end));
     }
 
     bi->nr_modules = 0;
-    initial_images = NULL;
 }
 
 static void __init init_idle_domain(void)
@@ -1380,8 +1376,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = bi->mods;
-
     for ( i = 0; i < bi->nr_modules; i++ )
     {
         if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
-- 
2.30.2


