Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E09AFFA2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825849.1240257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFb-0003fP-17; Fri, 25 Oct 2024 10:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825849.1240257; Fri, 25 Oct 2024 10:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFa-0003ZK-M3; Fri, 25 Oct 2024 10:08:58 +0000
Received: by outflank-mailman (input) for mailman id 825849;
 Fri, 25 Oct 2024 10:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFY-0000tn-IK
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:08:56 +0000
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20c9c2bd-92b9-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 12:08:54 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XZdkw6p65z20qy6;
 Fri, 25 Oct 2024 18:07:52 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id CD2451401F1;
 Fri, 25 Oct 2024 18:08:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:45 +0800
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
X-Inumbo-ID: 20c9c2bd-92b9-11ef-99a3-01e77a169b0f
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
Subject: [PATCH -next v4 10/19] arm64: entry: preempt_schedule_irq() only if PREEMPTION enabled
Date: Fri, 25 Oct 2024 18:06:51 +0800
Message-ID: <20241025100700.3714552-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025100700.3714552-1-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

Whether PREEMPT_DYNAMIC enabled or not, PREEMPTION should
be enabled to allow reschedule after an interrupt.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/entry-common.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 3ea3ab32d232..58d660878c09 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -65,8 +65,6 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
 DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
 #define need_irq_preemption() \
 	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
-#else
-#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
 #endif
 
 static inline bool arm64_irqentry_exit_need_resched(void)
@@ -121,9 +119,12 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
 			return;
 		}
 
-		if (!preempt_count()) {
-			if (need_resched() && arm64_irqentry_exit_need_resched())
-				preempt_schedule_irq();
+		if (IS_ENABLED(CONFIG_PREEMPTION)) {
+			if (!preempt_count()) {
+				if (need_resched() &&
+				    arm64_irqentry_exit_need_resched())
+					preempt_schedule_irq();
+			}
 		}
 
 		trace_hardirqs_on();
-- 
2.34.1


