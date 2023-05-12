Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD65701041
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533929.831072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZz7-00027X-7l; Fri, 12 May 2023 21:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533929.831072; Fri, 12 May 2023 21:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZz6-00022F-WD; Fri, 12 May 2023 21:07:29 +0000
Received: by outflank-mailman (input) for mailman id 533929;
 Fri, 12 May 2023 21:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZz5-0004F7-DF
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:27 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe84adb9-f108-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 23:07:25 +0200 (CEST)
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
X-Inumbo-ID: fe84adb9-f108-11ed-8611-37d641c3527e
Message-ID: <20230512205256.369512093@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PMK22/HxoxSZKsTx+MtkiiSihvL00YPGs/TFPEL6TlU=;
	b=okTigxEmoNFjuISzZ3w6/Y2KcJueXtK98ysR49cIhhmzWitrnTsrr30PPjCUMPXry4xftP
	J52lH1DVgnpuG/Rfq4wLyAmr6aBgTzg3Kcpzk53VYvl1lEluUMhVlu3W9w3D8aZ28W1fnU
	FYwd2Sfv1zxIrxvZkgBRqufQ3iNj4eO+ry/ohM+Ld/vwoFregiASpdqfC0/pYtJYsd1OgL
	Vlb3BzT7+3vJnR5zuW45X4PcDsWr4so0XRPW7RLUs94CbintoxNd6G1JVdbZNrIt24RqAz
	6rW20AhO6LWDKJUuEPLhETfdZ7aGAlZBRDu8S8t35nsN64xoJdMY+fi5MrLE5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PMK22/HxoxSZKsTx+MtkiiSihvL00YPGs/TFPEL6TlU=;
	b=6Ab3fDB1sVd28x5lyL9nkWKGbymDr5R+6KRuErqPsWXwifdYJwrujMAzLpyfU/ZQhUUikY
	XNL6casob2M1EbBA==
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
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>
Subject: [patch V4 17/37] x86/xen/smp_pv: Remove wait for CPU online
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:24 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Now that the core code drops sparse_irq_lock after the idle thread
synchronized, it's pointless to wait for the AP to mark itself online.

Whether the control CPU runs in a wait loop or sleeps in the core code
waiting for the online operation to complete makes no difference.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/xen/smp_pv.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)


--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -340,11 +340,11 @@ static int xen_pv_cpu_up(unsigned int cp
 
 	xen_pmu_init(cpu);
 
-	rc = HYPERVISOR_vcpu_op(VCPUOP_up, xen_vcpu_nr(cpu), NULL);
-	BUG_ON(rc);
-
-	while (cpu_report_state(cpu) != CPU_ONLINE)
-		HYPERVISOR_sched_op(SCHEDOP_yield, NULL);
+	/*
+	 * Why is this a BUG? If the hypercall fails then everything can be
+	 * rolled back, no?
+	 */
+	BUG_ON(HYPERVISOR_vcpu_op(VCPUOP_up, xen_vcpu_nr(cpu), NULL));
 
 	return 0;
 }




