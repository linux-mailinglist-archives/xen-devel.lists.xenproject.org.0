Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FA9921EF
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811428.1224290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZG8-0001La-Ps; Sun, 06 Oct 2024 21:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811428.1224290; Sun, 06 Oct 2024 21:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZG8-0001G6-Jg; Sun, 06 Oct 2024 21:57:48 +0000
Received: by outflank-mailman (input) for mailman id 811428;
 Sun, 06 Oct 2024 21:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZAF-00051E-TO
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:51:43 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b57ecc8-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:51:42 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251417197888.0299636437695;
 Sun, 6 Oct 2024 14:50:17 -0700 (PDT)
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
X-Inumbo-ID: 2b57ecc8-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251419; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GB7ur/A9gXUq6rSTAzMhKxVJF6A9DsXJJ5AdLjSQo8OURi5mONX1ZgtDoAN30rLyKp2exHjYKuOWvtpuukY2A7z3QpRXLrW6o1FIQtXwJ8ob1352C2TwK9cAtD5Iv1GEHbn4LpY0yik5oYS+RoKj2MFGTWD6EDYQzXdri8/thJM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251419; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AiMno3h27u/8NtsH+f5BaBaPNWe2g2HvJaNYtgBk2CY=; 
	b=VevxLj/VLygHMlZMlU1AJ2r/9FZ+JGNgYWxkrbFqBCtnBX7msrfZLKgs7LNA6nbYWAjE7dXaFvzi7GkNXI043hy4m5ltiQHiTsAjEymx3OxDlfYPG2oVJzwu6QYh+ce2lhEG2bOxbEP+VXUv9i4nhlHsCqg/phCp4ZNaMDnCxQA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251419;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=AiMno3h27u/8NtsH+f5BaBaPNWe2g2HvJaNYtgBk2CY=;
	b=QykZQC2TMTw0xS7zAsnTr+kV/cTI/WUHGySBVl1kr6GCWFwGDA/vhycqzJhLzt7h
	jJA4CD6YDu1Pr/nZ6ctxBGfWYy3REEJNyQtDKxr2F3tCuVaxiiyWg1NpM+DpB095M22
	Zeg/kjycUuoGFlSZwX1F5CR48eTWfULwIzcgJJLA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 11/44] x86/boot: split bootstrap_map_addr() out of bootstrap_map()
Date: Sun,  6 Oct 2024 17:49:22 -0400
Message-Id: <20241006214956.24339-12-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Andrew Cooper <andrew.cooper3@citrix.com>

Using an interface based on addresses directly, not modules.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/setup.h |  1 +
 xen/arch/x86/setup.c             | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 3d189521189d..213584b05fb2 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -36,6 +36,7 @@ extern struct boot_info xen_boot_info;
 
 unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
+void *bootstrap_map_addr(paddr_t start, paddr_t end);
 void *bootstrap_map(const module_t *mod);
 
 int remove_xen_ranges(struct rangeset *r);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 161415a8e667..1cc7fcba094b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -437,24 +437,22 @@ static void __init normalise_cpu_order(void)
  * Ensure a given physical memory range is present in the bootstrap mappings.
  * Use superpage mappings to ensure that pagetable memory needn't be allocated.
  */
-void *__init bootstrap_map(const module_t *mod)
+void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
 {
     static unsigned long __initdata map_cur = BOOTSTRAP_MAP_BASE;
-    uint64_t start, end, mask = (1L << L2_PAGETABLE_SHIFT) - 1;
+    uint64_t mask = (1L << L2_PAGETABLE_SHIFT) - 1;
     void *ret;
 
     if ( system_state != SYS_STATE_early_boot )
-        return mod ? mfn_to_virt(mod->mod_start) : NULL;
+        return end ? maddr_to_virt(start) : NULL;
 
-    if ( !mod )
+    if ( !end )
     {
         destroy_xen_mappings(BOOTSTRAP_MAP_BASE, BOOTSTRAP_MAP_LIMIT);
         map_cur = BOOTSTRAP_MAP_BASE;
         return NULL;
     }
 
-    start = (uint64_t)mod->mod_start << PAGE_SHIFT;
-    end = start + mod->mod_end;
     if ( start >= end )
         return NULL;
 
@@ -470,6 +468,15 @@ void *__init bootstrap_map(const module_t *mod)
     return ret;
 }
 
+void *__init bootstrap_map(const module_t *mod)
+{
+    if ( !mod )
+        return bootstrap_map_addr(0, 0);
+
+    return bootstrap_map_addr(pfn_to_paddr(mod->mod_start),
+                              pfn_to_paddr(mod->mod_start) + mod->mod_end);
+}
+
 static void __init move_memory(
     uint64_t dst, uint64_t src, unsigned int size)
 {
-- 
2.30.2


