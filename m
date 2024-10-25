Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115089AFF9E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825862.1240312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFk-0006H2-J6; Fri, 25 Oct 2024 10:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825862.1240312; Fri, 25 Oct 2024 10:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFk-0006CH-7h; Fri, 25 Oct 2024 10:09:08 +0000
Received: by outflank-mailman (input) for mailman id 825862;
 Fri, 25 Oct 2024 10:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFi-00014t-EZ
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:09:06 +0000
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 268e3d55-92b9-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 12:09:03 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XZdjm2S6Hz1T8p8;
 Fri, 25 Oct 2024 18:06:52 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 8ADF81800A5;
 Fri, 25 Oct 2024 18:08:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:54 +0800
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
X-Inumbo-ID: 268e3d55-92b9-11ef-a0bf-8be0dac302b0
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linux@armlinux.org.uk>, <will@kernel.org>,
	<mark.rutland@arm.com>, <catalin.marinas@arm.com>, <sstabellini@kernel.org>,
	<maz@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <samitolvanen@google.com>, <arnd@arndb.de>,
	<ojeda@kernel.org>, <rppt@kernel.org>, <hca@linux.ibm.com>,
	<aliceryhl@google.com>, <samuel.holland@sifive.com>, <paulmck@kernel.org>,
	<aquini@redhat.com>, <petr.pavlu@suse.com>, <ruanjinjie@huawei.com>,
	<viro@zeniv.linux.org.uk>, <rmk+kernel@armlinux.org.uk>, <ardb@kernel.org>,
	<wangkefeng.wang@huawei.com>, <surenb@google.com>,
	<linus.walleij@linaro.org>, <yangyj.ee@gmail.com>, <broonie@kernel.org>,
	<mbenes@suse.cz>, <puranjay@kernel.org>, <pcc@google.com>,
	<guohanjun@huawei.com>, <sudeep.holla@arm.com>,
	<Jonathan.Cameron@huawei.com>, <prarit@redhat.com>, <liuwei09@cestc.cn>,
	<dwmw@amazon.co.uk>, <oliver.upton@linux.dev>, <kristina.martsenko@arm.com>,
	<ptosi@google.com>, <frederic@kernel.org>, <vschneid@redhat.com>,
	<thiago.bauermann@linaro.org>, <joey.gouly@arm.com>,
	<liuyuntao12@huawei.com>, <leobras@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH -next v4 17/19] entry: Add syscall arch functions to use generic syscall for arm64
Date: Fri, 25 Oct 2024 18:06:58 +0800
Message-ID: <20241025100700.3714552-18-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025100700.3714552-1-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

Add some syscall arch functions to support arm64 to use generic syscall
code, which do not affect existing architectures that use generic entry:

 - arch_pre/post_report_syscall_entry/exit().

Also make syscall_exit_work() not static and move report_single_step() to
thread_info.h, which can be used by arm64 later.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h  |   1 +
 include/linux/thread_info.h   |  13 +++++
 kernel/entry/syscall-common.c | 100 ++++++++++++++++++++++++++++++----
 3 files changed, 103 insertions(+), 11 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 1ae3143d4b12..39a2d41af05e 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -178,4 +178,5 @@ void syscall_exit_to_user_mode_work(struct pt_regs *regs);
  */
 void syscall_exit_to_user_mode(struct pt_regs *regs);
 
+void syscall_exit_work(struct pt_regs *regs, unsigned long work);
 #endif
diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index 9ea0b28068f4..062de9666ef3 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -55,6 +55,19 @@ enum syscall_work_bit {
 #define SYSCALL_WORK_SYSCALL_AUDIT	BIT(SYSCALL_WORK_BIT_SYSCALL_AUDIT)
 #define SYSCALL_WORK_SYSCALL_USER_DISPATCH BIT(SYSCALL_WORK_BIT_SYSCALL_USER_DISPATCH)
 #define SYSCALL_WORK_SYSCALL_EXIT_TRAP	BIT(SYSCALL_WORK_BIT_SYSCALL_EXIT_TRAP)
+
+/*
+ * If SYSCALL_EMU is set, then the only reason to report is when
+ * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall
+ * instruction has been already reported in syscall_enter_from_user_mode().
+ */
+static inline bool report_single_step(unsigned long work)
+{
+	if (work & SYSCALL_WORK_SYSCALL_EMU)
+		return false;
+
+	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
+}
 #endif
 
 #include <asm/thread_info.h>
diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
index 0eb036986ad4..73f87d09e04e 100644
--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -17,6 +17,49 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
 	}
 }
 
