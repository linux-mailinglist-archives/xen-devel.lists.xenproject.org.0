Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE296F724E
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529891.824885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueDV-0005yB-Ly; Thu, 04 May 2023 19:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529891.824885; Thu, 04 May 2023 19:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueDV-0005uu-Gu; Thu, 04 May 2023 19:02:13 +0000
Received: by outflank-mailman (input) for mailman id 529891;
 Thu, 04 May 2023 19:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srgM=AZ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pueDT-00042j-Kl
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:02:11 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c24286f-eaae-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:02:11 +0200 (CEST)
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
X-Inumbo-ID: 2c24286f-eaae-11ed-b226-6b7b168915f2
Message-ID: <20230504185936.696863260@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oNktQrwN+fatH513QPoGkxuTXmWxbBJSO1kVQSmt5aw=;
	b=gBya4Wdiox20HXnYxId2o92/cZNTV4kT8ZfWJZEW8ITXjndCeX8dDH5GHwnbCKYq4N2LZ7
	1Vliet33ezvFZfT7hZ49SRcTQY9GGkgXhlSt5j4FLFBbo8w2LMXaeiXjsd9i1J9IMUzHg1
	sJN1go/y7aKDt6GemaqC60gjrJ2Y/O06s8spq6n5PMT68ouOvPdBNo/CzyJcNIvXElJXAl
	XdjDvEAOi1DHoGQz2s+P9J0LaJZ0aZZ0+hC8ebSl7akG4yKA5FQhYbj1MWyqNbSv7kr//g
	wKJSvQLOs5Ac6Rvs5KHpecAWJnrhruw0ihD4m2E9ZObgEFCoaikI3NMnkVCBlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oNktQrwN+fatH513QPoGkxuTXmWxbBJSO1kVQSmt5aw=;
	b=ne/7c8UNDxt/B5By5H8OrJEC2F33AGALC1UJsqUQEjBRB84Yn90Pp71hqA5iKSc8E1YfLo
	xVfQnGoIgwAl59BQ==
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
Subject: [patch V2 07/38] x86/smpboot: Restrict soft_restart_cpu() to SEV
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu,  4 May 2023 21:02:09 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Now that the CPU0 hotplug cruft is gone, the only user is AMD SEV.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>

---
 arch/x86/kernel/callthunks.c |    2 +-
 arch/x86/kernel/head_32.S    |   14 --------------
 arch/x86/kernel/head_64.S    |    2 +-
 3 files changed, 2 insertions(+), 16 deletions(-)
---
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


