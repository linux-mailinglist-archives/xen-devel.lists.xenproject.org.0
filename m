Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13806715E8E
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 14:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541139.843562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3yAC-0004fg-Vl; Tue, 30 May 2023 12:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541139.843562; Tue, 30 May 2023 12:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3yAC-0004dT-Sl; Tue, 30 May 2023 12:09:20 +0000
Received: by outflank-mailman (input) for mailman id 541139;
 Tue, 30 May 2023 12:09:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8r7=BT=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q3yAB-0004dJ-P2
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 12:09:19 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd7a40b1-fee2-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 14:09:18 +0200 (CEST)
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
X-Inumbo-ID: cd7a40b1-fee2-11ed-b231-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685448557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iZKRAQ6PZ8GK4gaM6K1HebRWTpJfBGLswDCJGgLN5o0=;
	b=m4WMewK162ZNFwFaX5aCd5h4XR9fVfFKlcOKr0XvrKt28u52sp90XWujVFM8gK3h4ofwRI
	SOK74XcgObHGkHLKgrJtnZmuimwWXh/wXN5q9j6Dv8gCxwb+AXijmXtlT1aYPYK1KlmCia
	BRY4IEuplIYlboTaZlXuZ97GEPZdzEDaxJWuCfBZTFHFXe1n4ZZe6munDRdPajOfnef4JY
	B2aRHT8SvnCVu5Z0nVzDGLL0t8nspaFR5wLfetwgGrG6VTVTYbuigWgnfZFxZNY8e+e9jz
	fk5DZ/0bhEUcm9JiTR/8v3EDg6m0oY8ot+sN837vZzmjbxzjbsdTnvzWX7grnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685448557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iZKRAQ6PZ8GK4gaM6K1HebRWTpJfBGLswDCJGgLN5o0=;
	b=ePubrlCxuRaMVoLtUqukHirTYLds6qKP6f4ORS+5dYI6s8wS4PLvyw0YznjLBK3j2Pn/GB
	8pWP8hu7tKt0KJDA==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
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
Subject: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
In-Reply-To: <87jzwqjeey.ffs@tglx>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx>
Date: Tue, 30 May 2023 14:09:17 +0200
Message-ID: <87cz2ija1e.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

The decision to allow parallel bringup of secondary CPUs checks
CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
parallel bootup because accessing the local APIC is intercepted and raises
a #VC or #VE, which cannot be handled at that point.

The check works correctly, but only for AMD encrypted guests. TDX does not
set that flag.

Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
definitely works for both AMD and Intel.

Fixes: 0c7ffa32dbd6 ("x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it")
Reported-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1282,7 +1282,7 @@ bool __init arch_cpuhp_init_parallel_bri
 	 * Intel-TDX has a secure RDMSR hypercall, but that needs to be
 	 * implemented seperately in the low level startup ASM code.
 	 */
-	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
+	if (cc_get_vendor() != CC_VENDOR_NONE) {
 		pr_info("Parallel CPU startup disabled due to guest state encryption\n");
 		return false;
 	}

