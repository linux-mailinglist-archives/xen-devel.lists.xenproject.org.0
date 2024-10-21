Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4E9A5859
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823021.1237051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjQ-0006cs-0M; Mon, 21 Oct 2024 00:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823021.1237051; Mon, 21 Oct 2024 00:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjP-0006Yo-Qc; Mon, 21 Oct 2024 00:57:11 +0000
Received: by outflank-mailman (input) for mailman id 823021;
 Mon, 21 Oct 2024 00:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gcL-0001i1-G9
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:49:53 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 610f676a-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:49:52 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471615202442.76370585557197;
 Sun, 20 Oct 2024 17:46:55 -0700 (PDT)
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
X-Inumbo-ID: 610f676a-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471617; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CIv9MEArRivr4cwIqGVq5EVSB2bEstnzqvi1WfqcQrGsUejgrvj6f7uAWik6A8hRzzJw1FWtVGXlJOAJBpTNf9wm2OPzc96LeE6n9BpGqZkLngmycDb1gXvcM6Q5lc2n4x1NaNgVHLn6R57qCJnmXWgoy+TCdWRKLt1s8iO5eSY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471617; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g0NVk64TuKi2tR5OnvtS4NnU7f+YLD8Wq1acHX9UIbs=; 
	b=APaGUFCQVJVZ2glPYSsw687cau06o+/I8GDzrNNm8eebuSRMaKu5emPgvNaE9I9lB64nNJCoMJWs5wY+1LdGQTIK3eEi84OunSjtSqu9rYqpU3GQSrdYQBk903iqaFn5A7MClNmKKY/YBqjra0tECpc57ymP50ZtyLmJcYomuHA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471617;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=g0NVk64TuKi2tR5OnvtS4NnU7f+YLD8Wq1acHX9UIbs=;
	b=S4Bnj9nRgJCK1jSlWbAhpSGz6bZZlkvl5zO23KEK6qpHPCC5Lfn8/LC23k+8pnm8
	yHbFZfcSaDvy+oOcNXpyNwwMnCGuUh1a50nRwDhOKuizpUROumKPYbl8YKqCeFg7IeE
	l4LueC69upfXsG1Ah/4QracetxKxQiazHrJJ4DgE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 27/38] x86/boot: convert initial_images to struct boot_module
Date: Sun, 20 Oct 2024 20:46:02 -0400
Message-Id: <20241021004613.18793-28-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The variable initial_images is used for tracking the boot modules passed in by
the boot loader. Convert to a struct boot_module and adjust the code that uses
it accordingly.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- coding style changes
---
 xen/arch/x86/setup.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 254aeb0c5e1b..0f8fb3c572c6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -276,7 +276,7 @@ custom_param("acpi", parse_acpi_param);
 
 static const char *cmdline_cook(const char *p, const char *loader_name);
 
-static const module_t *__initdata initial_images;
+static const struct boot_module *__initdata initial_images;
 
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
@@ -352,8 +352,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = initial_images[i].mod_start;
-        unsigned long end = start + PFN_UP(initial_images[i].mod_end);
+        unsigned long start = initial_images[i].mod->mod_start;
+        unsigned long end = start + PFN_UP(initial_images[i].mod->mod_end);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -369,10 +369,11 @@ void __init discard_initial_images(void)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
+        uint64_t start =
+            (uint64_t)initial_images[i].mod->mod_start << PAGE_SHIFT;
 
         init_domheap_pages(start,
-                           start + PAGE_ALIGN(initial_images[i].mod_end));
+                           start + PAGE_ALIGN(initial_images[i].mod->mod_end));
     }
 
     bi->nr_modules = 0;
@@ -1403,11 +1404,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    /*
-     * The field bi->mods[0].mod points to the first element of the module_t
-     * array.
-     */
-    initial_images = bi->mods[0].mod;
+    initial_images = bi->mods;
 
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
     {
-- 
2.30.2


