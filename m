Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60003715A0A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541025.843303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vcS-00088C-0r; Tue, 30 May 2023 09:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541025.843303; Tue, 30 May 2023 09:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vcR-00085D-Tr; Tue, 30 May 2023 09:26:19 +0000
Received: by outflank-mailman (input) for mailman id 541025;
 Tue, 30 May 2023 09:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8r7=BT=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q3vcQ-000857-JK
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:26:18 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0657eb9b-fecc-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 11:26:15 +0200 (CEST)
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
X-Inumbo-ID: 0657eb9b-fecc-11ed-b231-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685438774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OuP6yOSR9XWm7UsYO6pZdZmKv2tnQHjp+lm/v984YCA=;
	b=4M9Rhxb+Ak3/yFJgB1S859CSZLFWoXOP0uMTWtvEKyHSLqPJWzDtmdPw+nD7OakjHwTvL9
	3H4QTINZn7/MOdikwDWln06pYSfL8jvb0I5oZP0DesRNI92ni3zwbDzgSLSlL/Pu5A7ayE
	rYYGLRlzgJx7Mzzdxn0P+XOLdusRXdTLu2ZGz+x2RQA5bSNBrZJT2AeE+kvVPAgUR6estR
	vY+t9gmb5UEUwYCeoMX6kP4VPGvNBn7Lz23Yllf7oRg5tOfqRvkOxsk2p5mTi2eG6HqWL4
	i7ehXbcRL2W2gE3TOlBREPsOXH6v8kr/26nERrHEOZ95S6/lVpsHxw/6/+/DQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685438774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OuP6yOSR9XWm7UsYO6pZdZmKv2tnQHjp+lm/v984YCA=;
	b=HcG/D4NiqXeHLfwKoko4UyTPezLO1CVsxR+RlJLjEUh5/8YeL4Jf/2ZxSLH+TzNJfOKKZT
	r4jRkltXrdP6XoDg==
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
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
In-Reply-To: <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
Date: Tue, 30 May 2023 11:26:03 +0200
Message-ID: <87pm6ijhlg.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 29 2023 at 23:31, Kirill A. Shutemov wrote:
> Aaand the next patch that breaks TDX boot is... <drum roll>
>
> 	x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it
>
> Disabling parallel bringup helps. I didn't look closer yet. If you have
> an idea let me know.

So how does TDX end up with actual parallel bringup?

	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
		pr_info("Parallel CPU startup disabled due to guest state encryption\n");
		return false;
	}

It should take that path, no?

Thanks,

        tglx


