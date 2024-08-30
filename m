Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA25D966BB4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786836.1196646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9by-000206-7b; Fri, 30 Aug 2024 21:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786836.1196646; Fri, 30 Aug 2024 21:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9by-0001v6-2K; Fri, 30 Aug 2024 21:56:54 +0000
Received: by outflank-mailman (input) for mailman id 786836;
 Fri, 30 Aug 2024 21:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9UE-00065G-M1
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:48:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a554d6ac-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:48:53 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 172505446971316.97653174204663;
 Fri, 30 Aug 2024 14:47:49 -0700 (PDT)
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
X-Inumbo-ID: a554d6ac-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hHj7CnoyPUwHL2we26yrGRBkLa+C6Tfl+J2xTIeFDxw04Gh5hyGvL8FtkCH0ii1VirKxvnOEd43qMLBka8KNihEdeVAgldD/Vp2yN6/w6EW2O6Tumu/oh7iM9TBaa9q6PqrPzJLE2YydT/ydXLdtkBgT7kkb6Xwyn2PGRzX/PeY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054471; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Rr9hHCtWc2lrRTZc+Cw5XDkXel6MHlg11c0GsYwyIeY=; 
	b=mJKWP48CQM2TVPXSnpmc6D6RvEmbtJbe/V8AePBbOwTgu5+yBMyl7JC6v6KUqFrTyR3/mUwgO9cZnYus0RHlIje0xZ17e5ew5YOCPybBBmmY/Z+XmnliPkkJvJ2J4OEqBLPd3P/xxzGDrcxgPx/SNVpLrlTjpMbedOmUss0+I7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054471;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Rr9hHCtWc2lrRTZc+Cw5XDkXel6MHlg11c0GsYwyIeY=;
	b=DzIWdZhCLOVB5scc2EYji95CnsXAZG5GMStqp6sZ5SQqgiHzPD19Pnf8WqC2dXL6
	VTmNJqTQfYCb+eb+O0/QC3qrfVzo3r4xxpfDntVkWBTBojXyYItS3nU34BtCQxEIbRi
	Ul7nGtap4QYWs/4eM6QZ8KVicBxP8FT9R3YvO00w=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 09/44] x86/boot: split bootstrap_map_addr() out of bootstrap_map()
Date: Fri, 30 Aug 2024 17:46:54 -0400
Message-Id: <20240830214730.1621-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
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
index d75589178b91..15dcb62cb5ac 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -34,6 +34,7 @@ void setup_io_bitmap(struct domain *d);
 
 unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
+void *bootstrap_map_addr(uint64_t start, uint64_t end);
 void *bootstrap_map(const module_t *mod);
 
 int remove_xen_ranges(struct rangeset *r);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 82a4375683d2..d4f557b4c50d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -436,24 +436,22 @@ static void __init normalise_cpu_order(void)
  * Ensure a given physical memory range is present in the bootstrap mappings.
  * Use superpage mappings to ensure that pagetable memory needn't be allocated.
  */
-void *__init bootstrap_map(const module_t *mod)
+void *__init bootstrap_map_addr(uint64_t start, uint64_t end)
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
 
@@ -469,6 +467,15 @@ void *__init bootstrap_map(const module_t *mod)
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


