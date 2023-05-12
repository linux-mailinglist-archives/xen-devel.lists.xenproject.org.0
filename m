Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3B701044
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533932.831080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZz8-0002Ur-Qa; Fri, 12 May 2023 21:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533932.831080; Fri, 12 May 2023 21:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZz8-0002MY-J1; Fri, 12 May 2023 21:07:30 +0000
Received: by outflank-mailman (input) for mailman id 533932;
 Fri, 12 May 2023 21:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZz7-0004F7-Dh
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:29 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff656733-f108-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 23:07:26 +0200 (CEST)
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
X-Inumbo-ID: ff656733-f108-11ed-8611-37d641c3527e
Message-ID: <20230512205256.423407127@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1rKmHmZAbJT08KPFiwa9L0tLfU68vKcUg6wSGkvdHSU=;
	b=oQbDXlWOfM0QoeIS7fBd1ZDXblWtvo4+j/S5K5bAfdSwYbOZAW2gSSiDW+OyvgXb/rXSk2
	+/cGl59AtTsBjSk7vwY4uPAQTNLGgW4cVw5R5p0BPvJlNfEfRufZHS7KlZQMVwbmLXJxKb
	s6aysUoLSt4mwWJ1tetWxrFJExUFkRYOeNoA8l6IhoUsrN3BFbahOePPwtYjw/So5TqD69
	2Cz8B/vuKEN0Yd2xMrYK0SQw8UE0HL8tHmnz5xhL98Md0D/lNdYrgp9dQF6YIxHSHgOtX9
	NYORCVxryHyjQrZpsLDTBMe0I9/XQv2spHgCmpdrV7IAP/NBWUx7dh/o0Bd+yA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1rKmHmZAbJT08KPFiwa9L0tLfU68vKcUg6wSGkvdHSU=;
	b=UfaoCMCiIYhlxZAtqiJhn7AYfYyYM9daYEgmWZsmdMFm1YeoGErpKjOwH0iDKmu7TweDmj
	Ryr2+mWXOS82QjCw==
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
Subject: [patch V4 18/37] x86/xen/hvm: Get rid of DEAD_FROZEN handling
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:25 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

No point in this conditional voodoo. Un-initializing the lock mechanism is
safe to be called unconditionally even if it was already invoked when the
CPU died.

Remove the invocation of xen_smp_intr_free() as that has been already
cleaned up in xen_cpu_dead_hvm().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/xen/enlighten_hvm.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -161,13 +161,12 @@ static int xen_cpu_up_prepare_hvm(unsign
 	int rc = 0;
 
 	/*
-	 * This can happen if CPU was offlined earlier and
-	 * offlining timed out in common_cpu_die().
+	 * If a CPU was offlined earlier and offlining timed out then the
+	 * lock mechanism is still initialized. Uninit it unconditionally
+	 * as it's safe to call even if already uninited. Interrupts and
+	 * timer have already been handled in xen_cpu_dead_hvm().
 	 */
-	if (cpu_report_state(cpu) == CPU_DEAD_FROZEN) {
-		xen_smp_intr_free(cpu);
-		xen_uninit_lock_cpu(cpu);
-	}
+	xen_uninit_lock_cpu(cpu);
 
 	if (cpu_acpi_id(cpu) != U32_MAX)
 		per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);




