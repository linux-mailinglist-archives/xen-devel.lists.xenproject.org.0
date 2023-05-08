Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FA46FB711
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 21:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531761.827648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6m3-0000uN-1z; Mon, 08 May 2023 19:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531761.827648; Mon, 08 May 2023 19:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6m2-0000fj-Mi; Mon, 08 May 2023 19:43:54 +0000
Received: by outflank-mailman (input) for mailman id 531761;
 Mon, 08 May 2023 19:43:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49Re=A5=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pw6m0-0004GB-BN
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 19:43:52 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b44ada-edd8-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 21:43:51 +0200 (CEST)
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
X-Inumbo-ID: a8b44ada-edd8-11ed-b226-6b7b168915f2
Message-ID: <20230508185218.070008578@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DpwezFnftgf/NwnjaJYg18wbFoZRAK6UuAmlsWmBJR4=;
	b=i1TFZjgCtddkAakfxkISXw55XmrEJvUVPuQTFOFgS+oTTKVcNGhuqDExhfxWr3kSGXHZ9h
	Q+ujpZNUZEK3gioXPoyRZ+NzfuV4aL+sQupa7bIw509g00exAtAYyYGseE5+d40Ye/9iSn
	kyYz5rdl/ounEY4O9wO7ubw04Cyxxy6DTnoJB2oO2RietlbB/OitKYLkOQ8iHZAyHbfy1W
	bv+Q2OEIWcacTVCd+tTm0xqwTwSoZ8e7RLxQJArbSe8S99eF/7jfVItjSmrC275mG9pAip
	lscg+orwTig3a1iTNLS2jmVzL558VHIKrCz5q1WCRCIfLCf1r3Xa3vOeSE+ulQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DpwezFnftgf/NwnjaJYg18wbFoZRAK6UuAmlsWmBJR4=;
	b=p4MipbJWjxb6AbwUz07UF9If0ACyXBwES1Mx0lUk9qi+e9Q63raPnhjjqmne+YvfK1SUP6
	eRiNkcZ4g3zeVxBg==
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
Subject: [patch v3 15/36] x86/smpboot: Remove wait for cpu_online()
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  8 May 2023 21:43:51 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Now that the core code drops sparse_irq_lock after the idle thread
synchronized, it's pointless to wait for the AP to mark itself online.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 arch/x86/kernel/smpboot.c |   26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)
---

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -281,7 +281,6 @@ static void notrace start_secondary(void
 	 * half valid vector space.
 	 */
 	lock_vector_lock();
-	/* Sync point with do_wait_cpu_online() */
 	set_cpu_online(smp_processor_id(), true);
 	lapic_online();
 	unlock_vector_lock();
@@ -1110,20 +1109,6 @@ static int wait_cpu_initialized(unsigned
 	return 0;
 }
 
-/*
- * Bringup step three: Wait for the target AP to reach set_cpu_online() in
- * start_secondary().
- */
-static void wait_cpu_online(unsigned int cpu)
-{
-	/*
-	 * Wait for the AP to mark itself online, so the core caller
-	 * can drop sparse_irq_lock.
-	 */
-	while (!cpu_online(cpu))
-		schedule();
-}
-
 static int native_kick_ap(unsigned int cpu, struct task_struct *tidle)
 {
 	int apicid = apic->cpu_present_to_apicid(cpu);
@@ -1170,16 +1155,9 @@ int native_cpu_up(unsigned int cpu, stru
 	int ret;
 
 	ret = native_kick_ap(cpu, tidle);
-	if (ret)
-		goto out;
-
-	ret = wait_cpu_initialized(cpu);
-	if (ret)
-		goto out;
-
-	wait_cpu_online(cpu);
+	if (!ret)
+		ret = wait_cpu_initialized(cpu);
 
-out:
 	/* Cleanup possible dangling ends... */
 	if (x86_platform.legacy.warm_reset)
 		smpboot_restore_warm_reset_vector();



