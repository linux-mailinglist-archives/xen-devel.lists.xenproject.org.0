Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DacOdVtd2nCfQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3188E7F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213720.1524196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkMlK-0003kD-9J; Mon, 26 Jan 2026 13:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213720.1524196; Mon, 26 Jan 2026 13:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkMlK-0003i4-6S; Mon, 26 Jan 2026 13:36:14 +0000
Received: by outflank-mailman (input) for mailman id 1213720;
 Mon, 26 Jan 2026 13:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygru=77=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1vkMlI-0003VU-GW
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 13:36:12 +0000
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com
 [115.124.28.52]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6e9401c-fabb-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 14:36:08 +0100 (CET)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.gGID1nH_1769434562 cluster:ay29) by smtp.aliyun-inc.com;
 Mon, 26 Jan 2026 21:36:03 +0800
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
X-Inumbo-ID: f6e9401c-fabb-11f0-9ccf-f158ae23cfc8
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1769434565; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=VyKxMTwvBHUzyW1uTW736L2GPVuIiSygzDpiTrPhWW8=;
	b=Iwk6WT3ax7dZYFr2LpsKXdh+MDYo1dBQLcy/P/FOeFykpsga67y6uySmOjRlnTDyxmC5lxmjJSk/2Od51rVv7fUPF2giChSQbtzJt+N+5JIjJ2zPy9rZ7s6aD0D94AWHj38LoqVTvtjXuabu+x5A7SK1gnAnPP6TJdlH2ci3P0c=
