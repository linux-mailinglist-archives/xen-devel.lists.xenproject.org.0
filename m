Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3DC702C2A
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 14:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534733.832058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWtu-0006Ov-IA; Mon, 15 May 2023 12:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534733.832058; Mon, 15 May 2023 12:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWtu-0006Lc-FC; Mon, 15 May 2023 12:02:02 +0000
Received: by outflank-mailman (input) for mailman id 534733;
 Mon, 15 May 2023 12:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCBX=BE=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pyWtr-0006LU-PE
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 12:02:00 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4adf9cea-f318-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 14:01:58 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pyWsq-00BTBM-2z; Mon, 15 May 2023 12:00:57 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D89B330003A;
 Mon, 15 May 2023 14:00:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A377520AA5AEB; Mon, 15 May 2023 14:00:51 +0200 (CEST)
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
X-Inumbo-ID: 4adf9cea-f318-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5mEVtTPGjX5VUAK36tVkFbSuQO22AuGeDmAzn9epzuw=; b=AmiVyh00bk/IBxeKT1sJOhNhPw
	sKnnSOF2uFizS5FDPwFE+Ot6Zv0LcoZ6HJF47h5sBYfsBjpiqyZyI5uuDK5u2MZ4g4WobyDMhkodb
	fUSujxE1pqhBhDi+eUM0ht45DR2Y3i+nr1YT42g2zawDfvMwb295A0aq8ARQ+5Z4gi/pV9YXxQYVt
	3wUGZYGDjBC3RzitLceq6j/qPs1owVcSfLpElN1Y8S30KXDX5uH0Odcz4RLnxHbc6f5jNYL4oL/bz
	nTpSFPHQoB6BKp5r4Q6WAS69amz0yrUYHbuk51pYpxo8D3N1weBBW6mFoBFyYlJ+O4Y0A9ycf248d
	MFethNqQ==;
Date: Mon, 15 May 2023 14:00:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
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
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Ross Philipson <ross.philipson@oracle.com>
Subject: Re: [patch V4 37/37] x86/smpboot/64: Implement
 arch_cpuhp_init_parallel_bringup() and enable it
Message-ID: <20230515120051.GH83892@hirez.programming.kicks-ass.net>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.467571745@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512205257.467571745@linutronix.de>

On Fri, May 12, 2023 at 11:07:56PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Implement the validation function which tells the core code whether
> parallel bringup is possible.
> 
> The only condition for now is that the kernel does not run in an encrypted
> guest as these will trap the RDMSR via #VC, which cannot be handled at that
> point in early startup.
> 
> There was an earlier variant for AMD-SEV which used the GHBC protocol for
> retrieving the APIC ID via CPUID, but there is no guarantee that the
> initial APIC ID in CPUID is the same as the real APIC ID. There is no
> enforcement from the secure firmware and the hypervisor can assign APIC IDs
> as it sees fit as long as the ACPI/MADT table is consistent with that
> assignment.
> 
> Unfortunately there is no RDMSR GHCB protocol at the moment, so enabling
> AMD-SEV guests for parallel startup needs some more thought.

One option, other than adding said protocol, would be to:

 - use the APICID from CPUID -- with the expectation that it can be
   wrong.
 - (ab)use one of the high bits in cpuid_to_apicid[] as a test-and-set
   trylock. This avoids two CPUs from using the same per-cpu base, if
   CPUID is being malicious. Panic on fail.
 - validate against MSR the moment we can and panic if not matching

The trylock ensures the stacks/percpu state is not used by multiple
CPUs, and should guarantee a coherent state to get far enough along to
be able to do the #VE inducing RDMSR.



