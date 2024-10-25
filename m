Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1408F9AFF9F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825840.1240165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFQ-0001Cf-Dg; Fri, 25 Oct 2024 10:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825840.1240165; Fri, 25 Oct 2024 10:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFQ-00012d-9m; Fri, 25 Oct 2024 10:08:48 +0000
Received: by outflank-mailman (input) for mailman id 825840;
 Fri, 25 Oct 2024 10:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFP-0000tn-FC
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:08:47 +0000
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c286c7a-92b9-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 12:08:44 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XZdkB3WLkz1jvxM;
 Fri, 25 Oct 2024 18:07:14 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id F313F180043;
 Fri, 25 Oct 2024 18:08:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:38 +0800
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
X-Inumbo-ID: 1c286c7a-92b9-11ef-99a3-01e77a169b0f
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
Subject: [PATCH -next v4 05/19] arm64: entry: Remove __exit_to_kernel_mode()
Date: Fri, 25 Oct 2024 18:06:46 +0800
Message-ID: <20241025100700.3714552-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025100700.3714552-1-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

__exit_to_kernel_mode() is only called by exit_to_kernel_mode(),
remove it.

No functional changes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/entry-common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index a7fd4d6c7650..137481a3f0fa 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -69,9 +69,11 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
  * This is intended to match the logic in irqentry_exit(), handling the kernel
  * mode transitions only, and with preemption handled elsewhere.
  */
-static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
-						  irqentry_state_t state)
+static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
+					irqentry_state_t state)
 {
+	mte_check_tfsr_exit();
+
 	lockdep_assert_irqs_disabled();
 
 	if (!regs_irqs_disabled(regs)) {
@@ -90,13 +92,6 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
 	}
 }
 
-static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
-					irqentry_state_t state)
-{
-	mte_check_tfsr_exit();
-	__exit_to_kernel_mode(regs, state);
-}
-
 /*
  * Handle IRQ/context state management when entering from user mode.
  * Before this function is called it is not safe to call regular kernel code,
-- 
2.34.1


