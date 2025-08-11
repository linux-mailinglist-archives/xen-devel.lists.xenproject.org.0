Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AADAEB210BB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 18:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077812.1438845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUz5-000170-Nm; Mon, 11 Aug 2025 16:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077812.1438845; Mon, 11 Aug 2025 16:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUz5-00015Y-Kf; Mon, 11 Aug 2025 16:02:51 +0000
Received: by outflank-mailman (input) for mailman id 1077812;
 Mon, 11 Aug 2025 16:02:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhKo=2X=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ulUz4-0000Eb-Gs
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 16:02:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a0f36c03-76cc-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 18:02:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC053266C;
 Mon, 11 Aug 2025 09:02:40 -0700 (PDT)
Received: from [10.1.28.163] (e137867.arm.com [10.1.28.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCB213F738;
 Mon, 11 Aug 2025 09:02:44 -0700 (PDT)
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
X-Inumbo-ID: a0f36c03-76cc-11f0-a325-13f23c93f187
Message-ID: <4242ef37-efeb-446f-abbc-0104b805ad12@arm.com>
Date: Mon, 11 Aug 2025 17:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
 sstabellini@kernel.org, mark.rutland@arm.com, puranjay@kernel.org,
 broonie@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 akpm@linux-foundation.org, chenl311@chinatelecom.cn,
 anshuman.khandual@arm.com, kristina.martsenko@arm.com,
 liaochang1@huawei.com, ardb@kernel.org, leitao@debian.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/07/2025 02:54, Jinjie Ruan wrote:

> ARM64 requires an additional check whether to reschedule on return
> from interrupt. So add arch_irqentry_exit_need_resched() as the default
> NOP implementation and hook it up into the need_resched() condition in
> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
> the architecture specific version for switching over to
> the generic entry code.
>
> To align the structure of the code with irqentry_exit_cond_resched()
> from the generic entry code, hoist the need_irq_preemption()
> and IS_ENABLED() check earlier. And different preemption check functions
> are defined based on whether dynamic preemption is enabled.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Unrelated to the other thread : I noticed that compiling this patch
with `allnoconfig` would fail :
- `raw_irqentry_exit_cond_resched` has no previous prototype,
   as it is defined within `#ifdef CONFIG_PREEMPTION`
- `irqentry_exit_cond_resched()` is not declared, as it is also within
   `#ifdef CONFIG_PREEMPTION`

The patch below fixes the issue, but introduces merge conflicts in
patches 6 and 7, plus the `#ifdef` needs to be moved accordingly
in patch 6 and the empty "without preemption" `irq_exit_cond_resched()`
needs to be removed in patch 7.

I hope this can be useful,
Ada

---
diff --git a/arch/arm64/include/asm/preempt.h 
b/arch/arm64/include/asm/preempt.h
index 0f0ba250efe8..d9aba8b1e466 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -103,6 +103,8 @@ void dynamic_irqentry_exit_cond_resched(void);
  #define irqentry_exit_cond_resched() raw_irqentry_exit_cond_resched()

  #endif /* CONFIG_PREEMPT_DYNAMIC */
+#else /* CONFIG_PREEMPTION */
+#define irqentry_exit_cond_resched() {}
  #endif /* CONFIG_PREEMPTION */

  #endif /* __ASM_PREEMPT_H */
diff --git a/arch/arm64/kernel/entry-common.c 
b/arch/arm64/kernel/entry-common.c
index 4f92664fd46c..abd7a315145e 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -661,6 +661,7 @@ static __always_inline void __el1_pnmi(struct 
pt_regs *regs,
         arm64_exit_nmi(regs, state);
  }

+#ifdef CONFIG_PREEMPTION
  void raw_irqentry_exit_cond_resched(void)
  {
         if (!preempt_count()) {
@@ -668,6 +669,7 @@ void raw_irqentry_exit_cond_resched(void)
                         preempt_schedule_irq();
         }
  }
+#endif

  #ifdef CONFIG_PREEMPT_DYNAMIC
  DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);


