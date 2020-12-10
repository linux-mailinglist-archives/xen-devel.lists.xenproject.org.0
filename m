Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCDF2D6862
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 21:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49892.88235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knSLF-0005uI-PI; Thu, 10 Dec 2020 20:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49892.88235; Thu, 10 Dec 2020 20:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knSLF-0005tt-LV; Thu, 10 Dec 2020 20:15:09 +0000
Received: by outflank-mailman (input) for mailman id 49892;
 Thu, 10 Dec 2020 20:15:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knSLE-0005to-98
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 20:15:08 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9159a3dc-e05a-453b-a281-4af17579fb37;
 Thu, 10 Dec 2020 20:15:07 +0000 (UTC)
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
X-Inumbo-ID: 9159a3dc-e05a-453b-a281-4af17579fb37
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607631305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fN5ChdPk6fH90ggZf7w1lWtyXdKRHqfW7WHc/pgsVs=;
	b=ckiewzsMmQUlBqMXgP4UCM+Np8mVHkkyuYZ55dFWcuWlHfyz/tgDeQPN8gOJwL71KCuDFp
	bTEV0UcVcW+THBv5y7dJyw0M+kQ1Riyvqn9OxQr3zwaLOv+uShsKUCjirolVbrlSa85oom
	iI6uU+J4mWFPa2hGzIZEAOuKh5iN+4FzvPkGUwZRJzd2A30gZdT6pTvBYw/wj4wJvz45Q9
	4xL68/ICbZjy5ErILON+zndUZYGmqVaFb9ADzRqHWrpdGoR4T6W0smF9rTYGSgd1QHwNu0
	XdkbiN6hBQ7XZ7qyI/o8e/Rwir0XY//nkekRFelqXb/XKTsF4qfFyF4RODMkvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607631305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fN5ChdPk6fH90ggZf7w1lWtyXdKRHqfW7WHc/pgsVs=;
	b=7Sv15HRz9k3S0goiNVwWDAqqbLafPJHvp7i7jT+K4bNnOThCzVhK/tC1gQGefAlx4Qus9O
	sPKSDB0EOeG3wDBg==
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, luto@kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>, "VMware\, Inc." <pv-drivers@vmware.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: x86/ioapic: Cleanup the timer_works() irqflags mess
In-Reply-To: <20201210111008.GB88655@C02TD0UTHF1T.local>
References: <20201120114630.13552-1-jgross@suse.com> <20201120114630.13552-6-jgross@suse.com> <20201120115943.GD3021@hirez.programming.kicks-ass.net> <20201209181514.GA14235@C02TD0UTHF1T.local> <87tusuzu71.fsf@nanos.tec.linutronix.de> <20201210111008.GB88655@C02TD0UTHF1T.local>
Date: Thu, 10 Dec 2020 21:15:04 +0100
Message-ID: <87k0tpju47.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

Mark tripped over the creative irqflags handling in the IO-APIC timer
delivery check which ends up doing:

        local_irq_save(flags);
	local_irq_enable();
        local_irq_restore(flags);

which triggered a new consistency check he's working on required for
replacing the POPF based restore with a conditional STI.

That code is a historical mess and none of this is needed. Make it
straightforward use local_irq_disable()/enable() as that's all what is
required. It is invoked from interrupt enabled code nowadays.

Reported-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/x86/kernel/apic/io_apic.c |   22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -1618,21 +1618,16 @@ static void __init delay_without_tsc(voi
 static int __init timer_irq_works(void)
 {
 	unsigned long t1 = jiffies;
-	unsigned long flags;
 
 	if (no_timer_check)
 		return 1;
 
-	local_save_flags(flags);
 	local_irq_enable();
-
 	if (boot_cpu_has(X86_FEATURE_TSC))
 		delay_with_tsc();
 	else
 		delay_without_tsc();
 
-	local_irq_restore(flags);
-
 	/*
 	 * Expect a few ticks at least, to be sure some possible
 	 * glue logic does not lock up after one or two first
@@ -1641,10 +1636,10 @@ static int __init timer_irq_works(void)
 	 * least one tick may be lost due to delays.
 	 */
 
-	/* jiffies wrap? */
-	if (time_after(jiffies, t1 + 4))
-		return 1;
-	return 0;
+	local_irq_disable();
+
+	/* Did jiffies advance? */
+	return time_after(jiffies, t1 + 4);
 }
 
 /*
@@ -2117,13 +2112,12 @@ static inline void __init check_timer(vo
 	struct irq_cfg *cfg = irqd_cfg(irq_data);
 	int node = cpu_to_node(0);
 	int apic1, pin1, apic2, pin2;
-	unsigned long flags;
 	int no_pin1 = 0;
 
 	if (!global_clock_event)
 		return;
 
-	local_irq_save(flags);
+	local_irq_disable();
 
 	/*
 	 * get/set the timer IRQ vector:
@@ -2191,7 +2185,6 @@ static inline void __init check_timer(vo
 			goto out;
 		}
 		panic_if_irq_remap("timer doesn't work through Interrupt-remapped IO-APIC");
-		local_irq_disable();
 		clear_IO_APIC_pin(apic1, pin1);
 		if (!no_pin1)
 			apic_printk(APIC_QUIET, KERN_ERR "..MP-BIOS bug: "
@@ -2215,7 +2208,6 @@ static inline void __init check_timer(vo
 		/*
 		 * Cleanup, just in case ...
 		 */
-		local_irq_disable();
 		legacy_pic->mask(0);
 		clear_IO_APIC_pin(apic2, pin2);
 		apic_printk(APIC_QUIET, KERN_INFO "....... failed.\n");
@@ -2232,7 +2224,6 @@ static inline void __init check_timer(vo
 		apic_printk(APIC_QUIET, KERN_INFO "..... works.\n");
 		goto out;
 	}
-	local_irq_disable();
 	legacy_pic->mask(0);
 	apic_write(APIC_LVT0, APIC_LVT_MASKED | APIC_DM_FIXED | cfg->vector);
 	apic_printk(APIC_QUIET, KERN_INFO "..... failed.\n");
@@ -2251,7 +2242,6 @@ static inline void __init check_timer(vo
 		apic_printk(APIC_QUIET, KERN_INFO "..... works.\n");
 		goto out;
 	}
-	local_irq_disable();
 	apic_printk(APIC_QUIET, KERN_INFO "..... failed :(.\n");
 	if (apic_is_x2apic_enabled())
 		apic_printk(APIC_QUIET, KERN_INFO
@@ -2260,7 +2250,7 @@ static inline void __init check_timer(vo
 	panic("IO-APIC + timer doesn't work!  Boot with apic=debug and send a "
 		"report.  Then try booting with the 'noapic' option.\n");
 out:
-	local_irq_restore(flags);
+	local_irq_enable();
 }
 
 /*

