Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5B56E2D2C
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521277.809870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5u-0005tk-NG; Fri, 14 Apr 2023 23:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521277.809870; Fri, 14 Apr 2023 23:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5u-0005cc-5x; Fri, 14 Apr 2023 23:44:42 +0000
Received: by outflank-mailman (input) for mailman id 521277;
 Fri, 14 Apr 2023 23:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT5r-0001Th-1T
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:44:39 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51b6e0db-db1e-11ed-b21e-6b7b168915f2;
 Sat, 15 Apr 2023 01:44:38 +0200 (CEST)
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
X-Inumbo-ID: 51b6e0db-db1e-11ed-b21e-6b7b168915f2
Message-ID: <20230414232310.133063984@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=IXf0ZnAk7Rjoer1aZheyf4W/cuBQpAE5Qx39Wnoq+gw=;
	b=tCHY6jxHe44QdTi6vocnhUhZC/Sr8ssG31Dn8gwv5SQPDPmECHh8SvAHIYmNtqHfMlkDjb
	5z/JlKFS3jn11K/mH/g/+Ow73N4W+vlAAEOR14IBfVSLYSUt09dUYIaE4ilEgx1gRiYou/
	NJW3slP7Xaephbtnct1+NjMkcY39oSmvHRscafuLnWIYw0ZXn5+nds4CQ9+gIajjenAhxm
	MpSUlozCRJ6mr8ZNsIclfZsK1CWaX+//qVVkJTb566EfkmD5lkZR5KlXMt2cJLL6tWRV4l
	KlYtfdAt7sssM4QTlY+1m/BpDXqcWMvO6p1Ofmu+gKrgTD9Ra18H8OqOESasOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=IXf0ZnAk7Rjoer1aZheyf4W/cuBQpAE5Qx39Wnoq+gw=;
	b=ZRExhqz5gVYg/2ZXmu04kZ6TddbP4xfwFZiD+kT/UslGyVveAnCubA4h2r17G4cgTnxl1O
	+W+htaNbUUPcKRAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 "Arjan van de Veen" <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
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
 Sabin Rapan <sabrapan@amazon.com>
Subject: [patch 15/37] x86/smpboot: Remove wait for cpu_online()
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:44:37 +0200 (CEST)

Now that the core code drops sparse_irq_lock after the idle thread
synchronized, it's pointless to wait for the AP to mark itself online.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c |   25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1110,20 +1110,6 @@ static int wait_cpu_initialized(unsigned
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
@@ -1170,16 +1156,9 @@ int native_cpu_up(unsigned int cpu, stru
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


