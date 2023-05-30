Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4254715C25
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541086.843443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3ws1-000735-DK; Tue, 30 May 2023 10:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541086.843443; Tue, 30 May 2023 10:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3ws1-00070F-9l; Tue, 30 May 2023 10:46:29 +0000
Received: by outflank-mailman (input) for mailman id 541086;
 Tue, 30 May 2023 10:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8r7=BT=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q3wrz-000709-DO
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:46:27 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3977eee4-fed7-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 12:46:25 +0200 (CEST)
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
X-Inumbo-ID: 3977eee4-fed7-11ed-b231-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685443583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aczuPZRXM/3T3zeRyckgFz17tXnOXBoIRzMvbCKmwP4=;
	b=jtpE+gCbIAd5N53RxGc6sgaT2si80ubO5trdzq0YZPJgj0u0uGxnEtLhxrdtPRPKOaDE18
	ztu5b4k5XEjvK/fjpfaluMv16JvaD5E4Z3L+jqW7tLBl5pCr13VXjUoqvtgyKLd/Y/xqu/
	84SV1UbOvwmhndn5fFxZSGrnlbePrrHSpEQPGnffMATrvpt3ZAkTXG6ylWpzmAYhS4dUem
	FTBfKKPOVhev4++C/nR20YRFt6jyNNtCz9uhzfOoHg4olSWAigaKti8fg/vEQYtVI0MLbc
	gP2h3BhbdhTtPHPbM7xx+svbc8m0rHw4UqvtNs/L/faaOGodmpnGf4MovXV/Gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685443583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aczuPZRXM/3T3zeRyckgFz17tXnOXBoIRzMvbCKmwP4=;
	b=Hfhdo2/Q/3z4khc8VnhVtRu45XjAYTmDIx3ynzUXbEbUuJzXZUdsmlA0kYxl32RnfB9UKw
	25lgiYCSG2Kzr+Dw==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [patch] x86/realmode: Make stack lock work in trampoline_compat()
In-Reply-To: <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
Date: Tue, 30 May 2023 12:46:22 +0200
Message-ID: <87h6rujdvl.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

The stack locking and stack assignment macro LOAD_REALMODE_ESP fails to
work when invoked from the 64bit trampoline entry point:

trampoline_start64
  trampoline_compat
    LOAD_REALMODE_ESP <- lock

Accessing tr_lock is only possible from 16bit mode. For the compat entry
point this needs to be pa_tr_lock so that the required relocation entry is
generated. Otherwise it locks the non-relocated address which is
aside of being wrong never cleared in secondary_startup_64() causing all
but the first CPU to get stuck on the lock.

Make the macro take an argument lock_pa which defaults to 0 and rename it
to LOCK_AND_LOAD_REALMODE_ESP to make it clear what this is about.

Fixes: f6f1ae9128d2 ("x86/smpboot: Implement a bit spinlock to protect the realmode stack")
Reported-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/realmode/rm/trampoline_64.S |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -37,12 +37,16 @@
 	.text
 	.code16
 
-.macro LOAD_REALMODE_ESP
+.macro LOCK_AND_LOAD_REALMODE_ESP lock_pa=0
 	/*
 	 * Make sure only one CPU fiddles with the realmode stack
 	 */
 .Llock_rm\@:
+	.if \lock_pa
+        lock btsl       $0, pa_tr_lock
+	.else
         lock btsl       $0, tr_lock
+	.endif
         jnc             2f
         pause
         jmp             .Llock_rm\@
@@ -63,7 +67,7 @@ SYM_CODE_START(trampoline_start)
 	mov	%ax, %es
 	mov	%ax, %ss
 
-	LOAD_REALMODE_ESP
+	LOCK_AND_LOAD_REALMODE_ESP
 
 	call	verify_cpu		# Verify the cpu supports long mode
 	testl   %eax, %eax		# Check for return code
@@ -106,7 +110,7 @@ SYM_CODE_START(sev_es_trampoline_start)
 	mov	%ax, %es
 	mov	%ax, %ss
 
-	LOAD_REALMODE_ESP
+	LOCK_AND_LOAD_REALMODE_ESP
 
 	jmp	.Lswitch_to_protected
 SYM_CODE_END(sev_es_trampoline_start)
@@ -189,7 +193,7 @@ SYM_CODE_START(pa_trampoline_compat)
 	 * In compatibility mode.  Prep ESP and DX for startup_32, then disable
 	 * paging and complete the switch to legacy 32-bit mode.
 	 */
-	LOAD_REALMODE_ESP
+	LOCK_AND_LOAD_REALMODE_ESP lock_pa=1
 	movw	$__KERNEL_DS, %dx
 
 	movl	$(CR0_STATE & ~X86_CR0_PG), %eax

