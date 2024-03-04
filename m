Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A4986FC81
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 09:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688207.1072164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh47O-00066V-VH; Mon, 04 Mar 2024 08:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688207.1072164; Mon, 04 Mar 2024 08:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh47O-00064D-SN; Mon, 04 Mar 2024 08:56:18 +0000
Received: by outflank-mailman (input) for mailman id 688207;
 Mon, 04 Mar 2024 08:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JyYL=KK=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1rh3m9-0001MP-4j
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 08:34:21 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd437f97-da01-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 09:34:19 +0100 (CET)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 4248XYnT449332
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Mar 2024 00:33:39 -0800
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
X-Inumbo-ID: fd437f97-da01-11ee-afda-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 4248XYnT449332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024021201; t=1709541220;
	bh=u5MzfYslbwvnWZsLlHhoH6dB+B9y4C5n+dg6pZDkb0I=;
	h=From:To:Cc:Subject:Date:From;
	b=GQPd+y3kbiU0y6OU0+1fgS8TmyqqCK9SoA0aHp/ONyWTSNTS57BZlHRyDAAf3oYLQ
	 T0lsWLgRxjGhJTHbub4LbGBOB5h/iO4bQsiSkvZNtv2p2ZLoUEy5tv2rR420WMuNt5
	 lpNJSNyKv0k0omAspzGNdUtfI3m3TTeupmMR0sdZHTdAi/LE8DYEuqKqVkRwN8mFSZ
	 alr3QYRNa97Y0Xe7VJtSagpcQY5AB7q/fEW8qSC9bDf0wN/TmYjm9iLAQpxL/m5j8t
	 ZulPzFa+/DoNshIxNLC/T8YcgdI9dW+gvk2zSVFuDahyArrpuJGXNRve+v/jDinVPy
	 L7/wpF0XQjujw==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, boris.ostrovsky@oracle.com, arnd@arndb.de,
        andrew.cooper3@citrix.com, brgerst@gmail.com
Subject: [PATCH v2 1/1] x86/fred: Fix init_task thread stack pointer initialization
Date: Mon,  4 Mar 2024 00:33:33 -0800
Message-ID: <20240304083333.449322-1-xin@zytor.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As TOP_OF_KERNEL_STACK_PADDING is defined as 0 on x86_64, no one noticed
it's missing in the calculation of the .sp field in INIT_THREAD until it
is defined to 16 with CONFIG_X86_FRED=y.

Subtract TOP_OF_KERNEL_STACK_PADDING from the .sp field of INIT_THREAD.

Fixes: 65c9cc9e2c14 ("x86/fred: Reserve space for the FRED stack frame")
Fixes: 3adee777ad0d ("x86/smpboot: Remove initial_stack on 64-bit")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202402262159.183c2a37-lkp@intel.com
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change Since v1:
* Apply offset TOP_OF_KERNEL_STACK_PADDING to all uses of __end_init_task
  (Brian Gerst).
---
 arch/x86/include/asm/processor.h | 6 ++++--
 arch/x86/kernel/head_64.S        | 3 ++-
 arch/x86/xen/xen-head.S          | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 26620d7642a9..17fe81998ce4 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -664,8 +664,10 @@ static __always_inline void prefetchw(const void *x)
 #else
 extern unsigned long __end_init_task[];
 
-#define INIT_THREAD {							    \
-	.sp	= (unsigned long)&__end_init_task - sizeof(struct pt_regs), \
+#define INIT_THREAD {							\
+	.sp	= (unsigned long)&__end_init_task -			\
+		  TOP_OF_KERNEL_STACK_PADDING -				\
+		  sizeof(struct pt_regs),				\
 }
 
 extern unsigned long KSTK_ESP(struct task_struct *task);
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index d4918d03efb4..c38e43589046 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -26,6 +26,7 @@
 #include <asm/apicdef.h>
 #include <asm/fixmap.h>
 #include <asm/smp.h>
+#include <asm/thread_info.h>
 
 /*
  * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
@@ -66,7 +67,7 @@ SYM_CODE_START_NOALIGN(startup_64)
 	mov	%rsi, %r15
 
 	/* Set up the stack for verify_cpu() */
-	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
+	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
 
 	leaq	_text(%rip), %rdi
 
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index a0ea285878db..04101b984f24 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -49,7 +49,7 @@ SYM_CODE_START(startup_xen)
 	ANNOTATE_NOENDBR
 	cld
 
-	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
+	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
 
 	/* Set up %gs.
 	 *

base-commit: e13841907b8fda0ae0ce1ec03684665f578416a8
-- 
2.44.0


