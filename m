Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD456F725A
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529899.824947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueDh-00088a-40; Thu, 04 May 2023 19:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529899.824947; Thu, 04 May 2023 19:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueDg-0007u5-LA; Thu, 04 May 2023 19:02:24 +0000
Received: by outflank-mailman (input) for mailman id 529899;
 Thu, 04 May 2023 19:02:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srgM=AZ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pueDe-00042j-9G
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:02:22 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32e2137c-eaae-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:02:21 +0200 (CEST)
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
X-Inumbo-ID: 32e2137c-eaae-11ed-b226-6b7b168915f2
Message-ID: <20230504185937.088861348@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=waR3DpyQ6DyvK8jEESlEb5rxqBYC2I7FeZ3H8ZtIrVQ=;
	b=HKYLcl9cklgr6YO5/NspFjC+D2CCt/ZYWzxxiOOGuCX7u/7IGOq81DQhVq9PvbBHY6Kpcr
	SxWHo0Ub70GUTAFkoXjKOB1ZyWdtlCAv2pBsav0oFkFgcMqJgiDoblcu2Hnt6D2hLbDJE7
	kec7wtFBfE1xoWI2cME3sJv8K73WrIvhYqzB8k1hCePY7f28tWiYPkzCL3lKJ1aAZjMvt+
	kXyU82XPa0OHMGsQ8hlC+TxCd6BOdr1gglOHT1fZhwBJGZCjFBU2Yxs7+XALa+aaWrMaCV
	mvw2zjNCImLQQhSEXScVL50CeJT6NF1GH6WIuPs8AGymg+ULRPU3wowu71D4Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=waR3DpyQ6DyvK8jEESlEb5rxqBYC2I7FeZ3H8ZtIrVQ=;
	b=XDnjEy7a3qUl/tWMxBUIj3PidEk2DRdxC5hulFnew5UcHpu5yRDRS/g5aolbe6p1RMLJCX
	rQwCSliTpoNYDfAw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject:
 [patch V2 14/38] cpu/hotplug: Rework sparse_irq locking in bringup_cpu()
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu,  4 May 2023 21:02:21 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

There is no harm to hold sparse_irq lock until the upcoming CPU completes
in cpuhp_online_idle(). This allows to remove cpu_online() synchronization
from architecture code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/cpu.c |   28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)
---
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -558,7 +558,7 @@ static int cpuhp_kick_ap(int cpu, struct
 	return ret;
 }
 
-static int bringup_wait_for_ap(unsigned int cpu)
+static int bringup_wait_for_ap_online(unsigned int cpu)
 {
 	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
 
@@ -579,15 +579,12 @@ static int bringup_wait_for_ap(unsigned
 	 */
 	if (!cpu_smt_allowed(cpu))
 		return -ECANCELED;
-
-	if (st->target <= CPUHP_AP_ONLINE_IDLE)
-		return 0;
-
-	return cpuhp_kick_ap(cpu, st, st->target);
+	return 0;
 }
 
 static int bringup_cpu(unsigned int cpu)
 {
+	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
 	struct task_struct *idle = idle_thread_get(cpu);
 	int ret;
 
@@ -606,10 +603,23 @@ static int bringup_cpu(unsigned int cpu)
 
 	/* Arch-specific enabling code. */
 	ret = __cpu_up(cpu, idle);
-	irq_unlock_sparse();
 	if (ret)
-		return ret;
-	return bringup_wait_for_ap(cpu);
+		goto out_unlock;
+
+	ret = bringup_wait_for_ap_online(cpu);
+	if (ret)
+		goto out_unlock;
+
+	irq_unlock_sparse();
+
+	if (st->target <= CPUHP_AP_ONLINE_IDLE)
+		return 0;
+
+	return cpuhp_kick_ap(cpu, st, st->target);
+
+out_unlock:
+	irq_unlock_sparse();
+	return ret;
 }
 
 static int finish_cpu(unsigned int cpu)


