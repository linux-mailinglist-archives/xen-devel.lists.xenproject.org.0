Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415959AFF95
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825843.1240196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFT-0001po-J0; Fri, 25 Oct 2024 10:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825843.1240196; Fri, 25 Oct 2024 10:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFT-0001kX-8L; Fri, 25 Oct 2024 10:08:51 +0000
Received: by outflank-mailman (input) for mailman id 825843;
 Fri, 25 Oct 2024 10:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFR-00014t-4N
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:08:49 +0000
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bd04400-92b9-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 12:08:47 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XZdk82QfKz1SDBV;
 Fri, 25 Oct 2024 18:07:12 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 94CA51401F1;
 Fri, 25 Oct 2024 18:08:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:37 +0800
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
X-Inumbo-ID: 1bd04400-92b9-11ef-a0bf-8be0dac302b0
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
Subject: [PATCH -next v4 04/19] arm64: entry: Remove __enter_from_kernel_mode()
Date: Fri, 25 Oct 2024 18:06:45 +0800
Message-ID: <20241025100700.3714552-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025100700.3714552-1-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

The __enter_from_kernel_mode() is only called by enter_from_kernel_mode(),
remove it.

No functional changes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/entry-common.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index ccf59b44464d..a7fd4d6c7650 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -36,7 +36,7 @@
  * This is intended to match the logic in irqentry_enter(), handling the kernel
  * mode transitions only.
  */
-static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
+static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
@@ -55,13 +55,6 @@ static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs
 	rcu_irq_enter_check_tick();
 	trace_hardirqs_off_finish();
 
-	return ret;
-}
-
-static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
-{
-	irqentry_state_t ret = __enter_from_kernel_mode(regs);
-
 	mte_check_tfsr_entry();
 	mte_disable_tco_entry(current);
 
-- 
2.34.1


