Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B387A2DD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 07:08:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692269.1079209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkHlE-0000lb-64; Wed, 13 Mar 2024 06:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692269.1079209; Wed, 13 Mar 2024 06:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkHlE-0000j7-2q; Wed, 13 Mar 2024 06:06:44 +0000
Received: by outflank-mailman (input) for mailman id 692269;
 Wed, 13 Mar 2024 06:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dYD6=KT=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1rkHlC-0000j1-KC
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 06:06:42 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c364c9-e0ff-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 07:06:39 +0100 (CET)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 42D65lI31952906
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 12 Mar 2024 23:05:52 -0700
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
X-Inumbo-ID: d9c364c9-e0ff-11ee-afdd-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 42D65lI31952906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024021201; t=1710309953;
	bh=6cPXc90ChYXIeVgs/NUEWiqMXh5ugp4gEBYa/cJtbTY=;
	h=From:To:Cc:Subject:Date:From;
	b=iOsC/GAT/90KVoDQdNzwFM/vBtWWFweJld8q6upxGorAIhuGrZGjPkh5rCiNTiHUz
	 jQfUcQuAdvSskKyMe7Vm2RmxGSUYDhGyTzwRsbhnHdDGJ6/fBfj7oV182UkFV9GAMZ
	 WrWwSTSqhzWI/9n27k8LXMIqrH2+E+pQV7T3ygeWLiqsDN2f9xSJI/WXlkeP1KkAEP
	 L8mgFf9t2SXEoUYtO7oCXNhFcNvlmMlnrDNNLLjMMa2l37w+vf/Ze6ttP8g3y5BOQy
	 eY6iDzE0cuOGIjwkr1FRDyq5wTj+MFW7bBSBbi5MRSdVhycB8bZwyoPP1G1OwHICNt
	 ZUOSYxZJduBLg==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-arch@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, boris.ostrovsky@oracle.com, arnd@arndb.de
Subject: [PATCH v1 1/1] x86: Rename __{start,end}_init_task to __{start,end}_init_stack
Date: Tue, 12 Mar 2024 23:05:46 -0700
Message-ID: <20240313060546.1952893-1-xin@zytor.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
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
 arch/x86/include/asm/processor.h  | 4 ++--
 arch/x86/kernel/head_64.S         | 2 +-
 arch/x86/xen/xen-head.S           | 2 +-
 include/asm-generic/vmlinux.lds.h | 8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

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
index 5dd3a61d673d..a168be99d522 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -399,13 +399,13 @@
 
 #define INIT_TASK_DATA(align)						\
 	. = ALIGN(align);						\
-	__start_init_task = .;						\
+	__start_init_stack = .;						\
 	init_thread_union = .;						\
 	init_stack = .;							\
-	KEEP(*(.data..init_task))					\
+	KEEP(*(.data..init_stack))					\
 	KEEP(*(.data..init_thread_info))				\
-	. = __start_init_task + THREAD_SIZE;				\
-	__end_init_task = .;
+	. = __start_init_stack + THREAD_SIZE;				\
+	__end_init_stack = .;
 
 #define JUMP_TABLE_DATA							\
 	. = ALIGN(8);							\

base-commit: 626856ae97054963e7b8c35335d4418271c8d0c4
-- 
2.44.0


