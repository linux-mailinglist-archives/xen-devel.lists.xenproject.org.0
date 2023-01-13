Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F35668B56
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476511.738795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdk-0000zW-G6; Fri, 13 Jan 2023 05:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476511.738795; Fri, 13 Jan 2023 05:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdk-0000w2-Bh; Fri, 13 Jan 2023 05:30:08 +0000
Received: by outflank-mailman (input) for mailman id 476511;
 Fri, 13 Jan 2023 05:30:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdi-0005sJ-MC
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5610a0b4-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:30:05 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 835E5FEC;
 Thu, 12 Jan 2023 21:30:47 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E56A3F587;
 Thu, 12 Jan 2023 21:30:03 -0800 (PST)
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
X-Inumbo-ID: 5610a0b4-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 09/40] xen/arm: decouple copy_from_paddr with FIXMAP
Date: Fri, 13 Jan 2023 13:28:42 +0800
Message-Id: <20230113052914.3845596-10-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

copy_from_paddr will map a page to Xen's FIXMAP_MISC area for
temporary access. But for those systems do not support VMSA,
they can not implement set_fixmap/clear_fixmap, that means they
can't always use the same virtual address for source address.

In this case, we introduce to helpers to decouple copy_from_paddr
with set_fixmap/clear_fixmap. map_page_to_xen_misc can always
return the same virtual address as before for VMSA systems. It
also can return different address for non-VMSA systems.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. New patch
---
 xen/arch/arm/include/asm/setup.h |  4 ++++
 xen/arch/arm/kernel.c            | 13 +++++++------
 xen/arch/arm/mm.c                | 12 ++++++++++++
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index a926f30a2b..4f39a1aa0a 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -119,6 +119,10 @@ extern struct bootinfo bootinfo;
 
 extern domid_t max_init_domid;
 
+/* Map a page to misc area */
+void *map_page_to_xen_misc(mfn_t mfn, unsigned int attributes);
+/* Unmap the page from misc area */
+void unmap_page_from_xen_misc(void);
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(unsigned int mem_nr_banks);
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 23b840ea9e..0475d8fae7 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -49,18 +49,19 @@ struct minimal_dtb_header {
  */
 void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
 {
-    void *src = (void *)FIXMAP_ADDR(FIXMAP_MISC);
-
-    while (len) {
+    while ( len )
+    {
+        void *src;
         unsigned long l, s;
 
-        s = paddr & (PAGE_SIZE-1);
+        s = paddr & (PAGE_SIZE - 1);
         l = min(PAGE_SIZE - s, len);
 
-        set_fixmap(FIXMAP_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_WC);
+        src = map_page_to_xen_misc(maddr_to_mfn(paddr), PAGE_HYPERVISOR_WC);
+        ASSERT(src != NULL);
         memcpy(dst, src + s, l);
         clean_dcache_va_range(dst, l);
-        clear_fixmap(FIXMAP_MISC);
+        unmap_page_from_xen_misc();
 
         paddr += l;
         dst += l;
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0fc6f2992d..8f15814c5e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -355,6 +355,18 @@ void clear_fixmap(unsigned int map)
     BUG_ON(res != 0);
 }
 
+void *map_page_to_xen_misc(mfn_t mfn, unsigned int attributes)
+{
+    set_fixmap(FIXMAP_MISC, mfn, attributes);
+
+    return fix_to_virt(FIXMAP_MISC);
+}
+
+void unmap_page_from_xen_misc(void)
+{
+    clear_fixmap(FIXMAP_MISC);
+}
+
 void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     void *v = map_domain_page(_mfn(mfn));
-- 
2.25.1


