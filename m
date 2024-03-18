Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E4987E3F3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 08:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694473.1083278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7DY-0000fT-2y; Mon, 18 Mar 2024 07:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694473.1083278; Mon, 18 Mar 2024 07:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7DX-0000cV-VT; Mon, 18 Mar 2024 07:15:31 +0000
Received: by outflank-mailman (input) for mailman id 694473;
 Mon, 18 Mar 2024 07:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H/eU=KY=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1rm7DT-0000cL-TR
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 07:15:30 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49fa2860-e4f7-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 08:15:26 +0100 (CET)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 42I7ETdi910464
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 18 Mar 2024 00:14:34 -0700
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
X-Inumbo-ID: 49fa2860-e4f7-11ee-afdd-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 42I7ETdi910464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024031401; t=1710746075;
	bh=lOgqPli4E6y6mgNZ3XzJ8MlzC1fqsi4wvgAp64a4zdg=;
	h=From:To:Cc:Subject:Date:From;
	b=4qfo7+Bopd2+cAB5JZREDFFnwJ9EUBUQzcTriimHV5zBacAHniCvGQvo/sA6muLna
	 r4PwVGXSNtnFAarpjPSIkcS/hfYgUg4ojZl9bimUFHmnM0P9CO9rh8dpDRYahLqOvt
	 jnGim1lPI+5C7q/LXw9w5uKxwMQXRUaNszLu95FjFea3zs0mFNXuwyPH5LagxqX0vC
	 DosUI2YMVafFXw+c4aHUHb5JuMOQj2w2l2V9R0IlbFLWugYYUIdGE6Z5Vy6yC1MuaW
	 vy1Q4stBFIJ3UVxNPttVvgPU9sLEwyljSMMwcFiw0pKIcgh2pkDHDqZRXAoNS8IABG
	 Eqfo27oqDTeqA==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-arch@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, boris.ostrovsky@oracle.com, arnd@arndb.de
Subject: [PATCH v2 1/1] x86: Rename __{start,end}_init_task to __{start,end}_init_stack
Date: Mon, 18 Mar 2024 00:14:29 -0700
Message-ID: <20240318071429.910454-1-xin@zytor.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The stack of a task has been separated from the memory of a task_struct
struture for a long time on x86, as a result __{start,end}_init_task no
longer mark the start and end of the init_task structure, but its stack
only.

Rename __{start,end}_init_task to __{start,end}_init_stack.

Note other architectures are not affected because __{start,end}_init_task
are used on x86 only.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change since v1:
* Revert an accident insane change, init_task to init_stack (Jürgen Groß).
---
 arch/x86/include/asm/processor.h  | 4 ++--
 arch/x86/kernel/head_64.S         | 2 +-
 arch/x86/xen/xen-head.S           | 2 +-
 include/asm-generic/vmlinux.lds.h | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 811548f131f4..8b3a3f3bb859 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -636,10 +636,10 @@ static __always_inline void prefetchw(const void *x)
 #define KSTK_ESP(task)		(task_pt_regs(task)->sp)
 
 #else
-extern unsigned long __end_init_task[];
+extern unsigned long __end_init_stack[];
 
 #define INIT_THREAD {							\
-	.sp	= (unsigned long)&__end_init_task -			\
+	.sp	= (unsigned long)&__end_init_stack -			\
 		  TOP_OF_KERNEL_STACK_PADDING -				\
 		  sizeof(struct pt_regs),				\
 }
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index d8198fbd70e5..c7babd7ebb0f 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -66,7 +66,7 @@ SYM_CODE_START_NOALIGN(startup_64)
 	mov	%rsi, %r15
 
 	/* Set up the stack for verify_cpu() */
-	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
+	leaq	(__end_init_stack - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
 
 	/* Setup GSBASE to allow stack canary access for C code */
 	movl	$MSR_GS_BASE, %ecx
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 04101b984f24..43eadf03f46d 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -49,7 +49,7 @@ SYM_CODE_START(startup_xen)
 	ANNOTATE_NOENDBR
 	cld
 
-	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
+	leaq	(__end_init_stack - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
 
 	/* Set up %gs.
 	 *
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 514d3002ad8a..cdfdcca23045 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -399,13 +399,13 @@
 
 #define INIT_TASK_DATA(align)						\
 	. = ALIGN(align);						\
-	__start_init_task = .;						\
+	__start_init_stack = .;						\
 	init_thread_union = .;						\
 	init_stack = .;							\
 	KEEP(*(.data..init_task))					\
 	KEEP(*(.data..init_thread_info))				\
-	. = __start_init_task + THREAD_SIZE;				\
-	__end_init_task = .;
+	. = __start_init_stack + THREAD_SIZE;				\
+	__end_init_stack = .;
 
 #define JUMP_TABLE_DATA							\
 	. = ALIGN(8);							\

base-commit: 7e19a79344df2ed5e106091c29338962261b0290
-- 
2.44.0


