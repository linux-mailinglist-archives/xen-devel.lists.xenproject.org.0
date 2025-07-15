Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE39BB05390
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043597.1413590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMK-0002yr-Ti; Tue, 15 Jul 2025 07:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043597.1413590; Tue, 15 Jul 2025 07:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMK-0002wT-Pt; Tue, 15 Jul 2025 07:45:52 +0000
Received: by outflank-mailman (input) for mailman id 1043597;
 Tue, 15 Jul 2025 07:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCR=Z4=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1ubaMJ-0002PZ-Ar
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:45:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ba5b85e9-614f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 09:45:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AEA112FC;
 Tue, 15 Jul 2025 00:45:41 -0700 (PDT)
Received: from PWQ0QT7DJ1.emea.arm.com (PWQ0QT7DJ1.cambridge.arm.com
 [10.1.25.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEBCF3F66E;
 Tue, 15 Jul 2025 00:45:48 -0700 (PDT)
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
X-Inumbo-ID: ba5b85e9-614f-11f0-a319-13f23c93f187
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v3 2/6] xen/arm: Introduce flags_has_rwx helper
Date: Tue, 15 Jul 2025 08:45:24 +0100
Message-ID: <47890d25aeec2048197f619fe711e9e925a9a8ac.1752565274.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1752565274.git.hari.limaye@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
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