From: Hou Wenlong <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Graf <graf@amazon.com>,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Brian Gerst <brgerst@gmail.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	"Xin Li (Intel)" <xin@zytor.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH 4/5] x86/boot: Perform virtual address relocation in kernel entry
Date: Mon, 26 Jan 2026 21:33:54 +0800
Message-Id: <d9e65f4707b28b107c352bd4bc311db7a8ea738b.1769434279.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1769434279.git.houwenlong.hwl@antgroup.com>
References: <cover.1769434279.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[antgroup.com,quarantine];
	R_DKIM_ALLOW(-0.20)[antgroup.com:s=default];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[antgroup.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,oracle.com,linux-foundation.org,amazon.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:jiangshan.ljs@antgroup.com,m:houwenlong.hwl@antgroup.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:ardb@kernel.org,m:jpoimboe@kernel.org,m:nathan@kernel.org,m:akpm@linux-foundation.org,m:graf@amazon.com,m:joel.granados@kernel.org,m:thuth@redhat.com,m:ubizjak@gmail.com,m:brgerst@gmail.com,m:kas@kernel.org,m:xin@zytor.com,m:ilpo.jarvinen@linux.intel.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[antgroup.com:email,antgroup.com:dkim,antgroup.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[antgroup.com:+];
	NEURAL_HAM(-0.00)[-0.877];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95E3188E7F
X-Rspamd-Action: no action

Perform virtual address relocation for the uncompressed kernel during
booting, which is similar to the relocation during decompression.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/boot/startup/Makefile |   1 +
 arch/x86/boot/startup/kaslr.c  | 116 +++++++++++++++++++++++++++++++++
 arch/x86/include/asm/setup.h   |   1 +
 arch/x86/kernel/head_64.S      |   7 ++
 arch/x86/lib/cmdline.c         |   6 ++
 arch/x86/lib/kaslr.c           |   5 ++
 arch/x86/platform/pvh/head.S   |  15 ++++-
 7 files changed, 148 insertions(+), 3 deletions(-)
 create mode 100644 arch/x86/boot/startup/kaslr.c

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index 5e499cfb29b5..eeaefa4e25fb 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -20,6 +20,7 @@ KCOV_INSTRUMENT	:= n
 
 obj-$(CONFIG_X86_64)		+= gdt_idt.o map_kernel.o
 obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= sme.o sev-startup.o
+obj-$(CONFIG_RELOCATABLE_UNCOMPRESSED_KERNEL) += kaslr.o
 pi-objs				:= $(patsubst %.o,$(obj)/%.o,$(obj-y))
 
 lib-$(CONFIG_X86_64)		+= la57toggle.o
diff --git a/arch/x86/boot/startup/kaslr.c b/arch/x86/boot/startup/kaslr.c
new file mode 100644
index 000000000000..fb07c31e21b3
--- /dev/null
+++ b/arch/x86/boot/startup/kaslr.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/init.h>
+#include <linux/types.h>
+
+/* A hack to avoid non-static declaration for kaslr_get_random_long(). */
+#define _ASM_KASLR_H_
+#include <asm/sections.h>
+#include <asm/bootparam.h>
+#include <asm/cpuid/api.h>
+
+extern char __relocation_end[];
+
+static struct boot_params *boot_params_ptr __initdata;
+
+static inline void debug_putstr(const char *str)
+{
+}
+
+static inline bool has_cpuflag(int flag)
+{
+	u32 reg = 0;
+	u32 level = native_cpuid_eax(0x0);
+
+	if (level >= 0x00000001) {
+		if (flag == X86_FEATURE_RDRAND)
+			reg = native_cpuid_edx(0x1);
+		else if (flag == X86_FEATURE_TSC)
+			reg = native_cpuid_ecx(0x1);
+	}
+
+	return test_bit(flag & 31, (unsigned long *)&reg);
+}
+
+static unsigned long __init rotate_xor(unsigned long hash, const void *area,
+				       size_t size)
+{
+	size_t i;
+	unsigned long *ptr = (unsigned long *)area;
+
+	for (i = 0; i < size / sizeof(hash); i++) {
+		/* Rotate by odd number of bits and XOR. */
+		hash = (hash << ((sizeof(hash) * 8) - 7)) | (hash >> 7);
+		hash ^= ptr[i];
+	}
+
+	return hash;
+}
+
+/* Attempt to create a simple but unpredictable starting entropy. */
+static unsigned long get_boot_seed(void)
+{
+	unsigned long hash = 0;
+
+	hash = rotate_xor(hash, boot_params_ptr, sizeof(*boot_params_ptr));
+
+	return hash;
+}
+
+#define KASLR_COMPRESSED_BOOT
+#define KASLR_FUNC_PREFIX static __init
+#include "../../lib/kaslr.c"
+
+/* A hack to avoid non-static declaration for cmdline_find_option_bool(). */
+#define _ASM_X86_CMDLINE_H
+#undef CONFIG_CMDLINE_BOOL
+#define builtin_cmdline NULL
+#define CMDLINE_FUNC_PREFIX static __maybe_unused __init
+#include "../../lib/cmdline.c"
+
+static unsigned long __init find_random_virt_addr(unsigned long minimum,
+						  unsigned long image_size)
+{
+	unsigned long slots, random_addr;
+
+	/*
+	 * There are how many CONFIG_PHYSICAL_ALIGN-sized slots
+	 * that can hold image_size within the range of minimum to
+	 * KERNEL_IMAGE_SIZE?
+	 */
+	slots = 1 + (KERNEL_IMAGE_SIZE - minimum - image_size) / CONFIG_PHYSICAL_ALIGN;
+
+	random_addr = kaslr_get_random_long("Virtual") % slots;
+
+	return random_addr * CONFIG_PHYSICAL_ALIGN + minimum;
+}
+
+void __init __relocate_kernel(unsigned long p2v_offset, struct boot_params *bp)
+{
+	int *reloc = (int *)rip_rel_ptr(__relocation_end);
+	unsigned long image_size = rip_rel_ptr(_end) - rip_rel_ptr(_text);
+	unsigned long ptr, virt_addr, delta;
+	unsigned long cmd_line_ptr;
+
+	/* If relocation has occurred during decompression, simply skip it. */
+	if (bp->hdr.loadflags & KASLR_FLAG)
+		return;
+
+	cmd_line_ptr = bp->hdr.cmd_line_ptr | ((u64)bp->ext_cmd_line_ptr << 32);
+	if (cmdline_find_option_bool((char *)cmd_line_ptr, "nokaslr"))
+		return;
+
+	boot_params_ptr = bp;
+	virt_addr = find_random_virt_addr(LOAD_PHYSICAL_ADDR, image_size);
+	delta = virt_addr - LOAD_PHYSICAL_ADDR;
+
+	for (reloc--; *reloc; reloc--) {
+		ptr = (unsigned long)(*reloc + p2v_offset);
+		*(uint32_t *)ptr += delta;
+	}
+
+	for (reloc--; *reloc; reloc--) {
+		ptr = (unsigned long)(*reloc + p2v_offset);
+		*(uint64_t *)ptr += delta;
+	}
+}
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 914eb32581c7..86a715a255a5 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -56,6 +56,7 @@ extern void startup_64_load_idt(void *vc_handler);
 extern void __pi_startup_64_load_idt(void *vc_handler);
 extern void early_setup_idt(void);
 extern void __init do_early_exception(struct pt_regs *regs, int trapnr);
+extern void __init __relocate_kernel(unsigned long p2v_offset, struct boot_params *bp);
 
 #ifdef CONFIG_X86_INTEL_MID
 extern void x86_intel_mid_early_setup(void);
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 21816b48537c..868d8fdd59df 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -97,6 +97,13 @@ SYM_CODE_START_NOALIGN(startup_64)
 	/* Sanitize CPU configuration */
 	call verify_cpu
 
+#ifdef CONFIG_RELOCATABLE_UNCOMPRESSED_KERNEL
+	leaq	common_startup_64(%rip), %rdi
+	subq	.Lcommon_startup_64(%rip), %rdi
+	movq	%r15, %rsi
+	call	__pi___relocate_kernel
+#endif
+
 	/*
 	 * Derive the kernel's physical-to-virtual offset from the physical and
 	 * virtual addresses of common_startup_64().
diff --git a/arch/x86/lib/cmdline.c b/arch/x86/lib/cmdline.c
index c65cd5550454..07c4398b9e67 100644
--- a/arch/x86/lib/cmdline.c
+++ b/arch/x86/lib/cmdline.c
@@ -11,6 +11,10 @@
 #include <asm/cmdline.h>
 #include <asm/bug.h>
 
+#ifndef CMDLINE_FUNC_PREFIX
+#define CMDLINE_FUNC_PREFIX
+#endif
+
 static inline int myisspace(u8 c)
 {
 	return c <= ' ';	/* Close enough approximation */
@@ -205,6 +209,7 @@ __cmdline_find_option(const char *cmdline, int max_cmdline_size,
 	return len;
 }
 
+CMDLINE_FUNC_PREFIX
 int cmdline_find_option_bool(const char *cmdline, const char *option)
 {
 	int ret;
@@ -219,6 +224,7 @@ int cmdline_find_option_bool(const char *cmdline, const char *option)
 	return ret;
 }
 
+CMDLINE_FUNC_PREFIX
 int cmdline_find_option(const char *cmdline, const char *option, char *buffer,
 			int bufsize)
 {
diff --git a/arch/x86/lib/kaslr.c b/arch/x86/lib/kaslr.c
index 8c7cd115b484..711a19729e20 100644
--- a/arch/x86/lib/kaslr.c
+++ b/arch/x86/lib/kaslr.c
@@ -13,6 +13,10 @@
 #include <asm/e820/api.h>
 #include <asm/shared/io.h>
 
+#ifndef KASLR_FUNC_PREFIX
+#define KASLR_FUNC_PREFIX
+#endif
+
 /*
  * When built for the regular kernel, several functions need to be stubbed out
  * or changed to their regular kernel equivalent.
@@ -46,6 +50,7 @@ static inline u16 i8254(void)
 	return timer;
 }
 
+KASLR_FUNC_PREFIX
 unsigned long kaslr_get_random_long(const char *purpose)
 {
 #ifdef CONFIG_X86_64
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 344030c1a81d..94832930b0a2 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -103,6 +103,17 @@ SYM_CODE_START(pvh_start_xen)
 	btsl $_EFER_LME, %eax
 	wrmsr
 
+	/*
+	 * Fill the identity mapping entries instead of preconstructing them,
+	 * as later relocations in __relocation_kernel() would modify them and
+	 * break the mapping if they are prefilled, due to the generation of
+	 * relocation entries.
+	 */
+	leal rva(pvh_init_top_pgt)(%ebp), %edi
+	addl $(pvh_level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC), (%edi)
+	leal rva(pvh_level3_ident_pgt)(%ebp), %edi
+	addl $(pvh_level2_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC), (%edi)
+
 	/*
 	 * Reuse the non-relocatable symbol emitted for the ELF note to
 	 * subtract the build time physical address of pvh_start_xen() from
@@ -254,7 +265,6 @@ SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
  * startup_64 transitions to init_top_pgt.
  */
 SYM_DATA_START_PAGE_ALIGNED(pvh_init_top_pgt)
-	.quad   pvh_level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
 	.org    pvh_init_top_pgt + L4_PAGE_OFFSET * 8, 0
 	.quad   pvh_level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
 	.org    pvh_init_top_pgt + L4_START_KERNEL * 8, 0
@@ -263,8 +273,7 @@ SYM_DATA_START_PAGE_ALIGNED(pvh_init_top_pgt)
 SYM_DATA_END(pvh_init_top_pgt)
 
 SYM_DATA_START_PAGE_ALIGNED(pvh_level3_ident_pgt)
-	.quad	pvh_level2_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
-	.fill	511, 8, 0
+	.fill	512, 8, 0
 SYM_DATA_END(pvh_level3_ident_pgt)
 SYM_DATA_START_PAGE_ALIGNED(pvh_level2_ident_pgt)
 	/*
-- 
2.31.1


