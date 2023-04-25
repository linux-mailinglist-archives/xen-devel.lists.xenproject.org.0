Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53846EE8A4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 21:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526321.818012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOh5-0004r4-PN; Tue, 25 Apr 2023 19:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526321.818012; Tue, 25 Apr 2023 19:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOh5-0004ol-Me; Tue, 25 Apr 2023 19:51:19 +0000
Received: by outflank-mailman (input) for mailman id 526321;
 Tue, 25 Apr 2023 19:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQ8d=AQ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1prOh3-0004oe-FU
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 19:51:17 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 891c3945-e3a2-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 21:51:15 +0200 (CEST)
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
X-Inumbo-ID: 891c3945-e3a2-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682452273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epqrrIP9XVMR1rQYOgUv6OMHFSXsoKyAhdvov9JTG3c=;
	b=hcfCyrdfQ/+yHnKF3T+I49mLvnN7Y7S69gBRQL7PhhKJcZIQM6dUY5pvAbw4x5UtKBksj5
	+gNdAWyqbtppxTS6xk/OOGkQEgCKZ50daZMUpYiSsjHUolnRQ63od8fRIwCIy22iqsL7Jz
	ptuYgLF2Vyi6TxSoYJlRddHoLRBh0aBb/2ut263viqoCn4L8IM34OuGeUFz0vHjf3uDsn9
	kzIwMYp79iEd+cDm0M3l/TvJoQ8Ebljb98ttQPEip+uioS6jdgokPZm34PxDLgh8kTLkX7
	Tk0Brm7tWOMbl31MYKpF+X1fNVmxtHUKna8IUJdeJdt+TiqryaL2tjxt/WxUaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682452273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epqrrIP9XVMR1rQYOgUv6OMHFSXsoKyAhdvov9JTG3c=;
	b=mlbSRhNUu/9kpluKPqwDbDiOM+hdImwLPmR+/CiZOtx2CU7HgipiQ7bg9V2pgBimVEqMmi
	qqHiWR0zzWYsg/Bg==
To: Mark Rutland <mark.rutland@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw@amazon.co.uk>,
 Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 22/37] arm64: smp: Switch to hotplug core state
 synchronization
In-Reply-To: <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.569498144@linutronix.de> <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
Date: Tue, 25 Apr 2023 21:51:12 +0200
Message-ID: <87ttx3zqof.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 17 2023 at 16:50, Mark Rutland wrote:
> On Sat, Apr 15, 2023 at 01:44:49AM +0200, Thomas Gleixner wrote:
> I gave this a spin on arm64 (in a 64-vCPU VM on an M1 host), and it seems to
> work fine with a bunch of vCPUs being hotplugged off and on again randomly.
>
> FWIW:
>
> Tested-by: Mark Rutland <mark.rutland@arm.com>
>
> I also hacked the code to have the dying CPU spin forever before the call to
> cpuhp_ap_report_dead(). In that case I see a warning, and that we don't call
> arch_cpuhp_cleanup_dead_cpu(), and that the CPU is marked as offline (per
> /sys/devices/system/cpu/$N/online).

Nice!

> As a tangent/aside, we might need to improve that for confidential compute
> architectures, and we might want to generically track cpus which might still be
> using kernel text/data. On arm64 we ensure that via our cpu_kill() callback
> (which'll use PSCI CPU_AFFINITY_INFO), but I'm not sure if TDX and/or SEV-SNP
> have a similar mechanism.
>
> Otherwise, a malicious hypervisor can pause a vCPU just before it leaves the
> kernel (e.g. immediately after the arch_cpuhp_cleanup_dead_cpu() call), wait
> for a kexec (or resuse of stack memroy), and unpause the vCPU to cause things
> to blow up.

There are a gazillion ways for a malicious hypervisor to blow up a
'squint enough to be confident' guest.

The real question is whether it can utilize such a blow up to extract
confidential information from the guest.

If not then it's just yet another way of DoS which is an "acceptable"
attack as it only affects availability but not confidentiality.

Thanks,

        tglx

