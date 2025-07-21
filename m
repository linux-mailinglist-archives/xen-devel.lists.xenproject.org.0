Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4FB0BEEE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 10:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051148.1419443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udlwY-0005y1-Px; Mon, 21 Jul 2025 08:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051148.1419443; Mon, 21 Jul 2025 08:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udlwY-0005vJ-MG; Mon, 21 Jul 2025 08:32:18 +0000
Received: by outflank-mailman (input) for mailman id 1051148;
 Mon, 21 Jul 2025 08:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1oiY=2C=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1udlwX-0005OI-Dn
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 08:32:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 34dd4f4e-660d-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 10:32:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47F131595;
 Mon, 21 Jul 2025 01:32:09 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.71.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99FC53F66E;
 Mon, 21 Jul 2025 01:32:13 -0700 (PDT)
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
X-Inumbo-ID: 34dd4f4e-660d-11f0-b894-0df219b8e170
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v4 2/6] xen/arm: Introduce flags_has_rwx helper
Date: Mon, 21 Jul 2025 09:31:43 +0100
Message-ID: <b65fa5099bf84373a1ac1c32a0086ba96b2350ab.1753084737.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1753084737.git.hari.limaye@arm.com>
References: <cover.1753084737.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Introduce flags_has_rwx() function that will check if a
mapping is both writable and executable when modifying
or updating the mapping.

This check was already present in pt.c but since it will
be used also for MPU systems, it's wrapped into a function
now.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v1:
- Add Ayan and Michal's R-b
- Fix typos
---
 xen/arch/arm/include/asm/mm.h |  2 ++
 xen/arch/arm/mm.c             | 15 +++++++++++++++
 xen/arch/arm/mmu/pt.c         |  9 +--------
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 011bc1fd30..fb79aeb088 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -192,6 +192,8 @@ extern unsigned long frametable_base_pdx;
 
 /* Boot-time pagetable setup */
 extern void setup_pagetables(void);
+/* Check that the mapping flag has no W and X together */
+bool flags_has_rwx(unsigned int flags);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0613c19169..77e21f5f29 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -24,6 +24,21 @@
 
 unsigned long frametable_base_pdx __read_mostly;
 
+bool flags_has_rwx(unsigned int flags)
+{
+    /*
+     * The hardware was configured to forbid mapping both writable and
+     * executable.
+     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
+     * prevent any update if this happen.
+     */
+    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
+         !PAGE_XN_MASK(flags) )
+        return true;
+    else
+        return false;
+}
+
 void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     void *v = map_domain_page(_mfn(mfn));
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index 4726e713ef..621b47dbf5 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -610,14 +610,7 @@ static int xen_pt_update(unsigned long virt,
      */
     const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
 
-    /*
-     * The hardware was configured to forbid mapping both writeable and
-     * executable.
-     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
-     * prevent any update if this happen.
-     */
-    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
-         !PAGE_XN_MASK(flags) )
+    if ( flags_has_rwx(flags) )
     {
         mm_printk("Mappings should not be both Writeable and Executable.\n");
         return -EINVAL;
-- 
2.34.1


