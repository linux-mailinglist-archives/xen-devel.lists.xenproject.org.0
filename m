Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A877DDE6C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626199.976242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7Yq-000183-Rv; Wed, 01 Nov 2023 09:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626199.976242; Wed, 01 Nov 2023 09:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7Yq-00015B-OS; Wed, 01 Nov 2023 09:30:52 +0000
Received: by outflank-mailman (input) for mailman id 626199;
 Wed, 01 Nov 2023 09:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJn5=GO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qy7Yo-0000L5-T5
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:30:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 586456d0-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:30:50 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D4F5A4EE0C81;
 Wed,  1 Nov 2023 10:30:48 +0100 (CET)
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
X-Inumbo-ID: 586456d0-7899-11ee-98d6-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v6 3/8] x86: add asmlinkage macro to variables only used in asm code
Date: Wed,  1 Nov 2023 10:30:32 +0100
Message-Id: <8e7762db94449c18e88171658c758a227e1fae9b.1698829473.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698829473.git.nicola.vetrini@bugseng.com>
References: <cover.1698829473.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid a violation of MISRA C:2012 Rule 8.4, as permitted
by docs/misra/rules.rst.

The current_stack_pointer is a declaration: mark it as such
for ECLAIR.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v3:
- Edited commit message
- Add two new variables
Changes in v5:
- Mark current_stack_pointer as a declaration.
- Use asmlinkage instead of SAF.
Changes in v6:
- moved asmlinkage after the type
---
 xen/arch/x86/setup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a3d3f797bb1e..d70ad1e44a60 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -75,7 +75,8 @@ static bool __initdata opt_invpcid = true;
 boolean_param("invpcid", opt_invpcid);
 bool __read_mostly use_invpcid;
 
-unsigned long __read_mostly cr4_pv32_mask;
+/* Only used in asm code and within this source file */
+unsigned long asmlinkage __read_mostly cr4_pv32_mask;
 
 /* **** Linux config option: propagated to domain0. */
 /* "acpi=off":    Sisables both ACPI table parsing and interpreter. */
@@ -146,14 +147,15 @@ cpumask_t __read_mostly cpu_present_map;
 
 unsigned long __read_mostly xen_phys_start;
 
-char __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
+/* Only used in asm code and within this source file */
+char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
     cpu0_stack[STACK_SIZE];
 
 /* Used by the BSP/AP paths to find the higher half stack mapping to use. */
 void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);
 
 /* Used by the boot asm to stash the relocated multiboot info pointer. */
-unsigned int __initdata multiboot_ptr;
+unsigned int asmlinkage __initdata multiboot_ptr;
 
 struct cpuinfo_x86 __read_mostly boot_cpu_data = { 0, 0, 0, 0, -1 };
 
-- 
2.34.1


