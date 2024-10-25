Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B3B9AFF98
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825847.1240242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFZ-0003KQ-7q; Fri, 25 Oct 2024 10:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825847.1240242; Fri, 25 Oct 2024 10:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFZ-0003Eb-1R; Fri, 25 Oct 2024 10:08:57 +0000
Received: by outflank-mailman (input) for mailman id 825847;
 Fri, 25 Oct 2024 10:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFW-0000tn-VE
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:08:54 +0000
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 218dac39-92b9-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 12:08:52 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XZdfx13mZz1HLR8;
 Fri, 25 Oct 2024 18:04:25 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 357351A0188;
 Fri, 25 Oct 2024 18:08:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:46 +0800
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
X-Inumbo-ID: 218dac39-92b9-11ef-99a3-01e77a169b0f
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
Subject: [PATCH -next v4 11/19] arm64: entry: Extract raw_irqentry_exit_cond_resched() function
Date: Fri, 25 Oct 2024 18:06:52 +0800
Message-ID: <20241025100700.3714552-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025100700.3714552-1-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

Extract the arm64 resched logic code to
raw_irqentry_exit_cond_resched() function, which makes the
code more clear when switch to generic entry.

No functional changes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/preempt.h |  1 +
 arch/arm64/kernel/entry-common.c | 17 ++++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 0159b625cc7f..d0f93385bd85 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -85,6 +85,7 @@ static inline bool should_resched(int preempt_offset)
 void preempt_schedule(void);
 void preempt_schedule_notrace(void);
 
+void raw_irqentry_exit_cond_resched(void);
 #ifdef CONFIG_PREEMPT_DYNAMIC
 
 DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 58d660878c09..5b7df53cfcf6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -95,6 +95,14 @@ static inline bool arm64_irqentry_exit_need_resched(void)
 	return true;
 }
 
+void raw_irqentry_exit_cond_resched(void)
+{
+	if (!preempt_count()) {
+		if (need_resched() && arm64_irqentry_exit_need_resched())
+			preempt_schedule_irq();
+	}
+}
+
 /*
  * Handle IRQ/context state management when exiting to kernel mode.
  * After this function returns it is not safe to call regular kernel code,
@@ -119,13 +127,8 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
 			return;
 		}
 
-		if (IS_ENABLED(CONFIG_PREEMPTION)) {
-			if (!preempt_count()) {
-				if (need_resched() &&
-				    arm64_irqentry_exit_need_resched())
-					preempt_schedule_irq();
-			}
-		}
+		if (IS_ENABLED(CONFIG_PREEMPTION))
+			raw_irqentry_exit_cond_resched();
 
 		trace_hardirqs_on();
 	} else {
-- 
2.34.1


