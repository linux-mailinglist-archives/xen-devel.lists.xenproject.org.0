Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DA26FB7A7
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 21:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531816.827799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6ps-0001DP-VK; Mon, 08 May 2023 19:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531816.827799; Mon, 08 May 2023 19:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6ps-0000zA-8k; Mon, 08 May 2023 19:47:52 +0000
Received: by outflank-mailman (input) for mailman id 531816;
 Mon, 08 May 2023 19:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49Re=A5=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pw6m4-0004GB-CO
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 19:43:56 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aaa15205-edd8-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 21:43:55 +0200 (CEST)
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
X-Inumbo-ID: aaa15205-edd8-11ed-b226-6b7b168915f2
Message-ID: <20230508185218.183895955@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=JFZgPCXfk4YqrkWgB2iOW/w2n4X/0HLpXczGoD+v1Vc=;
	b=dUhrJJpkQ4m0PAJlXgFQayguIDRYj4DbGKW+17HOquchCD5OkCNG5p+ivglj6Zp0QU+I0O
	sjDl2ZSA2qdGYXZhUvFPnbPFXnAtHugvx2GI+wQbJ19qs9tz5O+rWnDYC86GVW88KAAeKE
	Y1tCVHUnxg/G/GD2y2S3k8oy8xdR5u5wsZrKD02jMrshweqjIs0USPtzbNHtBjzyPjuZYP
	bnHk9lUQIZYMlOyOmAOBq9jij07nAxoPfgUgAqbfHUg2W+wm48VsfVgoz2u1VnDCsiAyNh
	0QgIUd501thJfEkajmTlocFpAZEG7qATCMndUXAIFuG7nTRHlZ0qw32Bk/xexg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=JFZgPCXfk4YqrkWgB2iOW/w2n4X/0HLpXczGoD+v1Vc=;
	b=w6a2Le7411PlZc47ukf/lNrWYBsIfR8a67l/rnpzfLfXCU2HTbN7zdy8QxM7z6Q1BG3dst
	HEreuKgJSAkc7vCQ==
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
Subject: [patch v3 17/36] x86/xen/hvm: Get rid of DEAD_FROZEN handling
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  8 May 2023 21:43:54 +0200 (CEST)

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
---

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



