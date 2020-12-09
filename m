Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D322D4984
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 19:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48656.86061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4bf-0005dn-Q5; Wed, 09 Dec 2020 18:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48656.86061; Wed, 09 Dec 2020 18:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4bf-0005dO-MV; Wed, 09 Dec 2020 18:54:31 +0000
Received: by outflank-mailman (input) for mailman id 48656;
 Wed, 09 Dec 2020 18:54:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1wO=FN=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kn4bd-0005dJ-TQ
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 18:54:30 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d4e0494-9fb1-4078-a985-d76a7190c2f8;
 Wed, 09 Dec 2020 18:54:28 +0000 (UTC)
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
X-Inumbo-ID: 9d4e0494-9fb1-4078-a985-d76a7190c2f8
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607540067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Uu7pkTsDY6PR0uRw8JT+RVlLSz62Q8pgzg6y5Vv+F8=;
	b=ZKyRHF02e6C/n1mUBKn5ZR+XVl6dDjKmAKKg5N6crtAg3HJ2EOJsCCYkTM8vHNeLb8e1EE
	woT+FRsq9wRBfKR1H/jU/h5ITtu8upRL+qht0KlSG2FPcGkAH50CYTjWzYIsGM1MBx+iWY
	ZvsmEPNQYKrYuTvetq+cnT9AM+zSzfv26zNUDqMcYYy5Az+ooZ8kxUTRgcQxFQ6FrUZZA7
	tY++O41Ru5wCUH11xGUu3nNNoe1jAmst2c8vb9fs1ROv5DpuiAJAfEGvFi7t2m4iBw9m+F
	U7kRP7HRP7vVZzw7D+fjTVnk7dQ2NJnIZPMHxtpdBE5YJPwHXnrxOYNyE+5jUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607540067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Uu7pkTsDY6PR0uRw8JT+RVlLSz62Q8pgzg6y5Vv+F8=;
	b=c0VvWr+XQ1eFIDzaipp+m6QkbNpqK8MTFWzd5nGNoue3bmiiBo/fQBptKc2vv17Tly9FpG
	ckQTiaR3Qc/ZrSAA==
To: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, luto@kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>, "VMware\, Inc." <pv-drivers@vmware.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use popf
In-Reply-To: <20201209181514.GA14235@C02TD0UTHF1T.local>
References: <20201120114630.13552-1-jgross@suse.com> <20201120114630.13552-6-jgross@suse.com> <20201120115943.GD3021@hirez.programming.kicks-ass.net> <20201209181514.GA14235@C02TD0UTHF1T.local>
Date: Wed, 09 Dec 2020 19:54:26 +0100
Message-ID: <87tusuzu71.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Dec 09 2020 at 18:15, Mark Rutland wrote:
> In arch/x86/kernel/apic/io_apic.c's timer_irq_works() we do:
>
> 	local_irq_save(flags);
> 	local_irq_enable();
>
> 	[ trigger an IRQ here ]
>
> 	local_irq_restore(flags);
>
> ... and in check_timer() we call that a number of times after either a
> local_irq_save() or local_irq_disable(), eventually trailing with a
> local_irq_disable() that will balance things up before calling
> local_irq_restore().
>
> I guess that timer_irq_works() should instead do:
>
> 	local_irq_save(flags);
> 	local_irq_enable();
> 	...
> 	local_irq_disable();
> 	local_irq_restore(flags);
>
> ... assuming we consider that legitimate?

Nah. That's old and insane gunk.

Thanks,

        tglx
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

