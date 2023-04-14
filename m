Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F756E2D18
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521268.809798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5h-0002xf-3e; Fri, 14 Apr 2023 23:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521268.809798; Fri, 14 Apr 2023 23:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5g-0002uL-Un; Fri, 14 Apr 2023 23:44:28 +0000
Received: by outflank-mailman (input) for mailman id 521268;
 Fri, 14 Apr 2023 23:44:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT5f-0000zb-6J
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:44:27 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a08d002-db1e-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 01:44:25 +0200 (CEST)
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
X-Inumbo-ID: 4a08d002-db1e-11ed-8611-37d641c3527e
Message-ID: <20230414232309.634953473@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=yXU88DPM4+gDgwwKQLancKUxDjIhod/zoYFzhLlkywE=;
	b=uB/cdoo+FiKgxcyt6ua+eofd7Uy6FRsG6/M919LHeLaRDCm0uyHoc5a1FuwimG9z0Kg1xr
	I101+cnRHFikD4fqEm6lZOTxsA3yV9LXW61rrHUVlF3AiOWiBC00yRq0VhWdSwUelUpctI
	5IcE3x4R3zXRKbqt7SSBKBa4oYiQTpXazjMN/L2oMlO9K+07Nyr22exnb4k00l3spzvmVc
	9LRa6JkEMAonr+NJM4O1ggTmXWPqwz4bV0FKYjWVuxuelWC7S0/bYUbnT566jHXu359fFE
	1kF7NH3ihq64cycQYcnuOz7AxFm2QZeP5t1J5QjP8JiYPJKiwyKDhh8WCXeClA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=yXU88DPM4+gDgwwKQLancKUxDjIhod/zoYFzhLlkywE=;
	b=MdNuozlhNGUku1R1Tw5i7+TfSWnt88h5jzNnGTOji+filOi1PFWkM9UpldmpxTl1Bs6qoB
	RP/SXlqo2sMOuJDA==
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
Subject: [patch 07/37] x86/smpboot: Restrict soft_restart_cpu() to SEV
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:44:24 +0200 (CEST)

Now that the CPU0 hotplug cruft is gone, the only user is AMD SEV.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/kernel/callthunks.c |    2 +-
 arch/x86/kernel/head_32.S    |   14 --------------
 arch/x86/kernel/head_64.S    |    2 +-
 3 files changed, 2 insertions(+), 16 deletions(-)

--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -133,7 +133,7 @@ static bool skip_addr(void *dest)
 	/* Accounts directly */
 	if (dest == ret_from_fork)
 		return true;
-#ifdef CONFIG_HOTPLUG_CPU
+#if defined(CONFIG_HOTPLUG_CPU) && defined(CONFIG_AMD_MEM_ENCRYPT)
 	if (dest == soft_restart_cpu)
 		return true;
 #endif
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -138,20 +138,6 @@ SYM_CODE_START(startup_32)
 	jmp .Ldefault_entry
 SYM_CODE_END(startup_32)
 
-#ifdef CONFIG_HOTPLUG_CPU
-/*
- * Entry point for soft restart of a CPU. Invoked from xxx_play_dead() for
- * restarting the boot CPU or for restarting SEV guest CPUs after CPU hot
- * unplug. Everything is set up already except the stack.
- */
-SYM_FUNC_START(soft_restart_cpu)
-	movl initial_stack, %ecx
-	movl %ecx, %esp
-	call *(initial_code)
-1:	jmp 1b
-SYM_FUNC_END(soft_restart_cpu)
-#endif
-
 /*
  * Non-boot CPU entry point; entered from trampoline.S
  * We can't lgdt here, because lgdt itself uses a data segment, but
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -375,7 +375,7 @@ SYM_CODE_END(secondary_startup_64)
 #include "verify_cpu.S"
 #include "sev_verify_cbit.S"
 
-#ifdef CONFIG_HOTPLUG_CPU
+#if defined(CONFIG_HOTPLUG_CPU) && defined(CONFIG_AMD_MEM_ENCRYPT)
 /*
  * Entry point for soft restart of a CPU. Invoked from xxx_play_dead() for
  * restarting the boot CPU or for restarting SEV guest CPUs after CPU hot


