Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21959A2AC1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821055.1234871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBJ-0007Is-Ez; Thu, 17 Oct 2024 17:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821055.1234871; Thu, 17 Oct 2024 17:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBJ-0007Bv-9x; Thu, 17 Oct 2024 17:21:01 +0000
Received: by outflank-mailman (input) for mailman id 821055;
 Thu, 17 Oct 2024 17:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tz2-00014B-6A
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:08:20 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66b991cd-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:08:18 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172918465678522.81224609932019;
 Thu, 17 Oct 2024 10:04:16 -0700 (PDT)
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
X-Inumbo-ID: 66b991cd-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184659; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eJQfjQzV3ePGKVDU/vX+th6KQbjrtVB9sjDQeUGVsjDIFi4di3rClsfJgPbehrTqzz9ebdpK4KpyaUmr1fxVUwwT53IeHcIzP9AfeeqXeGoQC9etWyJ/KMd+ltjqPJmP24qSO9dNJl9y1S2f/TQvoEMcMgqtdOcHF/PwNw0Iu54=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184659; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Rp7RzI1QNTY5hwhage3xG8298106lOX2KeM4idRZunk=; 
	b=Dk6/hSvBUPh+Pertq86eqcZvACCkSta0TQLCxH7pCwLRVLo5HtlrwUM0KSWTe0dk4frrIxb/EonAhgaQ++trEEmrGNGB7OKkhEAfenwdA1z/HKEvLlawEEczn21KAwg8QFmexu7mxKl6rX2/ELwF/j6kPW3FYCaizrrzBCg4HW4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184659;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Rp7RzI1QNTY5hwhage3xG8298106lOX2KeM4idRZunk=;
	b=ai0q7Ip3Elh0GwZq/CZicDNx8l6vfbr4f8leXo+qnk7k+1Ip5MdyjE2yPZ83Qu9B
	+Wy4X8S/7Re51tzqVgcJ+7HujdkFot0pszNkEZ9j9N5mJeDocyqbaKVXHS6Zu2vbwUA
	H2RWSvZATWvk3q9dQy7+HhMg9/NpQ5w5NaTw+3lo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 33/44] x86/boot: convert initial_images to struct boot_module
Date: Thu, 17 Oct 2024 13:03:13 -0400
Message-Id: <20241017170325.3842-34-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
index e6f1208d5807..f5cd7eeb157c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -276,7 +276,7 @@ custom_param("acpi", parse_acpi_param);
 
 static const char *cmdline_cook(const char *p, const char *loader_name);
 
-static const module_t *__initdata initial_images;
+static const struct boot_module *__initdata initial_images;
 
 struct boot_info __initdata xen_boot_info;
 
@@ -335,8 +335,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = initial_images[i].mod_start;
-        unsigned long end = start + PFN_UP(initial_images[i].mod_end);
+        unsigned long start = initial_images[i].mod->mod_start;
+        unsigned long end = start + PFN_UP(initial_images[i].mod->mod_end);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -352,10 +352,11 @@ void __init discard_initial_images(void)
 
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
@@ -1379,11 +1380,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    /*
-     * The field bi->mods[0].mod points to the first element of the module_t
-     * array.
-     */
-    initial_images = bi->mods[0].mod;
+    initial_images = bi->mods;
 
     for ( i = 0; i < bi->nr_modules; i++ )
     {
-- 
2.30.2


