Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BBC6F14C5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 11:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527226.819596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psKqm-00026p-8l; Fri, 28 Apr 2023 09:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527226.819596; Fri, 28 Apr 2023 09:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psKqm-0001z7-14; Fri, 28 Apr 2023 09:57:12 +0000
Received: by outflank-mailman (input) for mailman id 527226;
 Fri, 28 Apr 2023 09:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCeu=AT=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1psKnH-0001iA-Dx
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 09:53:35 +0000
Received: from out0-200.mail.aliyun.com (out0-200.mail.aliyun.com
 [140.205.0.200]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88079f65-e5aa-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 11:53:33 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.STFoGYl_1682675602) by smtp.aliyun-inc.com;
 Fri, 28 Apr 2023 17:53:23 +0800
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
X-Inumbo-ID: 88079f65-e5aa-11ed-8611-37d641c3527e
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047212;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.STFoGYl_1682675602;
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Thomas Garnier" <thgarnie@chromium.org>,
  "Lai Jiangshan" <jiangshan.ljs@antgroup.com>,
  "Kees Cook" <keescook@chromium.org>,
  "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Juergen Gross" <jgross@suse.com>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Darren Hart" <dvhart@infradead.org>,
  "Andy Shevchenko" <andy@infradead.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
   <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
   <xen-devel@lists.xenproject.org>,
   <platform-driver-x86@vger.kernel.org>
Subject: [PATCH RFC 29/43] x86/PVH: Adapt PVH booting for PIE support
Date: Fri, 28 Apr 2023 17:51:09 +0800
Message-Id: <ea6994d2ab49a50cb5a8911c24562cd6d223c2b6.1682673543.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
References: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If PIE is enabled, all symbol references would be RIP-relative. However,
PVH booting runs in low address space, which could cause wrong x86_init
callbacks assignment. Since init_top_pgt has building high kernel
address mapping, let PVH booting runs in high address space to make all
things right.

PVH booting assumes that no relocation happened. Since the kernel
compile address is still in top 2G, so it is allowed to use R_X86_64_32S
for symbol references in pvh_start_xen().

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: Thomas Garnier <thgarnie@chromium.org>
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/x86/platform/pvh/head.S | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 5842fe0e4f96..09518d4de042 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -94,6 +94,13 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	/* 64-bit entry point. */
 	.code64
 1:
+#ifdef CONFIG_X86_PIE
+	movabs  $2f, %rax
+	ANNOTATE_RETPOLINE_SAFE
+	jmp *%rax
+2:
+	ANNOTATE_NOENDBR // above
+#endif
 	/* Set base address in stack canary descriptor. */
 	mov $MSR_GS_BASE,%ecx
 #if defined(CONFIG_STACKPROTECTOR_FIXED)
@@ -149,9 +156,15 @@ SYM_CODE_END(pvh_start_xen)
 	.section ".init.data","aw"
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
+	/*
+	 * Use an ASM_PTR (quad on x64) for _pa(gdt_start) because PIE requires
+	 * a pointer size storage value before applying the relocation. On
+	 * 32-bit _ASM_PTR will be a long which is aligned the space needed for
+	 * relocation.
+	 */
 	.word gdt_end - gdt_start
-	.long _pa(gdt_start)
-	.word 0
+	_ASM_PTR _pa(gdt_start)
+	.balign 8
 SYM_DATA_END(gdt)
 SYM_DATA_START_LOCAL(gdt_start)
 	.quad 0x0000000000000000            /* NULL descriptor */
-- 
2.31.1


