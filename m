Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D866E2DA5
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521332.810013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAT-0006sQ-PF; Fri, 14 Apr 2023 23:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521332.810013; Fri, 14 Apr 2023 23:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAT-0006eU-EH; Fri, 14 Apr 2023 23:49:25 +0000
Received: by outflank-mailman (input) for mailman id 521332;
 Fri, 14 Apr 2023 23:49:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT6M-0000zb-9S
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:45:10 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 635bc938-db1e-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 01:45:08 +0200 (CEST)
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
X-Inumbo-ID: 635bc938-db1e-11ed-8611-37d641c3527e
Message-ID: <20230414232311.254849089@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=qlj4H3ejL+vBUDG3NY1lMMcGFIiTzrSNA2aqLKlihDE=;
	b=1GQ0vgasLWqRcJWgIXPbXDmKUvXohkJnXHYow4+Gk18ZVkMCsGTyrDjPv1CmK6RbyQU3xy
	sZOnCBi1gUZHMhyRrfBhTMtqyNFDPJ6vIKz6V9GUUqs40cNvVEv7vD+CBHvRT0wd1gUl1d
	6b2tSiphU+RGH9LMrzC1SBAlXe4ncrHHHmvCSojPNfdfYrCZOS3cqdN5dvg1mrwkF+zHKS
	ZggDxsStwqH0PgeAnVkNUSmrn0NxE/MFHr8xTSF8rH/8cE10sWA0KKqw6/zjLrvWcuBEms
	WRc4LjINHUoNtUJjSQE1O0a6vHatkwkifR+Lal+9Qf7z5SXlNpUbZu7h4WPnRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=qlj4H3ejL+vBUDG3NY1lMMcGFIiTzrSNA2aqLKlihDE=;
	b=QX/aw2ZRTXXvpaXqpLyn2DL7d4KHZGqZGPQ3AUK084YoY4i+oS2d15EjnpvV8yHLp9Q5Sc
	902bNwcd/YuBSyBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 "Arjan van de Veen" <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
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
 Sabin Rapan <sabrapan@amazon.com>
Subject: [patch 33/37] x86/topology: Store extended topology leaf information
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:45:07 +0200 (CEST)

Save the extended topology leaf number if it exists and is valid in
preparation of parallel CPU bringup.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/topology.h |    1 +
 arch/x86/kernel/cpu/topology.c  |    3 +++
 2 files changed, 4 insertions(+)

--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -121,6 +121,7 @@ extern unsigned int __max_die_per_packag
 #define topology_core_cpumask(cpu)		(per_cpu(cpu_core_map, cpu))
 #define topology_sibling_cpumask(cpu)		(per_cpu(cpu_sibling_map, cpu))
 
+extern unsigned int topology_extended_leaf;
 extern unsigned int __max_logical_packages;
 #define topology_max_packages()			(__max_logical_packages)
 
--- a/arch/x86/kernel/cpu/topology.c
+++ b/arch/x86/kernel/cpu/topology.c
@@ -29,6 +29,8 @@ unsigned int __max_die_per_package __rea
 EXPORT_SYMBOL(__max_die_per_package);
 
 #ifdef CONFIG_SMP
+unsigned int topology_extended_leaf __read_mostly;
+
 /*
  * Check if given CPUID extended topology "leaf" is implemented
  */
@@ -72,6 +74,7 @@ int detect_extended_topology_early(struc
 	if (leaf < 0)
 		return -1;
 
+	topology_extended_leaf = leaf;
 	set_cpu_cap(c, X86_FEATURE_XTOPOLOGY);
 
 	cpuid_count(leaf, SMT_LEVEL, &eax, &ebx, &ecx, &edx);