+/**
+ * arch_pre_report_syscall_entry - Architecture specific work before
+ *				   report_syscall_entry().
+ *
+ * Invoked from syscall_trace_enter() to prepare for ptrace_report_syscall_entry().
+ * Defaults to NOP.
+ *
+ * The main purpose is for saving a general purpose register clobbered
+ * in the tracee.
+ */
+static inline unsigned long arch_pre_report_syscall_entry(struct pt_regs *regs);
+
+#ifndef arch_pre_report_syscall_entry
+static inline unsigned long arch_pre_report_syscall_entry(struct pt_regs *regs)
+{
+	return 0;
+}
+#endif
+
+/**
+ * arch_post_report_syscall_entry - Architecture specific work after
+ *			            report_syscall_entry().
+ *
+ * Invoked from syscall_trace_enter() after calling ptrace_report_syscall_entry().
+ * Defaults to NOP.
+ *
+ * The main purpose is for restoring a general purpose register clobbered
+ * in the trace saved in arch_pre_report_syscall_entry(), also it can
+ * do something arch-specific according to the return value of
+ * ptrace_report_syscall_entry().
+ */
+static inline void arch_post_report_syscall_entry(struct pt_regs *regs,
+						  unsigned long saved_reg,
+						  long ret);
+
+#ifndef arch_post_report_syscall_entry
+static inline void arch_post_report_syscall_entry(struct pt_regs *regs,
+						  unsigned long saved_reg,
+						  long ret)
+{
+}
+#endif
+
 long syscall_trace_enter(struct pt_regs *regs, long syscall,
 				unsigned long work)
 {
@@ -34,7 +77,9 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
 
 	/* Handle ptrace */
 	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
+		unsigned long saved_reg = arch_pre_report_syscall_entry(regs);
 		ret = ptrace_report_syscall_entry(regs);
+		arch_post_report_syscall_entry(regs, saved_reg, ret);
 		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
 			return -1L;
 	}
@@ -71,20 +116,50 @@ noinstr void syscall_enter_from_user_mode_prepare(struct pt_regs *regs)
 	instrumentation_end();
 }
 
-/*
- * If SYSCALL_EMU is set, then the only reason to report is when
- * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall
- * instruction has been already reported in syscall_enter_from_user_mode().
+/**
+ * arch_pre_report_syscall_exit - Architecture specific work before
+ *				  report_syscall_exit().
+ *
+ * Invoked from syscall_exit_work() to prepare for ptrace_report_syscall_exit().
+ * Defaults to NOP.
+ *
+ * The main purpose is for saving a general purpose register clobbered
+ * in the trace.
  */
-static inline bool report_single_step(unsigned long work)
-{
-	if (work & SYSCALL_WORK_SYSCALL_EMU)
-		return false;
+static inline unsigned long arch_pre_report_syscall_exit(struct pt_regs *regs,
+							     unsigned long work);
 
-	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
+#ifndef arch_pre_report_syscall_exit
+static inline unsigned long arch_pre_report_syscall_exit(struct pt_regs *regs,
+							     unsigned long work)
+{
+	return 0;
 }
+#endif
+
+/**
+ * arch_post_report_syscall_exit - Architecture specific work after
+ *			           report_syscall_exit().
+ *
+ * Invoked from syscall_exit_work() after calling ptrace_report_syscall_exit().
+ * Defaults to NOP.
+ *
+ * The main purpose is for restoring a general purpose register clobbered
+ * in the trace saved in arch_pre_report_syscall_exit().
+ */
+static inline void arch_post_report_syscall_exit(struct pt_regs *regs,
+						 unsigned long saved_reg,
+						 unsigned long work);
+
+#ifndef arch_post_report_syscall_exit
+static inline void arch_post_report_syscall_exit(struct pt_regs *regs,
+						 unsigned long saved_reg,
+						 unsigned long work)
+{
+}
+#endif
 
-static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
+void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 {
 	bool step;
 
@@ -107,8 +182,11 @@ static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
 	step = report_single_step(work);
-	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
+	if (step || work & SYSCALL_WORK_SYSCALL_TRACE) {
+		unsigned long saved_reg = arch_pre_report_syscall_exit(regs, work);
 		ptrace_report_syscall_exit(regs, step);
+		arch_post_report_syscall_exit(regs, saved_reg, work);
+	}
 }
 
 /*
-- 
2.34.1


