Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37439A5861
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823041.1237134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gji-0001vl-O9; Mon, 21 Oct 2024 00:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823041.1237134; Mon, 21 Oct 2024 00:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gji-0001pu-Jl; Mon, 21 Oct 2024 00:57:30 +0000
Received: by outflank-mailman (input) for mailman id 823041;
 Mon, 21 Oct 2024 00:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gcS-0001i1-9C
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:50:00 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6522d4f6-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:49:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471616342247.8943247367;
 Sun, 20 Oct 2024 17:46:56 -0700 (PDT)
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
X-Inumbo-ID: 6522d4f6-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471618; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fv1tyRxEi/bmv8ISik3CGJTEMws3IwYpieAIPAehIm0qomzABxCtPLyzWKp35V22ptyguIXFyU1nY4DId8tge14euLcyLM/sNkYS+eTShnQbtDPlYsnBu9mXkP7AKgHOz82hEJ2h9DSRzNmsQeDEJEXX++5BFmbQY1hF5vVkwRA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471618; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4ag7BDYJg0dD1MtHECzU1bM5RUJR5RzORSBjMhAVv1w=; 
	b=ZuSiiyzG3fdtSHntSZ2ZXQ0JCKmEmjkcNfSWAn866GehqOYwbFKcguMzqadb67+r2qRoft9lRfMTdpw6u7NchdcEPq8z2n+xZYgyvTA/rExfH7bmDcY/IkGGaH5YHShIdFtALq+l8/vZdV3gXBmppRpn92KGhEYcxkFM8C1h04E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471618;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=4ag7BDYJg0dD1MtHECzU1bM5RUJR5RzORSBjMhAVv1w=;
	b=qrosCpFNUEl73UQKhT5m7P6zLtUVfdIaDflloSBb0piuDWi1qcBtURdNJAm5A1vd
	ErsfO4PakwSy0IIiGN4a9B8fUT3amFzhGIIXhrsuztkjqd7N8uTeiUhgLmdQ3+dIv+R
	xysEpEr37/EdW/QUGzPxiYAip0kc9yWR+trlWo9U=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 28/38] x86/boot: drop the use of initial_images unit global
Date: Sun, 20 Oct 2024 20:46:03 -0400
Message-Id: <20241021004613.18793-29-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
index 0f8fb3c572c6..87b118cdcf1e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -276,8 +276,6 @@ custom_param("acpi", parse_acpi_param);
 
 static const char *cmdline_cook(const char *p, const char *loader_name);
 
-static const struct boot_module *__initdata initial_images;
-
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
@@ -352,8 +350,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = initial_images[i].mod->mod_start;
-        unsigned long end = start + PFN_UP(initial_images[i].mod->mod_end);
+        unsigned long start = bi->mods[i].mod->mod_start;
+        unsigned long end = start + PFN_UP(bi->mods[i].mod->mod_end);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -370,14 +368,12 @@ void __init discard_initial_images(void)
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
@@ -1404,8 +1400,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = bi->mods;
-
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
     {
         if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
-- 
2.30.2


