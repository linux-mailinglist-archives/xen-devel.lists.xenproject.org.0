Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F421F6E2DA6
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:49:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521328.810008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAT-0006eX-0p; Fri, 14 Apr 2023 23:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521328.810008; Fri, 14 Apr 2023 23:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAS-0006Wc-QB; Fri, 14 Apr 2023 23:49:24 +0000
Received: by outflank-mailman (input) for mailman id 521328;
 Fri, 14 Apr 2023 23:49:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT6J-0000zb-9G
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:45:07 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6158ef05-db1e-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 01:45:04 +0200 (CEST)
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
X-Inumbo-ID: 6158ef05-db1e-11ed-8611-37d641c3527e
Message-ID: <20230414232311.128590508@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1po2rJ4fVgJP8Lz7zlVuql3iIT5xp2VpR+B+sueZaiQ=;
	b=j2f464LqemKF5EyymLaTszAtW5FGztj8vmPcDPj1wK7YU7fOHNTdZk2/K8gAJFZq9pfDGY
	5swh08e6d90aHqmMGF6WkIyj8axPVjUxuJuAViwZJ1cdvU6xcoF9zb87nqcct5XNmsoX0o
	Y0cHSVhAJwX30WEOO0lshPZ8xsXVjRD0fZRGdhHxX3DVdfFiIehL5+rfIQAY4cxNaAwRps
	53guQBH31H4F+J1+vPDF/UwhFysy5n0UHaveg6UXzsIamQzkfs0Z0QqIZPRxbWQld5Mev3
	7k6omsH4VccEFnKEdLPC9J1LIDlQw0AxGEp7j6OfTQ3DxOTM+UbH+I/cU+I8Bw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1po2rJ4fVgJP8Lz7zlVuql3iIT5xp2VpR+B+sueZaiQ=;
	b=H0vP+GAKFQrHzIZje+HAambScu8P4RD3X0xBakqALypG7Ph1OaLTUgdSgEHGbKo8mVzf0A
	CNqZe/l3Ol72rcBw==
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
Subject: [patch 31/37] x86/apic: Provide cpu_primary_thread mask
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:45:03 +0200 (CEST)

Make the primary thread tracking CPU mask based in preparation for simpler
handling of parallel bootup.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/apic.h     |    2 --
 arch/x86/include/asm/topology.h |   19 +++++++++++++++----
 arch/x86/kernel/apic/apic.c     |   20 +++++++++-----------
 arch/x86/kernel/smpboot.c       |   12 +++---------
 4 files changed, 27 insertions(+), 26 deletions(-)

--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -506,10 +506,8 @@ extern int default_check_phys_apicid_pre
 #endif /* CONFIG_X86_LOCAL_APIC */
 
 #ifdef CONFIG_SMP
-bool apic_id_is_primary_thread(unsigned int id);
 void apic_smt_update(void);
 #else
-static inline bool apic_id_is_primary_thread(unsigned int id) { return false; }
 static inline void apic_smt_update(void) { }
 #endif
 
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -31,9 +31,9 @@
  * CONFIG_NUMA.
  */
 #include <linux/numa.h>
+#include <linux/cpumask.h>
 
 #ifdef CONFIG_NUMA
-#include <linux/cpumask.h>
 
 #include <asm/mpspec.h>
 #include <asm/percpu.h>
@@ -139,9 +139,20 @@ static inline int topology_max_smt_threa
 int topology_update_package_map(unsigned int apicid, unsigned int cpu);
 int topology_update_die_map(unsigned int dieid, unsigned int cpu);
 int topology_phys_to_logical_pkg(unsigned int pkg);
-bool topology_is_primary_thread(unsigned int cpu);
 bool topology_smt_supported(void);
-#else
+
+extern struct cpumask __cpu_primary_thread_mask;
+#define cpu_primary_thread_mask ((const struct cpumask *)&__cpu_primary_thread_mask)
+
+/**
+ * topology_is_primary_thread - Check whether CPU is the primary SMT thread
+ * @cpu:	CPU to check
+ */
+static inline bool topology_is_primary_thread(unsigned int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
+}
+#else /* CONFIG_SMP */
 #define topology_max_packages()			(1)
 static inline int
 topology_update_package_map(unsigned int apicid, unsigned int cpu) { return 0; }
@@ -152,7 +163,7 @@ static inline int topology_max_die_per_p
 static inline int topology_max_smt_threads(void) { return 1; }
 static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
 static inline bool topology_smt_supported(void) { return false; }
-#endif
+#endif /* !CONFIG_SMP */
 
 static inline void arch_fix_phys_package_id(int num, u32 slot)
 {
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2387,20 +2387,16 @@ bool arch_match_cpu_phys_id(int cpu, u64
 }
 
 #ifdef CONFIG_SMP
-/**
- * apic_id_is_primary_thread - Check whether APIC ID belongs to a primary thread
- * @apicid: APIC ID to check
- */
-bool apic_id_is_primary_thread(unsigned int apicid)
+static void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid)
 {
-	u32 mask;
-
-	if (smp_num_siblings == 1)
-		return true;
 	/* Isolate the SMT bit(s) in the APICID and check for 0 */
-	mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
-	return !(apicid & mask);
+	u32 mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
+
+	if (smp_num_siblings == 1 || !(apicid & mask))
+		cpumask_set_cpu(cpu, &__cpu_primary_thread_mask);
 }
+#else
+static inline void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid) { }
 #endif
 
 /*
@@ -2545,6 +2541,8 @@ int generic_processor_info(int apicid, i
 	set_cpu_present(cpu, true);
 	num_processors++;
 
+	cpu_mark_primary_thread(cpu, apicid);
+
 	return cpu;
 }
 
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -102,6 +102,9 @@ EXPORT_PER_CPU_SYMBOL(cpu_die_map);
 DEFINE_PER_CPU_READ_MOSTLY(struct cpuinfo_x86, cpu_info);
 EXPORT_PER_CPU_SYMBOL(cpu_info);
 
+/* CPUs which are the primary SMT threads */
+struct cpumask __cpu_primary_thread_mask __read_mostly;
+
 /* Representing CPUs for which sibling maps can be computed */
 static cpumask_var_t cpu_sibling_setup_mask;
 
@@ -294,15 +297,6 @@ static void notrace start_secondary(void
 }
 
 /**
- * topology_is_primary_thread - Check whether CPU is the primary SMT thread
- * @cpu:	CPU to check
- */
-bool topology_is_primary_thread(unsigned int cpu)
-{
-	return apic_id_is_primary_thread(per_cpu(x86_cpu_to_apicid, cpu));
-}
-
-/**
  * topology_smt_supported - Check whether SMT is supported by the CPUs
  */
 bool topology_smt_supported(void)


