Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987F6E4DAF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 17:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522251.811479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poR8G-0005BT-Jw; Mon, 17 Apr 2023 15:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522251.811479; Mon, 17 Apr 2023 15:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poR8G-000585-Gm; Mon, 17 Apr 2023 15:51:08 +0000
Received: by outflank-mailman (input) for mailman id 522251;
 Mon, 17 Apr 2023 15:51:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnOu=AI=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1poR8F-00057z-Lq
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 15:51:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a7a516ff-dd37-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 17:51:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 748271691;
 Mon, 17 Apr 2023 08:51:45 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.19.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99D093F5A1;
 Mon, 17 Apr 2023 08:50:56 -0700 (PDT)
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
X-Inumbo-ID: a7a516ff-dd37-11ed-b21e-6b7b168915f2
Date: Mon, 17 Apr 2023 16:50:53 +0100
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
Message-ID: <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.569498144@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414232310.569498144@linutronix.de>

On Sat, Apr 15, 2023 at 01:44:49AM +0200, Thomas Gleixner wrote:
> Switch to the CPU hotplug core state tracking and synchronization
> mechanim. No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org

I gave this a spin on arm64 (in a 64-vCPU VM on an M1 host), and it seems to
work fine with a bunch of vCPUs being hotplugged off and on again randomly.

FWIW:

Tested-by: Mark Rutland <mark.rutland@arm.com>

I also hacked the code to have the dying CPU spin forever before the call to
cpuhp_ap_report_dead(). In that case I see a warning, and that we don't call
arch_cpuhp_cleanup_dead_cpu(), and that the CPU is marked as offline (per
/sys/devices/system/cpu/$N/online).

As a tangent/aside, we might need to improve that for confidential compute
architectures, and we might want to generically track cpus which might still be
using kernel text/data. On arm64 we ensure that via our cpu_kill() callback
(which'll use PSCI CPU_AFFINITY_INFO), but I'm not sure if TDX and/or SEV-SNP
have a similar mechanism.

Otherwise, a malicious hypervisor can pause a vCPU just before it leaves the
kernel (e.g. immediately after the arch_cpuhp_cleanup_dead_cpu() call), wait
for a kexec (or resuse of stack memroy), and unpause the vCPU to cause things
to blow up.

Thanks,
Mark.

> ---
>  arch/arm64/Kconfig           |    1 +
>  arch/arm64/include/asm/smp.h |    2 +-
>  arch/arm64/kernel/smp.c      |   14 +++++---------
>  3 files changed, 7 insertions(+), 10 deletions(-)
> 
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -216,6 +216,7 @@ config ARM64
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
>  	select HAVE_GENERIC_VDSO
> +	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
>  	select KASAN_VMALLOC if KASAN
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -99,7 +99,7 @@ static inline void arch_send_wakeup_ipi_
>  
>  extern int __cpu_disable(void);
>  
> -extern void __cpu_die(unsigned int cpu);
> +static inline void __cpu_die(unsigned int cpu) { }
>  extern void cpu_die(void);
>  extern void cpu_die_early(void);
>  
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -333,17 +333,13 @@ static int op_cpu_kill(unsigned int cpu)
>  }
>  
>  /*
> - * called on the thread which is asking for a CPU to be shutdown -
> - * waits until shutdown has completed, or it is timed out.
> + * Called on the thread which is asking for a CPU to be shutdown after the
> + * shutdown completed.
>   */
> -void __cpu_die(unsigned int cpu)
> +void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>  {
>  	int err;
>  
> -	if (!cpu_wait_death(cpu, 5)) {
> -		pr_crit("CPU%u: cpu didn't die\n", cpu);
> -		return;
> -	}
>  	pr_debug("CPU%u: shutdown\n", cpu);
>  
>  	/*
> @@ -370,8 +366,8 @@ void cpu_die(void)
>  
>  	local_daif_mask();
>  
> -	/* Tell __cpu_die() that this CPU is now safe to dispose of */
> -	(void)cpu_report_death();
> +	/* Tell cpuhp_bp_sync_dead() that this CPU is now safe to dispose of */
> +	cpuhp_ap_report_dead();
>  
>  	/*
>  	 * Actually shutdown the CPU. This must never fail. The specific hotplug
> 

