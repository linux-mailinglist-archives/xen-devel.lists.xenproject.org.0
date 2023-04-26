Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049EF6EEFC0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526542.818367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pra3y-0000X2-2E; Wed, 26 Apr 2023 07:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526542.818367; Wed, 26 Apr 2023 07:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pra3x-0000UO-Vd; Wed, 26 Apr 2023 07:59:41 +0000
Received: by outflank-mailman (input) for mailman id 526542;
 Wed, 26 Apr 2023 07:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPIn=AR=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1pra3x-0000UH-95
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 07:59:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4a41ef5e-e408-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 09:59:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 680B44B3;
 Wed, 26 Apr 2023 01:00:21 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.23.120])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A76593F587;
 Wed, 26 Apr 2023 00:59:32 -0700 (PDT)
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
X-Inumbo-ID: 4a41ef5e-e408-11ed-8611-37d641c3527e
Date: Wed, 26 Apr 2023 08:59:26 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw@infradead.org>,
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw@amazon.co.uk>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 22/37] arm64: smp: Switch to hotplug core state
 synchronization
Message-ID: <ZEjZ3pHjQWn4drs8@FVFF77S0Q05N>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.569498144@linutronix.de>
 <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
 <87ttx3zqof.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttx3zqof.ffs@tglx>

On Tue, Apr 25, 2023 at 09:51:12PM +0200, Thomas Gleixner wrote:
> On Mon, Apr 17 2023 at 16:50, Mark Rutland wrote:
> > As a tangent/aside, we might need to improve that for confidential compute
> > architectures, and we might want to generically track cpus which might still be
> > using kernel text/data. On arm64 we ensure that via our cpu_kill() callback
> > (which'll use PSCI CPU_AFFINITY_INFO), but I'm not sure if TDX and/or SEV-SNP
> > have a similar mechanism.
> >
> > Otherwise, a malicious hypervisor can pause a vCPU just before it leaves the
> > kernel (e.g. immediately after the arch_cpuhp_cleanup_dead_cpu() call), wait
> > for a kexec (or resuse of stack memroy), and unpause the vCPU to cause things
> > to blow up.
> 
> There are a gazillion ways for a malicious hypervisor to blow up a
> 'squint enough to be confident' guest.
> 
> The real question is whether it can utilize such a blow up to extract
> confidential information from the guest.
>
> If not then it's just yet another way of DoS which is an "acceptable"
> attack as it only affects availability but not confidentiality.

Sure.

My thinking is that this is an attack against the *integrity* of the guest
(since the vCPU that gets unpasued may write to memory), and so it's
potentially more than just a DoS.

I only mention this because I'd like to account for that on arm64, and if other
architectures also wanted to handle that it might make sense to have some
common infrastructure to track whether CPUs are potentially still within the
kernel.

Thanks,
Mark.

