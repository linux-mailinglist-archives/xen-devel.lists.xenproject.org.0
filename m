Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B846B7FDB27
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643994.1004597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQk-0002Ic-Q4; Wed, 29 Nov 2023 15:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643994.1004597; Wed, 29 Nov 2023 15:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQk-0002CA-J9; Wed, 29 Nov 2023 15:24:50 +0000
Received: by outflank-mailman (input) for mailman id 643994;
 Wed, 29 Nov 2023 15:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQo/=HK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8MQi-0001PZ-Aj
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:24:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6df25e84-8ecb-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 16:24:47 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.152])
 by support.bugseng.com (Postfix) with ESMTPSA id DB0154EE0741;
 Wed, 29 Nov 2023 16:24:45 +0100 (CET)
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
X-Inumbo-ID: 6df25e84-8ecb-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/7] xen/x86: add missing instances of asmlinkage attributes
Date: Wed, 29 Nov 2023 16:24:21 +0100
Message-Id: <4815279026ca4e2f1d93c98bfe6ea51ee139280d.1701270983.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701270983.git.nicola.vetrini@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/desc.c         | 2 +-
 xen/arch/x86/efi/efi-boot.h | 5 +++--
 xen/arch/x86/mm.c           | 2 +-
 xen/arch/x86/smpboot.c      | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/desc.c b/xen/arch/x86/desc.c
index 39080ca67211..b332adedf28e 100644
--- a/xen/arch/x86/desc.c
+++ b/xen/arch/x86/desc.c
@@ -91,7 +91,7 @@ seg_desc_t boot_compat_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
  * References boot_cpu_gdt_table for a short period, until the CPUs switch
  * onto their per-CPU GDTs.
  */
-const struct desc_ptr boot_gdtr = {
+const struct desc_ptr asmlinkage boot_gdtr = {
     .limit = LAST_RESERVED_GDT_BYTE,
     .base = (unsigned long)(boot_gdt - FIRST_RESERVED_GDT_ENTRY),
 };
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 86467da301e5..8ea64e31cdc2 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -808,8 +808,9 @@ static const char *__init get_option(const char *cmd, const char *opt)
     return o;
 }
 
-void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable,
-                           const char *cmdline)
+void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
+                                      EFI_SYSTEM_TABLE *SystemTable,
+                                      const char *cmdline)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
     EFI_HANDLE gop_handle;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0a66db10b959..9ce21c443bea 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -143,7 +143,7 @@
 /* Mapping of the fixmap space needed early. */
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap[L1_PAGETABLE_ENTRIES];
-l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+l1_pgentry_t asmlinkage __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap_x[L1_PAGETABLE_ENTRIES];
 
 bool __read_mostly machine_to_phys_mapping_valid;
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 4c54ecbc91d7..8aa621533f3d 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -310,7 +310,7 @@ static void set_cpu_sibling_map(unsigned int cpu)
     }
 }
 
-void start_secondary(void *unused)
+void asmlinkage start_secondary(void *unused)
 {
     struct cpu_info *info = get_cpu_info();
 
-- 
2.34.1


