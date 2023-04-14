Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF76E2D1F
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521263.809747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5Z-0001VJ-67; Fri, 14 Apr 2023 23:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521263.809747; Fri, 14 Apr 2023 23:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5Z-0001TX-3L; Fri, 14 Apr 2023 23:44:21 +0000
Received: by outflank-mailman (input) for mailman id 521263;
 Fri, 14 Apr 2023 23:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT5X-0000zb-EL
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:44:19 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44f6ddd0-db1e-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 01:44:17 +0200 (CEST)
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
X-Inumbo-ID: 44f6ddd0-db1e-11ed-8611-37d641c3527e
Message-ID: <20230414232309.323016954@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=sDTci1v+H+1hOBnO3MWKNQ4KSM/+mxYEdJGIWDEKpYw=;
	b=y8O+iHOImdrEQNmtF7SapUaot3V0yy8b8Ub9SUl+OgGsTaIJZhbZjtiR4PN4V5WCNemOca
	Ob8ttIQs2lYzofVI5dy3T9RFKAux9iKX/Rkv+VPjfOqV4T6XWGHXuY9IFhwqlXBTVc5Nsl
	KK4n8ce7YmA5TsutXdcfdM52VSR98OW8mCNQWFGg6cY3Yq6KC99p69q2+p9erXW8Qg/qAb
	ceQeWzd0QJGBxdpwT1wRPfHvVdxLxyyhgH/r2Dl9U2nA2Jo/APevn/jIIjbNa3EFkc7Pxb
	zX0dOALraGxj/DlefvHJr1NZVmMqpk/+HdfNk32Kc/stZp2q/WmPtDMIe6OaIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=sDTci1v+H+1hOBnO3MWKNQ4KSM/+mxYEdJGIWDEKpYw=;
	b=HMWjVuC1heTl6ACr7VnRkYnxnf9HNU4lYZlkNOeO1jQ9uLiC6+ocCzTSyzyWZjYVjiCgZf
	cRj6X0w+T3BbGTBA==
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
Subject: [patch 02/37] cpu/hotplug: Mark arch_disable_smp_support() and
 bringup_nonboot_cpus() __init
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:44:16 +0200 (CEST)

No point in keeping them around.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c |    4 ++--
 kernel/cpu.c              |    2 +-
 kernel/smp.c              |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1269,9 +1269,9 @@ int native_cpu_up(unsigned int cpu, stru
 }
 
 /**
- * arch_disable_smp_support() - disables SMP support for x86 at runtime
+ * arch_disable_smp_support() - Disables SMP support for x86 at boottime
  */
-void arch_disable_smp_support(void)
+void __init arch_disable_smp_support(void)
 {
 	disable_ioapic_support();
 }
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1502,7 +1502,7 @@ int bringup_hibernate_cpu(unsigned int s
 	return 0;
 }
 
-void bringup_nonboot_cpus(unsigned int setup_max_cpus)
+void __init bringup_nonboot_cpus(unsigned int setup_max_cpus)
 {
 	unsigned int cpu;
 
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -1051,7 +1051,7 @@ EXPORT_SYMBOL(setup_max_cpus);
  * SMP mode to <NUM>.
  */
 
-void __weak arch_disable_smp_support(void) { }
+void __weak __init arch_disable_smp_support(void) { }
 
 static int __init nosmp(char *str)
 {


