Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F55701020
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533908.830931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZyi-0004mx-UI; Fri, 12 May 2023 21:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533908.830931; Fri, 12 May 2023 21:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZyi-0004kf-QZ; Fri, 12 May 2023 21:07:04 +0000
Received: by outflank-mailman (input) for mailman id 533908;
 Fri, 12 May 2023 21:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZyg-0004FP-HK
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:02 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f00dd61b-f108-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 23:07:01 +0200 (CEST)
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
X-Inumbo-ID: f00dd61b-f108-11ed-b229-6b7b168915f2
Message-ID: <20230512205255.551974164@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=AjuZnUvqwfsid4jtivwVWrZiWUy0MGdS0WowlWq+wK8=;
	b=BSrk1PoZLCui388wbL4NkY9LaBfz+vMljVOsc8GC5TTSN9IaN934ZXN1fRPgPIUcdUGSe3
	rs+LcXmfTyJYvxvJjsFf8f0ApOwip1PicNa981xcjH4MKVqkoKpyzlxwwHOYcfLC+B5mEd
	7Y+gbMD+piaijvIlyMzYPyuPxHohAIb3XSFige4l+xuoi82leA8PAeQ31hGSlVRwPD+wQ3
	n6n4pYD7mFa1Y0Rsvl1DCfEMOgpANdQ/E16QD6t2Dh7pRICCqjhN/gPgPrM+fPp2Si/ih2
	sU+p5Egl9N/3D2qoNiCRvjAFt/X3L02D3fNEkcYdWn40i1TAkciD/voa8T04sQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=AjuZnUvqwfsid4jtivwVWrZiWUy0MGdS0WowlWq+wK8=;
	b=n1wnoGuKdWFqJ6PX+VgQN0Ufd6Syw8of6US1WCmh8XhXmEUBV6cIJXGutet95c8P750ccR
	/kEaioxsm/Oq80Bw==
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
Subject: [patch V4 02/37] cpu/hotplug: Mark arch_disable_smp_support() and
 bringup_nonboot_cpus() __init
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:00 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

No point in keeping them around.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
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
@@ -892,7 +892,7 @@ EXPORT_SYMBOL(setup_max_cpus);
  * SMP mode to <NUM>.
  */
 
-void __weak arch_disable_smp_support(void) { }
+void __weak __init arch_disable_smp_support(void) { }
 
 static int __init nosmp(char *str)
 {




